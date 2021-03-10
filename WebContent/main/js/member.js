'use strict';

const sendit = function (){
    const username = document.getElementById('username');
    const userpw = document.getElementById('userpw');
    const userpw_re = document.getElementById('userpw_re');
    const ssn1 = document.getElementById('ssn1');
    const ssn2 = document.getElementById('ssn2');
    const hp = document.getElementById('hp');
    const email = document.getElementById('email');
    const checkbox = document.getElementsByName('checkbox');
  
    const expPwText = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
    const expNameText = /[가-힣]+$/;
    const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+/;
    const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;

    if(username.value == ''){
        alert('이름을 입력하세요.');
        username.focus();
        location.href='regist.jsp';
        return false;
    }
    if(expNameText.test(username.value) == false){
        alert('이름 형식을 확인하세요.');
        username.focus();
        location.href='regist.jsp';
        return false;
    }
    if(userpw.value == ''){
        alert('비밀번호를 입력하세요.');
        userpw.focus();
        location.href='regist.jsp';
        return false;
    }
    if(userpw.value.length < 4 || userpw.value.length > 20){
        alert('비밀번호를 4자이상 20자 이하로 입력하세요.');
        userpw.focus();
        location.href='regist.jsp';
        return false;
    }
    if(expPwText.test(userpw.value) == false){
        alert('비밀번호 형식을 확인하세요.');
        userpw.focus();
        location.href='regist.jsp';
        return false;
    }
    if(userpw.value != userpw_re.value){
        alert('비밀번호와 비밀번호 확인의 값이 다릅니다.');
        userpw.focus();
        location.href='regist.jsp';
        return false;
    }
    if(expHpText.test(hp.value) == false){
        alert('휴대폰 번호 형식을 확인하세요.');
        hp.focus();
        location.href='regist.jsp';
        return false;
    }
    if(email.value == ''){
        alert('이메일을 입력하세요.');
        email.focus();
        location.href='regist.jsp';
        return false;
    }
    if(expEmailText.test(email.value) == false){
        alert('이메일 형식을 확인하세요.');
        email.focus();
        location.href='regist.jsp';
        return false;
    }
    if(checkbox.checked == ''){
    	location.href='regist.jsp';
    	return false;
    }
    return true;
}

const moveFocus = function(){
    const ssn1 = document.getElementById('ssn1');
    if(ssn1.value.length >= 6){
        document.getElementById('ssn2').focus();
    }
}

const ssnCheck = function(){
    if(ssn1.value == '' || ssn2.value == ''){
        alert('생년월일을 입력하세요.');
        ssn1.focus();
        return false;
    }

}


