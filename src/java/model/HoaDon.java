package model;

public class HoaDon {
    public int id_hoadon;
    public int id_user;
    public int tongtien;
    public String phuongthucthanhtoan;
    public String diachi;
    public String ngaymua;
    public String ten;
    public String sodienthoai;
    public int trangthai;

    public HoaDon() {}

    public int getId_hoadon() {
        return id_hoadon;
    }

    public void setId_hoadon(int id_hoadon) {
        this.id_hoadon = id_hoadon;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getTongtien() {
        return tongtien;
    }

    public void setTongtien(int tongtien) {
        this.tongtien = tongtien;
    }

    public String getPhuongthucthanhtoan() {
        return phuongthucthanhtoan;
    }

    public void setPhuongthucthanhtoan(String phuongthucthanhtoan) {
        this.phuongthucthanhtoan = phuongthucthanhtoan;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getNgaymua() {
        return ngaymua;
    }

    public void setNgaymua(String ngaymua) {
        this.ngaymua = ngaymua;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getSodienthoai() {
        return sodienthoai;
    }

    public void setSodienthoai(String sodienthoai) {
        this.sodienthoai = sodienthoai;
    }

    public int getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(int trangthai) {
        this.trangthai = trangthai;
    }

    public HoaDon(int id_user, int tongtien, String phuongthucthanhtoan, String diachi, String ngaymua, String ten, String sodienthoai) {
        this.id_user = id_user;
        this.tongtien = tongtien;
        this.phuongthucthanhtoan = phuongthucthanhtoan;
        this.diachi = diachi;
        this.ngaymua = ngaymua;
        this.ten = ten;
        this.sodienthoai = sodienthoai;
        this.trangthai = 0;
    }
    
    
}
