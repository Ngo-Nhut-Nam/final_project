<?php
include("config/db.php");
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $exam_id = intval($_POST['exam_id']);
    $title = $_POST['title'];
    $subject = $_POST['subject'];
    $num_questions = intval($_POST['num_questions']);
    $time = intval($_POST['time']);
    $difficulty = $_POST['difficulty'];

    $sql = "UPDATE exams SET title=?, subject=?, num_questions=?, time=?, difficulty=? WHERE exam_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssiiii", $title, $subject, $num_questions, $time, $difficulty, $exam_id);

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
