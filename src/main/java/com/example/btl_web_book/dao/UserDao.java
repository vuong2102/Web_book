package com.example.btl_web_book.dao;


import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDao {
    private Connection con;
    private String query;

    private PreparedStatement pst;
    private ResultSet rs;
    public UserDao(Connection con) {
        this.con = con;
    }
    public User userLogin(String email, String passWord){
        User user = null;
        try{
            query = "select * from users where email=? and passWord=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, passWord);
            rs = pst.executeQuery();

            if(rs.next()){
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("userName"));
                user.setAddress(rs.getString("address"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e){
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return user;
    }
    public void updateUser(User user) throws SQLException, ClassNotFoundException {

        String result = "Successfully";
        String query = "update users set userName = ?, phoneNumber = ?, address = ?, email = ? where id = ?;";
        try(Connection con = JDBCConnect.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(query)){

            preparedStatement.setString(1,user.getUserName());
            preparedStatement.setString(2,user.getPhoneNumber());
            preparedStatement.setString(3,user.getAddress());
            preparedStatement.setString(4,user.getEmail());
            preparedStatement.setInt(5,user.getId());
            preparedStatement.executeUpdate();
            preparedStatement.close();

        }catch (SQLException e){
            e.printStackTrace();
            result = "Failed";
        }
    }


}
