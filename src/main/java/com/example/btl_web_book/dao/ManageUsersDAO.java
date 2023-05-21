package com.example.btl_web_book.dao;

import com.example.btl_web_book.connection.JDBCConnect;
import com.example.btl_web_book.model.User;
import com.mysql.cj.jdbc.JdbcConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManageUsersDAO {

    private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (userName, phoneNumber, address, email, password, role) VALUES " + " (?, ?, ?, ?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select userName, phoneNumber, address, email, password, role from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String SELECT_PAGINATION_USERS = "select * from users LIMIT ?,?;";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set userName = ?, phoneNumber = ?, address = ?, email =?, passWord = ?, role = ? where id = ?;";
    public ManageUsersDAO(Connection connection) {
    }

    public void insertUser(User user) throws SQLException, ClassNotFoundException {
        try(Connection con = JDBCConnect.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1,user.getUserName());
            preparedStatement.setString(2,user.getPhoneNumber());
            preparedStatement.setString(3,user.getAddress());
            preparedStatement.setString(4,user.getEmail());
            preparedStatement.setString(5,user.getPassWord());
            preparedStatement.setString(6,user.getRole());
            preparedStatement.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public boolean updateUser(User user) throws SQLException,ClassNotFoundException{
        boolean updated;
        try(Connection con =JDBCConnect.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(UPDATE_USERS_SQL)) {

            preparedStatement.setString(1,user.getUserName());
            preparedStatement.setString(2,user.getPhoneNumber());
            preparedStatement.setString(3,user.getAddress());
            preparedStatement.setString(4,user.getEmail());
            preparedStatement.setString(5,user.getPassWord());
            preparedStatement.setString(6,user.getRole());
            preparedStatement.setInt(7,user.getId());
            updated = preparedStatement.executeUpdate() > 0;
        } return updated;
    }
    public User selectUser(int id) throws SQLException,ClassNotFoundException{
        User user = null;
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);){
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String userName = resultSet.getString("userName");
                String phoneNumber = resultSet.getString("phoneNumber");
                String address = resultSet.getString("address");
                String email =  resultSet.getString("email");
                String password = resultSet.getString("passWord");
                String role = resultSet.getString("role");
                user = new User(id,userName,phoneNumber,address,email,password,role);
            }
        } catch (SQLException e){
            printSQLException(e);
        }return user;
    }
    public List<User> selectPaginationUsers(int startP) throws SQLException,ClassNotFoundException{
        List<User> users = new ArrayList<>();
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from users limit ?,?")){
            System.out.println(preparedStatement);
            preparedStatement.setInt(1,(startP-1)*15);
            preparedStatement.setInt(2,15);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String userName = resultSet.getString("userName");
                String phoneNumber = resultSet.getString("phoneNumber");
                String address = resultSet.getString("address");
                String email =  resultSet.getString("email");
                String password = resultSet.getString("passWord");
                String role = resultSet.getString("role");
                users.add(new User(id,userName,phoneNumber,address,email,password,role));
            }
        } catch (SQLException e){
            printSQLException(e);
        }
        return users;
    }
    public List<User> selectAllUsers() throws SQLException,ClassNotFoundException{
        List<User> users = new ArrayList<>();
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)){
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String userName = resultSet.getString("userName");
                String phoneNumber = resultSet.getString("phoneNumber");
                String address = resultSet.getString("address");
                String email =  resultSet.getString("email");
                String password = resultSet.getString("passWord");
                String role = resultSet.getString("role");
                users.add(new User(id,userName,phoneNumber,address,email,password,role));

            }
        } catch (SQLException e){
            printSQLException(e);
        }
        return users;
    }
    public boolean deleteUser(int id) throws SQLException,ClassNotFoundException {
        boolean rowDeleted;
        try (Connection connection = JDBCConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
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
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
