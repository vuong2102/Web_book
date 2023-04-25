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
        	<div>
        		<h3 class="card-header">User Login</h3>
        	</div>
            <div class="card-body">
                <form action="user-login" method="post" class="form">
                    <div class="form-group">
                        <div class="text__label">Email Address</div>
                        <label>
                            <input type="email" class="input form-control" name="login-email" placeholder="Enter Your Email" required>
                        </label>
                    </div>
                    <div class="form-group">
                        <div class="text__label">Password</div>
                        <label>
                            <input type="password" class="input form-control" name="login-password" placeholder="********" required>
                        </label>
                    </div>
                    <div>
                        <a href="#">Register now</a>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>
            </div>
    </div>
</body>
</html>
