package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.OrderDao;
import com.example.btl_web_book.model.Cart;
import com.example.btl_web_book.model.Order;
import com.example.btl_web_book.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "CheckOutServlet", value = "/cart-check-out")
public class CheckOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()){
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

            User auth = (User) request.getSession().getAttribute("auth");

            if(cart_list != null && auth != null){
                for(Cart c : cart_list){
                    Order order = new Order();
                    order.setId(c.getId());
                    order.setUserId(auth.getId());
                    order.setQuantity(c.getQuantity());
                    order.setDate(dateFormat.format(date));

                    OrderDao orderDao = new OrderDao(JDBCConnect.getConnection());
                    boolean result = orderDao.insertOrder(order);
                    if(!result) break;
                }
                cart_list.clear();
                response.sendRedirect("orders.jsp");

            } else {
                if(auth == null) response.sendRedirect("login.jsp");
                response.sendRedirect("cart.jsp");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
