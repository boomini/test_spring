<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/jquery.bxslider/jquery.bxslider.min.js"></script>
<link href="/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
<style>
#map-data { width: 580px; padding: 20px 0 20px 20px; float: right; }
#map-data section { margin-bottom: 15px; }
#map-data section:last-child { margin-bottom: 0px; }
#map-data section b { font-family: Verdana; font-size: 12px; font-weight: normal; margin-left: 3px; }
#map-data section h3 { padding-left: 18px; background: url(/web/_images/main2017/icon_09.png) left center no-repeat; font-size: 18px; font-family: 'notokr-bold'; font-weight: normal; letter-spacing: -1px; margin-bottom: 5px; position: relative; }
#map-data section h3> span { position: absolute; right: 0px; bottom: 0px; font: 11px 'Dotum'; color: #6b6b6b; }

#map-data section> span { background: #eff4f9; border-top: 2px solid #0e4192; display: block; }
#map-data section> span> ul { border-bottom: 1px solid #bfd4e0; }
#map-data section> span> ul:after { display: block; clear: both; content: ''; }
#map-data section> span> ul> li { padding: 8px 0px; font: bold 14px 'Dotum'; border-right: 1px solid #bfd4e0; float: left; display: block; text-align: center; }
#map-data section> span> ul> li:last-child { border-right: 0px; }
#map-data section> span> ul> li> em { margin-top: 3px; display: block; font-size: 12px; color: #6b7f9f; letter-spacing: -1px; }


#map-data section .bx-viewport> ul { }
#map-data section .bx-viewport> ul> li { color: #434343; border-bottom: 1px solid #bfd4e0; /*background: #CCC;*/ }
#map-data section .bx-viewport> ul> li> ul { font-size: 12px; }
#map-data section .bx-viewport> ul> li> ul:after { content:""; clear:both; display:block;  }
#map-data section .bx-viewport> ul> li> ul> li { float: left; text-align: center; padding: 8px 0px; display: block; font: 12px Verdana, "Dotum"; color: #737373; border-right: 1px solid #bfd4e0; }
#map-data section .bx-viewport> ul> li> ul> li:last-child { border-right: 0px; }

ul.col3> li { width: 84px; }
ul.col3> li:last-child { width: 400px; }
</style>
<script>
$(function(){
	$('.bxslider').bxSlider({
		  auto: true,
		  autoControls: true,
		  stopAutoOnClick: true,
		  pager: true,
		  slideWidth: 600
		});
	
	$('.bxslider3').bxSlider({
	  	  mode: 'vertical',
	  	  controls: false,  
	  	  autoControls: true,
	      minSlides: 2,
	      pager : false,
	      auto : true,
	      autoHover : true, 
	      speed: 1000
	});
})

/* $('.bxslider,.bxslider2').bxSlider({
			  pager: false,//페이지 바로가기 버튼을 보여지게 합니다.
			  speed: 1000, //이미지가 다음 이미지로 바뀌는데 걸리는 시간입니다
			  auto: true,
			  pause: 6000, //머무르는 시간 
			  autoHover:true,
			  //pause: 4000,// - 하나의 이미지가 멈춰서 보여지는 시간입니다. 4000ms 가 기본값입니다.
			  //controls: false  //양옆화살표 
			  autoControls: false,
			  touchEnabled: false
			  ,onSliderResize: function(){
				    // do mind-blowing JS stuff here
				  $(".bx-viewport").css("height", "calc(100%)");
				  }
			}); */
</script>
<br />
<br />
주소 :https://bxslider.com/
<br />
<br />
<br />
<div class="bxslider">
    <div>
        <img src="http://bxslider.com//assets/images/coffee1.jpg">
    </div>
    <div>
        <img src="http://bxslider.com//assets/images/coffee2.jpg">
    </div>
    <div>
        <img src="http://bxslider.com//assets/images/coffee3.jpg">
    </div>
</div>
<div id="map-data">
    <section>
        <h3>정수장별 급수계통</h3>
        <span>
            <ul class="col3">
                <li>수계</li>
                <li>급수구역수</li>
                <li>계통도</li>
            </ul>
        </span>
        <div class="tableObj2" id="tableObj2">
            <ul class="bxslider3">
                <li>
                    <ul class="col3">
                        <li>&nbsp;</li>
                        <li>26</li>
                        <li style="cursor: pointer;"><a href="javascript:;">팔당1(취수시설) → 광암(정수시설) → 정림(가압시설)</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="col3">
                        <li>&nbsp;</li>
                        <li>27</li>
                        <li style="cursor: pointer;"><a href="javascript:;">팔당1(취수시설) → 광암(정수시설) → 학암(가압시설)</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="col3">
                        <li>&nbsp;</li>
                        <li>28</li>
                        <li style="cursor: pointer;"><a href="javascript:;">팔당1(취수시설) → 광암(정수시설) → 학암(가압시설)</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="col3">
                        <li>&nbsp;</li>
                        <li>29</li>
                        <li style="cursor: pointer;"><a href="javascript:;">팔당1(취수시설) → 광암(정수시설) → 학암(가압시설)</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </section>
</div>