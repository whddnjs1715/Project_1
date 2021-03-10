<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>캐럿마켓 메인페이지</title>
    <link rel="stylesheet" href="./css/main.css" />
    <link rel="stylesheet" href="../Trade/css/style.css?ver=123">
    <link rel="stylesheet" href="../Trade/css/sub.css?ver=123">
    <link rel="stylesheet" href="../Trade/css/write.css?ver=123">
    <script src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.11.2.min.js" />"></script>
  </head>
  <body>
    <header id="fixedBar" class="fixedBarBoxShadow">
      <div id="fixedBarWrap">
        <h1 id="fixedBarLogoTitle">
          <a href="./MainPageLogined.jsp">
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
          <h3 class="hide">로그아웃/나의 캐럿</h3>
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

    <section id="homeMainSectionTop" class="backgroundPalePeach">
      <div id="homeMainTop">
        <div class="homeMainDesc">
          <h1 class="homeMainTitle">
            당신 근처의
            <br />
            캐럿마켓
          </h1>
          <p class="textM">
            중고 거래부터 동네 정보까지, 이웃과 함꼐 해요.
            <br />
            가깝고 따뜻한 당신의 근처를 만들어요.
          </p>
        </div>
        <div class="homeMainImageTop">
          <img
            class="mainImage01"
            src="./images/mainImage01.png"
            alt="mainImage01"
          />
        </div>
      </div>
    </section>

    <section class="homeMainSection">
      <div class="homeMainContent">
        <div class="homeMainImage homeMainImage01">
          <img
            class="mainImage02"
            src="./images/mainImage02.png"
            alt="mainImage02"
          />
        </div>
        <div>
          <h1 class="homeMainTitle">
            우리 동네
            <br />
            중고 직거래 마켓
          </h1>
          <p class="textM">
            동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.
          </p>
          <div class="homeButtons">
            <a class="homeButton textL textBold" href="../Trade/index.jsp" >인기매물 보기</a>
            <a class="homeButton textL textBold ml3" href="../Trade/index.jsp"
              >믿을 수 있는 중고거래</a
            >
          </div>
        </div>
      </div>
    </section>

    <section class="homeMainSection backgroundPaleGreen">
      <div class="homeMainContent homeMainReverse">
        <div class="homeMainImage homeMainImage02">
          <img
            class="mainImage03"
            src="./images/mainImage03.png"
            alt="mainImage03"
          />
        </div>
        <div>
          <h1 class="homeMainTitle">
            이웃과 함께 하는
            <br />
            동네 생활
          </h1>
          <p class="textM">우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</p>
          <ul class="homeStoryList">
            <li class="homeStoryListItem">
              <div class="iconStory iconStory01">
                <img
                  class="mainImage03-1"
                  src="./images/mainImage03-1.png"
                  alt="mainImage03-1"
                />
              </div>
              <div class="textS textBold mt3 mb2">우리동네질문</div>
              <div class="textXs">
                궁금한 게 있을 땐
                <br />
                이웃에게 물어보세요.
              </div>
            </li>
            <li class="homeStoryListItem">
              <div class="iconStory iconStory02">
                <img
                  class="mainImage03-2"
                  src="./images/mainImage03-2.png"
                  alt="mainImage03-2"
                />
              </div>
              <div class="textS textBold mt3 mb2">동네분실센터</div>
              <div class="textXs">
                무언가를 잃어버렸을 때
                <br />
                함께 찾을 수 있어요.
              </div>
            </li>
            <li class="homeStoryListItem">
              <div class="iconStory iconStory03">
                <img
                  class="mainImage03-3"
                  src="./images/mainImage03-3.png"
                  alt="mainImage03-3"
                />
              </div>
              <div class="textS textBold mt3 mb2">동네모임</div>
              <div class="textXs">
                관심사가 비슷한 이웃과
                <br />
                온오프라인으로 만나요.
              </div>
            </li>
          </ul>
        </div>
      </div>
    </section>

    <section class="homeMainSection">
      <div class="homeMainContent">
        <div class="homeMainImage homeMainImage03">
          <img
            class="mainImage04"
            src="./images/mainImage04.png"
            alt="mainImage04"
          />
        </div>
        <div>
          <h1 class="homeMainTitle">
            내 근처에서 찾는
            <br />
            우리 동네 가게
          </h1>
          <p class="textM">
            우리 동네 가게를 찾고 있나요?
            <br />
            동네 주민이 남긴 진짜 후기를 함꼐 확인해보세요!
          </p>
          <div class="homeButtons">
            <a
              
              id="townLinkButton"
              class="gaClick homeButton textL textBold"
              data-event-category="townLinkFrom"
              data-event-action="indexBase"
              data-event-label="mainTown"
               href="../maintown/maintown.jsp"
              >캐럿마켓 동네가게 찾기</a
            >
          </div>
        </div>
      </div>
    </section>

    <section class="cards-wrap">
    
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
	    
			
        <!-- section 끝 -->
    

    </section>

    <section class="homeKeywordsContent">
      <h3 class="homeMainTitle">
        <a class="textM textBold textBlack" href="">중고거래 인기검색어</a>
      </h3>
      <ul class="topKeywordsList">
        <li class="keywordItem textM">
          <a class="keywordLink" href="">자전거</a>
        </li>
        <li class="keywordItem textM">
          <a class="keywordLink" href="">캠핑</a>
        </li>
        <li class="keywordItem textM">
          <a class="keywordLink" href="">의자</a>
        </li>
        <li class="keywordItem textM">
          <a class="keywordLink" href="">아이폰</a>
        </li>
        <li class="keywordItem textM">
          <a class="keywordLink" href="">노트북</a>
        </li>
        <li class="keywordItem textM">
          <a class="keywordLink" href="">패딩</a>
        </li>
        <li class="keywordItem textM">
          <a class="keywordLink" href="">아이패드</a>
        </li>
        <li class="keywordItem textM">
          <a class="keywordLink" href="">냉장고</a>
        </li>
        <li class="keywordItem textM">
          <a class="keywordLink" href="">낚시</a>
        </li>
        <li class="keywordItem textM">
          <a class="keywordLink" href="">골프</a>
        </li>
      </ul>
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
  </body>
</html>