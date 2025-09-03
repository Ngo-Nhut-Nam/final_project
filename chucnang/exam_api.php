<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

include("config/db.php");

$action = $_GET['action'] ?? '';

if ($action === "add") {
    $title = $_POST['title'] ?? '';
    $subject = $_POST['subject'] ?? '';
    $questions = intval($_POST['questions'] ?? 0);
    $time = intval($_POST['time'] ?? 0);
    $difficulty = $_POST['difficulty'] ?? '';
    $description = $_POST['description'] ?? '';

    if ($title === '' || $subject === '' || $questions <= 0 || $time <= 0) {
        echo "invalid";
        exit();
    }

    // chuẩn bị câu lệnh insert
    $stmt = $conn->prepare("INSERT INTO exams 
        (title, subject, num_questions, time, difficulty, description, created_at, created_by) 
        VALUES (?, ?, ?, ?, ?, ?, NOW(), ?)");

    $stmt->bind_param(
        "ssiiisi",
        $title,
        $subject,
        $questions,
        $time,
        $difficulty,
        $description,
        $_SESSION['user_id']
    );

    if ($stmt->execute()) {
        echo $conn->insert_id; // trả về ID đề thi vừa thêm
    } else {
        echo "error: " . $conn->error;
    }

    $stmt->close();
}
