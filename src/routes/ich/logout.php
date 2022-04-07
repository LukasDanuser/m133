<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/src/utils.php';

function get() {
    session_destroy();

    redirect('/ich/login');
}