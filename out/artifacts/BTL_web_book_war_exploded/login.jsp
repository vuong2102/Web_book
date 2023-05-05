<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Login Page</title>
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="CSS/login.css">
    <link rel="stylesheet" href="CSS/index.css">
</head>
<body>
    <%@include file="includes/nav-bar.jsp"%>
    <div class="container">
        	<div class="card-header">
        		<div class="welcome">Welcome to</div>
                <div class="header-name">VATTH Book Web</div>
        	</div>
            <div class="card-body">
                <form action="user-login" method="post" class="form">
                    <div class="form-group">
                        <label>
                            <input type="email" class="input" name="login-email" placeholder="Enter Your Email" required>
                        </label>
                        <label>
                            <input type="password" class="input" name="login-password" placeholder="********" required>
                        </label>
                    </div>
                    <div class="card-submit">
                        <div class="register">
                            <a href="registration.jsp">Register now</a>
                        </div>
                        <button type="submit" class="btn-submit">Login</button>
                    </div>
                </form>
            </div>
    </div>
    <%@include file="includes/footer.jsp"%>
</body>
</html>
