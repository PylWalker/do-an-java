function check_lh(){
    var check_full_name = /^[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?0123456789]*$/;
    var check_email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    var full_name = document.getElementById("full_name").value;
    var email = document.getElementById("email").value;

    if (full_name == "") {
            document.getElementById("er_full_name").innerHTML="Nhập họ tên";
            return false;
    }else if(check_full_name.test(full_name)){
            document.getElementById("er_full_name").innerHTML="Sai định dạng họ tên";
            return false;
    }else{
            document.getElementById("er_full_name").style.display="none";
    }

    if(email = ""){
        document.getElementById("er_emails").innerHTML="Nhập email";
        return false;
    } else if(!check_email.test(email)){
            document.getElementById("er_email").innerHTML="Sai định dạng email";
            return false;
    } else{
        document.getElementById("er_email").style.display="none";
        alert("Gửi liên hệ thành công")
    }
    
}