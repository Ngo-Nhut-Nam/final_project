// Load danh sách đề thi
function loadExams() {
    fetch("exam_api.php?action=list")
        .then(res => res.json())
        .then(data => {
            const container = document.querySelector(".exams-grid");
            container.innerHTML = "";
            data.forEach(exam => {
                container.innerHTML += `
                <div class="exam-card">
                    <div class="exam-header"><h3>${exam.title}</h3></div>
                    <div class="exam-body">
                        <div class="exam-info"><span>Số câu:</span> <span>${exam.questions} câu</span></div>
                        <div class="exam-info"><span>Thời gian:</span> <span>${exam.time} phút</span></div>
                        <div class="exam-info"><span>Độ khó:</span> <span>${exam.difficulty}</span></div>
                    </div>
                    <div class="exam-footer">
                        <a href="start_exam.php?exam_id=${exam.id}" class="btn btn-primary">Bắt đầu thi</a>
                        <a href="edit_exam.php?subject=${exam.subject}" class="btn btn-secondary">Sửa</a>
                        <button class="btn btn-danger" onclick="deleteExam(${exam.id})">Xóa</button>
                    </div>
                </div>`;
            });
        });
}

function filterExams() {
    let subjectFilter = document.getElementById("subject-filter").value;
    let typeFilter = document.getElementById("type-filter").value;
    let exams = document.querySelectorAll(".exam-card");

    exams.forEach(exam => {
        let subject = exam.dataset.subject;
        let type = exam.dataset.type;

        if ((subjectFilter === "all" || subject === subjectFilter) &&
            (typeFilter === "all" || type === typeFilter)) {
            exam.style.display = "block";
        } else {
            exam.style.display = "none";
        }
    });
}



// Sửa đề thi (hiện tại dùng file edit_exam.php trực tiếp)
function editExam(id) {
    window.location.href = `edit_exam.php?id=${id}`;
}

// Xóa đề thi
function deleteExam(id) {
    if (!confirm("Bạn có chắc chắn muốn xóa đề thi này?")) return;
    const formData = new FormData();
    formData.append("id", id);
    fetch("exam_api.php?action=delete", { method: "POST", body: formData })
        .then(res => res.text())
        .then(data => {
            if (data === "success") {
                alert("Đã xóa!");
                loadExams();
            }
        });
}

// Khi trang load thì nạp danh sách đề thi
window.onload = loadExams;
