<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/utils.php';

function get()
{
    global $config;

    get_db()->beginTransaction();

    $stmt = get_db()->prepare('SELECT id FROM users WHERE verificationToken = :token');
    $stmt->bindValue(':token', $_GET['token']);
    $stmt->bindColumn('id', $userId);
    $stmt->execute();
    $stmt->fetch();

    if ($userId != null) {
        $stmt = get_db()->prepare('UPDATE users SET verificationToken = NULL, emailVerified = 1 WHERE id = :id');
        $stmt->bindValue(':id', $userId);
        $stmt->execute();

        $_SESSION['userId'] = $userId;
        $_SESSION['2faDone'] = true;

        get_db()->commit();
        header('Location: /ich');
    } else {
        get_db()->rollBack();
        ?>
        <h1>Verifizierung fehlgeschlagen</h1>
        <p>Der Link ist nicht mehr gültig.</p>
        <?php
        return (object)[
            'title' => 'Verifizierung fehlgeschlagen',
            'usesLayout' => true
        ];
    }
}