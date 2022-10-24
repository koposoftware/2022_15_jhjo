<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하나 FINDER</title>
	
    <link href="css/styles.css" rel="stylesheet" />
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    
    <script src="js/slick.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <link href="css/all/allFile.css" type="text/css" rel="stylesheet">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    
    
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    
    <!-- Libraries Stylesheet -->
	<link href="css/animate.min.css" rel="stylesheet">
	<link href="css/owl.carousel.min.css" rel="stylesheet">
	<link href="css/lightbox.min.css" rel="stylesheet">
    
    <link href="css/all/allFile.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/video/backVideo.css">
	<link href="css/login/login.css" rel="stylesheet">
	<link href="css/card/card.css" rel="stylesheet">
	<link href="css/modal/modal.css" rel="stylesheet"> 
	<link href="css/slick/slick.css" rel="stylesheet"> 
	<link href="css/slick/slickModal.css" rel="stylesheet"> 
	
	
	
    
	<!--AOS  -->
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    
    <!--테이블 JQUERY  -->
    
    <link rel="stylesheet" type="text/css" href=" https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" />
    
    <style>
      img {
        max-width: 100%;
        height: auto;
      }
      .slider {
        width: 1280px;
        margin: 0px auto;
      }
      .slick-prev:before, .slick-next:before {
        color: #444444;
      }
    </style>
    
  
