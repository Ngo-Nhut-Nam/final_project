<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

include("../config/db.php"); // Chỉnh đường dẫn nếu cần

if (!isset($_GET['id'])) {
    die("Không tìm thấy bài làm.");
}

$result_id = intval($_GET['id']);
$user_id = $_SESSION['user_id'];

// Lấy thông tin bài làm (tên đề, môn, điểm)
$sql_result = "SELECT r.*, e.title, e.subject, e.num_questions
               FROM results r
               JOIN exams e ON r.exam_id = e.exam_id
               WHERE r.id = ? AND r.user_id = ?
               LIMIT 1";
$stmt = $conn->prepare($sql_result);
$stmt->bind_param("ii", $result_id, $user_id);
$stmt->execute();
$result_data = $stmt->get_result()->fetch_assoc();

if (!$result_data) {
    die("Bài làm không tồn tại hoặc bạn không có quyền xem.");
}

// Lấy các câu hỏi và đáp án user
$sql_questions = "SELECT r.question_id, r.user_answer, q.question_text, q.option_a, q.option_b, q.option_c, q.option_d, q.correct_answer
                  FROM results r
                  JOIN questions q ON r.question_id = q.id
                  WHERE r.id = ? AND r.user_id = ?";
$stmt2 = $conn->prepare($sql_questions);
$stmt2->bind_param("ii", $result_id, $user_id);
$stmt2->execute();
$questions = $stmt2->get_result();
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết bài làm</title>
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/exam_list.css">
    <style>
        .question { margin-bottom: 20px; padding: 10px; border: 1px solid #ddd; border-radius: 5px; }
        .question h4 { margin-bottom: 10px; }
        .option { margin: 5px 0; padding: 5px; border-radius: 4px; }
        .correct { background-color: #d4edda; color: #155724; font-weight: bold; }
        .wrong { background-color: #f8d7da; color: #721c24; font-weight: bold; }
    </style>
</head>
<body>
<header>
    <div class="header-container">
        <div class="logo">ThiTrựcTuyến.vn</div>
        <nav>
            <ul>
                <li><a href="../main_page.php">Trang chủ</a></li>
                <li><a href="../result.php">Kết quả</a></li>
            </ul>
        </nav>
        <div class="auth-buttons">
            <a class="btn btn-profie" href="../profile.php">Trang cá nhân</a>
        </div>
    </div>
</header>

<main class="page active">
    <h2>Chi tiết bài làm: <?php echo htmlspecialchars($result_data['title']); ?></h2>
    <p>Môn: <?php echo htmlspecialchars($result_data['subject']); ?></p>
    <p>Điểm: <?php echo round(($result_data['score']/$result_data['num_questions'])*10, 2); ?> / 10</p>
    <p>Số câu đúng: <?php echo $result_data['score']; ?> / <?php echo $result_data['num_questions']; ?></p>
    <p>Thời gian làm: <?php echo date("d/m/Y H:i", strtotime($result_data['start_time'])) . " - " . date("d/m/Y H:i", strtotime($result_data['end_time']));?></p>

    <hr>

    <?php $i=1; while($q = $questions->fetch_assoc()): ?>
        <div class="question">
            <h4>Câu <?php echo $i++; ?>: <?php echo htmlspecialchars($q['question_text']); ?></h4>
            <?php
            $options = ['A'=>'option_a','B'=>'option_b','C'=>'option_c','D'=>'option_d'];
            foreach($options as $key => $col) {
                $class = '';
                if ($q['correct_answer'] == $key) $class = 'correct';
                if ($q['user_answer'] == $key && $q['user_answer'] != $q['correct_answer']) $class = 'wrong';
                echo "<div class='option $class'>$key. " . htmlspecialchars($q[$col]) . "</div>";
            }
            ?>
            <p>User chọn: <?php echo $q['user_answer'] ?: "Chưa chọn"; ?></p>
            <p>Đáp án đúng: <?php echo $q['correct_answer']; ?></p>
        </div>
    <?php endwhile; ?>

    <a href="../result.php" style="display:inline-block; margin-top:20px; padding:10px 20px; background:#2196F3; color:white; border-radius:5px; text-decoration:none;">Quay lại danh sách bài làm</a>
</main>

<footer>
    <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
</footer>
</body>
</html>
