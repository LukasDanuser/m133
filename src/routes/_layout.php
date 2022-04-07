<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/src/config_types.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/config.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/utils.php';

function layout($page)
{
    global $config;
    ?>
    <!doctype html>
    <html lang="en" class="nojs" data-url="<?= $_SERVER['SCRIPT_NAME'] ?>">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="/styles">
        <title><?= $page->title ?> - jeder.ch</title>

        <?php if ($config['mode'] === Mode::DEVELOPMENT) { ?>
            <style></style>
            <script>
                // Reload styles every 2 seconds
                setInterval(async () => {
                    const styles = await fetch('/styles');
                    document.querySelector('style').innerHTML = await styles.text();
                    document.querySelector('link[rel="stylesheet"]')?.remove();
                }, 2000)
            </script>
        <?php } ?>

        <script>
            document.documentElement.classList.remove('nojs');
        </script>
    </head>
    <body>
    <header>
        <div class="line1">
            <a href="/" class="logo"><?= get_asset('/assets/img/logo.svg') ?></a>
            <span class="grow"></span>
            <a id="createInserat" href="/inserat/neu"><?= get_asset('/assets/img/add.svg') ?> Inserat aufgeben</a>
            <span>
                <?= get_asset('/assets/img/user.svg') ?> Mein jeder.ch
                <div class="dropdown">
                    <a href="/merkliste"><?= get_asset('/assets/img/star.svg') ?> Merkliste</a>
                    <a href="/ich/inserate"><?= get_asset('/assets/img/inserate.svg') ?> Meine Inserate</a>
                    <a href="/ich"><?= get_asset('/assets/img/cog.svg') ?> Mein Profil</a>
                    <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ"><?= get_asset('/assets/img/help.svg') ?> Hilfe</a>
                </div>
            </span>
        </div>
        <form class="line2" action="/search" method="get">
            <input class="grow" type="text" placeholder="Was suchst du?" name="q">
            <button type="submit" id="searchSubmit"><?= get_asset('/assets/img/search.svg') ?> Suchen</button>
        </form>
    </header>
    <main>
        <?= $page->content ?>
    </main>
    <footer>
        <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">AGB</a>
        <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Hilfe</a>
        <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Werbung</a>
        <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Jobs</a>
        <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Kontakt</a>
        <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Medien</a>
        <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Privatsphäre-Einstellungen</a>
        <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Blog</a>
        <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Datenschutz</a>
    </footer>
    </body>
    </html>
    <?php
}