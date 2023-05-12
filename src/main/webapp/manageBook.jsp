<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page import="java.util.List" %>
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
    <title>Quản lí sản phẩm</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/cart.css">
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="CSS/manageBook.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
<tbody>
<div class="row">
    <div class="container">
        <h3 class="text-center">List Book</h3>
        <div class="container text-left">
            <a href="<%=request.getContextPath()%>/new_book" class="btn btn-success">Add New Book</a>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Image</th>
                <th>Descrition</th>
                <th>Actions</th>
            </tr>
            </thead>
            <%
                List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
                for(Product product: listProduct){
            %>
            <tr>
                <td><%=product.getId()%></td>
                <td><%=product.getName()%></td>
                <td><%=product.getCategory()%></td>
                <td><%=product.getPrice()%></td>
                <td><img src="product-images/<%=product.getImage()%>" style="width: 100%; height: 100px" alt="not remember"></td>
                <td><%=product.getDescription()%></td>

                <td><a href="edit_book?id=<%=product.getId()%>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete_book?id=<%=product.getId()%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>
</tbody>

</body>
</html>
