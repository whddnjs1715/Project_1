<%-- <%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %> --%>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import = "java.util.Iterator" %>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@ page import="com.main.fileupload.FileService" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="fboardDAO" class="com.main.fileupload.fileuploadDAO"/>
<jsp:useBean class="com.koreait.member.MemberDTO" id="memberDTO" />
<jsp:useBean class="com.koreait.member.MemberDAO" id="memberDAO" />
<jsp:setProperty property="*" name="memberDTO"/>
<%@page import="com.koreait.db.Dbconn" %>

<script src="js/get_count.js"></script>
<%
	FileService fs = new FileService();
	String imgName="";
	int maxSize = 10 * 1024 * 1024;
	String uploadUri = "/upload";	//웹서비스에서 사용되는 저장 경로
	//String uploadUri = fs.SAVE_PATH;	//웹서비스에서 사용되는 저장 경로
	String dir ="";
	String title="";
	int price=0;
	String comment="";
	String category="";
	String file1="";
	String file2="";
	String file3="";
	String file4="";
	String file5="";
	String email = (String)session.getAttribute("email");
	
	int count=0;	//파일 업로드 개수 세기
	
	//multipart로 전송되었는가
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	
	try{
		if(isMultipart){
			//메모리나 파일로 업로드 파일 보관하는 FileItem의 Factory설정
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(4096);//메모리에 저장할 최대 size
			//업로드 요청을 처리하는 ServletFileUpload 생성
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(maxSize);
			
			//업로드 요청 파싱해서 FileItem 목록 구함
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			
			while(iter.hasNext()){
				FileItem item = iter.next();
				
				//파일인지 여부 확인 (input type 이 file 이외의 폼 데이터인지)
				if(item.isFormField()){	//텍스트 입력인 경우
					String name = item.getFieldName();	//태그 name
					String value = item.getString("UTF-8");
					System.out.println("폼 필드 : " + name + " - " + value);
  					if(name.equals("name")){title=value;	/* product.setTitle(value); */}
					if(name.equals("price")){price=Integer.parseInt(value);	/* product.setPrice(value); */}
					if(name.equals("content")){comment=value;	/* product.setContent(value); */}
					if(name.equals("d_category_select")){category=value;	/* product.setCategory(value); */}
				}else{
					String name = item.getFieldName();
					String fileName = item.getName();	//파일 이름
					String contentType = item.getContentType();
					boolean isInMemory = item.isInMemory();
					long sizeInBytes = item.getSize();	//파일 사이즈
					System.out.println("파일이름 : " + fileName);
					
					String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());  //현재시간
					
					imgName = now+"-"+fileName;	//저장하고자 하는 파일의 이름
					dir = request.getSession().getServletContext().getRealPath(uploadUri);	//물리적 경로
					System.out.println(uploadUri+"의 물리적 경로 : "+dir);
					
					switch(count){
						case 0 : file1 = imgName;
						//데이터 저장 File(위치, 파일명)
						//만들어 놓은 웹컨텐츠 /upload 이곳에 저장하기 위해 경로를 지정한것. item.write(new File(dir, imgName));
							item.write(new File(dir, file1));
							break;
						case 1 : file2 = imgName;
							item.write(new File(dir, file2));
							break;
						case 2 : file3 = imgName;
							item.write(new File(dir, file3));
							break;
						case 3 : file4 = imgName;
							item.write(new File(dir, file4));
							break;
						case 4 : file5 = imgName;
							item.write(new File(dir, file5));
							break;
					}					
					count++;
				}
			}
			System.out.println(title);
			System.out.println(price);
			System.out.println(comment);
			System.out.println(category);
			System.out.println(file1);
			System.out.println(file2);
			System.out.println(file3);
			System.out.println(file4);
			System.out.println(file5);
			System.out.println(dir);
			System.out.println("email : " + email);
			if(fs.fileUpload(title, price, category, comment, file1, file2, file3, file4, file5, dir, email)){
				out.print("<script>alert('등록 완료');location.href='./index.jsp';</script>");
				System.out.println("email2 : " + email);
			}else{
				out.print("<script>alert('등록 실패');history.back();</script>");
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 완료</title>
</head>
<body>
<%-- 	<h2>파일 업로드</h2>
	
	<p>제목 : <%=name%></p>
	<p>카테고리 : <%=category %></p>
	<p>가격 : <%=price %>
	<p>내용 : <%=comment%></p>
	<!-- <p> 이미지 : <%=image %></p> -->
	
	<p>업로드위치 : <%=uploadPath%></p>
		
	<p>파일명1 : <%=filename1 %></p>
	<p>파일명2 : <%=filename2 %></p>
	<p>파일명3 : <%=filename3 %></p>
	<p>파일명4 : <%=filename4 %></p>
	<p>파일명5 : <%=filename5 %></p>
	
	<p>파일위치 : <%=filepath%></p> --%>
</body>
</html>