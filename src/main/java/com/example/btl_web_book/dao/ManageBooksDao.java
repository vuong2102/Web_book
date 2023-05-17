package com.example.btl_web_book.dao;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.model.Order;
import com.example.btl_web_book.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManageBooksDao {
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO products  (name, category, price, image, description, quantityInStore) VALUES (?, ?, ?, ?, ?, ?);";
    private static final String SELECT_PRODUCT_BY_ID = "select name, category, price, image, description,quantityInStore  from products where id =?";
    private static final String SELECT_ALL_PRODUCTS = "select * from products";
    private static final String DELETE_PRODUCTS_SQL = "delete from products where id = ?;";
    private static final String UPDATE_PRODUCTS_SQL = "update products set name = ?, category = ?, price = ?, image= ?, description= ?, quantityInStore = ? where id = ?;";

    public ManageBooksDao(Connection connection) {
    }
    public void insertBook(Product product) throws SQLException, ClassNotFoundException {
        try(Connection con = JDBCConnect.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(INSERT_PRODUCT_SQL)) {
            preparedStatement.setString(1,product.getName());
            preparedStatement.setString(2, product.getCategory());
            preparedStatement.setDouble(3,product.getPrice());
            preparedStatement.setString(4,product.getImage());
            preparedStatement.setString(5,product.getDescription());
            preparedStatement.setInt(6,product.getQuantityInStore());
            preparedStatement.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public boolean updateBook(Product product) throws SQLException,ClassNotFoundException{
        boolean updated;
        try(Connection con =JDBCConnect.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(UPDATE_PRODUCTS_SQL)) {
            preparedStatement.setString(1,product.getName());
            preparedStatement.setString(2, product.getCategory());
            preparedStatement.setDouble(3,product.getPrice());
            preparedStatement.setString(4,product.getImage());
            preparedStatement.setString(5,product.getDescription());
            preparedStatement.setInt(6,product.getQuantityInStore());
            preparedStatement.setInt(7,product.getId());
            updated = preparedStatement.executeUpdate() > 0;
        } return updated;
    }
    public Product selectProduct(int id) throws SQLException,ClassNotFoundException{
        Product product = null;
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);){
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String category = resultSet.getString("category");
                Double price = resultSet.getDouble("price");
                String image =  resultSet.getString("image");
                String description = resultSet.getString("description");
                int quantityInStore = resultSet.getInt("quantityInStore");
                product = new Product(id,name,category,price,image,description,quantityInStore);
            }
        } catch (SQLException e){
            printSQLException(e);
        }return product;
    }
    public List<Product> selectAllProducts() throws SQLException,ClassNotFoundException{
        List<Product> products = new ArrayList<>();
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)){
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                Double price = resultSet.getDouble("price");
                String description=  resultSet.getString("description");
                String category = resultSet.getString("category");
                int quantityInStore = resultSet.getInt("quantityInStore");
                products.add(new Product(id,name,category,price,image,description,quantityInStore));

            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }
    public List<Product> selectPaginationProducts(int startP) throws SQLException,ClassNotFoundException{
        List<Product> productList = new ArrayList<>();
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from products limit ?,?;")){
            preparedStatement.setInt(1,(startP-1)*15);
            preparedStatement.setInt(2,15);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                Double price = resultSet.getDouble("price");
                String description=  resultSet.getString("description");
                String category = resultSet.getString("category");
                int quantityInStore = resultSet.getInt("quantityInStore");
                productList.add(new Product(id,name,category,price,image,description,quantityInStore));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return productList;
    }
    public boolean deleteBook(int id) throws SQLException,ClassNotFoundException {
        boolean rowDeleted;
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCTS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

