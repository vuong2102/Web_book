package com.example.btl_web_book.dao;

import com.example.btl_web_book.model.Warehouse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ManageWareHouseDao {
    private final Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    public ManageWareHouseDao(Connection con) {
        this.con = con;
    }
    public void capNhatThongTinSanPham(Warehouse wareHouse){
        Warehouse warehouse = new Warehouse();
        boolean update = false;
        try{
            query = "update warehouse set sold = ?, inventory = ? where product_id =?";
            pst = this.con.prepareStatement(query);
            pst.setInt(3, wareHouse.getProductId());
            pst.setInt(1, wareHouse.getSold());
            pst.setInt(2, wareHouse.getInventory());
            update = pst.executeUpdate() > 0;
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    public int laySoLuongTonKhoCuaMotSanPham(int product_id){
        Warehouse warehouse = new Warehouse();
        boolean update = false;
        int soLuong = 0;
        try{
            query = "select inventory from warehouse where product_id = ?;";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, product_id);
            rs = pst.executeQuery();
            while (rs.next()){
                soLuong = rs.getInt("inventory");
            }
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        return soLuong;
    }
    public int laySoLuongDaBanCuaMotSanPham(int product_id){
        Warehouse warehouse = new Warehouse();
        boolean update = false;
        int soLuong = 0;
        try{
            query = "select sold from warehouse where product_id = ?;";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, product_id);
            rs = pst.executeQuery();
            while (rs.next()){
                soLuong = rs.getInt("sold");
            }
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        return soLuong;
    }
}
