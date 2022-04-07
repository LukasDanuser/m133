<?php

use Ramsey\Uuid\Uuid;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mime\Email;

require_once $_SERVER['DOCUMENT_ROOT'] . '/src/config_types.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/utils.php';

function get()
{
    if (!isset($_GET['token'])) {
        ?>
        <h1>Password vergessen</h1>
        <form action="/ich/forgot" method="post">
            <input type="email" name="email" placeholder="E-Mail">
            <button type="submit" class="btn btn-primary">Reset-Link senden</button>
        </form>
        <div class="links">
            <a href="/ich/login">Zurück zum Login</a>
        </div>
        <?php
    } else {
        $stmt = get_db()->prepare('SELECT id, email FROM users WHERE resetToken = :token');
        $stmt->bindValue(':token', $_GET['token']);
        $stmt->bindColumn('id', $id);
        $stmt->bindColumn('email', $email);
        $stmt->execute();
        $stmt->fetch();

        if ($id != null) {
            ?>
            <form action="/ich/forgot" method="post">
                <input type="hidden" name="token" value="<?php echo $_GET['token']; ?>">
                <input type="password" name="password" placeholder="Passwort">
                <input type="password" name="password_repeat" placeholder="Passwort wiederholen">
                <button type="submit" class="btn btn-primary">Passwort ändern</button>
            </form>
        <?php } else { ?>
            <p>Der Link ist ungültig.</p>
        <?php }
    }

    return (object)[
        'title' => 'Passwort vergessen',
        'usesLayout' => true,
    ];
}

function post()
{
    global $config;
    get_db()->beginTransaction();

    if (!isset($_POST['token'])) {
        $reset_token = Uuid::uuid6();

        $stmt = get_db()->prepare('SELECT id, firstName, lastName FROM users WHERE email = :email');
        $stmt->bindValue(':email', $_POST['email']);
        $stmt->bindColumn('id', $id);
        $stmt->bindColumn('firstName', $firstName);
        $stmt->bindColumn('lastName', $lastName);
        $stmt->execute();
        $stmt->fetch();

        if ($id == null) {
            get_db()->rollBack();
            ?>
            <p>Dieses Konto existiert nicht.</p>
            <a href="/ich/forgot">Zurück</a>
            <?php
            return (object)[
                'title' => 'Passwort vergessen',
                'usesLayout' => true,
            ];
        }

        $stmt = get_db()->prepare('UPDATE users SET resetToken = :reset_token, resetTokenExpire = :reset_token_expire WHERE email = :email');
        $stmt->bindValue(':reset_token', $reset_token->toString());
        $stmt->bindValue(':reset_token_expire', date('Y-m-d H:i:s', time() + $config['auth']['password_reset_expire']));
        $stmt->bindValue(':email', $_POST['email']);
        $stmt->execute();

        $reset_link = "{$config['base_url']}/ich/forgot?token={$reset_token->toString()}";

        $email = (new Email())
            ->from($config['mail']['from'])
            ->to($_POST['email'])
            ->subject('Passwort zurücksetzen')
            ->text(<<<EOF
                Hallo {$firstName} {$lastName},
                
                Wir haben eine Anfrage zum Zurücksetzen deines Passwortes erhalten. Bitte klicke auf den folgenden Link, um dein Passwort zurückzusetzen:
                {$reset_link}
                
                Wenn du keine Anfrage zum Zurücksetzen deines Passwortes gesendet hast, kanst du diese E-Mail ignorieren.
            EOF
            )
            ->html(<<<EOF
                <p>Hallo $firstName $lastName,</p>
                
                <p>Wir haben eine Anfrage zum Zurücksetzen deines Passwortes erhalten. Bitte klicke auf den folgenden Link, um dein Passwort zurückzusetzen:</p>
                <a href="$reset_link">$reset_link</a>
                
                <p>Wenn du keine Anfrage zum Zurücksetzen deines Passwortes gesendet hast, kanst du diese E-Mail ignorieren.</p>
            EOF
            );

        try {
            get_mailer()->send($email);
        } catch (TransportExceptionInterface $e) {
            if ($config['mode'] === Mode::DEVELOPMENT) {
                echo $e->getMessage();
            } else {
                echo 'Ein Fehler ist aufgetreten. Bitte versuche es später erneut.';
            }

            get_db()->rollBack();

            die;
        }

        ?>
        Wir haben eine E-Mail an <?php echo $_POST['email']; ?> gesendet. Bitte klicke auf den Link in der E-Mail, um dein Passwort zurückzusetzen.
        <?php
        get_db()->commit();
    } else {
        $stmt = get_db()->prepare('SELECT id, resetToken, resetTokenExpire FROM users WHERE resetToken = :token');
        $stmt->bindValue(':token', $_POST['token']);
        $stmt->bindColumn('id', $id);
        $stmt->bindColumn('resetToken', $resetToken);
        $stmt->bindColumn('resetTokenExpire', $resetTokenExpire);
        $stmt->execute();
        $stmt->fetch();

        if ($id == null || $resetToken == null || $resetTokenExpire == null || $resetTokenExpire < date('Y-m-d H:i:s')) {
            get_db()->rollBack();
            ?>
            <p>Der Link ist ungültig.</p>
            <a href="/ich/forgot">Zurück</a>
            <?php
            return (object)[
                'title' => 'Passwort vergessen',
                'usesLayout' => true,
            ];
        }

        if ($_POST['password'] != $_POST['password_repeat']) {
            get_db()->rollBack();
            ?>
            <p>Die Passwörter stimmen nicht überein.</p>
            <a href="/ich/forgot?token=<?= $_POST['token'] ?>">Zurück</a>
            <?php
            return (object)[
                'title' => 'Passwort vergessen',
                'usesLayout' => true,
            ];
        }

        $stmt = get_db()->prepare('UPDATE users SET password = :password, resetToken = NULL, resetTokenExpire = NULL WHERE id = :id');
        $stmt->bindValue(':password', password_hash($_POST['password'], PASSWORD_DEFAULT));
        $stmt->bindValue(':id', $id);
        $stmt->execute();

        get_db()->commit();

        ?>
        <p>Dein Passwort wurde erfolgreich geändert.</p>
        <a href="/ich/login">Zum Login</a>
        <?php
    }

    return (object)[
        'title' => 'Passwort vergessen',
        'usesLayout' => true,
    ];
}