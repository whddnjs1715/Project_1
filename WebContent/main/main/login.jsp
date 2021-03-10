<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>login</title>
  </head>
  <body>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>로그</title>
        <link rel="stylesheet" href="./css/regist_ok.css" />
      </head>
      <body>
        <div class="BigRegisterBox">
          <div class="mideumRegisterBox">
            <div class="registerBox">
              <div class="information">
              <img
              class="icon"
              alt="icon"
              src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/logo-basic-24b18257ac4ef693c02233bf21e9cb7ecbf43ebd8d5b40c24d99e14094a44c81.svg"
              style="height: 50px"
            />
                <br />
              </div>
              <div class="formBox">
                <form name="regform" id="regform" method="post" action="login_ok.jsp">
					<div class="nameBox">
                    <input
                      type="text"
                      placeholder="이메일 주소(필수입력)"
                      class="nameBoxInbox"
                      name="email" id="email"
                      />
                  	</div>
                  <div class="nameBox">
                    <input
                      type="password"
                      placeholder="비밀번호(필수입력)"
                      class="nameBoxInbox"
                      name="userpw" id="userpw"
                    />
                  </div>
                  <button type="submit" class="nextButton">로그인</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
