<?php
$db_server = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "user_db";

$conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

if (!$conn) {
    die("Kết nối thất bại: " . mysqli_connect_error());
} else {
    echo "You are connected!";
}
?>