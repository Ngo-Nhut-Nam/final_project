-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 28, 2025 lúc 05:13 PM
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
-- Cấu trúc bảng cho bảng `question_chemistry_8`
--

CREATE TABLE `question_chemistry_8` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_chemistry_8`
--

INSERT INTO `question_chemistry_8` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Hóa học', 'Nguyên tử gồm những hạt cơ bản nào?', 'Proton, Neutron, Electron', 'Proton, Electron', 'Neutron, Electron', 'Proton, Nơtron', 'A'),
(2, 'Hóa học', 'Hóa trị của Oxi trong hợp chất thường là?', 'I', 'II', 'III', 'IV', 'B'),
(3, 'Hóa học', 'Kí hiệu hóa học của Natri?', 'Na', 'N', 'Ni', 'Ne', 'A'),
(4, 'Hóa học', 'Nguyên tố H có Z bằng?', '1', '2', '3', '4', 'A'),
(5, 'Hóa học', 'Phân tử khối của CO₂ là?', '28', '32', '44', '46', 'C'),
(6, 'Hóa học', 'Định luật bảo toàn khối lượng do ai phát hiện?', 'Newton', 'Lomonosov', 'Mendeleev', 'Faraday', 'B'),
(7, 'Hóa học', 'Thể tích mol khí ở đktc?', '11,2 lít', '22,4 lít', '33,6 lít', '44,8 lít', 'B'),
(8, 'Hóa học', 'Công thức hóa học của axit clohidric?', 'HCl', 'H₂SO₄', 'HNO₃', 'H₂CO₃', 'A'),
(9, 'Hóa học', 'Tính chất đặc trưng của kim loại?', 'Dẫn điện', 'Dẫn nhiệt', 'Dẻo', 'Cả 3', 'D'),
(10, 'Hóa học', 'Công thức hóa học của vôi sống?', 'CaO', 'Ca(OH)₂', 'CaCO₃', 'CaSO₄', 'A'),
(11, 'Hóa học', 'Quy tắc hóa trị dùng để làm gì?', 'Lập công thức hóa học', 'Tính mol', 'Tính nồng độ', 'Tính pH', 'A'),
(12, 'Hóa học', 'Công thức hóa học của nước vôi trong?', 'Ca(OH)₂', 'CaCO₃', 'CaSO₄', 'CaO', 'A'),
(13, 'Hóa học', 'Khi đốt cháy kim loại Mg trong không khí tạo thành?', 'MgO', 'MgCl₂', 'MgSO₄', 'Mg(OH)₂', 'A'),
(14, 'Hóa học', 'Phản ứng hóa hợp là?', '2 hay nhiều chất → 1 chất', '1 chất → nhiều chất', 'Chất + O₂ → oxit', '2 muối → 2 muối', 'A'),
(15, 'Hóa học', 'Khi cho Zn tác dụng với HCl thu được khí?', 'O₂', 'N₂', 'H₂', 'Cl₂', 'C'),
(16, 'Hóa học', 'Tính số mol của 11,2 lít O₂ ở đktc?', '0,25 mol', '0,5 mol', '1 mol', '2 mol', 'B'),
(17, 'Hóa học', 'Khối lượng của 2 mol H₂O?', '18 g', '20 g', '32 g', '36 g', 'D'),
(18, 'Hóa học', 'Thể tích 2 mol CO₂ ở đktc?', '11,2 lít', '22,4 lít', '44,8 lít', '56 lít', 'C'),
(19, 'Hóa học', 'Số mol trong 4 g H₂?', '1 mol', '2 mol', '0,5 mol', '0,2 mol', 'B'),
(20, 'Hóa học', 'Đốt cháy hoàn toàn 12 g C cần bao nhiêu lít O₂ (đktc)?', '11,2 lít', '22,4 lít', '33,6 lít', '44,8 lít', 'A'),
(21, 'Hóa học', 'Khối lượng mol của Na₂CO₃?', '100 g/mol', '106 g/mol', '110 g/mol', '120 g/mol', 'B'),
(22, 'Hóa học', 'Khối lượng của 0,5 mol NaCl?', '29,25 g', '58,5 g', '30 g', '50 g', 'A'),
(23, 'Hóa học', 'Thể tích khí H₂ thu được khi cho 2 g H₂ tác dụng hết với O₂?', '11,2 lít', '22,4 lít', '44,8 lít', '2,24 lít', 'B'),
(24, 'Hóa học', 'Nồng độ % của dung dịch chứa 10 g NaOH trong 90 g nước?', '5%', '10%', '12%', '15%', 'B'),
(25, 'Hóa học', 'Số mol nguyên tử trong 18 g H₂O?', '1 mol', '2 mol', '3 mol', '6 mol', 'C'),
(26, 'Hóa học', 'Khối lượng O₂ cần để đốt cháy 23 g Na thành Na₂O?', '8 g', '16 g', '12 g', '24 g', 'A'),
(27, 'Hóa học', 'Khối lượng CaO tạo thành từ 10 g CaCO₃ khi phân hủy?', '4 g', '5,6 g', '6 g', '7 g', 'B'),
(28, 'Hóa học', 'Số phân tử trong 0,25 mol H₂?', '6,02.10²³', '1,505.10²³', '3.10²³', '7.10²³', 'B'),
(29, 'Hóa học', 'Khối lượng Mg cần để tác dụng với HCl tạo 2,24 lít H₂ (đktc)?', '12 g', '6 g', '24 g', '48 g', 'A'),
(30, 'Hóa học', 'Khối lượng AgNO₃ cần dùng để tạo 17 g NaNO₃ (phản ứng với NaCl)?', '34 g', '68 g', '85 g', '170 g', 'C'),
(31, 'Hóa học', 'Khí CO₂ dùng trong công nghiệp để?', 'Chữa cháy', 'Thổi bóng bay', 'Đốt cháy', 'Tạo phân bón', 'A'),
(32, 'Hóa học', 'Dung dịch NaOH được dùng để?', 'Làm xà phòng', 'Làm giấy', 'Làm xi măng', 'Làm kính', 'A'),
(33, 'Hóa học', 'Vì sao ăn nhiều muối NaCl không tốt cho sức khỏe?', 'Gây cao huyết áp', 'Gây thấp khớp', 'Gây thiếu máu', 'Gây đau đầu', 'A'),
(34, 'Hóa học', 'CaCO₃ được dùng để sản xuất?', 'Xi măng', 'Nhựa', 'Thủy tinh hữu cơ', 'Xăng', 'A'),
(35, 'Hóa học', 'Khí NH₃ dùng làm?', 'Phân đạm', 'Chất dẻo', 'Nhiên liệu', 'Chất bảo quản', 'A'),
(36, 'Hóa học', 'Cho quỳ tím vào dung dịch HCl, quỳ đổi màu gì?', 'Đỏ', 'Xanh', 'Tím', 'Không đổi', 'A'),
(37, 'Hóa học', 'Cho CaO vào nước, hiện tượng?', 'Tan và tỏa nhiệt', 'Không tan', 'Bay hơi', 'Đóng băng', 'A'),
(38, 'Hóa học', 'Cho Al vào dung dịch HCl, hiện tượng?', 'Sủi bọt khí', 'Không hiện tượng', 'Kết tủa', 'Đổi màu', 'A'),
(39, 'Hóa học', 'Cho AgNO₃ vào dung dịch NaCl, hiện tượng?', 'Kết tủa trắng AgCl', 'Dung dịch trong suốt', 'Sủi bọt khí', 'Dung dịch vàng', 'A'),
(40, 'Hóa học', 'Cho dung dịch NaOH vào dung dịch CuSO₄, hiện tượng?', 'Kết tủa xanh Cu(OH)₂', 'Dung dịch tím', 'Dung dịch trong suốt', 'Sủi bọt khí', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_chemistry_9`
--

CREATE TABLE `question_chemistry_9` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_chemistry_9`
--

INSERT INTO `question_chemistry_9` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Hóa học', 'Dãy hoạt động hóa học của kim loại cho biết điều gì?', 'Khả năng khử', 'Khả năng oxi hóa', 'Khả năng trung hòa', 'Khả năng hòa tan', 'A'),
(2, 'Hóa học', 'Khi cho Fe vào dung dịch CuSO₄, hiện tượng?', 'Xuất hiện Cu bám', 'Dung dịch đổi màu xanh', 'Xuất hiện kết tủa', 'Có khí bay ra', 'A'),
(3, 'Hóa học', 'Công thức hóa học của axit sunfuric?', 'H₂SO₄', 'HNO₃', 'HCl', 'H₂CO₃', 'A'),
(4, 'Hóa học', 'Tên gọi NaOH?', 'Natri oxit', 'Natri hidroxit', 'Natri clorua', 'Natri sunfat', 'B'),
(5, 'Hóa học', 'Tính chất của dung dịch bazơ?', 'Làm đổi màu quỳ tím thành xanh', 'Làm đổi màu quỳ tím thành đỏ', 'Không đổi màu quỳ tím', 'Làm quỳ tím mất màu', 'A'),
(6, 'Hóa học', 'Dung dịch nào làm quỳ tím hóa đỏ?', 'NaOH', 'KOH', 'HCl', 'Ba(OH)₂', 'C'),
(7, 'Hóa học', 'Phản ứng trao đổi xảy ra khi?', 'Có chất kết tủa, chất bay hơi hoặc chất điện li yếu tạo thành', 'Chỉ khi có nhiệt độ cao', 'Chỉ khi có xúc tác', 'Khi có ánh sáng', 'A'),
(8, 'Hóa học', 'Muối Na₂CO₃ tan trong nước cho dung dịch có tính?', 'Axit', 'Bazơ', 'Trung tính', 'Oxi hóa', 'B'),
(9, 'Hóa học', 'Axit H₂SO₄ đặc có tính chất đặc biệt nào?', 'Tính oxi hóa mạnh', 'Tính khử mạnh', 'Bay hơi dễ', 'Không tan', 'A'),
(10, 'Hóa học', 'Khí H₂S có mùi?', 'Trứng thối', 'Hắc', 'Không mùi', 'Ngọt', 'A'),
(11, 'Hóa học', 'Dung dịch NaCl thuộc loại?', 'Axit', 'Bazơ', 'Muối', 'Hợp chất hữu cơ', 'C'),
(12, 'Hóa học', 'Dung dịch Ca(OH)₂ bão hòa gọi là?', 'Nước cứng', 'Nước vôi trong', 'Dung dịch axit', 'Dung dịch trung tính', 'B'),
(13, 'Hóa học', 'Khi đốt P trong O₂ thu được?', 'P₂O₅', 'P₂O₃', 'PCl₃', 'PH₃', 'A'),
(14, 'Hóa học', 'Công thức hóa học của amoniac?', 'NH₃', 'NO₂', 'N₂O', 'HNO₃', 'A'),
(15, 'Hóa học', 'Dung dịch nào phản ứng với HCl?', 'NaOH', 'KOH', 'Ca(OH)₂', 'Cả 3', 'D'),
(16, 'Hóa học', 'Khối lượng NaOH trong 0,5 mol NaOH?', '10 g', '20 g', '30 g', '40 g', 'B'),
(17, 'Hóa học', 'Số mol HCl trong 36,5 g HCl?', '0,5 mol', '1 mol', '2 mol', '3 mol', 'B'),
(18, 'Hóa học', 'Thể tích H₂ thu được khi cho 2 g H₂ tác dụng với O₂?', '11,2 lít', '22,4 lít', '33,6 lít', '44,8 lít', 'B'),
(19, 'Hóa học', 'Khối lượng Cu bám khi cho 16 g CuSO₄ tác dụng với Fe?', '6,4 g', '12,8 g', '8 g', '4 g', 'A'),
(20, 'Hóa học', 'Khối lượng muối NaCl tạo thành khi trung hòa 0,1 mol HCl bằng NaOH?', '5,85 g', '1,17 g', '0,585 g', '2,93 g', 'A'),
(21, 'Hóa học', 'Thể tích O₂ (đktc) cần cho 4 g H₂ cháy hết?', '11,2 lít', '22,4 lít', '33,6 lít', '44,8 lít', 'B'),
(22, 'Hóa học', 'Dung dịch chứa 9,8 g H₂SO₄ trong 100 g dung dịch. Nồng độ %?', '4,9%', '9,8%', '19,6%', '2%', 'B'),
(23, 'Hóa học', 'Khối lượng Na₂CO₃ cần để trung hòa 0,2 mol HCl?', '5,3 g', '10,6 g', '21,2 g', '2,65 g', 'B'),
(24, 'Hóa học', 'Khối lượng kết tủa BaSO₄ tạo thành từ 0,1 mol BaCl₂ và H₂SO₄?', '11,65 g', '23,3 g', '58,25 g', '5,825 g', 'B'),
(25, 'Hóa học', 'Số mol NH₃ trong 17 g NH₃?', '0,5 mol', '1 mol', '2 mol', '3 mol', 'B'),
(26, 'Hóa học', 'Thể tích khí H₂ thu được khi cho Zn + HCl dư (Zn=65 g/mol, lấy 6,5 g)?', '2,24 lít', '4,48 lít', '11,2 lít', '22,4 lít', 'A'),
(27, 'Hóa học', 'Khối lượng CaCO₃ cần để tạo 2,24 lít CO₂ (đktc)?', '5 g', '10 g', '20 g', '30 g', 'B'),
(28, 'Hóa học', 'Nồng độ mol của dung dịch chứa 58,5 g NaCl trong 1 lít dung dịch?', '0,5 M', '1 M', '2 M', '3 M', 'B'),
(29, 'Hóa học', 'Khối lượng Cu trong 0,2 mol CuSO₄?', '6,4 g', '12,8 g', '16 g', '32 g', 'B'),
(30, 'Hóa học', 'Khối lượng KOH trong 0,5 mol KOH?', '28 g', '56 g', '20 g', '40 g', 'A'),
(31, 'Hóa học', 'Vì sao không nên dùng nước giếng nhiễm phèn?', 'Chứa nhiều ion Fe³⁺, Al³⁺', 'Chứa nhiều muối NaCl', 'Chứa nhiều CO₂', 'Chứa nhiều NH₃', 'A'),
(32, 'Hóa học', 'Nước cứng tạm thời có thể làm mềm bằng?', 'Đun sôi', 'Lọc', 'Pha axit', 'Pha bazơ', 'A'),
(33, 'Hóa học', 'Khí SO₂ gây hiện tượng gì trong tự nhiên?', 'Mưa axit', 'Khói bụi', 'Sương mù', 'Ozon', 'A'),
(34, 'Hóa học', 'Dung dịch H₂SO₄ đặc được dùng để?', 'Làm khô khí', 'Làm mềm nước', 'Chế biến thực phẩm', 'Khử trùng', 'A'),
(35, 'Hóa học', 'Muối NaHCO₃ dùng trong thực phẩm gọi là?', 'Bột nở', 'Bột giặt', 'Bột ngọt', 'Bột mì', 'A'),
(36, 'Hóa học', 'Cho H₂SO₄ vào BaCl₂ hiện tượng?', 'Kết tủa trắng BaSO₄', 'Dung dịch trong suốt', 'Sủi bọt khí', 'Dung dịch đổi màu', 'A'),
(37, 'Hóa học', 'Cho AgNO₃ vào NaCl hiện tượng?', 'Kết tủa trắng AgCl', 'Dung dịch vàng', 'Không đổi', 'Dung dịch trong', 'A'),
(38, 'Hóa học', 'Cho quỳ tím vào NH₃, màu?', 'Xanh', 'Đỏ', 'Tím', 'Vàng', 'A'),
(39, 'Hóa học', 'Cho HCl vào CaCO₃, hiện tượng?', 'Sủi bọt khí CO₂', 'Kết tủa trắng', 'Dung dịch trong', 'Dung dịch vàng', 'A'),
(40, 'Hóa học', 'Cho NaOH vào AlCl₃, hiện tượng?', 'Kết tủa trắng Al(OH)₃', 'Dung dịch trong suốt', 'Khí thoát ra', 'Dung dịch vàng', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_chemistry_10`
--

