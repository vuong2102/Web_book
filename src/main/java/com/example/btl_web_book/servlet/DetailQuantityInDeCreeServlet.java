package com.example.btl_web_book.servlet;

import com.example.btl_web_book.model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "DetailQuantityInDeCreeServlet", value = "/detailQuantityInDeCree")
public class DetailQuantityInDeCreeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()){
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            ArrayList<Cart> cartArrayList = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

            if(action != null && id >= 1){
                if(action.equals("inc")){
                    for(Cart c : cartArrayList){
                        if(c.getId() == id){
                            int quantity = c.getQuantity();
                            quantity++;
                            c.setQuantity(quantity);
                            response.sendRedirect("cart.jsp");
                        }
                    }
                }
                else if(action.equals("decree")){
                    for(Cart c : cartArrayList){
                        if(c.getId() == id && c.getQuantity() > 1){
                            int quantity = c.getQuantity();
                            quantity--;
                            c.setQuantity(quantity);
                            break;
                        }
                    }
                    response.sendRedirect("cart.jsp");
                }
                else{
                    response.sendRedirect("cart.jsp");
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
