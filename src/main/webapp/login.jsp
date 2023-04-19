<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div id="container">
        <div class="card">
            <h3 class="card-header">User Login</h3>
            <div class="card-body">
                <form action="user-login" method="post" class="form">
                    <div class="form-group">
                        <div>Email Address</div>
                        <label>
                            <input type="email" class="input form-control" name="login-email" placeholder="Enter Your Email" required>
                        </label>
                    </div>
                    <div class="form-group">
                        <div>Password</div>
                        <label>
                            <input type="password" class="input form-control" name="login-password" placeholder="********" required>
                        </label>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
