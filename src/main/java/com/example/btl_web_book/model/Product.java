package com.example.btl_web_book.model;

public class Product {
    private int id;
    private String name;
    private String category;
    private Double price;
    private String image;
    private String description;
    private int quantityInStore;
    public int getQuantityInStore() {
        return quantityInStore;
    }
    public void setQuantityInStore(int quantityInStore) {
        this.quantityInStore = quantityInStore;
    }

    public Product() {
    }
    public Product(int id, String name, String category, Double price, String image, String description, int quantityInStore) {
        super();
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
        this.description = description;
        this.quantityInStore = quantityInStore;
    }
    public Product(String name, String category, double price, String image, String description, int quantityInStore) {
        super();
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
        this.description = description;
        this.quantityInStore = quantityInStore;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public Double getPrice() {
        return price;
    }
    public void setPrice(Double price) {
        this.price = price;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", category='" + category + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                '}';
    }
}
