<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.dao.ProductDao" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.btl_web_book.dao.OrderDao" %>
<%@ page import="com.example.btl_web_book.model.Order" %>
<%@ page import="com.example.btl_web_book.dao.ManageBooksDao" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("authAdmin");
    if(auth!= null){
        request.setAttribute("authAdmin", auth);
    }
    ManageBooksDao pd = null;
    OrderDao od = null;
    try {
        pd = new ManageBooksDao(JDBCConnect.getConnection());
        od = new OrderDao(JDBCConnect.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    List<Product> products = (List<Product>) request.getAttribute("listProduct");

    List<Order> orders = od.getAllOrders();
    int soSachTrongKho = 0;
    int soSachDaBan = 0;
    for(Product p : products){
        soSachTrongKho += p.getQuantityInStore();
    }
    for(Order p : orders){
        soSachDaBan += p.getQuantity();
    }
%>

<html>
<head>
    <title>Quản lí sản phẩm</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/navbar-admin.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="CSS/manageBook.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
<%@include file="includes/navbar-admin.jsp"%>
<div class="container-tk">
    <div class="thong-ke">
        <h4 class="title">Thống kê</h4>
        <div class="tk-content">Số sách trong kho: <%=soSachTrongKho%></div>
        <div class="tk-content">Số sách đã bán: <%=soSachDaBan%></div>
        <div class="tk-content">Số đầu sách: <%=products.size()%></div>
    </div>
</div>
<div class="container-managerbook">
    <div class="container-ct">
        <div>
            <a href="<%=request.getContextPath()%>/new_book" class="btn btn-success">Thêm sách mới</a>
        </div>
        <div class="table-item">
            <ul class="table-head">
                <li class="table-col">Tên sách</li>
                <li class="table-col">Hình ảnh</li>
                <li class="table-col">Giá</li>
                <li class="table-col">Số lượng</li>
                <li class="table-col">Sửa/Xóa</li>
            </ul>
            <div class="list_items">
                <%
                    if (!products.isEmpty()) {
                        for (Product p : products) { %>
                <ul class="item-ct">
                    <li class="table-content"><%= p.getName()%></li>
                    <li class="table-content">
                        <img class="img__product" src="product-images/<%= p.getImage()%>" alt="ảnh">
                    </li>
                    <li class="table-content"><%= p.getPrice()%></li>
                    <li class="table-content">
                        <form action="order-now" method="post" class="form-inline">
                            <input type="hidden" name="id" value="" class="form-input">
                            <h5><%=p.getQuantityInStore()%></h5>
                        </form>
                    </li>
                    <ul class="table-content" style="display: flex; justify-content: space-around">
                        <li class="table-action"><a href="edit_book?id=<%=p.getId()%>"><i class="fas fa-edit"></i></a> </li>
                        <li class="table-action"><a class="btn-remove" href="delete_book?id=<%=p.getId()%>"><i class="fas fa-trash-alt"></i></a></li>
                    </ul>
                </ul>
                <%}
                }%>
            </div>
            <div class="nav-cart btn-checkout">
                <a id="addNew" class="btn btn-primary" href="new_book">Thêm sản phẩm mới</a>
            </div>
        </div>
    </div>
    <%--        form add product  onclick="showModal()" --%>
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="insert_book" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Thêm sản phẩm mới</h4>
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

<%--<%@include file="/includes/footer.jsp"%>--%>
</body>
</html>
