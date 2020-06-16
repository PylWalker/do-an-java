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
import model.NhanHieu;

/**
 *
 * @author chinh
 */
public class NhanHieuGet {
    public ConnectDB connectDB;
    
    public NhanHieu getNhanHieuById(int id_nhanhieu){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from nhanhieu where id_nhanhieu = " + id_nhanhieu;
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            NhanHieu nhanHieu = new NhanHieu();
            while(rs.next()){
                nhanHieu.setId_nhanhieu(id_nhanhieu);
                nhanHieu.setTenhang(rs.getString("ten_hang"));
            }
            return nhanHieu;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
