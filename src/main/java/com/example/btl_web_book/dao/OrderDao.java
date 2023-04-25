package com.example.btl_web_book.dao;

import com.example.btl_web_book.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
