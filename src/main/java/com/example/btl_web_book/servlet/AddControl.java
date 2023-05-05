package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.ProductDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/add")
public class AddControl extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String pname=request.getParameter("name");
//        String pimage=request.getParameter("image");
//        String pprice=request.getParameter("price");
//        String ptitle=request.getParameter("title");
//        String pcategory=request.getParameter("category");
//        String pdescription=request.getParameter("description");
//
//        ProductDao dao=null;
//        try {
//            dao = new ProductDao(JDBCConnect.getConnection());
//        } catch (ClassNotFoundException | SQLException e) {
//            throw new RuntimeException(e);
//        }
//        dao.insertProduct("100", pname, pcategory, pprice, pimage);
//        response.sendRedirect("ManagerControl");
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a="";
        String pname=request.getParameter("name");
        String pimage=request.getParameter("image");
        String pprice=request.getParameter("price");
        String ptitle=request.getParameter("title");
        String pcategory=request.getParameter("category");
        String pdescription=request.getParameter("description");

        ProductDao dao=null;
        try {
            dao = new ProductDao(JDBCConnect.getConnection());
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        //dao.insertProduct(pname,pimage, pprice, ptitle, pcategory, pdescription);
        response.sendRedirect("ManagerProduct.jsp");
    }
}
