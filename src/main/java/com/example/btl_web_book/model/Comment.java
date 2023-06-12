package com.example.btl_web_book.model;

public class Comment {
    private int id;
    private String comment;
    private int idProduct;
    private int idUser;

    public Comment(String comment, int idProduct, int idUser) {
        this.comment = comment;
        this.idProduct = idProduct;
        this.idUser = idUser;
    }

    public Comment() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

}
