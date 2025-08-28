-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 28, 2025 lúc 05:18 PM
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
-- Cơ sở dữ liệu: `user_db1`
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
-- Cấu trúc bảng cho bảng `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `questions` int(11) NOT NULL,
  `difficulty` varchar(20) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `exams`
--

INSERT INTO `exams` (`id`, `title`, `subject`, `questions`, `difficulty`, `description`) VALUES
(1, 'Đề Toán Giữa Kỳ 1', 'math', 40, 'Trung bình', 'Đề thi giữa kỳ môn Toán lớp 10'),
(2, 'Đề Toán Giữa Kỳ 1 - Lớp 10', 'math', 40, 'Trung bình', 'Đề thi giữa kỳ môn Toán học lớp 10'),
(3, 'Đề Vật Lý Cuối Kỳ - Lớp 11', 'physics', 45, 'Khó', 'Đề thi cuối kỳ môn Vật lý lớp 11'),
(4, 'Đề Hóa Học 15 Phút - Lớp 12', 'chemistry', 10, 'Dễ', 'Bài kiểm tra nhanh môn Hóa học lớp 12'),
(5, 'Đề Tiếng Anh Học Kỳ 1 - Lớp 9', 'english', 50, 'Trung bình', 'Đề thi học kỳ 1 môn Tiếng Anh lớp 9'),
(6, 'Đề Toán Ôn Tập THPTQG', 'math', 60, 'Khó', 'Đề ôn tập Toán cho kỳ thi THPT Quốc Gia');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exam_results`
--

CREATE TABLE `exam_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exam_name` varchar(255) NOT NULL,
  `correct_answers` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `score` decimal(4,2) NOT NULL,
  `time_spent` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_option` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_chemistry`
--

