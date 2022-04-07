<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/config_types.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/utils.php';

use Ramsey\Uuid\Uuid;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mime\Email;

function get()
{
    ?>
    <h1>Registrieren</h1>
    <form action="/ich/register" method="post">
        <input type="text" name="firstName" placeholder="Vorname" autofocus>
        <input type="text" name="lastName" placeholder="Nachname">
        <input type="email" name="email" placeholder="E-Mail">
        <input type="password" name="password" placeholder="Passwort">
        <button type="submit">Registrieren</button>
    </form>
    <div class="links">
        <a href="/ich/login">Schon registriert?</a>
    </div>
    <?php
    return (object)[
        'title' => 'Registrieren',
        'usesLayout' => true,
    ];
}

function post()
{
    global $config;

    get_db()->beginTransaction();

    $hash = password_hash($_POST['password'], $config['auth']['hash_algo'], $config['auth']['hash_options']);
    $verification_token = Uuid::uuid6();

    $stmt = get_db()->prepare('INSERT INTO users (firstName, lastName, email, password, verificationToken) VALUES (:firstName, :lastName, :email, :password, :verificationToken)');
    $stmt->bindValue(':firstName', $_POST['firstName']);
    $stmt->bindValue(':lastName', $_POST['lastName']);
    $stmt->bindValue(':email', $_POST['email']);
    $stmt->bindValue(':password', $hash);
    $stmt->bindValue(':verificationToken', $verification_token);
    $stmt->execute();

    $verification_link = "{$config['base_url']}/ich/verify?token={$verification_token->toString()}";

    $email = (new Email())
        ->from($config['mail']['from'])
        ->to($_POST['email'])
        ->subject('Registrierung')
        ->text(<<<EOF
            Hallo {$_POST['firstName']} {$_POST['lastName']},
            
            Du hast dich erfolgreich registriert. Bitte bestätige deine E-Mail-Adresse, indem du auf den folgenden Link klickst:
            {$verification_link}
        EOF
        )
        ->html(<<<EOF
            <p>Hallo {$_POST['firstName']} {$_POST['lastName']},</p>
            <p>Du hast dich erfolgreich registriert. Bitte bestätige deine E-Mail-Adresse, indem du auf den folgenden Link klickst:</p>
            <a href="$verification_link">$verification_link</a>
        EOF
        );

    try {
        get_mailer()->send($email);
    } catch (TransportExceptionInterface $e) {
        if($config['mode'] === Mode::DEVELOPMENT) {
            echo $e->getMessage();
        } else {
            echo 'Ein Fehler ist aufgetreten. Bitte versuche es später erneut.';
        }

        get_db()->rollBack();

        die;
    }

    get_db()->commit();

    header('Location: /ich/login');
}