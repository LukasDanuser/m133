<?php
function get() {
    phpinfo();
    return (object)[
        'usesLayout' => false
    ];
}