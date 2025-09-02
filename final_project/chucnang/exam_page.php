<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

include("config/db.php");

if (!isset($_GET['exam_id'])) {
    die("Không tìm thấy đề thi");
}

if (!isset($_SESSION['exam_start_time'])) {
    $_SESSION['exam_start_time'] = date("Y-m-d H:i:s");
}

$exam_id = intval($_GET['exam_id']);

// Lấy thông tin đề thi
$sql_exam = "SELECT * FROM exams WHERE exam_id = ?";
$stmt_exam = $conn->prepare($sql_exam);
$stmt_exam->bind_param("i", $exam_id);
$stmt_exam->execute();
$exam = $stmt_exam->get_result()->fetch_assoc();
if (!$exam) die("Đề thi không tồn tại");

// Lấy câu hỏi trắc nghiệm từ bảng questions
$sql_mc = "SELECT question_id AS id, question_text, option_a, option_b, option_c, option_d, correct_answer, 'MC' AS type
           FROM questions WHERE exam_id = ?";
$stmt_mc = $conn->prepare($sql_mc);
$stmt_mc->bind_param("i", $exam_id);
$stmt_mc->execute();
$mc_questions = $stmt_mc->get_result()->fetch_all(MYSQLI_ASSOC);

// Lấy câu hỏi tự luận từ bảng essay_questions
$sql_essay = "SELECT question_id AS id, question_text, '' AS option_a, '' AS option_b, '' AS option_c, '' AS option_d, '' AS correct_answer, 'Essay' AS type
              FROM essay_questions WHERE exam_id = ?";
$stmt_essay = $conn->prepare($sql_essay);
$stmt_essay->bind_param("i", $exam_id);
$stmt_essay->execute();
$essay_questions = $stmt_essay->get_result()->fetch_all(MYSQLI_ASSOC);

// Gộp câu hỏi
$questions = array_merge($mc_questions, $essay_questions);

