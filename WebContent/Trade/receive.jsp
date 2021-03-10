<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- !!! -->
<fmt:requestEncoding value="UTF-8"/>

<%@ page import="com.main.fileupload.*" %>
<%@ page import ="com.main.filecount.*" %>


<!-- DAO -->
<jsp:useBean id="fboardDAO" class="com.main.fileupload.fileuploadDAO"/>

<c:set var="countColumn" value="${fboardDAO.countColumn()}"/>
<c:set var="fileListidx" value="${fboardDAO.selectListidx()}"/>

<!-- ${param.keyWord} -->

<%!int num; %>






<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캐럿 상점</title>
    <link rel="stylesheet" href="./css/style.css?ver=1">
    <link rel="stylesheet" href="./css/receive.css?ver=123"><!-- find receive.css로 수정 찾기 -->
    <link rel="stylesheet" href="./css/write.css?ver=3">
    <link rel="stylesheet" href="../main/css/main.css" />
    <link rel="stylesheet" href="./css/swiper.min.css?ver=1234">
    
     
     
 <%
	String email = null;
	if(session.getAttribute("email") != null){
		email = (String)session.getAttribute("email");
	}
%> 

<style>
    html, body {
      position: relative;
      height: 100%;
    }
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
  </style>




     
</head>
<body>
    <div>
    <% if(email == null){%>
    <header id="fixed-bar" class="fixed-bar-box-shadow">
        <div id="fixed-bar-wrap">
            <h1 id="fixed-bar-logo-title">
                <a href="index.jsp">
                <span class="sr-only">캐럿마켓</span>
                <img class="fixed-logo" alt="당근마켓" src="images/캐럿.PNG">
                </a>
            </h1>
        
            <section id="fixed-bar-search">
                <div class="search-input-wrap">
                <span class="sr-only">검색</span>
                <input type="text" name="header-search-input" id="header-search-input" class="fixed-search-input" placeholder="동네 이름, 물품명 등을 검색해보세요!">
                <button id="header-search-button">
                <img class="fixed-search-icon" alt="Search" src="images/Magnifying glass.svg">
                </button>
            </div>
            </section>
        
            <section id="fixed-bar-download">
                <h3 class="hide">다운로드</h3>
                <a class="fixed-download-button" id="header-download-button-ios" href="../main/regist.jsp">
                   
                    <div class="fixed-download-text">회원 가입</div>
                </a>      
                <a class="fixed-download-button" id="" href="../main/login.jsp">
                   
                    <div class="fixed-download-text">로그인</div>
                </a>    
            </section>
        </div>

    </header>
    <% }else{ %> 
    <header id="fixedBar" class="fixedBarBoxShadow">
<div id="fixedBarWrap">
<h1 id="fixedBarLogoTitle">
	<a href="../main/MainPageLogined.jsp">
    <span class="srOnly">캐럿마켓</span>
    <img
      class="fixedLogo"
      alt="당근마켓"
      src="./images/캐럿.PNG"
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
  <h3 class="hide">로그아웃/나의 당근</h3>
   <p>
  <input type="button" value="로그아웃" onclick="location.href='../main/logout.jsp'" 
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

  <input type="button" value="나의 당근" onclick="location.href='../main/myPage.jsp'" 
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
<%}%>

    <section id="content">
   
    <!--  /script -->
<pre>
	<code>
	  <script type="text/javascript">
	  
	  var index = document.getElementById("pageindex");
      console.log(index);
	 
      
	    
	  </script>
	</code>
