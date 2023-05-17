package com.example.btl_web_book.dao;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.model.Cart;
import com.example.btl_web_book.model.Order;
import com.example.btl_web_book.model.Product;
import com.example.btl_web_book.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    public OrderDao(Connection con){
        this.con = con;
    }
    public boolean insertOrder(Order order){
        boolean result = false;
        try{
            query = "insert into orders (product_id, user_id, order_quantity, order_date) values(?, ?, ?, ?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, order.getId());
            pst.setInt(2, order.getUserId());
            pst.setInt(3, order.getQuantity());
            pst.setString(4, order.getDate());
            pst.executeUpdate();
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from orders where user_id=? order by orders.id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);
                int pId = rs.getInt("product_id");
                Product product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("id"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("order_quantity"));
                order.setQuantity(rs.getInt("order_quantity"));
                order.setDate(rs.getString("order_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
    public int soTVDaMuaHang(){
        List<Integer> list = new ArrayList<>();
        try {
            query = "select DISTINCT user_id from orders;";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("user_id");
                list.add(userId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list.size();
    }
    public List<Order> selectPaginationOrders(int startP) throws SQLException,ClassNotFoundException{
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from orders limit ?,?;";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, (startP - 1) * 15);
            pst.setInt(2, 15);
            rs = pst.executeQuery();
            while (rs.next()) {

                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);

                int productId = rs.getInt("product_id");
                int userId = rs.getInt("user_id");
                Product product = productDao.getSingleProduct(productId);

                order.setId(productId);
                order.setUserId(userId);
                order.setOrderId(rs.getInt("id"));
                order.setName(product.getName());
                order.setPrice(product.getPrice() * rs.getInt("order_quantity"));
                order.setImage(product.getImage());
                order.setQuantity(rs.getInt("order_quantity"));
                order.setDate(rs.getString("order_date"));
                order.setStatusDelivery(rs.getString("status_delivery"));
                list.add(order);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
    public List<Order> getAllOrders(){
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from orders;";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);

                int productId = rs.getInt("product_id");
                int userId = rs.getInt("user_id");
                Product product = productDao.getSingleProduct(productId);

                order.setId(productId);
                order.setUserId(userId);
                order.setOrderId(rs.getInt("id"));
                order.setName(product.getName());
                order.setPrice(product.getPrice()*rs.getInt("order_quantity"));
                order.setImage(product.getImage());
                order.setQuantity(rs.getInt("order_quantity"));
                order.setDate(rs.getString("order_date"));
                order.setStatusDelivery(rs.getString("status_delivery"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
    public double getTotalOrderPrice(ArrayList<Order> orderArrayList){
        double sum = 0;
        try{
            if(orderArrayList.size() > 0){
                for(Order item : orderArrayList){
                    query = "select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()){
                        sum += rs.getDouble("price") * item.getQuantity();
                    }
                }
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return sum;
    }
    public Order setTinhTrangGiaoHang(int id) {
        Order tinhTrangGiaoHang = null;
        try {
            query = "select status_delivery from orders where id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()){
                tinhTrangGiaoHang.setStatusDelivery("Delivered");
            }
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
            throw new RuntimeException(e);
        }
        return tinhTrangGiaoHang;
    }
    public int demSoLuongSachDaBanCuaMotSanPham(int id){
        int count = 0;
        try{
            con = JDBCConnect.getConnection();
            query = "select order_quantity from orders where product_id=?;";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()){
                count += rs.getInt("order_quantity");
            }
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        return count;
    }
    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "delete from orders where id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
            throw new RuntimeException(e);
        }
        //return result;
    }
}
