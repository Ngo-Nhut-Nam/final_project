<?php
include("config/db.php");
session_start();

// Nếu chưa đăng nhập
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$username = $_SESSION['username'];

// Lấy thông tin user, alias các cột thành chữ thường
$sql = "SELECT USERNAME AS username, EMAIL AS email, PHONE AS phone FROM users WHERE USERNAME = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

// Lấy thông báo nếu có
$success = $_SESSION['success'] ?? '';
$error = $_SESSION['error'] ?? '';
unset($_SESSION['success'], $_SESSION['error']);
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang cá nhân</title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<header>
    <div class="header-container">
        <div class="logo">ThiTrựcTuyến.vn</div>
        <nav>
            <ul>
                <li><a href="main_page.php">Trang chủ</a></li>
                <li><a href="exam_list.php">Danh sách đề thi</a></li>
                <li><a href="result.php">Kết quả</a></li>
            </ul>
        </nav>
        <nav class="auth-buttons">
            <a href="log_out.php" class="btn btn-logout">Thoát</a>
        </nav>
    </div>
</header>

<main>
    <section class="page active">
        <div class="profile-container">
            <h2>Thông tin cá nhân</h2>

            <?php if($success): ?>
                <p style="color:green"><?= htmlspecialchars($success) ?></p>
            <?php endif; ?>
            <?php if($error): ?>
                <p style="color:red"><?= htmlspecialchars($error) ?></p>
            <?php endif; ?>

            <form method="POST" action="update_profile.php">
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="username" value="<?= htmlspecialchars($user['username']) ?>" disabled>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="<?= htmlspecialchars($user['email']) ?>" required>
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại</label>
                    <input type="tel" id="phone" name="phone" value="<?= htmlspecialchars($user['phone']) ?>" required>
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu mới</label>
                    <input type="password" id="password" name="password" placeholder="••••••">
                </div>
                <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
            </form>
        </div>
    </section>
</main>

<footer>
    <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
</footer>
</body>
</html>
