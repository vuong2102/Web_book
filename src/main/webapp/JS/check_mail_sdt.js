function checkEmail() {
    var email = document.getElementById('email');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    let phone = document.getElementById("phone").value;
    let phonenoa = /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/;
    if (!filter.test(email.value)) {
        alert('Hay nhap dia chi email hop le.\nExample@gmail.com');
        email.focus;
        return false;
    }
    else if(!phone.match(phonenoa)) {
        return false;
        alert("Bạn hãy nhập đúng số điện thoại để đăng kí!");
        phone.focus();
    }
}

