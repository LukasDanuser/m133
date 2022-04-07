<?php

function get()
{
    ?>
    <b>"<?= $_GET['q'] ?>" &ndash; 69420 Inserate aus der ganzen Schweiz</b>
    <?php
    return (object)[
        'title' => 'Suche',
        'usesLayout' => true,
    ];
}