CREATE TABLE `question_chemistry_10` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_chemistry_10`
--

INSERT INTO `question_chemistry_10` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Hóa học', 'Nguyên tố nào sau đây thuộc nhóm kim loại kiềm?', 'Na', 'Mg', 'Al', 'Fe', 'A'),
(2, 'Hóa học', 'Cấu hình electron của nguyên tử Oxi (Z=8) là:', '1s2 2s2 2p4', '1s2 2s2 2p6', '1s2 2s2 2p3', '1s2 2s2 2p5', 'A'),
(3, 'Hóa học', 'Liên kết trong phân tử H2 là:', 'Liên kết ion', 'Liên kết cộng hóa trị không cực', 'Liên kết cộng hóa trị có cực', 'Liên kết kim loại', 'B'),
(4, 'Hóa học', 'Nguyên tố nào sau đây có độ âm điện lớn nhất?', 'O', 'Cl', 'F', 'N', 'C'),
(5, 'Hóa học', 'Nguyên tử có Z=12 thuộc chu kì, nhóm nào?', 'Chu kì 3, nhóm IIA', 'Chu kì 2, nhóm IIA', 'Chu kì 3, nhóm IA', 'Chu kì 2, nhóm IIIA', 'A'),
(6, 'Hóa học', 'Trong bảng tuần hoàn, bán kính nguyên tử tăng khi:', 'Đi từ trái sang phải', 'Đi từ trên xuống dưới', 'Đi từ phải sang trái', 'Cả B và C đúng', 'D'),
(7, 'Hóa học', 'Nguyên tử khối trung bình của Clo là 35,5 do:', 'Clo có đồng vị', 'Clo có nhiều hợp chất', 'Clo phản ứng mạnh', 'Clo tồn tại ở dạng đơn chất', 'A'),
(8, 'Hóa học', 'Phản ứng hóa học là:', 'Quá trình biến đổi chất này thành chất khác', 'Quá trình thay đổi trạng thái', 'Quá trình thay đổi vật lí', 'Quá trình tổng hợp', 'A'),
(9, 'Hóa học', 'Nguyên tố chiếm tỉ lệ khối lượng lớn nhất trong vỏ Trái Đất là:', 'Si', 'O', 'Fe', 'Al', 'B'),
(10, 'Hóa học', 'Khí nào là thành phần chính của không khí?', 'O2', 'CO2', 'N2', 'H2', 'C'),
(11, 'Hóa học', 'Cho Na vào nước, hiện tượng nào xảy ra?', 'Sủi bọt khí H2, dung dịch kiềm', 'Kết tủa trắng', 'Khí không màu mùi khai', 'Không hiện tượng', 'A'),
(12, 'Hóa học', 'Cho quỳ tím vào dung dịch HCl, quỳ tím chuyển thành:', 'Xanh', 'Đỏ', 'Tím', 'Vàng', 'B'),
(13, 'Hóa học', 'Cho dung dịch NaOH vào dung dịch CuSO4, hiện tượng:', 'Kết tủa xanh xuất hiện', 'Kết tủa trắng', 'Dung dịch trong suốt', 'Khí thoát ra', 'A'),
(14, 'Hóa học', 'Khí nào làm vẩn đục nước vôi trong?', 'CO2', 'O2', 'N2', 'H2', 'A'),
(15, 'Hóa học', 'Đốt cháy Mg trong không khí, sản phẩm chính:', 'MgO', 'MgCO3', 'Mg(OH)2', 'MgCl2', 'A'),
(16, 'Hóa học', 'Cho dung dịch BaCl2 vào dung dịch Na2SO4, hiện tượng:', 'Kết tủa trắng xuất hiện', 'Khí thoát ra', 'Dung dịch xanh', 'Không hiện tượng', 'A'),
(17, 'Hóa học', 'Khí Clo có màu gì?', 'Không màu', 'Vàng lục nhạt', 'Đỏ nâu', 'Xanh lam', 'B'),
(18, 'Hóa học', 'Dung dịch nào làm quỳ tím hóa xanh?', 'NaCl', 'NaOH', 'H2SO4', 'CuSO4', 'B'),
(19, 'Hóa học', 'Khí NH3 có mùi:', 'Hắc, khai', 'Thơm', 'Không mùi', 'Ngọt', 'A'),
(20, 'Hóa học', 'Cho Fe vào dung dịch CuSO4, hiện tượng:', 'Xuất hiện chất rắn màu đỏ bám vào Fe', 'Sủi bọt khí', 'Dung dịch đổi màu vàng', 'Không hiện tượng', 'A'),
(21, 'Hóa học', 'Khí nào dùng để chữa sâu răng?', 'CO2', 'O3', 'N2O', 'CH4', 'C'),
(22, 'Hóa học', 'Vôi sống (CaO) được dùng để:', 'Khử chua đất', 'Làm khô khí', 'Xử lý nước thải', 'Tất cả đều đúng', 'D'),
(23, 'Hóa học', 'Than hoạt tính thường dùng để:', 'Lọc khí', 'Lọc nước', 'Khử màu', 'Tất cả đúng', 'D'),
(24, 'Hóa học', 'Hợp chất nào được dùng để sản xuất phân bón amoniac?', 'NH3', 'HCl', 'CO2', 'O2', 'A'),
(25, 'Hóa học', 'Khí nào gây hiệu ứng nhà kính mạnh?', 'N2', 'O2', 'CO2', 'Ar', 'C'),
(26, 'Hóa học', 'Dung dịch H2SO4 loãng dùng trong:', 'Ắc quy', 'Sản xuất phân bón', 'Tẩy gỉ kim loại', 'Tất cả đúng', 'D'),
(27, 'Hóa học', 'Khí Cl2 được sử dụng để:', 'Khử trùng nước', 'Điều chế HCl', 'Tẩy trắng giấy', 'Tất cả đúng', 'D'),
(28, 'Hóa học', 'Kim loại nào được dùng làm dây dẫn điện?', 'Fe', 'Al', 'Cu', 'Zn', 'C'),
(29, 'Hóa học', 'NaHCO3 có ứng dụng:', 'Làm thuốc muối chữa đau dạ dày', 'Làm bánh', 'Chữa bệnh', 'Cả A và B', 'D'),
(30, 'Hóa học', 'Kim loại nào có tính khử mạnh, dùng làm chất khử trong luyện kim?', 'Cu', 'Zn', 'Al', 'Na', 'D'),
(31, 'Hóa học', 'Tính số mol trong 11,2 lít khí O2 (đktc).', '0,25 mol', '0,5 mol', '1 mol', '2 mol', 'B'),
(32, 'Hóa học', 'Khối lượng NaCl trong 0,5 mol là:', '14,6 g', '29,25 g', '58,5 g', '117 g', 'C'),
(33, 'Hóa học', 'Số mol H2 thu được khi cho 2 g Zn tác dụng với dung dịch HCl dư.', '0,015 mol', '0,03 mol', '0,05 mol', '0,1 mol', 'C'),
(34, 'Hóa học', 'Thể tích H2 (đktc) tạo ra khi điện phân 0,1 mol H2O.', '1,12 lít', '2,24 lít', '3,36 lít', '4,48 lít', 'B'),
(35, 'Hóa học', 'Khối lượng CaCO3 cần dùng để thu được 6,72 lít CO2 (đktc).', '5 g', '10 g', '15 g', '20 g', 'C'),
(36, 'Hóa học', 'Dung dịch chứa 0,1 mol NaOH trong 100 ml. Nồng độ mol/l là:', '0,5 M', '1 M', '2 M', '0,1 M', 'B'),
(37, 'Hóa học', 'Tính phần trăm khối lượng N trong NH3.', '75%', '82,35%', '87,5%', '92%', 'A'),
(38, 'Hóa học', 'Khối lượng kết tủa thu được khi cho 100 ml dung dịch BaCl2 1M tác dụng với Na2SO4 dư.', '19,6 g', '23,3 g', '15 g', '9,8 g', 'A'),
(39, 'Hóa học', 'Số mol e trao đổi trong phản ứng: Fe → Fe3+ + 3e.', '1', '2', '3', '0,5', 'C'),
(40, 'Hóa học', 'Dung dịch HCl 1M có pH =', '0', '1', '2', '3', 'B');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_chemistry_11`
--

CREATE TABLE `question_chemistry_11` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_chemistry_11`
--

INSERT INTO `question_chemistry_11` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Hóa học', 'Nguyên tố nào sau đây thuộc nhóm Halogen?', 'Na', 'Cl', 'Mg', 'Ca', 'B'),
(2, 'Hóa học', 'Cấu hình electron của nguyên tử S (Z=16) là:', '1s2 2s2 2p6 3s2 3p4', '1s2 2s2 2p6 3s2 3p6', '1s2 2s2 2p6 3s2 3p2', '1s2 2s2 2p6 3s2 3p3', 'A'),
(3, 'Hóa học', 'Liên kết trong phân tử HCl là:', 'Liên kết ion', 'Liên kết cộng hóa trị có cực', 'Liên kết cộng hóa trị không cực', 'Liên kết kim loại', 'B'),
(4, 'Hóa học', 'Nguyên tố nào sau đây có tính phi kim mạnh nhất?', 'Cl', 'Br', 'I', 'At', 'A'),
(5, 'Hóa học', 'Nguyên tử có Z=20 thuộc chu kì, nhóm nào?', 'Chu kì 4, nhóm IIA', 'Chu kì 3, nhóm IIA', 'Chu kì 4, nhóm IA', 'Chu kì 2, nhóm IIA', 'A'),
(6, 'Hóa học', 'Trong bảng tuần hoàn, độ âm điện giảm khi:', 'Đi từ trái sang phải', 'Đi từ trên xuống dưới', 'Đi từ phải sang trái', 'Cả A và B đúng', 'B'),
(7, 'Hóa học', 'Nguyên tử khối trung bình của Brom là 79,9 do:', 'Brom có đồng vị', 'Brom có nhiều hợp chất', 'Brom phản ứng mạnh', 'Brom tồn tại ở dạng đơn chất', 'A'),
(8, 'Hóa học', 'Phản ứng oxi hóa khử là:', 'Quá trình thay đổi số oxi hóa của nguyên tố', 'Quá trình tổng hợp', 'Quá trình phân hủy', 'Quá trình trao đổi ion', 'A'),
(9, 'Hóa học', 'Nguyên tố nào chiếm tỉ lệ lớn nhất trong cơ thể người?', 'O', 'C', 'H', 'N', 'A'),
(10, 'Hóa học', 'Hợp chất nào sau đây là hiđroxit lưỡng tính?', 'NaOH', 'Ca(OH)2', 'Al(OH)3', 'Fe(OH)2', 'C'),
(11, 'Hóa học', 'Cho Na vào dung dịch CuSO4, hiện tượng nào xảy ra?', 'Sủi bọt khí, kết tủa đỏ', 'Kết tủa xanh', 'Có khí bay ra và kết tủa Cu', 'Không hiện tượng', 'C'),
(12, 'Hóa học', 'Cho quỳ tím vào dung dịch Na2CO3, quỳ tím chuyển thành:', 'Đỏ', 'Xanh', 'Tím', 'Vàng', 'B'),
(13, 'Hóa học', 'Cho dung dịch NaOH vào dung dịch AlCl3 dư, hiện tượng:', 'Kết tủa keo trắng tan khi dư NaOH', 'Kết tủa keo trắng không tan', 'Dung dịch trong suốt', 'Khí bay ra', 'A'),
(14, 'Hóa học', 'Khí nào làm nhạt màu dung dịch KMnO4?', 'CO2', 'H2', 'SO2', 'O2', 'C'),
(15, 'Hóa học', 'Đốt cháy S trong không khí, sản phẩm chính:', 'SO3', 'SO2', 'H2S', 'SCl2', 'B'),
(16, 'Hóa học', 'Cho dung dịch AgNO3 vào dung dịch NaCl, hiện tượng:', 'Kết tủa trắng xuất hiện', 'Khí thoát ra', 'Dung dịch xanh', 'Không hiện tượng', 'A'),
(17, 'Hóa học', 'Khí NO2 có màu gì?', 'Không màu', 'Vàng lục nhạt', 'Đỏ nâu', 'Xanh lam', 'C'),
(18, 'Hóa học', 'Dung dịch nào làm quỳ tím hóa đỏ?', 'NaOH', 'HCl', 'NaCl', 'Na2CO3', 'B'),
(19, 'Hóa học', 'Khí H2S có mùi:', 'Hắc, khai', 'Thối trứng', 'Không mùi', 'Ngọt', 'B'),
(20, 'Hóa học', 'Cho FeS tác dụng với HCl, khí thoát ra là:', 'H2', 'H2S', 'SO2', 'CO2', 'B'),
(21, 'Hóa học', 'Khí SO2 được sử dụng trong:', 'Tẩy trắng giấy', 'Sát trùng', 'Làm khô khí', 'Chữa bệnh', 'A'),
(22, 'Hóa học', 'Nước Gia-ven dùng để:', 'Khử trùng', 'Nhuộm vải', 'Điều chế NaOH', 'Điều chế H2', 'A'),
(23, 'Hóa học', 'Hợp chất nào được dùng làm phân bón đạm?', 'NH4NO3', 'CaSO4', 'KCl', 'NaCl', 'A'),
(24, 'Hóa học', 'Khí nào gây mưa axit?', 'N2', 'SO2', 'CO', 'O2', 'B'),
(25, 'Hóa học', 'Dung dịch HF được dùng để:', 'Khắc thủy tinh', 'Làm khô khí', 'Chữa bệnh', 'Khử trùng', 'A'),
(26, 'Hóa học', 'Dung dịch NaOH được dùng trong:', 'Sản xuất xà phòng', 'Làm khô khí', 'Tẩy trắng bông', 'Điều chế HCl', 'A'),
(27, 'Hóa học', 'Khí NH3 được dùng trong:', 'Sản xuất phân đạm', 'Làm lạnh', 'Sản xuất HNO3', 'Tất cả đúng', 'D'),
(28, 'Hóa học', 'Kim loại nào dùng chế tạo hợp kim nhẹ?', 'Fe', 'Al', 'Cu', 'Zn', 'B'),
(29, 'Hóa học', 'CaCO3 có ứng dụng:', 'Sản xuất xi măng', 'Làm đá vôi xây dựng', 'Sản xuất vôi sống', 'Tất cả đúng', 'D'),
(30, 'Hóa học', 'Khí Cl2 có hại vì:', 'Ăn mòn kim loại', 'Gây độc', 'Ô nhiễm môi trường', 'Tất cả đúng', 'D'),
(31, 'Hóa học', 'Tính số mol trong 22,4 lít khí N2 (đktc).', '0,5 mol', '1 mol', '2 mol', '0,25 mol', 'B'),
(32, 'Hóa học', 'Khối lượng CaCO3 trong 0,2 mol là:', '20 g', '30 g', '40 g', '50 g', 'C'),
(33, 'Hóa học', 'Số mol H2 thu được khi cho 5,4 g Al tác dụng với dung dịch HCl dư.', '0,1 mol', '0,15 mol', '0,2 mol', '0,25 mol', 'C'),
(34, 'Hóa học', 'Thể tích O2 (đktc) cần để đốt cháy 0,1 mol CH4.', '2,24 lít', '4,48 lít', '6,72 lít', '8,96 lít', 'D'),
(35, 'Hóa học', 'Khối lượng NaOH cần để trung hòa 100 ml dung dịch HCl 1M.', '2 g', '4 g', '6 g', '8 g', 'A'),
(36, 'Hóa học', 'Dung dịch chứa 0,2 mol Na2SO4 trong 200 ml. Nồng độ mol/l là:', '0,5 M', '1 M', '2 M', '0,1 M', 'B'),
(37, 'Hóa học', 'Tính phần trăm khối lượng O trong H2SO4.', '65,3%', '70%', '73%', '80%', 'A'),
(38, 'Hóa học', 'Khối lượng kết tủa thu được khi cho 100 ml dung dịch AgNO3 1M tác dụng với NaCl dư.', '14,35 g', '10 g', '7,175 g', '5 g', 'A'),
(39, 'Hóa học', 'Số mol e trao đổi trong phản ứng: 2Fe2+ → 2Fe3+ + 2e.', '1', '2', '3', '4', 'B'),
(40, 'Hóa học', 'Dung dịch NaOH 0,01M có pH =', '11', '12', '13', '10', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_chemistry_12`
--

CREATE TABLE `question_chemistry_12` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_chemistry_12`
--

INSERT INTO `question_chemistry_12` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Hóa học', 'Nguyên tố nào sau đây thuộc nhóm kim loại kiềm thổ?', 'Na', 'Ca', 'Al', 'K', 'B'),
(2, 'Hóa học', 'Cấu hình electron của nguyên tử Fe (Z=26) là:', '[Ar] 3d6 4s2', '[Ar] 3d5 4s1', '[Ar] 3d7 4s1', '[Ar] 3d8', 'A'),
(3, 'Hóa học', 'Liên kết trong phân tử NaCl là:', 'Liên kết ion', 'Liên kết cộng hóa trị có cực', 'Liên kết cộng hóa trị không cực', 'Liên kết kim loại', 'A'),
(4, 'Hóa học', 'Nguyên tố nào sau đây có tính oxi hóa mạnh nhất?', 'Cl2', 'O2', 'F2', 'Br2', 'C'),
(5, 'Hóa học', 'Nguyên tử có Z=56 thuộc chu kì, nhóm nào?', 'Chu kì 6, nhóm IIA', 'Chu kì 5, nhóm IA', 'Chu kì 6, nhóm IA', 'Chu kì 5, nhóm IIA', 'A'),
(6, 'Hóa học', 'Trong dãy điện hóa, kim loại nào có tính khử mạnh nhất?', 'K', 'Na', 'Ca', 'Li', 'A'),
(7, 'Hóa học', 'Khái niệm este là:', 'Hợp chất hữu cơ có nhóm –COOH', 'Hợp chất hữu cơ có nhóm –COO–', 'Hợp chất hữu cơ có nhóm –OH', 'Hợp chất hữu cơ có nhóm –CHO', 'B'),
(8, 'Hóa học', 'Axit nào sau đây là axit mạnh?', 'CH3COOH', 'H2CO3', 'H2SO4', 'H2S', 'C'),
(9, 'Hóa học', 'Amin bậc 1 có công thức tổng quát:', 'R–NH2', 'R2NH', 'R3N', 'Ar–NH2', 'A'),
(10, 'Hóa học', 'Polime nào sau đây thuộc loại polime thiên nhiên?', 'Nilon-6,6', 'Tinh bột', 'Polietilen', 'Polipropilen', 'B'),
(11, 'Hóa học', 'Đốt cháy C2H5OH trong oxi, hiện tượng nào xảy ra?', 'Khí không màu thoát ra', 'Ngọn lửa xanh, tạo CO2 và H2O', 'Khí mùi khai thoát ra', 'Kết tủa trắng', 'B'),
(12, 'Hóa học', 'Cho dung dịch NaOH vào dung dịch Al(OH)3 dư, hiện tượng:', 'Kết tủa keo trắng tan', 'Kết tủa keo trắng không tan', 'Dung dịch trong suốt', 'Khí bay ra', 'A'),
(13, 'Hóa học', 'Cho Cu tác dụng với dung dịch H2SO4 đặc, nóng, hiện tượng:', 'Khí SO2 thoát ra, dung dịch xanh', 'Khí O2 thoát ra', 'Khí H2 thoát ra', 'Dung dịch không đổi', 'A'),
(14, 'Hóa học', 'Dẫn khí CO2 vào dung dịch Ca(OH)2 dư, hiện tượng:', 'Kết tủa trắng xuất hiện', 'Dung dịch vẩn đục', 'Kết tủa tan một phần', 'Không hiện tượng', 'C'),
(15, 'Hóa học', 'Cho AgNO3 vào dung dịch NH3 dư, hiện tượng:', 'Kết tủa trắng tan tạo dung dịch phức', 'Kết tủa vàng', 'Dung dịch đổi màu xanh', 'Không hiện tượng', 'A'),
(16, 'Hóa học', 'Thí nghiệm tráng gương dùng để nhận biết:', 'Ancol', 'Andehit', 'Xeton', 'Axit', 'B'),
(17, 'Hóa học', 'Cho phenol vào dung dịch brom, hiện tượng:', 'Kết tủa trắng xuất hiện', 'Dung dịch xanh', 'Khí thoát ra', 'Không hiện tượng', 'A'),
(18, 'Hóa học', 'Cho dung dịch HCl vào dung dịch Na2CO3, hiện tượng:', 'Kết tủa trắng xuất hiện', 'Khí không màu thoát ra', 'Dung dịch đổi màu', 'Không hiện tượng', 'B'),
(19, 'Hóa học', 'Dung dịch nào làm quỳ tím hóa xanh?', 'CH3COOH', 'NaOH', 'NaCl', 'H2SO4 loãng', 'B'),
(20, 'Hóa học', 'Đốt cháy glucozơ trong không khí, sản phẩm tạo thành:', 'CO2 và H2O', 'CO và H2O', 'C và H2', 'CH4', 'A'),
(21, 'Hóa học', 'Axit axetic (CH3COOH) được dùng trong:', 'Làm giấm ăn', 'Làm phân bón', 'Chữa bệnh', 'Khử trùng', 'A'),
(22, 'Hóa học', 'Etanol được ứng dụng trong:', 'Sát trùng', 'Nhiên liệu', 'Dung môi', 'Tất cả đúng', 'D'),
(23, 'Hóa học', 'Metan (CH4) được dùng để:', 'Điều chế HCl', 'Làm nhiên liệu', 'Sản xuất xà phòng', 'Điều chế NaOH', 'B'),
(24, 'Hóa học', 'Benzen được dùng để:', 'Sản xuất nhựa', 'Sản xuất thuốc nổ TNT', 'Dung môi hữu cơ', 'Tất cả đúng', 'D'),
(25, 'Hóa học', 'Etilen (C2H4) được dùng để:', 'Kích thích quả chín', 'Làm nhiên liệu', 'Tẩy rửa', 'Làm dung môi', 'A'),
(26, 'Hóa học', 'Polietilen được ứng dụng trong:', 'Làm túi nilon', 'Ống dẫn', 'Vật dụng nhựa', 'Tất cả đúng', 'D'),
(27, 'Hóa học', 'Glucozơ được dùng trong:', 'Sản xuất bánh kẹo', 'Truyền dịch', 'Làm rượu etylic', 'Tất cả đúng', 'D'),
(28, 'Hóa học', 'Tinh bột có ứng dụng:', 'Chế biến thực phẩm', 'Sản xuất hồ dán', 'Nguyên liệu sản xuất đường glucozơ', 'Tất cả đúng', 'D'),
(29, 'Hóa học', 'Protein có vai trò:', 'Xây dựng cơ thể', 'Cung cấp năng lượng', 'Tham gia điều hòa hoạt động sống', 'Tất cả đúng', 'D'),
(30, 'Hóa học', 'Dầu mỡ khi bị ôi thiu là do:', 'Oxi hóa chất béo', 'Thủy phân chất béo', 'Phân hủy chất béo', 'Nhiệt phân chất béo', 'A'),
(31, 'Hóa học', 'Tính số mol trong 44 g CO2.', '0,5 mol', '1 mol', '1,5 mol', '2 mol', 'B'),
(32, 'Hóa học', 'Khối lượng NaOH cần để trung hòa 100 ml dung dịch H2SO4 0,5M.', '2 g', '4 g', '6 g', '8 g', 'B'),
(33, 'Hóa học', 'Số mol H2 thu được khi cho 5,6 g Fe tác dụng với HCl dư.', '0,05 mol', '0,1 mol', '0,15 mol', '0,2 mol', 'B'),
(34, 'Hóa học', 'Thể tích CO2 (đktc) tạo ra khi đốt cháy hoàn toàn 11 g C2H5OH (etanol).', '5,6 lít', '11,2 lít', '16,8 lít', '22,4 lít', 'B'),
(35, 'Hóa học', 'Khối lượng glucozơ (C6H12O6) trong 0,1 mol là:', '10 g', '18 g', '27 g', '18 g', 'B'),
(36, 'Hóa học', 'Dung dịch chứa 0,5 mol NaOH trong 0,25 lít. Nồng độ mol/l là:', '1 M', '2 M', '3 M', '4 M', 'B'),
(37, 'Hóa học', 'Tính phần trăm khối lượng C trong CH3COOH.', '40%', '46,7%', '50%', '53,3%', 'B'),
(38, 'Hóa học', 'Khối lượng kết tủa thu được khi cho 0,1 mol AgNO3 tác dụng hết với NaCl.', '10,7 g', '14,35 g', '21,6 g', '28,7 g', 'B'),
(39, 'Hóa học', 'Số mol e trao đổi trong phản ứng: Cu → Cu2+ + 2e.', '1', '2', '3', '4', 'B'),
(40, 'Hóa học', 'Dung dịch HCl 0,01M có pH =', '1', '2', '3', '4', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_english_6`
--

