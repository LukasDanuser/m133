<?php

function get()
{
    ?>
    Hello World
    <?php

    return (object)[
        'title' => 'Hello World',
        'usesLayout' => true
    ];
}