<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
        response.sendRedirect("index.jsp");
    }
    List<Cart> cartArrayList = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cartArrayList != null){
        request.setAttribute("cartArrayList", cartArrayList);
    }
%>
<html>
<head>
    <title>Shopping Register Page</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="CSS/register.css">
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

</head>
<body>
<%--<%@include file="includes/navBar.jsp"%>--%>
    <div class="container">
        <div class="card-header">
            <div class="register_form">Register Form</div>

        </div>
        <div class="card-body">
            <form action="register" method="post" class="form">
                <div class="form-group">
                    <label>
                        <input type="text" class="input" name="userName" placeholder="Nhập tên:" required>
                    </label>
                    <label>
                        <input id="phone" type="text" class="input" name="phoneNumber" placeholder="Nhập SĐT:" required>
                    </label>
                    <label>
                        <input type="text" class="input" name="address" placeholder="Nhập địa chỉ:" required>
                    </label>
                    <label>
                        <input id="email" type="email" class="input" name="email" placeholder="Nhập email:" required>
                        <p style="color: red">${requestScope.message}</p>
                    </label>
                    <label>
                        <input type="password" class="input" name="passWord" placeholder="Nhập mật khẩu:" required>
                    </label>
                </div>
                <div class="card-submit">
                    <button type="submit" class="btn-submit" onclick="checkEmail()">Register</button>
                    <div class ="login">
                        <a href="login.jsp">Login now</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="JS/check_mail_sdt.js"></script>
<%--<%@include file="includes/footer.jsp"%>--%>
</body>
</html>
