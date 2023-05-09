<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.dao.ProductDao" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("authAdmin");
    if(auth!= null){
        request.setAttribute("authAdmin", auth);
    }
    ProductDao pd = null;
    try {
        pd = new ProductDao(JDBCConnect.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    List<Product> products = pd.getAllProducts();
%>

<html>
<head>
    <title>Quản lí sản phẩm</title>
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/cart.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="CSS/manageBook.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
<%@include file="includes/navbar-admin.jsp"%>
    <div class="container">
    <div class="content-cart">
        <div class="nav-cart"><h2 class=""></h2></div>
<%--        <div class="nav-cart btn-checkout">--%>
<%--            <a id="addNew" class="btn btn-primary" onclick="showModal()">Add new product</a>--%>
<%--        </div>--%>
    </div>
    <div class="table-cart">
        <div>
            <ul class="table-head">
                <li class="table-col">Name</li>
                <li class="table-col">Image</li>
                <li class="table-col">Price</li>
                <li class="table-col">Quantity</li>
                <li class="table-col">Action</li>
            </ul>
        </div>
        <div class="list_items">
            <%
            if (!products.isEmpty()) {
                for (Product p : products) { %>
                <ul>
                    <li class="table-content"><%= p.getName()%></li>
                    <li class="table-content">
                        <img src="product-images/<%= p.getImage()%>" alt="ảnh">
                    </li>
                    <li class="table-content"><%= p.getPrice()%></li>
                    <li class="table-content">100</li>
                    <ul class="table-content" style="display: flex; justify-content: space-around">
                        <li class="table-action"><a class="btn btn-edit" href="edit_book?id=<%=p.getId()%>">Edit</a></li>
                        <li class="table-action"><a class="btn-remove" href="delete_book?id=<%=p.getId()%>">Remove</a></li>
                    </ul>
                </ul>
            <%}
            }%>
        </div>
    </div>
        <div class="nav-cart btn-checkout">
            <li><a id="addNew" class="btn btn-primary" href="addBook.jsp">Add new product</a></li>
        </div>
<%--        onclick="showModal()"--%>
    <%--        form add product--%>
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="insert_book" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Product</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Name</label>
                            <label>
                                <input name="name" type="text" class="form-control" required>
                            </label>
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <label>
                                <textarea name="category" class="form-control" required></textarea>
                            </label>
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <label>
                                <input name="price" type="text" class="form-control" required>
                            </label>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <label>
                                <input name="image" type="text" class="form-control" required>
                            </label>
                        </div>

                        <div class="form-group">
                            <label>Description</label>
                            <label>
                                <textarea name="description" class="form-control" required></textarea>
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" id = "hide-modal" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
    <script src="./JS/showAddProduct.js"></script>
    <%@include file="/includes/footer.jsp"%>
</body>
</html>