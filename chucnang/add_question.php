<?php
include("config/db.php");
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("Location: main_page.php");
    exit();
}

$exam_id = $_GET['exam_id'] ?? 0;
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm câu hỏi</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/add_question.css">
    <style>
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 5px; }
        input[type=text], textarea, select { width: 100%; padding: 8px; }
        button { padding: 10px 20px; background-color: #007BFF; color: white; border: none; cursor: pointer; }
        button:hover { background-color: #0056b3; }
    </style>
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
    <h2>Thêm câu hỏi cho đề thi #<?php echo $exam_id; ?></h2>
    <form method="POST" action="question_api.php?action=add">
        <input type="hidden" name="exam_id" value="<?php echo $exam_id; ?>">

        <div class="form-group">
            <label>Loại câu hỏi:</label>
            <select name="question_type" id="question_type" required>
                <option value="multiple_choice">Trắc nghiệm</option>
                <option value="essay">Tự luận</option>
            </select>
        </div>

        <div class="form-group">
            <label>Câu hỏi:</label>
            <textarea name="question_text" required rows="4"></textarea>
        </div>

        <!-- Các ô dành cho trắc nghiệm -->
        <div id="multiple_choice_fields">
            <div class="form-group">
                <label>Đáp án A:</label>
                <input type="text" name="option_a">
            </div>
            <div class="form-group">
                <label>Đáp án B:</label>
                <input type="text" name="option_b">
            </div>
            <div class="form-group">
                <label>Đáp án C:</label>
                <input type="text" name="option_c">
            </div>
            <div class="form-group">
                <label>Đáp án D:</label>
                <input type="text" name="option_d">
            </div>
            <div class="form-group">
                <label>Đáp án đúng:</label>
                <select name="correct_answer">
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                </select>
            </div>
        </div>

        <button type="submit">Thêm câu hỏi</button>
    </form>
</main>

<script>
document.getElementById('question_type').addEventListener('change', function() {
    const mcFields = document.getElementById('multiple_choice_fields');
    mcFields.style.display = this.value === 'multiple_choice' ? 'block' : 'none';
});

// Khi load trang, kiểm tra loại câu hỏi mặc định
window.addEventListener('DOMContentLoaded', () => {
    const mcFields = document.getElementById('multiple_choice_fields');
    const qType = document.getElementById('question_type').value;
    mcFields.style.display = qType === 'multiple_choice' ? 'block' : 'none';
});
</script>
</body>
</html>
