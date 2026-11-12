// Charger le thème sauvegardé au démarrage
const savedTheme = localStorage.getItem('theme') || 'clair';
document.documentElement.setAttribute('data-theme', savedTheme);
document.getElementById('themeSelect').value = savedTheme;

function changeTheme(theme) {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem('theme', theme);
}

// Détecter la préférence système au premier chargement
if (!localStorage.getItem('theme')) {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    if (prefersDark) {
        changeTheme('sombre');
    }
}