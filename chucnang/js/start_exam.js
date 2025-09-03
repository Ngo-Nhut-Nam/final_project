function startExam(subject) {
    window.location.href = "?subject=" + subject;
}
function filterExams() {
    let filter = document.getElementById('subject-filter').value;
    document.querySelectorAll('.exam-card').forEach(exam => {
        exam.style.display = (filter === 'all' || exam.dataset.subject === filter) ? '' : 'none';
    });
}

