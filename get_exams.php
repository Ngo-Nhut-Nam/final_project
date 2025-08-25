<?php
include("config/db.php");
header("Content-Type: application/json; charset=UTF-8");

$subject = isset($_GET['subject']) ? $_GET['subject'] : 'all';

if ($subject === "all") {
    $sql = "SELECT id, title, subject, questions, difficulty, description FROM exams";
    $stmt = $conn->prepare($sql);
} else {
    $sql = "SELECT id, title, subject, questions, difficulty, description FROM exams WHERE subject = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $subject);
}

$stmt->execute();
$result = $stmt->get_result();

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode([
    "success" => true,
    "subject" => $subject,
    "data" => $data
], JSON_UNESCAPED_UNICODE);

$stmt->close();
$conn->close();
