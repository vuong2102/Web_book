<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.btl_web_book.dao.OrderDao" %>
<%@ page import="com.example.btl_web_book.model.Order" %>
<%@ page import="com.example.btl_web_book.dao.ManageBooksDao" %>
<%@ page import="com.example.btl_web_book.dao.ManageWareHouseDao" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("authAdmin");
    if(auth!= null){
        request.setAttribute("authAdmin", auth);
    }
    ManageBooksDao pd = null;
    OrderDao od = null;
    ManageWareHouseDao wareHouseDao = null;
    try {
        pd = new ManageBooksDao(JDBCConnect.getConnection());
        od = new OrderDao(JDBCConnect.getConnection());
        wareHouseDao = new ManageWareHouseDao(JDBCConnect.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
    int currentPage = Integer.parseInt(request.getParameter("index"));
    int totalPage = (Integer) request.getAttribute("totalPage");

    request.setAttribute("currentPage", currentPage);
    List<Order> orders = od.getAllOrders();
    List<Product> listProductAll = pd.selectAllProducts();
    int soSachTrongKho = 0;
    int soSachDaBan = 0;
    for(Product p : listProductAll) soSachTrongKho += p.getQuantityInStore();
    for(Order p : orders) soSachDaBan += p.getQuantity();

%>

<html>
<head>
    <title>Quản lí sản phẩm</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/navbar-admin.css">
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
            <div class="tk-content">Số đầu sách: <%=listProductAll.size()%></div>
        </div>
    </div>
    <div class="container-managerbook">
        <div class="container-ct">
            <div>
                <a href="new_book" class="btn btn-success">Thêm sách mới</a>
            </div>
            <div class="table-item">
                <ul class="table-head">
                    <li class="table-col">Tên sách</li>
                    <li class="table-col">Hình ảnh</li>
                    <li class="table-col">Giá</li>
                    <li class="table-col">Số lượng đã bán</li>
                    <li class="table-col">Số lượng trong kho</li>
                    <li class="table-col">Sửa/Xóa</li>
                </ul>
                <div class="list_items">
                    <%
                        if (!listProduct.isEmpty()) {
                            for (Product p : listProduct) {
                            int soLuongDaBanCuaMotSanPham = od.demSoLuongSachDaBanCuaMotSanPham(p.getId());
                            %>
                            <ul class="item-ct">
                                <li class="table-content"><%= p.getName()%></li>
                                <li class="table-content">
                                    <img class="img__product" src="product-images/<%= p.getImage()%>" alt="ảnh">
                                </li>
                                <li class="table-content"><%= p.getPrice()%></li>
                                <li class="table-content"><%= wareHouseDao.laySoLuongDaBanCuaMotSanPham(p.getId())%></li>
                                <li class="table-content">
                                    <form action="order-now" method="post" class="form-inline">
                                        <input type="hidden" name="id" value="" class="form-input">
                                        <h5><%=wareHouseDao.laySoLuongTonKhoCuaMotSanPham(p.getId())%></h5>
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

<%--            Phân trang--%>
            <div class="pagination">
                <%
                    int size = currentPage + 6;
                    if(size > totalPage) size = totalPage;
                    if(currentPage > 1) {%>
                <li class="previous"><a href="manage-book?index=<%=currentPage-1%>"><i class="fas fa-arrow-left"></i></a></li>
                <%}%>
                <%
                    for(int i = currentPage; i <= size; i++){ %>
                <li class="number-page"><a href="manage-book?index=<%=i%>"><%=i%></a></li>
                <%}
                    if(currentPage < size){%>
                <li><a href="manage-book?index=<%=currentPage+1%>"><i class="fas fa-arrow-right"></i></a></li>
                <%}
                %>
            </div>
        </div>
        <script src="JS/pagination.js"></script>
        <script src="./JS/showAddProduct.js"></script>
    </div>
<script src="JS/navbar-adimin.js"></script>
<%--<%@include file="/includes/footer.jsp"%>--%>
</body>
</html>