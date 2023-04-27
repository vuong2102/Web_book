<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.btl_web_book.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.dao.OrderDao" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("person", auth);
        OrderDao orderDao  = null;
        try {
            orderDao = new OrderDao(JDBCConnect.getConnection());
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        orders = orderDao.userOrders(auth.getId());
    }else{
        response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>

<html>
<head>
    <title>Title</title>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/cart.css">
</head>
<body>
    <%@include file="includes/nav-bar.jsp"%>
    <div class="container">
        <div class="card-header my-3">All Orders</div>
        <div class="table-cart">
            <div>
                <ul class="table-head">
                    <li class="table-col">Date</li>
                    <li class="table-col">Name</li>
                    <li class="table-col">Category</li>
                    <li class="table-col">Quantity</li>
                    <li class="table-col">Price</li>
                    <li class="table-col">Cancel</li>
                </ul>
            </div>
            <div>
                <%
                    if(orders != null){
                        for(Order o:orders){%>
                    <ul>
                        <li class="table-content"><%=o.getDate() %></li>
                        <li class="table-content"><%=o.getName() %></li>
                        <li class="table-content"><%=o.getCategory() %></li>
                        <li class="table-content"><%=o.getQuantity() %></li>
                        <li class="table-content"><%=dcf.format(o.getPrice()) %></li>
                        <li class="table-content"><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></li>
                    </ul>
                <%}
                }
                %>
            </div>
        </div>
    </div>
    <%@include file="/includes/footer.jsp"%>
</body>
</html>
