package model;

public class DanhGia {
    public int id_danhgia;
    public int id_sanpham;
    public String tendanhgia;
    public String emaildanhgia;
    public int sao;
    public String thongdiep;

    public int getId_danhgia() {
        return id_danhgia;
    }

    public void setId_danhgia(int id_danhgia) {
        this.id_danhgia = id_danhgia;
    }

    public int getId_sanpham() {
        return id_sanpham;
    }

    public void setId_sanpham(int id_sanpham) {
        this.id_sanpham = id_sanpham;
    }

    public String getTendanhgia() {
        return tendanhgia;
    }

    public void setTendanhgia(String tendanhgia) {
        this.tendanhgia = tendanhgia;
    }

    public String getEmaildanhgia() {
        return emaildanhgia;
    }

    public void setEmaildanhgia(String emaildanhgia) {
        this.emaildanhgia = emaildanhgia;
    }

    public int getSao() {
        return sao;
    }

    public void setSao(int sao) {
        this.sao = sao;
    }

    public String getThongdiep() {
        return thongdiep;
    }

    public void setThongdiep(String thongdiep) {
        this.thongdiep = thongdiep;
    }

    public DanhGia(int id_danhgia, int id_sanpham, String tendanhgia, String emaildanhgia, int sao, String thongdiep) {
        this.id_danhgia = id_danhgia;
        this.id_sanpham = id_sanpham;
        this.tendanhgia = tendanhgia;
        this.emaildanhgia = emaildanhgia;
        this.sao = sao;
        this.thongdiep = thongdiep;
    }
}
