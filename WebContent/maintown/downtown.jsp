<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page isELIgnored="false" %>
<%@ page import="java.sql.*" %>

<jsp:useBean id="ttownDAO" class="dangn.town.ttown.TtownDAO"/>
<jsp:useBean id="ttownDTO" class="dangn.town.ttown.TtownDTO"/>

<%
	String url = "jdbc:mysql://127.0.0.1:3306/webdev";
	String uid = "root";
	String upw = "sksl8866955";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String t_idx = request.getParameter("idx");
%>
<%
	if(request.getParameter("idx") == null || request.getParameter("idx").equals("")){
%>
	<script>
		alert('t_idx가 업습니다.');
	</script>
<%
	}
	
	String t_name = "";
	String t_select1 = "";
	String t_select2 = "";
	String t_address = "";
	String t_detailAddress = "";
	String t_hp = "";
	String t_web = "";
	String t_content = "";
	String t_pic1 = "";
	String t_pic2 = "";
	String t_pic3 = "";
	String t_pic4 = "";
	String t_pic5 = "";
	
	System.out.println("t_idx = " + t_idx);
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		if(conn != null){
			String sql = "SELECT t_name, t_select1, t_select2, sample6_address, sample6_detailAddress, t_hp, t_web, t_content, t_pic1, t_pic2, t_pic3, t_pic4, t_pic5 FROM t_town WHERE t_idx= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				t_name = rs.getString("t_name");
				t_select1 = rs.getString("t_select1");
				t_select2 = rs.getString("t_select2");
				t_address = rs.getString("sample6_address");
				t_detailAddress = rs.getString("sample6_detailAddress");
				t_hp = rs.getString("t_hp");
				t_web = rs.getString("t_web");
				t_content = rs.getString("t_content");
				t_pic1 = rs.getString("t_pic1");
				t_pic2 = rs.getString("t_pic2");
				t_pic3 = rs.getString("t_pic3");
				t_pic4 = rs.getString("t_pic4");
				t_pic5 = rs.getString("t_pic5");
			}
		}
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	System.out.println(t_name);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/css.css">
<link rel="stylesheet" href="./css/list.css">

