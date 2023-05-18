
var currentPage = new URLSearchParams(window.location.search).get("index");
var pageButtons = document.querySelectorAll(".pagination a");
pageButtons.forEach(function(button) {
    if (button.textContent.trim() === currentPage) {
        button.style.background = "#f97d00";
        button.style.color = "#ffffff";
    }
});