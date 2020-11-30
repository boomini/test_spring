<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp" %>
<%--알기쉬운 상수도 검색 게시판 --%>
<link rel="stylesheet" href="/js/lightbox2-master/dist/css/lightbox.min.css">
<style>

/*webton*/
dl#webton { border-top: 2px solid #2c5ea5; }
dl#webton> dt { padding-left: 53px; border-bottom: 1px solid #ddd; background: url(/web/_images/sub/q.png) 20px center no-repeat; position: relative; }
dl#webton> dt> span { position: absolute; left: 19px; top: 17px; width: 24px; text-align: center; color: #fff; font-size: 11px; letter-spacing: 0px; }
dl#webton> dt> button { display: block; width: 100%; height: 50px; font-size: 14px; color: #444; text-align: left; background: #FFF; cursor: pointer; letter-spacing: -1px; cursor: pointer; font-family: 'malgun'; }
dl#webton> dd { border-bottom: 1px solid #ddd; padding: 10px 20px 10px 75px; font-size: 12px; color: #000; background: url(/web/_images/sub/a.png), #f8f9fd; background-repeat: no-repeat; background-position: 20px 10px; line-height: 22px; font-family: 'malgun'; }
dl#webton>dt>a {
    display: block;
    width: 100%;
    padding-left:10px;
    padding-top: 17px;
    padding-bottom: 17px;
    font-size: 14px;
    color: #444;
    text-align: left;
    background: #FFF;
    cursor: pointer;
    letter-spacing: -1px;
    cursor: pointer;
    font-family: "malgun";
}
</style>
<script src="/js/lightbox2-master/dist/js/lightbox-plus-jquery.js"></script>
<script>
lightbox.option({
    'resizeDuration': 200,
    'wrapAround': true
  })
