-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 02, 2025 lúc 03:27 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `user_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `quyen` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `quyen`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'editor');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bai_toan_tu_luan`
--

CREATE TABLE `bai_toan_tu_luan` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `EXPLAIN_QUESTION` text NOT NULL,
  `CORRECT_OPTION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bai_toan_tu_luan`
--

INSERT INTO `bai_toan_tu_luan` (`ID`, `SUBJECT`, `QUESTION`, `EXPLAIN_QUESTION`, `CORRECT_OPTION`) VALUES
(1, '0', 'Tính: 125 ÷ 5 + 36 × 2.', '125 ÷ 5 = 25; 36 × 2 = 72 ⇒ 25 + 72 = 97', '97'),
(2, '0', 'Rút gọn phân số: 84/126.', 'Chia cả tử và mẫu cho 42: 84/126 = 2/3.', '2/3'),
(3, '0', 'Giải phương trình: 2x + 7 = 19.', '2x = 19 − 7 = 12 ⇒ x = 6.', '6'),
(4, '0', 'Tìm số tự nhiên x biết: 5x − 12 = 28.', '5x = 28 + 12 = 40 ⇒ x = 8.', '8'),
(5, '0', 'Một hình chữ nhật có chiều dài 15 cm, chiều rộng bằng 2/5 chiều dài. Tính chu vi và diện tích.', 'Chiều rộng: 15 × 2/5 = 6 cm. Chu vi: 2(15 + 6) = 42 cm. Diện tích: 15 × 6 = 90 cm².', '90 cm²'),
(6, '0', 'Giải phương trình: 7x − 5 = 3x + 15.', '7x − 3x = 15 + 5 ⇒ 4x = 20 ⇒ x = 5.', '5'),
(7, '0', 'Rút gọn biểu thức: (x² − 16)/(x² − 8x + 16).', 'x² − 16 = (x − 4)(x + 4); x² − 8x + 16 = (x − 4)² ⇒ (x + 4)/(x − 4), điều kiện x ≠ 4.', '(x + 4)/(x − 4), điều kiện x ≠ 4.'),
(8, '0', 'Lớp 6A có 42 học sinh, tỉ lệ nam : nữ = 4 : 3. Hỏi số nam, số nữ?', 'x² − 16 = (x − 4)(x + 4); x² − 8x + 16 = (x − 4)² ⇒ (x + 4)/(x − 4), điều kiện x ≠ 4.', 'Nam: 4×6 = 24, Nữ: 3×6 = 18.'),
(9, '0', 'Một hình tròn có bán kính r = 10 cm. Tính chu vi và diện tích (π = 3,14).', 'Chu vi: C = 2πr = 2×3,14×10 = 62,8 cm. Diện tích: S = πr² = 3,14×100 = 314 cm².', 'C = 62,8 cm , S = 314 cm².'),
(10, '0', 'Giải hệ: { x + y = 20 ; 2x − y = 10 }', 'Cộng 2 phương trình: 3x = 30 ⇒ x = 10. Thay vào x + y = 20 ⇒ y = 10. => (x, y) = (10, 10).', '(x, y) = (10, 10).'),
(11, '0', 'Giải phương trình: 3x + 5 = 2x + 12.', '0', '3x − 2x = 12 − 5 ⇒ x = 7.'),
(12, '0', 'Giải bất phương trình: 4x − 7 > 9.', '0', '4x > 16 ⇒ x > 4.'),
(13, '0', 'Một tam giác có chiều cao 8 cm, đáy dài 12 cm. Tính diện tích.', '0', 'S = 1/2 × đáy × cao = 1/2 × 12 × 8 = 48 cm².'),
(14, '0', 'Một hình hộp chữ nhật có kích thước 4 × 5 × 6 cm. Tính thể tích.', '0', 'V = a × b × c = 4×5×6 = 120 cm³.'),
(15, '0', 'Tính giá trị A = (2x² − 8)/(x − 2) với x = 3.', '0', 'Thế x = 3: tử = 2×9 − 8 = 10; mẫu = 3 − 2 = 1 ⇒ A = 10/1 = 10.'),
(16, '0', 'Giải phương trình: (3x − 2)/(x − 1) = 4.', '0', '3x − 2 = 4x − 4 ⇒ −x + 2 = −4 ⇒ x = 2 (đk x ≠ 1).'),
(17, '0', 'Tính diện tích tam giác vuông có cạnh góc vuông 9 cm và 12 cm.', '0', 'S = 1/2 × 9 × 12 = 54 cm².'),
(18, '0', 'Mảnh vườn 30 m × 20 m, có lối đi quanh rộng 1 m. Tính diện tích lối đi.', '0', 'Kích thước ngoài: (30+2) × (20+2) = 32×22 = 704 m²; Diện tích vườn: 30×20 = 600 m² ⇒ Lối đi = 704 − 600 = 104 m².'),
(19, '0', 'Một xe máy đi từ A đến B hết 2 giờ với vận tốc 45 km/h. Tính quãng đường AB.', '0', 'S = v × t = 45 × 2 = 90 km.'),
(20, '0', 'Một hình lập phương có thể tích 512 cm³. Tính độ dài cạnh.', '0', 'a³ = 512 ⇒ a = 8 (vì 8³ = 512).');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `essay_questions`
--

