<?php
include("config/db.php");
session_start();

// Chỉ admin mới có quyền sửa
if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("Location: main_page.php");
    exit();
}

if (!isset($_GET['subject'])) {
    echo "Không tìm thấy môn học!";
    exit();
}

$subject = $_GET['subject'];

// Lấy câu hỏi theo môn
$sql_questions = "SELECT * FROM questions WHERE subject = ?";
$stmt_q = $conn->prepare($sql_questions);
$stmt_q->bind_param("s", $subject);
$stmt_q->execute();
$questions = $stmt_q->get_result();
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa đề thi <?php echo htmlspecialchars($subject); ?></title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <h2>Sửa đề thi: <?php echo htmlspecialchars($subject); ?></h2>
    
    <form method="POST" action="update_exam.php">
        <input type="hidden" name="subject" value="<?php echo htmlspecialchars($subject); ?>">

        <?php while ($q = $questions->fetch_assoc()): ?>
            <div class="question-box">
                <input type="hidden" name="id[]" value="<?php echo $q['id']; ?>">
                
                <label>Nội dung:</label><br>
                <textarea name="question[]"><?php echo htmlspecialchars($q['question']); ?></textarea><br>

                <label>Đáp án A:</label>
                <input type="text" name="option_a[]" value="<?php echo htmlspecialchars($q['option_a']); ?>"><br>

                <label>Đáp án B:</label>
                <input type="text" name="option_b[]" value="<?php echo htmlspecialchars($q['option_b']); ?>"><br>

                <label>Đáp án C:</label>
                <input type="text" name="option_c[]" value="<?php echo htmlspecialchars($q['option_c']); ?>"><br>

                <label>Đáp án D:</label>
                <input type="text" name="option_d[]" value="<?php echo htmlspecialchars($q['option_d']); ?>"><br>

                <label>Đáp án đúng:</label>
                <select name="correct_option[]">
                    <option value="A" <?php if($q['correct_option']=="A") echo "selected"; ?>>A</option>
                    <option value="B" <?php if($q['correct_option']=="B") echo "selected"; ?>>B</option>
                    <option value="C" <?php if($q['correct_option']=="C") echo "selected"; ?>>C</option>
                    <option value="D" <?php if($q['correct_option']=="D") echo "selected"; ?>>D</option>
                </select>
            </div>
            <hr>
        <?php endwhile; ?>

        <button type="submit">Lưu thay đổi</button>
    </form>
</body>
</html>

     <!-- Footer -->
    <footer>
        <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
    </footer>