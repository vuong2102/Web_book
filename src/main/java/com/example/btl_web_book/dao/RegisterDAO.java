package com.example.btl_web_book.dao;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDAO {

    public String insert(User user) throws SQLException, ClassNotFoundException {

        String result = "Succesfully";
        String insertQuery = "INSERT INTO users" + "  (userName,phoneNumber,address,email,password,role) VALUES " +
                " (?, ?, ?, ?, ?, ?);";
        try(Connection con = JDBCConnect.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(insertQuery)){

            preparedStatement.setString(1,user.getUserName());
            preparedStatement.setString(2,user.getPhoneNumber());
            preparedStatement.setString(3,user.getAddress());
            preparedStatement.setString(4,user.getEmail());
            preparedStatement.setString(5,user.getPassWord());
            preparedStatement.setString(6,user.getRole());
            preparedStatement.executeUpdate();


        }
        catch (Exception e){
            e.printStackTrace();
            result = "Register Failed";
        }
        return result;
    }
    public boolean existedEmail(String email){
        String sql ="select * from users where email = ?";
        try{
            Connection con = JDBCConnect.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1,email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

}
