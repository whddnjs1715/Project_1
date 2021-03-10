<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <link rel="stylesheet" href="./css/regist.css" />
   <!--  <script src="./js/member.js"></script> -->
  </head>
  <body>
    <div class="BigRegisterBox">
      <div class="mideumRegisterBox">
        <div class="registerBox">
          <div class="information">본인 정보를 입력해주세요.</div>
          <div class="formBox">
          
            <form name="regform" id="regform" method="post" action="regist_ok.jsp" onsubmit="return sendit()">
              <div class="nameBox">
                <input type="text" placeholder="이름" class="nameBoxInbox" name="username" id="username"/>
              </div>

              <div class="passwordBox">
                <input
                  type="password"
                  placeholder="비밀번호"
                  class="passwordBoxInbox"
                  name="userpw" id="userpw"
                />
              </div>

              <div class="passwordCheckBox">
                <input
                  type="password"
                  placeholder="비밀번호 확인"
                  class="passwordCheckBoxInbox"
                  name="userpw_re" id="userpw_re"
                />
              </div>

              <div class="birthBox">
                <div class="birthBoxInBox">
                  <input
                    type="text"
                    placeholder="생년월일"
                    maxlength="6"
                    class="yearMonthDay"
                    name="ssn1" id="ssn1"
                    onkeyup="moveFocus()"
                  />
                </div>
                <span class="birthBar"></span>
                <div class="birthBoxInBox2">
                  <input type="text" maxlength="1" class="gender" name="ssn2" id="ssn2" />
                  <div class="birthFixedNumber">
                    <span class="FixedNumber"></span>
                    <span class="FixedNumber"></span>
                    <span class="FixedNumber"></span>
                    <span class="FixedNumber"></span>
                    <span class="FixedNumber"></span>
                    <span class="FixedNumber"></span>
                  </div>
                </div>
              </div>

              <div class="numberBox">
                <input
                  type="text"
                  placeholder="휴대폰번호"
                  class="numberBoxInbox"
                  name="hp" id="hp"
                />
              </div>

              <div class="emailBox">
                <input type="text" placeholder="이메일" class="emailBoxInbox" name="email" id="email"/>
              </div>

              <div class="agreeBox">
                <span>개인정보 활용동의</span>
                <div>
                  <input type="checkbox" name="checkbox" value="checkbox"/>
                  <label>동의함</label>
                </div>
              </div>
              <button type="submit" class="nextButton" onclick="location.href='./regist_ok.jsp'">다음</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
