package model;

public class Users {
    public int id_user;
    public String user_name;
    public String user_email;
    public String user_pass;
    public String user_phone;

    public Users() { }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_pass() {
        return user_pass;
    }

    public void setUser_pass(String user_pass) {
        this.user_pass = user_pass;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public Users(int id_user, String user_name, String user_email, String user_pass, String user_phone) {
        this.id_user = id_user;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_pass = user_pass;
        this.user_phone = user_phone;
    }

    @Override
    public String toString() {
        String str = "ID: " + this.id_user
                + "\nUser_name: " + this.user_name
                + "\nUser_email: " + this.user_email
                + "\nUser_pass: " + this.user_pass
                + "\nUser_phone: " + this.user_phone + "\n\n";
        return str;
    }
    
    
}
