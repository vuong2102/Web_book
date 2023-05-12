package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;

import com.example.btl_web_book.dao.UserDao;
import com.example.btl_web_book.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import static java.lang.System.out;

@WebServlet("/detailAccount")
public class DetailAccountServlet extends HttpServlet {
    UserDao userDao = new UserDao(JDBCConnect.getConnection());
    public DetailAccountServlet() throws SQLException, ClassNotFoundException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String userName = request.getParameter("userName");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String email = request.getParameter("email");

        User user = new User(id, userName, phoneNumber, address, email);
        try {
            userDao.updateUser(user);
//            response.sendRedirect("detailAccount.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            throw new RuntimeException(ex);
        }
//        HttpSession session= request.getSession() ;
//            session.setAttribute("userName",user.getUserName());
//            session.setAttribute("phoneNumber",user.getPhoneNumber());
//            session.setAttribute("address",user.getAddress());
//            session.setAttribute("email",user.getEmail());
//            session.setAttribute("id",user.getId());
//        } catch (ClassNotFoundException | SQLException e) {
//            throw new RuntimeException(e);
//        }
    }
}
