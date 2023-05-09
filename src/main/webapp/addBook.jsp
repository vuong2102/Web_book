<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
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
    <title>Title</title>
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/cart.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="CSS/manageBook.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
<%--  <%@include file="includes/navbar-admin.jsp"%>--%>
<div class="container">
    <div class="card-body">
        <form action="insert_book"  method="post" class="form">
            <div class="form-group">
                <label>Name<input type="text" class="input" name="Name" required="required"></label>
                <label>Category<input type="text" class="input" name="Category"></label>
                <label>Price<input type="text" class="input" name="Price"></label>
                <label>Image<input type="text" class="input" name="Image"></label>
                <label>Description<input type="text" class="input" name="Description"></label>
                <div class="card-submit">
                    <button type="submit" class="btn-submit">Save</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%--  <%@include file="includes/footer.jsp"%>--%>
</body>
</html>
