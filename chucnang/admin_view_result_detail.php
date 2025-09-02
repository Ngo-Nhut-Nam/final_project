<?php
session_start();
include("config/db.php");

// Kiểm tra quyền admin
if (!isset($_SESSION['username']) || empty($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("HTTP/1.1 403 Forbidden");
    echo "Bạn không có quyền xem chi tiết kết quả!";
    exit();
}

// Lấy ID kết quả
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    die("ID kết quả không hợp lệ!");
}
$result_id = intval($_GET['id']);

// Lấy thông tin kết quả + user + đề thi
$sql = "SELECT r.*, u.username, e.title AS exam_title
        FROM results r
        LEFT JOIN users u ON r.user_id = u.username
        LEFT JOIN exams e ON r.exam_id = e.exam_id
        WHERE r.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $result_id);
$stmt->execute();
$result_info = $stmt->get_result()->fetch_assoc();

if (!$result_info) {
    die("Không tìm thấy kết quả này!");
}

// Lấy danh sách câu trả lời của user
$sql2 = "SELECT ua.*, q.question_text, q.correct_answer, 
                q.option_a, q.option_b, q.option_c, q.option_d
         FROM user_answers ua
         JOIN questions q ON ua.question_id = q.question_id
         WHERE ua.result_id = ?";
$stmt2 = $conn->prepare($sql2);
$stmt2->bind_param("i", $result_id);
$stmt2->execute();
$user_answers = $stmt2->get_result();
?>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <title>Chi tiết kết quả - <?= htmlspecialchars($result_info['username']) ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <a href="admin_view_results.php" class="btn btn-secondary mb-3">← Quay lại</a>

  <div class="card mb-3">
    <div class="card-body">
      <h4>Đề thi: <?= htmlspecialchars($result_info['exam_title']) ?></h4>
      <p><strong>Thí sinh:</strong> <?= htmlspecialchars($result_info['username']) ?></p>
      <p><strong>Điểm:</strong> <?= $result_info['score'] ?> / <?= $result_info['total_question'] ?></p>
      <p><strong>Bắt đầu:</strong> <?= $result_info['start_time'] ?></p>
      <p><strong>Kết thúc:</strong> <?= $result_info['end_time'] ?></p>
    </div>
  </div>

  <div class="card">
    <div class="card-body">
      <h5>Chi tiết câu trả lời</h5>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>#</th>
            <th>Câu hỏi</th>
            <th>Đáp án đã chọn</th>
            <th>Đáp án đúng</th>
            <th>Kết quả</th>
          </tr>
        </thead>
        <tbody>
          <?php $i=1; while ($row = $user_answers->fetch_assoc()): 
              $is_correct = ($row['answer'] == $row['correct_answer']); ?>
            <tr class="<?= $is_correct ? 'table-success' : 'table-danger' ?>">
              <td><?= $i++ ?></td>
              <td><?= htmlspecialchars($row['question_text']) ?></td>
              <td><?= htmlspecialchars($row['answer']) ?></td>
              <td><?= htmlspecialchars($row['correct_answer']) ?></td>
              <td><?= $is_correct ? 'Đúng' : 'Sai' ?></td>
            </tr>
          <?php endwhile; ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
