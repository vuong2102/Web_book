<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to Shopping Book</title>
        <%@include file="includes/head.jsp"%>
        <link rel="stylesheet" href="CSS/index.css">
    </head>
    <body>
        <%@include file="includes/nav-bar.jsp"%>
        <% try {
            System.out.print(JDBCConnect.getConnection());
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        } %>
        <%@include file="includes/footer.jsp"%>
    </body>
</html>