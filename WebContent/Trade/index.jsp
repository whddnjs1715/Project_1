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


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캐럿 상점</title>
    <link rel="stylesheet" href="./css/style.css?ver=123">
    <link rel="stylesheet" href="./css/sub.css?ver=123">
    <link rel="stylesheet" href="./css/write.css?ver=123">
    <link rel="stylesheet" href="../main/css/main.css" />
    <script src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.11.2.min.js" />"></script>

    <script src="./js/location.search.js"></script>
    
    
</head>
<script>
function searchCheck(frm){
    //검색
   
    if(frm.keyWord.value ==""){
        alert("검색 단어를 입력하세요.");
        frm.keyWord.focus();
        return;
    }
    frm.submit();      
}

<%
	String email = null;
	if(session.getAttribute("email") != null){
		email = (String)session.getAttribute("email");
	}
%>
</script>


<body>
    <div>
    <% if(email == null){%>
    <header id="fixed-bar" class="fixed-bar-box-shadow">
        <div id="fixed-bar-wrap">
            <h1 id="fixed-bar-logo-title">
                <a href="../main/MainPage.jsp">
                <span class="sr-only">캐럿상점</span>
                <img class="fixed-logo" alt="캐럿상점" src="images/캐럿.PNG">
                </a>
            </h1>
            
        	<form name ="search" id ="form-search" method="post" action="index.jsp">
            <section id="fixed-bar-search">        
                <div class="search-input-wrap">
                <span class="sr-only">검색</span>                                
                	<input type="text" name="keyWord" id="header-search-input" class="fixed-search-input" placeholder="동네 이름, 물품명 등을 검색해보세요!">
                	<button id="header-search-button" onclick="searchCheck(form)">
                		<img class="fixed-search-icon" alt="Search" src="images/Magnifying glass.svg">
                	</button>
               
            </div>
            </section>
             </form>
        
            <section id="fixed-bar-download">
                <h3 class="hide">다운로드</h3>
                <a target="_blank" class="fixed-download-button" id="header-download-button-ios" href="">
                   
                    <div class="fixed-download-text">회원 가입</div>
                </a>      
                <a target="_blank" class="fixed-download-button" id="" href="">
                   
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
      src="images/캐럿.PNG"
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
      placeholder="물품명을 검색해보세요!"
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
    <h1 class="head-title" id="hot-articles-head-title">
        중고거래 인기매물
    </h1>

  
    <section id = "div_write">
        <div id = "write">
            <input type="button" value ="글쓰기" onclick="self.location='Sobject.jsp'" >
        </div>
    </section>

<!-- 
<form name = "location_search" action ="index.jsp" method="post">
    <nav id="hot-articles-navigation">
        <select name="region1" id="region1" onchange="changeRegion('r1', this.value)" class="hot-articles-nav-select"><option value="">지역을 선택하세요</option>
        //<select name="region1" id="region1" onchange="this.form.submit()" class="hot-articles-nav-select"><option value="">지역을 선택하세요</option>
            <option value="서울특별시">서울특별시</option>
            <option value="부산광역시">부산광역시</option>
            <option value="대구광역시">대구광역시</option>
            <option value="인천광역시">인천광역시</option>
            <option value="광주광역시">광주광역시</option>
            <option value="대전광역시">대전광역시</option>
            <option value="울산광역시">울산광역시</option>
            <option value="세종특별자치시">세종특별자치시</option>
            <option value="경기도">경기도</option>
            <option value="강원도">강원도</option>
            <option value="충청북도">충청북도</option>
            <option value="충청남도">충청남도</option>
            <option value="전라북도">전라북도</option>
            <option value="전라남도">전라남도</option>
            <option value="경상북도">경상북도</option>
            <option value="경상남도">경상남도</option>
            <option value="제주특별자치도">제주특별자치도</option>
        </select>

        <select name="region2" id="region2" disabled="disabled" onchange="changeRegion('r2', this.value)" class="hot-articles-nav-select">
            <option value="">동네를 선택하세요</option>
           
            
        </select>

    </nav>
</form>
 -->

    <section class="cards-wrap">
    
    	<c:set var = "keyWord" value="${param.keyWord}" scope="session"/>
    
    	<c:set var="fileList" value="${fboardDAO.selectListAll(keyWord)}"/>
	    	<c:forEach var="item" items="${fileList}" varStatus="status">
	    	
		
	        <article class="card-top ">
					
	        		<p style="display:none" id ="pageindex">${item.idx}</p>
	        		<!-- index/-->
	        		
		         	<!-- 상세페이지 -->
		            <a class="card-link " data-event-label="142863274" href="receive.jsp?pageindex=${item.idx}">		       
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