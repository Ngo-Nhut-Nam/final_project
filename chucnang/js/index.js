

const AppState = {
    currentUser: null,
    currentPage: 'home',
    exams: [],
    examResults: [],
    isLoading: false
};

// ========================================
// UTILITY FUNCTIONS
// ========================================

// Format time from seconds to MM:SS
function formatTime(seconds) {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    return `${minutes.toString().padStart(2, '0')}:${remainingSeconds.toString().padStart(2, '0')}`;
}

// Generate unique ID
function generateId() {
    return Date.now().toString(36) + Math.random().toString(36).substr(2);
}

// Show notification
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.remove();
    }, 3000);
}

// ========================================
// STATE MANAGEMENT
// ========================================

// Initialize application state
function initializeApp() {
    loadStateFromStorage();
    renderCurrentPage();
    setupEventListeners();
}

// Load state from localStorage
function loadStateFromStorage() {
    const savedExams = localStorage.getItem('exams');
    const savedUser = localStorage.getItem('currentUser');
    const savedPage = sessionStorage.getItem('currentPage');
    
    AppState.exams = savedExams ? JSON.parse(savedExams) : DEFAULT_EXAMS;
    AppState.currentUser = savedUser ? JSON.parse(savedUser) : null;
    AppState.currentPage = savedPage || 'home';
}

// Save state to localStorage
function saveStateToStorage() {
    localStorage.setItem('exams', JSON.stringify(AppState.exams));
    if (AppState.currentUser) {
        localStorage.setItem('currentUser', JSON.stringify(AppState.currentUser));
    }
    sessionStorage.setItem('currentPage', AppState.currentPage);
}

// ========================================
// NAVIGATION SYSTEM
// ========================================

// Show specific page
function showPage(pageId) {
    // Hide all pages
    document.querySelectorAll('.page').forEach(page => {
        page.classList.remove('active');
    });
    
    // Show selected page
    const targetPage = document.getElementById(pageId);
    if (targetPage) {
        targetPage.classList.add('active');
        AppState.currentPage = pageId;
        saveStateToStorage();
        
        // Handle page-specific logic
        handlePageLoad(pageId);
    } else {
        console.error(`Page with id '${pageId}' not found`);
    }
}

// Handle page-specific logic when loading
function handlePageLoad(pageId) {
    switch (pageId) {
        case 'exam-list':
            renderExamList();
            break;
        case 'profile':
            loadProfileData();
            break;
        case 'add-exam':
            resetAddExamForm();
            break;
        case 'edit-exam':
            loadExamDataForEdit();
            break;
    }
}

// ========================================
// EXAM MANAGEMENT
// ========================================

// Get all exams
function getExams() {
    return AppState.exams;
}

// Add new exam
function addExam(examData) {
    const newExam = {
        id: generateId(),
        name: examData.title,
        subject: examData.subject,
        questions: [],
        time: parseInt(examData.time),
        numQuestions: parseInt(examData.questions),
        level: examData.difficulty,
        description: examData.description || '',
        createdAt: new Date().toISOString()
    };
    
    AppState.exams.push(newExam);
    saveStateToStorage();
    renderExamList();
    
    showNotification('Thêm đề thi thành công!', 'success');
    return newExam;
}

// Update existing exam
function updateExam(examId, examData) {
    const examIndex = AppState.exams.findIndex(e => e.id === examId);
    
    if (examIndex !== -1) {
        AppState.exams[examIndex] = {
            ...AppState.exams[examIndex],
            name: examData.title,
            subject: examData.subject,
            time: parseInt(examData.time),
            numQuestions: parseInt(examData.questions),
            level: examData.difficulty,
            description: examData.description || '',
            updatedAt: new Date().toISOString()
        };
        
        saveStateToStorage();
        renderExamList();
        
        showNotification('Cập nhật đề thi thành công!', 'success');
        return AppState.exams[examIndex];
    }
    
    showNotification('Không tìm thấy đề thi!', 'error');
    return null;
}

