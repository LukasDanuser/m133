<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/utils.php';

function get()
{
    if (!isset($_SESSION['userId'])) {
        redirect('/ich/login');
    } elseif (!$_SESSION['2faDone']) {
        redirect('/ich/2fa');
    }

    $stmt = get_db()->prepare('SELECT firstName, lastName, totp FROM users WHERE id = :id');
    $stmt->bindValue(':id', $_SESSION['userId']);
    $stmt->bindColumn('firstName', $firstName);
    $stmt->bindColumn('lastName', $lastName);
    $stmt->bindColumn('totp', $totp);
    $stmt->execute();
    $stmt->fetch();

    ?>
    <p>Eingeloggt als <?= $firstName ?> <?= $lastName ?></p>

    <div class="links">
        <a href="/ich/logout">Logout</a>
        <?php
        if (!isset($totp)) {
            ?>
            <a href="/ich/2fasetup">2FA einrichten</a>
            <?php
        } else {
            ?>
            <a href="/ich/2faremove">2FA entfernen</a>
            <?php
        }
        ?>
    </div>
    <?php

    return (object)[
        'title' => 'ich',
        'usesLayout' => true,
    ];
}