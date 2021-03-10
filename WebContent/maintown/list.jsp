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
<script type="text/javascript" src="./js/js.js"></script>
</head>
<body>
	<!-- 숨겨진 페이지 추가-->
	<div id="hide-search" class="ng-star-inserted hide-top">
		<div class="back-box-inner poi-seo">
			<img src="./images/icon_back_btn.png" style="cursor: pointer;"
				onclick="hide();">
		</div>
		<div
			class="back-content-box-inner content-container responsive-container">
			<div class="poi-seo inner-container">
				<div class="back-region-searchbar poi-seo-2">
					<div class="search-icon-container" style="cursor: pointer;">
					</div>
					<input class="back-input" type="search"
						placeholder="내 동네 이름(동,읍,면)으로 갬색">
				</div>
				<div class="poi-btn poi-seo-btn sm ng-star-inserted">
					<div class="content-container">
						<div class="content">
							<div class="back-bt">현재 위치로 찾기</div>
						</div>
					</div>
				</div>
				<div class="title-container ng-star-inserted"></div>
				<div class="poi-seo region-tiem ng-satr-inserted"></div>
			</div>
		</div>
	</div>
	
	<!-- 버튼 클릭시 숨겨지기 위한 id hide-on1-->
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
		<!--메인 컨텐츠 -->
	
		
		<div class="main-container poi-seo-c29 poi-seo-c54">
			<div class="main poi-seo-c54">
				<div class="poi-list poi-seo-c51 star-inserted">
				 
					<div class="poi-seo-c51 title-container">				
						<h1 class="poi-seo-c51">
							 동네가게
						</h1>
						<div class="poi-seo-c51 content-container2 star-inserted">
						<div class="poi-item poi-seo-c51 poi-seo-c48 star-inserted">
					</div>
					<!--
					<div class="poi-seo-c51 categories-container star-inserted">
						<div class="category-chips poi-seo-c51 poi-seo-c46">
							<a href="/regions/363/stores" class="no-decoration poi-seo-c46" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45 active">전체</div>
							</a>
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">빵집/카페</div>
							</a>
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">음식점/반찬</div>
							</a>	
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">뷰티/미용</div>
							</a>														
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">교육/학원</div>
							</a>		
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">운동</div>
							</a>												
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">운송</div>
							</a>							
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">인테리어</div>
							</a>																				      
						</div>
						<div class="category-chips poi-seo-c51 poi-seo-c46 category-chips2">
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">병원</div>
							</a>							
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">세탁/수선</div>
							</a>
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">편의점/마트</div>
							</a>
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">통신/렌탈</div>
							</a>
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">반려동물</div>
							</a>							
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">가전</div>
							</a>							
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">여행</div>
							</a>   
							<a href="#" class="no-decoration poi-seo-c46 star-inserted" queryparamshandling="merge" >
								<div class="poi-seo-c46 poi-seo-c45">자동차수리</div>
							</a>    
						</div>
					</div>
					
			 		 -->
						
						<c:forEach var="item" items="${ttownList}" varStatus="status">
							<a class="no-decoration container poi-seo-c48" href="./downtown.jsp?idx=${item.idx}">	 
								<div class="poi-seo-c48 poi-seo-c32">
									<div class="img-container poi-seo-c48">
										<img class="poi-seo-c48" src="/Corrot/upload/${item.pic1}">
									</div>
									<div class="text-container poi-seo-c48">
										<div class="title poi-seo-c48 poi-seo-c32 ">
											<p class="poi-name poi-seo-c48">${item.name}</p>
											<span class="poi-seo-c48 short-address">${item.address}</span>
										</div>
										<div class="poi-seo-c48 info star-inserted">
											<p class="poi-seo-c48 description star-inserted">${item.content}</p>
											<p class="poi-seo-c48">
											</p>
										</div>
									</div>
								</div>	
							</a>
							<div class="poi-seo-c48 divider-container">
								<div class="divider poi-seo-c48 poi-seo-c47"></div>
							</div>
						</c:forEach>	
						
						
						
						</div>
					</div>
				</div>  			  
			</div>
			<div class="footer poi-seo-c54 poi-seo-c42">
				<div class="poi-seo-c42 footer-container">
					<div class="links-container">
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
		</div>  
	</div>	

</body>
</html>