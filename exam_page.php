<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

include("config/db.php");

// Danh sách bảng
$tables = [
    'toan_tu_luan' => 'bai_toan_tu_luan',
    'math' => 'question_math',
    'chemistry_8' => 'question_chemistry_8',
    'chemistry_9' => 'question_chemistry_9',
    'chemistry_10' => 'question_chemistry_10',
    'chemistry_11' => 'question_chemistry_11',
    'chemistry_12' => 'question_chemistry_12',
    'physics_6'=> 'question_physics_6',
    'physics_7'=> 'question_physics_7',
    'physics_8'=> 'question_physics_8',
    'physics_9'=> 'question_physics_9',
    'physics_10'=> 'question_physics_10',
    'physics_11'=> 'question_physics_11',
    'physics_12'=> 'question_physics_12',
    'English_6'=> 'question_english_6',
    'English_7'=> 'question_english_7',
    'English_8'=> 'question_english_8',
    'English_9'=> 'question_english_9',
    'English_10'=> 'question_english_10',
    'English_11'=> 'question_english_11',
    'English_12'=> 'question_english_12',
];

$subject = $_GET['subject'] ?? '';
if (!isset($tables[$subject])) {
    die("Môn không hợp lệ");
}

$table = $tables[$subject];
$sql = "SELECT * FROM `$table`";
$result = $conn->query($sql);
$stt = 1;

// Start_time ngay khi load đề thi
if (!isset($_SESSION['exam_start_time'])) {
    $_SESSION['exam_start_time'] = date("Y-m-d H:i:s");
}


