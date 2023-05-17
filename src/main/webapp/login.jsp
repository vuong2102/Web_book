<%@ page import="com.example.btl_web_book.model.User" %>
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
  <link rel="stylesheet" href="CSS/login.css">
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
</head>
<body>
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
</body>
</html>
