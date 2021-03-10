<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

    function uploadImgPreview() {
    	// @breif 업로드 파일 읽기
    	let fileList = document.getElementById( "upImgFiles" ).files;
		// @breif 업로드 파일 읽기
		function readAndPreview( fileList ) {
			// @breif 이미지 확장자 검사
			if ( /\.(jpe?g|png|gif)$/i.test( fileList.name ) ) {
				let reader = new FileReader();
				reader.addEventListener( "load", function() {
					let image = new Image();
					image.width = "264";
					image.height = "264";
					image.title = fileList.name;
					image.src = this.result;
					// @details 이미지 확장자 검사
					document.getElementById( "thumbnailImgs" ).appendChild( image );
				}, false );
				// @details readAsDataURL( )을 통해 파일의 URL을 읽어온다.
				if( fileList ) {
					reader.readAsDataURL( fileList );
				}
			}
		}
    	if( fileList ) {
                // @details readAndPreview() 함수를 forEach문을통한 반복 수행
		[].forEach.call( fileList, readAndPreview );
        }
    }
</script>
</head>
<body>
	 <!-- @breif accept 태그는 파일 업로드시 그것을 이미지 파일로 제한한다. -->
    <input type="file" id="upImgFiles" onChange="uploadImgPreview();" accept="image/*" multiple value="선택하기">
    <hr/>
    <div id="thumbnailImgs"></div>
    
    <input type="text" value="초기값">
    <input type="button" value="버튼 초기 값"></input>
</body>
</html>