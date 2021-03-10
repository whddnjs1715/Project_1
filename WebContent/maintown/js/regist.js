'use strict';

const sendit = function (){
    
    const t_name = document.getElementById('t_name');
    const t_select1 = document.getElementById('t_select1');
    const t_select2 = document.getElementById('t_select2');
    const sample6_address = document.getElementById('sample6_address');
    const sample6_detailAddress = document.getElementById('sample6_detailAddress');
    const t_hp = document.getElementById('t_hp');    
    const t_web = document.getElementById('t_web');
    const t_content = document.getElementById('t_content');
    
      
    
    const expNameText = /[가-힣]+$/;
    const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+/;
    const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
   

    if(t_name.value == ''){
        alert('상호명을 입력하세요.');
        t_name.focus();
        return false;   
    }   
    
    if(t_select1.value == ''){
        alert('업종을 선택해주세요.');
        t_select1.focus();
        return false;   
    }  
    
    if(t_select2.value == ''){
        alert('상세 업종을 입력하세요.');
        t_select2.focus();
        return false;   
    }        
    
    if(expNameText.test(t_select2.value) == false){
        alert('한글로 입력해주세요.');
        t_select2.focus();
        return false;
    }
    
    if(sample6_address.value == ''){
        alert('주소를 검색하세요.');
        sample6_address.focus();
        return false;
    }
    
    if(sample6_detailAddress.value == ''){
        alert('상세주소를 입력하세요.');
        sample6_detailAddress.focus();
        return false;
    }
    
    if(t_hp.value == ''){
        alert('전화번호를 입력하세요.');
        t_hp.focus();
        return false;   
    }  
    
    if(expHpText.test(t_hp.value) == false){
        alert('전화번호 형식을 확인하세요.');
        t_hp.focus();
        return false;
    }     
    
    if(t_content.value == ''){
        alert('업체 소개를 입력해주세요.');
        t_content.focus();
        return false;   
    }  

    return true;
}

function getSelectValue(input) {
	document.getElementById("t_select1").value = input;
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            
            var addr = ''; 
            var extraAddr = ''; 
            
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }    
                        
            document.getElementById("sample6_address").value = addr;            
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}