CREATE TABLE `essay_questions` (
  `question_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `question_text` text DEFAULT NULL,
  `answer` text NOT NULL,
  `question_type` varchar(50) NOT NULL,
  `difficulty` enum('easy','medium','hard') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `essay_questions`
--

INSERT INTO `essay_questions` (`question_id`, `exam_id`, `question_text`, `answer`, `question_type`, `difficulty`, `created_at`) VALUES
(7, 6, 'Viết phương trình hóa học của phản ứng giữa natri (Na) và nước (H₂O).', '2Na + 2H₂O → 2NaOH + H₂↑', 'tu_luan', '', '2025-09-02 07:40:17'),
(8, 6, 'Giải thích tại sao khí CO₂ lại làm nước vôi trong (Ca(OH)₂) bị vẩn đục.', 'CO₂ + Ca(OH)₂ → CaCO₃↓ + H₂O', 'tu_luan', '', '2025-09-02 07:40:17'),
(9, 6, 'Viết phương trình hóa học của phản ứng giữa axit HCl và Na₂CO₃.', '2HCl + Na₂CO₃ → 2NaCl + CO₂↑ + H₂O', 'tu_luan', '', '2025-09-02 07:40:17'),
(10, 6, 'Khi nhúng một thanh đồng vào dung dịch AgNO₃, hiện tượng gì xảy ra và tại sao?', 'Không có hiện tượng, vì đồng ít hoạt động hơn bạc, không thể thay thế bạc ra khỏi hợp chất.', 'tu_luan', '', '2025-09-02 07:40:17'),
(11, 6, 'Tính khối lượng NaOH cần dùng để trung hòa 100 ml dung dịch HCl 0,5M.', 'n(HCl) = 0,1 × 0,5 = 0,05 mol → m(NaOH) = 0,05 × 40 = 2 g', 'tu_luan', '', '2025-09-02 07:40:17'),
(12, 6, 'Viết phương trình hóa học của phản ứng giữa Al và dung dịch HCl.', '2Al + 6HCl → 2AlCl₃ + 3H₂↑', 'tu_luan', '', '2025-09-02 07:40:17'),
(13, 6, 'Giải thích tại sao nước cứng gây ra hiện tượng cáu cặn khi đun sôi.', 'Ca(HCO₃)₂ → CaCO₃↓ + CO₂↑ + H₂O', 'tu_luan', '', '2025-09-02 07:40:17'),
(14, 6, 'Viết phương trình hóa học khi kim loại K tác dụng với nước.', '2K + 2H₂O → 2KOH + H₂↑', 'tu_luan', '', '2025-09-02 07:40:17'),
(15, 6, 'Tính thể tích CO₂ (ở điều kiện chuẩn) thu được khi cho 5,6 g NaHCO₃ phản ứng với HCl dư.', 'n(NaHCO₃) = 5,6/84 = 0,0667 mol → n(CO₂) = 0,0667 mol → V = 0,0667 × 22,4 ≈ 1,49 lít', 'tu_luan', '', '2025-09-02 07:40:17'),
(16, 6, 'Viết phương trình hóa học của phản ứng phân hủy CaCO₃ khi nung.', 'CaCO₃ → CaO + CO₂↑', 'tu_luan', '', '2025-09-02 07:40:17'),
(17, 11, 'Tính: 125 ÷ 5 + 36 × 2.', '125 ÷ 5 = 25; 36 × 2 = 72 ⇒ 25 + 72 = 97.', '', 'easy', '2025-09-02 10:55:43'),
(18, 11, 'Rút gọn phân số: 84/126.', 'Chia cả tử và mẫu cho 42: 84/126 = 2/3.', '', 'easy', '2025-09-02 10:55:43'),
(19, 11, 'Giải phương trình: 2x + 7 = 19.', '2x = 19 − 7 = 12 ⇒ x = 6.', '', 'easy', '2025-09-02 10:55:43'),
(20, 11, 'Tìm số tự nhiên x biết: 5x − 12 = 28.', '5x = 28 + 12 = 40 ⇒ x = 8.', '', 'easy', '2025-09-02 10:55:43'),
(21, 11, 'Một hình chữ nhật có chiều dài 15 cm, chiều rộng bằng 2/5 chiều dài. Tính chu vi và diện tích.', 'Chiều rộng: 15 × 2/5 = 6 cm. Chu vi: 2(15 + 6) = 42 cm. Diện tích: 15 × 6 = 90 cm².', '', 'easy', '2025-09-02 10:55:43'),
(22, 11, 'Giải phương trình: 7x − 5 = 3x + 15.', '7x − 3x = 15 + 5 ⇒ 4x = 20 ⇒ x = 5.', '', 'easy', '2025-09-02 10:55:43'),
(23, 11, 'Rút gọn biểu thức: (x² − 16)/(x² − 8x + 16).', 'x² − 16 = (x − 4)(x + 4); x² − 8x + 16 = (x − 4)² ⇒ (x + 4)/(x − 4), điều kiện x ≠ 4.', '', 'easy', '2025-09-02 10:55:43'),
(24, 11, 'Lớp 6A có 42 học sinh, tỉ lệ nam : nữ = 4 : 3. Hỏi số nam, số nữ?', 'Tổng phần: 4 + 3 = 7 phần ⇒ 1 phần = 42/7 = 6. Nam: 4×6 = 24; Nữ: 3×6 = 18.', '', 'easy', '2025-09-02 10:55:43'),
(25, 11, 'Một hình tròn có bán kính r = 10 cm. Tính chu vi và diện tích (π = 3,14).', 'Chu vi: C = 2πr = 2×3,14×10 = 62,8 cm. Diện tích: S = πr² = 3,14×100 = 314 cm².', '', 'easy', '2025-09-02 10:55:43'),
(26, 11, 'Giải hệ: { x + y = 20 ; 2x − y = 10 }', 'Cộng 2 phương trình: 3x = 30 ⇒ x = 10. Thay vào x + y = 20 ⇒ y = 10. => (x, y) = (10, 10).', '', 'easy', '2025-09-02 10:55:43'),
(27, 11, 'Giải phương trình: 3x + 5 = 2x + 12.', '3x − 2x = 12 − 5 ⇒ x = 7.', '', 'easy', '2025-09-02 10:55:43'),
(28, 11, 'Giải bất phương trình: 4x − 7 > 9.', '4x > 16 ⇒ x > 4.', '', 'easy', '2025-09-02 10:55:43'),
(29, 11, 'Một tam giác có chiều cao 8 cm, đáy dài 12 cm. Tính diện tích.', 'S = 1/2 × đáy × cao = 1/2 × 12 × 8 = 48 cm².', '', 'easy', '2025-09-02 10:55:43'),
(30, 11, 'Một hình hộp chữ nhật có kích thước 4 × 5 × 6 cm. Tính thể tích.', 'V = a × b × c = 4×5×6 = 120 cm³.', '', 'easy', '2025-09-02 10:55:43'),
(31, 11, 'Tính giá trị A = (2x² − 8)/(x − 2) với x = 3.', 'Thế x = 3: tử = 2×9 − 8 = 10; mẫu = 3 − 2 = 1 ⇒ A = 10/1 = 10.', '', 'easy', '2025-09-02 10:55:43'),
(32, 11, 'Giải phương trình: (3x − 2)/(x − 1) = 4.', '3x − 2 = 4x − 4 ⇒ −x + 2 = −4 ⇒ x = 2 (đk x ≠ 1).', '', 'easy', '2025-09-02 10:55:43'),
(33, 11, 'Tính diện tích tam giác vuông có cạnh góc vuông 9 cm và 12 cm.', 'S = 1/2 × 9 × 12 = 54 cm².', '', 'easy', '2025-09-02 10:55:43'),
(34, 11, 'Mảnh vườn 30 m × 20 m, có lối đi quanh rộng 1 m. Tính diện tích lối đi.', 'Kích thước ngoài: (30+2) × (20+2) = 32×22 = 704 m²; Diện tích vườn: 30×20 = 600 m² ⇒ Lối đi = 704 − 600 = 104 m².', '', 'easy', '2025-09-02 10:55:43'),
(35, 11, 'Một xe máy đi từ A đến B hết 2 giờ với vận tốc 45 km/h. Tính quãng đường AB.', 'S = v × t = 45 × 2 = 90 km.', '', 'easy', '2025-09-02 10:55:43'),
(36, 11, 'Một hình lập phương có thể tích 512 cm³. Tính độ dài cạnh.', 'a³ = 512 ⇒ a = 8 (vì 8³ = 512).', '', 'easy', '2025-09-02 10:55:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `num_questions` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `difficulty` enum('easy','medium','hard') NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` text NOT NULL,
  `exam_type` enum('tracnghiem','tuluan') NOT NULL DEFAULT 'tracnghiem'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `exams`
--

INSERT INTO `exams` (`exam_id`, `title`, `subject`, `num_questions`, `time`, `difficulty`, `description`, `created_at`, `created_by`, `exam_type`) VALUES
(1, 'thi giữa kỳ', 'math', 20, 40, 'easy', '', '0000-00-00 00:00:00', '', 'tracnghiem'),
(2, 'English - 20 câu', 'english', 20, 40, 'easy', '', '0000-00-00 00:00:00', '', 'tracnghiem'),
(4, 'Vật Lý - thường xuyên', 'math', 20, 40, 'medium', '', '0000-00-00 00:00:00', '', 'tracnghiem'),
(6, 'Hóa - giữa kỳ', 'chemistry', 10, 20, 'medium', '', '0000-00-00 00:00:00', '', 'tuluan'),
(11, 'Toán - tự luận', 'math', 20, 60, 'hard', '', '2025-09-02 10:51:33', '12', 'tuluan'),
(12, 'Vật lý - tự luận', 'physics', 10, 20, '', '', '2025-09-02 13:21:15', '12', 'tracnghiem');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` enum('A','B','C','D') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`question_id`, `exam_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `created_at`) VALUES
(6, 1, '2 + 3 = ?', '4', '5', '6', '7', 'B', '2025-09-01 07:27:01'),
(7, 1, '7 – 4 = ?', '2', '3', '4', '5', 'B', '2025-09-01 07:27:01'),
(8, 1, '5 × 3 = ?', '15', '10', '8', '12', 'A', '2025-09-01 07:27:01'),
(9, 1, '12 ÷ 4 = ?', '2', '3', '4', '6', 'B', '2025-09-01 07:27:01'),
(10, 1, '9 + 6 = ?', '14', '15', '16', '17', 'B', '2025-09-01 07:27:01'),
(11, 1, '8 – 5 = ?', '2', '3', '4', '5', 'B', '2025-09-01 07:27:01'),
(12, 1, '4 × 6 = ?', '20', '24', '22', '26', 'B', '2025-09-01 07:27:01'),
(13, 1, '18 ÷ 3 = ?', '5', '6', '7', '8', 'B', '2025-09-01 07:27:01'),
(14, 1, '7 + 8 = ?', '14', '15', '16', '17', 'C', '2025-09-01 07:27:01'),
(15, 1, '15 – 9 = ?', '5', '6', '7', '8', 'B', '2025-09-01 07:27:01'),
(16, 1, '3 × 7 = ?', '20', '21', '22', '23', 'B', '2025-09-01 07:27:01'),
(17, 1, '24 ÷ 8 = ?', '2', '3', '4', '5', 'B', '2025-09-01 07:27:01'),
(18, 1, '6 + 9 = ?', '14', '15', '16', '17', 'B', '2025-09-01 07:27:01'),
(19, 1, '10 – 4 = ?', '5', '6', '7', '8', 'B', '2025-09-01 07:27:01'),
(20, 1, '5 × 5 = ?', '20', '25', '30', '35', 'B', '2025-09-01 07:27:01'),
(21, 1, '16 ÷ 4 = ?', '3', '4', '5', '6', 'B', '2025-09-01 07:27:01'),
(22, 1, '8 + 7 = ?', '14', '15', '16', '17', 'D', '2025-09-01 07:27:01'),
(23, 1, '12 – 7 = ?', '4', '5', '6', '7', 'B', '2025-09-01 07:27:01'),
(24, 1, '9 × 2 = ?', '16', '17', '18', '19', 'C', '2025-09-01 07:27:01'),
(25, 1, '20 ÷ 5 = ?', '4', '5', '6', '7', 'B', '2025-09-01 07:27:01'),
(46, 2, 'What is the plural of \"child\"?', 'childs', 'children', 'childes', 'child', 'B', '2025-09-01 09:06:46'),
(47, 2, 'Choose the correct verb: She ____ to school every day.', 'go', 'goes', 'going', 'gone', 'B', '2025-09-01 09:06:46'),
(48, 2, 'I ____ my homework yesterday.', 'do', 'did', 'does', 'done', 'B', '2025-09-01 09:06:46'),
(49, 2, 'Choose the correct article: I saw ___ cat on the roof.', 'a', 'an', 'the', 'no article', 'C', '2025-09-01 09:06:46'),
(50, 2, 'Select the correct synonym of \"happy\"', 'sad', 'angry', 'joyful', 'tired', 'C', '2025-09-01 09:06:46'),
(51, 2, 'Fill in: I have ___ apple.', 'a', 'an', 'the', 'no article', 'B', '2025-09-01 09:06:46'),
(52, 2, 'Choose the correct preposition: He is good ___ math.', 'in', 'at', 'on', 'for', 'B', '2025-09-01 09:06:46'),
(53, 2, 'What is the opposite of \"fast\"?', 'slow', 'quick', 'rapid', 'swift', 'A', '2025-09-01 09:06:46'),
(54, 2, 'Select the correct past form: They ____ to the park.', 'go', 'went', 'gone', 'going', 'B', '2025-09-01 09:06:46'),
(55, 2, 'Which word is a noun?', 'run', 'quickly', 'happiness', 'blue', 'C', '2025-09-01 09:06:46'),
(56, 2, 'Choose correct sentence: \"She can sings well.\"', 'She can sings well.', 'She can sing well.', 'She can sang well.', 'She can song well.', 'B', '2025-09-01 09:06:46'),
(57, 2, 'Fill in: I am interested ___ music.', 'in', 'on', 'at', 'for', 'A', '2025-09-01 09:06:46'),
(58, 2, 'Select the correct plural: mouse', 'mouses', 'mice', 'mouse', 'meese', 'B', '2025-09-01 09:06:46'),
(59, 2, 'Choose the correct tense: He ___ TV now.', 'watches', 'watch', 'is watching', 'watched', 'C', '2025-09-01 09:06:46'),
(60, 2, 'Opposite of \"easy\"?', 'hard', 'simple', 'light', 'small', 'A', '2025-09-01 09:06:46'),
(61, 2, 'Fill in: We ___ going to the cinema.', 'is', 'are', 'am', 'be', 'B', '2025-09-01 09:06:46'),
(62, 2, 'Choose correct: I have never ___ to London.', 'go', 'went', 'gone', 'been', 'D', '2025-09-01 09:06:46'),
(63, 2, 'What is the comparative of \"good\"?', 'better', 'best', 'gooder', 'more good', 'A', '2025-09-01 09:06:46'),
(64, 2, 'Fill in: She has two brothers ___ one sister.', 'and', 'or', 'but', 'so', 'A', '2025-09-01 09:06:46'),
(65, 2, 'Select the correct question: ___ you like pizza?', 'Do', 'Does', 'Are', 'Is', 'A', '2025-09-01 09:06:46'),
(106, 4, 'Unit of force is?', 'Newton', 'Joule', 'Watt', 'Pascal', 'A', '2025-09-01 09:15:27'),
(107, 4, 'Speed formula?', 's = v/t', 'v = s/t', 't = s/v', 'a = v/t', 'B', '2025-09-01 09:15:27'),
(108, 4, 'Acceleration unit?', 'm/s²', 'm/s', 'm²/s', 'kg', 'A', '2025-09-01 09:15:27'),
(109, 4, 'Weight formula?', 'W = mg', 'W = mv', 'W = m/g', 'W = m + g', 'A', '2025-09-01 09:15:27'),
(110, 4, 'Energy unit?', 'Joule', 'Newton', 'Watt', 'Pascal', 'A', '2025-09-01 09:15:27'),
(111, 4, 'Velocity formula?', 'v = s/t', 'v = t/s', 'v = s×t', 'v = s + t', 'A', '2025-09-01 09:15:27'),
(112, 4, '1 km = ? m', '100', '1000', '10', '10000', 'B', '2025-09-01 09:15:27'),
(113, 4, 'Light speed approx?', '3×10^8 m/s', '3×10^6 m/s', '3×10^5 m/s', '3×10^3 m/s', 'A', '2025-09-01 09:15:27'),
(114, 4, 'Gravity acceleration on Earth?', '9.8 m/s²', '10 m/s²', '9.8 m/s', '10 m/s', 'A', '2025-09-01 09:15:27'),
(115, 4, 'Which is scalar quantity?', 'Velocity', 'Speed', 'Force', 'Momentum', 'B', '2025-09-01 09:15:27'),
(116, 4, 'Which is vector quantity?', 'Speed', 'Distance', 'Displacement', 'Time', 'C', '2025-09-01 09:15:27'),
(117, 4, 'Ohm’s law formula?', 'V = IR', 'P = IV', 'E = mc²', 'F = ma', 'A', '2025-09-01 09:15:27'),
(118, 4, 'Unit of power?', 'Watt', 'Joule', 'Newton', 'Pascal', 'A', '2025-09-01 09:15:27'),
(119, 4, '1 N = ?', '1 kg·m/s²', '1 kg·m²/s²', '1 kg·m/s', '1 kg·m/s³', 'A', '2025-09-01 09:15:27'),
(120, 4, 'Frequency unit?', 'Hz', 'W', 'J', 'N', 'A', '2025-09-01 09:15:27'),
(121, 4, 'Wavelength formula?', 'λ = v/f', 'λ = f/v', 'λ = v×f', 'λ = v+f', 'A', '2025-09-01 09:15:27'),
(122, 4, 'Potential energy formula?', 'PE = mgh', 'KE = ½ mv²', 'F = ma', 'E = mc²', 'A', '2025-09-01 09:15:27'),
(123, 4, 'Kinetic energy formula?', 'KE = ½ mv²', 'PE = mgh', 'F = ma', 'E = mc²', 'A', '2025-09-01 09:15:27'),
(124, 4, 'Which is SI unit of mass?', 'kg', 'g', 'lb', 'N', 'A', '2025-09-01 09:15:27'),
(125, 4, 'Momentum formula?', 'p = mv', 'F = ma', 'E = mc²', 'KE = ½ mv²', 'A', '2025-09-01 09:15:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `score` float NOT NULL,
  `total_question` int(11) NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `start_time` datetime NOT NULL DEFAULT current_timestamp(),
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `results`
--

INSERT INTO `results` (`id`, `user_id`, `exam_id`, `score`, `total_question`, `correct_answer`, `start_time`, `end_time`) VALUES
(3, 0, 0, 1, 40, 6, '2025-08-21 14:45:02', '2025-09-02 15:00:02'),
(4, 0, 0, 10, 40, 40, '2025-08-21 14:46:07', '2025-09-02 15:01:07'),
(5, 1, 0, 0, 20, 0, '2025-08-21 15:14:25', '2025-09-02 15:14:25'),
(6, 1, 0, 0, 20, 0, '2025-08-21 15:15:02', '2025-09-02 15:15:02'),
(7, 0, 0, 0, 20, 0, '2025-08-21 15:03:19', '2025-09-02 15:18:19'),
(8, 0, 0, 0, 20, 0, '2025-08-21 15:04:55', '2025-09-02 15:19:55'),
(9, 0, 0, 1, 20, 2, '2025-08-21 15:05:50', '2025-09-02 15:20:50'),
(13, 12, 0, 3, 40, 3, '2025-08-28 15:42:56', '2025-09-02 15:42:56'),
(21, 12, 0, 0, 20, 0, '2025-08-28 16:30:19', '2025-09-02 16:36:09'),
(22, 12, 0, 0, 20, 0, '2025-08-28 16:36:30', '2025-09-02 16:36:30'),
(23, 12, 0, 0, 20, 0, '2025-08-28 16:40:52', '2025-09-02 16:40:52'),
(24, 12, 0, 0, 20, 0, '2025-08-28 16:41:18', '2025-09-02 16:41:18'),
(25, 12, 0, 0, 20, 0, '2025-08-28 16:41:55', '2025-09-02 16:41:55'),
(26, 12, 0, 0, 20, 0, '2025-08-28 16:42:10', '2025-09-02 16:42:16'),
(27, 12, 0, 0, 20, 0, '2025-08-28 16:42:35', '2025-09-02 16:42:43'),
(28, 12, 0, 0, 20, 0, '2025-08-28 16:50:47', '2025-09-02 16:50:47'),
(29, 12, 0, 1, 20, 1, '2025-08-28 16:50:56', '2025-09-02 16:50:59'),
(31, 12, 0, 2, 20, 2, '2025-08-28 16:52:37', '2025-09-02 16:52:42'),
(32, 12, 0, 2, 20, 2, '2025-08-28 16:59:02', '2025-09-02 16:59:02'),
(34, 12, 0, 1, 20, 1, '2025-08-28 17:01:17', '2025-09-02 17:01:21'),
(35, 12, 0, 1, 20, 1, '2025-08-28 17:01:56', '2025-09-02 17:01:56'),
(36, 12, 0, 1, 20, 1, '2025-08-28 17:03:23', '2025-09-02 17:03:23'),
(37, 12, 0, 1, 20, 1, '2025-08-28 17:03:57', '2025-09-02 17:03:57'),
(40, 12, 0, 2, 20, 2, '2025-08-29 14:20:34', '2025-09-02 14:20:55'),
(41, 12, 0, 1, 40, 1, '2025-09-01 05:41:13', '2025-09-02 05:41:22'),
(44, 12, 1, 0, 21, 0, '2025-09-01 09:22:34', '2025-09-02 09:37:28'),
(45, 12, 1, 0, 21, 0, '2025-09-01 10:44:39', '2025-09-02 10:44:39'),
(46, 12, 1, 0, 21, 0, '2025-09-01 10:45:26', '2025-09-02 10:45:26'),
(47, 12, 1, 0, 21, 0, '2025-09-01 10:45:43', '2025-09-02 10:45:43'),
(48, 12, 1, 0, 21, 0, '2025-09-01 10:48:45', '2025-09-02 10:48:45'),
(49, 12, 1, 3, 21, 3, '2025-09-01 10:48:50', '2025-09-02 10:48:57'),
(50, 12, 1, 3, 21, 3, '2025-09-01 10:50:16', '2025-09-02 10:50:16'),
(51, 12, 2, 1, 20, 1, '2025-09-01 11:06:56', '2025-09-02 11:07:05'),
(52, 12, 2, 1, 20, 1, '2025-09-01 11:07:25', '2025-09-02 11:07:25'),
(53, 12, 2, 1, 20, 1, '2025-09-01 11:08:56', '2025-09-02 11:08:56'),
(54, 12, 2, 1, 20, 1, '2025-09-01 11:11:42', '2025-09-02 11:11:42'),
(55, 12, 3, 0, 20, 0, '2025-09-01 11:15:33', '2025-09-02 11:15:36'),
(56, 12, 3, 0, 20, 0, '2025-09-01 11:19:01', '2025-09-02 11:19:01'),
(57, 12, 3, 0, 20, 0, '2025-09-01 11:19:41', '2025-09-02 11:19:45'),
(58, 12, 2, 0, 20, 0, '2025-09-01 11:19:48', '2025-09-02 11:22:32'),
(59, 12, 2, 0, 20, 0, '2025-09-01 11:23:55', '2025-09-02 11:23:55'),
(60, 12, 2, 0, 20, 0, '2025-09-01 11:23:57', '2025-09-02 11:43:18'),
(61, 12, 6, 0, 10, 0, '2025-09-01 11:48:40', '2025-09-02 13:10:27'),
(62, 12, 6, 0, 10, 0, '2025-09-01 11:48:40', '2025-09-02 13:10:54'),
(63, 12, 6, 0, 10, 0, '2025-09-01 11:48:40', '2025-09-02 13:11:21'),
(64, 12, 6, 0, 10, 0, '2025-09-01 11:48:40', '2025-09-02 13:11:25'),
(65, 12, 2, 0, 20, 0, '2025-09-01 11:48:40', '2025-09-02 13:17:46'),
(66, 12, 6, 0, 10, 0, '2025-09-01 11:48:40', '2025-09-02 13:18:03'),
(67, 12, 3, 0, 20, 0, '2025-09-01 13:34:54', '2025-09-02 13:35:00'),
(68, 12, 6, 0, 10, 0, '2025-09-01 13:36:35', '2025-09-02 13:36:37'),
(69, 14, 2, 1, 20, 0, '2025-09-01 16:35:08', '2025-09-02 16:35:19'),
(70, 14, 9, 0, 0, 0, '2025-09-01 16:35:36', '2025-09-02 16:37:36'),
(71, 14, 2, 1, 20, 0, '2025-09-01 16:39:37', '2025-09-02 16:39:42'),
(72, 14, 6, 0, 10, 0, '2025-09-01 16:46:56', '2025-09-02 16:48:53'),
(73, 14, 6, 0, 10, 0, '2025-09-01 16:49:16', '2025-09-02 16:49:28'),
(74, 14, 4, 1, 20, 0, '2025-09-01 16:49:47', '2025-09-02 16:49:58'),
(75, 14, 3, 0, 20, 0, '2025-09-01 17:10:03', '2025-09-02 17:10:10'),
(76, 14, 3, 0, 20, 0, '2025-09-01 17:30:03', '2025-09-02 17:30:06'),
(78, 14, 1, 1, 20, 0, '2025-09-01 22:36:10', '2025-09-02 17:36:10'),
(83, 14, 3, 0, 20, 0, '2025-09-01 18:11:09', '2025-09-02 18:12:41'),
(84, 14, 3, 0, 20, 0, '2025-09-01 18:12:58', '2025-09-02 18:15:13'),
(85, 14, 3, 0, 20, 0, '2025-09-01 18:16:28', '2025-09-02 18:16:32'),
(86, 14, 3, 0, 20, 0, '2025-09-01 18:26:04', '2025-09-02 18:27:09'),
(87, 14, 3, 0, 20, 0, '2025-09-01 18:29:27', '2025-09-02 18:30:41'),
(88, 14, 3, 0, 20, 0, '2025-09-01 18:32:17', '2025-09-02 18:32:21'),
(89, 14, 3, 1, 20, 0, '2025-09-01 18:42:54', '2025-09-02 18:42:58'),
(90, 14, 3, 0, 20, 0, '2025-09-01 19:12:18', '2025-09-01 19:12:31'),
(91, 12, 3, 1, 20, 0, '2025-09-02 05:34:54', '2025-09-02 05:34:57'),
(92, 12, 2, 1, 20, 0, '2025-09-02 08:57:04', '2025-09-02 09:06:32'),
(93, 12, 3, 0, 20, 0, '2025-09-02 14:11:04', '2025-09-02 14:11:07'),
(94, 13, 3, 2, 20, 0, '2025-09-02 14:12:13', '2025-09-02 14:13:18'),
(95, 13, 6, 0, 10, 0, '2025-09-02 14:35:07', '2025-09-02 14:35:24'),
(96, 14, 3, 0, 20, 0, '2025-09-02 14:42:51', '2025-09-02 14:42:54'),
(97, 14, 6, 0, 10, 0, '2025-09-02 14:42:58', '2025-09-02 14:43:22'),
(98, 14, 9, 0, 0, 0, '2025-09-02 14:43:37', '2025-09-02 14:43:38'),
(99, 14, 9, 0, 0, 0, '2025-09-02 14:47:21', '2025-09-02 14:47:21'),
(100, 14, 9, 0, 0, 0, '2025-09-02 14:56:20', '2025-09-02 14:56:23'),
(101, 14, 3, 0, 20, 0, '2025-09-02 14:56:35', '2025-09-02 14:56:48'),
(102, 13, 6, 0, 10, 0, '2025-09-02 15:01:07', '2025-09-02 15:03:32'),
(103, 12, 11, 0, 20, 0, '2025-09-02 17:56:22', '2025-09-02 17:56:45'),
(104, 12, 11, 2, 20, 0, '2025-09-02 18:00:36', '2025-09-02 18:00:48'),
(105, 13, 2, 1, 20, 0, '2025-09-02 20:15:52', '2025-09-02 20:16:03'),
(106, 13, 4, 2, 20, 0, '2025-09-02 20:16:43', '2025-09-02 20:18:11'),
(107, 13, 12, 0, 0, 0, '2025-09-02 20:21:37', '2025-09-02 20:22:54'),
(108, 14, 12, 0, 0, 0, '2025-09-02 20:23:15', '2025-09-02 20:23:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PHONE` varchar(15) NOT NULL,
  `REG_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`ID`, `USERNAME`, `PASSWORD`, `EMAIL`, `PHONE`, `REG_DATE`, `is_admin`) VALUES
(1, 'thanhtroll2oo45', '$2y$10$iUTBf7zXZ/dJ2XMMUcBII.lGdD8my.MMsnWTi3qosYm9otHLfIXby', '', '', '2025-08-17 16:03:13', 1),
(5, 'khoane123', '$2y$10$RbzzAE.a.G/b6cZUZZwxTuRN2oa2cD.pokRM9LuuBgxe6K1VlH0zK', 'khoahuynhkhoah12321@gmail.com', '0827396638', '2025-08-17 16:32:53', 0),
(6, 'nam123', '$2y$10$i688gQ7/zUM7uzbFWRj4d.knjcqtfn/uoaJ85wNPpiRZ9sDsG67rO', 'namhuynh123@gmail.com', '0123456789', '2025-08-19 06:16:39', 0),
(9, 'tuitenkhoa', '$2y$10$hLO2qtqjqFUJ/jDoSc8o2.wtmFGKo.01J4q/gjCyGA.ldL7GYlYgi', 'hungnguyen180705@gmail.com', '0937248462', '2025-08-19 08:01:02', 0),
(11, 'tuitenhoang', '$2y$10$pRDB3YjfzUXTs6uN7L3TdOore5lJNRPPCyDFtHVlMNftMBJyDRbNi', 'hongtyvn@gmail.com', '099999999', '2025-08-19 08:04:35', 0),
(12, 'dsada', '$2y$10$nZSfFhZ6.TXEH/SfU4urkenOJljnUgiUvSIEVfKO.gytm9CnCVq1q', 'Tata432@gmail.com', '0147852369', '2025-08-26 08:38:53', 1),
(13, 'nnn123', '$2y$10$f0NdL4GZDdaPMjx6p4pMzOk2w.1vAmz0QjkfR3rFDxUFhAtHPjB0i', 'nnn123@gmail.com', '0159875365', '2025-09-01 04:23:44', 0),
(14, 'kkk123', '$2y$10$oqkI.3sjJqsC8.q/hqI3u.Ehfz7ZdOPeEvnmPInPO41xIWSgoH.ey', 'nhutnam7114@gmail.com', '0147852385', '2025-09-01 14:34:38', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL,
  `result_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_answers`
--

INSERT INTO `user_answers` (`id`, `result_id`, `question_id`, `answer`, `is_correct`) VALUES
(41, 3, 1, 'A', 1),
(42, 3, 2, 'A', 1),
(43, 3, 3, 'A', 1),
(44, 3, 4, 'A', 1),
(45, 3, 5, 'A', 1),
(46, 3, 6, 'A', 1),
(47, 3, 7, NULL, 0),
(48, 3, 8, NULL, 0),
(49, 3, 9, NULL, 0),
(50, 3, 10, NULL, 0),
(51, 3, 11, NULL, 0),
(52, 3, 12, NULL, 0),
(53, 3, 13, NULL, 0),
(54, 3, 14, NULL, 0),
(55, 3, 15, NULL, 0),
(56, 3, 16, NULL, 0),
(57, 3, 17, NULL, 0),
(58, 3, 18, NULL, 0),
(59, 3, 19, NULL, 0),
(60, 3, 20, NULL, 0),
(61, 3, 21, NULL, 0),
(62, 3, 22, NULL, 0),
(63, 3, 23, NULL, 0),
(64, 3, 24, NULL, 0),
(65, 3, 25, NULL, 0),
(66, 3, 26, NULL, 0),
(67, 3, 27, NULL, 0),
(68, 3, 28, NULL, 0),
(69, 3, 29, NULL, 0),
(70, 3, 30, NULL, 0),
(71, 3, 31, NULL, 0),
(72, 3, 32, NULL, 0),
(73, 3, 33, NULL, 0),
(74, 3, 34, NULL, 0),
(75, 3, 35, NULL, 0),
(76, 3, 36, NULL, 0),
(77, 3, 37, NULL, 0),
(78, 3, 38, NULL, 0),
(79, 3, 39, NULL, 0),
(80, 3, 40, NULL, 0),
(81, 4, 1, 'A', 1),
(82, 4, 2, 'A', 1),
(83, 4, 3, 'A', 1),
(84, 4, 4, 'A', 1),
(85, 4, 5, 'A', 1),
(86, 4, 6, 'A', 1),
(87, 4, 7, 'A', 1),
(88, 4, 8, 'A', 1),
(89, 4, 9, 'A', 1),
(90, 4, 10, 'A', 1),
(91, 4, 11, 'A', 1),
(92, 4, 12, 'A', 1),
(93, 4, 13, 'A', 1),
(94, 4, 14, 'A', 1),
(95, 4, 15, 'A', 1),
(96, 4, 16, 'A', 1),
(97, 4, 17, 'A', 1),
(98, 4, 18, 'A', 1),
(99, 4, 19, 'A', 1),
(100, 4, 20, 'A', 1),
(101, 4, 21, 'A', 1),
(102, 4, 22, 'A', 1),
(103, 4, 23, 'A', 1),
(104, 4, 24, 'A', 1),
(105, 4, 25, 'A', 1),
(106, 4, 26, 'A', 1),
(107, 4, 27, 'A', 1),
(108, 4, 28, 'A', 1),
(109, 4, 29, 'A', 1),
(110, 4, 30, 'A', 1),
(111, 4, 31, 'A', 1),
(112, 4, 32, 'A', 1),
(113, 4, 33, 'A', 1),
(114, 4, 34, 'A', 1),
(115, 4, 35, 'A', 1),
(116, 4, 36, 'A', 1),
(117, 4, 37, 'A', 1),
(118, 4, 38, 'A', 1),
(119, 4, 39, 'A', 1),
(120, 4, 40, 'A', 1),
(121, 7, 1, '', 0),
(122, 7, 2, '', 0),
(123, 7, 3, '', 0),
(124, 7, 4, '', 0),
(125, 7, 5, '', 0),
(126, 7, 6, '', 0),
(127, 7, 7, '', 0),
(128, 7, 8, '', 0),
(129, 7, 9, '', 0),
(130, 7, 10, '', 0),
(131, 7, 11, '', 0),
(132, 7, 12, '', 0),
(133, 7, 13, '', 0),
(134, 7, 14, '', 0),
(135, 7, 15, '', 0),
(136, 7, 16, '', 0),
(137, 7, 17, '', 0),
(138, 7, 18, '', 0),
(139, 7, 19, '', 0),
(140, 7, 20, '', 0),
(141, 8, 1, '', 0),
(142, 8, 2, '', 0),
(143, 8, 3, '', 0),
(144, 8, 4, '', 0),
(145, 8, 5, '', 0),
(146, 8, 6, '', 0),
(147, 8, 7, '', 0),
(148, 8, 8, '', 0),
(149, 8, 9, '', 0),
(150, 8, 10, '', 0),
(151, 8, 11, '', 0),
(152, 8, 12, '', 0),
(153, 8, 13, '', 0),
(154, 8, 14, '', 0),
(155, 8, 15, '', 0),
(156, 8, 16, '', 0),
(157, 8, 17, '', 0),
(158, 8, 18, '', 0),
(159, 8, 19, '', 0),
(160, 8, 20, '', 0),
(161, 9, 1, '125 ÷ 5 = 25; 36 × 2 = 72 ⇒ 25 + 72 = 97.', 1),
(162, 9, 2, 'Chia cả tử và mẫu cho 42: 84/126 = 2/3.', 1),
(163, 9, 3, '', 0),
(164, 9, 4, '', 0),
(165, 9, 5, '', 0),
(166, 9, 6, '', 0),
(167, 9, 7, '', 0),
(168, 9, 8, '', 0),
(169, 9, 9, '', 0),
(170, 9, 10, '', 0),
(171, 9, 11, '', 0),
(172, 9, 12, '', 0),
(173, 9, 13, '', 0),
(174, 9, 14, '', 0),
(175, 9, 15, '', 0),
(176, 9, 16, '', 0),
(177, 9, 17, '', 0),
(178, 9, 18, '', 0),
(179, 9, 19, '', 0),
(180, 9, 20, '', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bai_toan_tu_luan`
--
ALTER TABLE `bai_toan_tu_luan`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `essay_questions`
--
ALTER TABLE `essay_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Chỉ mục cho bảng `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `fk_exams` (`exam_id`);

--
-- Chỉ mục cho bảng `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `PHONE` (`PHONE`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- Chỉ mục cho bảng `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `result_id` (`result_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `bai_toan_tu_luan`
--
ALTER TABLE `bai_toan_tu_luan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `essay_questions`
--
ALTER TABLE `essay_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT cho bảng `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_exams` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
