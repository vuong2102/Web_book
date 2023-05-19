// Lấy đường dẫn của trang hiện tại
let currentURL = window.location.href;

// Lặp qua tất cả các liên kết trong menu và thêm lớp "nav-active" cho liên kết chứa đường dẫn của trang hiện tại
let links = document.querySelectorAll('.nav-item a');
for (let i = 0; i < links.length; i++) {
    let href = links[i].href;
    if (href.slice(0,href.indexOf('?'))  === currentURL.slice(0,currentURL.indexOf('?'))) {
        links[i].parentNode.classList.add('nav-active');
        break;
    }
}