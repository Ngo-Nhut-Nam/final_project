<?php
include("config/db.php");
session_start();

// Nếu chưa đăng nhập thì quay lại login
if (!isset($_SESSION['username'])) {
    header("Location: login.php"); 
    exit();
}

$username = $_SESSION['username'];

// Lấy thông tin từ bảng users
$sql = "SELECT * FROM users WHERE username = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
?>

<?php
// Hiện thông báo nếu có
if (isset($_SESSION['success'])) {
    echo "<p style='color:green'>".$_SESSION['success']."</p>";
    unset($_SESSION['success']);
}
if (isset($_SESSION['error'])) {
    echo "<p style='color:red'>".$_SESSION['error']."</p>";
    unset($_SESSION['error']);
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
                    <li><a href="main_page.php">Trang chủ</a></li>
                    <li><a href="exam_list.php">Danh sách đề thi</a></li>
                    <li><a href="result.php">Kết quả</a></li>
                </ul>
            </nav>
            <nav class="auth-buttons">
                <button class="btn btn-profie" onclick="showPage('profile')">Trang cá nhân</button>
                <a href="log_out.php" class="btn btn-logout">Thoát</a>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <!-- Trang cá nhân-->
        <section id="profile" class="page active">
            <div class="profile-container">
                <h2>Thông tin cá nhân</h2>
            <form id="profile-form" method="post" action="update_profile.php">
                <div class="form-group">
                    <label for="profile-username">Tên đăng nhập</label>
                    <input type="text" id="profile-username" name="username" 
                        value="<?php echo htmlspecialchars($user['USERNAME']); ?>" disabled>
                </div>
                <div class="form-group">
                    <label for="profile-email">Email</label>
                    <input type="email" id="profile-email" name="email" 
                        value="<?php echo htmlspecialchars($user['EMAIL']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="profile-phone">Số điện thoại</label>
                    <input type="tel" id="profile-phone" name="phone" 
                        value="<?php echo htmlspecialchars($user['PHONE']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="profile-password">Mật khẩu mới</label>
                    <input type="password" id="profile-password" name="PASSWORD" placeholder="••••••">
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
                    <a type="button" class="btn btn-secondary" href="main_page.php">Quay lại</a>
                </div>
            </form>

        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
    </footer>

    <script src="js/state.js"></script>
    <script src="js/utils.js"></script>
    <script src="js/navigation.js"></script>
    <script src="js/profile.js"></script>
    <script src="js/forms.js"></script>
</body>
</html>
