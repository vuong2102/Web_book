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
</head>
<body>
    <%@include file="includes/nav-bar.jsp"%>
    <div class="container">
        <div class="card-header my-3">All Orders</div>
        <table class="table table-light">
            <thead>
            <tr>
                <th scope="col">Date</th>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Cancel</th>
            </tr>
            </thead>
            <tbody>

            <%
                if(orders != null){
                    for(Order o:orders){%>
                <tr>
                    <td><%=o.getDate() %></td>
                    <td><%=o.getName() %></td>
                    <td><%=o.getCategory() %></td>
                    <td><%=o.getQuantity() %></td>
                    <td><%=dcf.format(o.getPrice()) %></td>
                    <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
                </tr>
            <%}
            }
            %>

            </tbody>
        </table>
    </div>
</body>
</html>
