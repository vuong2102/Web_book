package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.ManageBooksDao;
import com.example.btl_web_book.dao.ProductDao;
import com.example.btl_web_book.dao.UserDao;
import com.example.btl_web_book.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private final ProductDao productDao;
    public SearchServlet() throws SQLException, ClassNotFoundException {
        super();
        this.productDao = new ProductDao(JDBCConnect.getConnection());
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Server at: ").append(request.getContextPath());
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        String txtSearch = request.getParameter("txt");
        List<Product> list = productDao.searchByName(txtSearch);

        request.setAttribute("products", list);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        //Chuyển về trang home, đẩy dữ liệu lên trang home
    }
}
