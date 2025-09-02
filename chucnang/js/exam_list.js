    const filter = document.getElementById('subjectFilter');
    filter.addEventListener('change', function() {
        const value = this.value;
        const cards = document.querySelectorAll('.exam-card');
        cards.forEach(card => {
            if (value === 'all' || card.dataset.subject === value) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    });