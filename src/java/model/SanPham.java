package model;

public class SanPham {
    public int id_sanpham;
    public int id_theloai;
    public String tensanpham;
    public int id_nhanhieu;
    public String anh;
    public int gia;
    public String mieuta;

    public SanPham() {
    }

    public int getId_sanpham() {
        return id_sanpham;
    }

    public void setId_sanpham(int id_sanpham) {
        this.id_sanpham = id_sanpham;
    }

    public int getId_theloai() {
        return id_theloai;
    }

    public void setId_theloai(int id_theloai) {
        this.id_theloai = id_theloai;
    }

    public String getTensanpham() {
        return tensanpham;
    }

    public void setTensanpham(String tensanpham) {
        this.tensanpham = tensanpham;
    }

    public int getId_nhanhieu() {
        return id_nhanhieu;
    }

    public void setId_nhanhieu(int id_nhanhieu) {
        this.id_nhanhieu = id_nhanhieu;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public String getMieuta() {
        return mieuta;
    }

    public void setMieuta(String mieuta) {
        this.mieuta = mieuta;
    }

    public SanPham(int id_sanpham, int id_theloai, String tensanpham, int id_nhanhieu, String anh, int gia, String mieuta) {
        this.id_sanpham = id_sanpham;
        this.id_theloai = id_theloai;
        this.tensanpham = tensanpham;
        this.id_nhanhieu = id_nhanhieu;
        this.anh = anh;
        this.gia = gia;
        this.mieuta = mieuta;
    }
}
