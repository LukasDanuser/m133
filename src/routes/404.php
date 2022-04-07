<?php

function get()
{
    ?>
    <h1>404</h1>
    <?php

    return (object)[
        'title' => '404',
        'usesLayout' => true,
    ];
}