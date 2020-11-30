$(document).ready(function () {
	/* top 메뉴 마우스 및 포커스 이동 이벤트*/
	$("#gnb > li").on('mouseenter focusin' ,function(){
		$(".tree").show();//메뉴 펼치기
		$(this).addClass('on').siblings().removeClass('on');//top 선택 화살표 표시
		$(this).parent().find(".tree").not($(this).children(".tree")).hide();//미선택 메뉴 숨기기
	}).on('mouseleave' ,function(){ 
		$(this).find('.tree').slideUp('fast'); //펼쳐진 메뉴 숨기기
	});
	
	//left 메뉴 클릭 이벤트
	$('.depth2').on('click focusin' ,function(e){
		if($(this).attr("href") == "") e.preventDefault();//2번째 메뉴가 링크가 아닐 경우에만 사용
		if($(this).next('.depth3').hasClass("on")) return false; //현재 뎁스가 열려있으면 이벤트 막음
		$('.depth3').slideUp();
		$('.depth2, .depth3').removeClass('on');
		$(this).next('.depth3').slideDown().css('background-color', '#fafafa');
		$(this).next('.depth3').addClass('on');
		$(this).addClass('on');
	});
	
	/*left 초기 진입 첫메뉴 세팅*/
	if($('.depth2').hasClass("on")){
		$(".depth2.on").click();
	}else{
		$(".left_nav> ul> li:eq(0)>.depth2").click(); //선택된 메뉴가 없을 경우 최상위 뎁스 열림 - 사용되지는 않을거 같음
	}	
	
	/*tab 메뉴 초기 세팅*/
	//$(".tab_content").hide(); //Hide all content
	//$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	//$(".tab_content:first").show(); //Show first tab content
	
	///*tab 메뉴 클릭 이벤트*/
	//$("ul.tabs li").click(function() {
		//$("ul.tabs li").removeClass("active"); //Remove any "active" class
		//$(this).addClass("active"); //Add "active" class to selected tab
		//$(".tab_content").hide(); //Hide all tab content
		//var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		//$(activeTab).fadeIn(); //Fade in the active content
		//return false;
	//});
	
	//tab 메뉴 초기 세팅
	$(".dep2_content").hide(); //Hide all content
	$("ul.dep2_tab li:first").find("a").addClass("on");
	$(".dep2_content:first").show(); //Show first tab content
	
	//tab 메뉴 클릭 이벤트
	$("ul.dep2_tab li a").click(function() {
		$("ul.dep2_tab li a").removeClass("on"); //Remove any "active" class
		$(this).addClass("on"); //Add "active" class to selected tab
		$(".dep2_content").hide(); //Hide all tab content
		var activeTab = $(this).attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
	});
	
	//top메뉴 3단계 메뉴들 넓이 자동 조정
	$(".subtree li").each(function(){
		var len = gfnLengthMsg($(this).find("a").html());
		if(len > 19){
			$(this).css("width",8*len+"px");
		}
	});
	
	//tab메뉴 사이즈 조정
	if($(".tabs > li > a").length > 5){
		$(".tabs li a").css("padding","8px 13px");
		$(".tabs li").css("margin-left","0px");
		$(".tabs li").css("margin-right","5px");
		$(".tabs li").css("margin-top","5px");
	}
	
});