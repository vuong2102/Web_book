<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.dao.ProductDao" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
//        response.senRedirect("index.jsp");
    }
    ArrayList<Cart> cartArrayList = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if(cartArrayList != null){
        ProductDao productDao = null;
        try {
            productDao = new ProductDao(JDBCConnect.getConnection());
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        cartProduct = productDao.getCartProducts(cartArrayList);
        double totalPrice = productDao.getTotalCartPrice(cartArrayList);
        request.setAttribute("cartArrayList", cartArrayList);
        request.setAttribute("totalPrice", totalPrice);
    }
%>
<html>
    <head>
        <title>Cart Page</title>
        <link rel="stylesheet" href="CSS/index.css">
        <link rel="stylesheet" href="CSS/cart.css">
        <link rel="stylesheet" href="CSS/nav-bar.css">
        <link rel="stylesheet" href="CSS/footer.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    </head>
    <body>
        <%@include file="includes/navBar.jsp"%>
        <div class="container">
            <div class="content-cart">
<%--                <div class="nav-cart"><h2 class="">Total Price: $ ${(totalPrice>0)?dcf.format(totalPrice):0}</h2></div>--%>
<%--                <div class="nav-cart btn-checkout">--%>
<%--                    <a class="btn btn-primary" href="cart-check-out">Check out</a>--%>
<%--                </div>--%>
                <div class="table-cart-right">
                    <ul class="right-col">
                        <li class="m-10 right-col1">Giao tới</li>
                        <li class="m-10 right-col1"><a href="detailAccount.jsp">Thay đổi</a></li>
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
                    <ul class="btn-right"><a type="submit" href="cart-check-out" class="btn-buy js-buy">Mua hàng</a></ul>
                </div>
            </div>
            <div class="table-cart">
                <div class="table-head">
                    <div class="itemCenter itemName">Name</div>
                    <div class="itemCate">Category</div>
                    <div class="itemPrice">Price</div>
                    <div class="itemBuyNow">Buy Now</div>
                    <div class="itemCenter itemAction">Action</div>
                </div>
                <div class="list_items">
                    <% if(cartArrayList != null){
                        for(Cart c : cartProduct){ %>
                    <div class="item">
                        <div class="itemName"><%= c.getName()%></div>
                        <div class="itemCate"><%= c.getCategory()%></div>
                        <div class="itemPrice">$<%= dcf.format(c.getPrice())%></div>
                        <div class="itemBuyNow">
                            <div class="btn-buy">
                                <svg width="30px" height="30px" viewBox="0 0 512 512" id="Layer_1" version="1.1" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <style type="text/css"> .st0{fill:#263A29;} .st1{fill:#41644A;} </style> <g> <path class="st0" d="M499.2,275.1c-1.9-3.4-6.1-4.6-9.5-2.8L452,293.1c0,0,0,0,0,0l-14.8,8.2L280,387.7 c-10.5,5.8-23.7,1.9-29.4-8.5c-2.8-5.1-3.4-10.9-1.8-16.5c1.6-5.6,5.3-10.2,10.4-12.9c0,0,0,0,0,0l193-106.1c0,0,0,0,0,0l16.8-9.2 c3.4-1.9,4.6-6.1,2.8-9.5c-1.9-3.4-6.1-4.6-9.5-2.8l-8.5,4.7l-24.6-114.9c-1.2-6.2-5.2-11.4-11-14.1c-5.8-2.7-12.3-2.5-17.9,0.6 L157.1,232l-33.9-34.8c-2.2-2.3-5.6-2.8-8.4-1.3l-41.4,22.8c-3.4,1.9-4.6,6.1-2.8,9.5c1.9,3.4,6.1,4.6,9.5,2.8l36.8-20.2l33.8,34.8 l0,0l94.4,97.1c-4.6,4.3-8,9.8-9.8,16.1c-2.7,9.2-1.6,18.8,3,27.1c6.5,11.8,18.7,18.5,31.3,18.5c5.8,0,11.7-1.4,17.1-4.4l11.6-6.4 c0.6,1.8,1.4,3.6,2.3,5.3c4.3,7.8,11.4,13.5,19.9,15.9c3.1,0.9,6.2,1.3,9.3,1.3c5.5,0,11-1.4,16-4.1c7.8-4.3,13.5-11.3,15.9-19.9 c2.5-8.5,1.5-17.5-2.8-25.3c-0.9-1.7-2-3.3-3.2-4.8l54.1-29.7c0.6,1.8,1.4,3.6,2.3,5.3c4.3,7.8,11.4,13.5,19.9,15.9 c3.1,0.9,6.2,1.3,9.3,1.3c5.5,0,11-1.4,16-4.1c7.8-4.3,13.5-11.3,15.9-19.9c2.5-8.5,1.5-17.5-2.8-25.3c-0.9-1.7-2-3.3-3.2-4.8 l29.2-16C499.9,282.7,501.1,278.5,499.2,275.1z M394.7,138.2c3.8-0.8,7.5,1.6,8.3,5.4l16.3,75.9c0.8,3.8-1.6,7.5-5.4,8.3 c-0.5,0.1-1,0.2-1.5,0.2c-3.2,0-6.1-2.2-6.8-5.5l-16.3-75.9C388.5,142.7,390.9,139,394.7,138.2z"></path> <path class="st1" d="M99.4,266.5c0-3.9-3.1-7-7-7H18.9c-3.9,0-7,3.1-7,7s3.1,7,7,7h73.5C96.3,273.5,99.4,270.4,99.4,266.5z"></path> <path class="st1" d="M91.6,363.7c0,3.9,3.1,7,7,7h90.7c3.9,0,7-3.1,7-7s-3.1-7-7-7H98.6C94.7,356.7,91.6,359.8,91.6,363.7z"></path> <path class="st1" d="M39.6,323.5c0,3.9,3.1,7,7,7h122.7c3.9,0,7-3.1,7-7s-3.1-7-7-7H46.6C42.7,316.5,39.6,319.6,39.6,323.5z"></path> <path class="st1" d="M155.8,299.4c3.9,0,7-3.1,7-7s-3.1-7-7-7h-32.9c-3.9,0-7,3.1-7,7s3.1,7,7,7H155.8z"></path> <path class="st1" d="M211.9,328h-15.3c-3.9,0-7,3.1-7,7s3.1,7,7,7h15.3c3.9,0,7-3.1,7-7S215.8,328,211.9,328z"></path> <path class="st1" d="M211.9,388h-58c-3.9,0-7,3.1-7,7s3.1,7,7,7h58c3.9,0,7-3.1,7-7S215.8,388,211.9,388z"></path> <path class="st1" d="M116.3,388H72.6c-3.9,0-7,3.1-7,7s3.1,7,7,7h43.7c3.9,0,7-3.1,7-7S120.1,388,116.3,388z"></path> <path class="st1" d="M51.2,353.5h-23c-3.9,0-7,3.1-7,7s3.1,7,7,7h23c3.9,0,7-3.1,7-7S55.1,353.5,51.2,353.5z"></path> <path class="st1" d="M72.6,299.4c3.9,0,7-3.1,7-7s-3.1-7-7-7H60.9c-3.9,0-7,3.1-7,7s3.1,7,7,7H72.6z"></path> </g> </g></svg>
                            </div>
                        </div>
                        <div class="itemAction">
                            <div class="quantity">
                                <a href="quantity-inc-dec?action=inc&id=<%=c.getId()%>" class="btn btn-incre">
                                    +
                                </a>
                                <label>
                                    <input class="form-control" type="text" name="quantity" value="<%=c.getQuantity()%>" readonly>
                                </label>
                                <a href="quantity-inc-dec?action=decree&id=<%=c.getId()%>" class="btn btn-decree">
                                    -
                                </a>
                            </div>
                            <div  class="removeItem">
                                <a href="remove-from-cart?id=<%= c.getId()%>">
                                    <svg fill="#263A29" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="25px" height="25px" viewBox="0 0 482.428 482.429" xml:space="preserve"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <g> <path d="M381.163,57.799h-75.094C302.323,25.316,274.686,0,241.214,0c-33.471,0-61.104,25.315-64.85,57.799h-75.098 c-30.39,0-55.111,24.728-55.111,55.117v2.828c0,23.223,14.46,43.1,34.83,51.199v260.369c0,30.39,24.724,55.117,55.112,55.117 h210.236c30.389,0,55.111-24.729,55.111-55.117V166.944c20.369-8.1,34.83-27.977,34.83-51.199v-2.828 C436.274,82.527,411.551,57.799,381.163,57.799z M241.214,26.139c19.037,0,34.927,13.645,38.443,31.66h-76.879 C206.293,39.783,222.184,26.139,241.214,26.139z M375.305,427.312c0,15.978-13,28.979-28.973,28.979H136.096 c-15.973,0-28.973-13.002-28.973-28.979V170.861h268.182V427.312z M410.135,115.744c0,15.978-13,28.979-28.973,28.979H101.266 c-15.973,0-28.973-13.001-28.973-28.979v-2.828c0-15.978,13-28.979,28.973-28.979h279.897c15.973,0,28.973,13.001,28.973,28.979 V115.744z"></path> <path d="M171.144,422.863c7.218,0,13.069-5.853,13.069-13.068V262.641c0-7.216-5.852-13.07-13.069-13.07 c-7.217,0-13.069,5.854-13.069,13.07v147.154C158.074,417.012,163.926,422.863,171.144,422.863z"></path> <path d="M241.214,422.863c7.218,0,13.07-5.853,13.07-13.068V262.641c0-7.216-5.854-13.07-13.07-13.07 c-7.217,0-13.069,5.854-13.069,13.07v147.154C228.145,417.012,233.996,422.863,241.214,422.863z"></path> <path d="M311.284,422.863c7.217,0,13.068-5.853,13.068-13.068V262.641c0-7.216-5.852-13.07-13.068-13.07 c-7.219,0-13.07,5.854-13.07,13.07v147.154C298.213,417.012,304.067,422.863,311.284,422.863z"></path> </g> </g> </g></svg>
                                </a>
                            </div>
                        </div>
                    </div>
                        <%}
                    }%>
                </div>
            </div>
        </div>
        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
