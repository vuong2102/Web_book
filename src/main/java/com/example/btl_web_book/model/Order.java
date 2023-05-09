package com.example.btl_web_book.model;

public class Order extends Product{
    private int orderId;
    private int userId;
    private int quantity;
    private String date;

    public Order() {
    }
    public Order(int id, String name, String category, Double price, String image, int orderId, int userId, int quantity, String date) {
        super(id, name, category, price, image);
        this.orderId = orderId;
        this.userId = userId;
        this.quantity = quantity;
        this.date = date;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
