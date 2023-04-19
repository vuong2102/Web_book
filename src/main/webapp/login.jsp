
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Login Page</title>
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="CSS/login.css">
</head>
<body>
    <div id="container">
        <div class="card">
            <h3 class="card-header">User Login</h3>
            <div class="card-body">
                <form action="" method="post" class="form">
                    <div class="form-group">
                        <div>Email Address</div>
                        <div>
                            <input class="input" type="email" class="form-control" name="login-email" placeholder="Enter Your Email" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div>Password</div>
                        <div>
                            <input class="input" type="password" class="form-control" name="login-password" placeholder="Enter Your Password" required>
                        </div>
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
