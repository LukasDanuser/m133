<?php
session_start();
$_SESSION["loggedIn"] = false;
unset($_SESSION["userEmail"]);
unset($_SESSION["firstname"]);
unset($_SESSION["lastname"]);
unset($_SESSION["isAdmin"]);
//redirect to main page with javascript
echo "<script>window.location.href = '../';</script>";
