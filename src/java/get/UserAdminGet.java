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
import model.Users;

/**
 *
 * @author chinh
 */
public class UserAdminGet {
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
   
   public static void main(String[] args){
       UserAdminGet userAdminGet = new UserAdminGet();
       ArrayList<Users> list = userAdminGet.getUsers();
        for (int i = 0;i<list.size();i++){
            System.out.println("No. " + (i + 1));
            System.out.println(list.get(i).toString());
        }
   }
}
