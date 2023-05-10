package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.ProductDao;
import com.example.btl_web_book.model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/load-home")
public class LoadHomeServlet extends HttpServlet {
    private final ProductDao productDao = new ProductDao(JDBCConnect.getConnection());
    public LoadHomeServlet() throws SQLException, ClassNotFoundException {
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        List<Product> list = productDao.getLoadProducts();
        PrintWriter out = response.getWriter();
        for(Product p : list){
            out.println("<div class=\"col-home\">\n" +
                    "                                <div class=\"card\">\n" +
                    "                                    <img class=\"card-img-top\" src=\"product-images/" + p.getImage() + "\"\n" +
                    "                                         alt=\"Card image cap\">\n" +
                    "                                    <div class=\"card-body\">\n" +
                    "                                        <h5 class=\"card-title\">" + p.getName() + "</h5>\n" +
                    "                                        <h6 class=\"category\">Thể loại: " + p.getCategory() + "</h6>\n" +
                    "                                        <h4 class=\"price\">$" + p.getPrice() + "</h4>\n" +
                    "                                        <div class=\"container-btn\">\n" +
                    "                                            <a class=\"btn btn-dark\" href=\"add-to-cart?id=" + p.getId() + "\">Thêm vào giỏ hàng</a>\n" +
                    "                                            <a class=\"btn btn-primary\" href=\"order-now?quantity=1&id=" + p.getId() + "\">Mua ngay</a>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                            </div>");
        }
    }
}
