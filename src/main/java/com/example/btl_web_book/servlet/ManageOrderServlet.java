package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.OrderDao;
import com.example.btl_web_book.dao.ProductDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.awt.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "ManageOrderServlet", value = "/manage-order")
public class ManageOrderServlet extends HttpServlet {
    private OrderDao orderDao;
    public ManageOrderServlet() throws SQLException, ClassNotFoundException {
        super();
        OrderDao orderDao = new OrderDao(JDBCConnect.getConnection());
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String checkbox = request.getParameter("checkbox");
            int id = Integer.parseInt(request.getParameter("orderId"));
            orderDao.setTinhTrangGiaoHang(id);
            response.sendRedirect("manageOrder.jsp");
        }
    }
}