<title>Insert title here</title>
</head>
<%@ include file="./js/js.jsp"%>
<body>
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

	<div id="hide-on2" class="box_inner">
		<div class="rev-main">
			<div class="rev-detail">
				<div></div>
				<div class="article">
					<section class="rev-article-box">
						<div class="rev-image-bar">
							<div class="rev-image-container">
								<img src="/Corrot/upload/<%=t_pic1%>">
							</div>
							<div class="rev-dark-cover"></div>
							<div class="rev-bar-container">
								<div class="rev-content">
									<div class="rev-breadcrumbs poi-dis">
										<a href="#"><%=t_address%></a> &nbsp; . &nbsp; <a href="#"><%=t_select1%></a>
									</div>
									<h1></h1>
									<h1 class="rev-tag-container"><%=t_name%></h1>
								</div>
							</div>
						</div>
				</div>
			</div>
			</section>

			<section class="rev-info">
				<div class="rev-detail-info poi-pad">
					<ul class="rev-info-ul">
						<li class="rev-info-li">
							<div class="rev-info-ico">
								<img src="./images/ico_store.png">
							</div>
							<p class="info-content description show-all">
								<%=t_content%>
							</p>
						</li>
						<li class="rev-info-li">
							<div class="rev-info-ico">
								<img src="./images/ico_pin.png">
							</div>
							<p class="info-content">
								<%=t_address%>&nbsp;&nbsp;<%=t_detailAddress%>
							</p>
						</li>
						<li class="rev-info-li">
							<div class="rev-info-ico">
								<img src="./images/ico_phone.png">
							</div>
							<p class="info-content phone-number2">
									<%=t_hp%>	
							</p>
						</li>
						<li class="rev-info-li">
							<div class="rev-info-ico">
								<img src="./images/ico_world.png">
							</div>
							<p class="info-content">			
									<%=t_web%>
							</p>
						</li>
						
					</ul>
				</div>
			</section>

			<section class="rev-photos">
				<div class="rev-detail-photos">
					<div class="rev-detail-title">
						<h2>사진</h2>
					</div>
					
					<div class="photos-container">
						<div class="rev-swiper-container swiper-container swiper-container-initi swiper-container-horizon">
							<div class="swiper-wrapper">
							
								<div class="swiper-slide swiper-slide-active"
									style="width: 303.167px; margin-right: 16px;">
									<%if (t_pic1 != null){ %>
									<img src="/Corrot/upload/<%=t_pic1%>"> 
									<% }else{%>
									<img src="/Corrot/upload/no-image.jpg">
									<%} %>
								</div>
								
								<div class="swiper-slide swiper-slide-active"
									style="width: 303.167px; margin-right: 16px;">
									<%if (t_pic2 != null){ %>
									<img src="/Corrot/upload/<%=t_pic2%>"> 
									<% }else{%>
									<img src="/Corrot/upload/no-image.jpg">
									<%} %>
								</div>
								
								<div class="swiper-slide swiper-slide-active"
									style="width: 303.167px; margin-right: 16px;">
									<%if (t_pic3 != null){ %>
									<img src="/Corrot/upload/<%=t_pic3%>"> 
									<% }else{%>
									<img src="/Corrot/upload/no-image.jpg">
									<%} %>
								</div>
								
								<div class="swiper-slide swiper-slide-active"
									style="width: 303.167px; margin-right: 16px;">
									<%if (t_pic4 != null){ %>
									<img src="/Corrot/upload/<%=t_pic4%>"> 
									<% }else{%>
									<img src="/Corrot/upload/no-image.jpg">
									<%} %>
								</div>
								
								<div class="swiper-slide swiper-slide-active"
									style="width: 303.167px; margin-right: 16px;">
									<%if (t_pic5 != null){ %>
									<img src="/Corrot/upload/<%=t_pic5%>"> 
									<% }else{%>
									<img src="/Corrot/upload/no-image.jpg">
									<%} %>
								</div>
				
							</div>
							<div class="swiper-pagination swiper-pagination-bullets">
								<span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
								<span class="swiper-pagination-bullet"></span>
							</div>
							
						</div>
						
						<span class="swiper-notification"></span>
					</div>
					
					
				</div>
			</section>
			
			
			
			<!-- Swiper JS -->
	 		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

			<!-- Initialize Swiper -->
			<script>
				var swiper = new Swiper('.swiper-container', {
    				  slidesPerView: 3,
   		   				spaceBetween: 30,
    					  pagination: {
    		 		   el: '.swiper-pagination',
    		 		   clickable: true,
   		 			  },
  				  });
			</script>
			
			
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2139273b842ab9b0cd177c1134574633&libraries=services"></script>
  <div id="map" style="width:100%;height:224px;"></div>			
			<section class="rev-map">
				<div class="rev-detaile-map">
					<div class="rev-detail-map-title">
						<h2>찾아가는 길</h2>
					</div>
						<div class="map-container">     
						
						                                              
                          <script>
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                mapOption = {
                                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                    level: 3 // 지도의 확대 레벨
                                };  
                            
                            // 지도를 생성합니다    
                            var map = new kakao.maps.Map(mapContainer, mapOption); 
                            
                            // 주소-좌표 변환 객체를 생성합니다
                            var geocoder = new kakao.maps.services.Geocoder();
                            
                            // 주소로 좌표를 검색합니다
                            geocoder.addressSearch('<%=t_address%>', function(result, status) {
                            
                                // 정상적으로 검색이 완료됐으면 
                                 if (status === kakao.maps.services.Status.OK) {
                            
                                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                            
                                    // 결과값으로 받은 위치를 마커로 표시합니다
                                    var marker = new kakao.maps.Marker({
                                        map: map,
                                        position: coords
                                    });
                            
                                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                                    var infowindow = new kakao.maps.InfoWindow({
                              
                                    });
                                    infowindow.open(map);
                            
                                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                    map.setCenter(coords);
                                } 
                            });    
                            </script>
                          
                          
							<div class="click-overlay"></div>
						</div>
						<div class="map-address">
							<p class="address-road"><%=t_address%></p>
							<div class="address-jibun-container">
								<div class="address-jibun-badge">지번</div>
								<p class="address-jibun"><%=t_address%> <%=t_detailAddress%></p>
							</div>
						</div>
				</div>
			</section>
					<div class="button-container">
						<a class="no-decoration" href="./list.jsp">
							<div class="md md-btn md-btn-color">
								<div class="content-container">
									<div class="content">다른 업체 찾아보기</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			


			<div class="town-footer ">
				<div class="footer-container">
					<div class="media-links-container">
						<a href="#" target="_blank"> <img
							src="./images/ico_playstore.png">
						</a> <a href="#" target="_blank"> <img
							src="./images/ico_apple.png">
						</a> <a href="#" target="_blank"> <img
							src="./images/ico_facebook.png">
						</a> <a href="#" target="_blank"> <img
							src="./images/ico_naver.png">
						</a> <a href="#" target="_blank"> <img
							src="./images/ico_youtube.png">
						</a> <a href="#" target="_blank"> <img
							src="./images/ico_instargram.png">
						</a> <a href="#" target="_blank"> <img
							src="./images/ico_twitter.png">
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
						<p>사업자 등록번호 : 375-87-00088 서울특별시 강남구 테헤로 4길 미림타워 14층
							team@daangn.com (주)당근마켓 대표 김재현, 김용현</p>
					</div>
					<div class="copyright">
						<p>Copyright © Danggeun Market Inc. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
</body>
</html>