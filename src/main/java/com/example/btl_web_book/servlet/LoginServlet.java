package com.example.btl_web_book.servlet;

import java.io.*;
import java.sql.SQLException;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.UserDao;
import com.example.btl_web_book.model.User;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("login.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()){
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");

            try{
                UserDao userDao = new UserDao(JDBCConnect.getConnection());
                User user = userDao.userLogin(email, password);

                if (user != null){
                    out.print("user login");
                    request.getSession().setAttribute("auth", user);
                    response.sendRedirect("index.jsp");
                }
                else {
                    out.print("user failed");
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }
}