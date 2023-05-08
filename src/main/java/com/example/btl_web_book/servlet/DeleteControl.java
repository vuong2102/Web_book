package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.ProductDao;
import com.mysql.cj.jdbc.JdbcConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteControl", value = "/delete")
public class DeleteControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a="";
        String pid=request.getParameter("pid");
        ProductDao dao=null;
        try {
            dao = new ProductDao(JDBCConnect.getConnection());
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

        dao.delete(pid);
        response.sendRedirect("manageBook.jsp");
    }
}