CREATE TABLE `question_english_6` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_english_6`
--

INSERT INTO `question_english_6` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Anh văn', 'Choose the synonym of \'happy\':', 'angry', 'joyful', 'tired', 'sad', 'B'),
(2, 'Anh văn', 'Choose the antonym of \'modern\':', 'latest', 'recent', 'ancient', 'new', 'C'),
(3, 'Anh văn', 'Choose the synonym of \'intelligent\':', 'stupid', 'silly', 'lazy', 'clever', 'D'),
(4, 'Anh văn', 'Choose the antonym of \'cheap\':', 'bad', 'small', 'expensive', 'dirty', 'C'),
(5, 'Anh văn', 'Choose the synonym of \'rapid\':', 'quick', 'weak', 'lazy', 'slow', 'A'),
(6, 'Anh văn', 'Choose the antonym of \'ancient\':', 'modern', 'traditional', 'historic', 'old', 'A'),
(7, 'Anh văn', 'Choose the synonym of \'beautiful\':', 'bad', 'pretty', 'ugly', 'dirty', 'B'),
(8, 'Anh văn', 'Choose the antonym of \'strong\':', 'powerful', 'tough', 'weak', 'hard', 'C'),
(9, 'Anh văn', 'Choose the synonym of \'small\':', 'tiny', 'giant', 'huge', 'big', 'A'),
(10, 'Anh văn', 'Choose the antonym of \'difficult\':', 'complex', 'tough', 'hard', 'easy', 'D'),
(11, 'Anh văn', 'If I ____ harder, I would have passed.', 'had studied', 'studied', 'studying', 'study', 'A'),
(12, 'Anh văn', 'The car ____ by my father yesterday.', 'drove', 'is driven', 'was driven', 'drives', 'C'),
(13, 'Anh văn', 'She ____ to school every day.', 'gone', 'goes', 'go', 'going', 'B'),
(14, 'Anh văn', 'They ____ television now.', 'watches', 'watching', 'are watching', 'watch', 'C'),
(15, 'Anh văn', 'I ____ born in 2005.', 'am', 'is', 'was', 'are', 'C'),
(16, 'Anh văn', 'We ____ English yesterday.', 'learnt', 'learn', 'learning', 'learned', 'D'),
(17, 'Anh văn', 'I ____ to the cinema tomorrow.', 'will go', 'going', 'went', 'go', 'A'),
(18, 'Anh văn', 'He ____ English for 2 years.', 'learned', 'learning', 'learns', 'has learned', 'D'),
(19, 'Anh văn', 'By next year, I ____ here for 10 years.', 'live', 'lived', 'will have lived', 'will live', 'C'),
(20, 'Anh văn', 'If it rains, we ____ at home.', 'stay', 'will stay', 'stayed', 'staying', 'B'),
(21, 'Anh văn', 'Identify the error in: She suggested that he goes to the doctor.', 'She', 'goes', 'doctor', 'suggested', 'B'),
(22, 'Anh văn', 'Identify the error in: He said he is tired but he didn’t want to stop.', 'said', 'stop', 'want', 'is', 'D'),
(23, 'Anh văn', 'Identify the error in: This book are very interesting.', 'book', 'interesting', 'are', 'This', 'C'),
(24, 'Anh văn', 'Identify the error in: She don’t like playing football.', 'like', 'football', 'She', 'don’t', 'D'),
(25, 'Anh văn', 'Identify the error in: There is many students in the room.', 'many', 'There', 'is', 'room', 'C'),
(26, 'Anh văn', 'I will call you tomorrow,\' he said → He said that he ____ call me the next day.', 'would', 'should', 'will', 'shall', 'A'),
(27, 'Anh văn', 'People believe that she is the best student. → She ____ the best student.', 'is believing', 'believed to be', 'is believed to be', 'believes to be', 'C'),
(28, 'Anh văn', 'I can swim,\' she said → She said that she ____ swim.', 'could', 'should', 'can', 'shall', 'A'),
(29, 'Anh văn', 'They say that he is a good teacher. → He ____ a good teacher.', 'is saying', 'is said to be', 'say to be', 'said to be', 'B'),
(30, 'Anh văn', 'I am studying now,\' he said → He said that he ____ studying then.', 'is', 'was', 'were', 'be', 'B'),
(31, 'Anh văn', 'I have lived here ____ 5 years.', 'in', 'since', 'at', 'for', 'D'),
(32, 'Anh văn', 'This is the man ____ helped me.', 'which', 'whose', 'whom', 'who', 'D'),
(33, 'Anh văn', 'I prefer tea ____ coffee.', 'than', 'to', 'with', 'for', 'B'),
(34, 'Anh văn', 'This is the place ____ we met.', 'where', 'what', 'which', 'who', 'A'),
(35, 'Anh văn', 'She said she ____ come the next day.', 'would', 'can', 'will', 'could', 'A'),
(36, 'Anh văn', 'Which is NOT a use of the Internet?', 'Working', 'Cooking', 'Entertainment', 'Studying', 'B'),
(37, 'Anh văn', 'What is a disadvantage of the Internet?', 'Working online', 'Learning faster', 'Health problems', 'Entertainment', 'C'),
(38, 'Anh văn', 'What does \'it\' refer to?', 'the Internet', 'studying', 'daily life', 'people', 'A'),
(39, 'Anh văn', 'What is the main idea of the passage?', 'Disadvantages of studying', 'Benefits of the Internet', 'Avoiding health problems', 'Importance of the Internet', 'D'),
(40, 'Anh văn', 'Spending too much time online may cause:', 'better work', 'health problems', 'entertainment', 'happiness', 'B');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_english_7`
--

CREATE TABLE `question_english_7` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_english_7`
--

INSERT INTO `question_english_7` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Anh văn', 'Choose the synonym of \'happy\'.', 'glad', 'sad', 'angry', 'weak', 'A'),
(2, 'Anh văn', 'Choose the opposite of \'expensive\'.', 'cheap', 'dear', 'costly', 'valuable', 'A'),
(3, 'Anh văn', 'Which word is related to school?', 'teacher', 'river', 'tree', 'car', 'A'),
(4, 'Anh văn', 'Which one is a fruit?', 'apple', 'car', 'dog', 'table', 'A'),
(5, 'Anh văn', 'Find the odd one: cat, dog, book, mouse.', 'book', 'cat', 'dog', 'mouse', 'A'),
(6, 'Anh văn', 'The sun ___ in the east.', 'rises', 'sets', 'goes', 'puts', 'A'),
(7, 'Anh văn', 'Choose the opposite of \'hot\'.', 'cold', 'warm', 'boil', 'heat', 'A'),
(8, 'Anh văn', 'Choose the synonym of \'big\'.', 'large', 'small', 'tiny', 'narrow', 'A'),
(9, 'Anh văn', 'Which is an animal?', 'elephant', 'book', 'pen', 'table', 'A'),
(10, 'Anh văn', 'Choose the opposite of \'noisy\'.', 'quiet', 'loud', 'sound', 'voice', 'A'),
(11, 'Anh văn', 'He ___ to school every day.', 'goes', 'go', 'went', 'gone', 'A'),
(12, 'Anh văn', 'They ___ English now.', 'are studying', 'is studying', 'studied', 'study', 'A'),
(13, 'Anh văn', 'Lan ___ a new book yesterday.', 'bought', 'buy', 'buys', 'buying', 'A'),
(14, 'Anh văn', 'If it ___ tomorrow, we will stay at home.', 'rains', 'rain', 'raining', 'rained', 'A'),
(15, 'Anh văn', 'The homework ___ by the students.', 'is done', 'do', 'does', 'did', 'A'),
(16, 'Anh văn', 'We ___ dinner when the phone rang.', 'were having', 'are having', 'have', 'had', 'A'),
(17, 'Anh văn', 'She ___ watching TV at 8 pm last night.', 'was', 'is', 'are', 'were', 'A'),
(18, 'Anh văn', 'They ___ in Ha Noi since 2010.', 'have lived', 'live', 'lived', 'living', 'A'),
(19, 'Anh văn', 'He ___ a letter at the moment.', 'is writing', 'writes', 'wrote', 'write', 'A'),
(20, 'Anh văn', 'She ___ to the cinema next Sunday.', 'will go', 'go', 'goes', 'going', 'A'),
(21, 'Anh văn', 'Find the error: She don\'t like apples.', 'don\'t', 'She', 'like', 'apples', 'A'),
(22, 'Anh văn', 'Find the error: He go to school every day.', 'go', 'He', 'school', 'day', 'A'),
(23, 'Anh văn', 'Find the error: They was playing football.', 'was', 'They', 'football', 'playing', 'A'),
(24, 'Anh văn', 'Find the error: I am go to the park.', 'go', 'am', 'to', 'park', 'A'),
(25, 'Anh văn', 'Find the error: She can sings very well.', 'sings', 'can', 'She', 'well', 'A'),
(26, 'Anh văn', 'She is taller than Lan. → Lan is ___', 'shorter than she', 'shorter than her', 'taller than she', 'as tall as she', 'B'),
(27, 'Anh văn', 'He started studying two hours ago. → He ___', 'has studied for two hours', 'studies two hours', 'is studying two hours', 'was studying two hours', 'A'),
(28, 'Anh văn', 'The book is very interesting. → What ___', 'an interesting book', 'a interested book', 'a interest book', 'an interested book', 'A'),
(29, 'Anh văn', 'My father works very hard. → My father is ___', 'a hard-working man', 'a hardly man', 'hard man', 'man hardworking', 'A'),
(30, 'Anh văn', 'She last saw her mother two weeks ago. → She hasn\'t ___', 'seen her mother for two weeks', 'saw her mother for two weeks', 'see her mother two weeks', 'seeing her mother for two weeks', 'A'),
(31, 'Anh văn', 'Cloze: He ___ (1) football every day. He ___ (2) it very much.', 'plays / likes', 'play / like', 'played / liking', 'playing / like', 'A'),
(32, 'Anh văn', 'Cloze: My sister ___ (1) in Ha Noi. She ___ (2) to school by bike.', 'lives / goes', 'live / go', 'living / going', 'lived / went', 'A'),
(33, 'Anh văn', 'Cloze: Yesterday we ___ (1) to the zoo and ___ (2) many animals.', 'went / saw', 'go / see', 'go / saw', 'went / see', 'A'),
(34, 'Anh văn', 'Cloze: Nam is ___ (1) student. He ___ (2) in Hue.', 'a / lives', 'an / live', 'the / living', 'a / lived', 'A'),
(35, 'Anh văn', 'Cloze: It is hot today. Let\'s ___ (1) swimming. – That\'s ___ (2) good idea.', 'go / a', 'going / the', 'to go / the', 'goes / a', 'A'),
(36, 'Anh văn', 'Read: \'Hoa is 14 years old. She lives in Hue. She likes reading books.\' – How old is Hoa?', '14', '13', '15', '12', 'A'),
(37, 'Anh văn', 'Where does Hoa live?', 'Hue', 'Hanoi', 'Da Nang', 'Saigon', 'A'),
(38, 'Anh văn', 'What does Hoa like?', 'reading books', 'playing football', 'watching TV', 'singing', 'A'),
(39, 'Anh văn', 'Read: \'Nam goes to school every morning. He is a good student.\' – What does Nam do every morning?', 'goes to school', 'reads books', 'plays football', 'watches TV', 'A'),
(40, 'Anh văn', 'Nam is a ___?', 'good student', 'teacher', 'worker', 'doctor', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_english_8`
--

CREATE TABLE `question_english_8` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_english_8`
--

INSERT INTO `question_english_8` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Anh văn', 'Choose the synonym of \'important\'.', 'significant', 'tiny', 'cheap', 'weak', 'A'),
(2, 'Anh văn', 'Choose the opposite of \'dangerous\'.', 'safe', 'risky', 'strong', 'careless', 'A'),
(3, 'Anh văn', 'Which word is a job?', 'engineer', 'river', 'mountain', 'school', 'A'),
(4, 'Anh văn', 'Which is a means of transport?', 'bicycle', 'teacher', 'book', 'dog', 'A'),
(5, 'Anh văn', 'Find the odd one: bus, car, plane, banana.', 'banana', 'bus', 'car', 'plane', 'A'),
(6, 'Anh văn', 'Choose the synonym of \'clever\'.', 'intelligent', 'stupid', 'lazy', 'weak', 'A'),
(7, 'Anh văn', 'Choose the opposite of \'success\'.', 'failure', 'victory', 'win', 'achievement', 'A'),
(8, 'Anh văn', 'Choose the synonym of \'angry\'.', 'furious', 'happy', 'calm', 'quiet', 'A'),
(9, 'Anh văn', 'Choose the opposite of \'modern\'.', 'ancient', 'new', 'latest', 'up-to-date', 'A'),
(10, 'Anh văn', 'Choose the synonym of \'begin\'.', 'start', 'finish', 'end', 'stop', 'A'),
(11, 'Anh văn', 'If I ___ you, I would study harder.', 'were', 'am', 'is', 'was', 'A'),
(12, 'Anh văn', 'She has lived here ___ 2010.', 'since', 'for', 'at', 'in', 'A'),
(13, 'Anh văn', 'English ___ in many countries.', 'is spoken', 'speak', 'speaks', 'spoken', 'A'),
(14, 'Anh văn', 'He ___ TV when his mother came home.', 'was watching', 'watched', 'is watching', 'watches', 'A'),
(15, 'Anh văn', 'Lan said she ___ busy then.', 'was', 'is', 'are', 'were', 'A'),
(16, 'Anh văn', 'They ___ to Ha Long Bay last summer.', 'went', 'go', 'going', 'goes', 'A'),
(17, 'Anh văn', 'The letters ___ yesterday.', 'were sent', 'sent', 'are sent', 'is sent', 'A'),
(18, 'Anh văn', 'She ___ a new dress next week.', 'will buy', 'buy', 'buys', 'bought', 'A'),
(19, 'Anh văn', 'The homework ___ by Minh now.', 'is being done', 'done', 'was done', 'does', 'A'),
(20, 'Anh văn', 'He ___ to school yet.', 'hasn\'t gone', 'has gone', 'goes', 'went', 'A'),
(21, 'Anh văn', 'Find the error: She enjoy to play tennis.', 'enjoy', 'She', 'to play', 'tennis', 'C'),
(22, 'Anh văn', 'Find the error: They has finished their work.', 'has', 'They', 'work', 'finished', 'A'),
(23, 'Anh văn', 'Find the error: He can to swim very well.', 'to', 'He', 'swim', 'well', 'A'),
(24, 'Anh văn', 'Find the error: The students was in the classroom.', 'was', 'students', 'in', 'the', 'A'),
(25, 'Anh văn', 'Find the error: She don\'t like milk.', 'don\'t', 'She', 'milk', 'like', 'A'),
(26, 'Anh văn', 'She started learning English 5 years ago. → She ___', 'has learned English for 5 years', 'learns English 5 years', 'learned English since 5 years', 'has been learning English 5 years ago', 'A'),
(27, 'Anh văn', 'The last time I saw him was in 2010. → I haven\'t ___', 'seen him since 2010', 'saw him in 2010', 'see him since 2010', 'seeing him in 2010', 'A'),
(28, 'Anh văn', 'It\'s necessary for you to do the homework. → You ___', 'must do the homework', 'can do the homework', 'may do the homework', 'could do the homework', 'A'),
(29, 'Anh văn', 'She is too short to reach the shelf. → She is not ___', 'tall enough to reach the shelf', 'short enough to reach the shelf', 'tall to reach', 'able reach', 'A'),
(30, 'Anh văn', 'People grow rice in Vietnam. → Rice ___', 'is grown in Vietnam', 'grows in Vietnam', 'is grow in Vietnam', 'is grew in Vietnam', 'A'),
(31, 'Anh văn', 'Cloze: My father ___ (1) newspapers every morning. He ___ (2) it very much.', 'reads / likes', 'read / like', 'read / liking', 'reading / like', 'A'),
(32, 'Anh văn', 'Cloze: Hoa ___ (1) in Ha Noi since 2010. She ___ (2) in a factory.', 'has lived / has worked', 'lived / worked', 'lives / works', 'living / working', 'A'),
(33, 'Anh văn', 'Cloze: We ___ (1) dinner when the phone ___ (2).', 'were having / rang', 'have / ring', 'had / rings', 'are having / ringing', 'A'),
(34, 'Anh văn', 'Cloze: If it ___ (1) tomorrow, we ___ (2) at home.', 'rains / will stay', 'rain / stay', 'raining / stayed', 'rained / stays', 'A'),
(35, 'Anh văn', 'Cloze: The letters ___ (1) yesterday and they ___ (2) now.', 'were sent / are reading', 'was send / read', 'is sent / are reads', 'send / read', 'A'),
(36, 'Anh văn', 'Read: \'Ha Long Bay is one of the most famous places in Vietnam. Many tourists visit it every year.\' – What is Ha Long Bay?', 'a famous place', 'a mountain', 'a river', 'a school', 'A'),
(37, 'Anh văn', 'Where is Ha Long Bay?', 'Vietnam', 'China', 'Japan', 'Thailand', 'A'),
(38, 'Anh văn', 'Who visits Ha Long Bay every year?', 'many tourists', 'students', 'farmers', 'teachers', 'A'),
(39, 'Anh văn', 'Read: \'English is an international language. Millions of people speak it worldwide.\' – What is English?', 'an international language', 'a local language', 'not important', 'only for Asia', 'A'),
(40, 'Anh văn', 'How many people use English?', 'millions', 'thousands', 'hundreds', 'none', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_english_9`
--

