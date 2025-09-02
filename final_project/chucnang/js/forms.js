function handleAddExam(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    addExam(Object.fromEntries(formData.entries()));
    showPage('exam-list');
}

function handleEditExam(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    const examId = new URLSearchParams(window.location.search).get('id');
    if (examId) updateExam(examId, Object.fromEntries(formData.entries()));
    showPage('exam-list');
}

function handleUpdateProfile(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    localStorage.setItem('userProfile', JSON.stringify(Object.fromEntries(formData.entries())));
    showNotification('Cập nhật thông tin thành công!', 'success');
    showPage('exam-list');
}
