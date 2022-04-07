<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';

function get()
{
    global $config;

    $db = new PDO($config['db']['dsn'], $config['db']['user'], $config['db']['pass'], $config['db']['options']);
    $stmt = $db->prepare('SELECT nr, titel, inhalt FROM artikel WHERE nr = :nr');
    $stmt->bindValue(':nr', $_GET['nr']);
    $stmt->bindColumn('nr', $nr);
    $stmt->bindColumn('titel', $titel);
    $stmt->bindColumn('inhalt', $inhalt);
    $stmt->execute();
    $stmt->fetch();
    echo "nr: $nr<br>titel: $titel<br>inhalt: $inhalt";

    echo '<iframe style="width:100%;height:800px;" srcdoc="';
    ob_start();
    phpinfo();
    echo htmlspecialchars(ob_get_clean());
    echo '"></iframe>';

    echo '<iframe style="width:100%;height:800px;" srcdoc="';
    ob_start();
    xdebug_info();
    echo htmlspecialchars(ob_get_clean());
    echo '"></iframe>';

    return (object)[
        'title' => 'Test',
        'usesLayout' => true,
    ];
}