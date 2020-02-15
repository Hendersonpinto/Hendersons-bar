const elements = document.querySelectorAll('.slide');



function slideElement() {
    let bottomScreen = window.scrollY + window.innerHeight;

    elements.forEach(element => {
        let halfElement = element.offsetTop + (element.offsetHeight / 2);
        if (bottomScreen >= halfElement && window.scrollY < (element.offsetTop + element.offsetHeight)) {
            element.classList.add('active');
        } else {
            element.classList.remove('active');

        }
    })
}

window.addEventListener('scroll', slideElement)