<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.btl_web_book.dao.OrderDao" %>
<%@ page import="com.example.btl_web_book.model.Order" %>
<%@ page import="com.example.btl_web_book.dao.ManageUsersDAO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("authAdmin");
    if(auth!= null){
        request.setAttribute("authAdmin", auth);
    }
    ManageUsersDAO manageUsersDAO  = null;
    OrderDao orderDao  = null;
    try {
        orderDao = new OrderDao(JDBCConnect.getConnection());
        manageUsersDAO = new ManageUsersDAO(JDBCConnect.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    List<Order> orders = null;
    try {
        int index = Integer.parseInt(request.getParameter("index"));
        orders = orderDao.selectPaginationOrders(index);
    } catch (SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
    double doanhThu = 0;
    int soSanPhamDaBan = 0;
    int soLuotMua = 0;
    for(Order o :orders) {
        doanhThu += o.getPrice();
        soSanPhamDaBan += o.getQuantity();
        soLuotMua += 1;
    }
%>

<html>
<head>
    <title>Quản lí đơn hàng</title>
    <link rel="stylesheet" href="CSS/manageOrder.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
    <%@include file="includes/navbar-admin.jsp"%>

    <div class="table-analyse">
        <div>Lượt mua <%=soLuotMua%></div>
        <div>Số đã bán <%=soSanPhamDaBan%></div>
        <div>Doanh thu $<%=doanhThu%></div>
    </div>
    <div class="table-cart">
        <div class="table-head">
            <div class="table-col">Tình trạng vận chuyển</div>
            <div class="table-col">Ảnh</div>
            <div class="table-col">Mã đơn</div>
            <div class="table-col">Ngày đặt hàng</div>
            <div class="table-col">Tên sách</div>
            <div class="table-col">Số lượng</div>
            <div class="table-col">Giá thành</div>
            <div class="table-col">Khách hàng</div>
            <div class="table-col">Thông tin khách hàng</div>
        </div>
        <div class="table-content">
            <%
                if(orders != null){
                    for(Order o : orders) {
                        doanhThu += o.getPrice();
                        soSanPhamDaBan += o.getQuantity();
                        soLuotMua += 1;
                        User user = manageUsersDAO.selectUser(o.getUserId());%>
                        <ul class="table-content-col">
                                <li class="table-col2">Delivered</li>
                            <li class="table-col2"><img class="card-img-top" src="product-images/<%=o.getImage()%>"
                                     alt="Card image cap"></li>
                            <li class="table-col2">OB000<%=o.getOrderId()%></li>
                            <li class="table-col2"><%=o.getDate()%></li>
                            <li class="table-col2"><%=o.getName()%></li>
                            <li class="table-col2"><%=o.getQuantity()%></li>
                            <li class="table-col2">$<%=dcf.format(o.getPrice())%></li>
                            <li class="table-col2"><%=user.getUserName()%></li>
                            <li class="table-col2"><%=user.getAddress()%></li>
                            <li class="table-col2"><a class="btn btn-sm btn-danger" href="cancel-order?id=
                        <%=o.getOrderId()%>">Cancel Order</a></li>
                        </ul>
            <%}
            } else { %>
                <h2 class="tieude">Không có sản phẩm</h2>
            <%}%>

        </div>
        <div>
<%--            <% --%>
<%--                int currentPage = Integer.parseInt(request.getParameter("index"));--%>
<%--                int size = orders.size() / 15;--%>
<%--                if (orders.size() % 15 != 0) size++;--%>
<%--                for(int i = 1; i <= size; i++){ %>--%>
<%--                    <a href="manage-order?index=<%=i%>"><%=i%> </a>--%>
<%--            <%}%>--%>
            <%
                int currentPage = Integer.parseInt(request.getParameter("index"));
                int size = currentPage + 6;
                int sizePage = orders.size()/15;
                if(orders.size() % 15 != 0) sizePage++;
                if(size > sizePage) size = sizePage;
                if(currentPage > 1){ %>
                    <li><a href="manage-order?index=<%=currentPage-1%>">Previous</a></li>
                <%}%>
                <c:forEach begin="<%=currentPage%>" end="<%=size+1%>" var="i">
                    <a href="manage-order?index=${i}">${i} </a>
                </c:forEach>
                <%
                    int endP = Integer.parseInt(request.getAttribute("endP").toString());
                    if(currentPage < endP){%>
                    <li><a href="manage-order?index=<%=currentPage+1%>">Next</a></li>
                <%}
            %>
        </div>

    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
