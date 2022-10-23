<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HANA FINDER</title>

	<jsp:include page="/WEB-INF/jsp/include/cssFile.jsp"></jsp:include>
	<link href="css/calendar/calendar.css" rel="stylesheet">
	<!-- fullcalendar CDN -->
	<link href="css/calendar/main.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>
	<section class="pb-5">
		<div class="text-center" id="wayToUseCalender">
		</div>
		
		<!-- 이제 캘린더 추가하자!  -->
		<div class="text-center mt-3" id="calendarTitle">
			<img src="images/icon/calendar.png" style="width:80px">&nbsp;${loginVO.name}님의 소비 캘린더		
		</div>
		
		<div class="d-flex justify-content-end calendarExplanation mt-4">
			<div>하단의 일정 추가하기 버튼을 눌러 일정을 추가해보세요</div>
		</div>
		
		<div class="d-flex justify-content-center mt-2" id="calendarParent">
			<div id='calendar'></div>  
		</div>

		<div class="d-flex justify-content-center mt-4">
			<button id="addCalendar" onclick="addCalendarSomething(this.id);">일정 추가하기</button>
		</div>
		
		
	
	


	
	
	</section>
	
	<button id="consumeCalendarButton">모달창</button>

	<div class="consumeCalendarModal">
  		<div class="consumeCalendarModal_content" title="클릭하면 창이 닫힙니다.">
  			<div>
  				<img src="images/hana/logo.png" style="width:200px;">
   			</div>
   			<hr style="height:3px;">
   			<img src="gif/calendar.gif" style="width:200px;">
   			<div class="mt-3">
   				${loginVO.name}님의 소비 일정을 추가하고 
   				<br>메세지 알림기능을 이용할 수 있습니다.  			
  			</div>
  		</div>
	</div>
	
	<button id="noticeAboutAddCalendarButton"></button>

	<div class="noticeAboutAddCalendarModal">
  		<div class="noticeAboutAddCalendarModal_content" title="클릭하면 창이 닫힙니다.">
  		  	<div class="mb-2">
  				<img src="images/hana/logo.png" style="width:120px;">
   			</div>
   			<hr style="height:3px;">
  			<img src="images/icon/calendar.png" style="width:80px;">
 			<div class="mt-3 pb-3">
 				일정 등록이 완료되었습니다.<br>
 				지정한 날짜 하루 전날 알림 문자가 가게 됩니다!
 			</div>  			
  		</div>
	</div>
	
	
	
	
	
	<button id="addCalendarModalButton"></button>

	<div class="addCalendarModal">
  		<div class="addCalendarModal_content" title="클릭하면 창이 닫힙니다.">
  		  	<div class="mt-2">
  				<img src="images/hana/logo.png" style="width:120px;" id="closeAddCalendarModal">
   			</div>
   			<div class="mt-1 addCalendarModalTitle">
   				<img src="gif/calendar.gif" style="width:100px;">일정 추가하기
   			</div>
   			<hr>	
   			<div class="mt-4 addCalendarDateType d-flex justify-content-center">
   				날짜 선택하기&nbsp;&nbsp;<input type="date" class="form-control addedDateModalCalendar" name="calendarDate">  				
 			</div>
 			<div class="mt-4 addCalendarDateType d-flex justify-content-center">
   				계좌 선택하기&nbsp;&nbsp;
   				<select class="form-control selectedAccount" name="calendarCardSelect" onchange="addCardImgInCalendarModal(this.value)">  				
 					   <option value="">계좌를 선택해주세요</option>	
 					   <hr>
 					   <c:forEach items="${accountList}" var="account">
 					   		<option value="${account.ACCOUNT_NUMBER}">${account.ACCOUNT_NUMBER} ${account.ACCOUNT_COMMENT}</option>
 					   </c:forEach> 			
 				</select>
 			</div>
 			<div id="cardImgRelatedToAccount" class="mt-2">
 			
 			</div>
 			<div class="mt-4 addCalendarDateType d-flex justify-content-center">
   				소비 내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control myTodoList" name="calendarContent">  				
 			</div>
 			<div class="mt-4 addCalendarDateType d-flex justify-content-center">
   				상세 정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control myDetailTodoList" name="calendarDetail">  				
 			</div>
 			<div class="mt-4 d-flex justify-content-center">

   				<label>메세지 알림 동의&nbsp;&nbsp;<input type="checkbox" name="messageConsentBlank" value="Y" id="messageConsent"></label> 				
 			</div>		
 			<div class="mt-4 addCalendarDateType d-flex justify-content-center">
 				<button class="addTodoListButton" onClick="addTodoList()">일정 추가</button>
			</div>
  		</div>
	</div>
	
	
	
	
	
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
	</footer>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

	<!--jquery cdn  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 


	<script src="js/wow.min.js"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/counterup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/lightbox.min.js"></script>

	<!--writer  -->
	<script src="https://unpkg.com/typewriter-effect@2.3.1/dist/core.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>

	<!--AOS -->
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	
	<!--fullCalendar-->
	<script src="js/calendar/main.js"></script>
    
  	<script src="js/scripts.js"></script>
  	<script>
  		function addTodoList(){
  			function getRandomInt(max) {
  			  return Math.floor(Math.random() * max);
  			}			
  			const now = new Date().toLocaleString();  			
  			let backGroundColorArray = ['yellow','pink','beige'];
  			let textColorArray = ['black']
  			let borderColorArray = ['blue','navy']
  			let start = $('.addedDateModalCalendar').val();
  			let end = $('.addedDateModalCalendar').val();
  			
  			let account = $('.selectedAccount').val();
  			
  			let title = $('.myTodoList').val();
  			let writer = '${loginVO.name}';
  			let content = $('.myDetailTodoList').val();
  			let groupId = ${loginVO.memberNum};

  			
  			let currentTime = new Date();
  			let nowHour = currentTime.getHours();
  			let nowMinute = currentTime.getMinutes();
  			let nowSecond = currentTime.getSeconds();
  			
  			
  			start = start + ' ' + nowHour +':'+nowMinute+':'+nowSecond;
  			end = end + ' ' + Number(nowHour+3) +':'+nowMinute+':'+nowSecond; 
  		 
  			console.log("start : " + start);
  			console.log("end : " + end);
  			let smsMessage = writer+ '님의 ' +'계좌 번호 '+ account + '에서 '+  title +'('+content+')'+'이 출금 예정입니다.'; 
  			
  			let messageConsentBlank = '';
  			
  			if($("#messageConsent").is(":checked")){

  				messageConsentBlank = 'Y';
  			    
  			}else{

  				messageConsentBlank = 'N';
  			    
  			}

  			
  			let borderColor = borderColorArray[getRandomInt(borderColorArray.length)];
  			let textColor = textColorArray[getRandomInt(textColorArray.length)];
  			let backgroundColor = backGroundColorArray[getRandomInt(backGroundColorArray.length)];
  			
  			fetch('/addTodoList?&groupId='+groupId+'&start='+start+'&end='+end+'&title='+title+'&writer='+writer+'&content='+content+'&borderColor='+borderColor+
  					'&textColor='+textColor+'&backgroundColor='+backgroundColor+'&accountNum='+account+'&smsMessage='+smsMessage+'&messageConsentBlank='+messageConsentBlank)
  			.then(res=>{
  		  		$('.addCalendarModal').fadeOut();
  				$("#noticeAboutAddCalendarButton").click();
  			})	
  		}
  		 
  		
	  	function addCalendarSomething(input){
	  		$("#addCalendarModalButton").click();
		 }
	  	function addCardImgInCalendarModal(input){
	  		let accountNum  = input;
	  		let memberNum = ${loginVO.memberNum};	  		
	  		fetch("/getCardImgFromAccount?memberNum="+memberNum+'&accountNum='+accountNum)
	  		.then(res=>res.json())
	  		.then(res=>{
	  			cardImgList = res
	  			console.log(cardImgList);
				cardImg = res.cardImgUrl;
	  			$('#cardImgRelatedToAccount').empty();
	  			let str = '';
	  			str +='<img src='+cardImg+' class="mt-3" style="width:240px;">'
	  			str +='<div style="font-size:20px" class="mt-2">선택하신 계좌와 연결된 ${loginVO.name}님의 카드입니다.</div>'
	  			$('#cardImgRelatedToAccount').append(str);
	  			$('#cardImgRelatedToAccount').fadeIn(3000); 
	  		})
	  	}
	</script>	
  	<script>
		$(function(){ 
		  $("#consumeCalendarButton").click(function(){
		    $(".consumeCalendarModal").fadeIn();
		  });  
		  
		  $(".consumeCalendarModal_content").click(function(){
		    $(".consumeCalendarModal").fadeOut();
	 	  	window.scrollTo({ left: 0, top:200}); 
			var app = document.getElementById('wayToUseCalender');
			var typewriter = new Typewriter(app, {
				loop : true,
				cursor : "",
			});
			typewriter.typeString('${loginVO.name}님의 소비 일정을 추가해보세요!')
					  .pauseFor(1700)
					  .deleteAll()
					  .typeString('일정을 추가하면 해당 일자에 알림이 가게 됩니다.')
					  .pauseFor(1700)
					  .deleteAll()
					  .typeString('${loginVO.name}님의 소비 일정을 추가해보세요!')
					  .pauseFor(1500)
					  .start();
			$('#calendarTitle').fadeIn(3000);
			const now = new Date().toLocaleString();
			let realNow = now.split('.');
			console.log("realNow : "+realNow);
			let year = realNow[0];
			let month = realNow[1].trim();
			let day = realNow[2].trim();
			if(month.startsWith(' ')){
				month = '0'+month.trim();
			}
			if(day.startsWith(' ')){
				day = '0'+day.trim();
			}
			
			
			let initialDate = year+'-'+month+'-'+day;
			console.log("initialDate : "+initialDate);
			let memberNum = ${loginVO.memberNum};
			let calendarArray = [];
			fetch("/getCalendarList?memberNum="+memberNum)
			.then(res=>res.json())
			.then(res=>{
				calendarList = res; 
				for(let i=0;i<calendarList.length;i++){
					console.log("calendarArray : "+calendarArray);
					let calendar = {};
					calendar.id = calendarList[i].id;
					calendar.title = calendarList[i].title;
					calendar.writer = calendarList[i].writer;
					calendar.content = calendarList[i].content;
					calendar.start = calendarList[i].start;
					calendar.end = calendarList[i].end;
					calendar.allDay = calendarList[i].allDay,
					calendar.textColor = calendarList[i].textColor;
					calendar.backgroundColor = calendarList[i].backgroundColor;
					calendar.borderColor = calendarList[i].borderColor;
					calendarArray.push(calendar);
				}
				
				return new Promise((resolve,reject)=>{
					resolve("success");
				})
			})
			.then(res=>{
	        let calendarEl = document.getElementById('calendar');
	        let calendar = new FullCalendar.Calendar(calendarEl, {
	            headerToolbar: {
	                left: 'prev,next today',
	                center: 'title',
	                right: 'dayGridMonth,timeGridWeek,timeGridDay'
	              },
	            initialDate: initialDate,
	            locale:'ko',
	            select: function(arg) {
	          	  console.log(arg);

	              var title = prompt('입력할 일정:');
	          // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
	              if (title) {
	                calendar.addEvent({
	                  title: title,
	                  start: arg.start,
	                  end: arg.end,
	                  allDay: arg.allDay,
	                  backgroundColor:"yellow",
	                  textColor:"black"
	                })
	              }
	              calendar.unselect()
	            },
	            eventClick: function(arg) {
	          	  // 있는 일정 클릭시,
	          	  console.log("#등록된 일정 클릭#");
	          	  console.log(arg.event);
	          	  
	              if (confirm('Are you sure you want to delete this event?')) {
	                arg.event.remove()
	              }
	            },
	            editable: true,
	            dayMaxEvents: true, // allow "more" link when too many events
	            events:calendarArray,
	            eventSource:[
	            	{
	            	 eventBackgroundColor:'coral',
	            	 eventTextColor:'black',
	            	 display:'background'
	            	}
	            ]
	           });
	           calendar.render();
	        
			});
		  
		  });

		
		  $("#addCalendarModalButton").click(function(){
		 	window.scrollTo({ left: 0, top:200}); 
		    $(".addCalendarModal").fadeIn();
		    $('#calendar').fadeOut(2000);
		  });
		  
		  $("#closeAddCalendarModal").click(function(){
		    $(".addCalendarModal").fadeOut();
		    $('#calendar').fadeIn(1000);
		  });
		  
		  $("#noticeAboutAddCalendarButton").click(function(){
				window.scrollTo({ left: 0, top:400});
		    $(".noticeAboutAddCalendarModal").fadeIn();
		  });
		  
		  $(".noticeAboutAddCalendarModal_content").click(function(){
		    $(".noticeAboutAddCalendarModal").fadeOut();
		    $('#calendar').fadeIn(1000);
			const now = new Date().toLocaleString();
			let realNow = now.split('.');
			console.log(realNow);
			let year = realNow[0];
			let month = realNow[1].trim();
			let day = realNow[2].trim();
			if(month.startsWith(' ')){
				month = '0'+month.trim();
			}
			if(day.startsWith(' ')){
				day = '0'+day.trim();
			}

			let initialDate = year+'-'+month+'-'+day;
			console.log("initialDate : "+initialDate);
			let memberNum = ${loginVO.memberNum};
			let calendarArray = [];
			fetch("/getCalendarList?memberNum="+memberNum)
			.then(res=>res.json())
			.then(res=>{
				calendarList = res; 
				for(let i=0;i<calendarList.length;i++){
					console.log("calendarArray : "+calendarArray);
					let calendar = {};
					calendar.id = calendarList[i].id;
					calendar.title = calendarList[i].title;
					calendar.writer = calendarList[i].writer;
					calendar.content = calendarList[i].content;
					calendar.start = calendarList[i].start;
					calendar.end = calendarList[i].end;
					calendar.allDay = calendarList[i].allDay,
					calendar.textColor = calendarList[i].textColor;
					calendar.backgroundColor = calendarList[i].backgroundColor;
					calendar.borderColor = calendarList[i].borderColor;
					calendarArray.push(calendar);
				}
				
				return new Promise((resolve,reject)=>{
					resolve("success");
				})
			})
			.then(res=>{
	        let calendarEl = document.getElementById('calendar');
	        let calendar = new FullCalendar.Calendar(calendarEl, {
	            headerToolbar: {
	                left: 'prev,next today',
	                center: 'title',
	                right: 'dayGridMonth,timeGridWeek,timeGridDay'
	              },
	            initialDate: initialDate,
	            locale:'ko',
	            select: function(arg) {
	          	  console.log(arg);

	              var title = prompt('입력할 일정:');
	          // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
	              if (title) {
	                calendar.addEvent({
	                  title: title,
	                  start: arg.start,
	                  end: arg.end,
	                  allDay: arg.allDay,
	                  backgroundColor:"yellow",
	                  textColor:"black"
	                })
	              }
	              calendar.unselect()
	            },
	            eventClick: function(arg) {
	          	  // 있는 일정 클릭시,
	          	  console.log("#등록된 일정 클릭#");
	          	  console.log(arg.event);
	          	  
	              if (confirm('Are you sure you want to delete this event?')) {
	                arg.event.remove()
	              }
	            },
	            editable: true,
	            dayMaxEvents: true, // allow "more" link when too many events
	            events:calendarArray,
	            eventSource:[
	            	{
	            	 eventBackgroundColor:'coral',
	            	 eventTextColor:'black',
	            	 display:'background'
	            	}
	            ]
	           });
	           calendar.render();
	        
			});
		    		    
		  });		 		 		  
	    });
	</script>
	
	<script>
	 	$(document).ready(function(){
	 	  	window.scrollTo({ left: 0, top:700}); 
	 		$("#consumeCalendarButton").click(); 
	 	}); 	 	
	</script>
		
	<script>
		AOS.init();
	</script>
	
	
	
</body>
</html>