package model;

public class LienHe {
    public int id_lienhe;
    public String ten;
    public String email_lienhe;
    public String tieude;
    public String loinhan;
    public String ngaylienhe = "CURRENT_TIMESTAMP";

    public int getId_lienhe() {
        return id_lienhe;
    }

    public void setId_lienhe(int id_lienhe) {
        this.id_lienhe = id_lienhe;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getEmail_lienhe() {
        return email_lienhe;
    }

    public void setEmail_lienhe(String email_lienhe) {
        this.email_lienhe = email_lienhe;
    }

    public String getTieude() {
        return tieude;
    }

    public void setTieude(String tieude) {
        this.tieude = tieude;
    }

    public String getLoinhan() {
        return loinhan;
    }

    public void setLoinhan(String loinhan) {
        this.loinhan = loinhan;
    }

    public String getNgaylienhe() {
        return ngaylienhe;
    }

    public void setNgaylienhe(String ngaylienhe) {
        this.ngaylienhe = ngaylienhe;
    }

    public LienHe(String ten, String email_lienhe, String tieude, String loinhan, String ngaylienhe) {
        this.ten = ten;
        this.email_lienhe = email_lienhe;
        this.tieude = tieude;
        this.loinhan = loinhan;
        this.ngaylienhe = ngaylienhe;
    }
}
