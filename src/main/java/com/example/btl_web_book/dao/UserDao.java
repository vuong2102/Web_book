package com.example.btl_web_book.dao;

import com.example.btl_web_book.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                user.setId(rs.getLong("id"));
                user.setUserName(rs.getString("userName"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
            }
        } catch (Exception e){
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return user;
    }

}
