<?php
session_start();
require_once("../controller/dbcontroller.php");
$db_handle = new DBController();
echo '<a href="/">Home</a><br>';
if ($_SESSION["isAdmin"] == 1) {

    if (isset($_POST["submit"]) or isset($_POST["delete"])) {
        $username = htmlspecialchars($_POST["username"]);
        $query = $db_handle->runQuery("SELECT * FROM customer WHERE firstname = '$username'");
        if ($query != null || $query != "") {
            echo "User exists";
            if (isset($_POST["delete"])) {
                $query = $db_handle->deleteQuery("DELETE FROM customer WHERE firstname = '$username'");
                echo "<br>User deleted";
            }
        } else {
            echo "User does not exist";
        }
    }
    echo <<< EOL
    <body>
    <div id="shopping-cart">
        <div class="txt-heading">Admin</div>
        <form method="post">
        <p>Search if user exists</p>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Username" required><br>
            <input type="submit" name="submit" value="Search">
            <input type="submit" name="delete" value="Delete">
        </form>
    </div>
    </div>
</body>
EOL;
}
