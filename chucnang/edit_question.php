<?php
include("config/db.php");
session_start();

// Kiểm tra quyền admin
if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("Location: main_page.php");
    exit();
}

// Kiểm tra question_id
if (!isset($_GET['question_id'])) {
    echo "Không tìm thấy câu hỏi!";
    exit();
}

$question_id = intval($_GET['question_id']);

// --- Tìm câu hỏi trong bảng questions (trắc nghiệm) ---
$sql = "SELECT *, 'tracnghiem' AS type FROM questions WHERE question_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $question_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $q = $result->fetch_assoc();
    $type = 'tracnghiem';
} else {
    // --- Nếu không có, tìm trong bảng essay_questions (tự luận) ---
    $sql = "SELECT *, 'tuluan' AS type FROM essay_questions WHERE question_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $question_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $q = $result->fetch_assoc();
        $type = 'tuluan';
    } else {
        echo "Câu hỏi không tồn tại!";
        exit();
    }
}

// --- Xử lý POST ---
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $question_text = $_POST['question_text'];

    if ($type == 'tracnghiem') {
        $a = $_POST['option_a'];
        $b = $_POST['option_b'];
        $c = $_POST['option_c'];
        $d = $_POST['option_d'];
        $correct = $_POST['correct_answer'];

        $sql = "UPDATE questions SET question_text=?, option_a=?, option_b=?, option_c=?, option_d=?, correct_answer=? WHERE question_id=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssssssi", $question_text, $a, $b, $c, $d, $correct, $question_id);
    } else { // tuluan
        $answer = $_POST['answer'];
        $sql = "UPDATE essay_questions SET question_text=?, answer=? WHERE question_id=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssi", $question_text, $answer, $question_id);
    }

    $stmt->execute();

    // Redirect về edit_exam.php
    $exam_id = $q['exam_id'];
    header("Location: edit_exam.php?exam_id=" . $exam_id);
    exit();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa câu hỏi</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/edit_question.css">
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
    <form method="POST">
        <label>Nội dung câu hỏi:</label><br>
        <textarea name="question_text" required><?php echo htmlspecialchars($q['question_text']); ?></textarea><br><br>

        <?php if ($type == 'tracnghiem'): ?>
            <label>Đáp án A:</label><input type="text" name="option_a" value="<?php echo htmlspecialchars($q['option_a']); ?>" required><br>
            <label>Đáp án B:</label><input type="text" name="option_b" value="<?php echo htmlspecialchars($q['option_b']); ?>" required><br>
            <label>Đáp án C:</label><input type="text" name="option_c" value="<?php echo htmlspecialchars($q['option_c']); ?>" required><br>
            <label>Đáp án D:</label><input type="text" name="option_d" value="<?php echo htmlspecialchars($q['option_d']); ?>" required><br>
            <label>Đáp án đúng:</label>
            <select name="correct_answer" required>
                <option value="A" <?php if($q['correct_answer']=="A") echo "selected"; ?>>A</option>
                <option value="B" <?php if($q['correct_answer']=="B") echo "selected"; ?>>B</option>
                <option value="C" <?php if($q['correct_answer']=="C") echo "selected"; ?>>C</option>
                <option value="D" <?php if($q['correct_answer']=="D") echo "selected"; ?>>D</option>
            </select><br><br>
        <?php elseif ($type == 'tuluan'): ?>
            <label>Đáp án:</label><br>
            <textarea name="answer"><?php echo htmlspecialchars($q['answer']); ?></textarea><br><br>
        <?php endif; ?>

        <button type="submit">Lưu thay đổi</button>
    </form>
</main>
</body>
</html>
