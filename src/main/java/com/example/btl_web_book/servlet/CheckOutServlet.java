package com.example.btl_web_book.servlet;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.dao.ManageUsersDAO;
import com.example.btl_web_book.dao.ManageWareHouseDao;
import com.example.btl_web_book.dao.OrderDao;
import com.example.btl_web_book.model.Cart;
import com.example.btl_web_book.model.Order;
import com.example.btl_web_book.model.User;
import com.example.btl_web_book.model.Warehouse;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "CheckOutServlet", value = "/cart-check-out")
public class CheckOutServlet extends HttpServlet {
    private final OrderDao orderDao;
    private final ManageWareHouseDao manageWareHouseDao;

    public CheckOutServlet() throws SQLException, ClassNotFoundException {
        this.orderDao = new OrderDao(JDBCConnect.getConnection());
        this.manageWareHouseDao = new ManageWareHouseDao(JDBCConnect.getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()){
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

            User auth = (User) request.getSession().getAttribute("auth");

            if(cart_list != null && auth != null){
                for(Cart c : cart_list) {
                    Order order = new Order();
                    order.setId(c.getId());
                    order.setUserId(auth.getId());
                    order.setQuantity(c.getQuantity());
                    order.setDate(dateFormat.format(date));
                    try{
                        orderDao.insertOrder(order);
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                    int soLuongTonKho = manageWareHouseDao.laySoLuongTonKhoCuaMotSanPham(order.getId());
                    int soLuongDaBan = orderDao.demSoLuongSachDaBanCuaMotSanPham(order.getId());
                    Warehouse warehouse = new Warehouse(order.getId(), soLuongDaBan , soLuongTonKho-order.getQuantity());

                    try {
                        manageWareHouseDao.capNhatThongTinSanPham(warehouse);
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
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
