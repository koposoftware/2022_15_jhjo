<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하나 FINDER</title>
<jsp:include page="/WEB-INF/jsp/include/cssFile.jsp"></jsp:include>


<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />


<link href="css/card/recommendedCard.css" rel="stylesheet">

<link href="css/styles.css" rel="stylesheet" />

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link href="css/all/allFile.css" type="text/css" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
	

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

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

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>

	<section id="recommendedCardBackground">
		<div id="recommendMessage" class="d-flex justify-content-center mb-5">
			<span id="typingRecommendMessage" class="mb-3"></span>
		</div>
		<div class="d-flex justify-content-center mt-3">
			<h1 align="center" class="mt-5" id="RecommendedCreditTitle"
				data-aos="fade-up" data-aos-duration="3000"><img src="gif/credit-card2.gif" style="width:80px">&nbsp;신용 카드</h1>
		</div>
		
		<div class="d-flex justify-content-center mb-5">
			<hr align="center"
				style="border: 12px #008675; width: 20%; height: 10px" class="">
		</div>
		<div class="d-flex justify-content-end informationAboutSlick_div mt-5"  data-aos="fade-left" data-aos-anchor="#example-anchor" data-aos-offset="500" data-aos-duration="500">
			<span class="informationAboutSlick">카드를 클릭하시면 카드에 관한 정보 확인이 가능합니다.</span>
		</div>

		<div class="center_div" data-aos="fade-right" data-aos-offset="300"
			data-aos-easing="ease-in-sine">
			<div class="center">
				<c:forEach items="${creditCardList}" var="creditCard" varStatus="loop">
					<div class="d-flex justify-content-center recommendedCardSlick">

						<div class="recommendedCardImg d-flex flex-column mb-3 mt-1 recommendCardbox">
							<div class="d-flex justify-content-center">
								<div class="d-flex justify-content-center recommendedCardName">${creditCard.cardName}</div>
							</div>
							<div class="front">
								<img src="images/card/medal/medal_${loop.count}.png" class="frontImage">
							</div>
							<div class="back d-flex justify-content-center">
								<img class="mt-5 mb-2 recommendedMyCreditList backImage" src="${creditCard.cardImgUrl}" id="${creditCard.cardCateNum} ${loop.count} ${creditCard.cardImgUrl}" alt="" onClick="wantToSeeDetailCard(this.id)">
							</div>
							<div class="d-flex justify-content-center">
								<div class="savingMoney d-flex justify-content-center">한&nbsp;달에
									약&nbsp;<span class="howSaving"><fmt:formatNumber type="number" maxFractionDigits="3" value="${creditCard.cardBenefit}"/>&nbsp;</span>원 절약 가능합니다</div>
							</div>
							<div class="d-flex justify-content-center recommendedInfo" id="recommendedInfo_${loop.count}_${creditCard.cardCateNum}">
								<div class="d-flex flex-column mb-3 recommendedDetailList" id="${creditCard.cardCateNum}_detailBenefit"></div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="d-flex justify-content-center mt-5">
			<h1 align="center" class="" id="RecommendedCreditTitle2"
				data-aos="fade-down" data-aos-easing="linear"
				data-aos-duration="1500"><img src="gif/credit-card2.gif" style="width:100px">&nbsp;체크 카드</h1>
		</div>
		<div class="d-flex justify-content-center mb-5">
			<hr align="center"
				style="border: 12px #008675; width: 20%; height: 10px" class="mb-5">
		</div>
		
		<div class="d-flex justify-content-end informationAboutSlick_div" >
			<span class="informationAboutSlick">카드를 클릭하시면 카드에 관한 정보 확인이 가능합니다.</span>
		</div>
		
		<div class="center2_div" data-aos="fade-right" data-aos-offset="300"
			data-aos-easing="ease-in-sine">
			<div class="center2">
				<c:forEach items="${checkCardList}" var="checkCard" varStatus="loop">
					<div class="d-flex justify-content-center recommendedCardSlick">

						<div class="recommendedCardImg d-flex flex-column mb-3 mt-1 recommendCardbox">
							<div class="d-flex justify-content-center">
								<div class="d-flex justify-content-center recommendedCardName">${checkCard.cardName}</div>
							</div>
							<div class="front">
								<img src="images/card/medal/medal_${loop.count}.png" class="frontImage">
							</div>
							<div class="back d-flex justify-content-center">
								<img class="mt-5 mb-2 recommendedMyCheckList backImage" src="${checkCard.cardImgUrl}" id="${checkCard.cardCateNum} ${loop.count} ${checkCard.cardImgUrl}" alt="" onClick="wantToSeeDetailCard(this.id)">
							</div>
							<div class="d-flex justify-content-center">
								<div class="savingMoney d-flex justify-content-center">한&nbsp;달에
									약&nbsp;<span class="howSaving"><fmt:formatNumber type="number" maxFractionDigits="3" value="${checkCard.cardBenefit}"/>&nbsp;</span>원 절약 가능합니다</div>
							</div>
							<div class="d-flex justify-content-center recommendedInfo" id="recommendedInfo_${loop.count}_${checkCard.cardCateNum}">
								<div class="d-flex flex-column mb-3 recommendedDetailList" id="${checkCard.cardCateNum}_detailBenefit"></div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div id="multiCardSection" class="mt-5 mb-3">
			<div class="mb-5 multiTitle d-flex justify-content-center" data-aos="fade-up" data-aos-duration="3000">
				<img src="gif/smartphone.gif" style="width:80px;"><div class="d-flex justify-content-center"> 멀티 카드 조합을 추천해드립니다!</div>
			</div>
			<div class="container text-center">
				 <div class="row">
				   <div class="col-3 multiCardDescription mt-4">
				   		<div class="mt-4">
				   			<img src="images/icon/payment.png" style="width:80px"> 멀티카드란?
				   			<div class="multiCardDetailDescription mt-5">다양한 멀티 시리즈 모바일카드를 한 장의 플라스틱카드로 이용할 수 있는 전용 결제 수단입니다.</div>
				   			<div class="multiCardDetailDescription mt-5 mb-3">* 실물 카드에는 '클리어 옵션'을 적용해 기존 신용카드에 있었던 유효 기간과 CVC번호를 가릴 수 있습니다.</div>
				   			<div><img src="images/icon/arrow.png" style="width:30px;"></div>
				   			<div class="moveMultiCardDetailDescription"><a href="#">멀티카드 자세히 알아보기</a></div>
				   		</div>
				   </div>
				   <div class="col-1"></div>
				   <div class="col-8 multiCardCombination mt-4">		
				   		<div class="fadeInMultiCardImage mt-4" style="overflow:visible !important">
				   			<c:forEach items="${multiCardList}" var="multiCard" varStatus="loop">
				   				<div class="container text-center">	

				   					
				   					<div class="d-flex flex-column">
				   				 			<div class="d-flex justify-content-around">
				   				 				<img src="${multiCard.firstMultiCardImgUrl}" style="width:40%;" class="multiCardImage pt-3 pb-3" id="multi1_${multiCard.firstMultiCardCateNum}">
				   				 				<img src="images/icon/plus.png" style="width:80px;height:80px; margin-top:80px;">	
				   				 				<img src="${multiCard.secondMultiCardImgUrl}" style="width:40%;" class="multiCardImage pt-3 pb-3" id="multi2_${multiCard.secondMultiCardCateNum}">
				   				 			</div>			   				 			
				   				 			<div class="d-flex justify-content-around">
				   				 			<div class="d-flex flex-column justify-content-center align-items-center">
				   				 			<div class="recommendedMultiCardName mt-1 mb-1" style="width:400px;">[${multiCard.firstMultiCardName}]</div>
				   				 			<div class="recommendedMultiCardComment mb-1" style="font-size:20px;">${multiCard.firstMultiCardComment}</div>
				   				 			<div style="font-size:20px; background-color:white; width:400px;">[${multiCard.firstMultiCardName}]로는</div>
				   							<div class="multi1_detail_${multiCard.firstMultiCardCateNum} multiCardDetailBenefit mt-2"><div class="d-flex justify-content-center"><img src="images/icon/arrow-right.png" style="width:50px;" >&nbsp;&nbsp;  </div><div class="multiCardDetailBenefitForArrow"><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${multiCard.firstBenefit}"/></span> 원 절약 가능해요!</div></div>
				   				 			</div>
				   				 			<div class="d-flex flex-column justify-content-center align-items-center">
				   				 			<div class="recommendedMultiCardName mt-1 mb-1" style="width:400px;">[${multiCard.secondMultiCardName}]</div>
				   							<div class="recommendedMultiCardComment mb-1" style="font-size:20px;">${multiCard.secondMultiCardComment}</div>
				   							<div style="font-size:20px; background-color:white; width:400px;">[${multiCard.secondMultiCardName}]로는</div>
				   							<div class="multi2_detail_${multiCard.secondMultiCardCateNum} multiCardDetailBenefit mt-2"><div class="d-flex justify-content-center"><img src="images/icon/arrow-right.png" style="width:50px;" >&nbsp;&nbsp;  </div><div class="multiCardDetailBenefitForArrow"><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${multiCard.secondBenefit}"/></span> 원 절약 가능해요!</div></div>				   		
				   				 			</div>
				   				 			</div>
				   						<div class="d-flex justify-content-center mt-5" style="height:80px;"><div class="mutliCardBenefit mt-2 mb-5" style="font-size:22px;">위에 카드를 조합해서 쓰면 한 달에 약&nbsp;<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${multiCard.obtainedBenefit}"/></span>&nbsp;원을 절약할 수 있어요!</div></div>
				   					</div>
				   					
				   					
				   					
				   				</div>					   								   				
				   			</c:forEach>
  						</div>				   		
  						<span style="font-size:20px;"></span>
				   </div>
				 </div>
			</div>
		</div>
		
		<div id="recommendMessage2" class="" data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine">
			<div class="d-flex justify-content-center mb-5">
				<span id="marketingMessage" class="text-center">나랑 비슷한 연령대의 사람들은 어떤 카드를 많이 쓸까?</span>
			</div>
			<div class="d-flex justify-content-end mb-3" style="margin-right:300px; font-family:pretendard;"><button class="btn findInformationButton" id="findInformationButton1" style="box-shadow:2px 2px 2px 2px grey;">정보 확인하기</button></div>
			<div class="container text-center">
  				<div class="row">
   					 <div class="col-5 recommendedGraph">
						<figure class="highcharts-figure">
    						<div id="container3"></div>
						</figure>  					 
   					 </div>
   					 
   					 <div class="col-1"></div>
   					 
    				 <div class="col-6 recommendedGraphImage1">
    				 	<span class="myAgeAndGenderGroup" style="display:none;"></span>	
    				 </div>
  				</div>		
			</div>
		</div>
		
		
		<div id="recommendMessage3" class=" mb-5" data-aos="fade-left" data-aos-offset="300" data-aos-easing="ease-in-sine">
			<div class="d-flex justify-content-center mb-2">
				<span id="marketingMessage" class="text-center">나랑 비슷한 소비패턴을 가진 사람들은 어떤 카드를 많이 쓸까?</span>
			</div>
			<div class="d-flex justify-content-end mb-3" style="margin-right:300px; font-family:pretendard;"><button class="btn findInformationButton" id="findInformationButton2" style="box-shadow:2px 2px 2px 2px grey;">정보 확인하기</button></div>			
			<div class="container text-center">
  				<div class="row">
   					 <div class="col-5 recommendedGraph">
   					 	<figure class="highcharts-figure">
    						<div id="container2"></div>
						</figure>
					 </div>	 
   					 <div class="col-1"></div>
   					 
    				 <div class="col-6 recommendedGraphImage2">   				 
						<span class="myClusteredGroup" style="display:none;"></span>	
					</div>
  				</div>		
			</div>
		</div>




		<div class="header">
			<div class="menu_btn">
				<a href="#"> </a>
			</div>
		</div>
		<div class="menu_bg"></div>
		<div class="sidebar_menu">
			<div class="close_btn">
				<a href="#"> <img
					src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMjMuOTU0IDIxLjAzbC05LjE4NC05LjA5NSA5LjA5Mi05LjE3NC0yLjgzMi0yLjgwNy05LjA5IDkuMTc5LTkuMTc2LTkuMDg4LTIuODEgMi44MSA5LjE4NiA5LjEwNS05LjA5NSA5LjE4NCAyLjgxIDIuODEgOS4xMTItOS4xOTIgOS4xOCA5LjF6Ii8+PC9zdmc+">
				</a>
			</div>
			<div class="d-flex justify-content-center mb-3 mt-1" data-aos="zoom-out-up">
  				<img class="" src="images/hana/logo.png" alt="" style="width:180px;" >
  			</div>
			<div class="cardCartTitle text-center">
				<img src="gif/shopping-basket.gif" style="width:90px;">${loginVO.name}님의 카드 장바구니
			</div>
			<div class="menu_wrap">

			</div>
		</div>
	</section>


	<img src="gif/shopping-cart.gif" alt="image" class="radius_img_2"
		id="myCardCart">
	<button id="recommendedCardButton"></button>
	<div class="recommendedCard_modal">
		<div class="recommendedCard_modal_content" title="클릭하면 창이 닫힙니다.">
			<div>
				<img class="animatedBoxImage" src="gif/cash.gif" alt="Image">
			</div>
			<div class="recommendModalTitle">
				해당 정보는 ${loginVO.name}님의<br> 3개월 데이터를 기반으로<br> 분석해 얻은
				결과입니다.
			</div>
		</div>
	</div>
	
	
	<button id="detailRecommendedCardModal_button"></button>

	<div class="detailRecommendedCardModal">
  			<div class="detailRecommendedCardModal_content" title="클릭하면 창이 닫힙니다.">
  				<div class="d-flex justify-content-center mb-1 mt-4" data-aos="zoom-out-up">
  					<img class="" src="images/hana/logo.png" alt="" style="width: 280px;" id="closeModal">
  				</div>
				<div class="detailRecommendedModal_sub_content">
				
				
				</div>
					    			
  			</div>
	</div>
	
	
	<button id="addCartNoticeModalButton">모달창</button>

	<div class="addCartNoticeModal">
  		<div class="addCartNoticeModal_content" title="클릭하면 창이 닫힙니다.">
    	  	<img class="addCartNoticeModalImage" src="gif/shopping.gif" alt="Image">
    	  	<div>
    	  		장바구니에 카드가<br> 등록되었습니다! 
    	  	</div>
    	</div>
	</div>
	
	
	<button id="clusterButtonAboutModal">모달창</button>

	<div class="clusterNoticeAboutModal">
  			<div class="clusterNoticeAboutModal_content" title="클릭하면 창이 닫힙니다.">
				<img src="images/hana/logo.png" style="width:50%"> 
				<div class="mt-5" style="font-size:20px; font-family: pretendard;">하나 FINDER에서 제공하는 <br>군집분석 결과로 얻은 결과입니다.</div>
 			</div>
 	</div>
	

	<footer>
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
	</footer>


	<jsp:include page="/WEB-INF/jsp/include/scriptFile.jsp"></jsp:include>


	<script src="js/slick.min.js"></script>


	<script type="text/javascript"
		src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

	<!--하이차트를 위해서!-->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	
	<script>
       $(function(){ 
              $("#recommendedCardButton").click(function(){
                $(".recommendedCard_modal").fadeIn();
              });
        
              $(".recommendedCard_modal_content").click(function(){
                   $(".recommendedCard_modal").fadeOut();
              }); 
              
              $("#detailRecommendedCardModal_button").click(function(){
            	    $(".detailRecommendedCardModal").fadeIn();
              });
              $("#closeModal").click(function(){
            	    $(".detailRecommendedCardModal").fadeOut();
              });
              $("#addCartNoticeModalButton").click(function(){
            	    $(".addCartNoticeModal").fadeIn();
              });   	  
              $(".addCartNoticeModal_content").click(function(){
            	    $(".addCartNoticeModal").fadeOut();
              });
              
              $("#clusterButtonAboutModal").click(function(){
            	    $(".clusterNoticeAboutModal").fadeIn();
              });
              
              $(".clusterNoticeAboutModal_content").click(function(){
                $(".clusterNoticeAboutModal").fadeOut();
              });
              
           	$('.center').slick({
        		  centerMode: true,
        		  centerPadding: '0px',
        		  slidesToShow: 3,
        		  slidesToScroll: 1,
        		  speed: 1000,
        		  autoplaySpeed:300,
        		  dots: true,
        		  arrows:true,
        		  autoplay: true,
        		  responsive: [
        		    {
        		      breakpoint: 768,
        		      settings: {
        		        arrows: true,
        		        centerMode: true,
        		        centerPadding: '40px',
        		        slidesToShow: 1
        		      }
        		    },
        		    {
        		      breakpoint: 480,
        		      settings: {
        		        arrows: true,
        		        centerMode: true,
        		        centerPadding: '40px',
        		        slidesToShow: 1
        		      }
        		    }
        		  ]
        		});
           	$('.center2').slick({
      		  centerMode: true,
      		  centerPadding: '0px',
      		  slidesToShow: 3,
      		  slidesToScroll: 1,
      		  speed: 1000,
      		  autoplaySpeed:300,
      		  dots: true,
      		  arrows:true,
      		  autoplay: true,
      		  responsive: [
      		    {
      		      breakpoint: 768,
      		      settings: {
      		        arrows: true,
      		        centerMode: true,
      		        centerPadding: '40px',
      		        slidesToShow: 1
      		      }
      		    },
      		    {
      		      breakpoint: 480,
      		      settings: {
      		        arrows: true,
      		        centerMode: true,
      		        centerPadding: '40px',
      		        slidesToShow: 1
      		      }
      		    }
      		  ]
      		});
           	
           	$('.fadeInMultiCardImage').slick({
           	  dots: true,
           	  infinite: true,
           	  speed: 300,
           	  fade: true,
           	  cssEase: 'linear',
           	  autoplay:true
           	  
           	});
          	
         });
    </script>

	<script>
    document.addEventListener("DOMContentLoaded",()=>{
    	
    	window.scrollTo({ left: 0, top:350}); 
    	$("#detailRecommendedCardModal_button").hide();
        $('#recommendedCardButton').hide();
        $('#recommendedCardButton').click();
        
    	for(let i=4;i<=9;i++){
    		let cardCateNum = $('.recommendedMyCreditList')[i].id;
    		cardCateNum = cardCateNum.substring(0,7);
    		console.log(cardCateNum);
    	 	 fetch("/noticeCardBenefit?cardCateNum="+cardCateNum)
    		   .then(res=>res.json())
    		   .then(res=>{
    			   let recommendedDetailBenefit= res;
    			   $('#'+cardCateNum+'_detailBenefit').append('<div class="d-flex justify-content-center mb-3"><img src="images/icon/arrow.png" style="width:25px;"></div>')
    			   $(recommendedDetailBenefit).each(function(){
    				   $('#'+cardCateNum+'_detailBenefit').append('<div class="RecommenddetailBenefitList d-flex justify-content-center" id="myRecommendedAlgorithm"><div class="mx-3 recommendedSmallCate d-flex justify-content-center">'+this.smallCate+'</div>'+' '+'<div class="RecommendedPrice d-flex justify-content-center"><span class="RecommendedDetailPrice">'+this.cardBenefit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</span>&nbsp;원 할인&nbsp;&nbsp;</div>');
    			   })
    		   })	  
    	}
 		for(let i=4;i<=9;i++){ 
    		let cardCateNum = $('.recommendedMyCheckList')[i].id;
    		cardCateNum = cardCateNum.substring(0,7);
    		console.log(cardCateNum);
    	 	 fetch("/noticeCardBenefit?cardCateNum="+cardCateNum)
    		   .then(res=>res.json())
    		   .then(res=>{
    			   let recommendedDetailBenefit= res;
    			   $('#'+cardCateNum+'_detailBenefit').append('<div class="d-flex justify-content-center mb-3"><div><img src="images/icon/arrow.png" style="width:25px;"></div>')
    			   $(recommendedDetailBenefit).each(function(){
    				   $('#'+cardCateNum+'_detailBenefit').append('<div class="RecommenddetailBenefitList d-flex justify-content-center" id="myRecommendedAlgorithm"><div class="mx-3 recommendedSmallCate d-flex justify-content-center">'+this.smallCate+'</div>'+' '+'<div class="RecommendedPrice d-flex justify-content-center"><span class="RecommendedDetailPrice">'+this.cardBenefit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</span>&nbsp;원 적립&nbsp;&nbsp;</div>');
    			   })
    		   })	  
    	} 
    	
    	/*하이차트 실행중  */
    	$('#findInformationButton1').click(function(){
    		const now = new Date().toLocaleString();   
	       	let identity = "${loginVO.identity}";
         	let gender = "${loginVO.gender}";
        	let year = now.substring(0,4);
        	let cardNameArray = [];
        	let cardOwnerArray = [];
   
            	let age = year-Number('19'+identity.substring(0,2))+1;
            	let ageGroup = Math.floor(age / 10) * 10;
      			if(gender=='M'){
               		$('.myAgeAndGenderGroup').empty();
            		$('.myAgeAndGenderGroup').append('<div class="mt-3"><img src="images/icon/man.png" style="width:60px">${loginVO.name}님은 '+ageGroup+' 대 남성입니다.</div>');
            		$('.myAgeAndGenderGroup').fadeIn(2000);
      			}else if(gender=='F'){
      				$('.myAgeAndGenderGroup').empty();
            		$('.myAgeAndGenderGroup').append('<div class="mt-3"><img src="images/icon/woman.png" style="width:60px">${loginVO.name}님은 '+ageGroup+' 대 여성입니다.</div>');   				
            		$('.myAgeAndGenderGroup').fadeIn(2000);
      			}
      			fetch("/recommendCardInMyAge?age="+ageGroup)
      			.then(res=>res.json())
      			.then(res=>{
      				let recommendedCardList = res; 
      				let cardOwnerObject = {};
      				cardOwnerObject.name='카드 순위'
      				cardOwnerObject.data = [];
      				cardOwnerObject.pointPlacement='on';
      				let str = '';
      				str +='<div class="container text-center mt-4"><div class="row">'
      				for(let i = 0; i<recommendedCardList.length;i++){
      					cardNameArray.push(recommendedCardList[i].CARD_NAME);
      					cardOwnerObject.data.push(recommendedCardList[i].CARD_OWNER);
						str += '<div class="col-sm-6 mt-2 mb-1"><div class="d-flex justify-content-center" style="font-size:18px;">['+recommendedCardList[i].CARD_NAME+']</div>'
      					str += '<div class="d-flex justify-content-center recommendedCardInSameAge mb-1"><img src="'+recommendedCardList[i].IMG_URL+'" style="width:50%; box-shadow:2px 2px 2px 2px gray; border-radius:10px;"></div>'
      					str += '<div class="d-flex justify-content-center" style="font-size:15px;">'+recommendedCardList[i].SORT_CARD+'</div></div>'
     				}
      				str+='</div></div>'
      				$('.myAgeAndGenderGroup').append(str);
      				 cardOwnerArray.push(cardOwnerObject);
      				
      	    		Highcharts.chart('container3', {

     	    		    chart: {
     	    		        polar: true,
     	    		        type: 'line',
    				        style: {
    				            fontFamily:'pretendard',
    				           	 fontSize: '1.3em'
    	
    				        }
     	    		    },

     	    		    accessibility: {
     	    		        description: 'A spiderweb chart compares the allocated budget against actual spending within an organization. The spider chart has six spokes. Each spoke represents one of the 6 departments within the organization: sales, marketing, development, customer support, information technology and administration. The chart is interactive, and each data point is displayed upon hovering. The chart clearly shows that 4 of the 6 departments have overspent their budget with Marketing responsible for the greatest overspend of $20,000. The allocated budget and actual spending data points for each department are as follows: Sales. Budget equals $43,000; spending equals $50,000. Marketing. Budget equals $19,000; spending equals $39,000. Development. Budget equals $60,000; spending equals $42,000. Customer support. Budget equals $35,000; spending equals $31,000. Information technology. Budget equals $17,000; spending equals $26,000. Administration. Budget equals $10,000; spending equals $14,000.'
     	    		    },

     	    		    title: {
     	    		        text: '카드 분포',
          				    style: {
            				    fontFamily:'pretendard',
            				    fontSize: '0.6em'   
        	
        				    },
     	    		        x: -80
     	    		    },

     	    		    pane: {
     	    		        size: '80%'
     	    		    },

     	    		    xAxis: {
     	    		        categories:cardNameArray,
        	        		tickmarkPlacement: 'on',
        	        		lineWidth: 0
     	    		    },

     	    		    yAxis: {
     	    		        gridLineInterpolation: 'polygon',
     	    		        lineWidth: 0,
     	    		        min: 0
     	    		    },

     	    		    tooltip: {
     	    		        shared: true,
     	    		        pointFormat: '<span style="color:{series.color}">{series.name}: <b></b><br/>'
     	    		    },

     	    		    legend: {
     	    		        align: 'right',
     	    		        verticalAlign: 'middle',
     	    		        layout: 'vertical'
     	    		    },

     	    		    series: cardOwnerArray,

     	    		    responsive: {
     	    		        rules: [{
     	    		            condition: {
     	    		                maxWidth: 500
     	    		            },
     	    		            chartOptions: {
     	    		                legend: {
     	    		                    align: 'center',
     	    		                    verticalAlign: 'bottom',
     	    		                    layout: 'horizontal'
     	    		                },
     	    		                pane: {
     	    		                    size: '70%'
     	    		                }
     	    		            }
     	    		        }]
     	    		    }
     	    		});			     				
      			})
    	});    	
    	$('#findInformationButton2').click(function(){
    		$("#clusterButtonAboutModal").click();
        	let cardNameArray = [];
        	let cardOwnerArray = [];
    		$('.myClusteredGroup').empty();
    		$('.myClusteredGroup').fadeIn(3000);
    		$('.myClusteredGroup').append('<div class="mt-2" style="font-size:18px;">하나 FINDER에서 제공하는 군집분석을 이용한 결과입니다.</div>');
 			fetch("/recommendCardInMyCluster?memberNum="+${loginVO.memberNum})
 			.then(res=>res.json())
 			.then(res=>{
 				let recommendedCardList = res; 
  				let cardOwnerObject = {};
  				cardOwnerObject.name='카드 순위'
  				cardOwnerObject.data = [];
  				cardOwnerObject.pointPlacement='on';
  				let str = '';
  				str +='<div class="container text-center mt-4"><div class="row">'
  				for(let i = 0; i<recommendedCardList.length;i++){
  					cardNameArray.push(recommendedCardList[i].CARD_NAME);
  					cardOwnerObject.data.push(recommendedCardList[i].CARD_OWNER);
					str += '<div class="col-sm-6 mt-2 mb-1"><div class="d-flex justify-content-center" style="font-size:18px;">['+recommendedCardList[i].CARD_NAME+']</div>'
  					str += '<div class="d-flex justify-content-center recommendedCardInSameAge mb-1"><img src="'+recommendedCardList[i].IMG_URL+'" style="width:50%; box-shadow:2px 2px 2px 2px gray; border-radius:10px;"></div>'
  					str += '<div class="d-flex justify-content-center" style="font-size:15px;">'+recommendedCardList[i].SORT_CARD+'</div></div>'
 				}
  				str+='</div></div>'
  				$('.myClusteredGroup').append(str);
  				 cardOwnerArray.push(cardOwnerObject);
 				
 				
 	    		Highcharts.chart('container2', {
  				    style: {
    				    fontFamily:'pretendard',  
				    },	    			
 	    		    chart: {
 	    		        polar: true,
 	    		        type: 'line',
 					    style: {
 					            fontFamily:'pretendard',
 					           	 fontSize: '1.3em'
 		
 					    }
 	    		    },

 	    		    accessibility: {
 	    		        description: 'A spiderweb chart compares the allocated budget against actual spending within an organization. The spider chart has six spokes. Each spoke represents one of the 6 departments within the organization: sales, marketing, development, customer support, information technology and administration. The chart is interactive, and each data point is displayed upon hovering. The chart clearly shows that 4 of the 6 departments have overspent their budget with Marketing responsible for the greatest overspend of $20,000. The allocated budget and actual spending data points for each department are as follows: Sales. Budget equals $43,000; spending equals $50,000. Marketing. Budget equals $19,000; spending equals $39,000. Development. Budget equals $60,000; spending equals $42,000. Customer support. Budget equals $35,000; spending equals $31,000. Information technology. Budget equals $17,000; spending equals $26,000. Administration. Budget equals $10,000; spending equals $14,000.'
 	    		    },

 	    		    title: {
 	    		        text: '카드 분포',
      				    style: {
        				    fontFamily:'pretendard',
        				    fontSize: '0.6em'      	
    				    },
 	    		        x: -80
 	    		    },

 	    		    pane: {
 	    		        size: '80%'
 	    		    },

 	    		    xAxis: {
 	    		        categories:cardNameArray,
      				    style: {
        				    fontFamily:'pretendard',
        				    fontSize: '2.0em'    	
    				    },
    	        		tickmarkPlacement: 'on',
    	        		lineWidth: 0
 	    		    },

 	    		    yAxis: {
 	    		        gridLineInterpolation: 'polygon',
 	    		        lineWidth: 0,
 	    		        min: 0
 	    		    },

 	    		    tooltip: {
 	    		        shared: true,
 	    		        pointFormat: '<span style="color:{series.color}">{series.name}: <b></b><br/>'
 	    		    },

 	    		    legend: {
 	    		        align: 'right',
 	    		        verticalAlign: 'middle',
 	    		        layout: 'vertical'
 	    		    },

 	    		    series: cardOwnerArray,

 	    		    responsive: {
 	    		        rules: [{
 	    		            condition: {
 	    		                maxWidth: 500
 	    		            },
 	    		            chartOptions: {
 	    		                legend: {
 	    		                    align: 'center',
 	    		                    verticalAlign: 'bottom',
 	    		                    layout: 'horizontal'
 	    		                },
 	    		                pane: {
 	    		                    size: '70%'
 	    		                }
 	    		            }
 	    		        }]
 	    		    }

 	    		});			
 			})
    	});
    	
      $('#myCardCart').on('click', function(){
    	  	$('.menu_wrap').empty();
      		window.scrollTo({ left: 0, top:180}); 
     	 	document.getElementById('myCardCart').style.opacity = 0;
            $('.menu_bg').show(); 
            $('.sidebar_menu').show().animate({
                 right:0
            });
      		let memberNum = ${loginVO.memberNum}	
      	
      		fetch("/showMyCardCartList?memberNum="+memberNum)
      		.then(res=>res.json())
      		.then(res=>{
      			let cardCartList = res;
      			for(let i=0;i<cardCartList.length;i++){
      				let cardComment=cardCartList[i].COMMENT_OF_CARD;
      				let cardImg = cardCartList[i].IMG_URL;
					let cardCateNum = cardCartList[i].CARD_CATE_NUM
					let cardName = cardCartList[i].CARD_NAME;
					let str = ' '
					str += '<div>'
					str += '<div class="text-center addedMyCardName mb-2">['+cardName+']</div>';
					str += '<div class="text-center addedMyCardComment mb-2">'+cardComment+'</div>';
					str += '<div class="text-center mb-2"><img src="'+cardImg+'" class="cardImgInMyCart" id="cartImg_'+cardCateNum+'" onclick="displayDetailBenefitInMyCart(this.id)"></div>';
					str += '<div id="cardCartDetailBenefit_'+cardCateNum+'"></div>'
					str += '<div class="text-center deleteWishedCardDIV"><button class="deleteWishedCard" type="button" id="deleteInMyCart_'+cardCateNum+'" onClick="deleteWishedCardInMyCart(this.id)">장바구니에서 지우기</button></div>'
					str += '<hr>'
					str += '</div>'

      				$('.menu_wrap').append(str);
      			}
				$('.menu_wrap').hide();
				$('.menu_wrap').fadeIn(3000);	
				return new Promise((resolve,reject)=>{
					resolve("success")
				})
				
      		})
      		.then(res=>{
      			let myCardList=$('.cardImgInMyCart')
      			for(let i=0;i<myCardList.length;i++){
      				let cardCateNum = myCardList[i].id
      				fetch("/calcBenefitInMyCart?cardCateNum="+cardCateNum.substring(8))
      				.then(res => res.json())
      				.then(res=>{
      					let cardBenefitList = res
      					let sum = 0;
      					for(let j=0;j<cardBenefitList.length;j++){
      						sum += cardBenefitList[j].cartBenefit;
      					}
      					$('#cardCartDetailBenefit_'+cardCateNum.substring(8)).append('<div class="text-center addedCartSum mb-2 mt-2">한 달에 평균<span> '+sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+' </span>원의 혜택을 얻을 수 있습니다.</div>');
      				})
      				 
      			}
      		})  
      });
      $('.close_btn>a').on('click', function(){
    	  for (let opacity = 0; opacity < 1.1; opacity = opacity + 0.1) {           
    	      setTimeout(function(){
    	    	  document.getElementById('myCardCart').style.opacity = opacity;
    	    	  },300)                       
    	  }  
    	  
            $('.menu_bg').hide(); 
            $('.sidebar_menu').animate({
                 right: '-' + 50 + '%'
            },function(){$('.sidebar_menu').hide(); }); 
      });              
      setTimeout(()=>{
          $('.loading-container').hide();
          $('.loading').hide();
          $('.recommendedCard_modal_content').click()          
       },8000)
      
/*       $('.multiCardImage').hover(function(){
    	  let input = this.id;
    	  let preText = input.substring(0,7);
    	  let cardCateNum = input.substring(7);
    	  $('.'+preText+'detail_'+cardCateNum).fadeIn(1000); 
      },function(){
    	  let input = this.id;
    	  let preText = input.substring(0,7);
    	  let cardCateNum = input.substring(7);    	  
    	  $('.'+preText+'detail_'+cardCateNum).fadeOut(1000); 
      })
 */
       
       
       
       
       
        $('.backImage').hover(function(){

        	let num = this.id
        	let cardCateNum = num.substring(0,7);

        	let displayNum = num.substring(8,9);

            var Cheight = $(window).height();
            $('#recommendedInfo_'+displayNum+'_'+cardCateNum).css({'height':Cheight+'px'});
       },function(){
    	  let num = this.id
    	  $('.recommendedInfo').css('height',0);
      }); 
    });
    
    
    
    function wantToSeeDetailCard(input){
    	window.scrollTo({ left: 0, top:350}); 
    	$('.detailRecommendedModal_sub_content').empty();

    	let cardCateNum = input.substring(0,7);
    	let cardImageUrl = input.substring(10);

    	let memberNum = ${loginVO.memberNum};

    	$("#detailRecommendedCardModal_button").click();
			
		$('.detailRecommendedModal_sub_content').append('<div class="d-flex justify-content-center" id="recommendedCardAnalysisModalTitle" data-aos="fade-up" data-aos-duration="2000"><img class="" src="images/icon/report.png" alt="" style="width: 90px;" id="closeModal">&nbsp;&nbsp;${loginVO.name}님의 카드 REPORT</div>');
		$('.detailRecommendedModal_sub_content').append('<div class="d-flex justify-content-center mb-1" data-aos="fade-right"><hr align="center" style="border: 12px #008675; width: 50%; height:5px" class="underBarAnalysisModalTitle"></div>')
				
		$('.detailRecommendedModal_sub_content').append('<div class="mb-2 mt-2" id="recommendedCardAnalysisScript"></div>');
		let something = '';
		
    	var app = document.getElementById('recommendedCardAnalysisScript');
   	    var typewriter = new Typewriter(app,{
          loop: true,
          cursor: "",
    	});     
   		typewriter.typeString('${loginVO.name}님이 가진 카드와 비교하면?')
        	.pauseFor(1500)
       		.deleteAll()
       		.typeString('${loginVO.name}님이 가진 카드와 비교하면?')
       		.pauseFor(1500)
       		.deleteAll()
       		.start();
   			
		fetch("/giveMeCardList?memberNum="+memberNum)
		.then(res=>res.json())
		.then(res=>{
			let myCardList = res;
			console.log("cardImageUrl : "+cardImageUrl);
			for(let i=0;i<myCardList.length;i++){
				let cardValidDate = myCardList[i].cardValidDate;
				let cardCVC = myCardList[i].cardCvcNum;
				let cardName = myCardList[i].cardName;
				let myCardImrUrl = myCardList[i].cardImgUrl;
				let myCardNum = myCardList[i].cardNum;
				let cardCateNum = myCardList[i].cardCateNum;
				let wishedCardCateNum=input.substring(0,7)
	   			let str ='';
	   			str +='<div class="d-flex justify-content-between cardCompare mb-5">'
	   			str +='<div class="container text-center">'
	   			str +='<div class="d-flex justify-content-around"><div class="myCardNotice">비교중인 카드</div><div class="myCardNotice">내가 가진 카드</div></div>';
	   			str +='<div class="d-flex justify-content-around"><button class="addSelectedCardInMyCart" id="addSelectedCardInMyCart '+wishedCardCateNum+'" onClick="addMyCardBasket(this.id)">찜하기</button><div class="explanation mb-3">내가 가진 카드의 혜택을 좌측 카드를 사용했을 때의 혜택과 비교해보세요!</div></div>';
	   			str +='<div class="row justify-content-between">'
	   			str +='<div class="col-sm-6 comparedSection">'

	   			str +='<div class="comaparedSectionImage"></div>'
	   			str +='<div class="comparedSectionPrice comparedSectionPrice_'+myCardNum+'"+ id="'+myCardNum+' '+cardCateNum+'"></div>'

	   			str +='</div>'
	   			str +='<div class="col-sm-6 comparedWithMyCard">'
	   			str +='<div class="ComparedMyCardSectionImage" id="'+cardCateNum+'">'
	   			str +='<div class="container text-center mt-4"><div class="row">'
	   			str +='<div class="col-6">'
 				str += '<img src="'
 				str +=myCardImrUrl;
 				str +='" class="comparedImage">'
 				str +='</div>'
 				str +='<div class="col-6">'
 				str +='<div class="mb-3 mt-3" id="recommendedDetailCardTitleInModal">['
 		 	 	str +=cardName
 		 	 	str +=']</div>'	
 				str +='<div class="mt-4 myCardNumInRecommendedTitle"></div>'
 				str +='<div class="mt-3 myCardNumInRecommended">카드 번호 : '+myCardNum+'</div>';
 				str +='<div class="myCardValidDate mt-2">valid date : '+cardValidDate+'</div>'
 				str +='</div>'
 				
 				str +='</div>'
 				str +='</div>'
	   			str +='</div>'

	   			str +='<div class="ComparedMyCardSectionPrice myCardBenefit_'+myCardNum+'" id="'+myCardNum+'">'
	   			

	   			str +='</div>'
	   			str +='</div>'
	   			str +='</div>'
	   			str +='</div>'
	   			str +='</div>' 		
	   			$('.detailRecommendedModal_sub_content').append(str);
			}
	   		$('.ComparedMyCardSectionImage').hide();	
	   		$('.ComparedMyCardSectionImage').fadeIn(3000);
	   		
	   		return new Promise((resolve,reject)=>{
	   			resolve('success');
	   		})
		})		
   		.then(res=>{
   			fetch("/showInfoAboutCard?cardCateNum="+cardCateNum)
   			.then(res=>res.json())
   			.then(res=>{
   				let str = '';
 				let cardInfo = res;
 				let cardName = cardInfo[0].CARD_NAME;
 				let cardComment = cardInfo[0].COMMENT_OF_CARD;
 				let cardImage = cardInfo[0].IMG_URL;
 				let cardSort = cardInfo[0].SORT_CARD;
 				str += '<div class="container text-center mt-4"><div class="row">'
 				str += '<div class="col-6">'
 				str += '<img src="';
 				str +=cardImage;
 				str +='" class="comparedImage">'
 				str += '</div>'
 				str +='<div class="col-6">'
 				str +='<div class="mb-3 mt-3" id="recommendedDetailCardTitleInModal">['
 				str +=cardName
 				str +=']</div>'
 				str +='<div class="mb-3 mt-1" id="recommendedDetailCardCommentInModal">'
 	 			str +=cardComment
 	 			str +='</div>'		
 				str +='<div class="">'
 				str +='<div class="mt-4 mb-3" id="recommendedDetailCardSort">'
 				str +=cardSort
 				str +='</div>'
 				str +='</div>'
 				str +='</div>'
 				
 					
 				$('.comaparedSectionImage').append(str); 
 				
 				
 				$('.comaparedSectionImage').hide();
 				$('.comaparedSectionImage').fadeIn(3000);
   			})
   			 	return new Promise((resolve,reject)=>{
 		   			resolve('success');
 		   	})	
   		})
 		.then(res=>{
 			    let cardCateNum = input.substring(0,7);
 				for(let i =0;res.length;i++){
   					let memberNum= ${loginVO.memberNum}; 
   					let	input1 = $('.comparedSectionPrice')[i].id;
   					let cardNum = input1.substring(0,19);
   					fetch("/showSelectedCardBeneAli?memberNum="+memberNum+"&cardNum="+cardNum+"&cardCateNum="+cardCateNum)
   					.then(res=>res.json())
   					.then(res=>{
   						myBenefitList = res
   						$('.comparedSectionPrice_'+cardNum).append('<div class="d-flex justify-content-center"><div class="comparedSectionBenefitList mb-3 mt-5 text-center"><img src="images/icon/benefit.png" style="width:45px;">&nbsp;카드 혜택</div></div>')
   						$('.comparedSectionPrice_'+cardNum).append('<div class="mt-3 mb-4 aliImage aliImage_'+cardNum+' d-flex" id="aliImageParent_'+cardCateNum+'" style="overflow:hidden"></div>');
   						let sum = 0;
   						let str = ''
   						str +='<div class="container text-center"><div class="row">'
   						for(let i=0; i<myBenefitList.length;i++){
   							let smallCate = myBenefitList[i].smallCate;
   							let cardBenefit = myBenefitList[i].cardBenefit;
   							let aliType = myBenefitList[i].aliType;
   							$('.aliImage_'+cardNum).append('<div class="aliImageCircle"><img src="images/ali_icon/'+aliType+'.png" class="aliIcon" alt=""></div>');
   							str += '<div class="col-6">'
   							str += '<div class="comparedSectionSmallCate mb-2">'+smallCate+' ['+aliType+']</div>'
   							str += '<div class="comparedSectionCardBenefit mb-3"><span class="detailPriceNumber">'+cardBenefit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</span> 원</div>'
   							str +='</div>'
   							
   							sum += cardBenefit;				
   						}
   						str +='</div></div>'
   						$('.comparedSectionPrice_'+cardNum).append('<div class="monthSum">한 달 평균&nbsp; <span> '+sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</span> 원 혜택 받을 수 있습니다.</div>')
   						$('.comparedSectionPrice_'+cardNum).append(str);
   						$('.comparedSectionPrice_'+cardNum).hide();
   						$('.comparedSectionPrice_'+cardNum).fadeIn(2000)
   					
   					})
 				}
   			 	return new Promise((resolve,reject)=>{
 		   			reject('success');
 		   	})	
 		
 		}) 
    	.catch(res=>{
    		$('.ComparedMyCardSectionPrice').append('<div class="d-flex justify-content-center"><div class="comparedSectionBenefitList mb-3 mt-5"><img src="images/icon/benefit.png" style="width:45px;">&nbsp;카드 혜택</div></div>')
    		input=$('.ComparedMyCardSectionPrice');
    		for(let i=0; i<input.length;i++){		
    			let myCardNumber=input[i].id;
    			$('.myCardBenefit_'+myCardNumber).append('<div class="mb-4 mt-3 myCardAliImageSection d-flex myCardAliImageSection_'+myCardNumber+'" style="overflow:hidden"></div>')
    			
    			fetch("/showObtainedBenefit_3?cardNum="+myCardNumber)
    			.then(res=>res.json())
    			.then(res=>{
    					
  					let cardBeneList = res;
  					let sum =0;
					let str = '';
					str +='<div class="container text-center"><div class="row">'
    				for(let i=0; i< cardBeneList.length; i++){

    					let smallCate =  cardBeneList[i].smallCate;
    					let cardBenefit =  cardBeneList[i].cardBenefit;
    					let aliType =  cardBeneList[i].aliType;
    					$('.myCardAliImageSection_'+myCardNumber).append('<div class="aliImageCircle"><img src="images/ali_icon/'+aliType+'.png" class="aliIcon"></div>')
        				
    					str +='<div class="col-6"><div class="comparedSectionSmallCate_2 mb-2">'+smallCate+' ['+aliType+']</div>'
    					str +='<div class="mb-3 comparedSectionCardBenefit"><span class="detailPriceNumber">'+cardBenefit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+' </span>원</div></div>'
    			  
    					sum+=cardBenefit;
    				}
    				str +='</div></div>'
    	   		 	$('.myCardBenefit_'+myCardNumber).append('<div class="monthSum">한 달 평균&nbsp;<span> '+sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</span> 원 혜택 받았습니다</div>');
    				   
    		 		$('.myCardBenefit_'+myCardNumber).append(str);
  				
    			})
    		}		
    		$('.ComparedMyCardSectionPrice').hide();
    		$('.ComparedMyCardSectionPrice').fadeIn(3000);
    	})
    }
    
    </script>
	<script>
    	var app = document.getElementById('typingRecommendMessage');
   	    var typewriter = new Typewriter(app,{
          loop: true,
          cursor: "",
    	});     
   		typewriter.typeString('${loginVO.name}님의 소비패턴으로 분석한 카드 추천 결과입니다.')
        	.pauseFor(1000)
       		.deleteAll()
       		.typeString('하단을 보시면 추가 정보를 얻을 수 있습니다.')
       		.pauseFor(1000)
       		.deleteAll()
       		.typeString('${loginVO.name}님의 소비패턴으로 분석한 카드 추천 결과입니다.')
       		.pauseFor(1000)
       		.start();
 	</script>
	<script>
		AOS.init();
    </script>
    <script>
    function addMyCardBasket(input){
    	let memberNum = ${loginVO.memberNum}
     	let cardCateNum = input.substring(24);
    	$("#addCartNoticeModalButton").click();
    	fetch("/addSelectedCardIntoCart?cardCateNum="+cardCateNum+"&memberNum="+memberNum)
    	.then(res=>{
    		console.log("성공!");
    	}) 
    }
    function deleteWishedCardInMyCart(input){
    	let memberNum = ${loginVO.memberNum}
    	let cardCateNum = input.substring(15);
    	console.log("cardCateNum은 뭐가 들어올까?:"+cardCateNum);
    	fetch("/deleteMyWishedCard?memberNum="+memberNum+'&cardCateNum='+cardCateNum)
    	.then(res=>{
      		fetch("/showMyCardCartList?memberNum="+memberNum)
      		.then(res=>res.json())
      		.then(res=>{
      			$('.menu_wrap').empty();				
      			let cardCartList = res;
      			for(let i=0;i<cardCartList.length;i++){
      				let cardComment=cardCartList[i].COMMENT_OF_CARD;
      				let cardImg = cardCartList[i].IMG_URL;
					let cardCateNum = cardCartList[i].CARD_CATE_NUM
					let cardName = cardCartList[i].CARD_NAME;
					let str = ' '
					str += '<div>'
					str += '<div class="text-center addedMyCardName mb-2">['+cardName+']</div>';
					str += '<div class="text-center addedMyCardComment mb-2">'+cardComment+'</div>';
					str += '<div class="text-center mb-2"><img src="'+cardImg+'" class="myAddedCardImgInMyCart" id="cartImg_'+cardCateNum+'" onclick="displayDetailBenefitInMyCart(this.id)"></div>'
					str += '<div id="cardCartDetailBenefit_'+cardCateNum+'"></div>'
					str += '<div class="text-center deleteWishedCardDIV"><button class="deleteWishedCard" type="button" id="deleteInMyCart_'+cardCateNum+'" onclick="deleteWishedCardInMyCart(this.id)">장바구니에서 지우기</button></div>'
					str += '<hr>'
					str += '</div>'
      				$('.menu_wrap').append(str);
      			}
				return new Promise((resolve,reject)=>{
					resolve("success");
				})
      			
      		})
      		.then(res=>{
      			let myCardList=$('.myAddedCardImgInMyCart')
      			console.log("myCardList : " + myCardList[0].id);	
      			for(let i=0;i<myCardList.length;i++){
      				let cardCateNum = myCardList[i].id
      				cardCateNum = cardCateNum.substring(8);
      				fetch("/calcBenefitInMyCart?cardCateNum="+cardCateNum)
      				.then(res => res.json())
      				.then(res=>{
      					let cardBenefitList = res;
      					let sum = 0;
      					for(let j=0;j<cardBenefitList.length;j++){
      						sum += cardBenefitList[j].cartBenefit;
      					}
      					$('#cardCartDetailBenefit_'+cardCateNum).append('<div class="text-center addedCartSum mb-2 mt-2">한 달에 평균<span> '+sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+' </span>원의 혜택을 얻을 수 있습니다.</div>');
      				})
      				 
      			}
      		})  
    	})   	
    }
    function displayDetailBenefitInMyCart(input){
 	
         window.scrollTo({ left: 0, top:350}); 
         $('.detailRecommendedModal_sub_content').empty();

         let cardCateNum = input.substring(8,15);
         
         let cardImageUrl = $('.cardImgInMyCart')[0].src;
        
         let memberNum = ${loginVO.memberNum};

         $("#detailRecommendedCardModal_button").click();
           
        $('.detailRecommendedModal_sub_content').append('<div class="d-flex justify-content-center" id="recommendedCardAnalysisModalTitle" data-aos="fade-up" data-aos-duration="2000"><img class="" src="images/icon/report.png" alt="" style="width: 90px;" id="closeModal">&nbsp;&nbsp;${loginVO.name}님의 카드 REPORT</div>');
        $('.detailRecommendedModal_sub_content').append('<div class="d-flex justify-content-center mb-1" data-aos="fade-right"><hr align="center" style="border: 12px #008675; width: 50%; height:5px" class="underBarAnalysisModalTitle"></div>')
              
        $('.detailRecommendedModal_sub_content').append('<div class="mb-5 mt-5" id="recommendedCardAnalysisScript"></div>');
        let something = '';
        
         var app = document.getElementById('recommendedCardAnalysisScript');
            var typewriter = new Typewriter(app,{
            loop: true,
            cursor: "",
         });     
           typewriter.typeString('${loginVO.name}님이 가진 카드와 비교하면?')
             .pauseFor(1500)
               .deleteAll()
               .typeString('${loginVO.name}님이 가진 카드와 비교하면?')
               .pauseFor(1500)
               .deleteAll()
               .start();
              
        fetch("/giveMeCardList?memberNum="+memberNum)
        .then(res=>res.json())
        .then(res=>{
           let myCardList = res;
           console.log("cardImageUrl : "+cardImageUrl);
           for(let i=0;i<myCardList.length;i++){
              let cardValidDate = myCardList[i].cardValidDate;
              let cardCVC = myCardList[i].cardCvcNum;
              let cardName = myCardList[i].cardName;
              let myCardImgUrl = myCardList[i].cardImgUrl;
              let myCardNum = myCardList[i].cardNum;
              let cardCateNum = myCardList[i].cardCateNum;
              let wishedCardCateNum=input.substring(8,15)
                 let str ='';
                 str +='<div class="d-flex justify-content-between cardCompare mb-5">'
                 str +='<div class="container text-center">'
                 str +='<div class="d-flex justify-content-around"><div class="myCardNotice">비교중인 카드</div><div class="myCardNotice">내가 가진 카드</div></div>';
                 str +='<div class="d-flex justify-content-around"><button class="addSelectedCardInMyCart" id="addSelectedCardInMyCart '+wishedCardCateNum+'" onClick="addMyCardBasket(this.id)">찜하기</button><div class="explanation mb-3">내가 가진 카드의 혜택을 좌측 카드를 사용했을 때의 혜택과 비교해보세요!</div></div>';
                 str +='<div class="row justify-content-between">'
                 str +='<div class="col-sm-6 comparedSection">'

                 str +='<div class="comaparedSectionImage"></div>'
                 str +='<div class="comparedSectionPrice comparedSectionPrice_'+myCardNum+'"+ id="'+myCardNum+' '+cardCateNum+'"></div>'

                 str +='</div>'
                 str +='<div class="col-sm-6 comparedWithMyCard">'
                 str +='<div class="ComparedMyCardSectionImage" id="'+cardCateNum+'">'
                 str +='<div class="container text-center mt-4"><div class="row">'
                 str +='<div class="col-6">'
               	 str += '<img src="'
               	 str +=myCardImgUrl;
               	 str +='" class="comparedImage">'
               	 str +='</div>'
               	 str +='<div class="col-6">'
               	 str +='<div class="mb-3 mt-3" id="recommendedDetailCardTitleInModal">['
                 str +=cardName
                 str +=']</div>'   
               	 str +='<div class="mt-4 myCardNumInRecommendedTitle"></div>'
               	 str +='<div class="mt-3 myCardNumInRecommended">카드 번호 : '+myCardNum+'</div>';
               	 str +='<div class="myCardValidDate mt-2">valid date : '+cardValidDate+'</div>'
               	 str +='</div>'
               
               	 str +='</div>'
               	 str +='</div>'
                 str +='</div>'

                 str +='<div class="ComparedMyCardSectionPrice myCardBenefit_'+myCardNum+'" id="'+myCardNum+'">'
                 

                 str +='</div>'
                 str +='</div>'
                 str +='</div>'
                 str +='</div>'
                 str +='</div>'       
                 $('.detailRecommendedModal_sub_content').append(str);
           }
              $('.ComparedMyCardSectionImage').hide();   
              $('.ComparedMyCardSectionImage').fadeIn(3000);
              
              return new Promise((resolve,reject)=>{
                 resolve('success');
              })
        })      
           .then(res=>{
              fetch("/showInfoAboutCard?cardCateNum="+cardCateNum)
              .then(res=>res.json())
              .then(res=>{
                 let str = '';
               	 let cardInfo = res;
               	 let cardName = cardInfo[0].CARD_NAME;
               	 let cardComment = cardInfo[0].COMMENT_OF_CARD;
               	 let cardImage = cardInfo[0].IMG_URL;
               	 let cardSort = cardInfo[0].SORT_CARD;
               	 str += '<div class="container text-center mt-4"><div class="row">'
               	 str += '<div class="col-6">'
               	 str += '<img src="';
               	 str +=cardImage;
                 str +='" class="comparedImage">'
               	 str += '</div>'
               	 str +='<div class="col-6">'
               	 str +='<div class="mb-3 mt-3" id="recommendedDetailCardTitleInModal">['
               	 str +=cardName
               	 str +=']</div>'
               	 str +='<div class="mb-3 mt-1" id="recommendedDetailCardCommentInModal">'
                 str +=cardComment
                 str +='</div>'      
               	 str +='<div class="">'
               	 str +='<div class="mt-4 mb-3" id="recommendedDetailCardSort">'
               	 str +=cardSort
               	 str +='</div>'
               	 str +='</div>'
               	 str +='</div>'                  
              	 $('.comaparedSectionImage').append(str); 
               
               
               	 $('.comaparedSectionImage').hide();
               	 $('.comaparedSectionImage').fadeIn(3000);
              })
                  return new Promise((resolve,reject)=>{
                     resolve('success');
               })   
           })
         .then(res=>{
               let cardCateNum = input.substring(8,15);
               for(let i =0;res.length;i++){
                    let memberNum= ${loginVO.memberNum}; 
                    let   input1 = $('.comparedSectionPrice')[i].id;
                    let cardNum = input1.substring(0,19);
                    fetch("/showSelectedCardBeneAli?memberNum="+memberNum+"&cardNum="+cardNum+"&cardCateNum="+cardCateNum)
                    .then(res=>res.json())
                    .then(res=>{
                       myBenefitList = res
                       $('.comparedSectionPrice_'+cardNum).append('<div class="d-flex justify-content-center"><div class="comparedSectionBenefitList mb-3 mt-5 text-center"><img src="images/icon/benefit.png" style="width:45px;">&nbsp;카드 혜택</div></div>')
                       $('.comparedSectionPrice_'+cardNum).append('<div class="mt-3 mb-4 aliImage aliImage_'+cardNum+' d-flex" id="aliImageParent_'+cardCateNum+'" style="overflow:hidden"></div>');
                       let sum = 0;
                       let str = ''
                       str +='<div class="container text-center"><div class="row">'
                       for(let i=0; i<myBenefitList.length;i++){
                          let smallCate = myBenefitList[i].smallCate;
                          let cardBenefit = myBenefitList[i].cardBenefit;
                          let aliType = myBenefitList[i].aliType;
                          $('.aliImage_'+cardNum).append('<div class="aliImageCircle"><img src="images/ali_icon/'+aliType+'.png" class="aliIcon" alt=""></div>');
                          str += '<div class="col-6">'
                          str += '<div class="comparedSectionSmallCate mb-2">'+smallCate+' ['+aliType+']</div>'
                          str += '<div class="comparedSectionCardBenefit mb-3"><span class="detailPriceNumber">'+cardBenefit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</span> 원</div>'
                          str +='</div>'
                          
                          sum += cardBenefit;            
                       }
                       str +='</div></div>'
                       $('.comparedSectionPrice_'+cardNum).append('<div class="monthSum">한 달 평균&nbsp; <span> '+sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</span> 원 혜택 받을 수 있습니다.</div>')
                       $('.comparedSectionPrice_'+cardNum).append(str);
                       $('.comparedSectionPrice_'+cardNum).hide();
                       $('.comparedSectionPrice_'+cardNum).fadeIn(2000)
                    
                    })
               }
                  return new Promise((resolve,reject)=>{
                     reject('success');
               })   
         
         }) 
         .catch(res=>{
            $('.ComparedMyCardSectionPrice').append('<div class="d-flex justify-content-center"><div class="comparedSectionBenefitList mb-3 mt-5"><img src="images/icon/benefit.png" style="width:45px;">&nbsp;카드 혜택</div></div>')
            input=$('.ComparedMyCardSectionPrice');
            for(let i=0; i<input.length;i++){      
               let myCardNumber=input[i].id;
               $('.myCardBenefit_'+myCardNumber).append('<div class="mb-4 mt-3 myCardAliImageSection d-flex myCardAliImageSection_'+myCardNumber+'" style="overflow:hidden"></div>')
               
               fetch("/showObtainedBenefit_3?cardNum="+myCardNumber)
               .then(res=>res.json())
               .then(res=>{
                     
                   let cardBeneList = res;
                   let sum =0;
                 let str = '';
                 str +='<div class="container text-center"><div class="row">'
                  for(let i=0; i< cardBeneList.length; i++){

                     let smallCate =  cardBeneList[i].smallCate;
                     let cardBenefit =  cardBeneList[i].cardBenefit;
                     let aliType =  cardBeneList[i].aliType;
                     $('.myCardAliImageSection_'+myCardNumber).append('<div class="aliImageCircle"><img src="images/ali_icon/'+aliType+'.png" class="aliIcon"></div>')
                      
                     str +='<div class="col-6"><div class="comparedSectionSmallCate_2 mb-2">'+smallCate+' ['+aliType+']</div>'
                     str +='<div class="mb-3 comparedSectionCardBenefit"><span class="detailPriceNumber">'+cardBenefit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+' </span>원</div></div>'
                 
                     sum+=cardBenefit;
                  }
                  str +='</div></div>'
                      $('.myCardBenefit_'+myCardNumber).append('<div class="monthSum">한 달 평균&nbsp;<span> '+sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</span> 원 혜택 받았습니다</div>');                
                   	  $('.myCardBenefit_'+myCardNumber).append(str);
                
               })
            }      
            $('.ComparedMyCardSectionPrice').hide();
            $('.ComparedMyCardSectionPrice').fadeIn(3000);
         })
     }
    </script>

</body>
</html>