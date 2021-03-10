<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<%@ page import="com.main.fileupload.*" %>
<%@ page import ="com.main.filecount.*" %>

<fmt:requestEncoding value="UTF-8"/>    
<jsp:useBean id="fboardDAO" class="com.main.fileupload.fileuploadDAO"/>
<jsp:useBean class="com.koreait.member.MemberDTO" id="memberDTO" />
<jsp:useBean class="com.koreait.member.MemberDAO" id="memberDAO" />
<jsp:setProperty property="*" name="memberDTO"/>

<c:set var="countColumn" value="${fboardDAO.countColumn()}"/>
<c:set var="fileListidx" value="${fboardDAO.selectListidx()}"/>

<%
	String email = null;
	String name = null;
	if(session.getAttribute("email") != null){
		email = (String)session.getAttribute("email");
		name = (String)session.getAttribute("name");
	}
 
%>
<%
String url = "jdbc:mariadb://localhost:3306/webdev";
String uid = "root";
String upw = "1234";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String mem_email = (String) session.getAttribute("email");
String mem_profilePic = "";
String mem_address3 = "";
String mem_username = "";

try {
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(url, uid, upw);
	if(conn != null){
		
		String sql = "SELECT mem_profilePic, mem_address3, mem_username FROM pj_member WHERE mem_email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mem_email);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			mem_profilePic = rs.getString("mem_profilePic");
			mem_address3 = rs.getString("mem_address3");
			mem_username = rs.getString("mem_username");
		}
	}
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>myPage</title>
    <link rel="stylesheet" href="./css/myPage.css?ver=123" />
     <link rel="stylesheet" href="./css/mypage_object.css?ver=1234">
     <link rel="stylesheet" href="./css/mypage_object_style.css?ver=12345">
      <link rel="stylesheet" href="./css/mypage_object_write.css?ver=123456">
  </head>
  <body>