CREATE TABLE `question_chemistry` (
  `ID` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `QUESTION` text DEFAULT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_chemistry`
--

INSERT INTO `question_chemistry` (`ID`, `subject`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Hóa học', 'Công thức hóa học của nước là:', 'H2O', 'CO2', 'NaCl', 'O2', 'A'),
(2, 'Hóa học', 'Nguyên tố hóa học là:', 'Chất gồm 1 loại nguyên tử', 'Chất gồm 2 nguyên tử', 'Hợp chất', 'Chất tinh khiết', 'A'),
(3, 'Hóa học', 'Kí hiệu hóa học của Oxi là:', 'O', 'Ox', 'O2', 'O3', 'A'),
(4, 'Hóa học', 'Chất nào là hợp chất:', 'CO2', 'O2', 'Fe', 'Ag', 'A'),
(5, 'Hóa học', 'Na + H2O tạo thành khí gì?', 'H2', 'O2', 'CO2', 'Cl2', 'A'),
(6, 'Hóa học', 'Kim loại nào dẫn điện tốt nhất?', 'Ag', 'Cu', 'Fe', 'Zn', 'A'),
(7, 'Hóa học', 'Phản ứng trung hòa là phản ứng giữa:', 'Axit và bazơ', 'Axit và muối', 'Kim loại và nước', 'Oxit và nước', 'A'),
(8, 'Hóa học', 'Chất điện li là:', 'Chất phân li ra ion khi tan trong nước', 'Chất hòa tan không phân li', 'Chất không tan', 'Chất rắn', 'A'),
(9, 'Hóa học', 'Axit làm quỳ tím chuyển sang màu:', 'Đỏ', 'Xanh', 'Tím', 'Không đổi', 'A'),
(10, 'Hóa học', 'Bazơ làm quỳ tím chuyển sang màu:', 'Xanh', 'Đỏ', 'Tím', 'Vàng', 'A'),
(11, 'Hóa học', 'H2SO4 là công thức của:', 'Axit sunfuric', 'Axit clohidric', 'Axit nitric', 'Axit axetic', 'A'),
(12, 'Hóa học', 'NaOH là:', 'Bazơ', 'Axit', 'Muối', 'Oxit', 'A'),
(13, 'Hóa học', 'NaCl là:', 'Muối', 'Axit', 'Bazơ', 'Oxit', 'A'),
(14, 'Hóa học', 'Fe + CuSO4 → ?', 'FeSO4 + Cu', 'FeCl2 + Cu', 'Fe(NO3)2 + Cu', 'FeO + Cu', 'A'),
(15, 'Hóa học', 'Phản ứng phân hủy là:', '1 chất → 2 hay nhiều chất', '2 chất → 1 chất', 'Chất + Oxi', 'Chất + H2O', 'A'),
(16, 'Hóa học', 'Chất oxi hóa là chất:', 'Nhận electron', 'Nhường electron', 'Phản ứng với nước', 'Tan trong axit', 'A'),
(17, 'Hóa học', 'Cặp nguyên tố kim loại là:', 'Na, Fe', 'O, H', 'C, O', 'Cl, H', 'A'),
(18, 'Hóa học', 'Cặp nguyên tố phi kim là:', 'O, Cl', 'Na, Mg', 'Fe, Cu', 'K, Al', 'A'),
(19, 'Hóa học', 'Axit mạnh hơn HCl là:', 'H2SO4', 'CH3COOH', 'HNO3', 'H2CO3', 'A'),
(20, 'Hóa học', 'Tên gọi của KOH là:', 'Kali hidroxit', 'Natri hidroxit', 'Canxi hidroxit', 'Magie hidroxit', 'A'),
(21, 'Hóa học', 'Tên gọi của HCl là:', 'Axit clohidric', 'Axit sunfuric', 'Axit nitric', 'Axit axetic', 'A'),
(22, 'Hóa học', 'Ca(OH)2 là:', 'Bazơ', 'Muối', 'Axit', 'Oxit', 'A'),
(23, 'Hóa học', 'KCl là:', 'Muối', 'Axit', 'Bazơ', 'Oxit', 'A'),
(24, 'Hóa học', 'Chất làm đổi màu quỳ tím thành xanh:', 'Bazơ', 'Axit', 'Muối', 'Nước', 'A'),
(25, 'Hóa học', 'Chất làm đổi màu quỳ tím thành đỏ:', 'Axit', 'Bazơ', 'Muối', 'Nước', 'A'),
(26, 'Hóa học', 'Nguyên tử gồm:', 'Electron, proton, neutron', 'Proton, hạt nhân', 'Ion, nguyên tố', 'Hợp chất', 'A'),
(27, 'Hóa học', 'Đơn vị khối lượng nguyên tử là:', 'u', 'g', 'mol', 'kg', 'A'),
(28, 'Hóa học', '1 mol khí ở đktc chiếm thể tích:', '22.4 lít', '1 lít', '2.24 lít', '224 lít', 'A'),
(29, 'Hóa học', 'Phản ứng hóa hợp là:', '2 hay nhiều chất → 1 chất', '1 chất → nhiều chất', 'Chất tan trong nước', 'Chất khí', 'A'),
(30, 'Hóa học', 'Công thức khối lượng mol:', 'M = m/n', 'm = M/n', 'n = m.M', 'n = M.m', 'A'),
(31, 'Hóa học', 'Đơn vị của nồng độ mol:', 'mol/l', 'mol', 'mol/g', 'mol/m³', 'A'),
(32, 'Hóa học', 'pH của dung dịch bazơ là:', '>7', '<7', '7', '<0', 'A'),
(33, 'Hóa học', 'Chất không điện li trong nước là:', 'Rượu', 'HCl', 'NaOH', 'NaCl', 'A'),
(34, 'Hóa học', 'Chất điện li mạnh là:', 'NaCl', 'CH3COOH', 'H2CO3', 'NH3', 'A'),
(35, 'Hóa học', 'Oxit bazơ là:', 'Na2O', 'CO2', 'SO2', 'P2O5', 'A'),
(36, 'Hóa học', 'Oxit axit là:', 'CO2', 'Na2O', 'CaO', 'FeO', 'A'),
(37, 'Hóa học', 'Muối trung hòa là:', 'NaCl', 'NaHCO3', 'NaHSO4', 'CH3COONa', 'A'),
(38, 'Hóa học', 'Dung dịch có pH = 7 là:', 'Nước cất', 'Nước chanh', 'Nước xà phòng', 'HCl loãng', 'A'),
(39, 'Hóa học', 'Phản ứng tỏa nhiệt là:', 'Tỏa ra nhiệt', 'Hấp thu nhiệt', 'Không đổi', 'Không sinh nhiệt', 'A'),
(40, 'Hóa học', 'Chất nào sau đây vừa tan trong nước vừa có khả năng phản ứng với axit tạo khí?', 'Na₂CO₃', 'NaCl', 'CuSO₄', 'Mg(OH)₂', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_english`
--

CREATE TABLE `question_english` (
  `ID` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `QUESTION` text DEFAULT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_english`
--

INSERT INTO `question_english` (`ID`, `subject`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Tiếng Anh', 'Choose the correct past tense of \'go\':', 'went', 'goed', 'goes', 'go', 'A'),
(2, 'Tiếng Anh', 'Which sentence is grammatically correct?', 'She goes to school every day.', 'She go to school every day.', 'She going to school.', 'She gone to school.', 'A'),
(3, 'Tiếng Anh', 'What is the synonym of \'happy\'?', 'joyful', 'sad', 'angry', 'bored', 'A'),
(4, 'Tiếng Anh', 'What is the antonym of \'strong\'?', 'weak', 'brave', 'clever', 'tall', 'A'),
(5, 'Tiếng Anh', 'Complete the sentence: I ___ to music every night.', 'listen', 'listens', 'listening', 'listened', 'A'),
(6, 'Tiếng Anh', 'Which one is a preposition?', 'under', 'run', 'quick', 'happily', 'A'),
(7, 'Tiếng Anh', 'What is the plural form of \'child\'?', 'children', 'childs', 'childes', 'childrens', 'A'),
(8, 'Tiếng Anh', 'Find the correct sentence:', 'There are some books on the table.', 'There is some book on table.', 'There are any books on table.', 'There is many books.', 'A'),
(9, 'Tiếng Anh', 'Choose the correct form: He ___ already eaten.', 'has', 'have', 'having', 'had', 'A'),
(10, 'Tiếng Anh', 'Reported speech: She said, \'I am tired.\'', 'She said she was tired.', 'She said she is tired.', 'She say she tired.', 'She said I am tired.', 'A'),
(11, 'Tiếng Anh', 'Choose the correct passive voice: They built a house.', 'A house was built.', 'They was build a house.', 'House is builded.', 'House were built.', 'A'),
(12, 'Tiếng Anh', 'Which is an adjective?', 'beautiful', 'beauty', 'beautifully', 'beauti', 'A'),
(13, 'Tiếng Anh', 'Which sentence is present perfect?', 'I have finished my homework.', 'I finish my homework.', 'I am finishing homework.', 'I was finished homework.', 'A'),
(14, 'Tiếng Anh', 'Complete the sentence: He ___ to school yesterday.', 'went', 'go', 'goes', 'going', 'A'),
(15, 'Tiếng Anh', 'Which is a question tag? You\'re tired, ___?', 'aren\'t you', 'isn\'t you', 'are you', 'do you', 'A'),
(16, 'Tiếng Anh', 'Choose the right article: ___ apple', 'an', 'a', 'the', 'some', 'A'),
(17, 'Tiếng Anh', 'Which is an adverb?', 'quickly', 'quick', 'quicker', 'quickness', 'A'),
(18, 'Tiếng Anh', 'Which sentence is in the future tense?', 'She will go to the market.', 'She goes to the market.', 'She is going to the market.', 'She went to the market.', 'A'),
(19, 'Tiếng Anh', 'Which is an interrogative pronoun?', 'What', 'Happy', 'Quick', 'She', 'A'),
(20, 'Tiếng Anh', 'Which is a correct conditional type 1?', 'If it rains, I will stay home.', 'If it will rain, I stay home.', 'If it rained, I stay home.', 'If it rain, I would stay home.', 'A'),
(21, 'Tiếng Anh', 'What is the correct plural of \'tooth\'?', 'teeth', 'tooths', 'toothen', 'teeths', 'A'),
(22, 'Tiếng Anh', 'Which sentence is correct?', 'She doesn’t like coffee.', 'She don’t like coffee.', 'She didn’t likes coffee.', 'She not like coffee.', 'A'),
(23, 'Tiếng Anh', 'What is the opposite of \'cold\'?', 'hot', 'warm', 'cool', 'freeze', 'A'),
(24, 'Tiếng Anh', 'Choose the correct word: The sun ___ in the east.', 'rises', 'rise', 'rose', 'raising', 'A'),
(25, 'Tiếng Anh', 'Which is a countable noun?', 'apple', 'water', 'milk', 'sugar', 'A'),
(26, 'Tiếng Anh', 'Choose the right conjunction: I like tea ___ coffee.', 'and', 'but', 'or', 'so', 'A'),
(27, 'Tiếng Anh', 'Identify the verb: She dances beautifully.', 'dances', 'beautifully', 'she', 'none', 'A'),
(28, 'Tiếng Anh', 'Which is a correct form of \'be\' in past tense?', 'was', 'is', 'are', 'been', 'A'),
(29, 'Tiếng Anh', 'Choose correct word order: He / usually / goes / to school / by bus.', 'He usually goes to school by bus.', 'He goes usually to school by bus.', 'Usually he goes to school by bus.', 'He to school usually goes by bus.', 'A'),
(30, 'Tiếng Anh', 'Which is an imperative sentence?', 'Close the door!', 'Do you close the door?', 'She closes the door.', 'Door is closed.', 'A'),
(31, 'Tiếng Anh', 'Choose correct comparative: fast', 'faster', 'more fast', 'fastest', 'fastly', 'A'),
(32, 'Tiếng Anh', 'Which is a modal verb?', 'can', 'has', 'is', 'do', 'A'),
(33, 'Tiếng Anh', 'Which is an uncountable noun?', 'rice', 'apple', 'book', 'pen', 'A'),
(34, 'Tiếng Anh', 'Which is a gerund?', 'swimming', 'swim', 'swam', 'swims', 'A'),
(35, 'Tiếng Anh', 'What is the past participle of \'eat\'?', 'eaten', 'ate', 'eats', 'eating', 'A'),
(36, 'Tiếng Anh', 'Which is a proper noun?', 'Vietnam', 'country', 'place', 'city', 'A'),
(37, 'Tiếng Anh', 'Choose the right spelling:', 'beautiful', 'beautifull', 'beutiful', 'beautyfull', 'A'),
(38, 'Tiếng Anh', 'How do you say \'40\'?', 'forty', 'fourty', 'foury', 'fortee', 'A'),
(39, 'Tiếng Anh', 'Choose the correct pronoun: ___ is my book.', 'This', 'He', 'She', 'It', 'A'),
(40, 'Tiếng Anh', 'Find the correct prepositional phrase: in the morning', 'in the morning', 'at the morning', 'on the morning', 'by the morning', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_math`
--

CREATE TABLE `question_math` (
  `ID` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `QUESTION` text DEFAULT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_math`
--

INSERT INTO `question_math` (`ID`, `subject`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Toán', 'Giải phương trình: 2x - 5 = 7', 'x = 6', 'x = 5', 'x = 4', 'x = 3', 'A'),
(2, 'Toán', 'Tính giá trị biểu thức: (4 + 5) * 3', '27', '29', '25', '30', 'A'),
(3, 'Toán', 'Rút gọn: (2x + 3x) - (x - 2)', '4x + 2', '5x - 2', '5x + 2', '3x + 2', 'C'),
(4, 'Toán', 'Tìm x biết: x² = 49', 'x = ±7', 'x = 7', 'x = -7', 'x = 0', 'A'),
(5, 'Toán', 'Góc vuông có số đo là:', '90°', '180°', '45°', '60°', 'A'),
(6, 'Toán', 'Diện tích hình chữ nhật: dài 5m, rộng 3m', '15m²', '16m²', '8m²', '18m²', 'A'),
(7, 'Toán', 'Tính: 3² + 4²', '25', '16', '9', '7', 'A'),
(8, 'Toán', 'Giải phương trình: x/3 + 1 = 4', 'x = 9', 'x = 6', 'x = 3', 'x = 12', 'B'),
(9, 'Toán', 'Hàm số y = 2x + 1 là:', 'Hàm bậc nhất', 'Hàm bậc hai', 'Hàm hằng', 'Hàm tuyến tính', 'A'),
(10, 'Toán', 'Giải: x² - 4x = 0', 'x = 0 hoặc x = 4', 'x = 2', 'x = -2', 'x = 1', 'A'),
(11, 'Toán', 'Một lớp có 20 học sinh, mỗi bạn bắt tay 1 lần với bạn khác. Số cái bắt tay là?', '190', '180', '210', '200', 'A'),
(12, 'Toán', 'Rút gọn: (4x² - 9) / (2x + 3)', '2x - 3', '2x + 3', '2x - 1', '2x + 1', 'A'),
(13, 'Toán', 'Tìm x: 5(x - 1) = 2x + 9', 'x = 4', 'x = 5', 'x = 6', 'x = 7', 'A'),
(14, 'Toán', 'Tính thể tích hình lập phương cạnh 4cm', '64cm³', '16cm³', '32cm³', '48cm³', 'A'),
(15, 'Toán', 'Cho a = 2, b = -3. Tính ab + a²', 'True', '-2', '10', '-10', 'B'),
(16, 'Toán', 'Tìm nghiệm của: x² - 9 = 0', 'x = ±3', 'x = 3', 'x = -3', 'x = 0', 'A'),
(17, 'Toán', 'Hệ số góc của đường thẳng y = -2x + 5 là:', '-2', '-5', '2', '5', 'A'),
(18, 'Toán', 'Tìm giá trị nhỏ nhất của hàm y = x² + 2x + 5', '4', '3', '5', '0', 'C'),
(19, 'Toán', 'Tìm ƯCLN của 36 và 60', '12', '6', '18', '30', 'A'),
(20, 'Toán', 'Tìm BCNN của 12 và 15', '60', '30', '45', '90', 'A'),
(21, 'Toán', 'Một hình tròn có chu vi 31.4cm. Bán kính là?', '5cm', '10cm', '6cm', '3cm', 'A'),
(22, 'Toán', 'Giải bất phương trình: x - 3 > 5', 'x > 8', 'x > 2', 'x > 5', 'x > 3', 'A'),
(23, 'Toán', 'Tìm giá trị lớn nhất của y = -x² + 4x + 5', '9', '10', '8', '11', 'B'),
(24, 'Toán', 'Biểu thức: (x + 1)(x - 1) = ?', 'x² - 1', 'x² + 1', 'x² - 2', 'x²', 'A'),
(25, 'Toán', 'Tìm x: x² - 2x - 8 = 0', 'x = 4 hoặc x = -2', 'x = 2', 'x = -4', 'x = 1', 'A'),
(26, 'Toán', 'Tính giá trị: | -7 | + (-3)', '4', '10', '-4', '5', 'A'),
(27, 'Toán', 'Một hình hộp chữ nhật có kích thước 3x4x5, thể tích là?', '60', '12', '20', '80', 'A'),
(28, 'Toán', 'Tính tổng: 1 + 2 + 3 + ... + 10', '55', '50', '60', '45', 'A'),
(29, 'Toán', 'Tìm x để: x² + x - 6 = 0', 'x = 2 hoặc x = -3', 'x = -2', 'x = 3', 'x = 0', 'A'),
(30, 'Toán', 'Tìm diện tích hình vuông cạnh √5', '5', '√5', '10', '2', 'A'),
(31, 'Toán', 'Tính phần trăm của 20 trên 80', '0.25', '0.2', '0.4', '0.5', 'A'),
(32, 'Toán', 'Giá trị tuyệt đối của -15 là?', '15', '-15', '0', '30', 'A'),
(33, 'Toán', 'Tìm giá trị của biểu thức: (2x + 1)² khi x = 2', '25', '16', '20', '36', 'A'),
(34, 'Toán', 'Cho a = 3, b = 4. Tính a² + b²', '25', '12', '7', '5', 'A'),
(35, 'Toán', 'Rút gọn: x(x + 1) - x²', 'x', 'x + 1', 'x²', 'x - 1', 'A'),
(36, 'Toán', 'Tìm chu vi hình vuông cạnh 7cm', '28cm', '14cm', '49cm', '21cm', 'A'),
(37, 'Toán', 'Giá trị nhỏ nhất của x² + 4x + 4', '0', '4', '2', '8', 'A'),
(38, 'Toán', 'Tìm x: x(x - 1) = 6', 'x = 3 hoặc x = -2', 'x = 2', 'x = 1', 'x = 0', 'A'),
(39, 'Toán', 'Giải hệ phương trình: x + y = 5; x - y = 1', 'x = 3, y = 2', 'x = 2, y = 3', 'x = 1, y = 4', 'x = 4, y = 1', 'A'),
(40, 'Toán', 'Tìm số chia hết cho cả 3 và 5 nhỏ nhất > 0', '15', '30', '45', '60', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_physics`
--

CREATE TABLE `question_physics` (
  `ID` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `QUESTION` text DEFAULT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_physics`
--

INSERT INTO `question_physics` (`ID`, `subject`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Vật lý', 'Vật rơi tự do có gia tốc xấp xỉ:', '9.8 m/s²', '10 m/s²', '9 m/s²', '8 m/s²', 'A'),
(2, 'Vật lý', 'Đơn vị của lực là:', 'N', 'kg', 'J', 'W', 'A'),
(3, 'Vật lý', 'Công thức tính vận tốc là:', 'v = s/t', 'v = s*t', 'v = t/s', 'v = s + t', 'A'),
(4, 'Vật lý', 'Công suất là:', 'Công / thời gian', 'Lực * vận tốc', 'Khối lượng / thời gian', 'Năng lượng * thời gian', 'A'),
(5, 'Vật lý', 'Một vật khối lượng 2kg rơi tự do. Trọng lượng là?', '20N', '10N', '2N', '200N', 'A'),
(6, 'Vật lý', 'Lực ma sát có hướng:', 'Ngược chiều chuyển động', 'Cùng chiều vận tốc', 'Vuông góc', 'Không xác định', 'A'),
(7, 'Vật lý', 'Thế năng phụ thuộc vào:', 'Độ cao', 'Khối lượng', 'Vận tốc', 'Diện tích', 'A'),
(8, 'Vật lý', 'Đơn vị đo công suất trong hệ SI là:', 'W', 'J', 'Nm', 'kg', 'A'),
(9, 'Vật lý', 'Áp suất chất lỏng phụ thuộc vào:', 'Chiều cao cột chất lỏng', 'Nhiệt độ', 'Khối lượng riêng', 'Tốc độ', 'A'),
(10, 'Vật lý', 'Công thức định luật II Newton:', 'F = ma', 'F = mv', 'F = mg', 'F = m/s', 'A'),
(11, 'Vật lý', 'Khối lượng riêng đo bằng đơn vị:', 'kg/m³', 'g', 'kg', 'm/s²', 'A'),
(12, 'Vật lý', 'Công thức tính áp suất:', 'p = F/S', 'p = S/F', 'p = F*S', 'p = F + S', 'A'),
(13, 'Vật lý', 'Dụng cụ đo lực là:', 'Lực kế', 'Thước', 'Nhiệt kế', 'Đồng hồ', 'A'),
(14, 'Vật lý', 'Động năng của vật phụ thuộc vào:', 'Khối lượng và vận tốc', 'Chiều cao', 'Khối lượng riêng', 'Lực', 'A'),
(15, 'Vật lý', 'Chuyển động đều có:', 'Vận tốc không đổi', 'Gia tốc tăng', 'Lực thay đổi', 'Thời gian giảm', 'A'),
(16, 'Vật lý', 'Một xe đi 60km trong 2 giờ. Vận tốc là?', '30 km/h', '60 km/h', '90 km/h', '120 km/h', 'A'),
(17, 'Vật lý', 'Lực hấp dẫn tăng khi:', 'Khối lượng tăng', 'Khoảng cách tăng', 'Thời gian tăng', 'Trọng lượng giảm', 'A'),
(18, 'Vật lý', 'Đơn vị đo nhiệt độ là:', '°C', 'J', 'K', 'W', 'A'),
(19, 'Vật lý', 'Cơ năng gồm:', 'Động năng và thế năng', 'Nhiệt năng và thế năng', 'Động năng và áp suất', 'Thế năng và lực', 'A'),
(20, 'Vật lý', 'Nhiệt kế thủy ngân hoạt động dựa trên:', 'Sự nở vì nhiệt', 'Độ dẫn điện', 'Khối lượng riêng', 'Áp suất', 'A'),
(21, 'Vật lý', 'Dòng điện là:', 'Dòng các electron chuyển động', 'Dòng proton', 'Dòng hạt nhân', 'Dòng nhiệt', 'A'),
(22, 'Vật lý', 'Ampe kế dùng để đo:', 'Cường độ dòng điện', 'Điện trở', 'Hiệu điện thế', 'Nhiệt độ', 'A'),
(23, 'Vật lý', 'Hiệu điện thế được đo bằng:', 'Vôn kế', 'Ampe kế', 'Ôm kế', 'Lực kế', 'A'),
(24, 'Vật lý', 'Công thức Ohm: U = ?', 'IR', 'I/R', 'R/I', 'I + R', 'A'),
(25, 'Vật lý', 'Điện trở có đơn vị là:', 'Ω', 'V', 'A', 'J', 'A'),
(26, 'Vật lý', 'Nguồn điện là:', 'Pin', 'Bóng đèn', 'Công tắc', 'Dây dẫn', 'A'),
(27, 'Vật lý', 'Hiệu điện thế giữa hai điểm là:', 'Độ chênh lệch điện thế', 'Cường độ dòng điện', 'Điện trở', 'Sự va chạm', 'A'),
(28, 'Vật lý', 'Dòng điện chỉ chạy khi:', 'Mạch kín', 'Công tắc mở', 'Không có nguồn', 'Mạch hở', 'A'),
(29, 'Vật lý', 'Vật dẫn điện tốt là:', 'Kim loại', 'Gỗ', 'Nhựa', 'Thủy tinh', 'A'),
(30, 'Vật lý', 'Điện trở càng lớn thì:', 'Dòng điện càng nhỏ', 'Dòng điện càng lớn', 'Không thay đổi', 'Không xác định', 'A'),
(31, 'Vật lý', 'Hiệu ứng nhiệt của dòng điện là:', 'Tỏa nhiệt', 'Phát sáng', 'Rung động', 'Không đổi', 'A'),
(32, 'Vật lý', 'Hiện tượng sét là do:', 'Dòng điện phóng qua không khí', 'Mây đen', 'Áp suất', 'Gió lớn', 'A'),
(33, 'Vật lý', 'Động cơ điện biến đổi:', 'Điện năng thành cơ năng', 'Nhiệt năng thành cơ năng', 'Cơ năng thành điện năng', 'Ánh sáng thành nhiệt', 'A'),
(34, 'Vật lý', 'Điện năng tiêu thụ đo bằng:', 'kWh', 'W', 'J', 'A', 'A'),
(35, 'Vật lý', '1 kWh bằng:', '3.6 triệu J', '360 J', '3600 J', '36000 J', 'A'),
(36, 'Vật lý', 'Cường độ dòng điện ký hiệu là:', 'I', 'U', 'R', 'P', 'A'),
(37, 'Vật lý', 'Hiệu điện thế ký hiệu là:', 'U', 'I', 'R', 'P', 'A'),
(38, 'Vật lý', 'Điện trở ký hiệu là:', 'R', 'U', 'I', 'P', 'A'),
(39, 'Vật lý', 'Đơn vị của công suất điện là:', 'W', 'V', 'Ω', 'A', 'A'),
(40, 'Vật lý', 'Công thức tính điện năng: A =', 'P.t', 'I.U', 'U/t', 'R.I', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `reg_date`, `email`, `phone`, `created_at`) VALUES
(1, 'thanhtroll2oo45', '$2y$10$G4Cd3Wvr52iWlcbxRxuVQeC4Z93rmwQiBJNRTwVbBJ2vuhOC19BCa', 0, '0000-00-00 00:00:00', '', '', '2025-08-24 14:42:49'),
(2, 'thanhtroll2oo45', '$2y$10$F8H1omTuV6zRdg9tgBrdPOvNPvfis488KFUyvxK8UJBOzc0oRa.Z2', 0, '0000-00-00 00:00:00', '', '', '2025-08-24 14:42:49'),
(3, 'thanhtroll2oo45', '$2y$10$UbKmIpR72cuZ/yU.odRePu7YMTRUT4dHr3ebBAIWBDl.idBnepRbW', 0, '0000-00-00 00:00:00', '', '', '2025-08-24 14:42:49'),
(4, 'thanhtroll2oo45', '$2y$10$sFZ4UjV36Ht72cpCWWQTMeoRxGj10xKDYLOcX7w3VnIHuJ44RRPA2', 0, '0000-00-00 00:00:00', '', '', '2025-08-24 14:42:49'),
(5, 'thanhtroll2oo45', '$2y$10$sQwg89WSNuxaGhjLPgIQxeZESUwXuCV6Bmr4757BghwcP0efpLo7u', 0, '0000-00-00 00:00:00', '', '', '2025-08-24 14:42:49'),
(6, 'dsada', '$2y$10$.xCYACUNnjz85OdbqA4CR.8HS2iPqi6KVnA7C7kQu3P0ZCfJsDnNe', 0, '0000-00-00 00:00:00', 'nhutnam7114@gmail.com', '0152435765', '2025-08-24 14:48:50'),
(7, 'tata123', '$2y$10$q0ieM1VWJUpBY7rx35fdDO7PxxQON.0US6w5hz8/tsZ0MN/Kr.0B2', 0, '0000-00-00 00:00:00', 'tata159@gmail.com', '0159753258', '2025-08-25 08:08:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option` char(0) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_exam_user` (`user_id`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Chỉ mục cho bảng `question_chemistry`
--
ALTER TABLE `question_chemistry`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_english`
--
ALTER TABLE `question_english`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_math`
--
ALTER TABLE `question_math`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_physics`
--
ALTER TABLE `question_physics`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `question_chemistry`
--
ALTER TABLE `question_chemistry`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_english`
--
ALTER TABLE `question_english`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_math`
--
ALTER TABLE `question_math`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `question_physics`
--
ALTER TABLE `question_physics`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `fk_exam_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
