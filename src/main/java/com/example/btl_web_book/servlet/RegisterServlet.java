package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.RegisterDAO;
import com.example.btl_web_book.dao.UserDao;
import com.example.btl_web_book.model.User;
import com.example.btl_web_book.util.EncodePassWord;
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

    public RegisterServlet() throws SQLException, ClassNotFoundException {
        super();
        UserDao userDao = new UserDao(JDBCConnect.getConnection());
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
        User user = new User(userName,phoneNumber,address,email,EncodePassWord.toSHA1(password),role);
        RegisterDAO registerDAO = new RegisterDAO();

        if(registerDAO.existedEmail(user.getEmail())){
            String message = "Email existed";
            request.setAttribute("message",message);
            request.getRequestDispatcher("registration.jsp").forward(request,response);
        }else {
            String result = null;
            try {
                result = registerDAO.insert(user);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            response.getWriter().print(result);
                response.sendRedirect("login.jsp");

        }

    }
}
