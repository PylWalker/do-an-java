package get;

import connect.ConnectDB;
import java.sql.Connection;
import model.SanPham;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.logging.ErrorManager;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SanPhamGet {
    public ConnectDB connectDB;

    public ArrayList<SanPham> getSanPham(){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from sanpham";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public SanPham getProductt(int id_sanpham) throws SQLException {
     connectDB = new ConnectDB();
     String sql = "SELECT * FROM sanpham WHERE id_sanpham = '" + id_sanpham + "'";
     PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
     SanPham sanPham = new SanPham();
     while (rs.next()) {
          sanPham.setId_sanpham(rs.getInt("id_sanpham"));
          sanPham.setId_theloai(rs.getInt("id_theloai"));
            sanPham.setTensanpham(rs.getString("tensanpham"));
            sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
            sanPham.setAnh(rs.getString("anh"));
            sanPham.setGia(rs.getInt("gia"));
            sanPham.setMieuta(rs.getString("mieuta"));
     }
     return sanPham;
}

    
    public ArrayList<SanPham> getSanPham(String sortKey){
        try{
            connectDB = new ConnectDB();
            String sql = "";
            switch(sortKey){
                case "bestseller":
                    sql = "select * from sanpham";
                    break;
                case "newest":
                    sql = "select * from sanpham order by id_sanpham desc";
                    break;
                case "maxtomin":
                    sql = "select * from sanpham order by gia desc";
                    break;
                case "mintomax":
                    sql = "select * from sanpham order by gia asc";
                    break;
                case "atoz":
                    sql = "select * from sanpham order by tensanpham asc";
                    break;
                case "ztoa":
                    sql = "select * from sanpham order by tensanpham desc";
                    break;
            }
            
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public SanPham getSanPhamById(int id_sanpham){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from sanpham where id_sanpham = " + id_sanpham;
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            SanPham sanPham = new SanPham();
            while(rs.next()){
                sanPham.setId_sanpham(id_sanpham);
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
            }
            return sanPham;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<SanPham> getSanPhamMoi(){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from sanpham order by id_sanpham desc limit 4";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int insertSanPham(SanPham sanPham) {
        int tmp = 0;
        try {
            connectDB = new ConnectDB();
            String sql = "insert into sanpham values(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ps.setInt(1, sanPham.id_sanpham);
            ps.setInt(2, sanPham.id_theloai);
            ps.setString(3, sanPham.tensanpham);
            ps.setInt(4, sanPham.id_nhanhieu);
            ps.setString(5, sanPham.anh);
            ps.setInt(6, sanPham.gia);
            ps.setString(7, sanPham.mieuta);
            tmp = ps.executeUpdate();
            if (tmp == 1) {
                System.out.println("Thêm sản phẩm thành công");
            } else {
                System.err.println("Error code: " + tmp);
            }
            return tmp;
        } catch(SQLIntegrityConstraintViolationException ex){
            System.err.println("Trùng khóa chính.");
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return tmp;
    }

    public int updateSanPham(SanPham sanPham) {
        int tmp = 0;
        try {
            connectDB = new ConnectDB();
            String sql = "insert into sanpham values(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ps.setInt(1, sanPham.id_sanpham);
            ps.setInt(2, sanPham.id_theloai);
            ps.setString(3, sanPham.tensanpham);
            ps.setInt(4, sanPham.id_nhanhieu);
            ps.setString(5, sanPham.anh);
            ps.setInt(6, sanPham.gia);
            ps.setString(7, sanPham.mieuta);
            tmp = ps.executeUpdate();
            if (tmp == 1) {
                System.out.println("Thêm sản phẩm thành công");
            } else {
                System.err.println("Error code: " + tmp);
            }
            return tmp;
        } catch(SQLIntegrityConstraintViolationException ex){
            System.err.println("Trùng khóa chính.");
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return tmp;
    }
    
    public ArrayList<SanPham> getAoSoMi(String sortKey){
        try{
            connectDB = new ConnectDB();
            String sql = "";
            switch(sortKey){
                case "":
                    sql = "select * from sanpham where id_theloai = 4";
                    break;
                case "bestseller":
                    sql = "select * from sanpham where id_theloai = 4";
                    break;
                case "newest":
                    sql = "select * from sanpham where id_theloai = 4 order by id_sanpham desc";
                    break;
                case "maxtomin":
                    sql = "select * from sanpham where id_theloai = 4 order by gia desc";
                    break;
                case "mintomax":
                    sql = "select * from sanpham where id_theloai = 4 order by gia asc";
                    break;
                case "atoz":
                    sql = "select * from sanpham where id_theloai = 4 order by tensanpham asc";
                    break;
                case "ztoa":
                    sql = "select * from sanpham where id_theloai = 4 order by tensanpham desc";
                    break;
            }
            
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<SanPham> getAoSoMiMoi(){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from sanpham where id_theloai = 4 order by id_sanpham desc limit 3";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<SanPham> getAoVest(String sortKey){
        try{
            connectDB = new ConnectDB();
            String sql = "";
            switch(sortKey){
                case "":
                    sql = "select * from sanpham where id_theloai = 3";
                    break;
                case "bestseller":
                    sql = "select * from sanpham where id_theloai = 3";
                    break;
                case "newest":
                    sql = "select * from sanpham where id_theloai = 3 order by id_sanpham desc";
                    break;
                case "maxtomin":
                    sql = "select * from sanpham where id_theloai = 3 order by gia desc";
                    break;
                case "mintomax":
                    sql = "select * from sanpham where id_theloai = 3 order by gia asc";
                    break;
                case "atoz":
                    sql = "select * from sanpham where id_theloai = 3 order by tensanpham asc";
                    break;
                case "ztoa":
                    sql = "select * from sanpham where id_theloai = 3 order by tensanpham desc";
                    break;
            }
            
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<SanPham> getAoVestMoi(){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from sanpham where id_theloai = 3 order by id_sanpham desc limit 3";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<SanPham> getAoPhong(String sortKey){
        try{
            connectDB = new ConnectDB();
            String sql = "";
            switch(sortKey){
                case "":
                    sql = "select * from sanpham where id_theloai = 5";
                    break;
                case "bestseller":
                    sql = "select * from sanpham where id_theloai = 5";
                    break;
                case "newest":
                    sql = "select * from sanpham where id_theloai = 5 order by id_sanpham desc";
                    break;
                case "maxtomin":
                    sql = "select * from sanpham where id_theloai = 5 order by gia desc";
                    break;
                case "mintomax":
                    sql = "select * from sanpham where id_theloai = 5 order by gia asc";
                    break;
                case "atoz":
                    sql = "select * from sanpham where id_theloai = 5 order by tensanpham asc";
                    break;
                case "ztoa":
                    sql = "select * from sanpham where id_theloai = 5 order by tensanpham desc";
                    break;
            }
            
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<SanPham> getQuanDai(String sortKey){
        try{
            connectDB = new ConnectDB();
            String sql = "";
            switch(sortKey){
                case "":
                    sql = "select * from sanpham where id_theloai = 1";
                    break;
                case "bestseller":
                    sql = "select * from sanpham where id_theloai = 1";
                    break;
                case "newest":
                    sql = "select * from sanpham where id_theloai = 1 order by id_sanpham desc";
                    break;
                case "maxtomin":
                    sql = "select * from sanpham where id_theloai = 1 order by gia desc";
                    break;
                case "mintomax":
                    sql = "select * from sanpham where id_theloai = 1 order by gia asc";
                    break;
                case "atoz":
                    sql = "select * from sanpham where id_theloai = 1 order by tensanpham asc";
                    break;
                case "ztoa":
                    sql = "select * from sanpham where id_theloai = 1 order by tensanpham desc";
                    break;
            }
            
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<SanPham> getQuanDaiMoi(){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from sanpham where id_theloai = 1 order by id_sanpham desc limit 3";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<SanPham> getQuanShort(String sortKey){
        try{
            connectDB = new ConnectDB();
            String sql = "";
            switch(sortKey){
                case "":
                    sql = "select * from sanpham where id_theloai = 2";
                    break;
                case "bestseller":
                    sql = "select * from sanpham where id_theloai = 2";
                    break;
                case "newest":
                    sql = "select * from sanpham where id_theloai = 2 order by id_sanpham desc";
                    break;
                case "maxtomin":
                    sql = "select * from sanpham where id_theloai = 2 order by gia desc";
                    break;
                case "mintomax":
                    sql = "select * from sanpham where id_theloai = 2 order by gia asc";
                    break;
                case "atoz":
                    sql = "select * from sanpham where id_theloai = 2 order by tensanpham asc";
                    break;
                case "ztoa":
                    sql = "select * from sanpham where id_theloai = 2 order by tensanpham desc";
                    break;
            }
            
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<SanPham> list = new ArrayList<>();
            while(rs.next()){
                SanPham sanPham = new SanPham();
                sanPham.setId_sanpham(rs.getInt("id_sanpham"));
                sanPham.setId_theloai(rs.getInt("id_theloai"));
                sanPham.setTensanpham(rs.getString("tensanpham"));
                sanPham.setId_nhanhieu(rs.getInt("id_nhanhieu"));
                sanPham.setAnh(rs.getString("anh"));
                sanPham.setGia(rs.getInt("gia"));
                sanPham.setMieuta(rs.getString("mieuta"));
                list.add(sanPham);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public int getSao(int id_sanpham){
        int i = -1;
        try{
            connectDB = new ConnectDB();
            String sql = "select avg(sao) as sao from danhgia where id_sanpham = ?";
            PreparedStatement ps = connectDB.conn.prepareStatement(sql);
            ps.setInt(1, id_sanpham);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                i = rs.getInt("sao");
            }
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
    
    public int checkUser(int id_user, int id_sanpham){
        int i = -1;
        try{
            connectDB = new ConnectDB();
            String sql = "select id_user from hoadon " +
                        "inner join chitiethoadon as ct on ct.id_hoadon = hoadon.id_hoadon " +
                        "where id_user = " + id_user + " and ct.id_sanpham = " + id_sanpham;
            PreparedStatement ps = connectDB.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                i = rs.getInt("id_user");
            }
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

//    Debug
//    public static void main(String[] args) {
//        SanPhamGet sanPhamGet = new SanPhamGet();
//        ArrayList<SanPham> list = sanPhamGet.getSanPham();
//        for (int i = 0;i<list.size();i++){
//            System.out.println("No. " + i);
//            System.out.println(list.get(i).toString());
//        }
//        SanPham sanPham = new SanPham(11, 1, "Quan dai", 1, "images/dai", 30000, "Dep");
//        sanPhamGet.insertSanPham(sanPham);
//        System.out.println(sanPhamGet.getSao(31));
//    }
}
