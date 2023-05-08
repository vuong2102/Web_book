
<%@ page import="com.example.btl_web_book.model.User" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
        response.sendRedirect("index.jsp");
    }
%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Shopping Register Page</title>
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="CSS/register.css">
    <link rel="stylesheet" href="CSS/index.css">
</head>
<body>
<%@include file="includes/nav-bar.jsp"%>

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
                        <input type="text" class="input" name="phoneNumber" placeholder="Nhập SĐT:" required>
                    </label>
                    <label>
                        <input type="text" class="input" name="address" placeholder="Nhập địa chỉ:" required>
                    </label>
                    <label>
                        <input type="email" class="input" name="email" placeholder="Nhập email:" required>
                    </label>
                    <label>
                        <input type="password" class="input" name="passWord" placeholder="Nhập mật khẩu:" required>
                    </label>


                </div>
                <div class="card-submit">
                    <button type="submit" class="btn-submit">Register</button>
                    <div class ="login">
                        <a href="login.jsp">Login now</a>
                    </div>

                </div>
            </form>
        </div>
    </div>
<%@include file="includes/footer.jsp"%>
</body>
</html>
