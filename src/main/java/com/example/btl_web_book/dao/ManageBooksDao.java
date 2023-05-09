package com.example.btl_web_book.dao;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ManageBooksDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    public ManageBooksDao(Connection con) {
        this.con = con;
    }
    public Product getProductById(int id) throws SQLException,ClassNotFoundException{
        Product row = null;
        query = "select * from products where id=?;";
        try {
            pst = this.con.prepareStatement(query);
            pst.setInt(1,id);
            rs = pst.executeQuery();
            while (rs.next()){
                row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setDescription(rs.getString("description"));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return row;
    }
    public void deleteProduct(int id) throws SQLException,ClassNotFoundException {
        query = "delete from products where id = ?;";

        try {
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateProduct(Product book) throws SQLException,ClassNotFoundException{
        boolean updated;
        String query = "update products set name = ?, category = ?, price = ?, image =?, description = ? where id = ?;";
        try {
            pst = this.con.prepareStatement(query);

            pst.setString(1,book.getName());
            pst.setString(2,book.getCategory());
            pst.setDouble(3,book.getPrice());
            pst.setString(4,book.getImage());
            pst.setString(5,book.getDescription());
            pst.setInt(6,book.getId());
            updated = pst.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void insertProduct(Product book) throws SQLException, ClassNotFoundException {
        query = "insert into products (name, category, price, image, description) values(?, ?, ?, ?, ?);";
        try{
            pst = this.con.prepareStatement(query);

            pst.setString(1,book.getName());
            pst.setString(2,book.getCategory());
            pst.setDouble(3,book.getPrice());
            pst.setString(4,book.getImage());
            pst.setString(5,book.getDescription());
            pst.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}

