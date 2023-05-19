// Open menu(mobile)
function toggleMenu() {
    var menu = document.querySelector('.nav-menu');

    if (menu.classList.contains('open')) {
        menu.classList.remove('open');
        document.body.style.overflow = 'auto';
    } else {
        menu.classList.add('open');
        document.body.style.overflow = 'hidden';
    }
}
document.addEventListener("click", closeMenu);
document.addEventListener("touchstart", closeMenu);

function closeMenu(e) {
    if (!e.target.closest('.nav-menu') && !e.target.closest('.icon-menu')) {
        var menu = document.querySelector('.nav-menu');
        menu.classList.remove('open');
        document.body.style.overflow = 'auto';
    }
}




