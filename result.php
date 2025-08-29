<?php
include("config/db.php");
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Lấy thông tin profile người dùng
$sql_user = "SELECT USERNAME, EMAIL, PHONE FROM users WHERE id = ?";
$stmt_user = $conn->prepare($sql_user);
$stmt_user->bind_param("i", $user_id);
$stmt_user->execute();
$user_result = $stmt_user->get_result();
$user = $user_result->fetch_assoc();
$stmt_user->close();

// Lấy tất cả kết quả thi của user
$sql = "SELECT * FROM results WHERE user_id = ? ORDER BY start_time DESC";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$results = $stmt->get_result();
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử làm bài</title>
    <link rel="stylesheet" href="css/result.css">
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
    <section class="page active">
        <div class="result-container">
            <h2>Thông tin người dùng</h2>
            <p class="name_user"><strong>Tên đăng nhập:</strong> <?php echo htmlspecialchars($user['USERNAME']); ?></p>

            <hr>
            <h2 class="history_user">Lịch sử làm bài</h2>
            <?php if ($results->num_rows > 0): ?>
                <table>
                    <tr>
                        <th>Ngày thi</th>
                        <th>Môn thi</th>
                        <th>Số câu đúng</th>
                        <th>Tổng số câu</th>
                        <th>Điểm</th>
                        <th>Thời gian làm</th>
                    </tr>
                    <?php while ($row = $results->fetch_assoc()): ?>
                        <tr>
                            <td><?php echo $row['start_time']; ?></td>
                            <td><?php echo htmlspecialchars($row['subject']); ?></td>
                            <td><?php echo $row['correct_answer']; ?></td>
                            <td><?php echo $row['total_question']; ?></td>
                            <td><?php echo $row['score']; ?>/10</td>
                            <td>
                                <?php 
                                    $start = strtotime($row['start_time']);
                                    $end = strtotime($row['end_time']);
                                    $time = $end - $start;
                                    $time_spent = max(0, $time);

                                    $minutes = floor($time_spent / 60);
                                    $seconds = $time_spent % 60;

                                    echo $minutes . " phút " . $seconds . " giây";
                                ?>

                            </td>
                        </tr>
                    <?php endwhile; ?>
                </table>
            <?php else: ?>
                <p>Bạn chưa có kết quả thi nào.</p>
            <?php endif; ?>
        </div>
    </section>
</main>

<footer>
    <p>&copy; 2025 Hệ Thống Thi Trực Tuyến. Tất cả quyền được bảo lưu.</p>
</footer>
</body>
</html>

<script src="js/state.js"></script>
<script src="js/utils.js"></script>
<script src="js/navigation.js"></script>
<script src="js/exam.js"></script>
