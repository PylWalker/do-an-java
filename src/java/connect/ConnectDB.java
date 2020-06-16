/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author chinh
 */
public class ConnectDB {
    public Connection conn;

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public ConnectDB() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = new String("jdbc:mysql://localhost:3306/web_ban_hang?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
            try{
                conn = DriverManager.getConnection(url, "root", "");
                System.out.println("Kết nối thành công!!!");
            } catch (SQLException e) {
                System.out.println("Lỗi kết nối!!!");
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            System.out.println("Không thể kết nối cơ sở dữ liệu!!!");
            e.printStackTrace();
        }
    }

//    Debug
    public static void main(String[] args){
        new ConnectDB();
    }
}