// Delete exam
function deleteExam(examId) {
    if (confirm('Bạn có chắc chắn muốn xóa đề thi này?')) {
        AppState.exams = AppState.exams.filter(e => e.id !== examId);
        saveStateToStorage();
        renderExamList();
        
        showNotification('Xóa đề thi thành công!', 'success');
    }
}

// Get exam by ID
function getExamById(examId) {
    return AppState.exams.find(e => e.id === examId);
}

// ========================================
// EXAM RENDERING
// ========================================

// Get subject name in Vietnamese
function getSubjectName(subject) {
    const subjects = {
        'math': 'Toán học',
        'physics': 'Vật lý',
        'chemistry': 'Hóa học',
        'english': 'Tiếng Anh'
    };
    return subjects[subject] || subject;
}

// Get difficulty name in Vietnamese
function getDifficultyName(level) {
    const difficulties = {
        'easy': 'Dễ',
        'medium': 'Trung bình',
        'hard': 'Khó'
    };
    return difficulties[level] || level;
}

// ========================================
// EXAM TAKING
// ========================================

// Start exam
function startExam(examId) {
    const exam = getExamById(examId);
    if (!exam) {
        showNotification('Không tìm thấy đề thi!', 'error');
        return;
    }
    
    // Initialize exam session
    const examSession = {
        examId: exam.id,
        startTime: new Date(),
        answers: {},
        timeLeft: exam.time * 60
    };
    
    sessionStorage.setItem('currentExam', JSON.stringify(examSession));
    
    // Show exam page
    showPage('exam');
    renderExamQuestions(exam);
    startExamTimer(examSession);
}

// Render exam questions
function renderExamQuestions(exam) {
    const examContainer = document.querySelector('#exam .exam-container');
    if (!examContainer) return;
    
    let html = `
        <h2 class="exam-title" id="exam-name">${exam.name}</h2>
        <div class="timer" id="timer">${formatTime(exam.time * 60)}</div>
        <div class="exam-description">${exam.description}</div>
    `;
    
    // Render questions
    exam.questions.forEach((question, index) => {
        html += `
            <div class="question" data-question-id="${question.id}">
                <p><strong>Câu ${index + 1}:</strong> ${question.text}</p>
                <div class="options">
                    ${question.options.map((option, optIndex) => `
                        <div class="option">
                            <input type="radio" name="q${question.id}" 
                                   id="q${question.id}${optIndex}" 
                                   value="${optIndex}"
                                   onchange="saveAnswer(${question.id}, ${optIndex})">
                            <label for="q${question.id}${optIndex}">
                                ${String.fromCharCode(65 + optIndex)}. ${option}
                            </label>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    });
    
    html += `
        <div class="submit-container">
            <button class="btn btn-primary" onclick="submitExam()">Nộp bài</button>
            <button class="btn btn-secondary" onclick="showPage('exam-list')">Thoát</button>
        </div>
    `;
    
    examContainer.innerHTML = html;
}

// Save answer during exam
function saveAnswer(questionId, answerIndex) {
    const examSession = JSON.parse(sessionStorage.getItem('currentExam') || '{}');
    examSession.answers[questionId] = answerIndex;
    sessionStorage.setItem('currentExam', JSON.stringify(examSession));
}

// Start exam timer
function startExamTimer(examSession) {
    const timerElement = document.getElementById('timer');
    if (!timerElement) return;
    
    const timerInterval = setInterval(() => {
        examSession.timeLeft--;
        
        if (timerElement) {
            timerElement.textContent = formatTime(examSession.timeLeft);
        }
        
        if (examSession.timeLeft <= 0) {
            clearInterval(timerInterval);
            submitExam();
        }
    }, 1000);
    
    // Store timer interval ID
    sessionStorage.setItem('examTimer', timerInterval);
}

