/**************************************************** Navbar blur on scroll  ***********************************/
window.addEventListener("scroll", function () {
	
    const navbar = document.querySelector(".custom-navbar");

    if (window.scrollY > 50) {
        navbar.classList.add("scrolled");
    } else {
        navbar.classList.remove("scrolled");
    }

});

/**************************************************** Active menu highlight  ***********************************/
const sections = document.querySelectorAll("section");
const navLinks = document.querySelectorAll(".navbar-nav .nav-link");

window.addEventListener("scroll", () => {

    let current = "";

    sections.forEach(section => {
        const sectionTop = section.offsetTop - 120;
        const sectionHeight = section.offsetHeight;

        if (window.scrollY >= sectionTop) {
            current = section.getAttribute("id");
        }

    });

    navLinks.forEach(link => {
		
        link.classList.remove("active");
		
        if(link.getAttribute("href") === "#" + current){
            link.classList.add("active");
        }

    });

});


/**************************************************** Auto-close mobile menu ***********************************/
$(document).ready(function () {

    $('.navbar-nav .nav-link').click(function () {
        $('.navbar-collapse').collapse('hide');
    });

});