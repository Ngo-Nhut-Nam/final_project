<?php
include("config/db.php");
session_start();

if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("Location: main_page.php");
    exit();
}

$exam_id = intval($_GET['exam_id']);

// Lấy thông tin đề thi
$sql = "SELECT * FROM exams WHERE exam_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $exam_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows == 0) {
    echo "Đề thi không tồn tại!";
    exit();
}

$exam = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa đề thi</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/edit_exam.css">
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
        <?php
        if (isset($_GET['status'])) {
            if ($_GET['status'] == 'success') {
                echo '<p style="color:green;text-align:center;">Lưu thay đổi thành công!</p>';
            } elseif ($_GET['status'] == 'error') {
                echo '<p style="color:red;text-align:center;">Có lỗi xảy ra, vui lòng thử lại.</p>';
            }
        }
        ?>

        <h2 style="text-align:center;">Sửa đề thi</h2>

        <div class="form-container">
            <!-- Form sửa đề thi -->
            <form method="POST" action="update_exam.php">
                <input type="hidden" name="exam_id" value="<?php echo $exam['exam_id']; ?>">

                <div class="form-group">
                    <label for="title">Tiêu đề đề thi</label>
                    <input type="text" name="title" id="title" value="<?php echo htmlspecialchars($exam['title']); ?>" required>
                </div>

                <div class="form-group">
                    <label for="subject">Môn học</label>
                    <input type="text" name="subject" id="subject" value="<?php echo htmlspecialchars($exam['subject']); ?>" required>
                </div>

                <div class="form-group">
                    <label for="num_questions">Số câu hỏi</label>
                    <input type="number" name="num_questions" id="num_questions" value="<?php echo $exam['num_questions']; ?>" required>
                </div>

                <div class="form-group">
                    <label for="time">Thời gian (phút)</label>
                    <input type="number" name="time" id="time" value="<?php echo $exam['time']; ?>" required>
                </div>

                <div class="form-group">
                    <label for="difficulty">Độ khó</label>
                    <select name="difficulty" id="difficulty" required>
                        <option value="easy" <?php if($exam['difficulty']=="easy") echo "selected"; ?>>Dễ</option>
                        <option value="medium" <?php if($exam['difficulty']=="medium") echo "selected"; ?>>Trung bình</option>
                        <option value="hard" <?php if($exam['difficulty']=="hard") echo "selected"; ?>>Khó</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="exam_type">Loại đề thi</label>
                    <select name="exam_type" id="exam_type" required>
                        <option value="tracnghiem" <?php if($exam['exam_type']=="tracnghiem") echo "selected"; ?>>Trắc nghiệm</option>
                        <option value="tuluan" <?php if($exam['exam_type']=="tuluan") echo "selected"; ?>>Tự luận</option>
                    </select>
                </div>

                <hr>
                <h3 style="text-align:center;">Danh sách câu hỏi</h3>
                <div style="max-width:800px;margin:20px auto;">
                    <a href="add_question.php?exam_id=<?php echo $exam['exam_id']; ?>" 
                    style="display:inline-block;margin-bottom:10px;padding:8px 12px;background:#28a745;color:#fff;border-radius:5px;text-decoration:none;">
                    + Thêm câu hỏi
                    </a>

                    <table border="1" cellpadding="10" cellspacing="0" width="100%">
                        <tr>
                            <th>Câu</th>
                            <th>Nội dung</th>
                            <th>Đáp án đúng</th>
                            <th>Hành động</th>
                        </tr>
                        <?php
                        // Lấy câu hỏi trắc nghiệm
                        $sql_mc = "SELECT question_id, question_text, correct_answer, 'mc' AS type FROM questions WHERE exam_id = ?";
                        $stmt_mc = $conn->prepare($sql_mc);
                        $stmt_mc->bind_param("i", $exam_id);
                        $stmt_mc->execute();
                        $result_mc = $stmt_mc->get_result();

                        // Lấy câu hỏi tự luận
                        $sql_essay = "SELECT question_id, question_text, answer AS correct_answer, 'essay' AS type FROM essay_questions WHERE exam_id = ?";
                        $stmt_essay = $conn->prepare($sql_essay);
                        $stmt_essay->bind_param("i", $exam_id);
                        $stmt_essay->execute();
                        $result_essay = $stmt_essay->get_result();

                        // Gộp câu hỏi
                        $questions = [];
                        while($q = $result_mc->fetch_assoc()) $questions[] = $q;
                        while($q = $result_essay->fetch_assoc()) $questions[] = $q;

                        if(count($questions) > 0){
                            $i = 1;
                            foreach($questions as $q){
                                echo "<tr>
                                        <td>{$i}</td>
                                        <td>".htmlspecialchars($q['question_text'])."</td>
                                        <td>{$q['correct_answer']}</td>
                                        <td>
                                            <a href='edit_question.php?question_id={$q['question_id']}&type={$q['type']}'>Sửa</a> | 
                                            <a href='delete_question.php?question_id={$q['question_id']}&type={$q['type']}' onclick=\"return confirm('Bạn có chắc muốn xóa câu hỏi này?');\">Xóa</a>
                                        </td>
                                      </tr>";
                                $i++;
                            }
                        } else {
                            echo "<tr><td colspan='4'>Chưa có câu hỏi nào.</td></tr>";
                        }
                        ?>
                    </table>
                </div>

                <button type="submit" class="btn-save">Lưu thay đổi</button>
            </form>

            <!-- Form xóa đề thi -->
            <form method="POST" action="delete_exam.php" onsubmit="return confirm('Bạn có chắc chắn muốn xóa đề thi này không?');">
                <input type="hidden" name="exam_id" value="<?php echo $exam['exam_id']; ?>">
                <button type="submit" class="btn-delete">Xóa đề thi</button>
            </form>
        </div>
    </main>

    <footer>
        <p style="text-align:center;">&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
    </footer>
</body>
</html>