</pre>
<!--  script/ -->


    <section class="cards-wrap">
    
    <%
	request.setCharacterEncoding("UTF-8");
	num =Integer.parseInt(request.getParameter("pageindex"));
	pageContext.setAttribute("jstlnumindex",num);
	%>
	
		<c:set var="selectList" value="${fboardDAO.selectList(jstlnumindex)}"/>
	    	<c:forEach var="item" items="${selectList}" varStatus="status">
	    			
		
	        <article class="card-top ">
					<!-- /index -->
	        		<p style="display:none">${item.idx}</p>
	        		<!-- index/-->
	        		
		         	<!-- 상세페이지 -->
		            <a class="card-link " data-event-label="142863274" href="#" >		       
		            <div class="card-photo ">
		            	<div class="swiper-container">
						    <div class="swiper-wrapper">
						    	<script src="//code.jquery.com/jquery-3.3.1.js"></script>
						    	
						     <c:choose>
						     	 <c:when test="${empty item.filename1}">
						     	 	
							      </c:when>
							      <c:when test="${not empty item.filename1}">
										<div class="swiper-slide" id="sli1">
								      		<img alt="${item.filename1}" src="/Corrot/upload/${item.filename1}?q=82&amp;s=300x300&amp;t=crop">
								      	</div>
								 </c:when>
						       </c:choose>
						       
						      <c:choose>
						     	 <c:when test="${empty item.filename2}">
						     	 	
							      </c:when>
							      <c:when test="${not empty item.filename2}">
										<div class="swiper-slide" id="sli2">
								      		<img alt="${item.filename2}" src="/Corrot/upload/${item.filename2}?q=82&amp;s=300x300&amp;t=crop">
								      	</div>
								 </c:when>
						       </c:choose>
						       
						      <c:choose>
						     	 <c:when test="${empty item.filename3}">
						     	 	
							      </c:when>
							      <c:when test="${not empty item.filename3}">
										<div class="swiper-slide" id="sli3">
								      		<img alt="${item.filename3}" src="/Corrot/upload/${item.filename3}?q=82&amp;s=300x300&amp;t=crop">
								      	</div>
								 </c:when>
						       </c:choose>
						       
						      <c:choose>
						     	 <c:when test="${empty item.filename4}">
						     	 									      
							      </c:when>
							     <c:when test="${not empty item.filename4}">
										<div class="swiper-slide" id="sli4">
								      		<img alt="${item.filename4}" src="/Corrot/upload/${item.filename4}?q=82&amp;s=300x300&amp;t=crop">
								      		<h2>바이</h2>
								      	</div>
								 </c:when>
						       </c:choose>
						       
						      <c:choose>
						     	 <c:when test="${empty item.filename5}"> 
						     		 
								      
								      </c:when>
								      <c:when test="${not empty item.filename5}">
										<div class="swiper-slide" id="sli5">
								      	<img alt="${item.filename5} " src="/Corrot/upload/${item.filename5}?q=82&amp;s=300x300&amp;t=crop">
								      	</div>
								 	</c:when>
						       </c:choose>	
						       				    
						    </div>
						    <div class="swiper-pagination"></div>	
						</div>
						
						<script src="./js/swiper.min.js"></script>
							
							<!-- Swiper JS -->
						<script>
						
						 var swiper = new Swiper('.swiper-container', {
						      pagination: {
						        el: '.swiper-pagination',
						        dynamicBullets: true,
						      },
						    });
						 
						
						</script>   
		           	</div>
		           
		            <div class="card-desc">
		                <h2 class="card-title"> <p>${item.name}</p></h2>
		                <p class="card-catgory" > <span style="color:#868e96;">${item.category}</span><p>
		                <div class="card-price ">					
									<p style="font-size:17px;">${item.price}&nbsp<span style="font-size:17px;">원</span></p>
		                </div>
		                <div class="card-region-name">
		                    	<!--경남 창원시 마산회원구 양덕동/ 주소적기-->
		                    	<p>${item.comment}</p>
		                    	 <!--  <p>${item.comment}</p>-->
		            	</div>
		            	<div class="card-counts">
			                <span>채팅 6</span>
			                ∙
			                <span>관심 31</span>
			                .
			                <span>조회 31</span>
		            	</div>
		            </div>
		            </a>
	               		
	          
	        </article>
	      
	        </c:forEach>
	    
			
        <!-- section 끝 -->
    

    </section>

 

    <footer id="footer">
        <div class="footer-container">
            <div class="footer-top">
            <div class="footer-logo"></div>
            <ul class="footer-list">
                <li class="footer-list-item"><a class="link-highlight" href="/trust">믿을 수 있는 중고거래</a></li>
                <li class="footer-list-item"><a class="link-highlight" href="/wv/faqs">자주 묻는 질문</a></li>
            </ul>
            <ul class="footer-list">
                <li class="footer-list-item"><a target="_blank" href="http://team.daangn.com">회사 소개</a></li>
                <li class="footer-list-item"><a target="_blank" class="link-highlight" href="https://ad.daangn.com/">광고주센터</a></li>
                <li class="footer-list-item">
                <a target="_blank" class="ga-click" data-event-category="town_link_from" data-event-action="hot_articles" data-event-label="footer_town" href="https://town.daangn.com">동네가게</a>
                </li>
            </ul>
            <ul class="footer-list policy">
                <li class="footer-list-item"><a target="_blank" href="https://policy.daangn.com/terms.html">이용약관</a></li>
                <li class="footer-list-item"><a target="_blank" href="https://policy.daangn.com/privacy.html">개인정보처리방침</a></li>
                <li class="footer-list-item"><a target="_blank" href="https://policy.daangn.com/location.html">위치기반서비스 이용약관</a></li>
            </ul>
            </div>
            <div class="footer-bottom">
            <div id="copyright">
                <ul class="copyright-list">
                <li class="copyright-list-item">고객문의 <a href="mailto:cs@daangnservice.com">cs@daangnservice.com</a></li>
                <li class="copyright-list-item">제휴문의 <a href="mailto:contact@daangn.com">contact@daangn.com</a></li>
                </ul>
                <ul class="copyright-list">
                <li class="copyright-list-item">사업자 등록번호 : 375-87-00088</li>
                <li class="copyright-list-item"><address>서울특별시 구로구 디지털로 30길 28 609호</address></li>
                </ul>
                <div class="copyright-text">©Danggeun Market Inc.</div>
            </div>
            <div id="social">
                <ul class="social-list">
                <li class="social-list-item">
                    <a target="_blank" class="footer-social-link" href="https://www.facebook.com/daangn">
                    <img alt="facebook" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-facebook-0563f4a93852d073b41f13b8bcabb03d47af3bb3a6755cdfedd8a73686c7f18c.svg">
                    <span class="sr-only">facebook</span>
        </a>          </li>
                <li class="social-list-item">
                    <a target="_blank" class="footer-social-link" href="https://www.instagram.com/daangnmarket/">
                    <img alt="instagram" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-instagram-2f6c88a461597907c114b7ce28eab053fcae791ed26417915fefb6f7c9f95756.svg">
                    <span class="sr-only">instagram</span>
        </a>          </li>
                <li class="social-list-item">
                    <a target="_blank" class="footer-social-link" href="https://blog.naver.com/daangn">
                    <img alt="blog" src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-blog-e1b0d512d1766a6962ec5bbb5b0803d2a6a9c55ad97db5ba9eebb76013caceba.svg">
                    <span class="sr-only">blog</span>
        </a>          </li>
                </ul>
            </div>
            </div>
        </div>
    </footer>
    </div>

    
</body>
</html>