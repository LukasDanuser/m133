<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/utils.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/config_types.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/components/totpCodeInput.php';

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

    if (!isset($totp)) {
        ?>
        <h1>2FA entfernen</h1>
        <p>2-Faktor-Authentifizierung ist nicht eingerichtet.</p>
        <?php
        return (object)[
            'title' => '2-Faktor-Authentifizierung entfernen',
            'usesLayout' => true,
        ];
    }

    $totp = TOTP::create($totp, $config['auth']['2fa']['period'], $config['auth']['2fa']['digest'], $config['auth']['2fa']['digits']);
    if (!$totp->verify($code, null, $config['auth']['2fa']['period'])) {
        return page(true);
    }

    $stmt = get_db()->prepare('UPDATE users SET totp = null WHERE id = :id');
    $stmt->bindValue(':id', $_SESSION['userId']);
    $stmt->execute();
    $stmt->closeCursor();

    get_db()->commit();

    ?>
    <h1>2FA-Setup</h1>
    <p>2-Faktor-Authentifizierung entfernt.</p>
    <?php
    return (object)[
        'title' => '2-Faktor-Authentifizierung entfernen',
        'usesLayout' => true,
    ];
}

function page($error = false)
{
    ?>
    <h1>2FA entfernen</h1>
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

    if (!isset($totp)) {
        ?>
        <p>2-Faktor-Authentifizierung ist nicht eingerichtet.</p>
        <?php
        return (object)[
            'title' => '2-Faktor-Authentifizierung entfernen',
            'usesLayout' => true,
        ];
    }

    ?>
    <p>Zur Bestätigung geben Sie bitte Ihren 2FA-Code ein:</p>
    <form action="/ich/2faremove" method="post">
        <?php TotpCodeInput::create('code', true) ?>
        <button type="submit">Absenden</button>
    </form>
    <?php

    return (object)[
        'title' => '2-Faktor-Authentifizierung aktivieren',
        'usesLayout' => true,
    ];
}