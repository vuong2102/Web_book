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

    OrderDao orderDao  = null;
    try {
        orderDao = new OrderDao(JDBCConnect.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    if (auth != null) {
        request.setAttribute("person", auth);
        orders = orderDao.userOrders(auth.getId());
    }else{
        response.sendRedirect("login.jsp");
    }
    double totalPrice = 0;
    if(orders != null){
        for(Order o : orders){
            totalPrice += o.getPrice();
        }
    }
    request.setAttribute("totalPrice", totalPrice);
%>

<html>
<head>
    <title>Title</title>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/orders.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <%@include file="includes/nav-bar.jsp"%>
    <h2 class="card-header my-3">All Orders</h2>
    <div class="container">
        <div class="table-cart">
            <div>
                <ul class="table-head">
                    <li class="table-col">Date</li>
                    <li class="table-col">Name</li>
                    <li class="table-col">Category</li>
                    <li class="table-col table-col-small">Quantity</li>
                    <li class="table-col table-col-small">Price</li>
                    <li class="table-col">Cancel</li>
                </ul>
            </div>
            <div class="list_items">
                <%
                    if(orders != null){
                        for(Order o:orders){%>
                    <ul>
                        <li class="table-content"><%=o.getDate() %></li>
                        <li class="table-content"><%=o.getName() %></li>
                        <li class="table-content"><%=o.getCategory() %></li>
                        <li class="table-content table-col-small"><%=o.getQuantity() %></li>
                        <li class="table-content table-col-small"><%=dcf.format(o.getPrice()) %></li>
                        <li class="table-content"><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></li>
                    </ul>
                <%}
                }
                %>
            </div>
        </div>
        <div class="table-cart-right">
            <ul class="right-col">
                <li class="m-10 right-col1">Giao tới</li>
                <li class="m-10 right-col1"><a href="#">Thay đổi</a></li>
            </ul>
            <ul>
                <li class="m-10 right-col2">${sessionScope.auth.userName}    |    ${sessionScope.auth.phoneNumber}</li>
            </ul>
            <ul>
                <li class="right-col3">Địa chỉ: ${sessionScope.auth.address}</li>
            </ul>
            <ul class="right-row4">
                <li class="right-col41"><h3 class="">Total Price: </h3></li>
                <li class="right-col42"><h3 class="">$ ${(totalPrice>0)?dcf.format(totalPrice):0}</h3></li>
            </ul>
            <ul class="btn-right"><button type="submit" class="btn-buy js-buy">Mua hàng</button></ul>
        </div>
    </div>
    <div class="modal js-modal">
        <div class="modal-container">
            <div class="modal-close"><i class="fa-solid fa-circle-xmark js-modal-close"></i></div>
            <div class="modal-sucess"><i class="fa-solid fa-circle-check fa-beat" style="color: #036937;"></i></div>
            <div>
                <h2 class="tieude">Đặt hàng thành công</h2>
                <p>Cảm ơn quý khách đã mua hàng tại <i class="name-branch">VATTH Book</i></p>
                <p class="content">Bộ phận phụ trách sẽ liên hệ lại với anh (chị) trong thời gian sớm nhất có thể.
                    Trong trường hợp cần gấp, vui lòng liên hệ Hotline: <i class="phone-red">0388530484</i> để được hỗ trợ!</p>
            </div>
            <div>
                <button class="btn-index"><a href="index.jsp" class="btn-modal">Về trang chủ</a></button>
            </div>
        </div>
    </div>
    <script>
        const buyBtn = document.querySelector('.js-buy');
        const modal = document.querySelector('.js-modal');
        const modalClose = document.querySelector('.js-modal-close');


        function showBuy(){
            //alert("Show")
            modal.classList.add('open')
        }
        function hideBuy(){
            modal.classList.remove('open')
        }

        buyBtn.addEventListener('click', showBuy);
        modal.addEventListener('click', hideBuy);
        modalClose.addEventListener('click', hideBuy);

    </script>
    <%@include file="/includes/footer.jsp"%>
</body>
</html>
