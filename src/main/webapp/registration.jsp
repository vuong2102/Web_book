<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Register Page</title>
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="CSS/register.css">
    <link rel="stylesheet" href="CSS/index.css">
</head>
<body>
    <h3 style="color: red">${requestScope.ms}</h3>
    <div class="container">
        <div class="card-header">
            <div class="register_form">Register Form</div>

        </div>
        <div class="card-body">
            <form action="register" method="post" class="form">
                <div class="form-group">
                    <label>
                        <input type="text" class="input" name="userName" placeholder="Enter Your Full Name" required>
                    </label>
                    <label>
                        <input type="text" class="input" name="phoneNumber" placeholder="Enter Your Phone Number" required>
                    </label>
                    <label>
                        <input type="text" class="input" name="address" placeholder="Enter Your Address" required>
                    </label>
                    <label>
                        <input type="email" class="input" name="email" placeholder="Enter Your Email" required>
                    </label>
                    <label>
                        <input type="password" class="input" name="passWord" placeholder="*******" required>
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
</body>
</html>
