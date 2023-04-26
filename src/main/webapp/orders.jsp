<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
        response.sendRedirect("index.jsp");
    }
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="CSS/index.css">
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
