package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.OrderDao;
import com.example.btl_web_book.model.Order;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ManageOrderServlet", value = "/manage-order")
public class ManageOrderServlet extends HttpServlet {
    private  static final long serialVersionUID = 1L;
    private final OrderDao orderDao;
    public ManageOrderServlet() throws SQLException, ClassNotFoundException {
        super();
        this.orderDao = new OrderDao(JDBCConnect.getConnection());
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/insert_order":
                    insertOrder(request, response);
                    break;
                case "/delete_order":
                    deleteOrder(request, response);
                    break;
                default:
                    listOrder(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
    private void listOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ClassNotFoundException {
        int startP = Math.max(Integer.parseInt(request.getParameter("index")), 1);
        List<Order> listOrder = orderDao.getAllOrders();
        int totalAccount = listOrder.size();
        int endPage = totalAccount/20;
        if(totalAccount % 20 != 0) endPage++;
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("endP", endPage);
        request.getRequestDispatcher("manageOrder.jsp").forward(request, response);
    }
    private void deleteOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        orderDao.cancelOrder(id);
        response.sendRedirect("manage-user");
    }
    private void insertOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
//        orderDao.cancelOrder(id);
        response.sendRedirect("manage-user");
    }
}
