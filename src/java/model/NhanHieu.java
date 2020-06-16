package model;

public class NhanHieu {
    public int id_nhanhieu;
    public String tenhang;

    public NhanHieu() { }

    public int getId_nhanhieu() {
        return id_nhanhieu;
    }

    public void setId_nhanhieu(int id_nhanhieu) {
        this.id_nhanhieu = id_nhanhieu;
    }

    public String getTenhang() {
        return tenhang;
    }

    public void setTenhang(String tenhang) {
        this.tenhang = tenhang;
    }

    public NhanHieu(int id_nhanhieu, String tenhang) {
        this.id_nhanhieu = id_nhanhieu;
        this.tenhang = tenhang;
    }
}