CREATE TABLE `question_english_9` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_english_9`
--

INSERT INTO `question_english_9` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Anh văn', 'Choose the synonym of \'rapid\'.', 'fast', 'slow', 'weak', 'lazy', 'A'),
(2, 'Anh văn', 'Choose the opposite of \'generous\'.', 'mean', 'kind', 'happy', 'polite', 'A'),
(3, 'Anh văn', 'Choose the synonym of \'famous\'.', 'well-known', 'unknown', 'normal', 'poor', 'A'),
(4, 'Anh văn', 'Choose the opposite of \'ancient\'.', 'modern', 'old', 'aged', 'historic', 'A'),
(5, 'Anh văn', 'Choose the synonym of \'difficult\'.', 'hard', 'easy', 'soft', 'simple', 'A'),
(6, 'Anh văn', 'Choose the opposite of \'honest\'.', 'dishonest', 'truthful', 'sincere', 'loyal', 'A'),
(7, 'Anh văn', 'Choose the synonym of \'opinion\'.', 'view', 'fact', 'lie', 'truth', 'A'),
(8, 'Anh văn', 'Choose the opposite of \'love\'.', 'hate', 'like', 'enjoy', 'adore', 'A'),
(9, 'Anh văn', 'Choose the synonym of \'job\'.', 'occupation', 'holiday', 'festival', 'rest', 'A'),
(10, 'Anh văn', 'Choose the opposite of \'victory\'.', 'defeat', 'success', 'win', 'prize', 'A'),
(11, 'Anh văn', 'If it ___, we would cancel the trip.', 'rained', 'rains', 'rain', 'to rain', 'A'),
(12, 'Anh văn', 'He ___ his homework before 8pm yesterday.', 'had finished', 'finished', 'finishes', 'is finishing', 'A'),
(13, 'Anh văn', 'The book ___ was interesting.', 'which I read', 'I read which', 'I which read', 'read I which', 'A'),
(14, 'Anh văn', 'She asked me where I ___.', 'was', 'am', 'be', 'is', 'A'),
(15, 'Anh văn', 'The test ___ next week.', 'will be held', 'held', 'is hold', 'hold', 'A'),
(16, 'Anh văn', 'He suggested ___ to the park.', 'going', 'go', 'to go', 'gone', 'A'),
(17, 'Anh văn', 'It\'s important ___ English well.', 'to learn', 'learn', 'learning', 'learns', 'A'),
(18, 'Anh văn', 'She said she ___ to Ha Noi the next day.', 'would go', 'go', 'goes', 'will go', 'A'),
(19, 'Anh văn', 'This is the boy ___ mother is a doctor.', 'whose', 'who', 'which', 'that', 'A'),
(20, 'Anh văn', 'Lan said she ___ hungry.', 'was', 'is', 'were', 'are', 'A'),
(21, 'Anh văn', 'Find the error: If I was you, I will study harder.', 'was', 'you', 'will', 'study', 'C'),
(22, 'Anh văn', 'Find the error: He suggested to go to the cinema.', 'to go', 'He', 'cinema', 'suggested', 'A'),
(23, 'Anh văn', 'Find the error: She said me that she was busy.', 'said', 'me', 'that', 'was', 'A'),
(24, 'Anh văn', 'Find the error: The book which I buy yesterday is interesting.', 'buy', 'book', 'is', 'yesterday', 'A'),
(25, 'Anh văn', 'Find the error: He don\'t know the answer.', 'don\'t', 'He', 'know', 'answer', 'A'),
(26, 'Anh văn', 'She last visited her parents two months ago. → She hasn\'t ___', 'visited her parents for two months', 'visits her parents for two months', 'visit her parents for two months', 'visiting her parents since two months', 'A'),
(27, 'Anh văn', 'People speak English all over the world. → English ___', 'is spoken all over the world', 'spoken all over the world', 'was spoken all over the world', 'speaks all over the world', 'A'),
(28, 'Anh văn', 'He said: \'I am tired.\' → He said that he ___ tired.', 'was', 'is', 'are', 'were', 'A'),
(29, 'Anh văn', 'The last time I saw her was in 2015. → I haven\'t ___', 'seen her since 2015', 'see her since 2015', 'saw her since 2015', 'seeing her since 2015', 'A'),
(30, 'Anh văn', 'It\'s a pity I can\'t play the piano. → I wish I ___ the piano.', 'could play', 'can play', 'play', 'played', 'A'),
(31, 'Anh văn', 'Cloze: If I ___ (1) enough money, I ___ (2) a new computer.', 'had / would buy', 'have / will buy', 'had / will buy', 'has / would buy', 'A'),
(32, 'Anh văn', 'Cloze: She ___ (1) English for 5 years and she ___ (2) it very well.', 'has learned / uses', 'learned / use', 'learns / use', 'learning / using', 'A'),
(33, 'Anh văn', 'Cloze: The letters ___ (1) yesterday and they ___ (2) now.', 'were sent / are reading', 'was sent / read', 'is sent / are reads', 'send / read', 'A'),
(34, 'Anh văn', 'Cloze: If it ___ (1) tomorrow, we ___ (2) at home.', 'rains / will stay', 'rain / stay', 'raining / stayed', 'rained / stays', 'A'),
(35, 'Anh văn', 'Cloze: He ___ (1) TV when the phone ___ (2).', 'was watching / rang', 'watch / ring', 'watched / rings', 'is watching / ringing', 'A'),
(36, 'Anh văn', 'Read: \'Ha Noi is the capital of Vietnam. It is famous for many historical places.\' – What is Ha Noi?', 'the capital of Vietnam', 'a village', 'a city in China', 'a river', 'A'),
(37, 'Anh văn', 'What is Ha Noi famous for?', 'historical places', 'food', 'people', 'weather', 'A'),
(38, 'Anh văn', 'Read: \'Phong Nha Cave is one of the most beautiful caves in the world.\' – What is Phong Nha?', 'a cave', 'a mountain', 'a river', 'a lake', 'A'),
(39, 'Anh văn', 'Where is Phong Nha Cave?', 'Vietnam', 'China', 'Thailand', 'Japan', 'A'),
(40, 'Anh văn', 'Read: \'English is very important in modern life. People use it in many fields.\' – What is English used in?', 'many fields', 'only in Vietnam', 'just at school', 'only in America', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_english_10`
--

CREATE TABLE `question_english_10` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_english_10`
--

INSERT INTO `question_english_10` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Anh văn', 'Choose the word CLOSEST in meaning to \'abundant\'.', 'scarce', 'plentiful', 'ordinary', 'tiny', 'B'),
(2, 'Anh văn', 'Choose the word OPPOSITE in meaning in \'reluctant\'.', 'willing', 'anxious', 'hesitant', 'unsure', 'A'),
(3, 'Anh văn', 'Complete the sentence: Students should pay ___ in class.', 'notice', 'attention', 'look', 'regard', 'B'),
(4, 'Anh văn', 'Choose the best option: The boy really ___ his father.', 'looks up to', 'looks down on', 'looks for', 'looks after', 'A'),
(5, 'Anh văn', 'Choose the correct form: Her ___ in the exam surprised everyone.', 'succeed', 'success', 'successful', 'successfully', 'B'),
(6, 'Anh văn', 'Choose the best word: The museum offers free ___ for students on Sundays.', 'admission', 'permission', 'agreement', 'allowance', 'A'),
(7, 'Anh văn', 'Choose the correct collocation: After thinking for days, she finally ___ a decision.', 'did', 'made', 'got', 'took', 'B'),
(8, 'Anh văn', 'Choose the word CLOSEST in meaning to \'ancient\'.', 'modern', 'old-fashioned', 'prehistoric', 'contemporary', 'C'),
(9, 'Anh văn', 'Choose the best word: The new smartphone is not ___ to the old one; it\'s better in many ways.', 'comparable', 'considerate', 'confident', 'convenient', 'A'),
(10, 'Anh văn', 'Choose the correct preposition: She is responsible ___ organizing the event.', 'to', 'for', 'with', 'about', 'B'),
(11, 'Anh văn', 'Choose the correct verb form: Neither the teacher nor the students ___ satisfied.', 'is', 'are', 'be', 'were', 'B'),
(12, 'Anh văn', 'Choose the correct tense: He had already ___ his homework when I called.', 'has finished', 'had finished', 'finishes', 'was finishing', 'B'),
(13, 'Anh văn', 'Choose the correct form: If I ___ rich, I would travel around the world.', 'am', 'were', 'was', 'be', 'B'),
(14, 'Anh văn', 'Choose the correct passive form: They will hold the meeting tomorrow.', 'The meeting will be held tomorrow.', 'The meeting is held tomorrow.', 'The meeting has been held tomorrow.', 'The meeting was held tomorrow.', 'A'),
(15, 'Anh văn', 'Choose the correct relative pronoun: The book ___ I borrowed is interesting.', 'which', 'who', 'whom', 'where', 'A'),
(16, 'Anh văn', 'Choose the correct comparative form: This road is ___ than the other one.', 'most narrow', 'narrower', 'more narrow', 'the most narrow', 'B'),
(17, 'Anh văn', 'Choose the correct article: ___ Nile is the longest river in Africa.', 'A', 'An', 'The', 'No article', 'C'),
(18, 'Anh văn', 'Choose the correct reported speech: John said, \'I am studying now.\'', 'John said that he is studying then.', 'John said that he was studying then.', 'John said that he were studying then.', 'John said that he has been studying then.', 'B'),
(19, 'Anh văn', 'Choose the correct preposition: He is interested ___ biology.', 'in', 'on', 'about', 'for', 'A'),
(20, 'Anh văn', 'Choose the best modal verb: You ___ finish your homework before playing games.', 'may', 'should', 'can', 'would', 'B'),
(21, 'Anh văn', 'Choose the underlined part that contains an error: She enjoys to read novels in her free time.', 'enjoys', 'to read', 'novels', 'in her free time', 'B'),
(22, 'Anh văn', 'Choose the underlined part that contains an error: The information are not accurate.', 'The information', 'are', 'not', 'accurate', 'B'),
(23, 'Anh văn', 'Choose the underlined part that contains an error: He suggested to go to the cinema.', 'He', 'suggested', 'to go', 'to the cinema', 'C'),
(24, 'Anh văn', 'Choose the underlined part that contains an error: My father has worked in this factory since ten years.', 'has worked in this factory', 'since', 'ten years', ' ', 'C'),
(25, 'Anh văn', 'Choose the underlined part that contains an error: The book which I bought it yesterday is expensive.', 'The book', 'which I bought it', 'yesterday', 'is expensive', 'B'),
(26, 'Anh văn', 'Choose the sentence closest in meaning: It\'s not necessary for you to come early.', 'You must come early.', 'You needn\'t come early.', 'You should have come early.', 'You had better come early.', 'B'),
(27, 'Anh văn', 'Choose the sentence closest in meaning: Despite being tired, she finished her work.', 'Although she was tired, she finished her work.', 'Because she was tired, she finished her work.', 'In spite of she was tired, she finished her work.', 'She finished her work so she was tired.', 'A'),
(28, 'Anh văn', 'Choose the sentence closest in meaning: They started playing football two hours ago.', 'They have played football for two hours.', 'They play football since two hours.', 'They are playing football two hours ago.', 'They will have played football for two hours.', 'A'),
(29, 'Anh văn', 'Choose the sentence closest in meaning: The last time I saw him was in 2023.', 'I haven\'t seen him since 2023.', 'I didn\'t see him in 2023.', 'I had seen him in 2023.', 'I have seen him in 2023.', 'A'),
(30, 'Anh văn', 'Choose the sentence closest in meaning: Jane is more intelligent than any other student in her class.', 'Jane is the most intelligent student in her class.', 'Jane is as intelligent as the other students in her class.', 'No students in her class is as intelligent as Jane.', 'Jane is more intelligent as the other students.', 'A'),
(31, 'Anh văn', 'Read the passage and choose the best answer for blank (1): Online learning has become increasingly popular in recent years. It allows students to study at home and (1) _____ their schedules more easily. However, staying motivated can be difficult. To be successful, learners should set clear goals, create a quiet (2) _____ for study, and take regular breaks. It is also important to interact with teachers and classmates through forums or video calls. By asking questions and sharing ideas, students can feel more (3) _____ and improve their understanding. Finally, they should (4) _____ their progress weekly and adjust their plans if necessary to stay on (5) _____.', 'arrange', 'manage', 'design', 'operate', 'B'),
(32, 'Anh văn', 'Using the same passage above, choose the best answer for blank (2).', 'atmosphere', 'environment', 'location', 'corner', 'B'),
(33, 'Anh văn', 'Using the same passage above, choose the best answer for blank (3).', 'connected', 'lonely', 'silent', 'private', 'A'),
(34, 'Anh văn', 'Using the same passage above, choose the best answer for blank (4).', 'measure', 'predict', 'prevent', 'ignore', 'A'),
(35, 'Anh văn', 'Using the same passage above, choose the best answer for blank (5).', 'way', 'line', 'track', 'road', 'C'),
(36, 'Anh văn', 'Read the passage and choose the best answer to the question: Many high school students choose to take part-time jobs. Working after school can teach responsibility and time management. Students learn to communicate with customers, cooperate with teammates, and solve problems under pressure. However, part-time work also has drawbacks. Long hours may lead to stress and lower grades, especially during exam periods. To find a balance, students should limit their working hours and choose jobs that match their skills or interests. When work supports learning and personal growth, it can be a valuable experience rather than a distraction. What is the main idea of the passage?', 'Part-time jobs always harm students.', 'Part-time jobs have benefits and drawbacks for students.', 'Students should avoid working until university.', 'Employers should pay students more.', 'B'),
(37, 'Anh văn', 'According to the passage, which is NOT mentioned as a benefit of part-time jobs?', 'Responsibility', 'Time management', 'Communication', 'Higher salaries', 'D'),
(38, 'Anh văn', 'According to the passage, when can part-time work be harmful?', 'When hours are long during exam periods.', 'When jobs match students\' interests.', 'When students learn to cooperate.', 'When employers are friendly.', 'A'),
(39, 'Anh văn', 'The word \'balance\' in the passage is closest in meaning to:', 'schedule', 'advantage', 'harmony', 'opinion', 'C'),
(40, 'Anh văn', 'The word \'it\' in the last sentence refers to:', 'personal growth', 'working after school', 'exam periods', 'lower grades', 'B');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_english_11`
--

CREATE TABLE `question_english_11` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_english_11`
--

INSERT INTO `question_english_11` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Anh văn', 'Choose the word CLOSEST in meaning to \'eliminate\'.', 'remove', 'create', 'ignore', 'add', 'A'),
(2, 'Anh văn', 'Choose the word OPPOSITE in meaning to \'optimistic\'.', 'hopeful', 'positive', 'pessimistic', 'confident', 'C'),
(3, 'Anh văn', 'Complete the sentence: The company needs to ___ new staff immediately.', 'recruit', 'fire', 'delay', 'produce', 'A'),
(4, 'Anh văn', 'Choose the correct collocation: He has a strong ___ for music.', 'ability', 'talent', 'skill', 'gift', 'B'),
(5, 'Anh văn', 'Choose the best word: This new law will come into ___ next month.', 'force', 'strength', 'effect', 'power', 'C'),
(6, 'Anh văn', 'Choose the word CLOSEST in meaning to \'sustainable\'.', 'temporary', 'lasting', 'fragile', 'short-term', 'B'),
(7, 'Anh văn', 'Choose the correct phrase: The teacher asked the students to hand ___ their papers.', 'out', 'over', 'in', 'off', 'C'),
(8, 'Anh văn', 'Choose the best word: The internet can be a useful ___ of information.', 'resource', 'reason', 'result', 'report', 'A'),
(9, 'Anh văn', 'Choose the correct word: She made a great ___ on the audience with her speech.', 'impression', 'impact', 'affection', 'decision', 'A'),
(10, 'Anh văn', 'Choose the correct preposition: They succeeded ___ solving the problem.', 'on', 'in', 'about', 'for', 'B'),
(11, 'Anh văn', 'Choose the correct conditional: If he had studied harder, he ___ the exam.', 'will pass', 'would pass', 'would have passed', 'passes', 'C'),
(12, 'Anh văn', 'Choose the correct tense: By the time she arrived, we ___ for an hour.', 'wait', 'have waited', 'had been waiting', 'waited', 'C'),
(13, 'Anh văn', 'Choose the correct form: The problem needs ___ immediately.', 'to solve', 'solved', 'be solved', 'solving', 'D'),
(14, 'Anh văn', 'Choose the correct voice: They are going to build a new bridge here.', 'A new bridge is built here.', 'A new bridge is going to build here.', 'A new bridge is going to be built here.', 'A new bridge was being built here.', 'C'),
(15, 'Anh văn', 'Choose the correct word order: Only after the meeting ___ the decision.', 'they announced', 'was announced', 'did they announce', 'they had announced', 'C'),
(16, 'Anh văn', 'Choose the correct article: He is ___ honest man.', 'a', 'an', 'the', 'no article', 'B'),
(17, 'Anh văn', 'Choose the correct relative pronoun: That is the place ___ we met years ago.', 'which', 'where', 'who', 'what', 'B'),
(18, 'Anh văn', 'Choose the correct reported speech: She said, \'I will call you tomorrow.\'', 'She said she will call me the next day.', 'She said that he was studying then.', 'She said she would call me the next day.', 'She said she will call me tomorrow.', 'C'),
(19, 'Anh văn', 'Choose the correct modal verb: You ___ smoke here; it’s forbidden.', 'mustn\'t', 'can\'t', 'shouldn\'t', 'wouldn\'t', 'A'),
(20, 'Anh văn', 'Choose the correct form: Not only ___ late, but he also forgot his homework.', 'did he arrive', 'he arrived', 'does he arrive', 'he had arrived', 'A'),
(21, 'Anh văn', 'Choose the underlined part that contains an error: She prevented me from to go out at night.', 'prevented', 'me', 'from', 'to go', 'D'),
(22, 'Anh văn', 'Choose the underlined part that contains an error: The books on the shelf needs to be arranged neatly.', 'The books', 'on the shelf', 'needs', 'to be arranged', 'C'),
(23, 'Anh văn', 'Choose the underlined part that contains an error: Neither the teacher nor the students was ready for the trip.', 'Neither', 'the teacher', 'nor the students', 'was', 'D'),
(24, 'Anh văn', 'Choose the underlined part that contains an error: He suggested that she studies harder for the next exam.', 'He suggested', 'that', 'she', 'studies', 'D'),
(25, 'Anh văn', 'Choose the underlined part that contains an error: Unless you will study harder, you won\'t pass the exam.', 'Unless', 'you will study', 'harder', 'you won\'t pass', 'B'),
(26, 'Anh văn', 'Choose the sentence closest in meaning: They last visited Hanoi two years ago.', 'They have visited Hanoi for two years.', 'They haven\'t visited Hanoi for two years.', 'They visited Hanoi two years.', 'They were visiting Hanoi two years ago.', 'B'),
(27, 'Anh văn', 'Choose the sentence closest in meaning: She is too short to reach the top shelf.', 'She is so short that she can\'t reach the top shelf.', 'She is very short and she can reach the top shelf.', 'She is short enough to reach the top shelf.', 'She is shorter to reach the top shelf.', 'A'),
(28, 'Anh văn', 'Choose the sentence closest in meaning: They said that she had passed the exam.', 'She is said to pass the exam.', 'She is said to have passed the exam.', 'She was said she passed the exam.', 'She said she passed the exam.', 'B'),
(29, 'Anh văn', 'Choose the sentence closest in meaning: It is believed that the boy is intelligent.', 'The boy believes to be intelligent.', 'The boy is believed to be intelligent.', 'The boy was believed being intelligent.', 'The boy is believed that he is intelligent.', 'B'),
(30, 'Anh văn', 'Choose the sentence closest in meaning: No sooner had he entered the room than the phone rang.', 'As soon as he entered the room, the phone rang.', 'He entered the room when the phone rang.', 'He had entered the room because the phone rang.', 'The phone rang before he entered the room.', 'A'),
(31, 'Anh văn', 'Read the passage and choose the best answer for blank (1): Global warming is one of the most serious problems facing humanity. The Earth\'s temperature is rising, mainly due to (1) _____ activities such as burning fossil fuels. This leads to melting glaciers and rising sea levels. To (2) _____ this problem, countries need to reduce emissions and use renewable energy sources. Public awareness is also important. By changing daily habits, people can (3) _____ energy and reduce waste. If we do not act now, the future generations will face severe (4) _____ . Therefore, protecting the environment should be everyone\'s (5) _____.', 'natural', 'human', 'environmental', 'global', 'B'),
(32, 'Anh văn', 'Using the same passage above, choose the best answer for blank (2).', 'solve', 'cause', 'increase', 'create', 'A'),
(33, 'Anh văn', 'Using the same passage above, choose the best answer for blank (3).', 'waste', 'save', 'spend', 'produce', 'B'),
(34, 'Anh văn', 'Using the same passage above, choose the best answer for blank (4).', 'solutions', 'benefits', 'consequences', 'advantages', 'C'),
(35, 'Anh văn', 'Using the same passage above, choose the best answer for blank (5).', 'responsibility', 'benefit', 'success', 'profit', 'A'),
(36, 'Anh văn', 'Read the passage and answer the question: Volunteering brings many benefits to both individuals and communities. When students volunteer, they not only help those in need but also gain valuable experience. They develop soft skills such as teamwork, communication, and problem-solving. Moreover, volunteering can improve students\' self-confidence and broaden their perspective on life. However, it requires time and effort, so students need to balance volunteering with their studies. Despite the challenges, the rewards of volunteering are long-lasting and meaningful. What is the main idea of the passage?', 'Volunteering only benefits communities.', 'Volunteering is rewarding but requires balance.', 'Students should not spend time volunteering.', 'Volunteering is a waste of time for students.', 'B'),
(37, 'Anh văn', 'According to the passage, which skill is NOT mentioned as gained from volunteering?', 'Teamwork', 'Communication', 'Problem-solving', 'Mathematics', 'D'),
(38, 'Anh văn', 'What is one challenge of volunteering mentioned in the passage?', 'It lowers self-confidence.', 'It requires time and effort.', 'It reduces perspective.', 'It decreases teamwork.', 'B'),
(39, 'Anh văn', 'The word \'meaningful\' in the last sentence is closest in meaning to:', 'worthless', 'valuable', 'boring', 'useless', 'B'),
(40, 'Anh văn', 'The word \'they\' in the second sentence refers to:', 'students', 'communities', 'skills', 'benefits', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_english_12`
--

