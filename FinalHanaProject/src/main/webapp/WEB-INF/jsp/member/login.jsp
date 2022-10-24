<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HANA FINDER</title>


<jsp:include page="/WEB-INF/jsp/include/cssFile.jsp"></jsp:include>



</head>
<body>


	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>


  <section>
		<!-- Button trigger modal -->
	<button type="button" class="btn btn-info" id="trigger" data-bs-toggle="modal" data-bs-target="#exampleModal">
 		 Launch demo modal
	</button>

	<!-- Modal -->
	<div class="modal fade mt-5" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
  	
    		<div class="modal-content py-2">
    		
                   	 <h3 class="modal-title text-center"><img class="p-1" src="images/hana/logo.png" alt="" style="width: 180px;"><div class="px-1"></div></h3>

                   	 <div id="selectUserType" class="d-flex mt-3">
                   	 	<button class="flex-fill text-center" id="user">회원</button>
                   	 	<button class="flex-fill text-center" id="administrator">관리자</button>	 
                   	 </div>

    		
    		
    			 <div class="modal-body">
  					<form:form action="${pageContext.request.contextPath}/login" method="post" modelAttribute="memberVO">
  					<table class="table">
  						<tr>
  						<th>EMAIL</th>
  							<td>
  								<form:input path="emailAddress" class="form-control"/>
  								<form:errors path="emailAddress"></form:errors>
  							</td>
  						</tr>
  						<tr>
  							<th>PASSWORD</th>
  							<td>
  								<form:input path="password" class="form-control" type="password"/>
  								<form:errors path="password"></form:errors>
  							</td>
  						</tr>
  						<tr>
  							<td>
  							
  							</td>
  							<td>
  								<input class="form-control"  type="submit" value="로그인" id="login"/>
  							</td>
  						</tr>	
  					</table>
 				 </form:form>     	   
     			</div>
   			 </div>
  		</div>
	</div> 
 	</section>
 

 

     <!--내 자바스크립트 파일  -->
	<jsp:include page="/WEB-INF/jsp/include/scriptFile.jsp"></jsp:include>
	
	<script> 
 	if('${loginMsg}'){
 		alert('${loginMsg}');
 	}
	</script>


 	<script>


	document.addEventListener("DOMContentLoaded",()=>{
 		document.getElementById("trigger").click();
 		document.getElementById("trigger").style.display = 'none';
		//document.getElementById("click").style.display = 'none';
 	
 	
 		const fail = document.getElementById("fail");
	/*  	
 		fail.addEventListener("click",()=>{
 			document.getElementById("click").click();
 		}); */
 	
 		const userButton = document.getElementById("user");
 		const adminButton = document.getElementById("administrator");
 	
 		console.log(userButton.style);
 		console.log(userButton.style.backgroundColor);
 
		userButton.addEventListener("click",()=>{
			if(userButton.style.backgroundColor ===""){
 				userButton.style.backgroundColor = "#008675";
 				userButton.style.color = "white";
			}else if(userButton.style.backgroundColor === "rgb(0, 134, 117)"){
				userButton.style.backgroundColor = "white";
				userButton.style.color = "black";
			}else{
				userButton.style.backgroundColor = "#008675";
				userButton.style.color = "white";
			}
 		})
 	
 		adminButton.addEventListener("click",()=>{	
			if(adminButton.style.backgroundColor ===""){
				adminButton.style.backgroundColor = "#008675";
				adminButton.style.color = "white";
				console.log(adminButton.style.backgroundColor);
			}else if(adminButton.style.backgroundColor === "rgb(0, 134, 117)"){
				adminButton.style.backgroundColor = "white";
				adminButton.style.color = "black";
			}else{
				adminButton.style.backgroundColor = "#008675";
				adminButton.style.color = "white";
			}
				
		
	
 		})
 
	})

</script> 
	
	
		
  
  
</body>
</html>