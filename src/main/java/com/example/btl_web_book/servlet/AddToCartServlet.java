package com.example.btl_web_book.servlet;

import com.example.btl_web_book.model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        try(PrintWriter out = response.getWriter()){
            ArrayList<Cart> cartList = new ArrayList<>();

            int id = Integer.parseInt(request.getParameter("id"));
            Cart cm = new Cart();
            cm.setId(id);
            cm.setQuantity(1);

            HttpSession session = request.getSession();
            ArrayList<Cart> cart_List = (ArrayList<Cart>) session.getAttribute("cart-list");

            if(cart_List == null){
                cartList.add(cm);
                session.setAttribute("cart-list", cartList);
                response.sendRedirect("index.jsp");
            }
            else{
                cartList = cart_List;

                boolean exist = false;
                for (Cart c : cart_List) {
                    if (c.getId() == id) {
                        exist = true;
                        out.println("<script>alert('Sản phẩm đã có trong giỏ hàng');</script>");
                        out.println("<h3 style='color:crimson; text-align: center; top: 30%'>Sản phẩm đã có trong giỏ hàng. <a href='cart.jsp'>Đi đến trang Giỏ hàng</a></h3>");
                    }
                }

                if (!exist) {
                    cartList.add(cm);
                    response.sendRedirect("index.jsp");
                }
            }
        }
    }
}
