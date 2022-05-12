<?php
session_start();
require_once("../controller/dbcontroller.php");
$db_handle = new DBController();

if (isset($_POST['submit'])) {
    $firstname = htmlspecialchars($_POST['firstname']);
    $lastname = htmlspecialchars($_POST['lastname']);
    $email = htmlspecialchars($_POST['email']);
    $password = htmlspecialchars($_POST['password']);
    $passwordHash = password_hash($password, PASSWORD_DEFAULT);
    $admin = $_POST['admin'] == "admin" ? 1 : 0;
    $_SESSION["isAdmin"] = $admin;

    $db_handle->insertQuery("INSERT INTO `customer` (`firstname`, `lastname`, `email`, `passwdHash`, `admin`) VALUES
    ('$firstname', '$lastname', '$email', '$passwordHash','$admin');");
    //redirect to main page with javascript
    echo "<script>window.location.href = '../';</script>";
}

?>

<HEAD>
    <TITLE>Register | Gasbay</TITLE>
    <link href="../style/style.css" type="text/css" rel="stylesheet" />
</HEAD>

<body>
    <div id="shopping-cart">
        <div class="txt-heading">Register</div>
        <a id="btnLogin" href="../login">Login</a><br>
        <form method="post">
            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" placeholder="First Name" required><br>
            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" placeholder="Last Name" required><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Email" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Password" required><br>
            <label for="admin">Admin:</label>
            <input type="checkbox" id="admin" name="admin" value="admin"><br>
            <input type="submit" name="submit" value="Register">

        </form>
    </div>
    </div>
</body>