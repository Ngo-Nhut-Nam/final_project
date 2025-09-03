<?php
include("config/db.php");
session_start();

// Chỉ xử lý khi là POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Lấy dữ liệu từ form
    $exam_id = intval($_POST['exam_id']);
    $title = trim($_POST['title']);
    $subject = trim($_POST['subject']);
    $num_questions = intval($_POST['num_questions']);
    $time = intval($_POST['time']);
    $difficulty = $_POST['difficulty'];   // giá trị ENUM: easy/medium/hard
    $exam_type = $_POST['exam_type'];     // giá trị ENUM: tracnghiem/tuluan

    // Kiểm tra giá trị hợp lệ với ENUM
    $allowed_difficulty = ['easy','medium','hard'];
    $allowed_exam_type = ['tracnghiem','tuluan'];

    if (!in_array($difficulty, $allowed_difficulty)) {
        $difficulty = 'easy';
    }
    if (!in_array($exam_type, $allowed_exam_type)) {
        $exam_type = 'tracnghiem';
    }

    // Câu lệnh UPDATE
    $sql = "UPDATE exams SET title=?, subject=?, num_questions=?, time=?, difficulty=?, exam_type=? WHERE exam_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssiissi", $title, $subject, $num_questions, $time, $difficulty, $exam_type, $exam_id);

    if ($stmt->execute()) {
        // Chuyển hướng về trang edit với thông báo thành công
        header("Location: edit_exam.php?exam_id=$exam_id&status=success");
        exit();
    } else {
        // Chuyển hướng với thông báo lỗi
        header("Location: edit_exam.php?exam_id=$exam_id&status=error");
        exit();
    }
}
?>
