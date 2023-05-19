package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.*;
import com.example.btl_web_book.model.Order;
import com.example.btl_web_book.model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/search-all")
public class SearchAllServlet extends HttpServlet {
    private  static final long serialVersionUID = 1L;
    private final OrderDao orderDao;
    private final ManageBooksDao manageBooksDao;
    private final ManageUsersDAO manageUsersDAO;
    public SearchAllServlet() throws SQLException, ClassNotFoundException {
        super();
        this.orderDao = new OrderDao(JDBCConnect.getConnection());
        this.manageBooksDao = new ManageBooksDao(JDBCConnect.getConnection());
        this.manageUsersDAO = new ManageUsersDAO(JDBCConnect.getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            if (action.equals("/search_manage_user")) {
                searchManageUser(request, response);
            } else {
                searchManageBook(request, response);
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
    private void searchManageUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ClassNotFoundException {
        int startP = Math.max(Integer.parseInt(request.getParameter("index")), 1);
        List<Order> listOrder = orderDao.getAllOrders();
        int totalAccount = listOrder.size();
        int endPage = totalAccount/15;
        if(totalAccount % 15 != 0) endPage++;
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("endP", endPage);
        request.getRequestDispatcher("manageOrder.jsp").forward(request, response);
    }
    private void searchManageBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ClassNotFoundException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String txtSearch = request.getParameter("txt");
        List<Product> product = manageBooksDao.timKiemSachBangTen(txtSearch);
        request.setAttribute("listProduct", product);
        request.getRequestDispatcher("manage-book?index=1").forward(request, response);
    }
}
