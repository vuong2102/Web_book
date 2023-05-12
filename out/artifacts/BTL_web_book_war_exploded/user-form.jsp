
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("authAdmin");
    if(auth!= null){
        request.setAttribute("authAdmin", auth);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="CSS/register.css">
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
    <%@include file="includes/navbar-admin.jsp"%>
    <tbody>
        <div class="container-edituser">
            <div class="card-body">
                <%
                    User user = (User) request.getAttribute("user");
                    if(user != null){
                %>
                <form action="update_user"  method="post" class="form">
                        <%}else {%>
                    <form action="insert_user" method="post" class="form" >
                        <%}%>
                        <div class="card-header">
                            <h2>
                                <% if(user != null){ %>
                                <div class="register_form">Edit User</div>
                                <%}
                                else{ %>
                                <div class="register_form">Add New User</div>
                                <%}%>
                            </h2>
                        </div>
                        <div class="form-group">
                                <% if(user != null){%>
                            <input type="hidden" name="id" value="<%= user.getId()%>" />
                            <label>User Name  <input type="text" value="<%=user.getUserName()%>" class="input" name="userName" required="required"></label>
                            <label>Phone Number <input type="text" value="<%=user.getPhoneNumber()%>" class="input" name="phoneNumber"></label>
                            <label>Address <input type="text" value="<%=user.getAddress()%>" class="input" name="address"></label>
                            <label>User Email<input type="text" value="<%=user.getEmail()%>" class="input" name="email"></label>
                            <label>Password <input type="password" value="<%=user.getPassWord()%>" class="input" name="passWord"></label>
                            <label>Role <input type="text" value="<%=user.getRole()%>" class="input" name="role"></label>

                                <%}else {%>

                            <label>User Name <input type="text" class="input" name="userName" required="required"></label>
                            <label>Phone Number <input type="text" class="input" name="phoneNumber" required="required"></label>
                            <label>Address <input type="text" class="input" name="address" required="required"></label>
                            <label>User Email<input type="email" class="input" name="email" required="required"></label>
                            <label>Password <input type="password" class="input" name="passWord" required="required"></label>
                            <label>Role <input type="text" class="input" name="role" required="required"></label>
                                    <%}%>

                            <div class="card-submit">
                                <button type="submit" class="btn-submit">Save</button>
                            </div>
                    </form>
            </div>
        </div>
    </tbody>
    <footer>
        <%@include file="includes/footer.jsp"%>
    </footer>

    </body>
</html>