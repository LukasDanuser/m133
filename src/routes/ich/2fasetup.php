<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/utils.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/config_types.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/components/totpCodeInput.php';

use Endroid\QrCode\QrCode;
use Endroid\QrCode\Writer\PngWriter;
use OTPHP\TOTP;

function get()
{
    return page();
}

function post()
{
    global $config;

    $code = TotpCodeInput::getValue('code');

    if (!isset($_SESSION['userId'])) {
        redirect('/ich/login');
    }

    $stmt = get_db()->prepare('SELECT totp FROM users WHERE id = :id');
    $stmt->bindValue(':id', $_SESSION['userId']);
    $stmt->bindColumn('totp', $totp);
    $stmt->execute();
    $stmt->fetch();
    $stmt->closeCursor();

    if (isset($totp)) {
        ?>
        <h1>2FA-Setup</h1>
        <p>2-Faktor-Authentifizierung ist bereits aktiviert.</p>
        <?php
        return (object)[
            'title' => '2-Faktor-Authentifizierung aktivieren',
            'usesLayout' => true,
        ];
    }

    $totp = TOTP::create($_POST['secret'], $config['auth']['2fa']['period'], $config['auth']['2fa']['digest'], $config['auth']['2fa']['digits']);
    if (!$totp->verify($code, null, $config['auth']['2fa']['period'])) {
        return page(true, $_POST['secret']);
    }

    $stmt = get_db()->prepare('UPDATE users SET totp = :totp WHERE id = :id');
    $stmt->bindValue(':totp', $_POST['secret']);
    $stmt->bindValue(':id', $_SESSION['userId']);
    $stmt->execute();
    $stmt->closeCursor();

    get_db()->commit();

    ?>
    <h1>2FA-Setup</h1>
    <p>2-Faktor-Authentifizierung aktiviert.</p>
    <?php
    return (object)[
        'title' => '2-Faktor-Authentifizierung aktivieren',
        'usesLayout' => true,
    ];
}

function page($error = false, $secret = null)
{
    global $config;

    ?>
    <h1>2FA-Setup</h1>
    <?php

    if ($error) {
        ?>
        <p>Der Code wurde nicht korrekt eingegeben.</p>
        <?php
    }

    if (!isset($_SESSION['userId'])) {
        redirect('/ich/login');
    }

    $stmt = get_db()->prepare('SELECT firstName, lastName, totp FROM users WHERE id = :id');
    $stmt->bindValue(':id', $_SESSION['userId']);
    $stmt->bindColumn('firstName', $firstName);
    $stmt->bindColumn('lastName', $lastName);
    $stmt->bindColumn('totp', $totp);
    $stmt->execute();
    $stmt->fetch();
    $stmt->closeCursor();

    if (isset($totp)) {
        ?>
        <p>2-Faktor-Authentifizierung bereits aktiviert.</p>
        <?php
        return (object)[
            'title' => '2-Faktor-Authentifizierung aktivieren',
            'usesLayout' => true,
        ];
    }

    $totp = TOTP::create($secret, $config['auth']['2fa']['period'], $config['auth']['2fa']['digest'], $config['auth']['2fa']['digits']);
    $totp->setLabel("Jeder.ch - $firstName $lastName");
    $totp->setIssuer("Jeder.ch");

    $qrCode = QrCode::create($totp->getProvisioningUri())
        ->setSize($config['auth']['2fa']['qr']['size'])
        ->setMargin($config['auth']['2fa']['qr']['margin'])
        ->setErrorCorrectionLevel($config['auth']['2fa']['qr']['error_correction']);
    try {
        $image = (new PngWriter())->write($qrCode);
    } catch (Exception $e) {
        ?>
        <p>Fehler beim Erzeugen des QR-Codes</p>
        <?php
        if ($config['mode'] == Mode::DEVELOPMENT) {
            ?>
            <p><?= $e->getMessage() ?></p>
            <?php
        }
    }

    if (isset($image)) {
        ?>
        <p class="center">
            Bitte scannen Sie den folgenden QR-Code mit einer TOTP-App (z.B. Authy)<br>
            <small>(Google Authenticator funktioniert nicht)</small>
        </p>
        <img src="<?= $image->getDataUri() ?>"/>
        <p>
            Alternativ können Sie auch den folgenden Text in die App kopieren:
        </p>
        <pre class="selectAll"><?= $totp->getSecret() ?></pre>
        <?php
    } else {
        ?>
        <p>
            Bitte kopieren Sie den folgenden Text in eine TOTP-App (z.B. Authy):<br>
            <small>(Google Authenticator funktioniert nicht)</small>
        </p>
        <pre class="selectAll"><?= $totp->getSecret() ?></pre>
        <?php
    }

    ?>
    <p>Nachdem Sie das gemacht haben, geben Sie bitte den generierten Code hier ein:</p>
    <form action="/ich/2fasetup" method="post">
        <input type="hidden" name="secret" value="<?= $totp->getSecret() ?>">
        <?php TotpCodeInput::create('code', true) ?>
        <button type="submit">Absenden</button>
    </form>
    <?php

    return (object)[
        'title' => '2-Faktor-Authentifizierung aktivieren',
        'usesLayout' => true,
    ];
}