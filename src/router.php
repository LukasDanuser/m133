<?php

/*
 * /assets/(anything) is routed to src/assets/
 * /(anything):
 *      - routed to src/routes
 *      - if it's a file after `.php` is added, the `get()` or `post()` method is called
 *      - if it's a directory, the respective method of `index.php` is called
 *      - the methods return an object with these properties:
 *          - `title`: the title of the page
 *          - `usesLayout`: whether the layout should be used
 *      - anything the method echoes is passed to the layout or echoed directly if `usesLayout` is false
 *      - if the path does not exist, the /404 route is called
 */

require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/config_types.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/routes/_layout.php';

if (str_starts_with($_SERVER['SCRIPT_NAME'], '/assets')) {
    header('Content-Type: ' . mime_content_type($_SERVER['DOCUMENT_ROOT'] . $_SERVER['SCRIPT_NAME']));
    echo file_get_contents($_SERVER['DOCUMENT_ROOT'] . $_SERVER['SCRIPT_NAME']);
    die;
}

if (file_exists($_SERVER['DOCUMENT_ROOT'] . '/src/routes/' . $_SERVER['SCRIPT_NAME'] . '.php')) {
    request($_SERVER['SCRIPT_NAME'] . '.php');
} elseif (file_exists($_SERVER['DOCUMENT_ROOT'] . '/src/routes/' . $_SERVER['SCRIPT_NAME'] . '/index.php')) {
    request($_SERVER['SCRIPT_NAME'] . '/index.php');
} else {
    header('HTTP/1.0 404 Not Found');
    request('404.php');
}

function request($uri): never
{
    global $config;

    session_start($config['session']);

    require_once $_SERVER['DOCUMENT_ROOT'] . '/src/routes/' . $uri;
    ob_start();
    $page = call_user_func(strtolower($_SERVER['REQUEST_METHOD']));
    $page->content = ob_get_clean();
    if ($page->usesLayout) {
        ob_start();
        layout($page);
        $output = ob_get_clean();

        if ($config['mode'] === Mode::PRODUCTION) {
            // minify
            // this breaks some things like // comments in JS, but it's good enough for now
            $output = preg_replace(
                array(
                    '/\s{2,}/',
                    '/\n/',
                ),
                array(
                    ' ',
                    '',
                ),
                $output
            );
        }

        echo $output;
    } else {
        echo $page->content;
    }

    die;
}