<% 
	if(email == null){
%>
	
<%		
	}else{
%>
    <header id="fixedBar" class="fixedBarBoxShadow">
      <div id="fixedBarWrap">
        <h1 id="fixedBarLogoTitle">
          <a href="MainPageLogined.jsp">
            <span class="srOnly">캐럿마켓</span>
            <img
              class="fixedLogo"
              alt="당근마켓"
              src="./images/carrot.PNG"
            />
          </a>
        </h1>
        <section id="fixedBarSearch">
          <div class="searchInputWrap">
            <span class="srOnly">검색</span>
            <input
              type="text"
              name="headerSearchInput"
              id="headerSearchInput"
              class="fixedSearchInput"
              placeholder="동네 이름, 물품명 등을 검색해보세요!"
            />
            <button id="headerSearchButton">
              <img
                class="fixedSearchIcon"
                alt="Search"
                src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/search-icon-7008edd4f9aaa32188f55e65258f1c1905d7a9d1a3ca2a07ae809b5535380f14.svg"
              />
            </button>
          </div>
        </section>
        <section id="fixedBarLoginRegist">
          <h3 class="hide">로그아웃/나의캐럿</h3>
          <p>
          <input type="button" value="로그아웃" onclick="location.href='./logout.jsp'" 
          	style="margin-right: 8px;
          	width: 140px;
    		border-radius: 5px;
    		border: solid 1px #e9ecef;
    		box-sizing: border-box;
    		text-decoration: none;
    		display: inline-block;
    		vertical-align: middle;
    		text-align: center;
    		padding: 0.9rem 0;
    		background-color: #none">

          <input type="button" value="나의 당근" onclick="location.href='./myPage.jsp'" 
          	style="margin-right: 8px;
          	width: 140px;
    		border-radius: 5px;
    		border: solid 1px #e9ecef;
    		box-sizing: border-box;
    		text-decoration: none;
    		display: inline-block;
    		vertical-align: middle;
    		text-align: center;
    		padding: 0.9rem 0;">
         </p>
        </section>
      </div>
    </header>

    <section id="content">
      <section id="content">
        <section id="userProfile">
          <h2 id="nickname">
            <%=name %>
            <span id="regionName"><%=mem_address3 %></span>
            <input
              type="button"
              value="정보수정"
              onclick="location.href='./profile.jsp'"
              style="
                margin-right: 8px;
                width: 140px;
                border-radius: 5px;
                border: solid 1px #e9ecef;
                box-sizing: border-box;
                text-decoration: none;
                display: inline-block;
                vertical-align: middle;
                text-align: center;
                padding: 0.9rem 0;
                margin-left: 200px;"/>
          </h2>
          <ul id="profileDetail">
            <li class="profileDetailTitle">
              매너온도
              <span class="profileDetailCount">38.8°C</span>
            </li>
            <li class="profileDetailTitle">
              재거래희망률
              <span class="profileDetailCount">100%</span>
            </li>
          </ul>
          <div id="profileImage">
            <img src="/Corrot/upload/<%=mem_profilePic %>" alt="<%=name %>"/>
          </div>
        </section>
        <div id="userRecordsDetail">
          <section id="userFilter">
            <ul>
              <li>
                <a class="active" href="myPage1.html">판매내역</a>
              </li>
              <li>
                <a class="" href="myPage2.html">구매내역</a>
              </li>
              <li>
                <a class="" href="myPage3.html">관심목록</a>
              </li>
              <li>
                <a class="" href="">내 동네 설정</a>
              </li>
              <li>
                <a class="" href="">동네생활 글</a>
              </li>
            </ul>
          </section>
          <section
            id="userRecords"
            class="userArticles"
            data-total-page="1"
            data-current-page="1"
          >
            <h3 class="hide">이지금님의 판매 물품 목록</h3>
           
       <section class="cards-wrap" style="width:677px;">
              <c:set var = "keyWord" value="${param.keyWord}" scope="session"/>
    
    	<c:set var="fileList" value="${fboardDAO.selectListAll(keyWord)}"/>
	    	<c:forEach var="item" items="${fileList}" varStatus="status">
	    	
		
	        <article class="card-top ">
					
	        		<p style="display:none" id ="pageindex">${item.idx}</p>
	        		<!-- index/-->
	        		
		         	<!-- 상세페이지 -->
		            <a class="card-link " data-event-label="142863274" href="../Trade/receive.jsp?pageindex=${item.idx}">		       
		            <div class="card-photo ">
		            <img alt="${item.filename1} " src="/Corrot/upload/${item.filename1}?q=82&amp;s=300x300&amp;t=crop">
		            </div>
		            <div class="card-desc">
		                <h2 class="card-title"> <p>${item.name}</p></h2>
		                <div class="card-price ">					
									<p>${item.price}&nbsp<span style="font-size:14px;">원</span></p>
		                </div>
		                <div class="card-region-name">
		                    	<!--경남 창원시 마산회원구 양덕동/ 주소적기-->
		                    	<p>${item.comment}</p>
		                    	 <!--  <p>${item.comment}</p>-->
		            	</div>
		            	<div class="card-counts">
			                <span>관심 6</span>
			                ∙
			                <span>채팅 31</span>
		            	</div>
		            </div>
		            </a>
	               		
	          
	        </article>
	      
	        </c:forEach>
            </section>
          </section>
        </div>
      </section>
    </section>
   

    <footer id="footer">
      <div class="footerContainer">
        <div class="footerTop">
          <div class="footerLogo">
            <img
              class="fixedLogo"
              alt="당근마켓"
              src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/logo-basic-24b18257ac4ef693c02233bf21e9cb7ecbf43ebd8d5b40c24d99e14094a44c81.svg"
            />
          </div>
          <ul class="footerList">
            <li class="footerListItem">
              <a class="linkHighlight" href="">믿을 수 있는 중고거래</a>
            </li>
            <li class="footerListItem">
              <a class="linkHighlight" href="">자주 묻는 질문</a>
            </li>
          </ul>
          <ul class="footerList">
            <li class="footerListItem">
              <a target="_blank" href="">회사 소개</a>
            </li>
            <li class="footerListItem">
              <a target="_blank" href="">광고주센터</a>
            </li>
            <li class="footerListItem">
              <a
                target="_blank"
                class="gaClick"
                data-event-category="townLinkFrom"
                data-event-action="indexBase"
                data-event-label="footerTown"
                href=""
                >동네가게</a
              >
            </li>
          </ul>
          <ul class="footerList policy">
            <li class="footerListItem">
              <a target="_blank" href="">이용약관</a>
            </li>
            <li class="footerListItem">
              <a target="_blank" href="">개인정보처리방침</a>
            </li>
            <li class="footerListItem">
              <a target="_blank" href="">위치기반서비스 이용약관</a>
            </li>
          </ul>
        </div>
        <div class="footerBottom">
          <div id="copyright">
            <ul class="copyrightList">
              <li class="copyrightListItem">
                고객문의
                <a href="">cs@daangnservice.com</a>
              </li>
              <li class="copyrightListItem">
                제휴문의
                <a href="">contact@daangn.com</a>
              </li>
            </ul>
            <ul class="copyrightList">
              <li class="copyrightListItem">사업자 등록번호 : 375-87-00088</li>
              <li class="copyrightListItem">
                <address>서울특별시 구로구 디지털로 30길 28 609호</address>
              </li>
            </ul>
            <div class="copyrightText">©Danggeun Market Inc.</div>
          </div>
          <div id="social">
            <ul class="socialList">
              <li class="socialListItem">
                <a target="_blank" class="footerSocialLink" href="">
                  <img
                    alt="facebook"
                    src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-facebook-0563f4a93852d073b41f13b8bcabb03d47af3bb3a6755cdfedd8a73686c7f18c.svg"
                  />
                  <span class="srOnly">facebook</span>
                </a>
              </li>
              <li class="socialListItem">
                <a target="_blank" class="footerSocialLink" href="">
                  <span class="srOnly">instagram</span>
                </a>
              </li>
              <li class="socialListItem">
                <a target="_blank" class="footerSocialLink" href="">
                  <img
                    alt="blog"
                    src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-blog-e1b0d512d1766a6962ec5bbb5b0803d2a6a9c55ad97db5ba9eebb76013caceba.svg"
                  />
                  <span class="srOnly">blog</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
 <% 
	}
 %>

  </body>
</html>