CREATE TABLE `question_english_12` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_english_12`
--

INSERT INTO `question_english_12` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Anh văn', 'Choose the word CLOSEST in meaning to \'innovative\'.', 'traditional', 'creative', 'boring', 'outdated', 'B'),
(2, 'Anh văn', 'Choose the word OPPOSITE in meaning to \'flexible\'.', 'adaptable', 'rigid', 'easy', 'soft', 'B'),
(3, 'Anh văn', 'Complete the sentence: The government launched a campaign to raise public ___ about health issues.', 'awareness', 'knowledge', 'education', 'conscious', 'A'),
(4, 'Anh văn', 'Choose the correct collocation: He plays a vital ___ in the success of the project.', 'position', 'part', 'role', 'place', 'C'),
(5, 'Anh văn', 'Choose the best word: The new policy will have a significant ___ on the economy.', 'affect', 'influence', 'impact', 'effect', 'C'),
(6, 'Anh văn', 'Choose the word CLOSEST in meaning to \'resilient\'.', 'weak', 'strong', 'fragile', 'dependent', 'B'),
(7, 'Anh văn', 'Choose the correct phrase: They finally carried ___ the plan after months of preparation.', 'on', 'off', 'out', 'over', 'C'),
(8, 'Anh văn', 'Choose the best word: He made a remarkable ___ to science.', 'contribution', 'distribution', 'reputation', 'solution', 'A'),
(9, 'Anh văn', 'Choose the correct word: The company needs to ___ its system to meet new demands.', 'upgrade', 'downgrade', 'reduce', 'lessen', 'A'),
(10, 'Anh văn', 'Choose the correct preposition: He is qualified ___ teaching English.', 'for', 'on', 'in', 'with', 'A'),
(11, 'Anh văn', 'Choose the correct conditional: If I had known the answer, I ___ it.', 'would tell', 'would have told', 'told', 'will tell', 'B'),
(12, 'Anh văn', 'Choose the correct tense: By next year, they ___ in this city for 20 years.', 'live', 'will have lived', 'will live', 'lived', 'B'),
(13, 'Anh văn', 'Choose the correct form: She prefers ___ to classical music.', 'listen', 'listens', 'listening', 'to listening', 'C'),
(14, 'Anh văn', 'Choose the correct passive form: People believe that he is a great teacher.', 'He is believed to be a great teacher.', 'He was believed being a great teacher.', 'He believes to be a great teacher.', 'He is believed that he is a great teacher.', 'A'),
(15, 'Anh văn', 'Choose the correct inversion: Hardly ___ when the bus arrived.', 'he had left', 'had he left', 'he left', 'did he left', 'B'),
(16, 'Anh văn', 'Choose the correct article: She wants to become ___ engineer.', 'a', 'an', 'the', 'no article', 'B'),
(17, 'Anh văn', 'Choose the correct relative pronoun: She didn\'t tell me the reason ___ she was late.', 'which', 'why', 'that', 'when', 'B'),
(18, 'Anh văn', 'Choose the correct reported speech: He said, \'I have finished my homework.\'', 'He said he finished his homework.', 'He said he had finished his homework.', 'He said he finishes his homework.', 'He said he has finished his homework.', 'B'),
(19, 'Anh văn', 'Choose the correct modal verb: You ___ wear a helmet when riding a motorbike; it’s the law.', 'must', 'can', 'may', 'would', 'A'),
(20, 'Anh văn', 'Choose the correct form: No sooner ___ the teacher entered than the students stood up.', 'had', 'did', 'does', 'has', 'A'),
(21, 'Anh văn', 'Choose the underlined part that contains an error: She suggested me to apply for that position.', 'suggested', 'me', 'to apply', 'for that position', 'C'),
(22, 'Anh văn', 'Choose the underlined part that contains an error: The news are very surprising to all of us.', 'The news', 'are', 'very surprising', 'to all of us', 'B'),
(23, 'Anh văn', 'Choose the underlined part that contains an error: Had I knew about the traffic, I would have left earlier.', 'Had', 'I knew', 'about the traffic', 'I would have left earlier', 'B'),
(24, 'Anh văn', 'Choose the underlined part that contains an error: The students were interesting in the science exhibition.', 'students', 'were', 'interesting', 'in the science exhibition', 'C'),
(25, 'Anh văn', 'Choose the underlined part that contains an error: He denied to steal the money.', 'denied', 'to steal', 'the money', 'none', 'B'),
(26, 'Anh văn', 'Choose the sentence closest in meaning: People say that she is a good doctor.', 'She was said to be a good doctor.', 'She is said to be a good doctor.', 'She said she was a good doctor.', 'She is said that she is a good doctor.', 'B'),
(27, 'Anh văn', 'Choose the sentence closest in meaning: It\'s a pity I can\'t play the piano.', 'I wish I could play the piano.', 'I wish I can play the piano.', 'I hope I can play the piano.', 'I hope I played the piano.', 'A'),
(28, 'Anh văn', 'Choose the sentence closest in meaning: He started working here three years ago.', 'He has worked here for three years.', 'He worked here since three years.', 'He works here three years ago.', 'He is working here for three years.', 'A'),
(29, 'Anh văn', 'Choose the sentence closest in meaning: \'Don\'t touch the switch,\' she said to me.', 'She told me not touch the switch.', 'She told me not to touch the switch.', 'She told me don\'t touch the switch.', 'She told me didn\'t touch the switch.', 'B'),
(30, 'Anh văn', 'Choose the sentence closest in meaning: He was punished because he came late.', 'If he comes late, he will be punished.', 'If he hadn\'t come late, he wouldn\'t have been punished.', 'If he came late, he would be punished.', 'If he didn\'t come late, he would be punished.', 'B'),
(31, 'Anh văn', 'Read the passage and choose the best answer for blank (1): Technology has changed the way we communicate. In the past, people wrote letters or made phone calls. Today, we can send emails and messages instantly. Social media platforms have made it easier to connect with friends, but they also create new challenges. Spending too much time online can reduce face-to-face interactions and (1) ____ social skills. Therefore, it is important to use technology wisely. Students should (2) ____ a balance between online and offline activities. They should also protect their (3) ____ by being careful with what they share online. Technology is powerful, but it should be (4) ____ responsibly. Only then can it (5) ____ society in a positive way.', 'improve', 'weaken', 'strengthen', 'develop', 'B'),
(32, 'Anh văn', 'Using the same passage above, choose the best answer for blank (2).', 'keep', 'maintain', 'save', 'take', 'B'),
(33, 'Anh văn', 'Using the same passage above, choose the best answer for blank (3).', 'identity', 'information', 'privacy', 'safety', 'C'),
(34, 'Anh văn', 'Using the same passage above, choose the best answer for blank (4).', 'use', 'used', 'be using', 'be used', 'D'),
(35, 'Anh văn', 'Using the same passage above, choose the best answer for blank (5).', 'harm', 'benefit', 'damage', 'destroy', 'B'),
(36, 'Anh văn', 'Read the passage and answer the question: Gap years are becoming increasingly popular among high school graduates. A gap year is typically a year spent traveling, working, or volunteering before starting university. Supporters argue that it gives students time to gain real-life experience, learn independence, and explore interests. Critics, however, worry that students may lose academic motivation or face financial difficulties. To make the most of a gap year, students should plan carefully and set clear goals. When done properly, a gap year can be a life-changing experience. What is the main idea of the passage?', 'Gap years are a waste of time.', 'Gap years have both benefits and drawbacks.', 'Gap years should be banned by universities.', 'Students should never delay their studies.', 'B'),
(37, 'Anh văn', 'According to the passage, which is NOT mentioned as a benefit of a gap year?', 'Real-life experience', 'Learning independence', 'Financial difficulties', 'Exploring interests', 'C'),
(38, 'Anh văn', 'What is one drawback of a gap year mentioned in the passage?', 'Losing academic motivation', 'Gaining independence', 'Exploring interests', 'Learning languages', 'A'),
(39, 'Anh văn', 'The word \'critics\' in the passage is closest in meaning to:', 'supporters', 'opponents', 'teachers', 'students', 'B'),
(40, 'Anh văn', 'The word \'it\' in the last sentence refers to:', 'university', 'a gap year', 'motivation', 'experience', 'B');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_math`
--

CREATE TABLE `question_math` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
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

INSERT INTO `question_math` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
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
  `SUBJECT` varchar(100) NOT NULL,
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

INSERT INTO `question_physics` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
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
-- Cấu trúc bảng cho bảng `question_physics_6`
--

CREATE TABLE `question_physics_6` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_physics_6`
--

INSERT INTO `question_physics_6` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(124, 'Vật lý', 'Đơn vị đo lực trong hệ SI là gì?', 'N', 'kg', 'Pa', 'J', 'A'),
(125, 'Vật lý', 'Một vật khối lượng 2 kg có trọng lượng gần bằng?', '20 N', '2 N', '200 N', '0,2 N', 'A'),
(126, 'Vật lý', 'Vận tốc v được tính theo công thức nào?', 'v = s/t', 'v = F/m', 'v = m.g', 'v = P/t', 'A'),
(127, 'Vật lý', 'Lực ma sát xuất hiện khi?', 'Vật tiếp xúc và có xu hướng trượt', 'Vật đứng yên', 'Vật rơi tự do', 'Trong chân không', 'A'),
(128, 'Vật lý', 'Một ô tô đi 36 km trong 1 giờ. Vận tốc bằng?', '10 m/s', '36 m/s', '360 m/s', '100 km/s', 'A'),
(129, 'Vật lý', 'Trọng lực tác dụng lên vật có phương nào?', 'Thẳng đứng, hướng xuống', 'Nằm ngang', 'Hướng lên', 'Nghiêng 45°', 'A'),
(130, 'Vật lý', 'Khối lượng riêng có đơn vị đo?', 'kg/m³', 'kg', 'N', 'J', 'A'),
(131, 'Vật lý', 'Công cơ học bằng?', 'F.s', 'm.g', 'P.t', 'Q/t', 'A'),
(132, 'Vật lý', 'Một vật chuyển động đều, quãng đường s phụ thuộc?', 'Tỉ lệ với thời gian', 'Nghịch với thời gian', 'Không phụ thuộc', 'Phụ thuộc trọng lượng', 'A'),
(133, 'Vật lý', 'Điều kiện cân bằng của một vật là?', 'Tổng lực bằng 0', 'Lực lớn nhất tác dụng', 'Có ma sát nhỏ', 'Khối lượng lớn', 'A'),
(134, 'Vật lý', 'Đơn vị nhiệt độ trong hệ SI là?', 'K', '°C', '°F', 'J', 'A'),
(135, 'Vật lý', 'Nhiệt kế y tế có đặc điểm gì?', 'Có chỗ thắt hẹp để giữ cột Hg', 'Thang tới 1000°C', 'Dùng điện trở', 'Dùng rượu màu', 'A'),
(136, 'Vật lý', 'Nhiệt lượng truyền cho vật phụ thuộc vào?', 'Khối lượng, độ tăng nhiệt độ, nhiệt dung riêng', 'Thời gian', 'Vận tốc', 'Thể tích', 'A'),
(137, 'Vật lý', 'Hiện tượng nóng chảy là?', 'Rắn sang lỏng', 'Lỏng sang rắn', 'Khí sang lỏng', 'Khí sang rắn', 'A'),
(138, 'Vật lý', 'Bay hơi khác sôi ở điểm nào?', 'Xảy ra ở mọi nhiệt độ', 'Chỉ 100°C', 'Chỉ ở mặt thoáng', 'Cả 1 và 3 đúng', 'A'),
(139, 'Vật lý', 'Nhiệt dung riêng của nước xấp xỉ?', '4200 J/kg.K', '1000 J/kg.K', '9,8 J/kg.K', '2100 J/kg.K', 'A'),
(140, 'Vật lý', 'Đơn vị điện tích?', 'C', 'A', 'V', 'Ω', 'A'),
(141, 'Vật lý', 'Dòng điện trong kim loại là dòng dịch chuyển của?', 'Electron', 'Proton', 'Ion dương', 'Neutron', 'A'),
(142, 'Vật lý', 'Nguồn điện có tác dụng?', 'Duy trì hiệu điện thế', 'Tạo khối lượng', 'Tạo ánh sáng', 'Sinh công cơ', 'A'),
(143, 'Vật lý', 'Dụng cụ đo cường độ dòng điện?', 'Ampe kế', 'Vôn kế', 'Ôm kế', 'Nhiệt kế', 'A'),
(144, 'Vật lý', 'Điện năng được tính theo công thức?', 'A = UIt', 'A = F.s', 'A = m.g.h', 'A = P/t', 'A'),
(145, 'Vật lý', 'Công suất điện bằng?', 'P = U.I', 'P = I/R', 'P = R/I', 'P = m.g', 'A'),
(146, 'Vật lý', 'Ánh sáng truyền theo đường?', 'Thẳng', 'Cong', 'Zigzag', 'Ngẫu nhiên', 'A'),
(147, 'Vật lý', 'Bóng tối xuất hiện khi?', 'Ánh sáng bị cản', 'Có khúc xạ', 'Có tán sắc', 'Có giao thoa', 'A'),
(148, 'Vật lý', 'Gương phẳng cho ảnh?', 'Ảnh ảo, cùng chiều, bằng vật', 'Ảnh thật, ngược chiều', 'Ảnh phóng đại', 'Ảnh thu nhỏ', 'A'),
(149, 'Vật lý', 'Thấu kính hội tụ có tác dụng?', 'Hội tụ tia sáng', 'Phân kỳ tia sáng', 'Không đổi hướng tia sáng', 'Không có tác dụng', 'A'),
(150, 'Vật lý', 'Mắt cận phải đeo kính?', 'Phân kỳ', 'Hội tụ', 'Gương phẳng', 'Không cần kính', 'A'),
(151, 'Vật lý', 'Hiện tượng tán sắc ánh sáng tạo ra?', 'Cầu vồng', 'Bóng tối', 'Ảnh', 'Nhiệt', 'A'),
(152, 'Vật lý', 'Âm truyền được trong?', 'Rắn, lỏng, khí', 'Chân không', 'Chỉ khí', 'Chỉ lỏng', 'A'),
(153, 'Vật lý', 'Âm không truyền được trong?', 'Chân không', 'Không khí', 'Nước', 'Thép', 'A'),
(154, 'Vật lý', 'Độ cao của âm phụ thuộc?', 'Tần số dao động', 'Biên độ', 'Năng lượng', 'Áp suất', 'A'),
(155, 'Vật lý', 'Âm to nhỏ phụ thuộc?', 'Biên độ', 'Tần số', 'Màu sắc', 'Chiều dài', 'A'),
(156, 'Vật lý', 'Tai người nghe được tần số khoảng?', '20Hz - 20kHz', '2Hz - 200Hz', '200kHz - 2MHz', '1Hz - 10Hz', 'A'),
(157, 'Vật lý', 'Nhạc cụ phát ra âm thanh nhờ?', 'Dao động', 'Phản xạ', 'Khúc xạ', 'Tán sắc', 'A'),
(158, 'Vật lý', 'Đi giày đinh dễ làm hỏng sàn gỗ vì?', 'Áp suất lớn do diện tích nhỏ', 'Vì nhẹ', 'Vì nóng', 'Vì có nam châm', 'A'),
(159, 'Vật lý', 'Nồi áp suất giúp nấu nhanh hơn vì?', 'Nhiệt độ sôi tăng', 'Nhiệt độ sôi giảm', 'Áp suất giảm', 'Không đổi', 'A'),
(160, 'Vật lý', 'Trong thí nghiệm đo thể tích hòn đá bằng bình tràn, lượng nước tràn ra bằng?', 'Thể tích hòn đá', 'Khối lượng hòn đá', 'Diện tích hòn đá', 'Không liên quan', 'A'),
(161, 'Vật lý', 'Âm thanh truyền nhanh nhất trong?', 'Rắn', 'Khí', 'Lỏng', 'Chân không', 'A'),
(162, 'Vật lý', 'Khi mở nắp chai nước có ga, bọt khí thoát ra do?', 'Áp suất trong chai giảm', 'Khối lượng chai giảm', 'Chai nóng lên', 'Do ma sát', 'A'),
(163, 'Vật lý', 'Khi đo lực bằng lực kế cần?', 'Móc đúng phương lực đo', 'Đặt nghiêng 45°', 'Vuông góc mặt bàn', 'Bất kì hướng', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_physics_7`
--

