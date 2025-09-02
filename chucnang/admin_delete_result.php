<?php
session_start();
include("config/db.php");

// Kiểm tra quyền admin
if (!isset($_SESSION['username']) || empty($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("HTTP/1.1 403 Forbidden");
    echo "Bạn không có quyền xóa kết quả!";
    exit();
}

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    die("ID không hợp lệ!");
}
$result_id = intval($_GET['id']);

// Xóa tất cả câu trả lời liên quan trong user_answers
$sql1 = "DELETE FROM user_answers WHERE result_id = ?";
$stmt1 = $conn->prepare($sql1);
$stmt1->bind_param("i", $result_id);
$stmt1->execute();

// Sau đó mới xóa kết quả trong results
$sql2 = "DELETE FROM results WHERE id = ?";
$stmt2 = $conn->prepare($sql2);
$stmt2->bind_param("i", $result_id);

if ($stmt2->execute()) {
    header("Location: admin_view_results.php?msg=deleted");
    exit();
} else {
    echo "Lỗi khi xóa: " . $conn->error;
}
