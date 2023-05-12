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

    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
<tbody>
<div class="container-edituser">
    <div class="card-body">
        <%
            Product product = (Product) request.getAttribute("product");
            if(product != null){
        %>
        <form action="update_book"  method="post" class="form">
                <%}else {%>
            <form action="insert_book" method="post" class="form" >
                <%}%>
                <div class="card-header">
                    <h2>
                        <% if(product != null){ %>
                        <div class="register_form">Edit Book</div>
                        <%}
                        else{ %>
                        <div class="register_form">Add New Book</div>
                        <%}%>
                    </h2>
                </div>
                <div class="form-group">
                        <% if(product != null){%>
                    <input type="hidden" name="id" value="<%= product.getId()%>" />
                    <label>Book's Name  <input type="text" value="<%=product.getName()%>" class="input" name="name" required="required"></label>
                    <label>Category <input type="text" value="<%=product.getCategory()%>" class="input" name="category"></label>
                    <label>Price <input type="text" value="<%=product.getPrice()%>" class="input" name="price"></label>
                    <label>Image <input type="text" value="<%=product.getImage()%>" class="input" name="image"></label>
                    <label>Description<input type="text" value="<%=product.getDescription()%>" class="input" name="description"></label>

                        <%}else {%>

                    <label>Book's Name  <input type="text" class="input" name="name" required="required"></label>
                    <label>Category <input type="text" class="input" name="category"></label>
                    <label>Price <input type="text" class="input" name="price"></label>
                    <label>Image <input type="text" class="input" name="image"></label>
                    <label>Description<input type="text"  class="input" name="description"></label>

                        <%}%>

                    <div class="card-submit">
                        <button type="submit" class="btn-submit">Save</button>
                    </div>
            </form>
    </div>
</div>
</tbody>
</body>
</html>