// Submit exam
function submitExam() {
    const examSession = JSON.parse(sessionStorage.getItem('currentExam') || '{}');
    const exam = getExamById(examSession.examId);
    
    if (!exam || !examSession) {
        showNotification('Lỗi khi nộp bài!', 'error');
        return;
    }
    
    // Calculate results
    const results = calculateExamResults(exam, examSession);
    
    // Save results
    AppState.examResults.push(results);
    saveStateToStorage();
    
    // Clear exam session
    sessionStorage.removeItem('currentExam');
    sessionStorage.removeItem('examTimer');
    
    // Show results page
    showPage('result');
    renderExamResults(results);
}

// Calculate exam results
function calculateExamResults(exam, examSession) {
    let correctAnswers = 0;
    const totalQuestions = exam.questions.length;
    
    exam.questions.forEach(question => {
        const userAnswer = examSession.answers[question.id];
        if (userAnswer === question.answer) {
            correctAnswers++;
        }
    });
    
    const score = (correctAnswers / totalQuestions) * 10;
    const accuracy = (correctAnswers / totalQuestions) * 100;
    
    return {
        examId: exam.id,
        examName: exam.name,
        score: Math.round(score * 10) / 10,
        correctAnswers,
        totalQuestions,
        accuracy: Math.round(accuracy),
        timeSpent: (exam.time * 60) - examSession.timeLeft,
        submittedAt: new Date().toISOString()
    };
}

// Render exam results
function renderExamResults(results) {
    const resultContainer = document.querySelector('#result .result-container');
    if (!resultContainer) return;
    
    resultContainer.innerHTML = `
        <h2>Kết quả bài thi</h2>
        <p>Môn: <strong>${results.examName}</strong></p>
        <div class="result-score">${results.score}/10</div>
        <p>Chúc mừng bạn đã hoàn thành bài thi!</p>
        
        <div class="result-details">
            <div class="detail-item">
                <span>Số câu đúng:</span>
                <span>${results.correctAnswers}/${results.totalQuestions}</span>
            </div>
            <div class="detail-item">
                <span>Thời gian hoàn thành:</span>
                <span>${formatTime(results.timeSpent)}</span>
            </div>
            <div class="detail-item">
                <span>Độ chính xác:</span>
                <span>${results.accuracy}%</span>
            </div>
            <div class="detail-item">
                <span>Điểm số:</span>
                <span>${results.score}/10</span>
            </div>
        </div>
        
        <button class="btn btn-primary review-btn" onclick="showPage('exam-list')">
            Làm đề khác
        </button>
    `;
}

// ========================================
// FORM HANDLING
// ========================================

// Reset add exam form
function resetAddExamForm() {
    const form = document.getElementById('add-exam-form');
    if (form) {
        form.reset();
    }
}

// Load exam data for editing
function loadExamDataForEdit() {
    const urlParams = new URLSearchParams(window.location.search);
    const examId = urlParams.get('id');
    
    if (examId) {
        const exam = getExamById(examId);
        if (exam) {
            document.getElementById('edit-exam-title').value = exam.name || '';
            document.getElementById('edit-exam-subject').value = exam.subject || 'math';
            document.getElementById('edit-exam-questions').value = exam.numQuestions || '';
            document.getElementById('edit-exam-time').value = exam.time || '';
            document.getElementById('edit-exam-difficulty').value = exam.level || 'medium';
        }
    }
}

// Load profile data
function loadProfileData() {
    const profileData = JSON.parse(localStorage.getItem('userProfile'));
    if (profileData) {
        document.getElementById('profile-email').value = profileData.email || '';
        document.getElementById('profile-phone').value = profileData.phone || '';
        document.getElementById('profile-password').value = profileData.password || '';
    }
}

// ========================================
// EVENT LISTENERS
// ========================================

