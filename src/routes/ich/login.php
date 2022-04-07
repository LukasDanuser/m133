<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/utils.php';

function get()
{
    return page();
}

function post()
{
    global $config;

    $stmt = get_db()->prepare('SELECT id, password, totp FROM users WHERE email = :email');
    $stmt->bindValue(':email', $_POST['email']);
    $stmt->bindColumn('id', $id);
    $stmt->bindColumn('password', $hash);
    $stmt->bindColumn('totp', $totp);
    $stmt->execute();
    $stmt->fetch();

    if ($id === null || !password_verify($_POST['password'], $hash)) {
        return page(true);
    }

    if (password_needs_rehash($hash, $config['auth']['hash_algo'], $config['auth']['hash_options'])) {
        $newHash = password_hash($_POST['password'], $config['auth']['hash_algo'], $config['auth']['hash_options']);
        $stmt = get_db()->prepare('UPDATE users SET password = :password WHERE id = :id');
        $stmt->bindValue(':password', $newHash);
        $stmt->bindValue(':id', $id);
        $stmt->execute();
    }

    $_SESSION['userId'] = $id;
    if (isset($totp)) {
        $_SESSION['2faDone'] = false;
        redirect('/ich/2fa');
    } else {
        $_SESSION['2faDone'] = true;
        redirect('/ich');
    }
}

function page($error = false)
{
    ?>
    <h1>Login</h1>
    <?php if ($error) echo "Die Logindaten sind falsch." ?>
    <form action="/ich/login" method="post">
        <input type="email" name="email" placeholder="E-Mail" required autofocus>
        <input type="password" name="password" placeholder="Passwort" required>
        <button type="submit">Anmelden</button>
    </form>
    <div class="links">
        <a href="/ich/register">Kein Konto?</a>
        <a href="/ich/forgot">Passwort vergessen?</a>
    </div>
    <?php

    return (object)[
        'title' => 'Login',
        'usesLayout' => true,
    ];
}