</script>

    <div class="btn AR MgT10 MgB5">
        <a title="엑셀다운"  href="http://www.waternow.go.kr/jfile/readDownloadFile.do?fileId=33388&fileSeq=707&useSecurity=&uploadMode=db">웹툰 다운로드</a>
    </div>
    
    <dl id="webton">
        <dt>
            <!-- webton1 -->
			<a class="example-image-link"	href="/web/_images/webton/K-001.png" data-lightbox="webton1"  data-title="목차 - 알기쉬운 상수도"  data-alt="- 목차 -
			1.상수도역사 및 역할
			  인류와 함께한 건강지킴이, 상수도!
			2.상수도 생산 및 공급 
			  상수도는 취수→정수→송·배·급수로 구성됩니다 
			3.상수원보호구역
			  좋은 물로 수돗물을 만듭니다‘상수원보호구역’ 
			4.정수처리 공정 
			  안전한 물을 만드는 초대형·고성능 정수기, ‘정수장’ 
			5.고도정수 및 노후정수장 정비 
			  믿고 마시는 수돗물, 업그레이드됩니다 
			6.상수도 관망정비
			  상수도 관망정비로 이렇게 달라집니다 
			7.노후관 정비 
			  노후관 정비로 맑은 물을 지켜라! 
			8.누수관리 
			  새는 수돗물을 잡으면 상수도 예산이 방긋! 
			9.블록·유지관리시스템 
			  스마트시대에 걸맞는 상수도 서비스 
			10.국가상수도정보시스템으로 수돗물이 똑똑해집니다
			">
				목차
			</a>
        </dt>
        <dt>
            <!-- webton1 -->
			<a class="example-image-link"	href="/web/_images/webton/K-002.png" data-lightbox="webton1"  data-title="인류와 함께한 건강지킴이, 상수도! - 상수도 역사 및 역할"
			data-alt = "인류와 함께한 건강지킴이, 상수도!
			1.물에서 시작된 4대문명
			  4대문명은 물 사용이 쉬운 큰 강에서 발달했습니다.
			2.풍요로운 물로 번한 로마
			  로마는 매일 70만㎥의 물을 도시에 공급 했습니다.
			3.전염병을 퇴치한 상수도
			  19C 초, 강물을 모래여과로 정수하게 됩니다.
			4.충분한 수돗물 생산
			  19C 말, 기존대비 30배 이상 많은 물을 생산하게 됩니다.
			5.더 깨끗한 수돗물 생산 
			  오염된 강물에는 활성탄(흡착)과 오존가스(살균)를 사용하여 더 깨끗한 수돗물을 생산하게 됩니다.
			- 우리나라 근대 상수도상 
			  1908년, 우리나라 최초로 뚝도정수장이 건설되어 12,500㎥의 물을 생산·공급했습니다.
			- 인간수명을 늘려준 ‘상수도’ 
			  사람의 평균수명이 증가한 것은 깨끗한 물 사용으로 수인성 전염병 (장티푸스, 콜레라 등) 발생을 막았기 때문입니다."
			>
				인류와 함께한 건강지킴이, 상수도!
			</a>
        </dt>
        <dt>
            <!-- webton2 -->	    
			<a class="example-image-link"	href="/web/_images/webton/K-003.png" data-lightbox="webton1"  data-title="상수도는 취수 &gt; 정수 &gt; 송·배·급수로 구성됩니다. - 상수도 생산 및 공급"
			data-alt = "상수도는 취수→정수→송·배·급수로 구성됩니다
			- 원수·취수 ·도수
			  수돗물로 생산할 깨끗한 물을 정수장으로 보냅니다.
			- 정수
			  약품을 넣고 소독도 하여 안전하게 마실 수 있는 깨끗한 수돗물을 생산합니다.
			- 송·배수
			  정수장에서 생산된  수돗물을 상수도 관로를 통해 각 가정으로 보냅니다.
			- 급수·가정
			  수도꼭지를 틀기만 하면 깨끗한 수돗물이 콸콸 쏟아 집니다.
			- 취·정·송·배·급수 모두 중요
			  취수→정수→송·배·급수 시설 중 어느 하나라도 제대로 설치·운되지 않으면 깨끗하고 안전한 수돗물을 안정적으로 생산·공급할 수 없습니다.
			- 지방상수도·광역상수도 
			  지방상수도
			  1개 지자체가 단독으로 취수, 정수, 송·배·급수를 모두 운영
			  광역상수도
			  1개 지자체 단독으로 취·정수장 건설이 곤란한 경우 한국수자원공사 등이 취·정수장을 개발하여 공급 (배·급수는 지자체가 운영)"
			>
				상수도는 취수 &gt; 정수 &gt; 송·배·급수로 구성됩니다.
			</a>
        </dt>
        <dt>
            <!-- webton3 -->		
			<a class="example-image-link"	href="/web/_images/webton/K-004.png" data-lightbox="webton1"  data-title="좋은 물로 수돗물을 만듭니다. '상수원보호구역 - 상수도 보호구역"
			data-alt = "좋은 물로 수돗물을 만듭니다 ‘상수원보호구역’
			깨끗하고 안전한 원수를 확보하기 위해 상수원보호구역 및 공장설립 제한지역을 지정합니다.
			상수원보호구역에서 ‘돼요?’‘안 돼요?’
			공장설립 제한지역
			상수원의 종류 
			상수원은 흐름 및 존재형태에 따라 다음과 같이 구분됩니다. 우리나라의 상수원수는 하천표류수(49%)와 댐·호소수(44%)가 대부분입니다. "
			>
				좋은 물로 수돗물을 만듭니다. '상수원보호구역'
			</a>
        </dt>
        <dt>
            <!-- webton4 -->
			<a class="example-image-link"	href="/web/_images/webton/K-005.png" data-lightbox="webton1"  data-title="안전한 물을 만드는 초대형·고성능 정수기, '정수장' - 정수처리 공정"
			data-alt = "안전한 물을 만드는 초대형·고성능 정수기, ‘정수장’ 
			정수장은 침전-여과-소독으로 다양한 종류와 크기의 오염물질을 제거합니다.
			수돗물은 먹는 물 수질기준 59개 항목을 100% 만족하도록 완벽하게 생산됩니다. 
			맑은 물을 만드는 꼼꼼한 정수장 
			원수 및 정수 수준에 따른 여러가지 정수방법
			완속여과
			수돗물 양이 많지 않고 원수가 깨끗하면 약품을 넣지 않고 천천히 여과합니다. 
			고도정수처리 
			오염물질을 철저하게 제거하기 위해 기존시설에 활성탄과 오존처리를 추가합니다.
			막여과 
			모래 대신 여과막을 이용하면 부지가 줄고 유지관리도 쉬워지며 세균과 오염물질을 더 제거할 수 있습니다."
			>
				안전한 물을 만드는 초대형·고성능 정수기, '정수장'
			</a>
        </dt>
        <dt>
            <!-- webton5 -->
			<a class="example-image-link"	href="/web/_images/webton/K-006.png" data-lightbox="webton1"  data-title="믿고 마시는 수돗물, 업그레이드됩니다. - 고도정수 및 노후정수장 정비"
			data-alt = "믿고 마시는 수돗물, 업그레이드됩니다
			고도정수처리를 거치면 냄새 없고 건강한 수돗물이 만들어집니다.
			노후된 단순여과기를 최신 정수시설로 업그레이드 합니다.
			활성탄여과지 
			모래여과된 물이 숯 알갱이로 된 여과층을 통과하면서 미세 오염물질이 제거됩니다.
			오존접촉지 
			소독력과 산화력이 강한 오존(O₃)을 사용하여 오염물질을 파괴하거나 미생물을 살균합니다.
			막여과 
			막에 있는 촘촘한 구멍을 통해 순수한 물만 통과시키는 공법으로 구멍크기에 따라 MF, UF, NF, RO 등으로 구분합니다."
			>
				믿고 마시는 수돗물, 업그레이드됩니다. 
			</a>
        </dt>
        <dt>
            <!-- webton6 -->
			<a class="example-image-link"	href="/web/_images/webton/K-007.png" data-lightbox="webton1"  data-title="상수도 관망정비로 이렇게 달라집니다. - 상수도 관망정비"
			data-alt = "상수도 관망정비로 이렇게 달라집니다 
			상수도 관망정비
			단수 없는 물공급
			24시간 언제나 수돗물이 콸콸!
			낡고 오래된 관을 교체하여 사고가 줄어듭니다. 또한 관망을 체계적으로 정비하고 밸브와 비상연결관을 설치합니다. 이렇게 하면 24시간 단수 없는 수돗물 공급이 가능해집니다.
			상수도사업 경영개선
			수돗물 값이 내려갑니다
			상수도사업 경이 개선되면 더 좋은 시설을 만들기 위한 투자가 가능해지며 수돗물 값도 내려갈 수 있습니다."
			>
				상수도 관망정비로 이렇게 달라집니다.
			</a>
        </dt>
        <dt>
            <!-- webton7 -->
			<a class="example-image-link"	href="/web/_images/webton/K-008.png" data-lightbox="webton1"  data-title="노후관 정비로 맑은 물을 지켜라! - 노후관 정비"
			data-alt = "노후관 정비로 맑은 물을 지켜라!
			물 샐 틈 없이 노후관을 찾아 교체하고 보수합니다.
			노후관 선정·확인·공사 절차
			노후관 선정
			기초자료, 민원 등 정확한 분석 후 현장 확인   
			땅 속의 관을 직접 조사할 수 없기 때문에 기초자료(관 종류, 공사 년도, 관 크기 등)와 민원현황(누수, 수압, 수질 등)을 프로그램으로 분석 하여 누수가 자주 발생하거나 내부에 녹 등이 발생하는 관을 선정한 후 상수관망 로봇이나 내시경으로 관내부를 현장 확인합니다."
			>
				노후관 정비로 맑은 물을 지켜라!
			</a>
        </dt>
        <dt>
            <!-- webton8 -->
			<a class="example-image-link"	href="/web/_images/webton/K-009.png" data-lightbox="webton1"  data-title="새는 수돗물을 잡으면 상수도 예산이 방긋! - 누수관리"
			data-alt = "새는 수돗물을 잡으면 상수도 예산이 방긋!
			누수관리
			수압관리
			수압이 높으면 새는 물도 많아집니다. 수압을 낮추면 수돗물 사용이 편리해지고 누수량도 줄어듭니다.
			적극적 누수탐사  
			누수음은 관자재 마찰음인데 소리가 커지는 곳이 누수지점입니다. 
			노후불량관 교체 
			누수가 자주 생기거나 누수발생 가능성이 높은 관로를 집중교체하면 누수를 예방할 수 있습니다.
			신속한 누수복구 
			보이지 않는 누수가 많기 때문에 신속히 누수를 찾아 복구하는 것이 중요합니다.
			누수량을 줄이면 재정도 ‘튼튼’
			매년 누수로 인해 손실되는 수돗물은 6.6억톤으로 재정손실이 5천억원에 달합니다.
			사용이 편한 수압으로 조정 
			수압관리를 통해 적정한 수압(물기둥 15~35m)으로 조정되지만 일부 시민은 수압이 약하다고 느낄 수 있습니다. 메인밸브 완전개방이나 옥내배관 청소로 개선될 수 있습니다."
			>
				새는 수돗물을 잡으면 상수도 예산이 방긋!
			</a>
        </dt>
        <dt>
            <!-- webton9 -->
			<a class="example-image-link"	href="/web/_images/webton/K-010.png" data-lightbox="webton1"  data-title="스마트시대에 걸맞는  상수도 서비스 - 블록·유지 관리 시스템"
			data-alt = "스마트시대에 걸맞는 상수도 서비스 
			블록시스템과 유지관리시스템으로 상수도 관망이 스마트해집니다.
			복잡하고 비체계적인 관망 구성 ?
			경험에 의존한 주먹구구식 관망관리
			명확하고 체계화된 물 공급시스템 구축 ?
			실시간 관망정보를 활용한 최적관리 실현
			블록시스템
			복잡한 상수도 관망을 체계적으로 정리하고 일정한 크기로 분할한 후 구역별로 물 사용량, 수압, 수질을 관리하는 최신 관망관리기술입니다.
			TM/TC
			원격감시(Tele-Monitoring)·원격제어(Tele-Control)라고 하며 통합운센터에서 통신시설을 이용하여 현장의 상수도 관망시설을 감시하고 작동시키는 기술입니다."
			>
				스마트시대에 걸맞는  상수도 서비스
			</a>
        </dt>
        <dt>
            <!-- webton10 -->
			<a class="example-image-link"	href="/web/_images/webton/K-011.png" data-lightbox="webton1"  data-title="국가상수도정보시스템으로 수돗물이 똑똑해집니다."
			data-alt = "국가상수도정보시스템으로 수돗물이 똑똑해집니다
			국가상수도정보시스템에는 시민과 지자체가 최신 자료를 언제나 볼 수 있도록 공개하고 있습니다. 또한 방대한 자료를 체계적으로 정리하고 이를 활용해 우리나라 상수도 정책을 수립하는 데 사용하고 있습니다.
			국가상수도정보시스템으로 정부3.0 실현
			정부3.0이란? 
			공공정보를 적극 공유하여 국민에게 맞춤형 서비스를 제공하고 일자리창출과 창조경제를 지원하는 새로운 정부운패러다임 입니다.
			생활 속 정보로 스마트 상수도 만들기
			빅데이터(Big Data)란? 
			SNS, 사진 등 많은 데이터를 수집·분석하여 유용한 정보를 활용하는 기술로 상품마케팅 등에 적용되는 최신 기술입니다. 상수도 분야에도 빅데이터 기술을 도입하면 시민이 원하는 스마트한 수돗물이 공급됩니다."
			>
				국가상수도정보시스템으로 수돗물이 똑똑해집니다.
			</a>
        </dt>
    </dl>
