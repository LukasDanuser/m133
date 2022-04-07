<?php

function get()
{
    ?>
    I'm a teapot
    <?php

    header('HTTP/1.0 418 I\'m a teapot');

    return (object)[
        'title' => "418 I'm a teapot",
        'usesLayout' => true,
    ];
}