<?php
include("database.php");

// Danh sách bảng theo môn
$tables = [
    'math' => 'question_math',
    'chemistry_8' => 'question_chemistry_8',
    'chemistry_9' => 'question_chemistry_9',
    'chemistry_10' => 'question_chemistry_10',
    'chemistry_11' => 'question_chemistry_11',
    'chemistry_12' => 'question_chemistry_12',
    'physics_6'=> 'question_physics_6',
    'physics_7'=> 'question_physics_7',
    'physics_8'=> 'question_physics_8',
    'physics_9'=> 'question_physics_9',
    'physics_10'=> 'question_physics_10',
    'physics_11'=> 'question_physics_11',
    'physics_12'=> 'question_physics_12',
    'English_6'=> 'question_english_6',
    'English_7'=> 'question_english_7',
    'English_8'=> 'question_english_8',
    'English_9'=> 'question_english_9',
    'English_10'=> 'question_english_10',
    'English_11'=> 'question_english_11',
    'English_12'=> 'question_english_12',
];

// Nếu chưa chọn môn → hiển thị giao diện chọn môn
if (!isset($_GET['subject'])) {
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ Thống Thi Trực Tuyến</title>
    <link rel="stylesheet" href="index1.css">
</head>
<body>
    <!-- Header -->
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

    <!-- Main Content -->
    <main>
        <!-- Trang danh sách đề thi -->
        <section id="exam-list" class="page">
            <div class="exams-header">
                <h2>Danh sách đề thi</h2>
                <div class="exams-controls">
                    <select class="exams-list" id="subject-filter">
                        <option value="all">Tất cả môn</option>
                        <option value="math">Toán học</option>
                        <option value="physics">Vật lý</option>
                        <option value="chemistry">Hóa học</option>
                        <option value="english">Tiếng Anh</option>
                    </select>
                    <button class="btn btn-primary" onclick="showPage('add-exam')">
                        <i class="fas fa-plus"></i> Thêm đề thi mới
                    </button>
                </div>
            </div>
            
            <div class="exams-grid">
                <!-- Danh sách đề thi sẽ được load bằng JS -->
            </div>
        </section>
    </main>

<div class="exams-header">
    <h2>Danh sách đề thi</h2>
    <select id="subject-filter" onchange="filterExams()">
        <option value="all">Tất cả môn</option>
        <option value="math">Toán học</option>
        <option value="chemistry_8">Hóa học Lớp 8</option>
        <option value="chemistry_9">Hóa học Lớp 9</option>
        <option value="chemistry_10">Hóa học Lớp 10</option>
        <option value="chemistry_11">Hóa học Lớp 11</option>
        <option value="chemistry_12">Hóa học Lớp 12</option>
        <option value="math-TuLuan">Toán Tự luận</option>
        <option value="physics_6">Vật Lý Lớp 6</option>
        <option value="physics_7">Vật Lý Lớp 7</option>
        <option value="physics_8">Vật Lý Lớp 8</option>
        <option value="physics_9">Vật Lý Lớp 9</option>
        <option value="physics_10">Vật Lý Lớp 10</option>
        <option value="physics_11">Vật Lý Lớp 11</option>
        <option value="physics_12">Vật Lý Lớp 12</option>
        <option value="English_6">Anh văn Lớp 6</option>
        <option value="English_7">Anh văn Lớp 7</option>
        <option value="English_8">Anh văn Lớp 8</option>
        <option value="English_9">Anh văn Lớp 9</option>
        <option value="English_10">Anh văn Lớp 10</option>
        <option value="English_11">Anh văn Lớp 11</option>
        <option value="English_12">Anh văn Lớp 12</option>
    </select>
</div>

<div class="exams-grid" id="exam-list">
    <!-- Card Toán -->
    <div class="exam-card" data-subject="math">
        <div class="exam-header"><h3>Toán học - Kiểm tra </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('math')">Bắt đầu thi</button>
        </div>
    </div>

    <!-- Card Toán tự luận -->
    <div class="exam-card" data-subject="math-TuLuan">
        <div class="exam-header"><h3>Toán học - Tự Luận</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>20 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="window.location.href='math_tu_luan.php'">Bắt đầu thi</button>
        </div>
    </div>

    <!-- Card Hóa -->
    <div class="exam-card" data-subject="chemistry_8">
        <div class="exam-header"><h3>Hóa Học - Lớp 8 </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Dễ</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('chemistry_8')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="chemistry_9">
        <div class="exam-header"><h3>Hóa Học - Lớp 9 </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Dễ</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('chemistry_9')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="chemistry_10">
        <div class="exam-header"><h3>Hóa Học - Lớp 10 </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('chemistry_10')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="chemistry_11">
        <div class="exam-header"><h3>Hóa Học - Lớp 11 </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('chemistry_11')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="chemistry_12">
        <div class="exam-header"><h3>Hóa Học - Lớp 12 </h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('chemistry_12')">Bắt đầu thi</button>
        </div>
    </div>

    <!-- Card Vật lý lớp 6 -->
    <div class="exam-card" data-subject="physics_6">
        <div class="exam-header"><h3>Vật lý - lớp 6</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Dễ</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_6')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_7">
        <div class="exam-header"><h3>Vật lý - lớp 7</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung Bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_7')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_8">
        <div class="exam-header"><h3>Vật lý - lớp 8</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung Bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_8')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_9">
        <div class="exam-header"><h3>Vật lý - lớp 9</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_9')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_10">
        <div class="exam-header"><h3>Vật lý - lớp 10</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_10')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_11">
        <div class="exam-header"><h3>Vật lý - lớp 11</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_11')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="physics_12">
        <div class="exam-header"><h3>Vật lý - lớp 12</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('physics_12')">Bắt đầu thi</button>
        </div>
    </div>


    <!-- Card Tiếng Anh -->
    <div class="exam-card" data-subject="English_6">
        <div class="exam-header"><h3>Anh Văn - lớp 6</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Dễ</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_6')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_7">
        <div class="exam-header"><h3>Anh Văn - lớp 7</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_7')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_8">
        <div class="exam-header"><h3>Anh Văn - lớp 8</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_8')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_9">
        <div class="exam-header"><h3>Anh Văn - lớp 9</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_9')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_10">
        <div class="exam-header"><h3>Anh Văn - lớp 10</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Trung bình</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_10')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_11">
        <div class="exam-header"><h3>Anh Văn - lớp 11</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_11')">Bắt đầu thi</button>
        </div>
    </div>

    <div class="exam-card" data-subject="English_12">
        <div class="exam-header"><h3>Anh Văn - lớp 12</h3></div>
        <div class="exam-body">
            <div class="exam-info"><span>Số câu:</span><span>40 câu</span></div>
            <div class="exam-info"><span>Thời gian:</span><span>60 phút</span></div>
            <div class="exam-info"><span>Độ khó:</span><span>Khó</span></div>
        </div>
        <div class="exam-footer">
            <button class="btn btn-primary" onclick="startExam('English_12')">Bắt đầu thi</button>
        </div>
    </div>


<script src="index1.js"></script>
</body>
</html>

<?php
exit;
}