package com.example.btl_web_book.servlet;

import com.example.btl_web_book.model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/remove-from-cart")
public class RemoveFormCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()){
            String id = request.getParameter("id");
            if(id != null){
                ArrayList<Cart> cartArrayList = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                if(cartArrayList != null) {
                    for(Cart c : cartArrayList){
                        if(c.getId() == Integer.parseInt(id)){
                            cartArrayList.remove(c);
                            break;
                        }
                    }
                    response.sendRedirect("cart.jsp");
                }
            }
            else{
                response.sendRedirect("cart.jsp");
            }
        }
    }
}
