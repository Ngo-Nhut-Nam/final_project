<?php
session_start();
include("config/db.php");

// Lấy thông tin đề thi
$sql_exam = "SELECT * FROM exams WHERE id = ?";
$stmt = $conn->prepare($sql_exam);
$stmt->bind_param("i", $exam_id);
$stmt->execute();
$exam = $stmt->get_result()->fetch_assoc();

if (!$exam) {
    echo "<p>❌ Không tìm thấy đề thi.</p>";
    exit();
}

// Lấy danh sách câu hỏi
$sql = "SELECT * FROM questions WHERE exam_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $exam_id);
$stmt->execute();
$questions = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Làm bài thi</title>
    <link rel="stylesheet" href="css/index.css">
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
    <section id="exam" class="page">
        <div class="exam-container">
            <h2 class="exam-title">
                Đề thi số <?= htmlspecialchars($exam_id) ?> (<?= count($questions) ?> câu)
            </h2>
            <div class="timer" id="timer">60:00</div>

            <form action="submit_exam.php" method="post" id="examForm">
                <input type="hidden" name="exam_id" value="<?= $exam_id ?>">
                <?php foreach ($questions as $index => $q): ?>
                    <div class="question">
                        <p><strong>Câu <?= $index+1 ?>:</strong> <?= htmlspecialchars($q['question']) ?></p>
                        <div class="options">
                            <?php foreach (['a','b','c','d'] as $opt): ?>
                                <div class="option">
                                    <input type="radio" 
                                           name="q<?= $q['id'] ?>" 
                                           id="q<?= $q['id'] ?><?= $opt ?>" 
                                           value="<?= strtoupper($opt) ?>">
                                    <label for="q<?= $q['id'] ?><?= $opt ?>">
                                        <?= strtoupper($opt) ?>. <?= htmlspecialchars($q['option_'.$opt]) ?>
                                    </label>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
                <div class="submit-container">
                    <button type="submit" class="btn btn-primary">Nộp bài</button>
                </div>
            </form>
        </div>
    </section>
</main>

<footer>
    <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
</footer>

<script>
// Thời gian làm bài: 60 phút
let duration = 60 * 60; // giây
const display = document.getElementById("timer");

function startTimer() {
    let timer = duration, minutes, seconds;
    const interval = setInterval(() => {
        minutes = Math.floor(timer / 60);
        seconds = timer % 60;
        display.textContent =
            `${minutes}:${seconds < 10 ? "0" + seconds : seconds}`;

        if (--timer < 0) {
            clearInterval(interval);
            alert("⏰ Hết giờ! Bài thi sẽ được nộp.");
            document.getElementById("examForm").submit();
        }
    }, 1000);
}
startTimer();
</script>

</body>
</html>
