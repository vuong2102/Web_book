package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.CommentDao;
import com.example.btl_web_book.dao.UserDao;
import com.example.btl_web_book.model.Comment;
import com.example.btl_web_book.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("index.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()) {
            String idUser = request.getParameter("id_User");
            if(idUser == null){
                response.sendRedirect("login.jsp");
            }
            else{
                int idProduct = Integer.parseInt(request.getParameter("id_Product"));
                String comment = request.getParameter("comment");
                Comment comment1 = new Comment(comment, idProduct, Integer.parseInt(idUser));
                try{
                    CommentDao commentDao = new CommentDao(JDBCConnect.getConnection());

                    commentDao.insertComment(comment1);
                    response.sendRedirect("http://localhost:8080/Web_book_war_exploded/getSingleProduct?id=" + idProduct);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }
}
