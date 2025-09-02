<?php
include("config/db.php");
session_start();

if (isset($_GET['token'])) {
    $token = $_GET['token'];

    // Kiểm tra token
    $sql = "SELECT * FROM users WHERE reset_token=? AND reset_expire > NOW()";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $token);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if (!$user) {
        die("Link không hợp lệ hoặc đã hết hạn!");
    }
} else {
    die("Thiếu token!");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    // Cập nhật mật khẩu
    $update = $conn->prepare("UPDATE users SET password=?, reset_token=NULL, reset_expire=NULL WHERE id=?");
    $update->bind_param("si", $password, $user['id']);
    $update->execute();

    $_SESSION['success'] = "Đổi mật khẩu thành công, hãy đăng nhập!";
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <div class="auth-container">
        <h2>Đặt lại mật khẩu</h2>
        <form method="POST">
            <div class="form-group">
                <label for="password">Mật khẩu mới</label>
                <input type="password" name="password" id="password" required>
            </div>
            <button type="submit" class="btn btn-primary" style="width:100%;">Xác nhận</button>
        </form>
    </div>
</body>
</html>

<script src="js/state.js"></script>
<script src="js/utils.js"></script>
<script src="js/navigation.js"></script>
