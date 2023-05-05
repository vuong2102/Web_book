<%@ page import="com.example.btl_web_book.model.User" %><%--
  Created by IntelliJ IDEA.
  User: DUCTRONG
  Date: 4/30/2023
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management Application</title>

</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #577D86">
        <div>
            <a class="navbar-brand"> User Management App </a>
        </div>
        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Users</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">

            <%
                User user = (User) request.getAttribute("user");
                if(user != null){
            %>
            <form action="update" method="post">
                    <%}else {
                %>
                <form action="insert" method="post">
                    <%}
                    %>

                    <caption>
                        <h2>
                            <%if(user != null){
                            %>
                            Edit User
                            <%}else {
                            %>
                            Add New User
                            <%}
                            %>
                        </h2>
                    </caption>

                    <% if(user != null){
                    %>
                    <input type="hidden" name="id" value="<%= user.getId()%>" />

                    <fieldset class="form-group">
                        <label>User Name</label> <input type="text" value="<%=user.getUserName()%>" class="form-control" name="userName" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Phone Number</label> <input type="text" value="<%=user.getPhoneNumber()%>" class="form-control" name="phoneNumber">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Address</label> <input type="text" value="<%=user.getAddress()%>" class="form-control" name="address">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>User Email</label> <input type="text" value="<%=user.getEmail()%>" class="form-control" name="email">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Password</label> <input type="password" value="<%=user.getPassWord()%>" class="form-control" name="passWord">
                    </fieldset>S
                    <fieldset class="form-group">
                        <label>Role</label> <input type="text" value="<%=user.getRole()%>" class="form-control" name="role">
                    </fieldset>
                    <%}else {
                    %>
                    <fieldset class="form-group">
                        <label>User Name</label> <input type="text" class="form-control" name="userName" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Phone Number</label> <input type="text" class="form-control" name="phoneNumber">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Address</label> <input type="text" class="form-control" name="address">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>User Email</label> <input type="text" class="form-control" name="email">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Password</label> <input type="password" class="form-control" name="passWord">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Role</label> <input type="text" class="form-control" name="role">
                    </fieldset>
                    <%
                        }
                    %>
                    <button type="submit" class="btn btn-success">Save</button>
                </form>
        </div>
    </div>
</div>
</body>
</html>