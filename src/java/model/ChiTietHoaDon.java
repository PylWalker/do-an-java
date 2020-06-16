package model;

public class ChiTietHoaDon {
    public int id_chitiet;
    public int id_hoadon;
    public int id_sanpham;
    public int gia;
    public String kichco;
    public int soluong;

    public int getId_chitiet() {
        return id_chitiet;
    }

    public void setId_chitiet(int id_chitiet) {
        this.id_chitiet = id_chitiet;
    }

    public int getId_hoadon() {
        return id_hoadon;
    }

    public void setId_hoadon(int id_hoadon) {
        this.id_hoadon = id_hoadon;
    }

    public int getId_sanpham() {
        return id_sanpham;
    }

    public void setId_sanpham(int id_sanpham) {
        this.id_sanpham = id_sanpham;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public String getKichco() {
        return kichco;
    }

    public void setKichco(String kichco) {
        this.kichco = kichco;
    }

    public ChiTietHoaDon(int id_hoadon, int id_sanpham, int gia, String kichco, int soluong) {
        this.id_hoadon = id_hoadon;
        this.id_sanpham = id_sanpham;
        this.gia = gia;
        this.kichco = kichco;
        this.soluong = soluong;
    }

    public ChiTietHoaDon(){}
}
