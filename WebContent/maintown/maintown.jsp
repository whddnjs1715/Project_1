<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<jsp:useBean id="ttownDAO" class="dangn.town.ttown.TtownDAO"/>
<jsp:useBean id="ttownDTO" class="dangn.town.ttown.TtownDTO"/>
<c:set var="ttownList" value="${ttownDAO.selectTtown()}"/>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/css.css">
<link rel="stylesheet" href="./css/list.css">
</head>
<%@ include file="./js/js.jsp" %>

<body>
		<!-- 숨겨진 검색 -->
	
    <div id="hide-search" class="ng-star-inserted hide-top">
        <div class="back-box-inner poi-seo">
            <img src="./images/icon_back_btn.png" style="cursor: pointer;" onclick="hide();">
        </div>
        <div class="back-content-box-inner content-container responsive-container">
            <div class= "poi-seo inner-container">
                <div class="back-region-searchbar poi-seo-2">
                    <div class="search-icon-container" style="cursor: pointer;">
                    </div>
                    <input class="back-input" type="search" placeholder="내 동네 이름(동,읍,면)으로 갬색">
                </div>
                <div class="poi-btn poi-seo-btn sm ng-star-inserted">
                    <div class="content-container">
                        <div class="content">
                            <div class="back-bt">
                                	검색하기
                            </div>
                        </div>
                    </div>
                </div>
                <div class="title-container ng-star-inserted">
                    
                </div>
                <div class="poi-seo region-tiem ng-satr-inserted">
                    
                </div>
            </div>
        </div>
	</div>

<div class="poi-seo-c54" id="hide-on1">
	<div class="navbar poi-seo-c54 poi-seo-c38">
		<div class="navbar-desktop poi-seo-c38 poi-seo-c36">
			<div class="responsive-container poi-seo-c29">
				<nav>
					<div class="row  poi-seo-c32">
						<a class="no-decoration townmiddle" href="./maintown.jsp" routerlink="#">
							<img class="daangn-logo" src="./images/carrot.PNG" alt="당근마켓 로고">
						</a>
						<!-- 
						<div class=" h-divider"></div>
						<div class="searchbar poi-seo-c35">
							<div class="row poi-seo-c35 poi-seo-c32 searchbar-container">
								<div class="current-location poi-seo-c35 poi-seo-c34">
									<div class="row poi-seo-c34 poi-seo-c32 h-container" style="cursor: pointer;" onclick="show();">						
										<span class="poi-seo-c34">동네 선택</span>
										<img class="poi-seo-c34" src="./images/arrow.png" alt="화살표">
								</div>
								</div>
								<div class="poi-seo-c35 searchbar">
									<input class="poi-seo-c35 untouched pristine valid" type="search" placeholder="주변 업체를 찾아보세요">
									<div class="search-icon poi-seo-c35">
										<img class="poi-seo-c35" src="./images/search.png" alt="검색">
									</div>
								</div>
							</div>
						</div>
						 -->
					</div>
				</nav>
			</div>
		</div>			
	</div>  
</div>
	
	<!-- 동네 설정 -->
	
	<section id="hide-on2">
		<div class="banner-background">
			<div class="bb-container box_inner">
				<div class="banner-container">
					<div class="banner-content">
						<h1>
							내 근처 <br> 동네가게를 찾고 계신가요?
						</h1>
						<div class="region-button"  onclick="show();" >
						<!-- style="cursor: pointer;" -->
							<p class="button-text">동네<!--  설정하고  -->가게를 찾아보세요!</p>
                        </div>
					</div>
					<img src="./images/main_town.PNG">
				</div>
			</div>
		</div>
	</section>
	
	<!-- 다양한 동네가게 -->
	
	<section id="hide-on3" class="box_inner">
		<div class="dt-box">
			<div class="dt-container ">
				<div class="title-container">
					<h2>다양한 동네가게를 볼 수 있어요.</h2>
				</div>
				<div class="dtin-container">
				<c:forEach var="item" items="${ttownList}" varStatus="status" begin="0" end="7">
					<div class="ngcontent-poi-seo-c39">
						<a href="./downtown.jsp?idx=${item.idx}" class="no-decoration">
							<div class="poi">
								<div class="imgs-container">
									<img src="/Corrot/upload/${item.pic1}">
									<p class="category">${item.select1}</p>
									<p class="name">${item.name}</p>
									<p class="region">${item.address}</p>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
					
				</div>
				<!-- 
				<div class="region-banner-container">
					<div class="region-banner" style="cursor: pointer" onclick="show();">
						<p>내 동네 설정하고 우리동네 가게 찾기</p>
					</div>
				</div>
				 -->
			</div>
			</div>
		</div>

				
				<!-- 업체 등록 -->
				<!-- side1, side2 는 임시 클래스입니다. -->
				<div class="home-banner ">
					<div class="side">
						<div class="side2">
							<h1>업체를 원영하고 계신가요?</h1>
							<p>동네 주민들에게 내 업체를 알려보세요.</p>
							<a href="./regist.jsp" class="no-decoration">
								<button class="side-town-btn">업체 등록하기</button>
							</a>
						</div>
						<img src="./images/main_town_ins.PNG">
					</div>
				</div>
			</div>
		</div>
		
		<!-- 푸터 -->
		
		<div class="town-footer ">
			<div class="footer-container">
				<div class="media-links-container">
					<a href="#" target="_blank">
						<img src="./images/ico_playstore.png">
					</a>
				
					<a href="#" target="_blank">
						<img src="./images/ico_apple.png">
					</a>
			
				
					<a href="#" target="_blank">
						<img src="./images/ico_facebook.png">
					</a>
				
					<a href="#" target="_blank">
						<img src="./images/ico_naver.png">
					</a>
			
					<a href="#" target="_blank">
						<img src="./images/ico_youtube.png">
					</a>
			
					<a href="#" target="_blank">
						<img src="./images/ico_instargram.png">
					</a>

					<a href="#" target="_blank">
						<img src="./images/ico_twitter.png">
					</a>
				</div>
				
			<div class="policy-links">
				<a href="index.jsp" target="_blank" class="daangn">당근마켓 홈페이지</a>
				<p>&nbsp;·&nbsp;</p>
				<a href="#">이용약관</a>
				<p>&nbsp;·&nbsp;</p>
				<a href="#">개인정보 취급방침</a>
				<p>&nbsp;·&nbsp;</p>
				<a href="#">위치기반 서비스 이용약관</a>
			</div>
			<div class="other-info">
				<p>사업자 등록번호 : 375-87-00088 서울특별시 강남구 테헤로 4길 미림타워 14층 team@daangn.com (주)당근마켓 대표 김재현, 김용현 </p>
			</div>
			<div class="copyright">
				 <p>Copyright © Danggeun Market Inc. All rights reserved.</p>
			</div>
			</div>
		</div>
	</section>
</body>
</html>