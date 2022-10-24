<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>HANA FINDER</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">


<jsp:include page="/WEB-INF/jsp/include/cssFile.jsp"></jsp:include>



</head>

<body>

	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>



	<section>
    <!-- Carousel Start -->
    	<div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay==0.6s">
        	<div class="jb-box mb-1" id="videoContainer">
        		<div id="video_area">
        	 		<video id="background_video bdvid" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="30">
              			<source src="video/tokyo2.mov" type="video/mp4" id="sectionVideo">
        	 			<strong>Your browser does not support the video tag.</strong>
         			</video>
         		</div>
         		<div class="jb-text">
          	 		 <p id="hana"><p id="notificationBar"></p></p>
          		 	<p id="videoText">금융 IT를 선도하는 핵심동력 하나 FINDER</p>
         		</div>
         	</div>
   	 	</div>   

	</section>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
	</footer>
	<button id="video_modal_button">모달창</button>

	<div class="video_modal">
  		<div class="video_modal_content" title="클릭하면 창이 닫힙니다.">
    	<div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay==0.6s">
        	<div class="jb-boxInModal mb-1" id="modalVideoContainer">
        		<div id="video_area">
        	 		<video id="background_video bdvid" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="30">
              			<source src="video/hongkong.mov" type="video/mp4" id="modalVideo">
        	 			<strong>Your browser does not support the video tag.</strong>
         			</video>
         		</div>
         		<div class="jb-textInModal">
          	 		 <p id="hanaInModal"><p id="notificationBarInModal"></p></p>
          		 	<p id="videoTextInModal"></p>
         		</div>
         	</div>
   	 	</div>   
  		</div>
	</div>
	
	
	

	<jsp:include page="/WEB-INF/jsp/include/scriptFile.jsp"></jsp:include>
		
	<script>
		document.addEventListener("DOMContentLoaded",()=>{
			$('#videoContainer').hide();
			 window.scrollTo({ left: 0, top: 150, behavior: "smooth" }); 
			$('#video_modal_button').hide();
			$('#video_modal_button').click();
			var app = document.getElementById('notificationBarInModal');
			var typewriter = new Typewriter(app, {
				loop : true,
				cursor : "",
			});
			typewriter.typeString('하나 FINDER에 오신 것을 환영합니다')
					  .pauseFor(1500).deleteAll().typeString(
								'FOR A DIGITAL INNOVATION').pauseFor(
								1500).deleteAll().typeString(
								'FOR A DIGITAL INNOVATION').pauseFor(
								1500).start();
 
			
			
		    setTimeout(()=>{
		    	$('.video_modal_content').click();
				 window.scrollTo({ left: 0, top: 150, behavior: "smooth" }); 
		    	$('#videoContainer').show();
				let myVideoTime = 100;
			    for (let opacity = 0; opacity <= 1.1; opacity = opacity + 0.03) {
			    	myVideoTime +=70;
			    	 setTimeout(()=>{
			    	   	document.getElementById('videoText').style.opacity = opacity;
			    	  },myVideoTime);                       
			    }  
				var app = document.getElementById('notificationBar');
				var typewriter = new Typewriter(app, {
					loop : true,
					cursor : "",
				});
				typewriter.typeString('FOR A DIGITAL INNOVATION')
						  .pauseFor(1700).deleteAll().typeString(
									'FOR A DIGITAL INNOVATION').pauseFor(
									1700).deleteAll().typeString(
									'FOR A DIGITAL INNOVATION').pauseFor(
									1500).start();
		    },5000)	    
		});
	</script>
	<script>
		$(function(){ 
		 	 $("#video_modal_button").click(function(){
		  	  $(".video_modal").fadeIn();
		 	 });
		  
		  	$(".video_modal_content").click(function(){
		  	  $(".video_modal").fadeOut();
		  	});
		  
		});
	</script>
	<script>
		AOS.init();
	</script>
</body>
</html>