// Setup global event listeners
function setupEventListeners() {
    // Subject filter change
    const subjectFilter = document.getElementById('subject-filter');
    if (subjectFilter) {
        subjectFilter.addEventListener('change', renderExamList);
    }
    
    // Add exam form submission
    const addExamForm = document.getElementById('add-exam-form');
    if (addExamForm) {
        addExamForm.addEventListener('submit', handleAddExam);
    }
    
    // Edit exam form submission
    const editExamForm = document.getElementById('edit-exam-form');
    if (editExamForm) {
        editExamForm.addEventListener('submit', handleEditExam);
    }
    
    // Profile form submission
    const profileForm = document.getElementById('profile-form');
    if (profileForm) {
        profileForm.addEventListener('submit', handleUpdateProfile);
    }
}

// Handle add exam form
function handleAddExam(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    
    const examData = {
        title: formData.get('title'),
        subject: formData.get('subject'),
        questions: formData.get('questions'),
        time: formData.get('time'),
        difficulty: formData.get('difficulty'),
        description: formData.get('description') || ''
    };
    
    addExam(examData);
    showPage('exam-list');
}

// Handle edit exam form
function handleEditExam(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    
    const examData = {
        title: formData.get('title'),
        subject: formData.get('subject'),
        questions: formData.get('questions'),
        time: formData.get('time'),
        difficulty: formData.get('difficulty'),
        description: formData.get('description') || ''
    };
    
    const urlParams = new URLSearchParams(window.location.search);
    const examId = urlParams.get('id');
    
    if (examId) {
        updateExam(examId, examData);
        showPage('exam-list');
    }
}

// Handle profile update
function handleUpdateProfile(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    
    const profileData = {
        username: formData.get('username'),
        email: formData.get('email'),
        phone: formData.get('phone'),
        password: formData.get('password')
    };
    
    localStorage.setItem('userProfile', JSON.stringify(profileData));
    showNotification('Cập nhật thông tin thành công!', 'success');
    showPage('exam-list');
}

// ========================================
// INITIALIZATION
// ========================================

// Initialize app when DOM is loaded
document.addEventListener('DOMContentLoaded', initializeApp);

// Export functions for global use
window.showPage = showPage;
window.startExam = startExam;
window.submitExam = submitExam;
window.addExam = addExam;
window.updateExam = updateExam;
window.deleteExam = deleteExam;
window.editExam = function(examId) {
    showPage('edit-exam');
    // Load exam data for editing
    const exam = getExamById(examId);
    if (exam) {
        // Store exam data temporarily for editing
        sessionStorage.setItem('editingExam', JSON.stringify(exam));
    }
};


        function renderExamList() {
    const grid = document.querySelector('.exams-grid');
    if (!grid) return;
    
    const exams = getExams();
    const subjectFilter = document.getElementById('subject-filter')?.value || 'all';
    
    // Filter exams by subject
    const filteredExams = subjectFilter === 'all' 
        ? exams 
        : exams.filter(e => e.subject === subjectFilter);
    
    grid.innerHTML = filteredExams.map(exam => `
        <div class="exam-card" data-exam-id="${exam.id}">
            <div class="exam-header">
                <h3>${exam.name}</h3>
                <span class="exam-subject">${getSubjectName(exam.subject)}</span>
            </div>
            <div class="exam-body">
                <div class="exam-info">
                    <span>Số câu:</span>
                    <span>${exam.numQuestions} câu</span>
                </div>
                <div class="exam-info">
                    <span>Thời gian:</span>
                    <span>${exam.time} phút</span>
                </div>
                <div class="exam-info">
                    <span>Độ khó:</span>
                    <span class="difficulty-${exam.level}">${getDifficultyName(exam.level)}</span>
                </div>
            </div>
            <div class="exam-footer">
                <button class="btn btn-primary" onclick="startExam('${exam.id}')">
                    Bắt đầu thi
                </button>
                <button class="btn btn-secondary" onclick="editExam('${exam.id}')">
                    Sửa
                </button>
                <button class="btn btn-danger" onclick="deleteExam('${exam.id}')">
                    Xóa
                </button>
            </div>
        </div>
    `).join('');
}
