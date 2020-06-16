package model;

public class TheLoai {
    public int id_theloai;
    public String tentheloai;

    public int getId_theloai() {
        return id_theloai;
    }

    public void setId_theloai(int id_theloai) {
        this.id_theloai = id_theloai;
    }

    public String getTentheloai() {
        return tentheloai;
    }

    public void setTentheloai(String tentheloai) {
        this.tentheloai = tentheloai;
    }

    public TheLoai(int id_theloai, String tentheloai) {
        this.id_theloai = id_theloai;
        this.tentheloai = tentheloai;
    }
}
