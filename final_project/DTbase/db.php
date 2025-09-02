<?php
$host = "localhost";    // tên server
$user = "root";         // user mysql
$pass = "";             // mật khẩu mysql
$db   = "user_db";     // tên database của bạn

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Đặt charset utf8 để tránh lỗi tiếng Việt
$conn->set_charset("utf8");
?>
