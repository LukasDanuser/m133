<?php
session_start();
require_once("controller/dbcontroller.php");
$db_handle = new DBController();
if (isset($_POST["Login"])) {
    $email = htmlspecialchars($_POST["email"]);
    $password = htmlspecialchars($_POST["password"]);

    $query = $db_handle->runQuery("SELECT * FROM customer WHERE email = '$email'");
    if ($query != null || $query != "") {
        if (password_verify($password, $query[0]['password'])) {
            $_SESSION["loggedIn"] = true;
        } else {
            $_SESSION["loggedIn"] = false;
            echo <<< EOL

                <body>
            <div id="shopping-cart">
                <div class="txt-heading">Login</div>
                <a id="btnLogin" href="register.php">Register</a><br>
                <p>Incorrect email or password</p>
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
                <a id="btnLogin" href="register.php">Register</a><br>
                <p>Incorrect email or password</p>
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
    <link href="style/style.css" type="text/css" rel="stylesheet" />
</HEAD>

<body>
    <div id="shopping-cart">
        <div class="txt-heading">Login</div>
        <a id="btnLogin" href="register.php">Register</a><br>
        <form method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Email" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Login">

        </form>
    </div>
    </div>
</body>