<?php
include("config/db.php");
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $email    = trim($_POST['email']);
    $phone    = trim($_POST['phone']);
    $password = trim($_POST['password']);
    $confirm  = trim($_POST['confirm']); // sửa lại khớp với name="confirm"

    // Kiểm tra xác nhận mật khẩu
    if ($password !== $confirm) {
        $_SESSION['error'] = "Mật khẩu xác nhận không khớp!";
        header("Location: register.php");
        exit();
    }

    // Hash mật khẩu trước khi lưu DB
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Kiểm tra username đã tồn tại chưa
    $sql = "SELECT id FROM users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $_SESSION['error'] = "Tên đăng nhập đã tồn tại!";
        $stmt->close();
        header("Location: register.php");
        exit();
    }
    $stmt->close();

    // Thêm user mới
    $sql = "INSERT INTO users (username, email, phone, password) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $username, $email, $phone, $hashedPassword);

    if ($stmt->execute()) {
        $_SESSION['success'] = "Đăng ký thành công! Vui lòng đăng nhập.";
        header("Location: login.php");
        exit();
    } else {
        $_SESSION['error'] = "Có lỗi xảy ra, vui lòng thử lại.";
    }

    $stmt->close();
    $conn->close();
}
?>


<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký - Hệ Thống Thi Trực Tuyến</title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <!-- Header -->
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

    <!-- Main Content -->
    <main>
        <section class="page active">
            <div class="auth-container">
                <h2>Đăng ký</h2>
                <?php if (!empty($error)) echo "<p style='color:red'>$error</p>"; ?>
                <form method="POST" action="register.php">
                    <div class="form-group">
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input type="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="confirm">Nhập lại mật khẩu</label>
                        <input type="password" name="confirm" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="text" name="phone">
                    </div>
                    <button class="btn btn-primary" type="submit" style="width:100%;">Đăng ký</button>
                    <p style="text-align:center; margin-top:1rem;">
                        Đã có tài khoản? <a href="login.php">Đăng nhập</a>
                    </p>
                </form>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
    </footer>
</body>
</html>

<script src="js/state.js"></script>
<script src="js/utils.js"></script>
<script src="js/navigation.js"></script>