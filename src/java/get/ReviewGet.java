/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package get;

//import connect.DBConnect;
import connect.ConnectDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
//import model.Category;
import model.SanPham;
import model.Review;

/**
 *
 * @author NguyenDang
 */
public class ReviewGet {
    
    ConnectDB connectDB;
    
    public boolean insertReview(Review c) {
           connectDB = new ConnectDB();
            String sql = "INSERT INTO danhgia(id_sanpham,sao) VALUES(?,?)";
            try {
                PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
             ps.setInt(1, c.getId_sanpham());
             ps.setInt(2, c.getSao());
                return ps.executeUpdate() == 1;
            } catch (SQLException ex) {
                Logger.getLogger(ReviewGet.class.getName()).log(Level.SEVERE, null, ex);
            }
            return false;
        }
  
}
