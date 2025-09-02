document.addEventListener("DOMContentLoaded", function () {
    const subjectFilter = document.getElementById("subjectFilter");
    const typeFilter = document.getElementById("typeFilter");
    const exams = document.querySelectorAll(".exam-card");

    function filterExams() {
        const selectedSubject = subjectFilter.value;
        const selectedType = typeFilter.value;

        exams.forEach(exam => {
            const examSubject = exam.dataset.subject;
            const examType = exam.dataset.type;

            // debug: kiểm tra giá trị trong console
            console.log("examType:", examType, "selectedType:", selectedType);

            const matchSubject = (selectedSubject === "all") || (examSubject === selectedSubject);
            const matchType = (selectedType === "all") || (examType === selectedType);

            exam.style.display = (matchSubject && matchType) ? "block" : "none";
        });
    }

    // gắn listener cho cả 2 select
    subjectFilter.addEventListener("change", filterExams);
    typeFilter.addEventListener("change", filterExams);

    // chạy lần đầu khi load trang
    filterExams();
});
