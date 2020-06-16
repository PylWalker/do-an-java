
import connect.ConnectDB;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.LienHe;

public class LienHeGet{
    public ConnectDB connectDB;
    
    public int insertLienHe(LienHe lienHe){
        int i = -1;
        try {
            connectDB = new ConnectDB();
            String sql = "insert into lienhe(ten, email_lienhe, tieude, loinhan) values(?, ?, ?, ?)";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ps.setString(1, lienHe.getTen());
            ps.setString(2, lienHe.getEmail_lienhe());
            ps.setString(3, lienHe.getTieude());
            ps.setString(4, lienHe.getLoinhan());
            i = ps.executeUpdate();
            return i;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return i;
    }
}