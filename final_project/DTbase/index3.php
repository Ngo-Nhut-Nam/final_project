<?php
include("db.php");

// Danh sách bảng theo môn
$tables = [ 
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

// Nếu chưa chọn môn → hiển thị giao diện chọn môn
if (!isset($_GET['subject'])) {
?>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Danh sách đề thi</title>
<style>
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: #f4f6fb;
    margin: 0;
    padding: 0;
    color: #333;
}

/* Header danh sách */
.exams-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 2rem auto 1.5rem;
    max-width: 1200px;
    padding: 0 1rem;
}
.exams-header h2 {
    margin: 0;
    font-size: 1.8rem;
    color: #2d3e50;
}

/* GRID layout */
.exams-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 1.5rem;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem 2rem;
    align-items: start;
}

.exam-card {
    display: flex;
    flex-direction: column;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.06);
    transition: transform 0.25s ease, box-shadow 0.25s ease;
    overflow: hidden;
    height: auto;
    min-height: 220px;
}

.exam-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.12);
}

/* HEADER */
.exam-header {
    background: linear-gradient(135deg, #4a6baf, #6f8cd8);
    color: #fff;
    padding: 1rem;
    font-weight: bold;
    text-align: center;
    font-size: 1.1rem;
    letter-spacing: 0.5px;
}

/* BODY */
.exam-body {
    padding: 1rem 1.5rem;
    flex-grow: 1;
}
.exam-info {
    display: flex;
    justify-content: space-between;
    font-size: 0.95rem;
    margin-bottom: 0.8rem;
    color: #555;
}

/* FOOTER */
.exam-footer {
    padding: 0.8rem 1rem;
    background-color: #f9f9f9;
    text-align: right;
    border-top: 1px solid #eee;
}

/* Nút */
.btn {
    padding: 0.6rem 1.2rem;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.3s ease;
    font-size: 0.95rem;
}
.btn-primary {
    background-color: #ff6b6b;
    color: #fff;
}
.btn-primary:hover {
    background-color: #ff4d4d;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

/* --- Hàng riêng cho Vật lý 6 + Tiếng Anh --- */
.exam-row {
    display: flex;
    gap: 1.5rem;
    max-width: 1200px;
    margin: 0 auto 1.5rem;
    padding: 0 1rem;
}
.exam-row .exam-card {
    flex: 1;
}

/* Responsive */
@media (max-width: 768px) {
    .exams-header h2 {
        font-size: 1.4rem;
    }
    .exam-header {
        font-size: 1rem;
        padding: 0.8rem;
    }
    .exam-body {
        padding: 0.8rem 1rem;
    }
    .btn {
        font-size: 0.85rem;
        padding: 0.5rem 1rem;
    }
    .exam-row {
        flex-direction: column;
    }
}
</style>
</head>
<body>

<div class="exams-header">
    <h2>Danh sách đề thi</h2>
    <select id="subject-filter" onchange="filterExams()">
        <option value="all">Tất cả môn</option>
        <option value="math">Toán học</option>
        <option value="chemistry_8">Hóa học Lớp 8</option>
        <option value="chemistry_9">Hóa học Lớp 9</option>
        <option value="chemistry_10">Hóa học Lớp 10</option>
        <option value="chemistry_11">Hóa học Lớp 11</option>
        <option value="chemistry_12">Hóa học Lớp 12</option>
        <option value="math-TuLuan">Toán Tự luận</option>
        <option value="physics_6">Vật Lý Lớp 6</option>
        <option value="physics_7">Vật Lý Lớp 7</option>
        <option value="physics_8">Vật Lý Lớp 8</option>
        <option value="physics_9">Vật Lý Lớp 9</option>
        <option value="physics_10">Vật Lý Lớp 10</option>
        <option value="physics_11">Vật Lý Lớp 11</option>
        <option value="physics_12">Vật Lý Lớp 12</option>
        <option value="English_6">Anh văn Lớp 6</option>
        <option value="English_7">Anh văn Lớp 7</option>
        <option value="English_8">Anh văn Lớp 8</option>
        <option value="English_9">Anh văn Lớp 9</option>
        <option value="English_10">Anh văn Lớp 10</option>
        <option value="English_11">Anh văn Lớp 11</option>
        <option value="English_12">Anh văn Lớp 12</option>
    </select>
</div>

<div class="exams-grid" id="exam-list">
    <!-- Card Toán -->
    <div class="exam-card" data-subject="math">
        <div class="exam-header"><h3>Toán học - Kiểm tra </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('math')">Bắt đầu thi</button>
        </div>
    </div>

    <!-- Card Toán tự luận -->
    <div class="exam-card" data-subject="math-TuLuan">
        <div class="exam-header"><h3>Toán học - Tự Luận</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>20 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="window.location.href='math_tu_luan.php'">Bắt đầu thi</button>
        </div>
    </div>

    <!-- Card Hóa -->
    <div class="exam-card" data-subject="chemistry_8">
        <div class="exam-header"><h3>Hóa Học - Lớp 8 </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Dễ</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('chemistry_8')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="chemistry_9">
        <div class="exam-header"><h3>Hóa Học - Lớp 9 </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Dễ</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('chemistry_9')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="chemistry_10">
        <div class="exam-header"><h3>Hóa Học - Lớp 10 </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('chemistry_10')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="chemistry_11">
        <div class="exam-header"><h3>Hóa Học - Lớp 11 </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('chemistry_11')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="chemistry_12">
        <div class="exam-header"><h3>Hóa Học - Lớp 12 </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('chemistry_12')">Bắt đầu thi</button>
        </div>
    </div>

    <!-- Card Vật lý lớp 6 -->
    <div class="exam-card" data-subject="physics_6">
        <div class="exam-header"><h3>Vật lý - lớp 6</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Dễ</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_6')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_7">
        <div class="exam-header"><h3>Vật lý - lớp 7</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung Bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_7')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_8">
        <div class="exam-header"><h3>Vật lý - lớp 8</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung Bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_8')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_9">
        <div class="exam-header"><h3>Vật lý - lớp 9</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_9')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_10">
        <div class="exam-header"><h3>Vật lý - lớp 10</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_10')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_11">
        <div class="exam-header"><h3>Vật lý - lớp 11</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_11')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_12">
        <div class="exam-header"><h3>Vật lý - lớp 12</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_12')">Bắt đầu thi</button>
        </div>
    </div>


    <!-- Card Tiếng Anh -->
    <div class="exam-card" data-subject="English_6">
        <div class="exam-header"><h3>Anh Văn - lớp 6</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Dễ</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_6')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_7">
        <div class="exam-header"><h3>Anh Văn - lớp 7</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_7')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_8">
        <div class="exam-header"><h3>Anh Văn - lớp 8</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_8')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_9">
        <div class="exam-header"><h3>Anh Văn - lớp 9</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_9')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_10">
        <div class="exam-header"><h3>Anh Văn - lớp 10</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_10')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_11">
        <div class="exam-header"><h3>Anh Văn - lớp 11</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_11')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_12">
        <div class="exam-header"><h3>Anh Văn - lớp 12</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_12')">Bắt đầu thi</button>
        </div>
    </div>


<script>
function startExam(subject) {
    window.location.href = "?subject=" + subject;
}
function filterExams() {
    let filter = document.getElementById('subject-filter').value;
    document.querySelectorAll('.exam-card').forEach(exam => {
        exam.style.display = (filter === 'all' || exam.dataset.subject === filter) ? '' : 'none';
    });
}
</script>
</body>
</html>

<?php
exit;
}

// ==========================
// Nếu đã chọn môn → xử lý làm bài
// ==========================
$subject = $_GET['subject'];
if (!isset($tables[$subject])) {
    die("Môn không hợp lệ");
}

$table = $tables[$subject];
$sql = "SELECT * FROM `$table`";
$result = $conn->query($sql);
$stt = 1;
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Bài kiểm tra trắc nghiệm</title>
    <style>
/* CSS giống code bạn đưa ở trên */
</style>
</head>
<body class="subject-<?php echo htmlspecialchars($subject); ?>">
    ?>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Bài kiểm tra trắc nghiệm</title>
<style>
body {
    font-family: Arial, sans-serif;
    line-height: 1.5;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 30px auto;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    color: #333;
}

.question {
    margin-bottom: 20px;
    padding: 15px;
    background: #fefefe;
    border: 1px solid #ddd;
    border-radius: 8px;
}

.question b {
    display: block;
    font-size: 16px;
    color: #0056b3;
    margin-bottom: 8px;
}

.option {
    display: block;
    margin: 5px 0;
    padding: 5px;
    cursor: pointer;
}

.option input[type="radio"] {
    margin-right: 8px;
    transform: scale(1.1);
}

button {
    display: block;
    margin: 20px auto;
    padding: 10px 20px;
    background: #28a745;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}
button:hover {
    background: #218838;
}
.result {
    text-align: center;
    font-size: 18px;
    font-weight: bold;
    color: #d9534f;
}
</style>
</head>
<body>

<div class="exam-container">
    <h2 class="exam-title">Bài kiểm tra trắc nghiệm</h2>
    <form method="post" action="result.php?subject=<?php echo $subject; ?>">
        <?php
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<div class="question">';
                echo "<b>Câu {$stt}: " . htmlspecialchars($row['QUESTION']) . "</b>";
                echo '<div class="options">';
                echo '<div class="option"><span>A</span><input type="radio" name="answer['.$stt.']" value="A"> ' . htmlspecialchars($row['OPTION_A']) . '</div>';
                echo '<div class="option"><span>B</span><input type="radio" name="answer['.$stt.']" value="B"> ' . htmlspecialchars($row['OPTION_B']) . '</div>';
                echo '<div class="option"><span>C</span><input type="radio" name="answer['.$stt.']" value="C"> ' . htmlspecialchars($row['OPTION_C']) . '</div>';
                echo '<div class="option"><span>D</span><input type="radio" name="answer['.$stt.']" value="D"> ' . htmlspecialchars($row['OPTION_D']) . '</div>';
                echo '</div>';
                echo '<input type="hidden" name="correct['.$stt.']" value="'.$row['CORRECT_OPTION'].'">';
                echo '</div>';
                $stt++;
            }
            echo '<div class="submit-container"><button class="btn btn-primary" type="submit">Nộp bài</button></div>';
        } else {
            echo "Không có câu hỏi nào.";
        }
        ?>
    </form>
</div>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $answers = $_POST['answer'] ?? [];
    $corrects = $_POST['correct'] ?? [];
    $score = 0;
    $total = count($corrects);

    foreach ($corrects as $key => $correct) {
        if (isset($answers[$key]) && $answers[$key] === $correct) {
            $score++;
        }
    }

    echo '<div class="result-container">';
    echo '<h3>Kết quả</h3>';
    echo '<div class="result-score">'.$score.'/'.$total.'</div>';
    echo '<p>Bạn đã trả lời đúng '.round(($score/$total)*100).'%</p>';
    echo '<a href="?">Quay lại chọn môn</a>';
    echo '</div>';
}
$conn->close();
?>
</body>
</html>
