<?php
include("config/db.php");
session_start();

if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("Location: main_page.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['exam_id'])) {
    $exam_id = intval($_POST['exam_id']);

    $sql = "DELETE FROM exams WHERE exam_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $exam_id);

    if ($stmt->execute()) {
        header("Location: exam_list.php?msg=deleted");
        exit();
    } else {
        echo "Lỗi khi xóa đề thi!";
    }
} else {
    echo "Yêu cầu không hợp lệ!";
}
