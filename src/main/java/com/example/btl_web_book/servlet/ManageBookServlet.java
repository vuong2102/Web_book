package com.example.btl_web_book.servlet;


import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.ManageBooksDao;
import com.example.btl_web_book.dao.ManageUsersDAO;
import com.example.btl_web_book.dao.ProductDao;
import com.example.btl_web_book.model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ManagerControl", urlPatterns = {"/manage-book"})
public class ManageBookServlet extends HttpServlet {
    private final ManageBooksDao manageBooksDao;
    private ProductDao productDao;
    public ManageBookServlet() throws SQLException, ClassNotFoundException {
        this.manageBooksDao = new ManageBooksDao(JDBCConnect.getConnection());
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new_book":
                    showNewForm(request, response);
                    break;
                case "/insert_book":
                    insertProduct(request, response);
                    break;
                case "/delete_book":
                    deleteProduct(request, response);
                    break;
                case "/edit_book":
                    showEditForm(request, response);
                    break;
                case "/update_book":
                    updateProduct(request, response);
                    break;
                default:
                    listProduct(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
    public void insertProduct(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        int quantityInStore = Integer.parseInt(request.getParameter("quantityInStore"));
        try {
            Product book = new Product(name,category, price, image,description,quantityInStore);
            manageBooksDao.insertBook(book);
            response.sendRedirect("manage-book?index=1");
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
//    private void listProduct(HttpServletRequest request, HttpServletResponse response)
//            throws SQLException, IOException, ServletException, ClassNotFoundException {
//        List<Product> listProduct = manageBooksDao.selectAllProducts();
//        request.setAttribute("listProduct", listProduct);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("manageBook.jsp");
//        dispatcher.forward(request, response);
//    }
    private void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ClassNotFoundException {
        int startP = Integer.parseInt(request.getParameter("index"));
        List<Product> listProduct = manageBooksDao.selectPaginationProducts(startP);
        List<Product> listProductAll = manageBooksDao.selectAllProducts();
        request.setAttribute("listProduct", listProduct);
        int totalPage = listProductAll.size() / 15;
        if(listProductAll.size() % 15 != 0) totalPage++;
        request.setAttribute("totalPage", totalPage);
        request.getRequestDispatcher("manageBook.jsp").forward(request, response);
    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        Double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        int quantityInStore = Integer.parseInt(request.getParameter("quantityInStore"));
        Product book = new Product(id, name, category, price, image, description, quantityInStore);
        manageBooksDao.updateBook(book);
        response.sendRedirect("manage-book?index=1");
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_update_Book.jsp");
        dispatcher.forward(request, response);
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = manageBooksDao.selectProduct(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_update_Book.jsp");
        request.setAttribute("product", existingProduct);
        dispatcher.forward(request, response);
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        manageBooksDao.deleteBook(id);
        response.sendRedirect("manage-book");
    }
}
