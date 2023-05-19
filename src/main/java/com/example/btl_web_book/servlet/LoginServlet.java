package com.example.btl_web_book.servlet;

import java.io.*;
import java.sql.SQLException;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.UserDao;
import com.example.btl_web_book.model.User;
import com.example.btl_web_book.util.EncodePassWord;
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
                User user = userDao.userLogin(email, EncodePassWord.toSHA1(password));

                if (user != null){
                    if(user.getRole().equals("user")){
                        out.print("user login");
                        HttpSession session = request.getSession();
                        session.setAttribute("auth", user);
                        response.sendRedirect("index.jsp");
                    }
                    else if(user.getRole().equals("admin")){
                        HttpSession session = request.getSession();
                        session.setAttribute("authAdmin", user);
                        response.sendRedirect("manage-book?index=1");
                    }
                }
                else {
//                    out.print("user failed");
                    out.println("<h3 style='color:crimson; text-align: center; top: 30%'>Email or password is not Exist <a href='login.jsp'>Go to Login Page</a></h3>");
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }
}