function check_pay(){
	var check_full_name = /^[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?0123456789]*$/;
	var check_phone_number = /^([0-9]{10})+$/;
	var check_address = /^[!@#$%^&*()_+\=\[\]{};':"\\|.<>\/?]*$/;

	var full_name = document.getElementById("full_name").value;
	var phone = document.getElementById("phone").value;
	var address = document.getElementById("address").value;

	if (full_name == "") {
		document.getElementById("er_full_name").innerHTML="Nhập họ tên";
		return false;
	}else if(check_full_name.test(full_name)){
		document.getElementById("er_full_name").innerHTML="Sai định dạng họ tên";
		return false;
	}else{
		document.getElementById("er_full_name").style.display="none";
	}

	if(phone==""){
		document.getElementById("er_phone").innerHTML="Nhập số điện thoại";
		return false;
	}else if (!check_phone_number.test(phone)) {
		document.getElementById("er_phone").innerHTML="Sai định dạng số điện thoại";
		return false;
	}else{
		document.getElementById("er_phone").style.display="none";
	}	
	if(address==""){
		document.getElementById("er_address").innerHTML="Nhập địa chỉ";
		return false;
	}else if (check_address.test(address)) {
		document.getElementById("er_address").innerHTML="Sai định dạng địa chỉ";
		return false;
	}else{
		document.getElementById("er_address").style.display="none";
	}

}
function check_pay1(){
	var check_full_name = /^[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?0123456789]*$/;
	var check_phone_number = /^([0-9]{16})+$/;
	var check_address = /^[!@#$%^&*()_+\=\[\]{};':"\\|.<>\/?1234567890qwertyuioplkjhgfdsazxcvbnm]*$/;
        var check_name = /^([QWERTYUIOPLKJHGFDSAZXCVBNM ])+$/;

	var card_number0 = document.getElementById("card_number0").value;
	var name = document.getElementById("name0").value;


	if(card_number0==""){
		document.getElementById("er_card_number").innerHTML="Nhập số thẻ";
		return false;
	}
        else if (!check_phone_number.test(card_number0)) {
		document.getElementById("er_card_number").innerHTML="Sai định dạng thẻ";
		return false;
	}else{
		document.getElementById("er_card_number").style.display="none";
	}	
        if(name==""){
		document.getElementById("er_name").innerHTML="Nhập tên trên thẻ";
		return false;
	}
        else if (check_address.test(name)) {
		document.getElementById("er_name").innerHTML="Sai định dạng tên thẻ";
		return false;
	}else{
		document.getElementById("er_name").style.display="none";
	}
	

}