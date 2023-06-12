package com.example.btl_web_book.dao;

import com.example.btl_web_book.model.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    public CommentDao(Connection con){
        this.con = con;
    }

    public void insertComment(Comment comment){
        boolean result = false;
        try{
            query = "insert into comments (comment, id_product, id_user) values(?, ?, ?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, comment.getComment());
            pst.setInt(2, comment.getIdProduct());
            pst.setInt(3, comment.getIdUser());
            pst.executeUpdate();
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public List<Comment> getAllCommentByIdProduct(int idProduct){
        boolean result = false;
        List<Comment> commentList = new ArrayList<>();
        try{
            query = "select * from comments where id_product = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, idProduct);
            rs = pst.executeQuery();
            while(rs.next()){
                Comment comment = new Comment();
                comment.setIdProduct(rs.getInt("id_product"));
                comment.setIdUser(rs.getInt("id_user"));
                comment.setComment(rs.getString("comment"));
                comment.setId(rs.getInt("id"));
                commentList.add(comment);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return commentList;
    }
}