CREATE TABLE `question_physics_7` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_physics_7`
--

INSERT INTO `question_physics_7` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(41, 'Vật lý', 'Định luật Acsimet nói về lực nào?', 'Lực đẩy của chất lỏng', 'Lực hút Trái Đất', 'Lực ma sát', 'Lực đàn hồi', 'A'),
(42, 'Vật lý', 'Một vật nổi khi nào?', 'Lực đẩy > Trọng lượng', 'Lực đẩy < Trọng lượng', 'Không có lực đẩy', 'Hai lực bằng 0', 'A'),
(43, 'Vật lý', 'Đơn vị áp suất trong hệ SI là?', 'Pa', 'N', 'J', 'kg', 'A'),
(44, 'Vật lý', 'Công cơ học được thực hiện khi nào?', 'Có lực và có chuyển dời', 'Có lực nhưng không dời', 'Không lực', 'Không khối lượng', 'A'),
(45, 'Vật lý', 'Công suất cơ học bằng?', 'A/t', 'F.s', 'm.g.h', 'Q/t', 'A'),
(46, 'Vật lý', 'Một người kéo hòm hàng 50kg trên sàn. Lực ma sát có tác dụng gì?', 'Cản trở chuyển động', 'Làm vật đi nhanh hơn', 'Tăng trọng lượng', 'Giảm thể tích', 'A'),
(47, 'Vật lý', 'Momen lực phụ thuộc vào?', 'Độ lớn lực và cánh tay đòn', 'Khối lượng', 'Thể tích', 'Nhiệt độ', 'A'),
(48, 'Vật lý', 'Điều kiện cân bằng của đòn bẩy?', 'Momen lực cân bằng', 'Hai lực bằng nhau', 'Có ma sát', 'Không có lực', 'A'),
(49, 'Vật lý', 'Máy cơ đơn giản có tác dụng?', 'Thay đổi lực hoặc hướng lực', 'Tăng khối lượng', 'Giảm thể tích', 'Sinh nhiệt', 'A'),
(50, 'Vật lý', 'Hiệu suất của máy cơ ≤?', '100%', '50%', '200%', '0%', 'A'),
(51, 'Vật lý', 'Dòng điện là dòng chuyển dời của?', 'Electron', 'Proton', 'Neutron', 'Photon', 'A'),
(52, 'Vật lý', 'Đơn vị cường độ dòng điện?', 'A', 'V', 'Ω', 'W', 'A'),
(53, 'Vật lý', 'Hiệu điện thế ký hiệu?', 'U', 'I', 'R', 'P', 'A'),
(54, 'Vật lý', 'Nguồn điện hóa học gồm?', 'Pin, ắc quy', 'Máy phát điện', 'Đèn pin', 'Điện trở', 'A'),
(55, 'Vật lý', 'Điện trở có đơn vị?', 'Ω', 'V', 'A', 'W', 'A'),
(56, 'Vật lý', 'Điện trở R = U/I là hệ quả của?', 'Định luật Ôm', 'Định luật Jun', 'Định luật Acsimet', 'Định luật Pascal', 'A'),
(57, 'Vật lý', 'Công thức tính điện năng?', 'A = UIt', 'A = F.s', 'A = m.g', 'A = P/t', 'A'),
(58, 'Vật lý', 'Công suất điện?', 'P = U.I', 'P = I/R', 'P = R/I', 'P = F.s', 'A'),
(59, 'Vật lý', 'Đèn sợi đốt sáng nhờ?', 'Dòng điện làm nóng sợi đốt', 'Từ trường', 'Khúc xạ', 'Tán sắc', 'A'),
(60, 'Vật lý', 'Cầu chì có tác dụng?', 'Ngắt mạch khi quá tải', 'Làm sáng', 'Tạo nhiệt', 'Tạo âm', 'A'),
(61, 'Vật lý', 'Hiện tượng khúc xạ là?', 'Tia sáng đổi hướng khi qua mặt phân cách', 'Ánh sáng bị cản', 'Ánh sáng truyền thẳng', 'Ánh sáng tán sắc', 'A'),
(62, 'Vật lý', 'Gương cầu lồi cho ảnh?', 'Ảnh ảo, nhỏ hơn', 'Ảnh thật', 'Ảnh lớn hơn', 'Không có ảnh', 'A'),
(63, 'Vật lý', 'Gương cầu lõm có thể cho ảnh?', 'Ảnh thật hoặc ảo', 'Chỉ ảo', 'Chỉ thật', 'Không có', 'A'),
(64, 'Vật lý', 'Thấu kính phân kỳ cho ảnh?', 'Ảnh ảo, nhỏ hơn', 'Ảnh thật', 'Ảnh bằng vật', 'Ảnh lớn', 'A'),
(65, 'Vật lý', 'Ánh sáng trắng gồm?', 'Nhiều màu', 'Một màu', 'Không màu', 'Tím', 'A'),
(66, 'Vật lý', 'Lăng kính có tác dụng?', 'Phân tích ánh sáng trắng', 'Phản xạ toàn phần', 'Khuếch đại âm', 'Sinh điện', 'A'),
(67, 'Vật lý', 'Âm phát ra khi?', 'Vật dao động', 'Vật đứng yên', 'Có ánh sáng', 'Có dòng điện', 'A'),
(68, 'Vật lý', 'Độ cao âm phụ thuộc?', 'Tần số', 'Biên độ', 'Pha', 'Môi trường', 'A'),
(69, 'Vật lý', 'Âm to nhỏ phụ thuộc?', 'Biên độ', 'Tần số', 'Khối lượng', 'Màu sắc', 'A'),
(70, 'Vật lý', 'Âm không truyền trong?', 'Chân không', 'Không khí', 'Nước', 'Thép', 'A'),
(71, 'Vật lý', 'Sự nở vì nhiệt của chất rắn xảy ra khi?', 'Nhiệt độ tăng', 'Nhiệt độ giảm', 'Áp suất tăng', 'Khối lượng tăng', 'A'),
(72, 'Vật lý', 'Chất lỏng có đặc điểm nở nhiệt?', 'Nở nhiều hơn rắn', 'Không nở', 'Nở ít hơn rắn', 'Nở bằng rắn', 'A'),
(73, 'Vật lý', 'Hiện tượng đông đặc là?', 'Lỏng → rắn', 'Rắn → lỏng', 'Khí → lỏng', 'Khí → rắn', 'A'),
(74, 'Vật lý', 'Hiện tượng bay hơi xảy ra khi?', 'Mọi nhiệt độ', 'Chỉ 100°C', 'Chỉ 0°C', 'Chỉ áp suất cao', 'A'),
(75, 'Vật lý', 'Vì sao bơm hơi vào bánh xe đạp dễ lăn hơn?', 'Áp suất tăng làm giảm ma sát lăn', 'Vì xe nhẹ hơn', 'Vì xe đẹp hơn', 'Vì tăng trọng lượng', 'A'),
(76, 'Vật lý', 'Tại sao nên dùng nồi áp suất khi nấu ăn?', 'Làm tăng nhiệt độ sôi', 'Giảm nhiệt độ sôi', 'Giữ nhiệt thấp', 'Không đổi', 'A'),
(77, 'Vật lý', 'Đo cường độ dòng điện phải dùng?', 'Ampe kế nối tiếp', 'Vôn kế song song', 'Ôm kế', 'Lực kế', 'A'),
(78, 'Vật lý', 'Đo hiệu điện thế phải dùng?', 'Vôn kế song song', 'Ampe kế nối tiếp', 'Ôm kế', 'Lực kế', 'A'),
(79, 'Vật lý', 'Trong thí nghiệm với gương phẳng, ảnh của vật có tính chất?', 'Ảnh ảo, cùng chiều, bằng vật', 'Ảnh thật', 'Ảnh ngược chiều', 'Ảnh nhỏ hơn', 'A'),
(80, 'Vật lý', 'Khi dùng nhiệt kế thủy ngân, cần?', 'Đặt mắt ngang với vạch', 'Nhìn từ trên xuống', 'Đặt nghiêng', 'Không cần chú ý', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_physics_8`
--

CREATE TABLE `question_physics_8` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_physics_8`
--

INSERT INTO `question_physics_8` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(41, 'Vật lý', 'Công cơ học bằng công thức nào?', 'A=F.s', 'A=UIt', 'A=m.c.Δt', 'A=I²R', 'A'),
(42, 'Vật lý', 'Đơn vị công suất cơ học?', 'W', 'N', 'J', 'Pa', 'A'),
(43, 'Vật lý', 'Điều kiện cân bằng của vật rắn chịu tác dụng hai lực?', 'Hai lực cùng giá, ngược chiều, cùng độ lớn', 'Hai lực bất kỳ', 'Hai lực song song', 'Hai lực vuông góc', 'A'),
(44, 'Vật lý', 'Một máy có công thực hiện 200J trong 10s. Công suất?', '20W', '200W', '2W', '0.2W', 'A'),
(45, 'Vật lý', 'Động năng phụ thuộc vào?', 'Khối lượng và vận tốc', 'Trọng lượng', 'Thể tích', 'Chiều cao', 'A'),
(46, 'Vật lý', 'Thế năng trọng trường phụ thuộc vào?', 'Độ cao và khối lượng', 'Thời gian', 'Nhiệt độ', 'Khối lượng riêng', 'A'),
(47, 'Vật lý', 'Động năng có đơn vị?', 'J', 'N', 'Pa', 'W', 'A'),
(48, 'Vật lý', 'Cơ năng là tổng của?', 'Động năng và thế năng', 'Công và công suất', 'Nhiệt và ánh sáng', 'Điện và nhiệt', 'A'),
(49, 'Vật lý', 'Một vật 2kg ở độ cao 5m. Thế năng?', '100J', '10J', '50J', '5J', 'A'),
(50, 'Vật lý', 'Bảo toàn cơ năng đúng khi?', 'Không có ma sát, lực cản', 'Có ma sát lớn', 'Có ma sát nhỏ', 'Có lực ngoài', 'A'),
(51, 'Vật lý', 'Định luật Jun–Lenxơ biểu diễn?', 'Q=I²Rt', 'A=F.s', 'P=U.I', 'Q=m.c.Δt', 'A'),
(52, 'Vật lý', 'Công suất điện có đơn vị?', 'W', 'A', 'V', 'Ω', 'A'),
(53, 'Vật lý', 'Điện năng tiêu thụ trong 2h của bóng đèn 100W?', '0.2kWh', '200kWh', '20kWh', '2kWh', 'A'),
(54, 'Vật lý', 'Máy biến áp có tác dụng?', 'Biến đổi điện áp', 'Phát sáng', 'Đo điện trở', 'Sinh công cơ', 'A'),
(55, 'Vật lý', 'Dòng điện xoay chiều có đặc điểm?', 'Cường độ biến thiên tuần hoàn', 'Cường độ không đổi', 'Chỉ một chiều', 'Không đổi dấu', 'A'),
(56, 'Vật lý', 'Điện trở tương đương mắc nối tiếp?', 'R=R1+R2+...', '1/R=1/R1+1/R2', 'Bằng R nhỏ nhất', 'Bằng R lớn nhất', 'A'),
(57, 'Vật lý', 'Điện trở tương đương mắc song song?', '1/R=1/R1+1/R2', 'R=R1+R2', 'Bằng R lớn nhất', 'R=U/I', 'A'),
(58, 'Vật lý', 'Cầu chì bảo vệ mạch bằng?', 'Đứt khi dòng quá lớn', 'Tăng dòng điện', 'Giữ điện áp không đổi', 'Sinh công', 'A'),
(59, 'Vật lý', 'Động cơ điện biến đổi điện năng thành?', 'Cơ năng', 'Quang năng', 'Nhiệt năng', 'Hóa năng', 'A'),
(60, 'Vật lý', 'Ắc quy thuộc loại nguồn điện nào?', 'Hóa học', 'Quang điện', 'Nhiệt điện', 'Pin mặt trời', 'A'),
(61, 'Vật lý', 'Chiết suất tỉ lệ thế nào với vận tốc ánh sáng?', 'n=c/v', 'n=v/c', 'n=c+v', 'n=v-c', 'A'),
(62, 'Vật lý', 'Hiện tượng phản xạ toàn phần xảy ra khi?', 'Tia từ môi trường chiết suất lớn sang nhỏ với góc tới lớn', 'Mọi trường hợp', 'Từ chiết suất nhỏ sang lớn', 'Trong không khí', 'A'),
(63, 'Vật lý', 'Máy ảnh hoạt động dựa trên?', 'Thấu kính hội tụ', 'Gương cầu', 'Gương phẳng', 'Thấu kính phân kỳ', 'A'),
(64, 'Vật lý', 'Kính hiển vi sử dụng?', 'Hai thấu kính hội tụ', 'Hai gương phẳng', 'Một thấu kính phân kỳ', 'Một gương cầu', 'A'),
(65, 'Vật lý', 'Lăng kính dùng để?', 'Phân tích ánh sáng trắng', 'Khuếch đại âm', 'Sinh nhiệt', 'Đo điện', 'A'),
(66, 'Vật lý', 'Phim chụp ảnh hoạt động nhờ?', 'Hiện tượng quang điện', 'Hiện tượng điện từ', 'Hiện tượng nhiệt', 'Hiện tượng từ', 'A'),
(67, 'Vật lý', 'Âm có thể phản xạ tạo thành?', 'Tiếng vang', 'Cầu vồng', 'Ảnh', 'Nhiệt', 'A'),
(68, 'Vật lý', 'Điều kiện có tiếng vang?', 'Thời gian ≥0.1s', 'Thời gian ≤0.01s', 'Khoảng cách <1m', 'Không có điều kiện', 'A'),
(69, 'Vật lý', 'Âm sắc giúp phân biệt?', 'Các nguồn âm khác nhau', 'Độ cao', 'Độ to', 'Âm thanh mạnh', 'A'),
(70, 'Vật lý', 'Âm truyền trong chất rắn thế nào so với khí?', 'Nhanh hơn', 'Chậm hơn', 'Bằng nhau', 'Không truyền', 'A'),
(71, 'Vật lý', 'Nhiệt lượng Q tính bằng?', 'Q=m.c.Δt', 'Q=I²Rt', 'Q=F.s', 'Q=P.t', 'A'),
(72, 'Vật lý', 'Đơn vị nhiệt lượng?', 'J', 'N', 'W', 'Pa', 'A'),
(73, 'Vật lý', 'Sự dẫn nhiệt xảy ra chủ yếu trong?', 'Chất rắn', 'Chất lỏng', 'Khí', 'Chân không', 'A'),
(74, 'Vật lý', 'Sự đối lưu xảy ra chủ yếu trong?', 'Chất lỏng, khí', 'Chất rắn', 'Chân không', 'Tất cả', 'A'),
(75, 'Vật lý', 'Cầu vồng xuất hiện do?', 'Tán sắc ánh sáng', 'Khúc xạ', 'Giao thoa', 'Phản xạ', 'A'),
(76, 'Vật lý', 'Kính lúp dùng để?', 'Tạo ảnh lớn', 'Tạo âm', 'Sinh nhiệt', 'Đo điện', 'A'),
(77, 'Vật lý', 'Đo điện trở có thể dùng?', 'Ôm kế', 'Ampe kế', 'Vôn kế', 'Nhiệt kế', 'A'),
(78, 'Vật lý', 'Đo hiệu điện thế cần mắc vôn kế?', 'Song song', 'Nối tiếp', 'Không cần', 'Ngẫu nhiên', 'A'),
(79, 'Vật lý', 'Thí nghiệm giao thoa ánh sáng cần?', 'Hai khe hẹp đồng bộ', 'Một khe', 'Một gương', 'Một nguồn', 'A'),
(80, 'Vật lý', 'Đo cường độ dòng điện cần mắc ampe kế?', 'Nối tiếp', 'Song song', 'Không cần', 'Ngẫu nhiên', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_physics_9`
--

CREATE TABLE `question_physics_9` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_physics_9`
--

INSERT INTO `question_physics_9` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(41, 'Vật lý', 'Gia tốc rơi tự do g=?', '9.8 m/s²', '10 m/s²', '8 m/s²', '5 m/s²', 'A'),
(42, 'Vật lý', 'Công thức tính vận tốc v trong chuyển động rơi tự do?', 'v=g.t', 'v=s/t', 'v=F/m', 'v=P.t', 'A'),
(43, 'Vật lý', 'Quãng đường rơi tự do s=?', '1/2 g.t²', 'g.t', 'v.t', 'F.s', 'A'),
(44, 'Vật lý', 'Một ô tô đi 72km/h. Vận tốc theo m/s?', '20 m/s', '72 m/s', '7.2 m/s', '2 m/s', 'A'),
(45, 'Vật lý', 'Chuyển động ném ngang là hợp của?', 'Chuyển động đều ngang và rơi tự do', 'Chuyển động thẳng đều', 'Dao động', 'Quay tròn', 'A'),
(46, 'Vật lý', 'Động lượng p=?', 'm.v', 'F.t', 'U.I', 'P.t', 'A'),
(47, 'Vật lý', 'Công cơ học đơn vị?', 'J', 'N', 'W', 'Pa', 'A'),
(48, 'Vật lý', 'Công suất cơ học đơn vị?', 'W', 'N', 'J', 'Pa', 'A'),
(49, 'Vật lý', 'Một vật khối lượng 1kg có vận tốc 10m/s. Động năng?', '50J', '100J', '10J', '5J', 'A'),
(50, 'Vật lý', 'Một vật 2kg ở độ cao 10m. Thế năng?', '200J', '20J', '2J', '100J', 'A'),
(51, 'Vật lý', 'Định luật Ôm: I=?', 'U/R', 'R/U', 'U.I', 'P/U', 'A'),
(52, 'Vật lý', 'Công suất điện P=?', 'U.I', 'I²R', 'U²/R', 'Cả 3 đúng', 'A'),
(53, 'Vật lý', 'Điện năng A=?', 'UIt', 'I²Rt', 'U²/R.t', 'Cả 3 đúng', 'A'),
(54, 'Vật lý', 'Hiệu điện thế đơn vị?', 'V', 'A', 'Ω', 'W', 'A'),
(55, 'Vật lý', 'Điện trở dây phụ thuộc?', 'Chiều dài, tiết diện, vật liệu', 'Khối lượng', 'Nhiệt độ', 'Áp suất', 'A'),
(56, 'Vật lý', 'Mạch song song điện áp trên các nhánh?', 'Bằng nhau', 'Khác nhau', 'Tỉ lệ R', 'Tỉ lệ I', 'A'),
(57, 'Vật lý', 'Mạch nối tiếp dòng điện qua các phần tử?', 'Bằng nhau', 'Khác nhau', 'Tỉ lệ U', 'Tỉ lệ R', 'A'),
(58, 'Vật lý', 'Công thức định luật Jun-Lenxơ?', 'Q=I²Rt', 'P=U.I', 'A=F.s', 'Q=m.c.Δt', 'A'),
(59, 'Vật lý', 'Điện năng tiêu thụ đơn vị?', 'kWh', 'J/s', 'N', 'Pa', 'A'),
(60, 'Vật lý', 'Cầu chì đứt khi?', 'Dòng quá lớn', 'Dòng nhỏ', 'Điện áp thấp', 'Điện trở cao', 'A'),
(61, 'Vật lý', 'Phản xạ toàn phần ứng dụng trong?', 'Cáp quang', 'Kính hiển vi', 'Máy ảnh', 'Ống nhòm', 'A'),
(62, 'Vật lý', 'Thấu kính hội tụ có tác dụng?', 'Hội tụ tia sáng', 'Phân kỳ tia sáng', 'Không đổi hướng', 'Không tác dụng', 'A'),
(63, 'Vật lý', 'Gương cầu lõm có thể dùng làm?', 'Kính lúp', 'Đèn pha', 'Cả 2', 'Không cái nào', 'C'),
(64, 'Vật lý', 'Quang phổ mặt trời gồm?', 'Liên tục nhiều màu', 'Một màu', 'Không màu', 'Tím', 'A'),
(65, 'Vật lý', 'Hiện tượng quang điện chứng tỏ?', 'Ánh sáng có tính hạt', 'Ánh sáng có tính sóng', 'Ánh sáng chỉ khúc xạ', 'Ánh sáng chỉ phản xạ', 'A'),
(66, 'Vật lý', 'Máy ảnh hoạt động dựa vào?', 'Thấu kính hội tụ', 'Thấu kính phân kỳ', 'Gương phẳng', 'Lăng kính', 'A'),
(67, 'Vật lý', 'Độ cao âm phụ thuộc?', 'Tần số', 'Biên độ', 'Môi trường', 'Áp suất', 'A'),
(68, 'Vật lý', 'Âm to nhỏ phụ thuộc?', 'Biên độ', 'Tần số', 'Khối lượng', 'Màu sắc', 'A'),
(69, 'Vật lý', 'Tai người nghe 20Hz-20kHz gọi là?', 'Âm nghe được', 'Hạ âm', 'Siêu âm', 'Không nghe', 'A'),
(70, 'Vật lý', 'Sóng âm truyền trong chất rắn thế nào?', 'Nhanh hơn chất khí', 'Chậm hơn', 'Bằng nhau', 'Không truyền', 'A'),
(71, 'Vật lý', 'Nhiệt lượng Q=?', 'm.c.Δt', 'I²Rt', 'UIt', 'F.s', 'A'),
(72, 'Vật lý', 'Đơn vị nhiệt lượng?', 'J', 'N', 'W', 'Pa', 'A'),
(73, 'Vật lý', 'Sự bức xạ nhiệt xảy ra ở?', 'Mọi vật', 'Chỉ chất rắn', 'Chỉ lỏng', 'Chỉ khí', 'A'),
(74, 'Vật lý', 'Sự đối lưu xảy ra trong?', 'Chất lỏng, khí', 'Chất rắn', 'Chân không', 'Không khí', 'A'),
(75, 'Vật lý', 'Wi-Fi dùng sóng?', 'Vi ba', 'Âm', 'Nước', 'Địa chấn', 'A'),
(76, 'Vật lý', 'Gương cầu lồi dùng làm?', 'Gương chiếu hậu', 'Gương trang điểm', 'Kính hiển vi', 'Ống nhòm', 'A'),
(77, 'Vật lý', 'Đo điện trở bằng?', 'Ôm kế', 'Ampe kế', 'Vôn kế', 'Lực kế', 'A'),
(78, 'Vật lý', 'Đo hiệu điện thế dùng?', 'Vôn kế song song', 'Ampe kế nối tiếp', 'Ôm kế', 'Nhiệt kế', 'A'),
(79, 'Vật lý', 'Thí nghiệm Jun-Lenxơ chứng minh?', 'Dòng điện sinh nhiệt', 'Dòng điện sinh công', 'Dòng điện sinh quang', 'Dòng điện sinh từ', 'A'),
(80, 'Vật lý', 'Thí nghiệm với con lắc cho biết?', 'Chu kỳ phụ thuộc chiều dài', 'Chu kỳ phụ thuộc khối lượng', 'Chu kỳ phụ thuộc biên độ', 'Chu kỳ không đổi', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_physics_10`
--

