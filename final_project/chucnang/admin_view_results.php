<?php
session_start();
include_once __DIR__ . '/config/db.php';

// Kiểm tra quyền admin
if (!isset($_SESSION['username']) || empty($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header('HTTP/1.1 403 Forbidden');
    echo '<h2>Quyền truy cập bị từ chối. Vui lòng đăng nhập bằng tài khoản admin.</h2>';
    exit();
}

// Xử lý lọc / tìm kiếm / phân trang
$search = isset($_GET['search']) ? trim($_GET['search']) : '';
$page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
$per_page = 20;
$offset = ($page - 1) * $per_page;

// Đếm tổng
$count_sql = "SELECT COUNT(r.id) as total
              FROM results r
              LEFT JOIN users u ON u.id = r.user_id
              LEFT JOIN exams e ON e.exam_id = r.exam_id
              WHERE 1";
$params = [];
if ($search !== '') {
    $count_sql .= " AND (u.username LIKE ? OR u.email LIKE ? OR e.title LIKE ? )";
    $like = "%" . $search . "%";
    $params = [$like, $like, $like];
}

$stmt = $conn->prepare($count_sql);
if ($params) {
    $stmt->bind_param(str_repeat('s', count($params)), ...$params);
}
$stmt->execute();
$count_res = $stmt->get_result()->fetch_assoc();
$total = intval($count_res['total']);
$total_pages = max(1, ceil($total / $per_page));

// Lấy danh sách
$list_sql = "SELECT r.*, u.username, u.email, e.title as exam_title
             FROM results r
             LEFT JOIN users u ON u.id = r.user_id
             LEFT JOIN exams e ON e.exam_id = r.exam_id
             WHERE 1";
if ($search !== '') {
    $list_sql .= " AND (u.username LIKE ? OR u.email LIKE ? OR e.title LIKE ? )";
}
$list_sql .= " ORDER BY r.end_time DESC LIMIT ? OFFSET ?";

$stmt2 = $conn->prepare($list_sql);
if ($search !== '') {
    $like = "%" . $search . "%";
    $stmt2->bind_param('sssii', $like, $like, $like, $per_page, $offset);
} else {
    $stmt2->bind_param('ii', $per_page, $offset);
}

$stmt2->execute();
$result = $stmt2->get_result();

?>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin - Xem kết quả bài thi</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/index.css" rel="stylesheet">
</head>
<body class="bg-light">
  <header>
        <div class="header-container">
            <div class="logo">ThiTrựcTuyến.vn</div>
            <nav>
                <ul>
                    <li><a href="" onclick="showPage('home')">Trang chủ</a></li>
                    <li><a href="exam_list.php">Danh sách đề thi</a></li>
                    <li><a href="result.php">Kết quả</a></li>
                </ul>
            </nav>
            <div class="auth-buttons">
                <a class="btn btn-profie" href="profile.php">Trang cá nhân</a>
            </div>
        </div>
  </header>
  <div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h3>Danh sách kết quả bài thi</h3>
    </div>

    <form class="row g-2 mb-3" method="get">
      <div class="col-auto">
        <input type="text" name="search" class="form-control" placeholder="user/email/tên đề" value="<?= htmlspecialchars($search) ?>">
      </div>
      <div class="col-auto">
        <button class="btn btn-primary">Tìm</button>
      </div>
    </form>

    <div class="table-responsive bg-white p-3 rounded shadow-sm">
      <table class="table table-striped table-hover">
        <thead>
          <tr>
            <th>#</th>
            <th>User</th>
            <th>Đề thi</th>
            <th>Điểm</th>
            <th>Đúng / Tổng</th>
            <th>Bắt đầu</th>
            <th>Kết thúc</th>
            <th>Hành động</th>
          </tr>
        </thead>
        <tbody>
        <?php $i = $offset + 1; while ($row = $result->fetch_assoc()): ?>
          <tr>
            <td><?= $i++ ?></td>
            <td>
              <strong><?= htmlspecialchars($row['username']) ?></strong><br>
              <small><?= htmlspecialchars($row['email']) ?></small>
            </td>
            <td><?= htmlspecialchars($row['exam_title'] ?? '—') ?></td>
            <td><?= htmlspecialchars($row['score']) ?></td>
            <td><?= htmlspecialchars($row['correct_answer']) ?> / <?= htmlspecialchars($row['total_question']) ?></td>
            <td><?= htmlspecialchars($row['start_time']) ?></td>
            <td><?= htmlspecialchars($row['end_time']) ?></td>
            <td>
              <!--<a class="btn btn-sm btn-outline-primary" href="admin_view_result_detail.php?id=<?= $row['id'] ?>">Xem</a> -->
              <a class="btn btn-sm btn-outline-danger" href="admin_delete_result.php?id=<?= $row['id'] ?>" onclick="return confirm('Xác nhận xóa kết quả này?');">Xóa</a>
            </td>
          </tr>
        <?php endwhile; ?>
        </tbody>
      </table>

      <!-- Pagination -->
      <nav aria-label="Page navigation">
        <ul class="pagination">
          <?php for ($p = 1; $p <= $total_pages; $p++): ?>
            <li class="page-item <?= $p == $page ? 'active' : '' ?>">
              <a class="page-link" href="?page=<?= $p ?>&search=<?= urlencode($search) ?>"><?= $p ?></a>
            </li>
          <?php endfor; ?>
        </ul>
      </nav>
    </div>
  </div>
</body>
</html>
