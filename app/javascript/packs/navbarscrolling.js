const navbar = document.querySelector('.navbar-home');
const banner = document.querySelector('.banner');

function changeColor() {
    let topScreen = window.scrollY;
    if (topScreen >= (banner.offsetHeight - navbar.offsetHeight)) {
        navbar.classList.add('noBanner');
    } else {
        navbar.classList.remove('noBanner')
    }
}


window.addEventListener('scroll', changeColor)