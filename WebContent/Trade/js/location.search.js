"use strict"



// $("select[name^=sido]").change(function() {
//  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
//  var $gugun = $(this).next(); // 선택영역 군구 객체
//  $("option",$gugun).remove(); // 구군 초기화
//
//  if(area == "area0")
//   $gugun.append("<option value=''>구/군 선택</option>");
//  else {
//   $.each(eval(area), function() {
//    $gugun.append("<option value='"+this+"'>"+this+"</option>");
//   });
//  }
// });


function changeRegion(a,b){
	//index.jsp -> onchange="changeRegion('r1', this.value)" 
	//a 값은 그 다음 자세한 상세 주소를 선택할 수있게 하는 css나 js 값을 조건식으로 넣을 것이고
	//b값은 선택한 value값이 들어오게한다.
	let x = document.getElementById("region1");
	let y = document.getElementById("region2");
	//console.log(x.length);
	console.log(y.length);
	console.log(y.disabled);
	
	
	
	
	for(var i = 0; i<x.length; i++){
		//select option 배열 각자 값 구하기 -> regionval
		let regionval = x.options[i].value;
		
		let gettitlename = document.getElementById("hot-articles-head-title");
		let getlocationname;
		//console.log(regionval)
		//console.log(x.options[0].value);
		if(x.options[0].value==b){
			
			
			gettitlename.innerText ="중고거래 인기매물"
			y.disabled=true; 
				}
		else if(x.options[i].value==b){
			getlocationname = b;
			
			gettitlename.innerText = getlocationname += " 중고거래 인기매물";
			y.disabled=false;
			
			 
		}else{
			y.disabled=false;
		}
		
		
			 
			
		
		
		
	}
	
	
	
}