package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.ManageBooksDao;
import com.example.btl_web_book.dao.ProductDao;
import com.example.btl_web_book.dao.UserDao;
import com.example.btl_web_book.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private final ProductDao productDao;
    public SearchServlet() throws SQLException, ClassNotFoundException {
        super();
        this.productDao = new ProductDao(JDBCConnect.getConnection());
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        String txtSearch = request.getParameter("txt");
        List<Product> list = productDao.searchByName(txtSearch);
        PrintWriter out = response.getWriter();

        for(Product p : list){
            out.println("<div class=\"col-home\" onclick = window.location=\"http://localhost:8080/Web_book_war_exploded/getSingleProduct?id=" + p.getId() + "\">\n" +
                    "                                <div class=\"card\">\n" +
                    "                                    <img class=\"card-img-top\" src=\"product-images/" + p.getImage() + "\"\n" +
                    "                                         alt=\"Card image cap\">\n" +
                    "                                    <div class=\"card-information\">\n" +
                    "                                        <h5 class=\"card-title\">" + p.getName() + "</h5>\n" +
                    "                                        <h6 class=\"category\">Thể loại: " + p.getCategory() + "</h6>\n" +
                    "                                        <h4 class=\"price\">$" + p.getPrice() + "</h4>\n" +
                    "                                        <div class=\"container-btn\">\n" +
                    "                                            <a class=\"btn-dark\" href=\"add-to-cart?id=" + p.getId() + "\">Thêm vào giỏ hàng</a>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                            </div>");
        }
    }
}
