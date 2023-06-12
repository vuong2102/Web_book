package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.ManageUsersDAO;
import com.example.btl_web_book.dao.RegisterDAO;
import com.example.btl_web_book.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/manage-user")
public class ManageUserServlet extends HttpServlet {
    private  static final long serialVersionUID = 1L;
    private final ManageUsersDAO manageUsersDAO;
    public ManageUserServlet() throws SQLException, ClassNotFoundException {
        super();
        this.manageUsersDAO = new ManageUsersDAO(JDBCConnect.getConnection());
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new_user":
                    showNewForm(request, response);
                    break;
                case "/insert_user":
                    insertUser(request, response);
                    break;
                case "/delete_user":
                    deleteUser(request, response);
                    break;
                case "/edit_user":
                    showEditForm(request, response);
                    break;
                case "/update_user":
                    updateUser(request, response);
                    break;
                default:
                    listUser(request, response);
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
//    private void listUser(HttpServletRequest request, HttpServletResponse response)
//            throws SQLException, IOException, ServletException, ClassNotFoundException {
//        List<User> listUser = manageUsersDAO.selectAllUsers();
//        request.setAttribute("listUser", listUser);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("manageUser.jsp");
//        dispatcher.forward(request, response);
//    }
    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ClassNotFoundException {
        int startP = Math.max(Integer.parseInt(request.getParameter("index")), 1);
        List<User> listUser = manageUsersDAO.selectPaginationUsers(startP);
        List<User> listUserAll = manageUsersDAO.selectAllUsers();
        int totalAccount = listUserAll.size();
        int endPage = totalAccount/20;
        if(totalAccount % 20 != 0) endPage++;
        request.setAttribute("listUser", listUser);
//        request.setAttribute("listUser", listUserAll);
        request.setAttribute("endP", endPage);
        request.getRequestDispatcher("manageUser.jsp").forward(request, response);
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        dispatcher.forward(request, response);
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = manageUsersDAO.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }
    public void insertUser(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, ServletException {
        String userName = request.getParameter("userName");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("passWord");
        String role = request.getParameter("role");
       if (manageUsersDAO.existedEmail(email)){
            String ms = "Email existed";
            request.setAttribute("ms",ms);
            request.getRequestDispatcher("registration.jsp").forward(request,response);
        }else {
           try {
               User user = new User(userName, phoneNumber, address, email, password, role);
               manageUsersDAO.insertUser(user);
               response.sendRedirect("manage-user?index=1");
           } catch (SQLException | ClassNotFoundException e) {
               throw new RuntimeException(e);
           }
       }
    }
    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        String userName = request.getParameter("userName");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("passWord");
        String role = "user";

        User user = new User(id,userName,phoneNumber,address,email,password,role);
        manageUsersDAO.updateUser(user);
        response.sendRedirect("manage-user?index=1");
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        manageUsersDAO.deleteUser(id);
        response.sendRedirect("manage-user?index=1");
    }
}
