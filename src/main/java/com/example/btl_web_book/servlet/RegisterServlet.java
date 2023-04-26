package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.RegisterDAO;
import com.example.btl_web_book.dao.UserDao;
import com.example.btl_web_book.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;
    public RegisterServlet() throws SQLException, ClassNotFoundException {
        super();
        this.userDao = new UserDao(JDBCConnect.getConnection());
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Server at: ").append(request.getContextPath());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("passWord");
        String role = "user";
        User user = new User(userName,phoneNumber,address,email,password,role);
        RegisterDAO registerDAO = new RegisterDAO();
        RequestDispatcher dispatcher = null;
        try {
            String result = registerDAO.insert(user);
            response.getWriter().print(result);
            response.sendRedirect("login.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }



    }
}
