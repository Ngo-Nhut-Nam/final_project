        let duration = 60 * 60; // 10 phút
        const timerDisplay = document.getElementById("time");

        function updateTimer() {
            const minutes = Math.floor(duration / 60);
            const seconds = duration % 60;
            timerDisplay.textContent =
                String(minutes).padStart(2, "0") + ":" + String(seconds).padStart(2, "0");

            if (duration <= 0) {
                clearInterval(countdown);
                alert("Hết giờ! Bài làm sẽ được nộp.");
                document.querySelector("form").submit();
            }
            duration--;
        }

        updateTimer();
        const countdown = setInterval(updateTimer, 1000);
