<?php
include("config/db.php");
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);

    // Kiểm tra email có tồn tại không
    $sql = "SELECT * FROM users WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if ($user) {
        // Tạo token reset mật khẩu
        $token = bin2hex(random_bytes(16));
        $expire = date("Y-m-d H:i:s", strtotime("+1 hour"));

        // Lưu token vào DB
        $update = $conn->prepare("UPDATE users SET reset_token=?, reset_expire=? WHERE email=?");
        $update->bind_param("sss", $token, $expire, $email);
        $update->execute();

        // Gửi email (demo, cần cấu hình PHPMailer hoặc mail server)
        $resetLink = "http://localhost/reset_pass.php?token=" . $token;
        mail($email, "Đặt lại mật khẩu", "Click vào link để đặt lại mật khẩu: $resetLink");

        $_SESSION['success'] = "Link đặt lại mật khẩu đã gửi tới email!";
    } else {
        $_SESSION['error'] = "Email không tồn tại!";
    }
    header("Location: forgot_pass.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="css/index.css">
</head>

<body>
    <header>
        <div class="header-container">
            <div class="logo">ThiTrựcTuyến.vn</div>
            <nav>
                <ul>
                    <li><a href="main_page2.html">Trang chủ</a></li>
                    <li><a href="exam_list2.php">Danh sách đề thi</a></li>
                    <li><a href="result.php">Kết quả</a></li>
                </ul>
            </nav>
            <div class="auth-buttons">
                <a class="btn btn-secondary" href="login.php">Đăng nhập</a>
                <a class="btn btn-primary" href="register.php">Đăng ký</a>
            </div>
        </div>
    </header>

<section class="page active">
    <div class="auth-container">
        <h2>Quên mật khẩu</h2>
        <form method="POST" action="">
            <div class="form-group">
                <label for="email">Nhập email đã đăng ký</label>
                <input type="email" name="email" id="email" required placeholder="example@gmail.com">
            </div>
            <button type="submit" class="btn btn-primary" style="width:100%;">Gửi yêu cầu</button>
        </form>
        <?php 
        if (!empty($_SESSION['error'])) {
            echo "<p style='color:red; text-align:center; margin-top:1rem;'>".$_SESSION['error']."</p>";
            unset($_SESSION['error']);
        }
        if (!empty($_SESSION['success'])) {
            echo "<p style='color:green; text-align:center; margin-top:1rem;'>".$_SESSION['success']."</p>";
            unset($_SESSION['success']);
        }
        ?>
    </div>
</section>
</body>
</html>

<script src="js/state.js"></script>
<script src="js/utils.js"></script>
<script src="js/navigation.js"></script>