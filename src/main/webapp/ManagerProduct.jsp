<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.dao.ProductDao" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
    }

    ProductDao pd = null;
    try {
        pd = new ProductDao(JDBCConnect.getConnection());
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    List<Product> products = pd.getAllProducts();
%>

<html>
<head>
    <title>Quản lí sản phẩm</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/cart.css">
    <link rel="stylesheet" href="CSS/MngProduct.css">
</head>
<body>
<%@include file="includes/nav-bar.jsp"%>
<div class="container">
    <div class="content-cart">
        <div class="nav-cart"><h2 class=""></h2></div>
        <div class="nav-cart btn-checkout">
            <a id="addNew" class="btn btn-primary" onclick="showModal()">Add new product</a>
        </div>
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
                <li class="table-content">
                    <form action="order-now" method="post" class="form-inline">
                        <input type="hidden" name="id" value="" class="form-input">
                        <div class="form-group">
                            <a href="quantity-inc-dec?action=inc&id=<%=p.getId()%>" class="btn-incre"><i class="fas">+</i></a>
                            <label>
                                <input class="form-control" type="text" name="quantity" value="" readonly>
                            </label>
                            <a href="quantity-inc-dec?action=decree&id=<%=p.getId()%>" class="btn-decree"><i class="fas">-</i></a>
                            <button type="submit" class="table-action btn btn-buy">Buy</button>
                        </div>
                    </form>
                </li>
                <ul class="table-content" style="display: flex; justify-content: space-around">
                    <li class="table-action"><a class="btn-remove" href="delete?pid=<%=p.getId()%>">Remove</a></li>
                </ul>
            </ul>
            <%}
            }%>
        </div>
    </div>
    <%--        form add product--%>
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="add" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Product</h4>
<%--                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Name</label>
                            <input name="name" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input name="image" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input name="price" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Title</label>
                            <textarea name="title" class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea name="description" class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <textarea name="category" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="./JS/showAddProduct.js"></script>
</div>

<%@include file="/includes/footer.jsp"%>
</body>
</html>
