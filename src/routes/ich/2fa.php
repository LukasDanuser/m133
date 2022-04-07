<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
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

    $stmt = get_db()->prepare('SELECT totp FROM users WHERE id = :id');
    $stmt->bindValue(':id', $_SESSION['userId']);
    $stmt->bindColumn('totp', $totp);
    $stmt->execute();
    $stmt->fetch();

    $totp = TOTP::create($totp, $config['auth']['2fa']['period'], $config['auth']['2fa']['digest'], $config['auth']['2fa']['digits']);
    //var_dump($totp->verify($code, null, 1));
    if ($totp->verify($code, null, $config['auth']['2fa']['window'])) {
        $_SESSION['2faDone'] = true;
        return redirect('/ich');
    } else {
        return page(true);
    }
}

function page($error = false)
{
    global $config;

    if ($_SESSION['2faDone']) {
        redirect('/ich');
    }

    ?>
    <h1>2FA</h1>

    <?php
    if ($error) {
        ?>
        <p>Der eingegebene Code ist falsch.</p>
        <?php
    }
    ?>

    <form action="/ich/2fa" method="post">
        <?php TotpCodeInput::create('code', true) ?>
        <button type="submit">Anmelden</button>
    </form>

    <div class="links"><a href="/ich/logout">Abmelden</a></div>
    <?php

    return (object)[
        'title' => '2FA',
        'usesLayout' => true,
    ];
}