</head>
<body>
    

    <!-- Spinner End -->
    
    <!-- Topbar Start -->
  
	
    <!-- Topbar End -->


    <!-- Brand & Contact Start -->
    <div class=" py-4 px-5 wow fadeIn animated" data-wow-delay="0.1s">
        <div class="row align-items-center top-bar">
            <div class="col-lg-4 col-md-12 text-center text-lg-start">
                <a href="/" class="navbar-brand m-0 p-0">
                    <h1 class="fw-bold text-primary m-0"><img class="" src="images/hana/logo.png" alt="" style="width: 240px;"></h1>               
                </a>
            </div>
            <div class="col-lg-4">
          
            </div>
            <div class="col-lg-4 d-flex flex-row-reverse">
            <c:choose>
			    <c:when test="${empty loginVO}" >
            		<div class="p-1"><a href="/login" class="btn btn-sm btn-light py-2 px-4 d-none d-lg-block mx-1" id="login">회원가입</a></div>
            		<div class="p-1"><a href="/login" class="btn btn-sm btn-light py-2 px-4 d-none d-lg-block mx-1" id="login">로그인</a></div>
        		</c:when>
				<c:otherwise>
					<div class="p-1 d-flex justify-content-center" style="display : flex; align-items : center; justify-content : center; font-family: pretendard; font-size:18px; color:black;"><div style="position:relative;"><img src="images/icon/bell2.png" style="width:35px; cursor:pointer;" onclick="checkTodoListAndUpdate()"><div id="alertRed" style="position:absolute; top:-10px; left:15px;"></div></div>&nbsp;&nbsp;<div>${loginVO.name}님 환영합니다.&nbsp;&nbsp;</div><a href="/logout" class="btn btn-sm btn-light py-2 px-4 d-none d-lg-block mx-1" id="login">로그아웃</a></div>
				</c:otherwise>
			</c:choose>
        	</div>
        </div>
        
    </div>
    <!-- Brand & Contact End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg navbar-dark sticky-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s" style="background-color:#008675" id="navFix">
        <a href="#" class="navbar-brand ms-3 d-lg-none btn btn-primary">MENU</a>
        <button type="button" class="navbar-toggler me-3" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse p-3" id="navbarCollapse">
            <div class="navbar-nav me-auto p-4 p-lg-0">
            <c:if test="${loginVO.userType ne 'ADMIN'}">  
                <a href="about.html" class="nav-item nav-link"><button class="btn" id="navBtn">카드 안내</button></a>
                <a href="/cardSection" class="nav-item nav-link"><button class="btn" id="navBtn">하나 카드</button></a>
         
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><button class="btn" id="navBtn">내 카드 정보</button></a>
                    <button class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">
                        <a href="/checkMyCard" class="dropdown-item"><img src="images/icon/report.png" style="width:30px;">&nbsp;카드 정보 확인하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <hr>
                        <a href="/moveConsumeCalendar" class="dropdown-item"><img src="images/icon/calendar.png" style="width:30px;">&nbsp;소비 일정 보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <hr>
                        <a href="/recommendCard" class="dropdown-item"><img src="images/icon/find.png" style="width:30px;">&nbsp;내 카드 찾기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>    
                    </button>
               </c:if>
                <c:if test="${loginVO.userType eq 'ADMIN'}">        
                </div>
                     <a href="/moveDashBoard" class="nav-item nav-link"><button class="btn" id="navBtn">대시 보드</button></a>
            	</div>
      			</c:if>
       	 </div>
    </nav>
    <!-- Navbar End -->
    
    <!-- top 메뉴랑 똑같이 만드는중  -->
    <button id="modalButtonForTodoListSocket">모달창</button>

	<div class="modalTodoListSocket">

  		<div class="modal_contentTodoListSocket" title="클릭하면 창이 닫힙니다.">
  			  <img src="images/hana/logo.png" style="width:100px;">
  			  <div id="modalFixedCost" class="mt-3" style="font-family:pretendard; font-size:16px; color:black;"><img src="images/icon/todoListCalendar.png" style="width:30px;">${loginVO.name}님의 고정비 내역</div>
  			  <div id="modal_contentTodoListSocketAdd"></div>
  		</div>

	</div>
    
    
    

       <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light Jsidebar" href="#!"><div><img src="images/icon/myPage.png" style="width:30px;">&nbsp;마이페이지</div></a>
                    <a class="list-group-item list-group-item-action list-group-item-light Jsidebar" href="#!"><div><img src="images/icon/report.png" style="width:30px;">&nbsp;상세 소비 레포트</div></a>
                    <a class="list-group-item list-group-item-action list-group-item-light Jsidebar" href="/moveConsumeCalendar"><div><img src="images/icon/monitor.png" style="width:30px;">&nbsp;소비 일정 관리</div></a>
                </div>
            </div>
            <!-- Page content wrapper-->
            
            
            <div id="page-content-wrapper">
                <!-- Top navigation-->            
                <!-- Page content-->
                <div class="container-fluid" style='padding: 0px;' id="MyCardDisplayTitle">
                	<section id="slickMyCheckCard">
                    <div class="d-flex justify-content-center"><div class="mt-5" id="myCardTitle" data-aos="fade-up" data-aos-duration="2000">${loginVO.name}님의 카드 목록</div></div>	
                    <div class="d-flex justify-content-center">
                    	<hr align="center" style="border:12px #008675; width: 30%; height:5px" class="">
                    </div>		
 				    <div class="center d-flex justify-content-center myCardDisplayList">
 				    	<c:forEach items="${myCardList}" var="myCard">
							<div style="position: relative;" class="box mb-2" data-aos="flip-left"><div class="d-flex justify-content-center"><div class="slickMyCard d-flex justify-content-center">${myCard.cardName}</div></div><div class="d-flex justify-content-center"><img src="${myCard.cardImgUrl}" id="${myCard.cardCateNum} ${myCard.cardNum} ${myCard.cardImgUrl} ${myCard.cardName}" onClick="myConsumeT(this.id);" class="myCardCollection main_image"></div><div class="d-flex justify-content-center mb-3"><span class="notificationAboutCard">※ 카드를 클릭하시면 상세한 정보를 볼 수 있습니다.</span></div><div style="top:160px; left: 126px; width: 300px; bottom: 50px; font-size: 1.15em; position: absolute; font-family:pretendard" class="imtext"><span>카드번호 : ${myCard.cardNum}<br>CVC 번호: ${myCard.cardCvcNum}<br>유효 기간: ${myCard.cardValidDate}</span></div></div>
						</c:forEach>
			   		</div>   		
                  	 <div class="d-flex justify-content-center"><div align="center" class="" id="MyCardRecentUseTitle" data-aos="zoom-out-down">최근 3개월 이용현황</div></div>
                  	     <div class="d-flex justify-content-center">
                    			<hr align="center" style="border: 12px #008675; width: 30%; height:5px" class="">
                  		 </div>
                  		 <div class="d-flex justify-content-center">
                  		 	<div id="recentConsumeAlert" class="d-flex align-items-center mt-2 justify-content-center" data-aos="fade-up" data-aos-anchor-placement="top-bottom">
                  				<span class="spendAlert">&nbsp;&nbsp;&nbsp;지난 달보다 지출이<span id="blinkDifference" style="color:${messageColor}" data-aos="fade-up" data-aos-duration="2000"> ${message}</span><span data-aos="fade-up" data-aos-duration="2000">${incrementType}</span></span>
                  			</div>
                  	     </div>
                  	     <div class="container text-center">
                  	  		<div class="row">	
                  	   			<div class="col-8" data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine">    
                  	   				<div class="mt-5" id="recentConsumeCheckTableTitle">최근 거래 내역 조회</div>
                  						<table class="table table-hover mt-2 recentConsumeTable" id="data_list">
                  							  <thead>
   												 <tr>
    											   <th scope="col" class="text-center">거래 날짜</th>
    											   <th scope="col" class="text-center">카드 번호</th>
    											   <th scope="col" class="text-center">소비 항목</th>
     											   <th scope="col" class="text-center">금액</th>
    											 </tr>							
                  						 	 </thead>
                  						 	 <tbody>
                  						 	 </tbody>
                  						</table>		
                  				</div>
                  				<div class="col-4 mt-5" data-aos="zoom-out-down">	
                  					<div class="mt-5 slickChart d-flex justify-content-around" >
										<figure class="highcharts-figure" id="myrecentConsumeTrandChart" >
 											<div id="container"></div>
										</figure>
                  					</div>
                  				</div>	
                 	 		</div>
                 		</div>       	
                    </section>

                </div>
            </div>
        </div>
        
        <button id="slickConsumeTrandinModalBtn"></button>


		<div id="slickmodalTrandModal">
  			<div id="slickmodalTrandModalContent" title="클릭하면 창이 닫힙니다.">
				<div class="d-flex justify-content-center">
					<img class="mt-1 mb-3" src="images/hana/logo.png" style="width: 300px;">
				</div>
				<div  class="mt-5">
					<span id="slickmodalInMemberName"><img class="" src="images/icon/report.png" alt="" style="width: 80px;" id="closeModal">    ${loginVO.name}님의 소비 레포트</span>
				</div>	
				<div class="d-flex justify-content-center mt-3" id="slickHrAdd"></div>	
                <div class="container text-center mt-5">
                	<div class="row">
                	  <div class="col-6 mt-2" id="yourRecentConsumeParent">
                	  	 <div id="yourRecentConsume" class="mb-2">최근 일주일 상세 소비</div>
               			 <div id="graph" class="m-2">
						 </div>	
					  </div>
					  <div class="col-6" id="yourRecentConsume2Parent">
					  	 <div id="yourRecentConsume2">${loginVO.name}님의 최근 3개월간 소비 패턴</div>     		
						 <div id="graph2" class="m-2">
					     </div>
					  </div>   
  					</div>
				</div>
				<div class="d-flex justify-content-center mt-5">
				 	<div id="benefitAlert">선택하신 카드로 받은 혜택입니다</div>
				</div>
				 <div id="benefitListWithCard"> 
				 	 <div class="container text-center mt-1">
				 		<div class="row" style="width:100%">
				 			<div class="col-4" id="cardImageInSlick" class="">
				 				
				 			</div>	
				 			<div class="col-8" id="cardBenefitSlick">
				 				실제 카드 혜택들
				 			</div>	
				 		</div>
				 	 </div>
				 </div>
				</div>   
			</div>  
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
	</footer>         
	
	<button id="slickStartModalButton"></button>

	<div class="slickStartModal">
  		<div class="slickStartModal_content" title="클릭하면 창이 닫힙니다.">
			 <img src="gif/around-the-world.gif" alt="image" class="radius_img_2" id="slickAnalysis">
			 <div id="slickStartModalAlert" class="mt-4">
			 해당 페이지에서 ${loginVO.name}님의 소비내역과 <br>
			 카드 정보를 확인할 수 있습니다.
			 </div>
  		</div>
	</div>
	
	
	
        
	 <img src="gif/worldwide.gif" alt="image" class="radius_img_2" id="FastWay">
	<!--소비트렌드를 위한 모달 띄우기! -->
	
	




	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

	<script src="js/wow.min.js"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/counterup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/lightbox.min.js"></script>	
	
	<script src="js/main.js"></script>
	
	
	<script src="js/scripts.js"></script>
	
	<!--하이차트-->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<script src="https://code.highcharts.com/modules/drilldown.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script> 
	
	<!--테이블 라이브러리 -->
	<script src="<c:url value='/js/jquery-3.5.1.min.js'/>" charset="utf-8"></script>
	<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
	
	<script>
	$(function(){ 
		$('#slickConsumeTrandinModalBtn').click(function(){
		  $('#slickmodalTrandModal').fadeIn();
		});

    	$('#slickmodalInMemberName').click(function(){
	 		 $('#slickmodalTrandModal').fadeOut();
		});
    	$("#slickStartModalButton").click(function(){
    		 $(".slickStartModal").fadeIn();
    	});
    		  
    	$(".slickStartModal_content").click(function(){
    		 $(".slickStartModal").fadeOut();
    	});   	
	});

	
	</script>
	<script>
		Highcharts.setOptions({
			lang:{
				thousandsSep:','
			}			
		})
	</script>
	
	<script> 
	const now = new Date().toLocaleString();
	let sumC = Number('${sumC}')
	let sum1 = Number('${sum1}')
	let sum2 = Number('${sum2}')
	

	let name = '${loginVO.name}'
	let realNow = now.split('.');
	let year = realNow[0];
	let month = realNow[1].trim();
	let day = realNow[2].trim();
	month=Number(month);
	let month_1 = month-1;
	let month_2 = month-2;
	const chart = Highcharts.chart('container', {
		  colors: ['#81F7D8','#81F7D8','#008485'],	
		  title: {
		    text:name +'님의 소비내역',
	        style: {
	            fontFamily:'pretendard',
	           	 fontSize: '1.6em'	
	        }
		  },
		  subtitle: {
		    text: '[최근 3개월 소비 내역]',
		    style: {
	             fontFamily:'pretendard',
	           	 fontSize: '1.2em'	
	        }
		  },
		  xAxis: {
		    categories: [year+'년 '+month_2+'월',year+'년 '+month_1+'월' , year+'년 '+ month+'월'],
		    style: {
	             fontFamily:'pretendard',
	           	 fontSize: '1.6em'	
	        }
		  },
		  series: [{
		    type: 'column',
		    colorByPoint: true,
		    data: [sum2,sum1,sumC],
		    showInLegend: false,	        
		    style: {
	             fontFamily:'pretendard',
	           	 fontSize: '1.6em'	
	        }
		  }]
		});
		document.getElementById('plain').addEventListener('click', () => {
		  chart.update({
		    chart: {
		      inverted: false,
		      polar: false
		    },
		    subtitle: {
		      text: 'Plain'
		    }
		  });
		});
		document.getElementById('inverted').addEventListener('click', () => {
		  chart.update({
		    chart: {
		      inverted: true,
		      polar: false
		    },
		    subtitle: {
		      text: 'Inverted'
		    }
		  });
		});
		document.getElementById('polar').addEventListener('click', () => {
		  chart.update({
		    chart: {
		      inverted: false,
		      polar: true
		    },
		    subtitle: {
		      text: 'Polar'
		    }
		  });
		});
	
	</script>
	<script>
	$(document).ready(function() {
		
		window.scrollTo({ left: 0, top: 300, behavior: "smooth" }); 
		$('#slickConsumeTrandinModalBtn').hide();
		$('#slickStartModalButton').click();
		
		$('#slickStartModalButton').hide();
		setTimeout(()=>{
			$(".slickStartModal_content").click();
		},8000)
		

		
		let myCardId = "";
		let size = 	'${myCardListSize}';
		size = Number(size);
		let slideToShowSize = '';
		if (size ==1){
			slideToShowSize = 1;
		}else{
			slideToShowSize = 1;
		}
		const now = new Date().toLocaleString();
		$('.center').slick({
			  centerMode: true,
			  centerPadding:'0px',
			  slidesToShow: slideToShowSize,
			  responsive: [
		    	{
		    	  breakpoint: 768,
		   	   settings: {
		    	    arrows: false,
		        	centerMode: true,
		        	centerPadding: '0px',
		        	slidesToShow: 1
		      	}
		    	},
		    	{
		      	breakpoint: 480,
		      	settings: {
		        	arrows: false,
		        	centerMode: true,
		        	centerPadding:'0px',
		        	slidesToShow: 1
		      	}	
		    	}
		  	]
			});	
		$("#data_list").DataTable({
			ajax:{url:"/showMyConsumeTransaction?memberNum="+${loginVO.memberNum},dataSrc:''},
			columns:[
				{data:"DATE_OF_USE"},
				{data:"CARD_NUM"},
				{data:"SMALL_CATE"},
				{data:"AMOUNT_OF_BUSI"}	
			],
			columnDefs: [
				{ targets: 0, width: 30 },
				{ targets: 1, width: 30 },
				{ targets: 2, width: 20, className:"hihi"},
				{ targets: 3, width: 5,render:$.fn.dataTable.render.number( ',' , '.' , 0 , '' , '원' ) }		
			],
	        language: {
	            url: '/js/user/dataTables.ko.json'
	        },
			pageLength: 50,
			scrollX: true,
			scrollY: 350,
			lengthChange:false,
			searching:true,
			autoWidth: false,
			order:[[0,"desc"]],
	         language : {
	             info : "현재 _START_-_END_ / 총 _TOTAL_건",
	             loadingRecords: "로딩중...",
	             processing : "잠시만 기다려 주세요...",
	             search : "검색 : ",
	             paginate : {
	                "next" : "다음",
	                "previous" : "이전"
	             }
	          },
		});
		
        const username = '${loginVO.memberNum}';

        $("#disconn").on("click", (e) => {
        	 onClose('${loginVO.name}님의 연결이 끊어졌습니다.');
        	location.href="/";
        })
        
        $("#button-send").on("click", (e) => {
            send();
        });

        const websocket = new WebSocket("ws://localhost:9603/ws/chat");

        websocket.onmessage = onMessage;
        websocket.onopen = onOpen;
        websocket.onclose = onClose;
        
        function send(){

            let msg = document.getElementById("msg");

            console.log(username + ":" + msg.value);
            websocket.send(username + ":" + msg.value);
            msg.value = '';
        }
        
        //채팅창에서 나갔을 때
        function onClose(evt) {
            var str = username + ": 님이 방을 나가셨습니다.";
            websocket.send(str);
        }
        
        //채팅창에 들어왔을 때
        function onOpen(evt) {
            var str = username + ": 님이 입장하셨습니다.";
            websocket.send(str);
        }

        function onMessage(msg) {
            var data = msg.data;
            var sessionId = null;
            //데이터를 보낸 사람
            var message = null;
            var arr = data.split(":");
            

            for(var i=0; i<arr.length; i++){
                console.log('arr[' + i + ']: ' + arr[i]);
            }

            var cur_session = username;

            //현재 세션에 로그인 한 사람
            console.log("cur_session : " + cur_session);
            sessionId = arr[0];
            message = arr[1];

            console.log("sessionID : " + sessionId);
            console.log("cur_session : " + cur_session);
			                
            //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
            if(sessionId == cur_session){
                var str = "<div class='col-6'>";
                str += "<div class='alert alert-secondary'>";
                str += "<b>" + sessionId + " : " + message + "</b>";
                str += "</div></div>";
                $("#msgArea").append(str);
                $('#alertRed').append('<div>'+message+'</div>');
            
            }
            else{
                var str = "<div class='col-6'>";
                str += "<div class='alert alert-warning'>";
                str += "<b>" + sessionId + " : " + message + "</b>";
                str += "</div></div>";
                $("#msgArea").append(str);
                if(message>0){
                	$('#alertRed').append('<div>'+message+'</div>');
                }else{
                	$('#alertRed').hide();               
                }
            }
        }


		
  	});
	
	
	</script>
	
	<script>

		function myConsumeT(input){
			window.scrollTo({ left: 0, top: 200, behavior: "smooth" });     
			let realNow = now.split('.');
			console.log(realNow);
			
			let month = realNow[1].trim();
			
			let lastMonth = month-1;
			let inputArray = input.split(' ');
			let cardName='';
			for(let i=3;i<inputArray.length;i++){
				cardName += inputArray[i];			
				if(i==inputArray.length-1){
					cardName +='';
				}else{
					cardName +=' ';
				}
			}
	
			//카드 사진 조회용으로 카드 사진
			//카드번호 
			$('#slickHrAdd').empty();
			$('#slickConsumeTrandinModalBtn').click();
			$('#slickHrAdd').append('<hr align="center" style="border:15px gray; width: 35%; height:5px" class="mt-2 mx-2  benefitUnderLine" data-aos="fade-up" data-aos-duration="3000">')
			$('#graph').empty();
			$('#graph').append('<figure class="highcharts-figure"><div id="graphTest"></div><p class="mt-2 highcharts-description">※그래프를 클릭하시면 상세 내역을 보실 수 있습니다.</p></figure>')
			fetch('/findLastWeekConsume?cardNum='+inputArray[1])
			.then(res => res.json())
			.then(res =>{
				let weekDetailData = [];
				let weekData=[];
				let weekConsumeList = res;
		        let consumeWeekList = weekConsumeList.filter(function(item1, idx1){
		              return weekConsumeList.findIndex(function(item2, idx){
		                    return item1.DATE_OF_USE == item2.DATE_OF_USE
		              }) == idx1;
		        });
				for(let i=0; i<consumeWeekList.length;i++){
					let weekDetailComponent = {};
					let weekDetailComponentData = [];
					weekDetailComponent.name = consumeWeekList[i].DATE_OF_USE;
					weekDetailComponent.id = consumeWeekList[i].DATE_OF_USE;
					let weekSumData = {};
					weekSumData.name=consumeWeekList[i].DATE_OF_USE;
					weekSumData.drilldown=consumeWeekList[i].DATE_OF_USE;
					let daySum = 0;
					for(let j=0;j<weekConsumeList.length;j++){
						if(consumeWeekList[i].DATE_OF_USE==weekConsumeList[j].DATE_OF_USE){
							let dailyComponentData = [];
							dailyComponentData.push(weekConsumeList[j].SMALL_CATE);
							dailyComponentData.push(weekConsumeList[j].AMOUNT_OF_BUSI);
							weekDetailComponentData.push(dailyComponentData);
							daySum += weekConsumeList[j].AMOUNT_OF_BUSI;
						}					
					}	
					weekSumData.y=daySum;
					weekData.push(weekSumData);	
					
					weekDetailComponent.data = weekDetailComponentData;	
					weekDetailData.push(weekDetailComponent);
				}

			
				Highcharts.chart('graphTest', {
					colors: ['#996688','#4DD0E1','#81F7D8','#FF9800','#795548','#F9A825','#5E35B1'],	
				    chart: {
				        type: 'column',
				        style: {
				            fontFamily:'pretendard',
				           	 fontSize: '1.2em'	
				        }
				    },
				    title: {
				        align: 'left',
				        text: '<span id="lastConsumeTitleInGraph">지난 일주일 간 ${loginVO.name}님의 소비내역입니다</span>'
				    },
				    subtitle: {
				        align: 'left',
				        text: ''
				    },
				    accessibility: {
				        announceNewData: {
				            enabled: true
				        }
				    },
				    xAxis: {
				        type: 'category',
				        style: {
						          fontFamily:'pretendard',
						          fontSize: '1.2em'			
						},
				    },
				    yAxis: {
				        title: {
				            text: '<span id="lastConsumeTitleInGraph">일주일 간 소비내역</span>'
				        }

				    },
				    legend: {
				        enabled: false,
				        style: {
					           fontFamily:'pretendard',
					           fontSize: '1.2em'		
						}
				    },
				    plotOptions: {
				        series: {
				            borderWidth: 0,
				            dataLabels: {
				                enabled: true,
				                format: '{point.y:,.0f}원',
            				    style: {
            				    	fontFamily: 'pretendard',
            				        fontSize: '0.9em'
            	
            				    }
				            }
				        }
				    },

				    tooltip: {
				        headerFormat: '<span style="font-size:18px">{series.name}</span><br>',
				        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.0f}원</b> of total<br/>'
				    },

				    series: [
				        {
				            name: "지난 주 데이터",
				            colorByPoint: true,
				            data: weekData,
					    	 style: {
		    				     fontFamily: 'pretendard',
					             fontSize: '1.0em'
					         },
				        }
				    ],
				    drilldown: {
				    	 style: {
	    				     fontFamily: 'pretendard',
				             fontSize: '1.0em'
				         },
				        breadcrumbs: {
				       	 style: {
	    				     fontFamily: 'pretendard',
				             fontSize: '1.0em'
				         },
				            position: {
				                align: 'right'
				            }
				        },
				        series:
								
				        	weekDetailData
				        
				    }
				});
				  
			})

			
			$('#graph2').empty();
			$('#graph2').append('<figure class="highcharts-figure mx-2"><div id="graphTest2"></div></figure>')
			let largeCateData = [];
            let detailCateData = [];
           
			fetch("/showCardConsumeGraph2?cardNum="+inputArray[1])
            .then(res=>res.json())
            .then(res=>{	
            	
 				
 		
           		let benefitList = res;
            	

     		
           		
                let filteredCateList = benefitList.filter(function(item1, idx1){
                	return benefitList.findIndex(function(item2, idx){
                   	 	return item1.LARGE_CATE == item2.LARGE_CATE
                	}) == idx1;
            	});
				
                for(let i=0;i<filteredCateList.length;i++){
                	let largeCateObject = {};
                	largeCateObject.name = filteredCateList[i].LARGE_CATE;
                	largeCateObject.drilldown = filteredCateList[i].LARGE_CATE;
                	let smallCateObject = {};
                	smallCateObject.data=[];
					smallCateObject.name = filteredCateList[i].LARGE_CATE;
					smallCateObject.id = filteredCateList[i].LARGE_CATE;
                	let largeCateSum = 0;
                	for(let j=0;j<benefitList.length;j++){
                		if(filteredCateList[i].LARGE_CATE==benefitList[j].LARGE_CATE){
                			largeCateSum += benefitList[j].AMOUNT_OF_BUSI;
                			let smallCateDataArray = [];
                			smallCateDataArray.push(benefitList[j].SMALL_CATE);
                			smallCateDataArray.push(benefitList[j].AMOUNT_OF_BUSI);
                			smallCateObject.data.push(smallCateDataArray);
                		}               		
                	}
                	largeCateObject.y = largeCateSum;
                	largeCateData.push(largeCateObject)
                	detailCateData.push(smallCateObject);
                }
                Highcharts.chart('graph2', {
                    chart: {
                        type: 'pie',				        
                        style: {
				            fontFamily:'pretendard',
				           	 fontSize: '1.0em'	
				        }
                    },
                    title: {
                        text: '${loginVO.name}님의 소비데이터',
    				    style: {
    				    	fontFamily: 'pretendard',
    				        fontSize: '1.2em'   	
    				    }
                        
                    },
                    subtitle: {
                        text: '자세한 소비 내역은 그래프를 클릭해주세요.',
    				    style: {
    				    	fontFamily: 'pretendard',
    				        fontSize: '1.0em'
    	
    				    }
                    },

                    accessibility: {
                        announceNewData: {
                            enabled: true
                        },
                        point: {
                            valueSuffix: '원'
                        }
                    },

                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{point.name}: {point.y:,.0f}원',
            				    style: {
            				    	fontFamily: 'pretendard',
            				        fontSize: '0.65em'
            	
            				    }
                            }
                        }
                    },

                    tooltip: {
                        headerFormat: '<span style="font-size:13px">{series.name}</span><br>',
                        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:,.0f}원</b> of total<br/>',
                    },

                    series: [
                        {
                            name: "상세 소비 내역",
                            colorByPoint: true,
                            data: largeCateData,
                            dataLabels:{
                            	fontSize:'2.0em'
                            }
                        }
                    ],
                    drilldown: {
                        series:detailCateData,
                        dataLabels:{
                        	fontSize:'2.0em'
                        },
				       	 style: {
	    				     fontFamily: 'pretendard',
				             fontSize: '1.0em'
				         }
                    }
                });
        		        
                
                
                      
         	})
         				
			fetch('/showMyCardBenefit?myCardId='+inputArray[0])
			.then(res => res.json())
			.then(res =>{
				let benefitList = res 
				$('#cardImageInSlick').empty();	 				
				$('#cardImageInSlick').append('<img src="'+inputArray[2]+'" data-aos="fade-up" data-aos-duration="3000" class="slickCardImageInModal"/></img>');
				$('.cardBenefitSideImage').empty();
				$('#cardImageInSlick').append('<div class="d-flex justify-content-center mt-2">');
				$(benefitList).each(function(){
					$('#cardImageInSlick').append('<button id="cardBenefitSideImage" class="mx-1 mt-2 px-3 btn">'+this.SMALL_CATE+'</span>');
				})
				$('#cardImageInSlick').append('</div>');	
				
			})
			
			$('#benefitAlert').empty();
			$('#benefitAlert').append('<div class="mt-5 lastCardNameInModal">['+cardName+'] 에서 받은 혜택]</div>');
			$('#benefitAlert').append('<hr size="1" align="center" style="border:20px grey; width: 300px height:80px" class="mt-4 benefitUnderLine">')
			$('#cardBenefitSlick').empty();
			$('#cardBenefitSlick').append('<h2 style="display:flex; justify-content:center; align-items:center;"><img src="images/icon/loan.png" style="width:50px;"> &nbsp;'+lastMonth+'월에 받은 혜택</h2>');
			$('#cardBenefitSlick').append('<div class="warningAboutBenefit mt-4">※ 지난 달에 받은 혜택입니다.</div>')
			fetch('/showObtainedBenefit?cardNum='+inputArray[1])
			.then(res=>res.json())
			.then(res=>{
				let obtainedBenefitList = res
				let benefitSum = 0;
				$(obtainedBenefitList).each(function(){
					benefitSum += this.cardBenefit;
				})
				$('#cardBenefitSlick').append('<div class="d-flex justify-content-center">');
				$('#cardBenefitSlick').append('<div class="mt-3 alertBenefitSum align-middle pt-1"> <span class=" align-middle">총&nbsp;</span><span class=" align-middle" id="benefitSumColor">'+benefitSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</span><span class=" align-middle"> 원 혜택 받으셨습니다.</span></div>');
				$('#cardBenefitSlick').append('</div>');
				$('#cardBenefitSlick').append('<div class="checkMyCardModalAliImage d-flex justify-content-center mt-2 mb-2"></div>')
				let str1 = '';
				str1 += '<div class="container text-center" style="margin-left:120px;">';
				str1 +=	'<div class="row">';				
				$(obtainedBenefitList).each(function(){
					str1 +='<div class="col-sm-6">'
					str1 +='<div class="d-flex justify-content-start mt-1"><button class="obtainedSmallCate">'+this.smallCate+' / '+this.aliType+'</button><button class="obatinedDetailBenefit">'+this.cardBenefit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'원</button></div></div>'
					$('.checkMyCardModalAliImage').append('<div class="checKMyCardModalAliImageParent mb-2 mt-2"><img src="images/ali_icon/'+this.aliType+'.png" class="checkMyCardAliImageInModal"></div>')
				})
				str1 += '</div></div>'
				$('#cardBenefitSlick').append(str1);
								
			})
		
		};	
    </script>   
    
    <script>
    $(function(){ 
		$('#yourRecentConsumeParent').mouseover(function(){
			$('#yourRecentConsume2Parent').fadeOut(1000);
		})
		$('#yourRecentConsumeParent').mouseleave(function(){
			$('#yourRecentConsume2Parent').fadeIn(1000);
		})

		
		
    });
	
   
    </script>
    <script>
		$(function(){ 
		 	 $("#modalButtonForTodoListSocket").click(function(){
		     	$(".modalTodoListSocket").fadeIn();
		  	 });
		  
		  	$(".modal_contentTodoListSocket").click(function(){
		    	$(".modalTodoListSocket").fadeOut();
		  	});
		  
		});
	</script>
		
	<script>
		function checkTodoListAndUpdate(){
        	$('#alertRed').hide();
			$('#modal_contentTodoListSocketAdd').empty();
			$('#modal_contentTodoListSocketAdd').append('');
			let memberNum = ${loginVO.memberNum}
			let str ='';
			str += '<div class="d-flex justify-content-center mt-2 mb-2" style="font-family:pretendard; wdith:80%;">'
			str +='<table class="table"><thead class="table-light">';
			str +='<tr><th scope="col">리스트</th><th scope="col">이체 날짜</th><th scope="col">이체 내역</th><th scope="col">이체 상세 내역</th></tr></thead>';
			str +='<tbody>'
			fetch("/getTodoListInModal?memberNum="+memberNum)
			.then(res=>res.json())
			.then(res=>{	
				let todoList = res;
				for(let i=0;i<todoList.length;i++){

					str += '<tr>'
					str += '<th scope="row">'+(i+1)+'</th>';
					str += '<td>['+todoList[i].START_1.substr(0,10)+']</td>';
					str += '<td>'+todoList[i].TITLE+'</td>';
					str += '<td>'+todoList[i].CONTENT+'</td>';					
					str += '</tr>'
				}
				str += '<tbody></table>'
				str +='</div>'
				str += '<div class="d-flex justify-content-end" style="font-family:pretendard; margin-right:5px; color:black;">※&nbsp;5일 이내에 지출 예정인 내역만 표기됩니다.</div>'
				$('#modal_contentTodoListSocketAdd').append(str);
			})

			$("#modalButtonForTodoListSocket").click();
		}
	</script>
    
	<script>
		AOS.init();
	</script>

		
</body>
</html>