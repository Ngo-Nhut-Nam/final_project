<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("Location: main_page.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm đề thi mới</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/add_exam.css">
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
            <div class="auth-buttons">
                <a class="btn btn-profie" href="profile.php">Trang cá nhân</a>
            </div>
        </div>
    </header>

    <main>
        <section id="add-exam">
            <div class="add-exam-container">
                <h2 class="exam-title">Thêm đề thi mới</h2>
                <form id="add-exam-form">
                    <div class="form-group">
                        <label for="add-exam-title">Tiêu đề đề thi</label>
                        <input type="text" id="add-exam-title" name="title" required>
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
                        <input type="number" id="add-exam-questions" name="questions" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="add-exam-time">Thời gian làm bài (phút)</label>
                        <input type="number" id="add-exam-time" name="time" min="1" required>
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
                        <textarea id="add-exam-description" name="description" rows="3"></textarea>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Thêm đề thi</button>
                        <a href="exam_list.php" class="btn btn-secondary">Quay lại</a>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
    </footer>

<script>
    document.getElementById("add-exam-form").addEventListener("submit", function(e) {
        e.preventDefault();
        const formData = new FormData(this);

        fetch("exam_api.php?action=add", { method: "POST", body: formData })
        .then(res => res.text())
        .then(data => {
            if (!isNaN(data)) { // nếu trả về số => id
                alert("Thêm đề thi thành công!");
                window.location.href = "add_question.php?exam_id=" + data;
            } else {
                alert("Lỗi: " + data);
            }
        });
    });
</script>

</body>
</html>
