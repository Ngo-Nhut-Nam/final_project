// Bắt đầu thi
function startExam(examId) {
    const exam = getExamById(examId);
    if (!exam) {
        showNotification("Không tìm thấy đề thi", "error");
        return;
    }

    AppState.currentExam = exam;
    AppState.currentAnswers = {};
    AppState.remainingTime = exam.time * 60;

    showPage("exam-taking");
    renderExamQuestions(exam);
    startExamTimer();
}

// Render câu hỏi
function renderExamQuestions(exam) {
    const container = document.getElementById("exam-questions");
    if (!container) return;

    container.innerHTML = exam.questions.map((q, i) => `
        <div class="question">
            <h4>Câu ${i + 1}: ${q.question}</h4>
            ${q.options.map((opt, idx) => `
                <label>
                    <input type="radio" name="q${i}" value="${idx}" 
                        onchange="saveAnswer(${i}, ${idx})"
                        ${AppState.currentAnswers[i] === idx ? "checked" : ""}>
                    ${opt}
                </label>
            `).join("")}
        </div>
    `).join("");

    // Gắn nút nộp bài
    const submitBtn = document.getElementById("submit-exam-btn");
    if (submitBtn) {
        submitBtn.onclick = submitExam;
    }
}

// Lưu đáp án người dùng
function saveAnswer(qIndex, answer) {
    AppState.currentAnswers[qIndex] = answer;
}

// Đếm ngược thời gian
function startExamTimer() {
    const timerEl = document.getElementById("exam-timer");
    if (!timerEl) return;

    if (AppState.timerInterval) clearInterval(AppState.timerInterval);

    AppState.timerInterval = setInterval(() => {
        AppState.remainingTime--;
        timerEl.textContent = formatTime(AppState.remainingTime);

        if (AppState.remainingTime <= 0) {
            clearInterval(AppState.timerInterval);
            submitExam();
        }
    }, 1000);
}

// Nộp bài
function submitExam() {
    if (!AppState.currentExam) return;

    clearInterval(AppState.timerInterval);
    const results = calculateExamResults();
    AppState.examResults.push(results);
    saveStateToStorage();

    renderExamResults(results);
    showPage("exam-result");
}

// Tính kết quả
function calculateExamResults() {
    const exam = AppState.currentExam;
    const answers = AppState.currentAnswers;

    let correct = 0;
    exam.questions.forEach((q, i) => {
        if (answers[i] === q.answer) correct++;
    });

    return {
        examId: exam.id,
        examName: exam.name,
        score: ((correct / exam.questions.length) * 10).toFixed(2),
        correct,
        total: exam.questions.length,
        timeSpent: exam.time * 60 - AppState.remainingTime,
        date: new Date().toISOString()
    };
}

// Hiển thị kết quả
function renderExamResults(results) {
    const container = document.getElementById("exam-result-content");
    if (!container) return;

    container.innerHTML = `
        <h2>Kết quả bài thi</h2>
        <p><b>Đề thi:</b> ${results.examName}</p>
        <p><b>Điểm:</b> ${results.score}/10</p>
        <p><b>Số câu đúng:</b> ${results.correct}/${results.total}</p>
        <p><b>Thời gian làm:</b> ${formatTime(results.timeSpent)}</p>
        <button onclick="showPage('exam-list')">Quay lại danh sách</button>
    `;
}
