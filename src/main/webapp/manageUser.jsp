<%@ page import="com.example.btl_web_book.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.dao.OrderDao" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.btl_web_book.dao.ManageUsersDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("authAdmin");
    if(auth!= null){
        request.setAttribute("authAdmin", auth);
    }
    OrderDao orderDao = null;
    ManageUsersDAO manageUsersDAO = null;
    List<User> listUser = (List<User>) request.getAttribute("listUser");
    request.setAttribute("listUser", listUser);
//    int endP = Integer.parseInt(request.getSession().getAttribute("endP").toString());
    try {
        orderDao  = new OrderDao(JDBCConnect.getConnection());
        manageUsersDAO  = new ManageUsersDAO(JDBCConnect.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    List<User> userListAll = manageUsersDAO.selectAllUsers();
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="CSS/userlist.css">
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
    <header>
        <%@include file="includes/navbar-admin.jsp"%>
    </header>
    <tbody>
        <div class="row">
            <div class="container">
                <div>Thành viên: <%=userListAll.size()%></div>
                <div>Số thành viên đã mua hàng: <%=orderDao.soTVDaMuaHang()%></div>
                <h3 class="text-center">List Users</h3>
                <div class="container text-left">
                    <a href="<%=request.getContextPath()%>/new_user" class="btn btn-success">Add New User</a>
                </div>
                    <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                        <%
                        for(User user: listUser){%>
                        <tr>
                            <td><%=user.getId()%></td>
                            <td><%=user.getUserName()%></td>
                            <td><%=user.getPhoneNumber()%></td>
                            <td><%=user.getAddress()%></td>
                            <td><%=user.getEmail()%></td>
                            <td><%=user.getPassWord()%></td>
                            <td><%=user.getRole()%></td>
                            <td><a href="edit_user?id=<%=user.getId()%>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete_user?id=<%=user.getId()%>">Delete</a></td>
                        </tr>
                        <%
                            }
                        %>
                </table>
            </div>

<%--            Phân trang--%>
            <div>
                <% int currentPage = Integer.parseInt(request.getParameter("index"));%>
                <%if(currentPage > 1){ %>
                    <li><a href="manage-user?index=<%=currentPage-1%>">Previous</a></li>
                <%}%>
                <c:forEach begin="<%=currentPage%>" end="<%=currentPage+6%>" var="i">
                    <a href="manage-user?index=${i}">${i} </a>
                </c:forEach>
                <%
                    int endP = Integer.parseInt(request.getAttribute("endP").toString());
                    if(currentPage < endP){%>
                    <li><a href="manage-user?index=<%=currentPage+1%>">Next</a></li>
                <%}%>
            </div>

        </div>
    </tbody>
    <footer>
        <%@include file="includes/footer.jsp"%>
    </footer>
</body>
</html>
