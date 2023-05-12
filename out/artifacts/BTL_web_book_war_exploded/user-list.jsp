<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
    <link rel="stylesheet" href="CSS/userlist.css">
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
    <header>
        <%@include file="includes/navbar-admin.jsp"%>
    </header>
    <tbody>
        <div class="row">
            <div class="container">
                <h3 class="text-center">List Users</h3>
                <div class="container text-left">
                    <a href="<%=request.getContextPath()%>/new_user" class="btn btn-success">Add New User</a>
                </div>
                    <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                        <%
                        List<User> listUser = (List<User>) request.getAttribute("listUser");
                        for(User user: listUser){
                        %>
                        <tr>
                            <td><%=user.getId()%></td>
                            <td><%=user.getUserName()%></td>
                            <td><%=user.getPhoneNumber()%></td>
                            <td><%=user.getAddress()%></td>
                            <td><%=user.getEmail()%></td>
                            <td><%=user.getPassWord()%></td>
                            <td><%=user.getRole()%></td>
                            <td><a href="edit_user?id=<%=user.getId()%>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete_user?id=<%=user.getId()%>">Delete</a></td>
                        </tr>
                        <%
                            }
                        %>
                </table>
            </div>
        </div>
    </tbody>
    <footer>
        <%@include file="includes/footer.jsp"%>
    </footer>
</body>
</html>