CREATE TABLE `question_physics_10` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_physics_10`
--

INSERT INTO `question_physics_10` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Vật lý', 'Định luật I Newton phát biểu về tính chất nào?', 'Quán tính', 'Gia tốc', 'Lực hấp dẫn', 'Khối lượng', 'A'),
(2, 'Vật lý', 'Đơn vị của lực trong hệ SI là gì?', 'Joule', 'Newton', 'Pascal', 'Watt', 'B'),
(3, 'Vật lý', 'Công thức tính vận tốc trong chuyển động thẳng đều là?', 'v=s/t', 'v=a.t', 'v=F/m', 'v=W/P', 'A'),
(4, 'Vật lý', 'Động lượng được tính bằng?', 'p=m+v', 'p=m/v', 'p=m.v', 'p=F.t', 'C'),
(5, 'Vật lý', 'Công suất có đơn vị là?', 'Joule', 'Watt', 'Newton', 'Volt', 'B'),
(6, 'Vật lý', 'Thế năng hấp dẫn phụ thuộc vào đại lượng nào?', 'Khối lượng, độ cao, g', 'Khối lượng, vận tốc', 'Khối lượng, thời gian', 'Khối lượng, lực', 'A'),
(7, 'Vật lý', 'Chuyển động nào sau đây là chuyển động tròn đều?', 'Ô tô vào cua', 'Trái Đất quay quanh Mặt Trời', 'Quạt điện đang quay', 'Máy bay cất cánh', 'C'),
(8, 'Vật lý', 'Gia tốc hướng tâm trong chuyển động tròn đều có công thức?', 'a=v^2/r', 'a=F/m', 'a=s/t^2', 'a=v/t', 'A'),
(9, 'Vật lý', 'Lực hấp dẫn giữa hai vật tỉ lệ thuận với?', 'Khối lượng', 'Bình phương khoảng cách', 'Gia tốc', 'Công suất', 'A'),
(10, 'Vật lý', 'Thế năng đàn hồi có công thức?', '1/2 kx^2', 'mgh', '1/2 mv^2', 'F.s', 'A'),
(11, 'Vật lý', 'Khi vật chuyển động tròn đều, đại lượng nào không đổi?', 'Vận tốc dài', 'Gia tốc hướng tâm', 'Tốc độ góc', 'Hợp lực', 'C'),
(12, 'Vật lý', 'Khi không có lực tác dụng, vật sẽ?', 'Đứng yên', 'Chuyển động thẳng đều', 'Chuyển động tròn', 'Dừng lại', 'B'),
(13, 'Vật lý', 'Đơn vị của áp suất là?', 'N', 'J', 'Pa', 'W', 'C'),
(14, 'Vật lý', 'Trọng lực tác dụng lên vật có công thức?', 'P=m.v', 'P=m.a', 'P=m.g', 'P=F.s', 'C'),
(15, 'Vật lý', 'Công cơ học là tích của?', 'Lực và quãng đường', 'Lực và thời gian', 'Lực và vận tốc', 'Lực và áp suất', 'A'),
(16, 'Vật lý', 'Một vật đi được quãng đường 40m trong 5s. Vận tốc của vật là?', '4 m/s', '5 m/s', '8 m/s', '10 m/s', 'C'),
(17, 'Vật lý', 'Một xe chạy với v=20 m/s trong 10s. Quãng đường đi được?', '100 m', '150 m', '200 m', '300 m', 'C'),
(18, 'Vật lý', 'Một vật khối lượng 2kg rơi tự do sau 3s. Vận tốc đạt được (g=10)?', '20 m/s', '25 m/s', '30 m/s', '35 m/s', 'C'),
(19, 'Vật lý', 'Một vật 5kg ở độ cao 4m. Thế năng là?', '20 J', '40 J', '100 J', '200 J', 'D'),
(20, 'Vật lý', 'Một lực 30N tác dụng làm vật dịch chuyển 5m. Công thực hiện?', '100 J', '120 J', '150 J', '200 J', 'C'),
(21, 'Vật lý', 'Một ô tô khối lượng 500kg chạy với vận tốc 10 m/s. Động năng?', '20000 J', '25000 J', '30000 J', '50000 J', 'B'),
(22, 'Vật lý', 'Một vật chuyển động thẳng nhanh dần đều, v0=0, a=2 m/s², sau 5s đi được?', '20 m', '25 m', '30 m', '35 m', 'B'),
(23, 'Vật lý', 'Một máy kéo thực hiện công A=2000 J trong t=50s. Công suất?', '20 W', '30 W', '40 W', '50 W', 'C'),
(24, 'Vật lý', 'Một vật có khối lượng 4kg, vận tốc 3 m/s. Động lượng?', '6 kg.m/s', '12 kg.m/s', '15 kg.m/s', '20 kg.m/s', 'B'),
(25, 'Vật lý', 'Một quả bóng được ném lên cao với v0=10 m/s. Độ cao cực đại?', '3 m', '4 m', '5 m', '6 m', 'C'),
(26, 'Vật lý', 'Một vật có động năng 100 J và khối lượng 2kg. Vận tốc là?', '5 m/s', '7 m/s', '10 m/s', '15 m/s', 'C'),
(27, 'Vật lý', 'Một vật chịu lực kéo 100N, dịch chuyển 2m. Công bằng?', '100 J', '150 J', '200 J', '250 J', 'C'),
(28, 'Vật lý', 'Một quả cầu khối lượng 1kg treo ở độ cao 10m. Thế năng?', '10 J', '50 J', '100 J', '200 J', 'C'),
(29, 'Vật lý', 'Một xe tăng tốc từ 0 lên 20 m/s trong 10s. Gia tốc?', '1 m/s²', '2 m/s²', '3 m/s²', '4 m/s²', 'B'),
(30, 'Vật lý', 'Một vật đi được 80m trong 4s. Vận tốc?', '10 m/s', '15 m/s', '20 m/s', '25 m/s', 'C'),
(31, 'Vật lý', 'Tại sao khi đi xe vào cua cần giảm tốc độ?', 'Giảm lực hướng tâm', 'Tăng ma sát', 'Tăng vận tốc', 'Giảm quán tính', 'A'),
(32, 'Vật lý', 'Người ta đặt hàng nặng ở sàn thấp xe tải nhằm?', 'Giảm trọng lượng xe', 'Hạ trọng tâm', 'Dễ chất', 'Tăng vận tốc', 'B'),
(33, 'Vật lý', 'Khi đi trên cát, người ta thường đi chân đất thay vì mang giày cao gót vì?', 'Áp suất nhỏ hơn', 'Áp suất lớn hơn', 'Trọng lượng thay đổi', 'Ma sát nhỏ', 'A'),
(34, 'Vật lý', 'Khi chạy bộ, người ta thường nghiêng người ra trước vì?', 'Giảm quán tính', 'Tăng ma sát', 'Để lực đẩy hướng về phía trước', 'Giảm trọng lực', 'C'),
(35, 'Vật lý', 'Khi nhảy dù, người ta mở dù để?', 'Giảm lực cản', 'Tăng lực cản không khí', 'Tăng trọng lượng', 'Giảm áp suất', 'B'),
(36, 'Vật lý', 'Trong thí nghiệm rơi tự do, khi bỏ qua sức cản không khí, thời gian rơi của các vật khác khối lượng sẽ?', 'Giống nhau', 'Khác nhau', 'Tăng theo khối lượng', 'Giảm theo khối lượng', 'A'),
(37, 'Vật lý', 'Trong thí nghiệm đo lực ma sát, lực kế phải kéo song song mặt bàn để?', 'Đo trọng lực', 'Đo đúng lực ma sát', 'Giảm lực kéo', 'Tăng vận tốc', 'B'),
(38, 'Vật lý', 'Trong thí nghiệm lực đẩy Ác-si-mét, vật nổi khi?', 'Lực đẩy nhỏ hơn trọng lực', 'Lực đẩy bằng trọng lực', 'Lực đẩy lớn hơn trọng lực', 'Không có lực đẩy', 'C'),
(39, 'Vật lý', 'Trong thí nghiệm Atwood, khi khối lượng hai bên bằng nhau thì gia tốc?', '0', 'Tăng', 'Giảm', 'Vô cùng', 'A'),
(40, 'Vật lý', 'Khi dùng con lắc đơn đo g, chu kỳ dao động phụ thuộc vào?', 'Biên độ', 'Khối lượng', 'Chiều dài dây', 'Nhiệt độ', 'C');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_physics_11`
--

CREATE TABLE `question_physics_11` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_physics_11`
--

INSERT INTO `question_physics_11` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(1, 'Vật lý', 'Điện trường là gì?', 'Không gian có lực điện', 'Không gian có sóng', 'Không gian có ánh sáng', 'Không gian có lực hấp dẫn', 'A'),
(2, 'Vật lý', 'Đơn vị của điện tích là?', 'Coulomb', 'Volt', 'Ohm', 'Ampere', 'A'),
(3, 'Vật lý', 'Cường độ điện trường có công thức?', 'E=F/q', 'E=U/R', 'E=I/R', 'E=P/t', 'A'),
(4, 'Vật lý', 'Định luật Ôm cho toàn mạch?', 'I=E/(R+r)', 'I=U/R', 'I=R/U', 'I=P/U', 'A'),
(5, 'Vật lý', 'Từ trường là gì?', 'Không gian có lực từ', 'Không gian có lực hấp dẫn', 'Không gian có ánh sáng', 'Không gian có điện trường', 'A'),
(6, 'Vật lý', 'Định luật Lenxơ mô tả gì?', 'Chiều dòng điện cảm ứng', 'Độ lớn dòng điện', 'Điện dung', 'Điện trở', 'A'),
(7, 'Vật lý', 'Khúc xạ ánh sáng xảy ra khi?', 'Ánh sáng đi từ môi trường này sang môi trường khác', 'Ánh sáng phản xạ', 'Ánh sáng giao thoa', 'Ánh sáng tán sắc', 'A'),
(8, 'Vật lý', 'Chiết suất công thức n=?', 'n=c/v', 'n=v/c', 'n=f/λ', 'n=λ/f', 'A'),
(9, 'Vật lý', 'Cường độ dòng điện đơn vị?', 'Ampere', 'Volt', 'Ohm', 'Watt', 'A'),
(10, 'Vật lý', 'Suất điện động cảm ứng phụ thuộc?', 'Tốc độ biến thiên từ thông', 'Điện trở', 'Điện dung', 'Cường độ dòng điện', 'A'),
(11, 'Vật lý', 'Ảnh tạo bởi gương phẳng?', 'Ảnh ảo, cùng chiều, bằng vật', 'Ảnh thật, ngược chiều', 'Ảnh phóng đại', 'Ảnh thu nhỏ', 'A'),
(12, 'Vật lý', 'Thấu kính hội tụ tiêu điểm?', 'Hội tụ tia sáng song song', 'Làm phân kỳ', 'Không tác dụng', 'Tán sắc', 'A'),
(13, 'Vật lý', 'Dòng điện trong kim loại do hạt nào?', 'Electron', 'Proton', 'Neutron', 'Ion dương', 'A'),
(14, 'Vật lý', 'Dòng điện xoay chiều có đặc điểm?', 'Cường độ biến thiên theo thời gian', 'Cường độ không đổi', 'Điện áp không đổi', 'Điện trở thay đổi', 'A'),
(15, 'Vật lý', 'Hiệu điện thế là gì?', 'Công của lực điện trên điện tích thử', 'Điện trở nhân dòng điện', 'Điện dung', 'Điện áp hiệu dụng', 'A'),
(16, 'Vật lý', 'Một điện tích q=2C trong E=100 N/C. Lực tác dụng?', '50 N', '100 N', '200 N', '400 N', 'C'),
(17, 'Vật lý', 'Bóng đèn 220V-100W. Dòng điện qua đèn?', '0.1 A', '0.25 A', '0.45 A', '0.55 A', 'C'),
(18, 'Vật lý', 'Điện trở 20Ω mắc U=100V. Cường độ dòng điện?', '2 A', '4 A', '5 A', '10 A', 'C'),
(19, 'Vật lý', 'Hai điện trở 20Ω và 30Ω nối tiếp. R tương đương?', '10Ω', '25Ω', '50Ω', '60Ω', 'C'),
(20, 'Vật lý', 'Hai điện trở 20Ω và 30Ω song song. R tương đương?', '10Ω', '12Ω', '15Ω', '50Ω', 'B'),
(21, 'Vật lý', 'Tụ điện C=10µF, U=100V. Điện tích Q?', '0.001 C', '0.01 C', '0.1 C', '1 C', 'A'),
(22, 'Vật lý', 'Dòng I=2A trong 10s. Điện tích dịch chuyển?', '10 C', '20 C', '25 C', '15 C', 'B'),
(23, 'Vật lý', 'U=220V, I=2A. Công suất P?', '220 W', '240 W', '440 W', '500 W', 'C'),
(24, 'Vật lý', 'Cuộn dây R=10Ω, E=5V. Dòng điện I?', '0.2 A', '0.4 A', '0.5 A', '1 A', 'C'),
(25, 'Vật lý', 'Tia sáng vào nước từ không khí, góc tới 30°, n=4/3. Góc khúc xạ?', '22°', '25°', '30°', '45°', 'A'),
(26, 'Vật lý', 'Thấu kính hội tụ f=20cm, vật cách 40cm. Ảnh cách kính?', '10 cm', '20 cm', '30 cm', '40 cm', 'B'),
(27, 'Vật lý', 'Gương cầu lõm f=15cm, vật cách 30cm. Ảnh cách gương?', '10 cm', '15 cm', '20 cm', '30 cm', 'D'),
(28, 'Vật lý', 'Mạch có R=10Ω, U=20V. Dòng I?', '1 A', '2 A', '3 A', '4 A', 'B'),
(29, 'Vật lý', 'Điện trở 60Ω nối tiếp 40Ω, U=100V. I?', '0.5 A', '1 A', '1.5 A', '2 A', 'B'),
(30, 'Vật lý', 'Điện tích q=5C, công A=50J. Hiệu điện thế U?', '5 V', '10 V', '15 V', '20 V', 'B'),
(31, 'Vật lý', 'Sét là hiện tượng gì?', 'Phóng điện khí quyển', 'Khúc xạ', 'Tán sắc', 'Nhiệt', 'A'),
(32, 'Vật lý', 'Dây điện cao thế đặt cao để?', 'Giảm hao phí', 'An toàn', 'Tăng hiệu suất', 'Cả 3', 'D'),
(33, 'Vật lý', 'Kính cận dùng thấu kính phân kỳ để?', 'Giảm độ tụ mắt', 'Tăng tiêu cự', 'Hội tụ', 'Tán sắc', 'A'),
(34, 'Vật lý', 'Mở tủ lạnh thấy hơi nước đọng do?', 'Ngưng tụ', 'Bay hơi', 'Thăng hoa', 'Nóng chảy', 'A'),
(35, 'Vật lý', 'Điện giật nguy hiểm chủ yếu do?', 'Điện áp', 'Điện trở', 'Cường độ dòng điện', 'Điện dung', 'C'),
(36, 'Vật lý', 'Thí nghiệm khúc xạ ánh sáng: tăng góc tới thì góc khúc xạ?', 'Tăng', 'Giảm', 'Không đổi', '0', 'A'),
(37, 'Vật lý', 'Vật ngoài tiêu điểm thấu kính hội tụ cho ảnh?', 'Ảnh thật, ngược chiều', 'Ảnh ảo, cùng chiều', 'Ảnh phóng đại', 'Ảnh mờ', 'A'),
(38, 'Vật lý', 'Thí nghiệm cảm ứng điện từ: tăng số vòng dây thì E?', 'Tăng', 'Giảm', 'Không đổi', '0', 'A'),
(39, 'Vật lý', 'Thí nghiệm giao thoa ánh sáng: tăng khoảng cách khe thì vân?', 'Hẹp lại', 'Rộng ra', 'Không đổi', 'Biến mất', 'A'),
(40, 'Vật lý', 'Đo điện trở bằng Ampe kế, Vôn kế: R=?', 'U/I', 'I/U', 'U.I', 'P/U', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_physics_12`
--

