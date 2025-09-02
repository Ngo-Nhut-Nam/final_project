<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}
include("config/db.php");

// Lấy tất cả đề thi
$sql = "SELECT exam_id, title, subject, num_questions, time, difficulty, exam_type FROM exams";
$result = $conn->query($sql);

$subjects = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        if (!in_array($row['subject'], $subjects)) {
            $subjects[] = $row['subject'];
        }
    }
    $result->data_seek(0);
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách đề thi</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/exam_list.css">
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

<main class="page active">
    <div class="exams-header">
        <h2>Danh sách đề thi</h2>
        <a href="admin_view_results.php" class="add_exam">Tra cứu kết quả</a>
        <a href="add_exam.php" class="add_exam">Thêm đề thi</a>
    </div>

<div class="filter-container">
    <label for="subjectFilter"></label>
    <select id="subjectFilter">
        <option value="all">Tất cả</option>
        <?php foreach($subjects as $subject): ?>
            <option value="<?php echo htmlspecialchars($subject); ?>">
                <?php echo htmlspecialchars($subject); ?>
            </option>
        <?php endforeach; ?>
    </select>

    <label for="typeFilter"></label>
    <select id="typeFilter">
        <option value="all">Tất cả</option>
        <option value="tracnghiem">Trắc nghiệm</option>
        <option value="tuluan">Tự luận</option>
    </select>
</div>

    <div class="exams-grid" id="exam-list">
        <?php if ($result && $result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
                <div class="exam-card" 
                    data-subject="<?php echo htmlspecialchars($row['subject']); ?>" 
                    data-type="<?php echo htmlspecialchars($row['exam_type']); ?>">
                    <div class="exam-header">
                        <h3><?php echo htmlspecialchars($row['title']); ?></h3>
                    </div>
                    <div class="exam-body">
                        <div class="exam-info"><span>Số câu:</span><span><?php echo $row['num_questions']; ?> câu</span></div>
                        <div class="exam-info"><span>Thời gian:</span><span><?php echo $row['time']; ?> phút</span></div>
                        <?php
                            $difficultyMap = ["easy" => "Dễ","medium" => "Trung bình","hard" => "Khó"];
                        ?>
                        <div class="exam-info"><span>Độ khó:</span><span><?php echo $difficultyMap[$row['difficulty']] ?? $row['difficulty']; ?></span></div>
                        <div class="exam-info">
                            <span>Loại đề:</span>
                            <span><?php echo ($row['exam_type'] === 'tracnghiem') ? 'Trắc nghiệm' : 'Tự luận'; ?></span>
                        </div>
                    </div>
                    <div class="exam-footer">
                        <button class="btn btn-primary" 
                            onclick="window.location.href='exam_page.php?exam_id=<?php echo $row['exam_id']; ?>'">
                            Bắt đầu thi
                        </button>
                    </div>
                </div>

            <?php endwhile; ?>
        <?php else: ?>
            <p>Chưa có đề thi nào.</p>
        <?php endif; ?>
    </div>
</main>

<footer>
    <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
</footer>

<script src="js/exam_list.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
    const subjectFilter = document.getElementById("subjectFilter");
    const typeFilter = document.getElementById("typeFilter");
    const exams = document.querySelectorAll(".exam-card");

    function filterExams() {
        const selectedSubject = subjectFilter.value;
        const selectedType = typeFilter.value;

        exams.forEach(exam => {
            const examSubject = exam.dataset.subject;
            const examType = exam.dataset.type;

            // debug: kiểm tra giá trị trong console
            console.log("examType:", examType, "selectedType:", selectedType);

            const matchSubject = (selectedSubject === "all") || (examSubject === selectedSubject);
            const matchType = (selectedType === "all") || (examType === selectedType);

            exam.style.display = (matchSubject && matchType) ? "block" : "none";
        });
    }

    // gắn listener cho cả 2 select
    subjectFilter.addEventListener("change", filterExams);
    typeFilter.addEventListener("change", filterExams);

    // chạy lần đầu khi load trang
    filterExams();
});
</script>
</body>
</html>
