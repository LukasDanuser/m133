<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';

use Symfony\Component\Mailer\Transport;
use Symfony\Component\Mailer\Mailer;

function get_asset($path): bool|string
{
    return file_get_contents($_SERVER['DOCUMENT_ROOT'] . $path);
}

function get_db(): PDO
{
    global $config, $db;

    if (isset($db)) {
        return $db;
    }

    $db = new PDO($config['db']['dsn'], $config['db']['user'], $config['db']['pass'], $config['db']['options']);
    return $db;
}

function get_mailer(): Mailer
{
    global $config, $mailer;

    if(isset($mailer)) {
        return $mailer;
    }

    $transport = Transport::fromDsn($config['mail']['dsn']);
    $mailer = new Mailer($transport);
    return $mailer;
}

function redirect($url): never {
    header("Location: $url");
    die;
}