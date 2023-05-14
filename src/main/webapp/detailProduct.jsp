<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="com.example.btl_web_book.dao.ProductDao" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
    }
    ProductDao pd = null;
    try {
        pd = new ProductDao(JDBCConnect.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    List<Cart> cartArrayList = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cartArrayList != null){
        request.setAttribute("cartArrayList", cartArrayList);
    }
    Product p = pd.getSingleProduct(Integer.parseInt(request.getParameter("id")));
    assert auth != null;%>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="CSS/detail.css">
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
    <%@include file="includes/navBar.jsp"%>
    <div class="container__detail">
      <div class="block__left">
        <img src="product-images/<%=p.getImage()%>" alt="Sách">
      </div>
      <div class="block__right">
          <li><%=p.getName()%></li>
          <li><%= p.getCategory()%></li>
          <li><%= p.getPrice()%></li>
          <li><%= p.getDescription()%></li>
          <% if(auth != null) { %>
              <li>Giao đến: <%= auth.getAddress()%></li>
          <%}%>
          <div class="form-group"> Số lượng
              <a href="quantity-inc-dec?action=inc&id=<%=p.getId()%>" class="btn-incre"><i class="fas">+</i></a>
              <label>
                  <input class="form-control" type="text" name="quantity" value="<%%>" readonly>
              </label>
              <a href="quantity-inc-dec?action=decree&id=<%=p.getId()%>" class="btn-decree"><i class="fas">-</i></a>
              <button type="submit" class="table-action btn btn-buy">Buy</button>
          </div>
          <div class="">
              <a href="add-to-cart?id=<%=p.getId()%>">Thêm vào giỏ hàng</a>
              <a href="order-now?quantity=1&id=<%=p.getId()%>">Mua ngay</a>
          </div>
      </div>
    </div>
    <footer>
        <%@include file="includes/footer.jsp"%>
    </footer>
</body>
</html>
