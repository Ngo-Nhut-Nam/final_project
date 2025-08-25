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
<body?>
    <!-- Header -->
    <header>
        <div class="header-container">
            <div class="logo">ThiTrựcTuyến.vn</div>
            <nav>
                <ul>
                    <li><a href="main_page.php">Trang chủ</a></li>
                    <li><a href="" onclick="showPage('exam-list')">Danh sách đề thi</a></li>
                    <li><a href="result.php">Kết quả</a></li>
                </ul>
            </nav>
            <div class="auth-buttons">
                <a class="btn btn-profie" href="profile.php">Trang cá nhân</a>
            </div>
        </div>
    </header>

    <main>
        <!-- Trang thêm đề thi mới-->
        <section id="add-exam" class="page">
            <div class="add-exam-container">
                <h2 class="exam-title">Thêm đề thi mới</h2>
                <form id="add-exam-form">
                    <div class="form-group">
                        <label for="add-exam-title">Tiêu đề đề thi</label>
                        <input type="text" id="add-exam-title" name="title" placeholder="Nhập tiêu đề đề thi" required>
                    </div>
                    <div class="form-group">
                        <label for="add-exam-subject">Môn học</label>
                        <select id="add-exam-subject" name="subject" required>
                            <option value="math">Toán học</option>
                            <option value="physics">Vật lý</option>
                            <option value="chemistry">Hóa học</option>
                            <option value="english">Tiếng Anh</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="add-exam-questions">Số câu hỏi</label>
                        <input type="number" id="add-exam-questions" name="questions" placeholder="Nhập số câu hỏi" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="add-exam-time">Thời gian làm bài (phút)</label>
                        <input type="number" id="add-exam-time" name="time" placeholder="Nhập thời gian làm bài" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="add-exam-difficulty">Độ khó</label>
                        <select id="add-exam-difficulty" name="difficulty" required>
                            <option value="easy">Dễ</option>
                            <option value="medium">Trung bình</option>
                            <option value="hard">Khó</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="add-exam-description">Mô tả</label>
                        <textarea id="add-exam-description" name="description" placeholder="Nhập mô tả đề thi" rows="3"></textarea>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Thêm đề thi</button>
                        <button type="button" class="btn btn-secondary" onclick="showPage('exam-list')">Quay lại</button>
                    </div>
                </form>
            </div>
        </section>
    </main>
</body>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
    </footer>

<script src="js/index.js"></script>

<script>
    // Thêm đề thi
    document.getElementById("add-exam-form").addEventListener("submit", function(e) {
        e.preventDefault();
        const formData = new FormData(this);
        fetch("exam_api.php?action=add", { method: "POST", body: formData })
            .then(res => res.text())
            .then(data => {
                if (data === "success") {
                    alert("Thêm đề thi thành công!");
                    loadExams();
                    showPage('exam-list');
                }
            });
    });
</script>