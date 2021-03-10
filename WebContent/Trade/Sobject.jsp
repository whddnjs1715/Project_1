<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.util.Iterator" %>
<%@page import="java.util.Enumeration"%>
<%@ page import="com.main.fileupload.*" %>
<%@ page import ="com.main.filecount.*" %>
<%@page import="com.koreait.db.Dbconn" %>
<jsp:useBean id="fboardDAO" class="com.main.fileupload.fileuploadDAO"/>
<jsp:useBean class="com.koreait.member.MemberDTO" id="memberDTO" />
<jsp:useBean class="com.koreait.member.MemberDAO" id="memberDAO" />
<jsp:setProperty property="*" name="memberDTO"/>

<%
	String So_fullpath = (String)session.getAttribute("filepath");
	String email = null;
	email = (String)session.getAttribute("email");
	System.out.println(email);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="./css/NewFile.css?ver=1234">
 <link rel="stylesheet" type="text/css" href="./css/category.css?ver=1234">
 <!-- <link rel="stylesheet"  type="text/css" href="category.css?ver=2">-->
 
<title>물건올리기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="./js/upload.js"></script>
<script src="./js/j_category.js"></script>
<!--  close 안됨-->


</head>
<body>
<pre>
	<code>
		<script>
			function closethis(){
				window.open('','_parent','');
		        window.close();
			}
		</script>
	</code>
</pre>
<form action="imgup.jsp" method = "post" id="f_form" name="nf_form" enctype = "multipart/form-data" target="iframe1">
    <div id = "sell_object" style="margin: 0 auto; border: 3px solid #ff8a3d; border-radius: 30px">
        <div class="object_h">
            <div class="oh_left">
                <h2>중고거래 글쓰기</h2>
            </div>	
       	
            <div class="oh_right">
               <input type = "submit" id="b_sumit" value="완료" <a href="javascript:closethis();" ></a>>
            </div>
        </div>
        
        <div class="object_b">
            <div class="photo">
            <!-- 업로드 -->
            
               <!--  <form action="imgup.jsp" method = "post" id="f_form" name="nf_form" enctype = "multipart/form-data" target="iframe1">  -->
	                <div class = "cammeSra">
	                	<label for="img_select">
	                		<img src="./images/cammera.png" alt="">
	                	</label>
		                <input type="file" name="s_pic" id ="img_select" accept="image/*" style="display:none" multiple onChange="uploadImgPreview();" maxlength="5"/>
		                <div id = "m_div" class="preview">
		                </div>
	                </div>	
                
            </div>
            <div class="name">
                <input  name ="name" type="text" placeholder="제목" maxlength="15">
            </div>
            <input type="hidden" name="d_category_select" class="category_input"/>
            <div class="category list_container">
                <div id ="C_text">카테고리 선택<span>▽</span></div>
                <div class="category_container">
			      	<ul>
			      		<li>디지털/가전</li>
			      		<li>가구/인테리어</li>
			      		<li>유아동/유아도서</li>
			      		<li>생활/가공식품</li>
			      		<li>스포츠/레저</li>
			      		<li>여성잡화</li>
			      		<li>여성의류</li>
			      		<li>남성패션/잡화</li>
			      		<li>게임/취미</li>
			      		<li>뷰티/미용</li>
			      		<li>반려동물용품</li>
			      		<li>도서/티켓/음반</li>
			      		<li>기타 중고물품</li>
			      		<li>디지털/가전</li>
			      		<li>삽니다.</li>
			      	</ul>
   			</div>
            </div>

            <div class="price">
                <input name ="price" type="text" placeholder="가격" maxlength="15">

            </div>
            <div class="content">
                <textarea name="content" cols="54" rows="18" placeholder="가품 및 판매금지품목은 게시가 제한 될 수 있어요." style="width:450px; height:335px"></textarea>
            </div>
        </div>
        <div class="object_f">
            <div class="of_left">
                <span>게시글 보여줄 동네 고르기<span>
            </div>
            <div class="oh_right">
                <span>완료</span>
            </div>
        </div>
    </div>
      <!--  category  -->
   
    
</form>     
</body>

</html>
