async function loadExams(subject = "all") {
    try {
        const response = await fetch(`get_exams.php?subject=${subject}`);
        const result = await response.json();

        console.log("Kết quả từ server:", result); // debug

        const examContainer = document.querySelector(".exams-grid");
        examContainer.innerHTML = "";

        if (!result.success || !result.data || result.data.length === 0) {
            examContainer.innerHTML = "<p>Không có đề thi nào.</p>";
            return;
        }

        result.data.forEach(exam => {
            examContainer.innerHTML += `
                <div class="exam-card">
                    <h3>${exam.title}</h3>
                    <p><b>Môn:</b> ${exam.subject}</p>
                    <p><b>Độ khó:</b> ${exam.difficulty}</p>
                    <p><b>Số câu hỏi:</b> ${exam.questions}</p>
                    <p><b>Mô tả:</b> ${exam.description ?? "Không có"}</p>
                    <button class="btn btn-primary" onclick="startExam(${exam.id})">
                        Bắt đầu thi
                    </button>
                </div>
            `;
        });
    } catch (error) {
        console.error("Lỗi khi load đề thi:", error);
    }
}

function startExam(examId) {
    window.location.href = `start_exam.php?exam_id=${examId}`;
}

document.addEventListener("DOMContentLoaded", () => {
    loadExams();
    document.getElementById("subject-filter").addEventListener("change", (e) => {
        loadExams(e.target.value);
    });
});
