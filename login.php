<?php
include("config/db.php");
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    // Lấy user theo username
    $stmt = $conn->prepare("SELECT id, username, password, email, phone FROM users WHERE username=?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();

        // Kiểm tra mật khẩu hash
        if (password_verify($password, $user['password'])) {
            // Lưu session
            $_SESSION['user_id']   = $user['id'];
            $_SESSION['username']  = $user['username'];
            $_SESSION['email']     = $user['email'];
            $_SESSION['phone']     = $user['phone'];

            header("Location: main_page.php"); // Chuyển về trang chính
            exit();
        } else {
            $error = "Sai mật khẩu!";
        }
    } else {
        $error = "Tài khoản không tồn tại!";
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ Thống Thi Trực Tuyến</title>
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
        <!-- Trang đăng nhập -->
        <section id="login" class="page active">
            <div class="auth-container">
                <h2>Đăng nhập hệ thống</h2>
                <form method="POST" action="">
                    <div class="form-group">
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
                    </div>
                    <button type="submit" class="btn btn-primary" style="width:100%;">Đăng nhập</button>
                </form>
                <?php 
                if (!empty($error)) {
                    echo "<p style='color:red; text-align:center; margin-top:1rem;'>$error</p>";
                }
                ?>
                <p style="text-align:center; margin-top:1rem;">
                    Chưa có tài khoản? <a href="register.php">Đăng ký ngay</a>
                </p>
                <p style="text-align:center; margin-top:1rem;">
                    <a href="forgot_pass.php">Quên mật khẩu?</a>
                </p>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
    </footer>
</body>
</html>

<script src="js/state.js"></script>
<script src="js/utils.js"></script>
<script src="js/navigation.js"></script>
