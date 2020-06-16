package get;

import connect.ConnectDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.ChiTietHoaDon;

public class ChiTietHoaDonGet{
    public ConnectDB connectDB;
    
    public int insertChiTietHoaDon(ChiTietHoaDon cthd) {
        int i = -1;
        try {
            connectDB = new ConnectDB();
            String sql = "insert into chitiethoadon(id_hoadon, id_sanpham, gia, kichco, soluong) values(?,?,?,?,?)";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ps.setInt(1, cthd.getId_hoadon());
            ps.setInt(2, cthd.getId_sanpham());
            ps.setInt(3, cthd.getGia());
            ps.setString(4, cthd.getKichco());
            ps.setInt(5, cthd.getSoluong());
            i = ps.executeUpdate();
            return i;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return i;
    }
    
    public ArrayList<ChiTietHoaDon> getChiTietHoaDonById(int id_hoadon){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from chitiethoadon where id_hoadon = " + id_hoadon;
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<ChiTietHoaDon> list = new ArrayList<>();
            while(rs.next()){
                ChiTietHoaDon cthd = new ChiTietHoaDon();
                cthd.setId_chitiet(rs.getInt("id_chitiet"));
                cthd.setId_hoadon(rs.getInt("id_hoadon"));
                cthd.setId_sanpham(rs.getInt("id_sanpham"));
                cthd.setGia(rs.getInt("gia"));
                cthd.setKichco(rs.getString("kichco"));
                cthd.setSoluong(rs.getInt("soluong"));
                list.add(cthd);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}