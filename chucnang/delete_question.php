<?php
include("config/db.php");
session_start();

if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("Location: main_page.php");
    exit();
}

if (isset($_GET['question_id'])) {
    $question_id = intval($_GET['question_id']);

    // Lấy exam_id để redirect lại
    $sql = "SELECT exam_id FROM questions WHERE question_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $question_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $q = $result->fetch_assoc();

    if ($q) {
        $exam_id = $q['exam_id'];

        $sql = "DELETE FROM questions WHERE question_id=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $question_id);
        $stmt->execute();

        header("Location: edit_exam.php?exam_id=$exam_id");
        exit();
    }
}
echo "Không tìm thấy câu hỏi!";
