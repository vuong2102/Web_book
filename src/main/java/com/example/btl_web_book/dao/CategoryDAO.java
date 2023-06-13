package com.example.btl_web_book.dao;


import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.model.Category;
import com.example.btl_web_book.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private static final String SELECT_ALL_CATEGORY = " select * from categories;";
    public CategoryDAO(Connection connection) throws ClassNotFoundException {

    }
    public List<Category> selectAllCategory() {
        List<Category>  categories = new ArrayList<>();
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY)){
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                categories.add(new Category(id,name));
            }
        } catch (SQLException | ClassNotFoundException e){
        }
        return categories;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        CategoryDAO categoryDAO =new CategoryDAO(JDBCConnect.getConnection());
        List<Category> list = categoryDAO.selectAllCategory();
        for(Category c: list){
            System.out.println(c.getName());
        }

    }
}
