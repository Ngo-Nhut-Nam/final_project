<?php
include("config/db.php");
session_start();

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $email    = trim($_POST['email']);
    $phone    = trim($_POST['phone']);
    $password = trim($_POST['password']);
    $confirm  = trim($_POST['confirm']);

    // Kiểm tra xác nhận mật khẩu
    if ($password !== $confirm) {
        $error = "Mật khẩu xác nhận không khớp!";
    } else {
        // Hash mật khẩu
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Kiểm tra username hoặc email đã tồn tại
        $sql = "SELECT id FROM users WHERE username = ? OR email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $username, $email);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            $error = "Tên đăng nhập hoặc email đã tồn tại!";
        } else {
            // Thêm user mới
            $stmt->close();
            $sql = "INSERT INTO users (username, email, phone, password) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssss", $username, $email, $phone, $hashedPassword);

            if ($stmt->execute()) {
                $success = "Đăng ký thành công! Vui lòng đăng nhập.";
                // Xóa dữ liệu form sau khi đăng ký thành công
                $username = $email = $phone = '';
            } else {
                $error = "Có lỗi xảy ra, vui lòng thử lại.";
            }
        }
        $stmt->close();
    }
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

    <main>
        <section class="page active">
            <div class="auth-container">
                <h2>Đăng ký</h2>

                <!-- Thông báo lỗi/success -->
                <?php if($error): ?>
                    <p style="color:red;"><?php echo $error; ?></p>
                <?php endif; ?>
                <?php if($success): ?>
                    <p style="color:green;"><?php echo $success; ?></p>
                <?php endif; ?>

                <form method="POST" action="register.php">
                    <div class="form-group">
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" name="username" value="<?php echo isset($username)?htmlspecialchars($username):''; ?>" required>
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
                        <input type="email" name="email" value="<?php echo isset($email)?htmlspecialchars($email):''; ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="text" name="phone" id="phone" value="<?php echo isset($phone)?htmlspecialchars($phone):''; ?>" required>
                        <small id="phone-feedback" style="color:red;"></small>
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