?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Bài kiểm tra trắc nghiệm</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="exam_page.css">
    </head>
    <body>
    <!-- Timer -->
    <?php if ($_SERVER['REQUEST_METHOD'] != 'POST') { ?>
        <div id="timer">Thời gian: <span id="time">10:00</span></div>
    <?php } ?>

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

    <div class="exam-container">
        <h2 class="exam-title">Bài kiểm tra - <?php echo htmlspecialchars($subject); ?></h2>

       <?php if ($_SERVER['REQUEST_METHOD'] != 'POST') { ?>

            <?php
            $subject = $_GET['subject'] ?? '';

            if ($subject != 'toan_tu_luan') {
            ?>
                <form method="post" action="">
                    <?php
                    if ($result && $result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo '<div class="question">';
                            echo "<b>Câu {$stt}: " . htmlspecialchars($row['QUESTION']) . "</b>";
                            echo '<div class="options">';
                            echo '<label><input type="radio" name="answer['.$stt.']" value="A"> A. ' . htmlspecialchars($row['OPTION_A']) . '</label><br>';
                            echo '<label><input type="radio" name="answer['.$stt.']" value="B"> B. ' . htmlspecialchars($row['OPTION_B']) . '</label><br>';
                            echo '<label><input type="radio" name="answer['.$stt.']" value="C"> C. ' . htmlspecialchars($row['OPTION_C']) . '</label><br>';
                            echo '<label><input type="radio" name="answer['.$stt.']" value="D"> D. ' . htmlspecialchars($row['OPTION_D']) . '</label>';
                            echo '</div>';

                            // ẩn đáp án đúng + dữ liệu phụ để chấm điểm
                            echo '<input type="hidden" name="correct['.$stt.']" value="'.$row['CORRECT_OPTION'].'">';
                            echo '<input type="hidden" name="qtext['.$stt.']" value="'.htmlspecialchars($row['QUESTION']).'">';
                            echo '<input type="hidden" name="oa['.$stt.']" value="'.htmlspecialchars($row['OPTION_A']).'">';
                            echo '<input type="hidden" name="ob['.$stt.']" value="'.htmlspecialchars($row['OPTION_B']).'">';
                            echo '<input type="hidden" name="oc['.$stt.']" value="'.htmlspecialchars($row['OPTION_C']).'">';
                            echo '<input type="hidden" name="od['.$stt.']" value="'.htmlspecialchars($row['OPTION_D']).'">';
                            echo '</div>';
                            $stt++;
                        }
                        echo '<div class="submit-container"><button class="btn btn-primary" type="submit">Nộp bài</button></div>';
                    } else {
                        echo "Không có câu hỏi nào.";
                    }
                    ?>
                </form>
            <?php
            }
            
            else {
                $query = "SELECT * FROM bai_toan_tu_luan";
                $result = $conn->query($query);
            ?>
                <form method="POST" action="">
                    <?php
                    $i = 1;
                    while ($row = $result->fetch_assoc()) {
                        echo "<div class='QUESTION'>";
                        echo "<b>Câu {$i}:</b> {$row['QUESTION']}<br>";
                        echo "<input type='hidden' name='correct[$i]' value='".htmlspecialchars($row['CORRECT_OPTION'])."'>";
                        echo "<input type='hidden' name='qtext[$i]' value='".htmlspecialchars($row['QUESTION'])."'>";
                        echo "<input type='hidden' name='explain[$i]' value='".htmlspecialchars($row['EXPLAIN_QUESTION'])."'>";
                        echo "<textarea name='answer[$i]' rows='3' cols='50' placeholder='Nhập đáp án...'></textarea>";
                        echo "</div><hr>";
                        $i++;
                    }
                    echo "<input type='hidden' name='subject' value='{$subject}'>";
                    ?>
                    <div class="submit-container"> 
                        <button type="submit" class="btn btn-primary">Nộp bài</button> 
                    </div>
                </form>
            <?php
            }
            ?>

        <?php } ?>



        <?php
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $answers  = $_POST['answer'] ?? [];
            $corrects = $_POST['correct'] ?? [];
            $qtext    = $_POST['qtext'] ?? [];

            // Nếu có các đáp án lựa chọn (trắc nghiệm)
            $oa = $_POST['oa'] ?? [];
            $ob = $_POST['ob'] ?? [];
            $oc = $_POST['oc'] ?? [];
            $od = $_POST['od'] ?? [];

            $score = 0;
            $total = count($corrects);

            echo '<div class="result-container">';
            echo '<h3>Kết quả</h3>';

            $explain = $_POST['explain'] ?? [];

            foreach ($corrects as $key => $correct) {
                $userAnswer = trim($answers[$key] ?? '');
                $isCorrect  = ($userAnswer === $correct);

                if ($isCorrect) $score++;

                echo '<div class="question">';
                echo "<b>Câu {$key}: ".($qtext[$key] ?? '')."</b><br>";

                // Nếu là tự luận 
                if (empty($oa) && empty($ob) && empty($oc) && empty($od)) {
                    if ($isCorrect) {
                        echo "<span class='correct'>Bạn trả lời: $userAnswer (Đúng)</span><br>";
                    } else {
                        echo "<span class='wrong'>Bạn trả lời: ".($userAnswer ?: "Không nhập")." (Sai)</span><br>";
                        echo "<span class='correct'>Đáp án đúng: $correct</span><br>";
                        echo "<span class='explain'>Giải thích: ".($explain[$key] ?? '')."</span><br>";
                    }
                } 
                // Nếu là trắc nghiệm
                else {
                    if ($userAnswer === $correct) {
                        echo "<span class='correct'>Bạn chọn: $userAnswer (Đúng)</span><br>";
                    } else {
                        echo "<span class='wrong'>Bạn chọn: ".($userAnswer ?: "Không chọn")." (Sai)</span><br>";
                        $correctText = ${strtolower("o".$correct)}[$key] ?? '';
                        echo "<span class='correct'>Đáp án đúng: $correct. $correctText</span><br>";
                    }
                }

                echo '</div><hr>';
            }

            echo '<div class="result-score"><b>Câu đúng: '.$score.'/'.$total.'</b></div>';
            echo '<p>Điểm '.(($score/$total)*10).'</p>';
            echo '<a href="exam_list.php">Quay lại chọn môn</a>';
            echo '</div>';

            // --- Lưu kết quả vào DB ---
            $user_id = $_SESSION['user_id'];
            $correct_answer = $score;
            $start_time = $_SESSION['exam_start_time'] ?? date("Y-m-d H:i:s");
            $end_time   = date("Y-m-d H:i:s");
            $subject    = $_POST['subject'] ?? '';

            $stmt = $conn->prepare("INSERT INTO results (user_id, subject, score, total_question, correct_answer, start_time, end_time) 
                                    VALUES (?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("isiiiss", $user_id, $subject, $score, $total, $correct_answer, $start_time, $end_time);
            $stmt->execute();
            $stmt->close();

            // reset lại để lần thi sau không bị giữ thời gian cũ
            unset($_SESSION['exam_start_time']);
        }
        ?>


        <!-- JS đếm ngược -->
        <?php if ($_SERVER['REQUEST_METHOD'] != 'POST') { ?>
        <script src="timer.js"></script>
        <?php } ?>
    </body>
</html>
<?php $conn->close(); ?>
