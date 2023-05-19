package com.example.btl_web_book.dao;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.model.Cart;
import com.example.btl_web_book.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection con;
    int start = 0;
    int continueLoad = 8;
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
                row.setDescription(rs.getString("description"));
                row.setQuantityInStore(rs.getInt("quantityInStore"));

                products.add(row);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return products;
    }
    public List<Product> get8TopLoadProducts(){
        List<Product> products = new ArrayList<Product>();
        try{
            query = "SELECT * FROM products LIMIT ?,?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, start);
            pst.setInt(2, 12);
            rs = pst.executeQuery();
            while(rs.next()){
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setDescription(rs.getString("description"));
                row.setQuantityInStore(rs.getInt("quantityInStore"));

                products.add(row);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return products;
    }
    public List<Product> getLoadProducts(){
        List<Product> products = new ArrayList<Product>();
        try{
            query = "SELECT * FROM products LIMIT ?,?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, continueLoad);
            pst.setInt(2, 8);
            rs = pst.executeQuery();
            while(rs.next()){
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setDescription(rs.getString("description"));
                row.setQuantityInStore(rs.getInt("quantityInStore"));

                products.add(row);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        continueLoad+=8;
        return products;
    }
    public List<Product> searchByName(String txtSearch){
        List<Product> products = new ArrayList<>();
        try{
            con = JDBCConnect.getConnection();
            query = "select * from products where name like ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, "%" + txtSearch + "%");
            rs = pst.executeQuery();
            while (rs.next()){
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setDescription(rs.getString("description"));
                row.setQuantityInStore(rs.getInt("quantityInStore"));

                products.add(row);
            }
        }
        catch (Exception e){
            System.out.println(e.getMessage());
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
                        row.setQuantityInStore(rs.getInt("quantityInStore")-item.getQuantity());
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
            query = "select * from products where id=? ";

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
                row.setQuantityInStore(rs.getInt("quantityInStore"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
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

    public void delete(String pid){
         String query="delete from products where id=?";
         try {
             pst = this.con.prepareStatement(query);
             pst.setString(1,pid);
             pst.executeUpdate();
         } catch (Exception ignored){
         }
    }
    public Product getProductById(int id) throws SQLException,ClassNotFoundException{
        Product row = null;
        query = "select * from products where id=? ";
        try {
             pst = this.con.prepareStatement(query);
            pst.setInt(1,id);
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()){
                row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setDescription(rs.getString("description"));
                row.setQuantityInStore(rs.getInt("quantityInStore"));
            }
        }
        catch (SQLException ignored){
        }
        return row;
    }
    public void insertProduct(String name, String image, String price,String  category, String description) {
        String query="insert into products (name, category, price, image, description) values (?, ?, ?, ?, ?, ?)";
        String a="";
        try {
            pst = this.con.prepareStatement(query);
            pst.setString(1,name);
            pst.setString(2,category);
            pst.setString(3,price);
            pst.setString(4,image);
            pst.setString(6,description);
            pst.executeUpdate();
        } catch (Exception ignored){
        }
    }
}
