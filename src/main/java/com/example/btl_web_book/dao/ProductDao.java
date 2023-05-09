package com.example.btl_web_book.dao;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.model.Cart;
import com.example.btl_web_book.model.Product;
import com.example.btl_web_book.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ProductDao(Connection con) {
        this.con = con;
    }

    public List<Product> getAllProducts(){
        List<Product> products = new ArrayList<Product>();
        try{
            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return products;
    }
    public List<Cart> getCartProducts(ArrayList<Cart> cartArrayList){
        List<Cart> books = new ArrayList<>();
        try{
            if(cartArrayList.size() > 0){
                for(Cart item : cartArrayList){
                    query = "select * from products where id =?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()){
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        books.add(row);
                    }
                }
            }
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        return books;
    }
    public Product getSingleProduct(int id) {
        Product row = null;
        try {
            query = "select * from products where id=?;";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setDescription(rs.getString("description"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return row;
    }
    public Product getProductById(int id) throws SQLException,ClassNotFoundException{
        Product row = null;
        query = "select * from products where id=? ";
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);){
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setDescription(rs.getString("description"));
            }
        }
        catch (SQLException ignored){
        }
        return row;
    }
    public double getTotalCartPrice(ArrayList<Cart> cartArrayList){
        double sum = 0;
        try{
            if(cartArrayList.size() > 0){
                for(Cart item : cartArrayList){
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

    public void delete(String id){
         String query="delete from products where id=?";
         try {
             pst = this.con.prepareStatement(query);
             pst.setString(1,id);
             pst.executeUpdate();
         } catch (Exception ignored){
         }
    }
    public boolean deleteProduct(int id) throws SQLException,ClassNotFoundException {
        boolean rowDeleted;
        String query = "delete from products where id = ?;";
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public void updateProduct(Product book) throws SQLException,ClassNotFoundException{
        String query = "update products set name = ?, category = ?, price = ?, image =?, description = ? where id = ?;";
        try {
            pst = this.con.prepareStatement(query);

            pst.setString(1,book.getName());
            pst.setString(2,book.getCategory());
            pst.setDouble(3,book.getPrice());
            pst.setString(4,book.getImage());
            pst.setString(5,book.getDescription());
            pst.setInt(6,book.getId());
            pst.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void insertProduct(Product book) throws SQLException, ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO products" + "  (name, category, price, image, description) VALUES " + " (?, ?, ?, ?, ?);";
        try(Connection con = JDBCConnect.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1,book.getName());
            preparedStatement.setString(2,book.getCategory());
            preparedStatement.setDouble(3,book.getPrice());
            preparedStatement.setString(4,book.getImage());
            preparedStatement.setString(5,book.getDescription());
            preparedStatement.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
