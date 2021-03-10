'use strict';
const uploadImgPreview = function(){
	//Document 객체는 웹 페이지 그 자체를 의미합니다.
	//웹 페이지에 존재하는 HTML 요소에 접근하고자 할 때는 반드시 Document 객체부터 시작해야 합니다.
	let fileList = document.getElementById("img_select").files;
	
	// @breif 업로드 파일 읽기
	function readAndPreview(fileList){
		// @breif 이미지 확장자 검사
		if(/\.(jpe?g|png|gif)$/i.test(fileList.name)){
			
			/*FileReader 객체는 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 
			읽을 파일을 가리키는 File 혹은 Blob 객체를 이용해 파일의 내용을(혹은 raw data버퍼로) 읽고
			사용자의 컴퓨터에 저장하는 것을 가능하게 해줌*/
			let reader = new FileReader();
			
			////리소스와 그 의존 리소스의 로딩이 끝났을 때.
			//지정된 타입의 이벤트가 발생했을 때, 알림(Event 인터페이스를 구현하는 객체)을 받는 객체
			//EventListener 인터페이스 또는 JavaScript function를 구현하는 객체여야만 합니다. 
			reader.addEventListener("load", function(){
				let image = new Image();
				image.width = "60";
				image.height = "60";
				image.title = fileList.name;
				image.src = this.result;

				//appendChild() 메소드는 새로운 노드를 해당 노드의 자식 노드 리스트(child node list)의 맨 마지막에 추가
				document.getElementById( "m_div" ).appendChild( image );
			}, false );
			// @details readAsDataURL( )을 통해 파일의 URL을 읽어온다.
			if( fileList ) {
				reader.readAsDataURL( fileList );
			}
		}
	}
	if(fileList){
    // @details readAndPreview() 함수를 forEach문을통한 반복 수행
	[].forEach.call(fileList,readAndPreview );
    }
}

//$(function(){
//	$("input[type = 'submit']").click(function(){
//		var $fileUpload = $("input[type='file']");
//		if(parseInt($fileUpload.get(0).files.length)>5){
//			
//			alert("사진 최대 5개 등록");
//		}
//	});
//});
