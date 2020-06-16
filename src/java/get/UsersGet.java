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
import model.Users;

/**
 *
 * @author chinh
 */
public class UsersGet {
    public ConnectDB connectDB;
    
    public ArrayList<Users> getUsers(){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from users";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Users> list = new ArrayList<>();
            while(rs.next()){
                Users user = new Users();
                user.setId_user(rs.getInt("id_user"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_pass(rs.getString("user_pass"));
                user.setUser_phone(rs.getString("user_phone"));
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public int countID(){
        int tmp = 0;
        try{
            connectDB = new ConnectDB();
            String sql = "select count(*) as id from users";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                tmp = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tmp;
    }
    
    public Users login(String user_email, String user_pass){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from users where user_email = '" + user_email + "' and user_pass = '" + user_pass + "'";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Users user = new Users();
                user.setId_user(rs.getInt("id_user"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_pass(rs.getString("user_pass"));
                user.setUser_phone(rs.getString("user_phone"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public int insertUser(Users user) {
        int i = -1;
        try {
            connectDB = new ConnectDB();
            String sql = "INSERT INTO users VALUES(?,?,?,?,?)";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ps.setInt(1, user.getId_user());
            ps.setString(2, user.getUser_name());
            ps.setString(3, user.getUser_email());
            ps.setString(4, user.getUser_pass());
            ps.setString(5, user.getUser_phone());
            i = ps.executeUpdate();
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(UsersGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
    
    public int updateUser(Users user) {
        int i = -1;
        try {
            connectDB = new ConnectDB();
            String sql = "update users set user_name = ?, user_pass = ?, user_phone = ? where user_id = ?";
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ps.setString(1, user.getUser_name());
            ps.setString(2, user.getUser_pass());
            ps.setString(3, user.getUser_phone());
            ps.setInt(4, user.getId_user());
            i = ps.executeUpdate();
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(UsersGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
    
    public static void main(String[] args){
        UsersGet usersGet = new UsersGet();
        Users user = new Users();
        user.setUser_name("pylwalker");
        user.setUser_email("pylwalker@gmail.com");
        user.setUser_pass("pylwalker");
        user.setUser_phone("0918516036");
        System.out.println(usersGet.insertUser(user));
    }
    
    public Users getInfo(int id_user){
        try{
            connectDB = new ConnectDB();
            String sql = "select * from users where id_user = " + id_user;
            PreparedStatement ps = connectDB.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Users user = new Users();
                user.setId_user(rs.getInt("id_user"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_pass(rs.getString("user_pass"));
                user.setUser_phone(rs.getString("user_phone"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
