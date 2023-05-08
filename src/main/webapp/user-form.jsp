<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
    <body>
    <%@include file="includes/nav-bar-admin.jsp"%>
    <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">

                    <%
                        User user = (User) request.getAttribute("user");
                        if(user != null){
                    %>
                    <form action="update_user" method="post">
                            <%}else {
                        %>
                        <form action="insert_user" method="post">
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
                                <label>Address</label> <label>
                                <input type="text" class="form-control" name="address">
                            </label>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>User Email</label> <label>
                                <input type="text" class="form-control" name="email">
                            </label>
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