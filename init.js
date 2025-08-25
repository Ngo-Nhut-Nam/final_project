function setupEventListeners() {
    document.getElementById('subject-filter')?.addEventListener('change', renderExamList);
    document.getElementById('add-exam-form')?.addEventListener('submit', handleAddExam);
    document.getElementById('edit-exam-form')?.addEventListener('submit', handleEditExam);
    document.getElementById('profile-form')?.addEventListener('submit', handleUpdateProfile);
}

function initializeApp() {
    loadStateFromStorage();
    renderExamList();
    setupEventListeners();
    showPage(AppState.currentPage);
}

document.addEventListener('DOMContentLoaded', initializeApp);
