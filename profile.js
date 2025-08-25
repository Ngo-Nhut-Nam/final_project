function loadProfileData() {
    const data = JSON.parse(localStorage.getItem('userProfile'));
    if (!data) return;
    document.getElementById('profile-email').value = data.email || '';
    document.getElementById('profile-phone').value = data.phone || '';
    document.getElementById('profile-password').value = data.password || '';
}
