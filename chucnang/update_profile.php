<?php
include("config/db.php");
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$username = $_SESSION['username'];

// Lấy dữ liệu từ form
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = $_POST['password'];

// Kiểm tra có đổi mật khẩu không
if (!empty($password)) {
    // Hash mật khẩu mới
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    $sql = "UPDATE users SET email = ?, phone = ?, password = ? WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $email, $phone, $hashedPassword, $username);
} else {
    // Không đổi mật khẩu
    $sql = "UPDATE users SET email = ?, phone = ? WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $email, $phone, $username);
}

if ($stmt->execute()) {
    $_SESSION['success'] = "Cập nhật thông tin thành công!";
} else {
    $_SESSION['error'] = "Có lỗi xảy ra, vui lòng thử lại.";
}

$stmt->close();
$conn->close();

// Quay lại trang profile
header("Location: profile.php");
exit();
?>
