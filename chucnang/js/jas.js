        
        const AppState = {
        currentUser: null,
        currentPage: 'home',
        exams: [],
        examResults: [],
        isLoading: false
        };


        // Bắt đầu làm bài thi trong meta..
        function startExam(subject) {
            // Thiết lập thời gian làm bài
            timeLeft = 60 * 60; // 60 phút
            
            // Cập nhật tên đề thi
            const examNameElement = document.getElementById('exam-name');
            if (subject === 'math') {
                examNameElement.textContent = 'Đề thi Toán học - Giữa kỳ 1';
            } else if (subject === 'physics') {
                examNameElement.textContent = 'Đề thi Vật lý - Chương 1';
            } else if (subject === 'english') {
                examNameElement.textContent = 'Đề thi Tiếng Anh - Bài kiểm tra 1';
            }
            
            // Bắt đầu đếm ngược
            startTimer();
            
            // Hiển thị trang làm bài
            showPage('exam');
        }

        // Hẹn giờ làm bài
        let timeLeft;
        let timerInterval;

        function startTimer() {
            clearInterval(timerInterval);
            
            timerInterval = setInterval(function() {
                timeLeft--;
                
                const minutes = Math.floor(timeLeft / 60);
                const seconds = timeLeft % 60;
                
                document.getElementById('timer').textContent = 
                    `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
                
                if (timeLeft <= 0) {
                    clearInterval(timerInterval);
                    submitExam();
                }
            }, 1000);
        }

        // Nộp bài
        function submitExam() {
            clearInterval(timerInterval);
            
            // Hiển thị kết quả
            showPage('result');
        }

            // Hàm showPage để chuyển đổi giữa các trang
        function showPage(pageId) {
            // Ẩn tất cả các trang
            document.querySelectorAll('.page').forEach(page => {
                page.classList.remove('active');
            });
            
            // Hiển thị trang được chọn
            const targetPage = document.getElementById(pageId);
            if (targetPage) {
                targetPage.classList.add('active');
                
                // Cuộn lên đầu trang
                window.scrollTo(0, 0);
                
                // Lưu trang hiện tại vào sessionStorage
                sessionStorage.setItem('currentPage', pageId);
            }
        }

        // Khi trang load, kiểm tra xem có trang nào được lưu không
        document.addEventListener('DOMContentLoaded', function() {
            const savedPage = sessionStorage.getItem('currentPage');
            if (savedPage) {
                showPage(savedPage);
            } else {
                showPage('exam-list');
            }
        });

        