// Bắt đầu thời gian làm bài
if (!isset($_SESSION['exam_start_time'])) {
    $_SESSION['exam_start_time'] = date("Y-m-d H:i:s");
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($exam['title']); ?></title>
    <link rel="stylesheet" href="css/exam_page.css">
    <link rel="stylesheet" href="css/index.css">

<style>
    .btn-submit { background: linear-gradient(90deg,#4CAF50,#45A049); color:#fff; padding:12px 30px; border:none; border-radius:8px; font-size:16px; font-weight:bold; cursor:pointer; box-shadow:0 4px 6px rgba(0,0,0,0.2); transition:all 0.3s ease; }
    .btn-submit:hover { background:linear-gradient(90deg,#45A049,#4CAF50); transform:translateY(-2px); }
    .btn-submit:active { transform:translateY(1px); box-shadow:0 3px 5px rgba(0,0,0,0.2); }
    .question { margin-bottom:20px; }
    textarea { width:100%; padding:8px; border-radius:4px; border:1px solid #ccc; }
    .result-container { padding:20px; background:#f0f0f0; border-radius:8px; margin-top:20px; }
    .result-score { font-size:24px; font-weight:bold; margin-bottom:10px; }
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
    <div class="auth-buttons"><a class="btn btn-profile" href="profile.php">Trang cá nhân</a></div>
</div>
</header>

<main>
<div id="timer">Thời gian còn lại: 00:00</div>
<h2><?php echo htmlspecialchars($exam['title']); ?> - <?php echo htmlspecialchars($exam['subject']); ?></h2>

<?php if ($_SERVER['REQUEST_METHOD'] != 'POST') { ?>
<form method="POST" id="examForm">
<?php
$i = 1;
foreach ($questions as $q) {
    echo "<div class='question'>";
    echo "<b>Câu {$i}: ".htmlspecialchars($q['question_text'])."</b><br>";
    if ($q['type'] == 'MC') {
        foreach (['A','B','C','D'] as $option) {
            $text = htmlspecialchars($q['option_'.strtolower($option)]);
            echo "<label><input type='radio' name='answer[$i]' value='$option'> $option. $text</label><br>";
        }
        echo "<input type='hidden' name='correct[$i]' value='{$q['correct_answer']}'>";
    } else {
        echo "<textarea name='answer[$i]' rows='4' placeholder='Nhập câu trả lời...'></textarea>";
    }
    echo "</div><hr>";
    $i++;
}
?>
<button type="submit" class="btn-submit">Nộp bài</button>
</form>
<?php } ?>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $answers = $_POST['answer'] ?? [];
    $score = 0;

    $user_id = $_SESSION['user_id'];
    $start_time = $_SESSION['exam_start_time'] ?? date("Y-m-d H:i:s");
    $end_time = date("Y-m-d H:i:s");

    $total_questions = count($questions);

    // Lưu kết quả chung vào bảng results
    $stmt_res = $conn->prepare("INSERT INTO results (user_id, exam_id, score, total_question, start_time, end_time) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt_res->bind_param("iiisss", $user_id, $exam_id, $score, $total_questions, $start_time, $end_time);
    $stmt_res->execute();
    $result_id = $stmt_res->insert_id;

    // Lưu chi tiết trả lời từng câu
    $i = 1;
    foreach ($questions as $q) {
        $userAnswer = trim($answers[$i] ?? '');

        if ($q['type'] == 'MC') {
            // Chấm trắc nghiệm
            if ($userAnswer == $q['correct_answer']) {
                $score++;
            }
        } else {
            // Chấm tự luận: so sánh với đáp án mẫu trong DB
            $stmt_ans = $conn->prepare("SELECT answer FROM essay_questions WHERE question_id=?");
            $stmt_ans->bind_param("i", $q['id']);
            $stmt_ans->execute();
            $row_ans = $stmt_ans->get_result()->fetch_assoc();
            $correct = $row_ans['answer'] ?? '';

            // Chuẩn hóa (viết thường + bỏ khoảng trắng thừa)
            $userNorm = strtolower(trim($userAnswer));
            $correctNorm = strtolower(trim($correct));

            // Nếu câu trả lời chứa đáp án mẫu → cho điểm
            if ($userNorm !== '' && $correctNorm !== '' && strpos($userNorm, $correctNorm) !== false) {
                $score++;
            }
        }

        $i++;
    }


    // Cập nhật lại điểm vào bảng result (cột score)
    $stmt_update = $conn->prepare("UPDATE results SET score=? WHERE id=?");
    $stmt_update->bind_param("ii", $score, $result_id);
    $stmt_update->execute();

    unset($_SESSION['exam_start_time']);

    // Hiển thị kết quả
    echo '<div class="result-container">';
    echo '<h3>Kết quả</h3>';
    echo '<div class="result-score">'.$score.' / '.$total_questions.'</div>';

    if ($total_questions > 0) {
        $diem = round(($score/$total_questions)*10, 2);
    } else {
        $diem = 0;
    }

    echo '<p>Điểm '.$diem.' / 10</p>';
    echo '<a class="btn-back" href="exam_list.php">Quay lại danh sách đề thi</a>';
    echo '</div>';


    // Hiển thị chi tiết bài làm
    echo '<h3>Chi tiết bài làm</h3>';
    $i = 1;
    foreach ($questions as $q) {
        $userAnswer = $answers[$i] ?? '';
        echo "<div class='question'>";
        echo "<b>Câu {$i}: ".htmlspecialchars($q['question_text'])."</b><br>";

        if ($q['type'] == 'MC') {
            foreach (['A','B','C','D'] as $option) {
                $text = htmlspecialchars($q['option_'.strtolower($option)]);
                $style = '';
                if ($option == $q['correct_answer']) $style=' style="color:green;font-weight:bold;"';
                if ($option == $userAnswer && $userAnswer != $q['correct_answer']) $style=' style="color:red;font-weight:bold;"';
                echo "<label{$style}>$option. $text</label><br>";
            }
            echo "<p>Đáp án đúng: <b>{$q['correct_answer']}</b></p>";
            echo "<p>Đáp án của bạn: <b>{$userAnswer}</b></p>";
        } else {
            
            echo "<p>Trả lời của bạn:</p>";
            echo "<textarea rows='4' readonly>".htmlspecialchars($userAnswer)."</textarea>";
        }

        echo "</div><hr>";
        $i++;
    }
}
?>

<script>
var totalMinutes = <?php echo intval($exam['time']); ?>;
var timeLeft = totalMinutes * 60; 
var timerEl = document.getElementById('timer');
var examForm = document.getElementById('examForm');

function updateTimer() {
    var minutes = Math.floor(timeLeft / 60);
    var seconds = timeLeft % 60;
    timerEl.textContent = 'Thời gian còn lại: ' + String(minutes).padStart(2,'0') + ':' + String(seconds).padStart(2,'0');
    if (timeLeft <= 0) {
        clearInterval(timerInterval);
        alert("Hết thời gian! Bài thi sẽ tự động nộp.");
        examForm.submit();
    } else { timeLeft--; }
}

examForm.addEventListener('submit', function(){ timerEl.style.display = 'none'; });
updateTimer();
var timerInterval = setInterval(updateTimer, 1000);
</script>

</main>
</body>
</html>
