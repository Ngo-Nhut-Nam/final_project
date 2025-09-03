<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

include("config/db.php");

$action = $_GET['action'] ?? '';

if ($action == "add") {
    $exam_id = intval($_POST['exam_id']);
    $question_type = $_POST['question_type'] ?? '';
    $question_text = trim($_POST['question_text'] ?? '');

    if ($exam_id <= 0 || $question_text === '') {
        echo "invalid";
        exit();
    }

    if ($question_type === 'multiple_choice') {
        $a = $_POST['option_a'] ?? '';
        $b = $_POST['option_b'] ?? '';
        $c = $_POST['option_c'] ?? '';
        $d = $_POST['option_d'] ?? '';
        $correct = $_POST['correct_answer'] ?? '';

        if ($a === '' || $b === '' || $c === '' || $d === '' || $correct === '') {
            echo "invalid";
            exit();
        }

        $sql = "INSERT INTO questions (exam_id, question_text, option_a, option_b, option_c, option_d, correct_answer)
                VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("issssss", $exam_id, $question_text, $a, $b, $c, $d, $correct);

        if ($stmt->execute()) {
            header("Location: exam_list.php");
            exit();
        } else {
            die("Lỗi: " . $conn->error);
        }
        $stmt->close();
    } 
    elseif ($question_type === 'essay') {
        $answer = trim($_POST['answer'] ?? '');

        if ($answer === '') {
            echo "Bạn phải nhập đáp án cho câu tự luận!";
            exit();
        }

        $stmt = $conn->prepare("
            INSERT INTO essay_questions 
            (exam_id, question_text, answer, question_type, created_at)
            VALUES (?, ?, ?, 'essay', NOW())
        ");
        $stmt->bind_param("iss", $exam_id, $question_text, $answer);

        if ($stmt->execute()) {
            header("Location: exam_list.php");
            exit();
        } else {
            die("Lỗi: " . $stmt->error);
        }
        $stmt->close();
    }
}
