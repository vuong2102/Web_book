<%@ page import="com.example.btl_web_book.model.User" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
        response.sendRedirect("/");
    }
%>
<%@ page import="com.example.btl_web_book.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="CSS/register.css">
    <link rel="stylesheet" href="CSS/index.css">

</head>
<body>
<%@include file="includes/nav-bar.jsp"%>

<div class="container">
    <div class="card-body">
            <%
                User user = (User) request.getAttribute("user");
                if(user != null){
            %>
                <form action="update_user"  method="post" class="form">
                    <%}else {
                %>
                    <form action="insert_user" method="post" class="form" >
                    <%}
                    %>

                    <div class="card-header">
                        <h2>
                            <%if(user != null){
                            %>
                            <div class="register_form">Edit User</div>
                            <%}else {
                            %>
                            <div class="register_form">Add New User</div>
                            <%}
                            %>
                        </h2>

                    </div>
                    <div class="form-group">
                    <% if(user != null){
                    %>

                            <input type="hidden" name="id" value="<%= user.getId()%>" />
                            <label>User Name  <input type="text" value="<%=user.getUserName()%>" class="input" name="userName" required="required"></label>
                            <label>Phone Number <input type="text" value="<%=user.getPhoneNumber()%>" class="input" name="phoneNumber"></label>
                            <label>Address <input type="text" value="<%=user.getAddress()%>" class="input" name="address"></label>
                            <label>User Email<input type="text" value="<%=user.getEmail()%>" class="input" name="email"></label>
                            <label>Password <input type="password" value="<%=user.getPassWord()%>" class="input" name="passWord"></label>
                            <label>Role <input type="text" value="<%=user.getRole()%>" class="input" name="role"></label>

                    <%}else {
                    %>
                        <label>User Name <input type="text" class="input" name="userName" required="required"></label>
                        <label>Phone Number <input type="text" class="input" name="phoneNumber"></label>
                        <label>Address <input type="text" class="input" name="address"></label>
                        <label>User Email<input type="text" class="input" name="email"></label>
                        <label>Password <input type="password" class="input" name="passWord"></label>
                        <label>Role <input type="text" class="input" name="role"></label>
                    <%
                        }
                    %>
                    <div class="card-submit">
                        <button type="submit" class="btn-submit">Save</button>
                    </div>

                </form>
                </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>