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
            <div class="auth-buttons">
                <a class="btn btn-profie" href="profile.php">Trang cá nhân</a>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <!-- Trang danh sách đề thi -->
        <section id="exam-list" class="page">
            <div class="exams-header">
                <h2>Danh sách đề thi</h2>
                <div class="exams-controls">
                    <select class="exams-list" id="subject-filter">
                        <option value="all">Tất cả môn</option>
                        <option value="math">Toán học</option>
                        <option value="physics">Vật lý</option>
                        <option value="chemistry">Hóa học</option>
                        <option value="english">Tiếng Anh</option>
                    </select>
                    <button class="btn btn-primary" onclick="showPage('add-exam')">
                        <i class="fas fa-plus"></i> Thêm đề thi mới
                    </button>
                </div>
            </div>
            
            <div class="exams-grid">
                <!-- Danh sách đề thi sẽ được load bằng JS -->
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
    </footer>

    <script src="js/inex.js"></script>
</body>
</html>
