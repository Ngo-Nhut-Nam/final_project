const AppState = {
    currentUser: null,
    currentPage: 'home',
    exams: [],
    examResults: [],
    isLoading: false
};

// Load state
function loadStateFromStorage() {
    const savedExams = localStorage.getItem('exams');
    const savedUser = localStorage.getItem('currentUser');
    const savedPage = sessionStorage.getItem('currentPage');
    
    AppState.exams = savedExams ? JSON.parse(savedExams) : [];
    AppState.currentUser = savedUser ? JSON.parse(savedUser) : null;
    AppState.currentPage = savedPage || 'home';
}

// Save state
function saveStateToStorage() {
    localStorage.setItem('exams', JSON.stringify(AppState.exams));
    if (AppState.currentUser) {
        localStorage.setItem('currentUser', JSON.stringify(AppState.currentUser));
    }
    sessionStorage.setItem('currentPage', AppState.currentPage);
}
