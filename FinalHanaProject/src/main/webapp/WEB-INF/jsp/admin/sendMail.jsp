<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HANA FINDER</title>

  <jsp:include page="/WEB-INF/jsp/include/cssFile.jsp"></jsp:include>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link href="css/dashBoard/dashBoard.css" rel="stylesheet"> 
  <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>   
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    
   <link rel="stylesheet" type="text/css" href=" https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" />
   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />
   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />





</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>
	<div class="w3-sidebar w3-bar-block w3-collapse w3-card" style="width:320px; height:800px; background-color:#FAFAFA; position:sticky;" id="mySidebar">
  		<button class="w3-bar-item w3-button w3-hide-large" onclick="w3_close()">Close &times;</button>
  		<div class="text-center mt-4 sideBarTitleInDashBoard">&nbsp;&nbsp;<span style="border-radius:8px;">Marketing & Analysis</span></div>
  		<div class="d-flex justify-content-center">
  			<hr style="width:70%; height:3px;">
  		</div>
  		<div class="d-flex justify-content-center">
  				<div class="sidbarContentInDashBoard d-flex justify-content-center mt-2"><span class="sideBarInDashBoard d-flex justify-content-around"><div style="background-color:#E0F7FA; width:24%; border-radius:15px; box-shadow: 1.5px 1.5px 1.5px 1.5px grey; padding:8px 10px;"><a href="/sendMail"><img src="images/icon/email.png" style="width:100%;"></div><span style="width:50%; padding:2px 20px; color:black;">?????? ??????</span></a></span></div>
  		</div>
  		<div class="d-flex justify-content-center">
  				<div class="sidbarContentInDashBoard d-flex justify-content-center mt-4"><span class="sideBarInDashBoard d-flex justify-content-around"><div style="background-color:#E0F7FA; width:24%; border-radius:15px; box-shadow: 1.5px 1.5px 1.5px 1.5px grey; padding:10px 10px;"><a href="/moveDashBoard"><img src="images/icon/data-analysis.png" style="width:100%;"></div><span style="width:50%; padding:2px 20px; color:black;">??????/??????</span></a></span></div>	
		</div>
	</div>
	<div style="min-height: 1200px; background: linear-gradient(168deg,white: 50%,#ECEFF1 70%);">
		<div class="container text-center">	
			<div class="row">
		 	<div class="col-1"></div>
		 	<div class="col-11">
		 		<div style="font-family: hanaFont; margin-top:60px; font-size:40px;"><img src="gif/message.gif" style="width:90px;">&nbsp;&nbsp????????? ????????? ?????????</div>	
				<div class="d-flex justify-content-center"><hr style="width:60%; height:3px;"></div>
				<div class="mt-3" style="font-size:20px; font-family:pretendard;"><img src="gif/credit-card2.gif" style="width:80px;">???????????? ?????? ?????? ????????????</div>
				<div class="d-flex justify-content-center mt-3" style="display:flex; justify-content:center; align-items:center;">
					<div style="font-size:22px; font-family:pretendard; box-shadow: 1px 1px 3px 1px #dadce0 inset; width: 120px; border-radius:6px;">?????? ??????</div>				
					<select class="form-select mx-3" style="width:15%; font-size:18px; font-family:pretendard;" onchange="displayCardNameListForSort(this.value)">
						<option value="?????? ??????">?????? ??????</option>
						<option value="?????? ??????">?????? ??????</option>
						<option value="?????? ??????">?????? ??????</option>					
					</select>
					<select class="form-select" style="width:30%; font-size:18px; font-family:pretendard;" id="cardNameListSelection">
						<c:forEach items="${cardNameList}" var="cardName">
							<option value="${cardName}">${cardName}</option>
						</c:forEach>				
					</select>					
				</div>
				<div>
					<div class="mt-3" style="margin-bottom:10px; width:100%; font-family:pretendard; font-size:20px;">???????????? ?????? ?????? ????????????</div>
					<div class="d-flex justify-content-center">
						<select class="form-select" aria-label="Default select example" style="color:black; font-family:pretendard; font-size:16px; width:30%; height:40px; margin-bottom:20px;" onchange="displayClusterCharater(this.value)">
  								<c:forEach var="cnt" begin="1" end="${clusterSum}" step="1">
									<option value="${cnt}">${cnt}??? ??????</option>
								</c:forEach>
  						</select>
  					</div>
				</div>
						 		<button id="mailSendButtonInModal" style="font-family:pretendard;">?????? ????????????</button>				
			</div>
			</div>
		</div>
		<div class="d-flex justify-content-center" style="width:100%; margin-left:150px;">
		<table id="clusterTableList" style="width:1500px;" class="table">
             <thead class="table-light">
   				<tr>
    				<th scope="col" class="text-center">??????</th>
    				<th scope="col" class="text-center">??????</th>
    				<th scope="col" class="text-center">????????? ??????</th>
     				<th scope="col" class="text-center">????????? ??????</th>
     				<th scope="col" class="text-center">???????????? ??????</th>
     				<th scope="col" class="text-center">?????? ??????</th>    							
    			</tr>							
              </thead>
              <tbody>
              </tbody>		 		
		 </table>
		 </div>
	</div>
	


	<div class="mailSendModal">
  		<div class="mailSendModal_content" title="???????????? ?????? ????????????.">
  			<img src="images/hana/logo.png" style="width:150px; margin-bottom:20px;" id="closeSendMailModal">
  				<div>
  					<button style="background-color:white;" class="buttonDistinctCluster" onclick="displayClusterInEmailModal();">???????????? ?????? ?????????</button>
					<button style="background-color:white;" class="buttonDistinctCluster" onclick="displayCardOwnerInEmailModal();">???????????? ?????? ?????????</button>
				</div>
  				<form action="/sendMail" method="post" style="font-family: pretendard">
					<div id="displaySection" class="mt-3 mb-3 d-flex justify-content-center" style="background-color:white;"></div>
					<div style="width:60%; margin-left:110px;" class="mt-3 mb-3"><input type="text" name="title" placeholder="????????? ???????????????" class="form-control"></div>
					<div style="width:60%; margin-left:110px;" class="mt-3 mb-3"><textarea name="content" placeholder="??????????????? ???????????????" class="form-control"></textarea></div>
					<div>??? ?????? ???????????? ??????????????????</div>
					<div class="d-flex justify-content-center mt-2">
                    	<input type="file" multiple name="uploadfile" size="40" class="form-control" style="width:300px" onchange="readURL(this);" id="uploadFileName">
					</div>
					<div class="d-flex justify-content-center mt-2">
                        <img id="preview"/><br>
                    </div>
                    <div id="hiddenImageName"></div>
                    <div class="mt-3 mb-3"><button type="submit" id="sendEmail" style="font-size:20	px; height:40px; font-family: pretendard;  box-shadow: 1px 1px 3px 1px #dadce0 inset; border-radius:6px;">????????? ??????</button></div>
				</form>
  		</div>	
	</div>

	<footer>
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
	</footer> 
	
	<jsp:include page="/WEB-INF/jsp/include/scriptFile.jsp"></jsp:include>

	<!--????????? ??????????????? -->
	<script src="<c:url value='/js/jquery-3.5.1.min.js'/>" charset="utf-8"></script>	
	<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>


     <!--??? ?????????????????? ??????  -->

	<script>
	$(document).ready(function() {
		$("#clusterTableList").DataTable({
			ajax:{url:"/displayCustomerInfo?clusterNum=1",dataSrc:''},
			columns:[
				{data:"NAME"},
				{data:"GENDER"},
				{data:"PHONE_NUM"},
				{data:"EMAIL_ADDRESS"},
				{data:"CARD_NAME"},
				{data:"DOMESTIC_STATUS"}				
			],
        	language: {
            	url: '/js/user/dataTables.ko.json'
        	},
			pageLength: 50,
			scrollX: true,
			lengthChange:false,
			searching:true,
			autoWidth: false,
			order:[[0,"desc"]],
         	language : {
             	info : "?????? _START_-_END_ / ??? _TOTAL_???",
             	loadingRecords: "?????????...",
             	processing : "????????? ????????? ?????????...",
             	search : "?????? : ",
             	paginate : {
                	"next" : "??????",
                	"previous" : "??????"
             	}
          	},
		});
	});
	</script>
	
	<script>
	$(function(){ 
		  $("#mailSendButtonInModal").click(function(){
		    $(".mailSendModal").fadeIn();
		  });
		  
		  $("#closeSendMailModal").click(function(){
		    $(".mailSendModal").fadeOut();
		  });
		  
	});
	</script>	
	<script>
		function displayClusterCharater(input){			
			console.log("input:"+input);
			$("#clusterTableList").empty();
			$("#clusterTableList").DataTable({
				ajax:{url:"/displayCustomerInfo?clusterNum="+input,dataSrc:''},
				columns:[
					{data:"NAME"},
					{data:"GENDER"},
					{data:"PHONE_NUM"},
					{data:"EMAIL_ADDRESS"},
					{data:"CARD_NAME"},
					{data:"DOMESTIC_STATUS"}				
				],
	        	language: {
	            	url: '/js/user/dataTables.ko.json'
	        	},
				pageLength: 50,
				destroy:true,
				scrollX: true,
				lengthChange:false,
				searching:true,
				autoWidth: false,
				order:[[0,"desc"]],
	         	language : {
	             	info : "?????? _START_-_END_ / ??? _TOTAL_???",
	             	loadingRecords: "?????????...",
	             	processing : "????????? ????????? ?????????...",
	             	search : "?????? : ",
	             	paginate : {
	                	"next" : "??????",
	                	"previous" : "??????"
	             	}
	          	},
			});
		}
		function displayCardNameListForSort(input){
			$('#cardNameListSelection').empty();
			console.log(input);
			fetch("/displayCardNameList?cardSort="+input)
			.then(res=>res.json())
			.then(res=>{
				let cardNameList = res;
				let str = '';
				for(let i=0;i<cardNameList.length;i++){
					str += '<option>'+cardNameList[i]+'</option>';
				}
				$('#cardNameListSelection').append(str);
			})
		}
		function displayClusterInEmailModal(){
			$('#displaySection').empty();
			let clusterSum = ${clusterSum};
			let str = '';
			str +='<select class="form-control" style="width:30%;">'
			for(let i=0;i<clusterSum;i++){
				str +='<option value='+i+'>'+(i+1)+'??? ??????</option>';
			}
			str +='</select>'
			$('#displaySection').append(str);
		}
		function displayCardOwnerInEmailModal(){
			$('#displaySection').empty();
			fetch("/displayCardNameList2")
			.then(res=>res.json())
			.then(res=>{
				let cardNameList = res;
				let str = '';
				str +='<select class="form-control" style="width:50%;">' 
				for(let i=0;i<cardNameList.length;i++){
					str += '<option>'+cardNameList[i]+'</option>';
				}
				str +='<select>'
				$('#displaySection').append(str);
			})			
		}
		function readURL(input) {
			 console.log("uploadFileName: " +$('#uploadFileName').val());
			 let imgFileName = $('#uploadFileName').val().split('\\');
			 console.log(imgFileName[2]);
			 $('#hiddenImageName').append('<input type="hidden" id="hiddenName" name="hiddenCardName" value='+imgFileName[2]+'>')
			 document.getElementById('preview').style.display="block";
		     if (input.files && input.files[0]) {
		       var reader = new FileReader();
		       reader.onload = function(e) {
		         document.getElementById('preview').src = e.target.result;
		       };
		       reader.readAsDataURL(input.files[0]);
		     } else {
		       document.getElementById('preview').src = "";
		     }
		}   
	</script>


</body>
</html>