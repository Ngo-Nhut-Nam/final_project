<?php
include("config/db.php");
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$username = $_SESSION['username'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $phone = trim($_POST['phone'] ?? '');
    $password = trim($_POST['password'] ?? '');

    if (!empty($password)) {
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
        $sql = "UPDATE users SET EMAIL = ?, PHONE = ?, PASSWORD = ? WHERE USERNAME = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssss", $email, $phone, $hashedPassword, $username);
    } else {
        $sql = "UPDATE users SET EMAIL = ?, PHONE = ? WHERE USERNAME = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $email, $phone, $username);
    }

    if ($stmt->execute()) {
        if ($stmt->affected_rows > 0) {
            $_SESSION['success'] = "Cập nhật thông tin thành công!";
        } else {
            $_SESSION['error'] = "Không có thay đổi nào được cập nhật.";
        }
    } else {
        $_SESSION['error'] = "Có lỗi xảy ra, vui lòng thử lại.";
    }

    $stmt->close();
}

$conn->close();
header("Location: profile.php");
exit();
?>
