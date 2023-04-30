package com.example.btl_web_book.dao;

import com.example.btl_web_book.model.Cart;
import com.example.btl_web_book.model.Order;
import com.example.btl_web_book.model.Product;

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
