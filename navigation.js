function showPage(pageId) {
    document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
    const targetPage = document.getElementById(pageId);
    if (targetPage) {
        targetPage.classList.add('active');
        AppState.currentPage = pageId;
        saveStateToStorage();
        handlePageLoad(pageId);
    }
}

function handlePageLoad(pageId) {
    switch (pageId) {
        case 'exam-list': renderExamList(); break;
        case 'profile': loadProfileData(); break;
        case 'add-exam': resetAddExamForm(); break;
        case 'edit-exam': loadExamDataForEdit(); break;
    }
}
