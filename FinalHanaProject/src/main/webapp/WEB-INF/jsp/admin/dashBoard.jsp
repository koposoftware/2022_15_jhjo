<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HANA FINDER</title>
	<jsp:include page="/WEB-INF/jsp/include/cssFile.jsp"></jsp:include>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link href="css/dashBoard/dashBoard.css" rel="stylesheet"> 
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>
		<div class="w3-sidebar w3-bar-block w3-collapse w3-card" style="width:320px; height:800px; background-color:#FAFAFA; position:sticky;" id="mySidebar">
  			<button class="w3-bar-item w3-button w3-hide-large" onclick="w3_close()">Close &times;</button>
  			  	<div class="text-center mt-4 sideBarTitleInDashBoard">&nbsp;&nbsp;<span style="border-radius:8px;">Marketing & Analysis</span></div>
  				<div class="d-flex justify-content-center">
  					<hr style="width:80%; height:3px;">
  				</div>
  				<div class="d-flex justify-content-center">
  					<div class="sidbarContentInDashBoard d-flex justify-content-center mt-2"><span class="sideBarInDashBoard d-flex justify-content-around"><div style="background-color:#E0F7FA; width:24%; border-radius:15px; box-shadow: 1.5px 1.5px 1.5px 1.5px grey; padding:8px 10px;"><a href="/sendMail"><img src="images/icon/email.png" style="width:100%;"></div><span style="width:50%; padding:2px 20px">메일 발송</span></a></span></div>
  				</div>
  				<div class="d-flex justify-content-center">
  					<div class="sidbarContentInDashBoard d-flex justify-content-center mt-4"><span class="sideBarInDashBoard d-flex justify-content-around"><div style="background-color:#E0F7FA; width:24%; border-radius:15px; box-shadow: 1.5px 1.5px 1.5px 1.5px grey; padding:10px 10px;"><a href="/moveDashBoard"><img src="images/icon/data-analysis.png" style="width:100%;"></div><span style="width:50%; padding:2px 20px">통계/분석</span></a></span></div>	
				</div>
		</div>	
		<div class="d-flex justify-content-center dashBoardTitleInDIV text-center"  data-aos="fade-up" data-aos-duration="3000" style="margin-top:60px;"><img src="images/hana/logo.png" style="width:20%;">&nbsp 관리자 대시 보드</div>
		<div class="d-flex justify-content-center dashBoardTitleInDIV"  data-aos="fade-right" data-aos-offset="600" data-aos-easing="ease-in-sine"><hr style="width:40%; height:5px;"></div>
		<div class="container text-center d-flex justify-content-center">
			<div class="row" style="width:100%;">
			 	<div class="col-sm-1"></div>
			 	<div class="col-sm-3 dashBoardOnePoint" style="position:relative;">
			 		<div style="position:absolute; top:-40px; left:-10px;">
			 			<img src ="images/icon/people.png" style="width:80px;"> 
			 		</div>
			 		<div class="mt-3" style="font-size:27px;">총 회원 수</div>
			 		<div style="font-size:30px;" class="mb-3" id="amountOfCustomer"></div>
			 		<c:if test="${increaseRatio[0].INCREASE_RATIO*100 lt 100}">
						<div class="mb-3">&nbsp;올해 가입자수는 작년보다 <br>약&nbsp;<span style="color:blue">${100-increaseRatio[0].INCREASE_RATIO*100}</span>% 감소했습니다.<div class="wrap"><img src="images/icon/decrease.png" style="width:40px;" class="chatbox"></div></div>
					</c:if>
					<c:if test="${increaseRatio[0].INCREASE_RATIO*100 gt 100}">
						<div class="mb-3">&nbsp;올해 가입자수는 작년보다 <br>약&nbsp;<span style="color:red;">${increaseRatio[0].INCREASE_RATIO*100-100}</span>%만큼 증가했습니다.<div class="wrap"><img src="images/icon/increase.png" style="width:40px;" class="chatbox"></div></div>
					</c:if>							
			 	</div>
			 	<div class="col-sm-1"></div>		
			 	<div class="col-sm-3 dashBoardOnePoint" style="position:relative;">
			 		<div style="position:absolute; top:-40px; left:-10px;">
			 			<img src ="images/icon/transaction.png" style="width:80px;"> 
			 		</div>
			 		<div class="mt-3" style="font-size:27px;">금일 총 거래액</div>
			 		<div style="font-size:24px;" class="mb-3" id="transactionAmountToday"></div>
			 		<c:if test="${spentMoneyMap[0].SPENT_MONEY_RATIO*100 lt 100}">
			 				<div class="mb-3">&nbsp;금일 총 소비액은 어제에 비해 <br>약&nbsp;&nbsp;<span style="color:blue"><fmt:formatNumber value="${100-spentMoneyMap[0].SPENT_MONEY_RATIO*100}" pattern="#.##"/></span>% 감소했습니다.<div class="wrap"><img src="images/icon/decrease.png" style="width:40px;" class="chatbox"></div></div>				
			 		</c:if>			 		
			 		<c:if test="${spentMoneyMap[0].SPENT_MONEY_RATIO*100 gt 100}">
			 				<div class="mb-3">&nbsp;금일 총 소비액은 어제에 비해 <br>약&nbsp;&nbsp;<span style="color:red"><fmt:formatNumber value="${spentMoneyMap[0].SPENT_MONEY_RATIO*100-100}" pattern="#.##"/></span>% 증가했습니다.<div class="wrap"><img src="images/icon/increase.png" style="width:40px;" class="chatbox"></div></div>				
			 		</c:if>
			 	</div>
			    <div class="col-sm-1"></div>
			 	<div class="col-sm-3 dashBoardOnePoint" style="position:relative;">
			 		<div style="position:absolute; top:-30px; left:-10px;">
			 			<img src ="images/icon/networking.png" style="width:80px;"> 
			 		</div>
			 		<div class="mt-3" style="font-size:28px;">분류 군집 수</div>
			 		<div style="font-size:32px; font-family:hanaFont; margin-top:30px">${clusterSum}</div>
			 		<button class="checkCluster" onclick="detailCluster(1)" style="margin-top:30px !important"><span>군집 확인하기</span></button>
			 		<div style="font-family:pretendard; font-size:15px; margin-top:10px;">※ 소비 성향대로 분류된 결과입니다.</div>
			 	</div>
			</div>
		</div>
		<div class="d-flex justify-content-end mt-4" id="exactTimeNotice" style="margin-right:300px; font-size:20px; font-family:pretendard; color:black;"></div>
		
		<div class="d-flex justify-content-center" style="margin-top:100px;  display:flex; justify-content:center; align-items:center; font-family:pretendard; font-size:30px; color:black;"><img src="gif/paper.gif" style="width:100px;">&nbsp;소비 그래프 한눈에 확인하기</div>
		<div class="container text-center mt-2 mb-5" style="margin-top:80px !important;">	
			<div class="row" style="width:100%;">		
			 	<div class="col-sm-1"></div>
			 	<div class="col-sm-5">	
			 		<div id="container1" style="height:600px; width:100%;"></div>	
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-5">
					<div class="d-flex justify-content-end mb-2" style="font-family: pretendard; color:black; font-size:16px;">※ 그래프를 클릭하시면 크게 보실 수 있습니다</div>
					<div id="container2" style="height:500px; width:100%;"></div>
				</div>
			</div>
		</div>
		
		<div class="container text-center mt-3 mb-5" style="margin-top:80px !important">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-11">
					<div class="d-flex justify-content-center mb-5" id="top10CardTitle" style="font-size:40px; font-family:pretendard; color:black;" data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine"></div>
					<div data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine" class="d-flex justify-content-end mb-2" style="font-family:pretendard; font-size:18px; color:black;">※ 금년 현재 시점을 기준으로 작년과 비교한 수치입니다.&nbsp;&nbsp;(<img src="images/icon/triangle.png" style="width:25px;"> : 감소,<img src="images/icon/triangle2.png" style="width:30px;"> : 증가)</div>
					<div data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine">
						<table class="table table-hover" id="top10CardTable">
							<thead class="table-light">
								<tr>
									<th scope="col" style="width:20%;">카드 순위</th>
									<th scope="col" style="width:20%;">카드명</th>
									<th scope="col" style="width:40%;">카드 이미지</th>
									<th scope="col" style="width:10%;">이번 년도 가입자 수</th>
									<th scope="col" style="width:15%;">작년 대비 가입자 수</th>
								</tr>
							</thead>	
							<tbody>								
								<c:forEach items="${thisYearCardList}" var="card" varStatus="loop">
									<tr>
										<td><img src="images/card/medal/medal_${loop.count}.png" style="width:80px;"></td>
										<td>${card.CARD_NAME}</td>
										<td><img src="${card.IMG_URL}" style="width:40%;" class="top10CardImg"></td>
										<td>${card.OWNER_OF_CARD}</td>
										<c:if test="${cardRatio[loop.count-1]*100 lt 100}">
											<td style="color:blue; font-family:pretendard; font-size:20px;"><fmt:formatNumber value="${100-cardRatio[loop.count-1]*100}" pattern="#.##"/>&nbsp%&nbsp<img src="images/icon/triangle.png" style="width:20px;"></td>
										</c:if>
										<c:if test="${cardRatio[loop.count-1]*100 gt 100}">
											<td style="color:red; font-family:pretendard; font-size:20px;"><fmt:formatNumber value="${cardRatio[loop.count-1]*100-100}" pattern="#.##"/>&nbsp%&nbsp<img src="images/icon/triangle2.png" style="width:20px;"></td>
										</c:if>
										<c:if test="${cardRatio[loop.count-1]*100 eq 100}">
											<td style="color:grey; font-family:pretendard; font-size:20px;"><fmt:formatNumber value="${cardRatio[loop.count-1]*100-100}" pattern="#.##"/>&nbsp%&nbsp<img src="images/icon/stick3.png" style="width:20px; height:30px;"></td>
										</c:if>											
									</tr>
								</c:forEach>		
							</tbody>	
						</table>
					</div>
				</div>
			</div>	
		</div>
		<button id="dashBoardModalButton"></button>

		<div class="dashBoardModal" style="color:black !important">
  			<div class="dashBoardModal_content" title="클릭하면 창이 닫힙니다.">
  				<div class="d-flex justify-content-center" id="closeModalInClusterDashBoard"><img src="images/hana/logo.png" style="width:300px;"></div>
  				 <div style="margin-left:900px; font-family:pretendard; color:black;">※ 원하시는 군집을 선택해주세요.</div>
  				<div class="d-flex justify-content-end mt-2 mb-2" style="width:16%; margin-left:1000px;  font-family:pretendard;">
  					<select class="form-select" aria-label="Default select example" style="color:black; font-size:18px;" onchange="displayClusterCharater(this.value)">
  							<c:forEach var="cnt" begin="1" end="${clusterSum}" step="1">
								<option value="${cnt}">${cnt}번 군집</option>
							</c:forEach>
  					</select>
  				</div>
  				<div class="modalDashBoardContent">
  				
  				</div>
  			</div>
		</div>
		
		<button id="dashBoardWelcomeButton"></button>

		<div class="dashBoardWelcomeModal" style="color:black !important">
  			<div class="dashBoardWelcomeModal_content" title="클릭하면 창이 닫힙니다.">
  				<div><img src="images/hana/logo.png" style="width:40%;"></div>
  				<div class="mt-5" style="font-size:25px; font-family:pretendard; line-height:30px;">
  				<div><img src="gif/handshake.gif" style="width:40%;"></div>
  				 	관리자님의 든든한 길잡이가<br>
  				 	되는 하나 FINDER 대시 보드입니다.<br><br>
  				 	환영합니다!
  				</div>
  			</div>
		</div>
		
		
	<jsp:include page="/WEB-INF/jsp/include/scriptFile.jsp"></jsp:include>
	
	<script src="https://kit.fontawesome.com/40af199107.js" crossorigin="anonymous"></script>
	
	<!--하이 차트-->	
	
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<script>
		Highcharts.setOptions({
			lang:{
				thousandsSep:','
			}			
		})
	</script>
	<script>
	
		var customerThisYear = ${increaseRatio[0].EVERY_CUSTOMER};
		
		var todayTransactionAmount = ${spentMoneyMap[0].TODAY_SPENT_MONEY};
	
	    var cnt1 = ${spentMoneyMap[0].YESTERDAY_SPENT_MONEY};

    	var cnt0 = ${increaseRatio[0].LAST_YEAR_CUSTOMER};

		function counterFn() {
		
		 	id0 = setInterval(count0Fn, 50);

		 	function count0Fn() {
		    	 cnt0+=300;
		     	if (cnt0 > ${increaseRatio[0].EVERY_CUSTOMER}) {
		        	clearInterval(id0);
		        	$("#amountOfCustomer").text(customerThisYear.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+' 명 입니다.');
		     	} else {
		        	$("#amountOfCustomer").text(cnt0.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+' 명 입니다.');
		     	}
		  	} 	
		}
		function counter1Fn() {
			
		 	id1 = setInterval(count1Fn,50);

		 	function count1Fn() {
		    	cnt1+=10000000;
		     	if (cnt1 > ${spentMoneyMap[0].TODAY_SPENT_MONEY}) {
		        	clearInterval(id1);
		        	$("#transactionAmountToday").text(todayTransactionAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+' 원 입니다');
		     	} else {
		        	$("#transactionAmountToday").text(cnt1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+' 원 입니다');
		     	}
		  	} 	
		}
		function counter2Fn(){
		 	id2 = setInterval(count2Fn,50);

		 	function count2Fn() {
		    	cnt1-=10000000;
		     	if (cnt1 < ${spentMoneyMap[0].TODAY_SPENT_MONEY}) {
		        	clearInterval(id2);
		        	$("#transactionAmountToday").text(todayTransactionAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+' 원 입니다');				    
		     	} else {
		        	$("#transactionAmountToday").text(cnt1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+' 원 입니다');
		     	}
		  	} 	
			
		}

		
	</script>

	
	<script>
		document.addEventListener("DOMContentLoaded",()=>{
			window.scrollTo({ left: 0, top: 50, behavior: "smooth" }); 
			$("#dashBoardWelcomeButton").click();
			const now = new Date().toLocaleString();
			let year = now.substring(0,4);
			$("#top10CardTitle").append('<div><img src="gif/credit-card2.gif" style="width:120px;">&nbsp&nbsp'+year+'년도 TOP 10 카드</div>');
			
			$('#exactTimeNotice').append('※ '+now+'를 기준으로 계산한 수치입니다.');
			
			let dateArray = [];
			let tranAmount = [];
			let tranObject = {};
			tranObject.name="하루 거래량"
			tranObject.data=[];
		
			
			fetch("showCustomerTransaction")
			.then(res=>res.json())
			.then(res=>{
				let transactionList = res;
				for(let i=0;i<transactionList.length;i++){
					dateArray.push(transactionList[i].TRAN_DATE);
					tranObject.data.push(transactionList[i].AMOUNT_OF_BUSI);
				}
				tranAmount.push(tranObject);
				return new Promise((resolve,reject)=>{
					resolve("성공");
				})
			})
			.then(res=>{
				console.log("뭘까?:"+dateArray);
				Highcharts.chart('container1', {
			    	chart: {
			        	type: 'line',
			        	style:{
			            	fontFamily: 'pretendard',
			            	fontSize:'1.2em'
			        	}
			    	},
			    	title: {
			       		text: '지난 일주일 회원 카드 총 사용 금액',
			    	},
			    	subtitle: {
			        	text:''
			    	},
			    	xAxis: {
			        	categories: dateArray,
		        		labels: {
		            		rotation: -45,
		            		style: {
		                		fontSize: '14px',
		                		fontFamily: 'pretendard'
		            		}
		        		}
			    	},
			    	yAxis: {
			        	title: {
			            	text: '하루 거래량(원)'
			        	}
			    	},
			    	plotOptions: {
			        	line: {
			            	dataLabels: {
			                	enabled: true
			            	},
			            	enableMouseTracking: false
			        	}
			    	},
			    	series: tranAmount 
				});			
			})
			let last4MonthArray = [];
			
			
			
			fetch("showCustomerTransactionLast4Month")
			.then(res=>res.json())
			.then(res=>{			
				let transactionList = res;
				for(let i=0;i<transactionList.length;i++){
					let dataArray = [];
					dataArray.push(transactionList[i].TRAN_MONTH)
					dataArray.push(transactionList[i].AMOUNT_OF_BUSI);
					last4MonthArray.push(dataArray);
				}
				return new Promise((resolve,reject)=>{
					resolve("성공");
				})
			})
			.then(res=>{
				Highcharts.chart('container2', {
		    		chart: {
		        		type: 'column',
		        		style:{
		            		fontFamily: 'pretendard',
		            		fontColor:'black'
		        		}
		    		},
		    		title: {
		        		text: '최근 4개월 간 카드 소비 금액 추이',
		        		style:{
		        			fontSize:'24px'
		        		}
		    		},
		   			subtitle: {
		        		text: ''
		    		},
		    		xAxis: {
		        		type: 'category',
		        		labels: {
		            		rotation: -45,
		            		style: {
		                		fontSize: '15px',
		                		fontFamily: 'pretendard',
		                		fontColor:'black'
		            		}
		        		}
		    		},
		    		yAxis: {
		        		min: 0,
		        		title: {
		            		text: '4개월간 카드 소비 금액'
		        		}
		    		},
		    		legend: {
		        		enabled: false
		    		},
		    		tooltip: {
		        		pointFormat: '<b>{point.y:,.0f} 원</b>'
		    		},
		    		series: [{
		        		name: 'Population',
		        		data: last4MonthArray,
		        		dataLabels: {
		            		enabled: true,
		            		rotation: -90,
		            		color: '#FFFFFF',
		            		align: 'right',
		            		format: '{point.y:,.0f} 원', // one decimal
		            		y: 10, // 10 pixels down from the top
		            		style: {
		                		fontSize: '13px',
		                		fontFamily: 'pretendard'
		            		}
		        		}
		   			}]
				});
			})
		});
	</script>
	
	<script>
		function w3_open() {
		  document.getElementById("mySidebar").style.display = "block";
		}

		function w3_close() {
		  document.getElementById("mySidebar").style.display = "none";
		}
		function detailCluster(input){
	    	window.scrollTo({ left: 0, top:250,behavior: 'smooth'}); 
			$("#dashBoardModalButton").click();
			
		}
		
	</script>
	
	<script>
		$(function(){ 
			$("#dashBoardModalButton").click(function(){
		    	$(".dashBoardModal").fadeIn();
		    	$('.modalDashBoardContent').empty();
		    	let str = '';
		    	str += '<div class="d-flex justify-content-center mt-5" style="font-family:pretendard; font-size:30px; display:flex; justify-content:center; align-items:center;" data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine"><img src="gif/paper.gif" style="width:80px;">&nbsp;&nbsp;군집 대시보드</div>';
		    	str +='<div class="d-flex justify-content-center mt-5" style="font-family:pretendard; color:black !important;"><div class="container text-center">'
		    	str +='<div class="row mb-5">'
		    	str +='<div class="col-sm-5" id="clusterConsumeGraph" style="font-size:18px; background-color:white; box-shadow: 1px 1px 3px 1px #dadce0 inset; border-radius:5px 5px 5px 5px; "><figure class="highcharts-figure"><div id="clusterCategoryAmountGraph2" style="display:none;"></div></figure></div>'
		    	str +='<div class="col-sm-1"></div>'
		    	str +='<div class="col-sm-6 d-flex flex-column mb-3" id="clusterDescriptionAboutConsume" style="font-size:18px; background-color:white; box-shadow: 1px 1px 3px 1px #dadce0 inset; border-radius:5px 5px 5px 5px; display:none !important; height:430px;"></div>'
		    	str +='</div>'
		    	str +='<div class="row">'
			    str +='<div class="col-sm-5" id="clusterTop3CardMoreDetail" style="font-size:18px; background-color:white; box-shadow: 1px 1px 3px 1px #dadce0 inset; border-radius:5px 5px 5px 5px;"></div>'
				str +='<div class="col-sm-1"></div>'
				str +='<div class="col-sm-6" style="font-size:18px; background-color:white; box-shadow: 1px 1px 3px 1px #dadce0 inset; border-radius:5px 5px 5px 5px;"><figure class="highcharts-figure"><div id="clusterGraph1" style="height:420px;"></div></figure></div>'
				str +='</div>'
				str +='</div></div>'
		    	
		    	$('.modalDashBoardContent').append(str);
				
				let clusterAmountCateArray = [];
				
				let clusterAmountObjectBiggerArray = [];
				
				let clusterAmountObject = {};
				
				clusterAmountObject.name = '군집별 금액별 소비 카테고리';
				clusterAmountObject.pointPlacement = 'on';
				clusterAmountObject.data = [];
				clusterAmountObjectBiggerArray.push(clusterAmountObject);
				let ageArray = [];
				ageArray.push('20 대');
				ageArray.push('30 대');
				ageArray.push('40 대');
				ageArray.push('50 대');
				ageArray.push('60 대 이상');
				
				let selectedClusteredCount = 0;
				
				let ageRateArray = [];
				
				let ageRateObject_M = {};
				ageRateObject_M.name = '남성';
				ageRateObject_M.data = [];
				
				let ageRateObject_F = {};
				ageRateObject_F.name= '여성';
				ageRateObject_F.data = [];
				
				
				let clusterCustomerAmountOfBusi = 0;
				
				ageObject_20_M = [];
				
				ageObject_20_F = [];
				
				ageObject_30_M = [];
				
				ageObject_30_F = [];
				
				ageObject_40_M = [];
				
				ageObject_40_F = [];
				
				ageObject_50_M = [];
				
				ageObject_50_F = [];
				
				ageObject_60_M = [];
				
				ageObject_60_F = [];
				
				
				ageAvg = 0;
							
				fetch("displayClusteredCharacter?clusterNum=1")
				.then(res=>res.json())
				.then(res=>{
				 	let clusteredList = res;
				 	selectedClusteredCount = clusteredList.length;
				 	for(let i=0;i<clusteredList.length;i++){
				 		ageAvg += clusteredList[i].AGE;
				 		if(clusteredList[i].AGE >= 20 & clusteredList[i].AGE < 30 & clusteredList[i].GENDER =='M'){
				 			ageObject_20_M.push(1);			 			
				 		}else if(clusteredList[i].AGE >= 20 & clusteredList[i].AGE < 30 & clusteredList[i].GENDER =='F'){
				 			ageObject_20_F.push(1);	
				 		}else if(clusteredList[i].AGE >= 30 & clusteredList[i].AGE < 40 & clusteredList[i].GENDER =='M'){
				 			ageObject_30_M.push(1);	
				 		}else if(clusteredList[i].AGE >= 30 & clusteredList[i].AGE < 40 & clusteredList[i].GENDER =='F'){
				 			ageObject_30_F.push(1);	
				 		}else if(clusteredList[i].AGE >= 40 & clusteredList[i].AGE < 50 & clusteredList[i].GENDER =='M'){
				 			ageObject_40_M.push(1);	
				 		}else if(clusteredList[i].AGE >= 40 & clusteredList[i].AGE < 50 & clusteredList[i].GENDER =='F'){
				 			ageObject_40_F.push(1);	
				 		}else if(clusteredList[i].AGE >= 50 & clusteredList[i].AGE < 60 & clusteredList[i].GENDER =='M'){
				 			ageObject_50_M.push(1);	
				 		}else if(clusteredList[i].AGE >= 50 & clusteredList[i].AGE < 60 & clusteredList[i].GENDER =='F'){
				 			ageObject_50_F.push(1);	
				 		}else if(clusteredList[i].AGE >= 60 & clusteredList[i].GENDER =='M'){
				 			ageObject_60_M.push(1);	
				 		}else{
				 			ageObject_60_F.push(1);	
				 		}		 		
				 	}
				 	let str = '';
				 	str +='<div class="d-flex justify-content-center mt-3" style="font-size:27px;">1번 군집 REPORT</div>'
				 	str +='<hr style="width:100%; height:3px;">'
					str +='<div class="d-flex justify-content-start mt-2" style="font-size:22px;"> 군집에 포함된 회원 수 : '+selectedClusteredCount+'명</div>';
					str +='<div class="d-flex justify-content-start mt-2" style="font-size:22px;"> 군집 평균 연령 : '+ Math.ceil((ageAvg/selectedClusteredCount)*100)/100  +'세</div>';
					$('#clusterDescriptionAboutConsume').append(str);
				 	
				 	return new Promise((resolve,reject)=>{
				 		resolve('성공');
				 	})
				}).then(res=>{
					ageRateObject_M.data.push(-ageObject_20_M.length/selectedClusteredCount);
					ageRateObject_M.data.push(-ageObject_30_M.length/selectedClusteredCount);
					ageRateObject_M.data.push(-ageObject_40_M.length/selectedClusteredCount);
					ageRateObject_M.data.push(-ageObject_50_M.length/selectedClusteredCount);
					ageRateObject_M.data.push(-ageObject_60_M.length/selectedClusteredCount);
				
					ageRateObject_F.data.push(ageObject_20_F.length/selectedClusteredCount);
					ageRateObject_F.data.push(ageObject_30_F.length/selectedClusteredCount);
					ageRateObject_F.data.push(ageObject_40_F.length/selectedClusteredCount);
					ageRateObject_F.data.push(ageObject_50_F.length/selectedClusteredCount);
					ageRateObject_F.data.push(ageObject_60_F.length/selectedClusteredCount);

					ageRateArray.push(ageRateObject_M);
					ageRateArray.push(ageRateObject_F);
					
					$('#clusterTop3CardMoreDetail').append('<div class="mt-3" style="font-size:22px;">1번 군집 TOP3 카드</div>')
					return new Promise((resolve,reject)=>{
						resolve('성공');
					})
				}).then(res=>{										
					fetch("displaytop3CardList?clusterNum=1")
					.then(res=>res.json())
					.then(res=>{
							top3CardList = res;
							let str = '';
							let cardOwnerSum = 0;
							for(let i=0;i<top3CardList.length;i++){
								cardOwnerSum += top3CardList[i].CARD_OWNER;
							}
							for(let i=0;i<3;i++){
								let cardImg = top3CardList[i].IMG_URL;
								let cardName = top3CardList[i].CARD_NAME;
								let cardSort = top3CardList[i].SORT_CARD;
								let cardOwner = top3CardList[i].CARD_OWNER;
								str += '<div class="container text-center mt-5 mb-3">'
								str += '<div class="row">'
								str += '<div class="col-sm-5"><div class="mb-2" style="font-size:17px;">'+cardName+'</div>'+'<img src="'+cardImg+'" style="width:120px;" class="clusteredSelectedCardImageInModal"></div>'
								str += '<div class="col-sm-1"></div>'
								str += '<div class="col-sm-6 mt-3">'
								str += '<div class="d-flex justify-content-start mb-2" style="font-size:19px;"> 카드 점유율 : <span style="color:red;">'+(Math.ceil((cardOwner/cardOwnerSum)*1000)/1000*100).toFixed(2) +'</span> % </div>';
								str += '<div class="d-flex justify-content-start mb-2" style="font-size:19px;"> 카드 종류 : '+cardSort+'</div>';
								str += '</div>'
								str += '</div></div>'
							}
							$('#clusterTop3CardMoreDetail').append(str);
									
						})
				
					return new Promise((resolve,reject)=>{
						resolve("성공");
					})		
		  		}).then(res=>{						
						fetch("displayCategoryAmount?clusterNum=1")
						.then(res=>res.json())
						.then(res=>{
							let amountCateList = res;
							for(let i=0;i<amountCateList.length;i++){						
								clusterAmountCateArray.push(amountCateList[i].SMALL_CATE);
								clusterAmountObject.data.push(amountCateList[i].AMOUNT_OF_BUSI);
							}
							$('#clusterCategoryAmountGraph2').fadeIn(2000);
			    			Highcharts.chart('clusterCategoryAmountGraph2', {
			    			    chart: {
			    			        polar: true,
			    			        type: 'line',
		                        	style: {
						            	fontFamily:'pretendard',
						           	 	fontSize: '1.2em'	
						        	}
			    			    },
			    			    title: {
			    			        text: '금액별 소비 카테고리 REPORT',
			    			        x: -80,
		                        	style: {
						            	fontFamily:'pretendard',
						           	 	fontSize: '0.8em'	
						        	}
			    			    },
			    			    pane: {
			    			        size: '80%'
			    			    },

			    			    xAxis: {
			    			        categories:clusterAmountCateArray,
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
			    			    series: clusterAmountObjectBiggerArray,
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
						return new Promise((resolve,reject)=>{
							resolve("성공");
						})
						
					}).then(res=>{
						fetch("displayCategoryCount?clusterNum=1")
						.then(res=>res.json())
						.then(res=>{
							 let categoryCountList = res;
							 let str = '';
							 str +='<div class="mb-3 mt-3" style="font-size:24px; display:flex; justify-content:center; align-items:center;"><img src="gif/inbox.gif" style="width:60px;"> 주요 소비처</div>'
							 str +='<div class=" mb-3" style="box-shadow: 1px 1px 3px 1px #dadce0 inset;">'
							 for(let i=0;i<categoryCountList.length;i++){
								str +='<div class="mt-1 mb-1">['+categoryCountList[i].SMALL_CATE + ']</div>';
							 }
							 str+= '</div>'
							 fetch("displayAverageAmount?clusterNum=1")
							 .then(res=>res.json())
							 .then(res=>{
									clusterCustomerAmountOfBusi = res;
									return new Promise((resolve,reject)=>{
										resolve('성공');
									})
									
							 }).then(res=>{
							 	str += '<div style="font-size:25px;">한 달 평균 사용금액 : 약 <span style="color:red;"> ' + clusterCustomerAmountOfBusi.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') +' </span> 원</div>';			    								 
							 	console.log('clusterCustomerAmountOfBusi : '+clusterCustomerAmountOfBusi);
							 	$('#clusterDescriptionAboutConsume').append(str);
							 })
						})						
						return new Promise((resolve,reject)=>{
							resolve("성공");
						})					
					}).then(res=>{
							var categories = ageArray;
			    			Highcharts.chart('clusterGraph1', {
			    	    		chart: {
			    	        		type: 'bar',
		                        	style: {
						            	fontFamily:'pretendard',
						           	 	fontSize: '1.2em'	
						        	}
			    	    		},
			    	    		title: {
			    	        		text: '1번 군집의 인구 분포',
		                        	style: {
						            	fontFamily:'pretendard',
						           	 	fontSize: '1.0em'	
						        	}
			    	    		},
			    	    		subtitle: {
			    	        		text: ''
			    	    		},
			    	    		accessibility: {
			    	        		point: {
			    	           			valueDescriptionFormat: '{index}. Age {xDescription}, {value}%.'
			    	        		}
			    	    		},
			    	    		xAxis: [{
			    	        		categories: categories,
			    	        		reversed: false,
			    	        		labels: {
			    	            		step: 1
			    	        		},
			    	        		accessibility: {
			    	            		description: 'Age (male)'
			    	        		}
			    	    		}, { // mirror axis on right side
			    	       	 		opposite: true,
			    	        		reversed: false,
			    	        		categories: categories,
			    	        		linkedTo: 0,
			    	        		labels: {
			    	            		step: 1
			    	        		},
			    	        		accessibility: {
			    	            		description: 'Age (female)'
			    	        		}
			    	    		}],
			    	    		yAxis: {
			    	        		title: {
			    	            		text: null
			    	        		},
			    	        		labels: {
			    	            		formatter: function () {
			    	                		return Math.abs(this.value)*100 + '%';
			    	            		}
			    	        		},
			    	        		accessibility: {
			    	            		description: 'Percentage population',
			    	            		rangeDescription: 'Range: 0 to 5%'
			    	        		}
			    	    		},

			    	    		plotOptions: {
			    	        		series: {
			    	            		stacking: 'normal'
			    	        		}
			    	    		},

			    	    		tooltip: {
			    	        		formatter: function () {
			    	            		return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
			    	                		'Population: ' + Highcharts.numberFormat(Math.abs(this.point.y), 1) + '%';
			    	        		}
			    	    		},

			    	    		series: ageRateArray
			    			});
			    			$('#clusterDescriptionAboutConsume').fadeIn(4000);
		
						    			
					})	
			})
		  
		  	$("#closeModalInClusterDashBoard").click(function(){
		  		$('#mySidebar').fadeIn();
		    	$(".dashBoardModal").fadeOut();
		  	});

		    $("#dashBoardWelcomeButton").click(function(){
		      $(".dashBoardWelcomeModal").fadeIn();
		    });
		    
		    $(".dashBoardWelcomeModal_content").click(function(){
		     	$(".dashBoardWelcomeModal").fadeOut();
			  	counterFn();
				
				if(${spentMoneyMap[0].YESTERDAY_SPENT_MONEY}<${spentMoneyMap[0].TODAY_SPENT_MONEY}){
					counter1Fn();
				}else{
					counter2Fn();
				}
		    });

		});
	</script>
	<!-- 여기서 군집의 특성을 나타내도록 하자 -->
	<script>
		function displayClusterCharater(input){
	    	$('.modalDashBoardContent').empty();
	    	let str = '';
	    	str += '<div class="d-flex justify-content-center mt-5" style="font-family:pretendard; font-size:30px; display:flex; justify-content:center; align-items:center;" data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine"><img src="gif/paper.gif" style="width:80px;">&nbsp;&nbsp;군집 대시보드</div>';
	    	str +='<div class="d-flex justify-content-center mt-5" style="font-family:pretendard; color:black !important;"><div class="container text-center">'
	    	str +='<div class="row mb-5">'
	    	str +='<div class="col-sm-5" id="clusterConsumeGraph" style="font-size:18px; background-color:white; box-shadow: 1px 1px 3px 1px #dadce0 inset; border-radius:5px 5px 5px 5px; "><figure class="highcharts-figure"><div id="clusterCategoryAmountGraph2" style="display:none;"></div></figure></div>'
	    	str +='<div class="col-sm-1"></div>'
	    	str +='<div class="col-sm-6 d-flex flex-column mb-3" id="clusterDescriptionAboutConsume" style="font-size:18px; background-color:white; box-shadow: 1px 1px 3px 1px #dadce0 inset; border-radius:5px 5px 5px 5px; display:none !important; height:430px;"></div>'
	    	str +='</div>'
	    	str +='<div class="row">'
		    str +='<div class="col-sm-5" id="clusterTop3CardMoreDetail" style="font-size:18px; background-color:white; box-shadow: 1px 1px 3px 1px #dadce0 inset; border-radius:5px 5px 5px 5px;"></div>'
			str +='<div class="col-sm-1"></div>'
			str +='<div class="col-sm-6" style="font-size:18px; background-color:white; box-shadow: 1px 1px 3px 1px #dadce0 inset; border-radius:5px 5px 5px 5px;"><figure class="highcharts-figure"><div id="clusterGraph1" style="height:420px;"></div></figure></div>'
			str +='</div>'
			str +='</div></div>'
	    	
	    	$('.modalDashBoardContent').append(str);
			
			let clusterAmountCateArray = [];
			
			let clusterAmountObjectBiggerArray = [];
			
			let clusterAmountObject = {};
			
			clusterAmountObject.name = '군집별 금액별 소비 카테고리';
			clusterAmountObject.pointPlacement = 'on';
			clusterAmountObject.data = [];
			clusterAmountObjectBiggerArray.push(clusterAmountObject);
			let ageArray = [];
			ageArray.push('20 대');
			ageArray.push('30 대');
			ageArray.push('40 대');
			ageArray.push('50 대');
			ageArray.push('60 대 이상');
			
			let selectedClusteredCount = 0;
			
			let ageRateArray = [];
			
			let ageRateObject_M = {};
			ageRateObject_M.name = '남성';
			ageRateObject_M.data = [];
			
			let ageRateObject_F = {};
			ageRateObject_F.name= '여성';
			ageRateObject_F.data = [];
			
			
			let clusterCustomerAmountOfBusi = 0;
			
			ageObject_20_M = [];
			
			ageObject_20_F = [];
			
			ageObject_30_M = [];
			
			ageObject_30_F = [];
			
			ageObject_40_M = [];
			
			ageObject_40_F = [];
			
			ageObject_50_M = [];
			
			ageObject_50_F = [];
			
			ageObject_60_M = [];
			
			ageObject_60_F = [];
			
			
			ageAvg = 0;
						
			fetch("displayClusteredCharacter?clusterNum="+input)
			.then(res=>res.json())
			.then(res=>{
			 	let clusteredList = res;
			 	selectedClusteredCount = clusteredList.length;
			 	for(let i=0;i<clusteredList.length;i++){
			 		ageAvg += clusteredList[i].AGE;
			 		if(clusteredList[i].AGE >= 20 & clusteredList[i].AGE < 30 & clusteredList[i].GENDER =='M'){
			 			ageObject_20_M.push(1);			 			
			 		}else if(clusteredList[i].AGE >= 20 & clusteredList[i].AGE < 30 & clusteredList[i].GENDER =='F'){
			 			ageObject_20_F.push(1);	
			 		}else if(clusteredList[i].AGE >= 30 & clusteredList[i].AGE < 40 & clusteredList[i].GENDER =='M'){
			 			ageObject_30_M.push(1);	
			 		}else if(clusteredList[i].AGE >= 30 & clusteredList[i].AGE < 40 & clusteredList[i].GENDER =='F'){
			 			ageObject_30_F.push(1);	
			 		}else if(clusteredList[i].AGE >= 40 & clusteredList[i].AGE < 50 & clusteredList[i].GENDER =='M'){
			 			ageObject_40_M.push(1);	
			 		}else if(clusteredList[i].AGE >= 40 & clusteredList[i].AGE < 50 & clusteredList[i].GENDER =='F'){
			 			ageObject_40_F.push(1);	
			 		}else if(clusteredList[i].AGE >= 50 & clusteredList[i].AGE < 60 & clusteredList[i].GENDER =='M'){
			 			ageObject_50_M.push(1);	
			 		}else if(clusteredList[i].AGE >= 50 & clusteredList[i].AGE < 60 & clusteredList[i].GENDER =='F'){
			 			ageObject_50_F.push(1);	
			 		}else if(clusteredList[i].AGE >= 60 & clusteredList[i].GENDER =='M'){
			 			ageObject_60_M.push(1);	
			 		}else{
			 			ageObject_60_F.push(1);	
			 		}		 		
			 	}
			 	let str = '';
			 	str +='<div class="d-flex justify-content-center mt-3" style="font-size:27px;">'+input+'번 군집 REPORT</div>'
			 	str +='<hr style="width:100%; height:3px;">'
				str +='<div class="d-flex justify-content-start mt-2" style="font-size:22px;"> 군집에 포함된 회원 수 : '+selectedClusteredCount+'명</div>';
				str +='<div class="d-flex justify-content-start mt-2" style="font-size:22px;"> 군집 평균 연령 : '+ Math.ceil((ageAvg/selectedClusteredCount)*100)/100 +'세</div>';
				$('#clusterDescriptionAboutConsume').append(str);
			 	
			 	return new Promise((resolve,reject)=>{
			 		resolve('성공');
			 	})
			}).then(res=>{
				ageRateObject_M.data.push(-ageObject_20_M.length/selectedClusteredCount);
				ageRateObject_M.data.push(-ageObject_30_M.length/selectedClusteredCount);
				ageRateObject_M.data.push(-ageObject_40_M.length/selectedClusteredCount);
				ageRateObject_M.data.push(-ageObject_50_M.length/selectedClusteredCount);
				ageRateObject_M.data.push(-ageObject_60_M.length/selectedClusteredCount);
			
				ageRateObject_F.data.push(ageObject_20_F.length/selectedClusteredCount);
				ageRateObject_F.data.push(ageObject_30_F.length/selectedClusteredCount);
				ageRateObject_F.data.push(ageObject_40_F.length/selectedClusteredCount);
				ageRateObject_F.data.push(ageObject_50_F.length/selectedClusteredCount);
				ageRateObject_F.data.push(ageObject_60_F.length/selectedClusteredCount);

				ageRateArray.push(ageRateObject_M);
				ageRateArray.push(ageRateObject_F);
				
				$('#clusterTop3CardMoreDetail').append('<div class="mt-3" style="font-size:22px;">'+input+'번 군집 TOP3 카드</div>')
				return new Promise((resolve,reject)=>{
					resolve('성공');
				})
			}).then(res=>{										
				fetch("displaytop3CardList?clusterNum="+input)
				.then(res=>res.json())
				.then(res=>{
						top3CardList = res;
						let str = '';
						let cardOwnerSum = 0;
						for(let i=0;i<top3CardList.length;i++){
							cardOwnerSum += top3CardList[i].CARD_OWNER;
						}
						for(let i=0;i<3;i++){
							let cardImg = top3CardList[i].IMG_URL;
							let cardName = top3CardList[i].CARD_NAME;
							let cardSort = top3CardList[i].SORT_CARD;
							let cardOwner = top3CardList[i].CARD_OWNER;
							str += '<div class="container text-center mt-5 mb-3">'
							str += '<div class="row">'
							str += '<div class="col-sm-5"><div class="mb-2" style="font-size:17px;">'+cardName+'</div>'+'<img src="'+cardImg+'" style="width:120px;" class="clusteredSelectedCardImageInModal"></div>'
							str += '<div class="col-sm-1"></div>'
							str += '<div class="col-sm-6 mt-3">'
							str += '<div class="d-flex justify-content-start mb-2" style="font-size:19px;"> 카드 점유율 : <span style="color:red">'+(Math.ceil((cardOwner/cardOwnerSum)*1000)/1000*100).toFixed(2) +'</span> % </div>';
							str += '<div class="d-flex justify-content-start mb-2" style="font-size:19px;"> 카드 종류 : '+cardSort+'</div>';
							str += '</div>'
							str += '</div></div>'
						}
						$('#clusterTop3CardMoreDetail').append(str);
								
					})
			
				return new Promise((resolve,reject)=>{
					resolve("성공");
				})		
	  		}).then(res=>{						
					fetch("displayCategoryAmount?clusterNum="+input)
					.then(res=>res.json())
					.then(res=>{
						let amountCateList = res;
						for(let i=0;i<amountCateList.length;i++){						
							clusterAmountCateArray.push(amountCateList[i].SMALL_CATE);
							clusterAmountObject.data.push(amountCateList[i].AMOUNT_OF_BUSI);
						}
						$('#clusterCategoryAmountGraph2').fadeIn(2000);
		    			Highcharts.chart('clusterCategoryAmountGraph2', {
		    			    chart: {
		    			        polar: true,
		    			        type: 'line',
	                        	style: {
					            	fontFamily:'pretendard',
					           	 	fontSize: '1.2em'	
					        	}
		    			    },
		    			    title: {
		    			        text: '금액별 소비 카테고리 REPORT',
		    			        x: -80,
	                        	style: {
					            	fontFamily:'pretendard',
					           	 	fontSize: '0.8em'	
					        	}
		    			    },
		    			    pane: {
		    			        size: '80%'
		    			    },

		    			    xAxis: {
		    			        categories:clusterAmountCateArray,
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
		    			    series: clusterAmountObjectBiggerArray,
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
					return new Promise((resolve,reject)=>{
						resolve("성공");
					})
					
				}).then(res=>{
					fetch("displayCategoryCount?clusterNum="+input)
					.then(res=>res.json())
					.then(res=>{
						 let categoryCountList = res;
						 let str = '';
						 str +='<div class="mb-3 mt-3" style="font-size:24px; display:flex; justify-content:center; align-items:center;"><img src="gif/inbox.gif" style="width:60px;"> 주요 소비처</div>'
						 str +='<div class=" mb-3" style="box-shadow: 1px 1px 3px 1px #dadce0 inset;">'
						 for(let i=0;i<categoryCountList.length;i++){
							str +='<div class="mt-1 mb-1">['+categoryCountList[i].SMALL_CATE + ']</div>';
						 }
						 str+= '</div>'
						 fetch("displayAverageAmount?clusterNum="+input)
						 .then(res=>res.json())
						 .then(res=>{
								clusterCustomerAmountOfBusi = res;
								return new Promise((resolve,reject)=>{
									resolve('성공');
								})
								
						 }).then(res=>{
						 	str += '<div style="font-size:25px;">한 달 평균 사용금액 : 약 <span style="color:red;"> ' + clusterCustomerAmountOfBusi.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') +' </span> 원</div>';			    								 
						 	console.log('clusterCustomerAmountOfBusi : '+clusterCustomerAmountOfBusi);
						 	$('#clusterDescriptionAboutConsume').append(str);
						 })
					})						
					return new Promise((resolve,reject)=>{
						resolve("성공");
					})					
				}).then(res=>{
						var categories = ageArray;
		    			Highcharts.chart('clusterGraph1', {
		    	    		chart: {
		    	        		type: 'bar',
	                        	style: {
					            	fontFamily:'pretendard',
					           	 	fontSize: '1.2em'	
					        	}
		    	    		},
		    	    		title: {
		    	        		text: '군집의 인구 분포',
	                        	style: {
					            	fontFamily:'pretendard',
					           	 	fontSize: '1.0em'	
					        	}
		    	    		},
		    	    		subtitle: {
		    	        		text: ''
		    	    		},
		    	    		accessibility: {
		    	        		point: {
		    	           			valueDescriptionFormat: '{index}. Age {xDescription}, {value}%.'
		    	        		}
		    	    		},
		    	    		xAxis: [{
		    	        		categories: categories,
		    	        		reversed: false,
		    	        		labels: {
		    	            		step: 1
		    	        		},
		    	        		accessibility: {
		    	            		description: 'Age (male)'
		    	        		}
		    	    		}, { // mirror axis on right side
		    	       	 		opposite: true,
		    	        		reversed: false,
		    	        		categories: categories,
		    	        		linkedTo: 0,
		    	        		labels: {
		    	            		step: 1
		    	        		},
		    	        		accessibility: {
		    	            		description: 'Age (female)'
		    	        		}
		    	    		}],
		    	    		yAxis: {
		    	        		title: {
		    	            		text: null
		    	        		},
		    	        		labels: {
		    	            		formatter: function () {
		    	                		return Math.abs(this.value)*100 + '%';
		    	            		}
		    	        		},
		    	        		accessibility: {
		    	            		description: 'Percentage population',
		    	            		rangeDescription: 'Range: 0 to 5%'
		    	        		}
		    	    		},

		    	    		plotOptions: {
		    	        		series: {
		    	            		stacking: 'normal'
		    	        		}
		    	    		},

		    	    		tooltip: {
		    	        		formatter: function () {
		    	            		return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
		    	                		'Population: ' + Highcharts.numberFormat(Math.abs(this.point.y), 1) + '%';
		    	        		}
		    	    		},

		    	    		series: ageRateArray
		    			});
		    			$('#clusterDescriptionAboutConsume').fadeIn(4000);
					    			
				})	
		}
	</script>

	<script>
  	 	AOS.init();
	</script>	
</body>
</html>