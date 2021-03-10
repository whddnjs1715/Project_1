<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
	if(session.getAttribute("email") == null){
%>
	<script>
		alert('로그인 후 이용하세요.');
		location.href="../main/login.jsp";
	</script>
<%
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./css/regist.css">	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="./js/regist.js"></script>

	<title>등록</title>
</head>
<body>
	   <div id="container">
        <div class="location_area member">
            <div class="box_inner">
                <h2 class="tit_page">동네업체 등록</h2>                                
            </div>
        </div>
</script>
        <div class="bodytext_area box_inner">
            <form name="regform" id="regform" method="post" class="Form" action="regist_ok.jsp" enctype="multipart/form-data" onsubmit="return sendit()">
                <fieldset>                    
                    <p class="info_pilsoo pilsoo">필수입력</p>
                    <ul class="Form_list">
                        <li class="clear">
                            <label for="name" class="tit pilsoo">상호명</label>
                            <div class="app_content"><input type="text" class="w100p" name="t_name" id="t_name" placeholder="예)캐럿이네 슈퍼"></div>
                        </li>
                        <li class="clear">
                            <label for="categories" class="tit pilsoo">업종</label>
                            <div class="app_content categories">
                                <input type="text" class="w600" name="t_select1" id="t_select1" placeholder="업종을 선택해주세요." title="업종 목록">  
                                <div class="select_common">
                                    <select title="업종 목록" name="select" id="select" onchange="getSelectValue(this.value)" readonly>
                                        <option value="선택해주세요">선택해주세요.</option>
                                        <option value="빵집/카페">빵집/카페</option>
                                        <option value="음식점/반찬">음식점/반찬</option>
                                        <option value="교육/학원">교육/학원</option>
                                        <option value="병원/의료">병원/의료</option>
                                        <option value="뷰티/미용">뷰티/미용</option>
                                        <option value="의류판매점">의류판매점</option>
                                        <option value="세탁/수선">세탁/수선</option>
                                        <option value="운동">운동</option>
                                        <option value="가전">가전</option>
                                        <option value="자동차">자동차</option>
                                        <option value="운송">운송</option>
                                        <option value="부동산/인테리어">부동산/인테리어</option>
                                        <option value="아동">아동</option>
                                        <option value="법무/세무">법무/세무</option>
                                        <option value="통신/렌탈">통신/렌탈</option>
                                        <option value="반려동물">반려동물</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </div>
                            </div>
                        </li>                        
                        <li class="clear">
                            <label for="detail" class="tit pilsoo">상세업종</label>
                            <div class="app_content">
                                <input type="text" class="w100p" name="t_select2" id="t_select2" placeholder="예)카페, 한식전문점,옷수선, 반찬가게 등">
                            </div>
                        </li>                        
                        <li class="clear">
                            <label for="detail" class="tit pilsoo">주소</label>
                            <div class="app_content">
                                <input type="text" class="w500" placeholder="주소를 입력해주세요." name="sample6_address" id="sample6_address" readonly>
                                <div class="detail_search">                                    
                                    <a href="#" class="search" onclick="sample6_execDaumPostcode()">주소검색</a>
                                </div>
                            </div>
                        </li>
                        <li class="clear">
                            <label for="adress2" class="tit pilsoo">상세주소</label>
                            <div class="app_content"><input type="text" class="w100p" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세 주소를 입력해주세요."></div>
                        </li>                             
                        <li class="clear">
                            <label for="phone" class="tit pilsoo">전화번호</label>
                            <div class="app_content"><input type="tel" class="w100p" name="t_hp" id="t_hp" placeholder="고객이 연락할 수 있는 전화번호를 적어주세요."></div>
                        </li>     
                        <li class="clear">
                            <label for="phone" class="tit">홈페이지</label>
                            <div class="app_content"><input type="text" class="w100p" name="t_web" id="t_web" placeholder="업체 홈페이지/블로그 주소를 작성해주세요."></div>
                        </li>                                                                
                        <li class="clear">
                            <label for="intro" class="tit pilsoo">업체 소개</label>
                            <div class="app_content"><textarea id="intro" class="w100p" name="t_content" id="t_content" placeholder="상품/서비스 설명을 작성해주세요."></textarea></div>
                        </li>   
                       
                        <li class="clear">
                        	
                            <label for="image" class="tit pilsoo">업체사진 (3장이상)</label>
                            <div class="app_content filebox">
                            <input type="file" name="t_pic1" id="t_pic" class="img" alt="사진등록">
                            <br>
                            <input type="file" name="t_pic2" id="t_pic" class="img" alt="사진등록">
                            <br>
                            <input type="file" name="t_pic3" id="t_pic" class="img" alt="사진등록">
                            <br>
                            <input type="file" name="t_pic4" id="t_pic" class="img" alt="사진등록">
                            <br>
                            <input type="file" name="t_pic5" id="t_pic" class="img" alt="사진등록">
                            </div>
                           
                        </li>                                            
                    </ul>
                    <p class="btn"><input type="submit" class="btn_basecolor" value="등록"></p>
                </fieldset>
            </form>
        </div>
    </div>    
</body>
</html>