package com.example.btl_web_book.model;

public class Warehouse {
    private int id;
    private int productId;
    private int sold;
    private int inventory;
    public Warehouse(int id, int productId, int sold, int inventory) {
        this.id = id;
        this.productId = productId;
        this.sold = sold;
        this.inventory = inventory;
    }
    public Warehouse() {
    }
    public Warehouse(int productId, int sold, int inventory) {
        this.productId = productId;
        this.sold = sold;
        this.inventory = inventory;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }
}
