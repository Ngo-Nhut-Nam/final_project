<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ Thống Thi Trực Tuyến</title>

</head>
    <link rel="stylesheet" href="css/index.css">
<body>
    <!-- Header -->
    <header>
        <div class="header-container">
            <div class="logo">ThiTrựcTuyến.vn</div>
            <nav>
                <ul>
                    <li><a href="" onclick="showPage('home')">Trang chủ</a></li>
                    <li><a href="exam_list.php">Danh sách đề thi</a></li>
                    <li><a href="result.php">Kết quả</a></li>
                </ul>
            </nav>
            <div class="auth-buttons">
                <a class="btn btn-profie" href="profile.php">Trang cá nhân</a>
            </div>
        </div>
    </header>

    <!-- Main Content - Các trang sẽ hiển thị ở đây -->
    <main>
        <!-- Trang chủ -->
        <section id="home" class="page active">
            <div class="hero">
                <h1>HỆ THỐNG THI TRỰC TUYẾN</h1>
                <p>Nền tảng ôn luyện và thi cử trực tuyến dành cho học sinh, sinh viên</p>
                <a class="btn btn-primary" href="exam_list.php">Bắt đầu ngay</a>
            </div>
            
            <div class="features">
                <div class="feature-card">
                    <h3>Đa dạng đề thi</h3>
                    <p>Hàng trăm đề thi chất lượng từ các môn học khác nhau</p>
                </div>
                <div class="feature-card">
                    <h3>Thi ngay - Biết điểm liền</h3>
                    <p>Kết quả thi được chấm tự động và hiển thị ngay sau khi nộp bài</p>
                </div>
                <div class="feature-card">
                    <h3>Học tập hiệu quả</h3>
                    <p>Hệ thống báo cáo chi tiết giúp bạn cải thiện điểm yếu</p>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
    </footer>

    <script src="js/state.js"></script>
    <script src="js/utils.js"></script>
    <script src="js/navigation.js"></script>
</body>
</html>