<?php
session_start();
require_once("../controller/dbcontroller.php");
$db_handle = new DBController();
if (isset($_SESSION["loggedIn"]) && $_SESSION["loggedIn"] == true) {
    //redirect to logout with javascriot
    echo "<script>window.location.href = '../logout/';</script>";
}
if (isset($_POST["submit"])) {
    $email = htmlspecialchars($_POST["email"]);
    $password = htmlspecialchars($_POST["password"]);

    $query = $db_handle->runQuery("SELECT * FROM customer WHERE email = '$email'");
    if ($query != null || $query != "") {
        if (password_verify($password, $query[0]['passwdHash'])) {
            $_SESSION["loggedIn"] = true;
            $_SESSION["userEmail"] = $email;
            $_SESSION["firstname"] = $query[0]['firstname'];
            $_SESSION["lastname"] = $query[0]['lastname'];
            $_SESSION["isAdmin"] = $query[0]['admin'];
            //redirect to main page with javascript
            echo "<script>window.location.href = '../';</script>";
        } else {
            $_SESSION["loggedIn"] = false;
            echo <<< EOL

                <body>
            <div id="shopping-cart">
                <div class="txt-heading">Login</div>
                <a id="btnLogin" href="../register">Register</a><br>
                <p>Incorrect password</p>
            </div>
            </div>
        </body>

        EOL;
        }
    } else {
        echo <<< EOL

                <body>
            <div id="shopping-cart">
                <div class="txt-heading">Login</div>
                <a id="btnLogin" href="../register">Register</a><br>
                <p>Incorrect email</p>
            </div>
            </div>
        </body>

        EOL;
    }
}
$product_array = $db_handle->runQuery("SELECT * FROM tblproduct ORDER BY id ASC");

?>

<HEAD>
    <TITLE>Login | Gasbay</TITLE>
    <link href="../style/style.css" type="text/css" rel="stylesheet" />
</HEAD>

<body>
    <div id="shopping-cart">
        <div class="txt-heading">Login</div>
        <a id="btnLogin" href="../register">Register</a><br>
        <form method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Email" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Password" required><br>
            <input type="submit" name="submit" value="Login">

        </form>
    </div>
    </div>
</body>