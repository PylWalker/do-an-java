/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chinh
 */
public class GioHang {
    public int id_giohang;
    public Users user;
    public List<ItemGioHang> list = new ArrayList<>();
    public int status;

    public int getId_giohang() {
        return id_giohang;
    }

    public void setId_giohang(int id_giohang) {
        this.id_giohang = id_giohang;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public List<ItemGioHang> getList() {
        return list;
    }

    public void setList(List<ItemGioHang> list) {
        this.list = list;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
