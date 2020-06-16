/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package get;

import connect.ConnectDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.HoaDon;
import model.NhanHieu;

/**
 *
 * @author chinh
 */
public class HoaDonGet {
    public ConnectDB connectDB;
    
    public HoaDon getHoaDonById(int id_hoadon){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from hoadon where id_hoadon = " + id_hoadon;
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            HoaDon hoaDon = new HoaDon();
            while(rs.next()){
                hoaDon.setId_hoadon(rs.getInt("id_hoadon"));
                hoaDon.setId_user(rs.getInt("id_user"));
                hoaDon.setTongtien(rs.getInt("tongtien"));
                hoaDon.setPhuongthucthanhtoan(rs.getString("phuongthucthanhtoan"));
                hoaDon.setDiachi(rs.getString("diachi"));
                hoaDon.setNgaymua(rs.getString("ngaymua"));
                hoaDon.setTen(rs.getString("ten"));
                hoaDon.setSodienthoai(rs.getString("sodienthoai"));
            }
            return hoaDon;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<HoaDon> getHoaDonByUser(int id_user){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from hoadon where id_user = " + id_user;
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<HoaDon> list = new ArrayList<>();
            while(rs.next()){
                HoaDon hoaDon = new HoaDon();
                hoaDon.setId_hoadon(rs.getInt("id_hoadon"));
                hoaDon.setId_user(rs.getInt("id_user"));
                hoaDon.setTongtien(rs.getInt("tongtien"));
                hoaDon.setPhuongthucthanhtoan(rs.getString("phuongthucthanhtoan"));
                hoaDon.setDiachi(rs.getString("diachi"));
                hoaDon.setNgaymua(rs.getString("ngaymua"));
                hoaDon.setTen(rs.getString("ten"));
                hoaDon.setSodienthoai(rs.getString("sodienthoai"));
                list.add(hoaDon);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public int insertHoaDon(HoaDon hoaDon){
        int i = -1;
        try {
            connectDB = new ConnectDB();
            String sql = "insert into hoadon(id_user, tongtien, phuongthucthanhtoan, diachi, ngaymua, ten, sodienthoai) value(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ps.setInt(1, hoaDon.getId_user());
            ps.setInt(2, hoaDon.getTongtien());
            ps.setString(3, hoaDon.getPhuongthucthanhtoan());
            ps.setString(4, hoaDon.getDiachi());
            ps.setString(5, hoaDon.getNgaymua());
            ps.setString(6, hoaDon.getTen());
            ps.setString(7, hoaDon.getSodienthoai());
            i = ps.executeUpdate();
            return i;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return i;
    }
    
    public int getLastIdHoaDon(){
        int i = -1;
        try {
            connectDB = new ConnectDB();
            String sql = "SELECT `AUTO_INCREMENT` - 1 as ID " +
                         "FROM INFORMATION_SCHEMA.TABLES " +
                         "WHERE TABLE_SCHEMA = 'web_ban_hang' " +
                         "AND TABLE_NAME = 'hoadon';";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                i = rs.getInt("ID");
            return i;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return i;
    }
    
    public int getTrangThaiById(int id_hoadon){
        int i = -1;
        try{
            connectDB = new ConnectDB();
            String sql = "select trangthai from hoadon where id_hoadon = ?";
            PreparedStatement ps = connectDB.conn.prepareStatement(sql);
            ps.setInt(1, id_hoadon);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                i = rs.getInt("trangthai");
            }
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
    
    public int setStatusToCanceled(int id_hoadon){
        int i = -1;
        try{
            connectDB = new ConnectDB();
            String sql = "update hoadon set trangthai = 2 where id_hoadon = ?";
            PreparedStatement ps = connectDB.conn.prepareStatement(sql);
            ps.setInt(1, id_hoadon);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
    
    public int setStatusToReceived(int id_hoadon){
        int i = -1;
        try{
            connectDB = new ConnectDB();
            String sql = "update hoadon set trangthai = 4 where id_hoadon = ?";
            PreparedStatement ps = connectDB.conn.prepareStatement(sql);
            ps.setInt(1, id_hoadon);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
    
    public static void main(String[] args) {
        HoaDonGet hoaDonGet = new HoaDonGet();
        System.out.println(hoaDonGet.getLastIdHoaDon());
    }
}
