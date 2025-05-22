/**
 * FLIC-VYA Custom JavaScript
 */
document.addEventListener('DOMContentLoaded', function () {
    "use strict";

    // Initialize AOS
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true,
        mirror: false
    });

    // Debounce function for performance
    function debounce(func, wait = 20, immediate = true) {
        let timeout;
        return function () {
            const context = this, args = arguments;
            const later = function () {
                timeout = null;
                if (!immediate) func.apply(context, args);
            };
            const callNow = immediate && !timeout;
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
            if (callNow) func.apply(context, args);
        };
    }

    // Smooth scrolling for all hash links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();

            if (this.getAttribute('href') === '#') return;

            const targetEl = document.querySelector(this.getAttribute('href'));
            if (!targetEl) return;

            window.scrollTo({
                top: targetEl.offsetTop - 80,
                behavior: 'smooth'
            });

            // Close mobile menu if open
            const body = document.querySelector('body');
            if (body.classList.contains('mobile-nav-active')) {
                body.classList.remove('mobile-nav-active');
                const mobileNavToggle = document.querySelector('.mobile-nav-toggle');
                mobileNavToggle.classList.toggle('bi-list');
                mobileNavToggle.classList.toggle('bi-x');
            }
        });
    });

    // Mobile Navigation Toggle
    const mobileNavToggle = document.querySelector('.mobile-nav-toggle');
    const navMenu = document.querySelector('#navmenu');

    if (mobileNavToggle) {
        mobileNavToggle.addEventListener('click', function () {
            document.querySelector('body').classList.toggle('mobile-nav-active');
            this.classList.toggle('bi-list');
            this.classList.toggle('bi-x');
            navMenu.classList.toggle('active');
        });
    }

    // Active link state on scroll
    const navLinks = document.querySelectorAll('.navmenu a');

    const navlinksActive = function () {
        const position = window.scrollY + 200;
        navLinks.forEach(navlink => {
            if (!navlink.getAttribute('href').startsWith('#')) return;

            const section = document.querySelector(navlink.getAttribute('href'));
            if (!section) return;

            if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
                navLinks.forEach(link => link.classList.remove('active'));
                navlink.classList.add('active');
            }
        });
    };

    // Course Filtering System
    const filterBtns = document.querySelectorAll('.filter-btn');
    const courseItems = document.querySelectorAll('.course-item');

    if (filterBtns.length > 0) {
        filterBtns.forEach(btn => {
            btn.addEventListener('click', function () {
                // Toggle active class
                filterBtns.forEach(b => b.classList.remove('active'));
                this.classList.add('active');

                // Get filter value
                const filterValue = this.getAttribute('data-filter');

                // Filter courses
                courseItems.forEach(item => {
                    const category = item.getAttribute('data-category');

                    if (filterValue === 'all' || filterValue === category) {
                        item.style.display = 'block';
                        setTimeout(() => {
                            item.style.opacity = '1';
                        }, 100);
                    } else {
                        item.style.opacity = '0';
                        setTimeout(() => {
                            item.style.display = 'none';
                        }, 300);
                    }
                });
            });
        });
    }

    // Back to top button
    const scrollTopBtn = document.querySelector('#scroll-top');

    if (scrollTopBtn) {
        const toggleScrollTop = function () {
            if (window.scrollY > 100) {
                scrollTopBtn.classList.add('active');
            } else {
                scrollTopBtn.classList.remove('active');
            }
        };

        window.addEventListener('load', toggleScrollTop);
        document.addEventListener('scroll', debounce(toggleScrollTop));

        scrollTopBtn.addEventListener('click', function (e) {
            e.preventDefault();
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }

    // Lazy loading images
    const lazyImages = document.querySelectorAll('img[loading="lazy"]');

    if ('IntersectionObserver' in window) {
        const lazyImageObserver = new IntersectionObserver(function (entries, observer) {
            entries.forEach(function (entry) {
                if (entry.isIntersecting) {
                    const lazyImage = entry.target;
                    lazyImage.src = lazyImage.dataset.src || lazyImage.src;
                    lazyImageObserver.unobserve(lazyImage);
                }
            });
        });

        lazyImages.forEach(function (lazyImage) {
            lazyImageObserver.observe(lazyImage);
        });
    }

    // Sticky header on scroll
    const header = document.querySelector('#header');

    if (header) {
        window.addEventListener('scroll', debounce(function () {
            if (window.scrollY > 100) {
                header.classList.add('header-scrolled');
            } else {
                header.classList.remove('header-scrolled');
            }
        }));
    }

    // Animation on scroll initialization with delayed items
    document.addEventListener('scroll', debounce(navlinksActive));
    window.addEventListener('load', navlinksActive);

    // Form validation enhancement
    const forms = document.querySelectorAll('.php-email-form');

    if (forms.length > 0) {
        forms.forEach(form => {
            form.addEventListener('submit', function (e) {
                // Basic form validation can be added here if needed
                const name = this.querySelector('input[name="name"]').value;
                const email = this.querySelector('input[name="email"]').value;
                const message = this.querySelector('textarea[name="message"]').value;

                if (!name || !email || !message) {
                    e.preventDefault();
                    alert('Vui lòng điền đầy đủ thông tin trước khi gửi.');
                }
            });
        });
    }

    // Responsive image handling
    window.addEventListener('resize', debounce(function () {
        // Adjust any elements that need responsive handling
    }));

    // Initialize PureCounter for statistics
    if (typeof PureCounter !== 'undefined') {
        new PureCounter();
    }

    // Custom course carousel functionality
    const swiperElements = document.querySelectorAll('.swiper');

    if (swiperElements.length > 0 && typeof Swiper !== 'undefined') {
        swiperElements.forEach(swiperElement => {
            new Swiper(swiperElement, {
                slidesPerView: 1,
                spaceBetween: 20,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                breakpoints: {
                    640: {
                        slidesPerView: 2,
                    },
                    992: {
                        slidesPerView: 3,
                    }
                }
            });
        });
    }

    // GLightbox for image popups
    if (typeof GLightbox !== 'undefined') {
        const lightbox = GLightbox({
            selector: '.glightbox',
            touchNavigation: true,
            loop: true,
            autoplayVideos: true
        });
    }

    console.log('FLIC-VYA Custom JS Initialized');
});
