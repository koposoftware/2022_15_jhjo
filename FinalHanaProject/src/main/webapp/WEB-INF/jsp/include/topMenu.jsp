<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>        
    
    
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    
    </div>
    <!-- Spinner End -->
    
    <!-- Topbar Start -->
    <!-- Topbar End -->



    <!-- Brand & Contact Start -->
    <div class="container-fluid py-4 px-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="row align-items-center top-bar">
            <div class="col-lg-4 col-md-12 text-center text-lg-start">
                <a href="/" class="navbar-brand m-0 p-0">
                    <h1 class="fw-bold text-primary m-0"> <img class="" src="images/hana/logo.png" alt="" style="width: 240px;"></h1>               
                </a>
            </div>
            <div class="col-lg-4">
          
            </div>
            <div class="col-lg-4 d-flex flex-row-reverse">
            <c:choose>
			    <c:when test="${empty loginVO}" >
            		<div class="p-1"><a href="/login" class="btn btn-sm btn-light py-2 px-4 d-none d-lg-block mx-1" id="login">회원가입</a></div>
            		<div class="p-1"> <a href="/login" class="btn btn-sm btn-light py-2 px-4 d-none d-lg-block mx-1" id="login">로그인</a></div>
        		</c:when>
				<c:otherwise>
					<c:if test="${loginVO.userType ne 'ADMIN'}">  
						<div class="p-1 d-flex justify-content-center" style="display : flex; align-items : center; justify-content : center; font-family: pretendard; font-size:18px; color:black;"><div style="position:relative;"><img src="images/icon/bell2.png" style="width:35px; cursor:pointer;" onclick="checkTodoListAndUpdate()"><div id="alertRed" style="position:absolute; top:-10px; left:15px;"></div></div>&nbsp;&nbsp;<div>${loginVO.name}님 환영합니다.&nbsp;&nbsp;</div><a href="/logout" class="btn btn-sm btn-light py-2 px-4 d-none d-lg-block mx-1" id="login">로그아웃</a></div>
					</c:if>
					<c:if test="${loginVO.userType eq 'ADMIN'}">  
						<div class="p-1 d-flex justify-content-center" style="display : flex; align-items : center; justify-content : center; font-family: pretendard; font-size:18px; color:black;"><div style="position:relative;"></div>&nbsp;&nbsp;<div>${loginVO.name}님 환영합니다.&nbsp;&nbsp;</div><a href="/logout" class="btn btn-sm btn-light py-2 px-4 d-none d-lg-block mx-1" id="login">로그아웃</a></div>
					</c:if>
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
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav me-auto p-3 p-lg-0">
               <c:if test="${loginVO.userType ne 'ADMIN'}">   
      		
                	<a href="/test" class="nav-item nav-link"><button class="btn" id="navBtn">카드 안내</button></a>
                	<a href="/cardSection" class="nav-item nav-link"><button class="btn" id="navBtn">하나 카드</button></a>
         
                	<div class="nav-item dropdown">
                    	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><button class="btn" id="navBtn">내 카드 정보</button></a>
                    	<button class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">
                        	<a href="/checkMyCard" class="dropdown-item"><img src="images/icon/report.png" style="width:30px;">&nbsp;카드 정보 확인하기</a>
                        	<hr>
                        	<a href="/moveConsumeCalendar" class="dropdown-item"><img src="images/icon/report2.png" style="width:30px;">&nbsp;소비 일정 보기</a>
                        	<hr>
                        	<a href="/recommendCard" class="dropdown-item"><img src="images/icon/find.png" style="width:30px;">&nbsp;내게 맞는 카드 찾기</a>    
                    	</button>
                    </div>	
                </c:if>                    
     	  	</div>
     	 </div>
       <c:if test="${loginVO.userType eq 'ADMIN'}">                        		
                <a href="/test" class="nav-item nav-link"><button class="btn" id="navBtn">카드 안내</button></a>
                <a href="/cardSection" class="nav-item nav-link"><button class="btn" id="navBtn">하나 카드</button></a>       
                </div>
                     <a href="/moveDashBoard" class="nav-item nav-link"><button class="btn" id="navBtn">대시 보드</button></a>
            	</div>
       </c:if>    	 
    </nav>
    
    <button id="modalButtonForTodoListSocket">모달창</button>

	<div class="modalTodoListSocket">

  		<div class="modal_contentTodoListSocket" title="클릭하면 창이 닫힙니다.">
  			  <img src="images/hana/logo.png" style="width:100px;">
  			  <div id="modalFixedCost" class="mt-3" style="font-family:pretendard; font-size:16px; color:black;"><img src="images/icon/todoListCalendar.png" style="width:30px;">${loginVO.name}님의 고정비 내역</div>
  			  <div id="modal_contentTodoListSocketAdd"></div>
  		</div>

	</div>
    
    
    <!-- Navbar End -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
    
    <script>
      	$(document).ready(function(){

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
         })
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
			str += '<div class="d-flex justify-content-center mt-2 mb-2" style="font-family:pretendard; wdith:80%; color:black;">'
			str +='<table class="table" style="color:black;"><thead class="table-light">';
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
