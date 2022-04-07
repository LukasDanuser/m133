<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/src/config_types.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';

use ScssPhp\ScssPhp\Compiler;
use ScssPhp\ScssPhp\Exception\SassException;
use ScssPhp\ScssPhp\OutputStyle;

function get()
{
    global $config;

    header('Content-Type: text/css');

    $compiler = new Compiler();
    $compiler->setImportPaths([$_SERVER['DOCUMENT_ROOT'] . '/assets/scss']);
    if ($config['mode'] === Mode::PRODUCTION) {
        $compiler->setOutputStyle(OutputStyle::COMPRESSED);
    } else {
        $compiler->setOutputStyle(OutputStyle::EXPANDED);
    }

    try {
        echo $compiler->compileString(file_get_contents($_SERVER['DOCUMENT_ROOT'] . '/assets/scss/styles.scss'))->getCss();
    } catch (SassException $e) {
        echo 'Error compiling SCSS: ' . $e->getMessage();
    }

    return (object)[
        'usesLayout' => false,
    ];
}