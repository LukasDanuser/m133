<?php
session_start();
require_once("../controller/dbcontroller.php");
$db_handle = new DBController();
?>

<HEAD>
    <TITLE>Checkout | Gasbay</TITLE>
    <link href="../style/style.css" type="text/css" rel="stylesheet" />
</HEAD>

<body>
    <div id="shopping-cart">
        <div class="txt-heading">Checkout</div>
        <a id="btnHome" href="../?action=empty">Home</a><br>
        <p>Thank you for your purchase!</p>
    </div>
    </div>
</body>