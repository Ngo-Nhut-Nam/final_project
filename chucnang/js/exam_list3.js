function loadExams() {
    fetch("exam_api.php?action=list")
        .then(res => res.json())
        .then(data => {
            const container = document.getElementById("exam-list");
            container.innerHTML = "";

            if (data.length === 0) {
                container.innerHTML = "<p>Chưa có đề thi nào.</p>";
                return;
            }

            data.forEach(exam => {
                const card = document.createElement("div");
                card.className = "exam-card";
                card.dataset.subject = exam.subject;
                card.dataset.type = exam.type || "tracnghiem"; // nếu chưa có cột type thì mặc định

                card.innerHTML = `
                    <div class="exam-header"><h3>${exam.title}</h3></div>
                    <div class="exam-body">
                        <div class="exam-info"><span>Số câu:</span><span>${exam.questions}</span></div>
                        <div class="exam-info"><span>Thời gian:</span><span>${exam.time} phút</span></div>
                        <div class="exam-info"><span>Độ khó:</span><span>${exam.difficulty}</span></div>
                        <div class="exam-info"><span>Mô tả:</span><span>${exam.description || ""}</span></div>
                    </div>
                    <div class="exam-footer">
                        <button class="btn btn-primary" onclick="window.location.href='exam_page.php?id=${exam.id}'">Bắt đầu thi</button>
                    </div>
                `;
                container.appendChild(card);
            });
        });
}

function filterExams() {
    const subject = document.getElementById("subject-filter").value;
    const type = document.getElementById("type-filter").value;
    const cards = document.querySelectorAll(".exam-card");

    cards.forEach(card => {
        const matchSubject = subject === "all" || card.dataset.subject === subject;
        const matchType = type === "all" || card.dataset.type === type;
        card.style.display = matchSubject && matchType ? "block" : "none";
    });
}

document.addEventListener("DOMContentLoaded", loadExams);
