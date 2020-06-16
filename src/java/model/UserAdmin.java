package model;

public class UserAdmin {
    public int user_ad_id;
    public String user_ad_email;
    public String user_ad_pass;

    public int getUser_ad_id() {
        return user_ad_id;
    }

    public void setUser_ad_id(int user_ad_id) {
        this.user_ad_id = user_ad_id;
    }

    public String getUser_ad_email() {
        return user_ad_email;
    }

    public void setUser_ad_email(String user_ad_email) {
        this.user_ad_email = user_ad_email;
    }

    public String getUser_ad_pass() {
        return user_ad_pass;
    }

    public void setUser_ad_pass(String user_ad_pass) {
        this.user_ad_pass = user_ad_pass;
    }

    public UserAdmin(int user_ad_id, String user_ad_email, String user_ad_pass) {
        this.user_ad_id = user_ad_id;
        this.user_ad_email = user_ad_email;
        this.user_ad_pass = user_ad_pass;
    }
}
