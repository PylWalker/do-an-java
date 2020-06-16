var kt_mat_khau = /^([A-Za-z0-9]{6,10})+$/;
var kt_ten_dang_nhap = /^([A-Za-z0-9]{6,10})+$/;
var kt_email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
var kt_sdt = /^([0-9]{10})+$/;
function kiem_tra_cap_nhap_tt(){
	var email = document.getElementById("cap_nhap_email").value;
	var sdt = document.getElementById("cap_nhap_sdt").value;
	var mk = document.getElementById("cap_nhap_mk").value;
	var xac_nhan_mk = document.getElementById("cap_nhap_xac_nhan_mk").value;

	if (!kt_email.test(email)) {
		document.getElementById("loi_cap_nhap_email").innerHTML="Email không hợp lệ !";
		return false;

	} else if(kt_email.test(email)){
		document.getElementById("loi_cap_nhap_email").innerHTML="";
		return false;

	}else if (!kt_sdt.test(sdt)) {
		document.getElementById("loi_cap_nhap_sdt").innerHTML="Số điện thoại không hợp lệ !";
		return false;
	}else if (!kt_mat_khau.test(mk)) {
		document.getElementById("loi_cap_nhap_mk").innerHTML="Mật khẩu có độ dài từ 6 - 10 ký tự và không có ký tự đặc biệt !";
		return false;
	}else if (xac_nhan_mk != mk) {
		document.getElementById("loi_cap_nhap_xac_nhan_mk").innerHTML="Xác nhận mật khẩu không đúng !";
		return false;
	}else{
		alert("Cập nhập thông tin thành công.")
	}
}
function replace(){
    window.location.replace('file:///D:/D-Rex/Tot_nghiep/khach_hang/khach_hang.html');
}