CREATE TABLE `question_physics_12` (
  `ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `QUESTION` text NOT NULL,
  `OPTION_A` varchar(255) NOT NULL,
  `OPTION_B` varchar(255) NOT NULL,
  `OPTION_C` varchar(255) NOT NULL,
  `OPTION_D` varchar(255) NOT NULL,
  `CORRECT_OPTION` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question_physics_12`
--

INSERT INTO `question_physics_12` (`ID`, `SUBJECT`, `QUESTION`, `OPTION_A`, `OPTION_B`, `OPTION_C`, `OPTION_D`, `CORRECT_OPTION`) VALUES
(0, 'Vật lý', 'Phương trình dao động điều hòa?', 'x=A sin(ωt+φ)', 'x=vt', 'x=at^2/2', 'x=F/m', 'A'),
(0, 'Vật lý', 'Chu kỳ con lắc lò xo?', 'T=2π√(m/k)', 'T=2π√(l/g)', 'T=2π√(1/g)', 'T=2π√(k/m)', 'A'),
(0, 'Vật lý', 'Chu kỳ con lắc đơn?', 'T=2π√(l/g)', 'T=2π√(m/k)', 'T=2π√(g/l)', 'T=2π√(1/g)', 'A'),
(0, 'Vật lý', 'Mạch RLC cộng hưởng khi?', 'ZL=ZC', 'Z=0', 'U=0', 'P=0', 'A'),
(0, 'Vật lý', 'Sóng dừng hình thành khi?', 'Hai sóng ngược chiều cùng f giao thoa', 'Hai sóng cùng chiều', 'Một sóng đơn', 'Khúc xạ', 'A'),
(0, 'Vật lý', 'Hiện tượng quang điện chứng tỏ ánh sáng có?', 'Tính sóng', 'Tính hạt', 'Khúc xạ', 'Phản xạ', 'B'),
(0, 'Vật lý', 'Bức xạ tử ngoại có λ?', '<400nm', '400-700nm', '>700nm', '>1mm', 'A'),
(0, 'Vật lý', 'Sóng âm dưới 20Hz gọi là?', 'Hạ âm', 'Siêu âm', 'Âm nghe được', 'Âm cao', 'A'),
(0, 'Vật lý', 'Sóng âm trên 20kHz gọi là?', 'Siêu âm', 'Hạ âm', 'Âm cao', 'Âm trầm', 'A'),
(0, 'Vật lý', 'Chu kỳ dao động điều hòa phụ thuộc?', 'm,k', 'Biên độ', 'Pha ban đầu', 'Tần số', 'A'),
(0, 'Vật lý', 'u=U0 sin(ωt+φ). U0 gọi là?', 'Biên độ', 'Hiệu dụng', 'Cực đại', '0', 'C'),
(0, 'Vật lý', 'Công suất trung bình AC?', 'P=U.I.cosφ', 'P=U.I', 'P=U^2/R', 'P=I^2R', 'A'),
(0, 'Vật lý', 'Phản ứng hạt nhân tỏa năng lượng khi?', 'm trước > m sau', 'm tăng', 'm không đổi', 'Không liên quan', 'A'),
(0, 'Vật lý', 'Năng lượng liên kết hạt nhân?', 'Δm.c^2', 'mgh', '1/2 mv^2', 'qU', 'A'),
(0, 'Vật lý', 'Bức xạ ngắn nhất trong quang phổ?', 'Tia gamma', 'Tử ngoại', 'Hồng ngoại', 'Ánh sáng thường', 'A'),
(0, 'Vật lý', 'Con lắc lò xo m=0.2kg, k=50N/m. Chu kỳ?', '0.1s', '0.2s', '0.4s', '0.5s', 'C'),
(0, 'Vật lý', 'Con lắc đơn l=1m, g=10. Chu kỳ?', '0.5s', '1s', '2s', '4s', 'C'),
(0, 'Vật lý', 'Dao động A=5cm, ω=10. Vmax?', '0.5 m/s', '1 m/s', '0.25 m/s', '2 m/s', 'A'),
(0, 'Vật lý', 'Dao động A=10cm, T=2s. Vmax?', '0.2π', '0.5π', 'π', '2π', 'C'),
(0, 'Vật lý', 'Mạch RLC R=20,L=0.2H,C=100µF. f cộng hưởng?', '50Hz', '100Hz', '200Hz', '250Hz', 'A'),
(0, 'Vật lý', 'Mạch AC U=220V, I=2A, cosφ=0.8. P?', '352W', '400W', '440W', '500W', 'A'),
(0, 'Vật lý', 'Sóng u=5cos(20πt-πx). v?', '10 m/s', '20 m/s', '5 m/s', '2 m/s', 'A'),
(0, 'Vật lý', 'Ánh sáng λ=600nm. f?', '5e14', '6e14', '7e14', '8e14', 'A'),
(0, 'Vật lý', 'Photon λ=400nm. Năng lượng?', '3.1 eV', '2.5 eV', '2.0 eV', '1.8 eV', 'A'),
(0, 'Vật lý', 'Δm=0.01u. Năng lượng?', '9.3e11 J', '1.5e-10 J', '9.3e12 J', '1.6e-11 J', 'A'),
(0, 'Vật lý', 'Nguồn sóng f=50Hz, λ=2m. v?', '25', '50', '75', '100', 'D'),
(0, 'Vật lý', 'Mạch AC U=220V, I=1A, φ=60°. P?', '55W', '110W', '220W', '440W', 'B'),
(0, 'Vật lý', 'Con lắc đơn l=2.25m, g=10. T?', '2s', '3s', '4s', '1.5s', 'B'),
(0, 'Vật lý', 'u=220√2 sin(100πt). U hiệu dụng?', '110', '220', '310', '440', 'B'),
(0, 'Vật lý', 'Hạt α động năng 5MeV. Năng lượng J?', '8e-13', '1.6e-12', '3.2e-13', '5e-13', 'A'),
(0, 'Vật lý', 'Loa phát nhạc to làm kính cửa rung do?', 'Cộng hưởng', 'Khúc xạ', 'Sóng dừng', 'Phản xạ', 'A'),
(0, 'Vật lý', 'Xe lửa qua cầu dài không chạy nhanh vì?', 'Tránh cộng hưởng', 'Tiết kiệm nhiên liệu', 'Tăng ma sát', 'Giảm lực cản', 'A'),
(0, 'Vật lý', 'Đèn dây tóc phát sáng kèm nhiệt lớn do?', 'Tác dụng nhiệt dòng điện', 'Quang điện', 'Phản xạ', 'Từ trường', 'A'),
(0, 'Vật lý', 'Không nghe thấy sóng siêu âm vì?', 'f>20kHz', 'Bước sóng dài', 'Năng lượng nhỏ', 'Phản xạ', 'A'),
(0, 'Vật lý', 'Lặn sâu cần bình khí vì?', 'Áp suất tăng', 'Nhiệt độ giảm', 'Lực đẩy tăng', 'Trọng lượng giảm', 'A'),
(0, 'Vật lý', 'Con lắc đơn: tăng chiều dài thì T?', 'Tăng', 'Giảm', 'Không đổi', '0', 'A'),
(0, 'Vật lý', 'Giao thoa ánh sáng: tăng λ thì khoảng vân?', 'Rộng hơn', 'Hẹp', 'Không đổi', 'Biến mất', 'A'),
(0, 'Vật lý', 'Sóng dừng trên dây: tăng f thì số bụng?', 'Tăng', 'Giảm', 'Không đổi', 'Biến mất', 'A'),
(0, 'Vật lý', 'Đo điện áp AC: vôn kế chỉ?', 'Hiệu dụng', 'Cực đại', '0', 'Trung bình', 'A'),
(0, 'Vật lý', 'Phóng xạ: tia α lệch trong điện trường?', 'Hướng bản âm', 'Hướng bản dương', 'Không lệch', 'Ngẫu nhiên', 'A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `score` float NOT NULL,
  `total_question` int(11) NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `results`
--

INSERT INTO `results` (`id`, `user_id`, `subject`, `score`, `total_question`, `correct_answer`, `start_time`, `end_time`) VALUES
(2, 0, 'math', 3, 40, 3, '2025-08-21 14:41:07', '2025-08-21 14:56:07'),
(3, 0, 'chemistry', 1, 40, 6, '2025-08-21 14:45:02', '2025-08-21 15:00:02'),
(4, 0, 'chemistry', 10, 40, 40, '2025-08-21 14:46:07', '2025-08-21 15:01:07'),
(5, 1, 'Toán tự luận', 0, 20, 0, '2025-08-21 15:14:25', '2025-08-21 15:14:25'),
(6, 1, 'Toán tự luận', 0, 20, 0, '2025-08-21 15:15:02', '2025-08-21 15:15:02'),
(7, 0, 'Toán tự luận', 0, 20, 0, '2025-08-21 15:03:19', '2025-08-21 15:18:19'),
(8, 0, 'Toán tự luận', 0, 20, 0, '2025-08-21 15:04:55', '2025-08-21 15:19:55'),
(9, 0, 'Toán tự luận', 1, 20, 2, '2025-08-21 15:05:50', '2025-08-21 15:20:50'),
(10, 0, 'physics_6', 0, 40, 0, '2025-08-22 06:38:33', '2025-08-22 06:53:33'),
(11, 0, 'physics_7', 0, 40, 0, '2025-08-22 10:14:14', '2025-08-22 10:29:14'),
(12, 12, 'chemistry_11', 0, 40, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 12, 'chemistry_8', 3, 40, 3, '2025-08-28 15:42:56', '2025-08-28 15:42:56'),
(14, 12, '', 1, 40, 1, '2025-08-28 15:51:41', '2025-08-28 16:12:22'),
(15, 12, '', 0, 40, 0, '2025-08-28 16:14:14', '2025-08-28 16:26:16'),
(16, 12, '', 1, 40, 1, '2025-08-28 16:26:44', '2025-08-28 16:27:00'),
(17, 12, '', 1, 40, 1, '2025-08-28 16:27:38', '2025-08-28 16:27:38'),
(18, 12, '', 1, 40, 1, '2025-08-28 16:27:46', '2025-08-28 16:27:46'),
(19, 12, '', 1, 40, 1, '2025-08-28 16:28:17', '2025-08-28 16:28:21'),
(20, 12, '', 1, 40, 1, '2025-08-28 16:29:57', '2025-08-28 16:29:57'),
(21, 12, 'toan_tu_luan', 0, 20, 0, '2025-08-28 16:30:19', '2025-08-28 16:36:09'),
(22, 12, 'toan_tu_luan', 0, 20, 0, '2025-08-28 16:36:30', '2025-08-28 16:36:30'),
(23, 12, 'toan_tu_luan', 0, 20, 0, '2025-08-28 16:40:52', '2025-08-28 16:40:52'),
(24, 12, 'toan_tu_luan', 0, 20, 0, '2025-08-28 16:41:18', '2025-08-28 16:41:18'),
(25, 12, 'toan_tu_luan', 0, 20, 0, '2025-08-28 16:41:55', '2025-08-28 16:41:55'),
(26, 12, 'toan_tu_luan', 0, 20, 0, '2025-08-28 16:42:10', '2025-08-28 16:42:16'),
(27, 12, 'toan_tu_luan', 0, 20, 0, '2025-08-28 16:42:35', '2025-08-28 16:42:43'),
(28, 12, 'toan_tu_luan', 0, 20, 0, '2025-08-28 16:50:47', '2025-08-28 16:50:47'),
(29, 12, 'toan_tu_luan', 1, 20, 1, '2025-08-28 16:50:56', '2025-08-28 16:50:59'),
(30, 12, '', 2, 40, 2, '2025-08-28 16:52:20', '2025-08-28 16:52:26'),
(31, 12, 'toan_tu_luan', 2, 20, 2, '2025-08-28 16:52:37', '2025-08-28 16:52:42'),
(32, 12, 'toan_tu_luan', 2, 20, 2, '2025-08-28 16:59:02', '2025-08-28 16:59:02'),
(33, 12, '', 1, 40, 1, '2025-08-28 17:00:59', '2025-08-28 17:01:03'),
(34, 12, 'toan_tu_luan', 1, 20, 1, '2025-08-28 17:01:17', '2025-08-28 17:01:21'),
(35, 12, 'toan_tu_luan', 1, 20, 1, '2025-08-28 17:01:56', '2025-08-28 17:01:56'),
(36, 12, 'toan_tu_luan', 1, 20, 1, '2025-08-28 17:03:23', '2025-08-28 17:03:23'),
(37, 12, 'toan_tu_luan', 1, 20, 1, '2025-08-28 17:03:57', '2025-08-28 17:03:57'),
(38, 12, 'toan_tu_luan', 1, 20, 1, '2025-08-28 17:04:14', '2025-08-28 17:04:14'),
(39, 12, 'toan_tu_luan', 2, 20, 2, '2025-08-28 17:09:15', '2025-08-28 17:12:15');

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
  `REG_DATE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`ID`, `USERNAME`, `PASSWORD`, `EMAIL`, `PHONE`, `REG_DATE`) VALUES
(1, 'thanhtroll2oo45', '$2y$10$iUTBf7zXZ/dJ2XMMUcBII.lGdD8my.MMsnWTi3qosYm9otHLfIXby', '', '', '2025-08-17 16:03:13'),
(5, 'khoane123', '$2y$10$RbzzAE.a.G/b6cZUZZwxTuRN2oa2cD.pokRM9LuuBgxe6K1VlH0zK', 'khoahuynhkhoah12321@gmail.com', '0827396638', '2025-08-17 16:32:53'),
(6, 'nam123', '$2y$10$i688gQ7/zUM7uzbFWRj4d.knjcqtfn/uoaJ85wNPpiRZ9sDsG67rO', 'namhuynh123@gmail.com', '0123456789', '2025-08-19 06:16:39'),
(9, 'tuitenkhoa', '$2y$10$hLO2qtqjqFUJ/jDoSc8o2.wtmFGKo.01J4q/gjCyGA.ldL7GYlYgi', 'hungnguyen180705@gmail.com', '0937248462', '2025-08-19 08:01:02'),
(11, 'tuitenhoang', '$2y$10$pRDB3YjfzUXTs6uN7L3TdOore5lJNRPPCyDFtHVlMNftMBJyDRbNi', 'hongtyvn@gmail.com', '099999999', '2025-08-19 08:04:35'),
(12, 'dsada', '$2y$10$nZSfFhZ6.TXEH/SfU4urkenOJljnUgiUvSIEVfKO.gytm9CnCVq1q', 'Tata123@gmail.com', '0152435765', '2025-08-26 08:38:53');

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
(1, 2, 1, 'A', 1),
(2, 2, 2, 'A', 1),
(3, 2, 3, 'A', 0),
(4, 2, 4, 'A', 1),
(5, 2, 5, NULL, 0),
(6, 2, 6, NULL, 0),
(7, 2, 7, NULL, 0),
(8, 2, 8, NULL, 0),
(9, 2, 9, NULL, 0),
(10, 2, 10, NULL, 0),
(11, 2, 11, NULL, 0),
(12, 2, 12, NULL, 0),
(13, 2, 13, NULL, 0),
(14, 2, 14, NULL, 0),
(15, 2, 15, NULL, 0),
(16, 2, 16, NULL, 0),
(17, 2, 17, NULL, 0),
(18, 2, 18, NULL, 0),
(19, 2, 19, NULL, 0),
(20, 2, 20, NULL, 0),
(21, 2, 21, NULL, 0),
(22, 2, 22, NULL, 0),
(23, 2, 23, NULL, 0),
(24, 2, 24, NULL, 0),
(25, 2, 25, NULL, 0),
(26, 2, 26, NULL, 0),
(27, 2, 27, NULL, 0),
(28, 2, 28, NULL, 0),
(29, 2, 29, NULL, 0),
(30, 2, 30, NULL, 0),
(31, 2, 31, NULL, 0),
(32, 2, 32, NULL, 0),
(33, 2, 33, NULL, 0),
(34, 2, 34, NULL, 0),
(35, 2, 35, NULL, 0),
(36, 2, 36, NULL, 0),
(37, 2, 37, NULL, 0),
(38, 2, 38, NULL, 0),
(39, 2, 39, NULL, 0),
(40, 2, 40, NULL, 0),
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
(180, 9, 20, '', 0),
(181, 10, 1, NULL, 0),
(182, 10, 2, NULL, 0),
(183, 10, 3, NULL, 0),
(184, 10, 4, NULL, 0),
(185, 10, 5, NULL, 0),
(186, 10, 6, NULL, 0),
(187, 10, 7, NULL, 0),
(188, 10, 8, NULL, 0),
(189, 10, 9, NULL, 0),
(190, 10, 10, NULL, 0),
(191, 10, 11, NULL, 0),
(192, 10, 12, NULL, 0),
(193, 10, 13, NULL, 0),
(194, 10, 14, NULL, 0),
(195, 10, 15, NULL, 0),
(196, 10, 16, NULL, 0),
(197, 10, 17, NULL, 0),
(198, 10, 18, NULL, 0),
(199, 10, 19, NULL, 0),
(200, 10, 20, NULL, 0),
(201, 10, 21, NULL, 0),
(202, 10, 22, NULL, 0),
(203, 10, 23, NULL, 0),
(204, 10, 24, NULL, 0),
(205, 10, 25, NULL, 0),
(206, 10, 26, NULL, 0),
(207, 10, 27, NULL, 0),
(208, 10, 28, NULL, 0),
(209, 10, 29, NULL, 0),
(210, 10, 30, NULL, 0),
(211, 10, 31, NULL, 0),
(212, 10, 32, NULL, 0),
(213, 10, 33, NULL, 0),
(214, 10, 34, NULL, 0),
(215, 10, 35, NULL, 0),
(216, 10, 36, NULL, 0),
(217, 10, 37, NULL, 0),
(218, 10, 38, NULL, 0),
(219, 10, 39, NULL, 0),
(220, 10, 40, NULL, 0),
(221, 11, 1, NULL, 0),
(222, 11, 2, NULL, 0),
(223, 11, 3, NULL, 0),
(224, 11, 4, NULL, 0),
(225, 11, 5, NULL, 0),
(226, 11, 6, NULL, 0),
(227, 11, 7, NULL, 0),
(228, 11, 8, NULL, 0),
(229, 11, 9, NULL, 0),
(230, 11, 10, NULL, 0),
(231, 11, 11, NULL, 0),
(232, 11, 12, NULL, 0),
(233, 11, 13, NULL, 0),
(234, 11, 14, NULL, 0),
(235, 11, 15, NULL, 0),
(236, 11, 16, NULL, 0),
(237, 11, 17, NULL, 0),
(238, 11, 18, NULL, 0),
(239, 11, 19, NULL, 0),
(240, 11, 20, NULL, 0),
(241, 11, 21, NULL, 0),
(242, 11, 22, NULL, 0),
(243, 11, 23, NULL, 0),
(244, 11, 24, NULL, 0),
(245, 11, 25, NULL, 0),
(246, 11, 26, NULL, 0),
(247, 11, 27, NULL, 0),
(248, 11, 28, NULL, 0),
(249, 11, 29, NULL, 0),
(250, 11, 30, NULL, 0),
(251, 11, 31, NULL, 0),
(252, 11, 32, NULL, 0),
(253, 11, 33, NULL, 0),
(254, 11, 34, NULL, 0),
(255, 11, 35, NULL, 0),
(256, 11, 36, NULL, 0),
(257, 11, 37, NULL, 0),
(258, 11, 38, NULL, 0),
(259, 11, 39, NULL, 0),
(260, 11, 40, NULL, 0);

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
-- Chỉ mục cho bảng `question_chemistry_8`
--
ALTER TABLE `question_chemistry_8`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_chemistry_9`
--
ALTER TABLE `question_chemistry_9`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_chemistry_10`
--
ALTER TABLE `question_chemistry_10`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_chemistry_11`
--
ALTER TABLE `question_chemistry_11`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_chemistry_12`
--
ALTER TABLE `question_chemistry_12`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_english_6`
--
ALTER TABLE `question_english_6`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_english_7`
--
ALTER TABLE `question_english_7`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_english_8`
--
ALTER TABLE `question_english_8`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_english_9`
--
ALTER TABLE `question_english_9`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_english_10`
--
ALTER TABLE `question_english_10`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_english_11`
--
ALTER TABLE `question_english_11`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_english_12`
--
ALTER TABLE `question_english_12`
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
-- Chỉ mục cho bảng `question_physics_6`
--
ALTER TABLE `question_physics_6`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_physics_7`
--
ALTER TABLE `question_physics_7`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_physics_8`
--
ALTER TABLE `question_physics_8`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_physics_9`
--
ALTER TABLE `question_physics_9`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_physics_10`
--
ALTER TABLE `question_physics_10`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `question_physics_11`
--
ALTER TABLE `question_physics_11`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT cho bảng `question_chemistry_8`
--
ALTER TABLE `question_chemistry_8`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_chemistry_9`
--
ALTER TABLE `question_chemistry_9`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `question_chemistry_10`
--
ALTER TABLE `question_chemistry_10`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_chemistry_11`
--
ALTER TABLE `question_chemistry_11`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_chemistry_12`
--
ALTER TABLE `question_chemistry_12`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_english_6`
--
ALTER TABLE `question_english_6`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_english_7`
--
ALTER TABLE `question_english_7`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_english_8`
--
ALTER TABLE `question_english_8`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_english_9`
--
ALTER TABLE `question_english_9`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_english_10`
--
ALTER TABLE `question_english_10`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_english_11`
--
ALTER TABLE `question_english_11`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_english_12`
--
ALTER TABLE `question_english_12`
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
-- AUTO_INCREMENT cho bảng `question_physics_6`
--
ALTER TABLE `question_physics_6`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT cho bảng `question_physics_7`
--
ALTER TABLE `question_physics_7`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `question_physics_8`
--
ALTER TABLE `question_physics_8`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `question_physics_9`
--
ALTER TABLE `question_physics_9`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `question_physics_10`
--
ALTER TABLE `question_physics_10`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `question_physics_11`
--
ALTER TABLE `question_physics_11`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
