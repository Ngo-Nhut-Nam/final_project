<?php
include("config/db.php");
session_start();


if (!isset($_GET['question_id'])) {
    echo "Không tìm thấy câu hỏi!";
    exit();
}

if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("Location: main_page.php");
    exit();
}

$question_id = intval($_GET['question_id']);

// Lấy dữ liệu câu hỏi
$sql = "SELECT * FROM questions WHERE question_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $question_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows == 0) {
    echo "Câu hỏi không tồn tại!";
    exit();
}

$q = $result->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $question_text = $_POST['question_text'];
    $a = $_POST['option_a'];
    $b = $_POST['option_b'];
    $c = $_POST['option_c'];
    $d = $_POST['option_d'];
    $correct = $_POST['correct_answer'];

    $sql = "UPDATE questions SET question_text=?, option_a=?, option_b=?, option_c=?, option_d=?, correct_answer=? WHERE question_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssi", $question_text, $a, $b, $c, $d, $correct, $question_id);
    $stmt->execute();

    header("Location: edit_exam.php?exam_id=" . $q['exam_id']);
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
    <link rel="stylesheet" href="css/edit_question.css">
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
    <main>
        <form method="POST">
            <label>Nội dung câu hỏi:</label><br>
            <textarea name="question_text" required><?php echo htmlspecialchars($q['question_text']); ?></textarea><br><br>
            <label>Đáp án A:</label><input type="text" name="option_a" value="<?php echo $q['option_a']; ?>" required><br>
            <label>Đáp án B:</label><input type="text" name="option_b" value="<?php echo $q['option_b']; ?>" required><br>
            <label>Đáp án C:</label><input type="text" name="option_c" value="<?php echo $q['option_c']; ?>" required><br>
            <label>Đáp án D:</label><input type="text" name="option_d" value="<?php echo $q['option_d']; ?>" required><br>
            <label>Đáp án đúng:</label>
            <select name="correct_answer" required>
                <option value="A" <?php if($q['correct_answer']=="A") echo "selected"; ?>>A</option>
                <option value="B" <?php if($q['correct_answer']=="B") echo "selected"; ?>>B</option>
                <option value="C" <?php if($q['correct_answer']=="C") echo "selected"; ?>>C</option>
                <option value="D" <?php if($q['correct_answer']=="D") echo "selected"; ?>>D</option>
            </select><br><br>
            <button type="submit">Lưu thay đổi</button>
        </form>
    </main>
</body>