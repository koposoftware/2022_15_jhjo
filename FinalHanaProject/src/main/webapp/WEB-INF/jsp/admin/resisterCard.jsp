<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HANA FINDER</title>
<meta charset="utf-8">
<title>DGcom - Web Design Agency HTML Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<jsp:include page="/WEB-INF/jsp/include/cssFile.jsp"></jsp:include>



</head>
<body>


   <jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>


   <button id="modalCardResisterbutton">모달창</button>

   <section>
      <!-- Modal -->
      <div class="modal fade bd-example-modal-lg" id="exampleModal"
         tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="d-flex justify-content-center">
                  <img class="mt-3" src="images/hana/logo.png" alt="" style="width: 200px;">
               </div>
               <hr>
               <div class="text-center">
                  <h3 class="text-center" id="exampleModalLabel">
                     <img class="img-fluid" src="images/icon/card3.png" alt="Image" id="cardResisterImage" style="width:70px;"><span class="adminResisterCard">카드 등록</span>
                  </h3>
               </div>
               <hr>
               <form action="/uploadCard" method="post" enctype="multipart/form-data" name="benefitForm">
                  <div class="modal-body">

                     <div class="d-flex justify-content-start my-3">
                        <h6 class="card mx-5 my-1">카드 종류&nbsp;&nbsp;&nbsp;&nbsp;</h6>
						<select name="sortCard" class="form-control" style="width:300px; font-family:pretendard;">
							<option value="">카드의 종류를 선택해주세요</option>
							<option value="체크 카드">체크 카드</option>
							<option value="신용 카드">신용 카드</option>
							<option value="멀티 카드">멀티 카드</option>
						</select>
                     </div>
                     <div class="d-flex justify-content-start my-3">
                        <h6 class="card mx-5 my-1">카드 이름&nbsp;&nbsp;&nbsp;&nbsp;</h6>
                        <input type="text" name="cardName" size="40"
                           class="form-control" style="width: 300px; font-family:pretendard;" placeholder="LIFE 10">
                     </div>
                     <div class="d-flex justify-content-start my-3">
                        <h6 class="card mx-5 my-1">카드 정보&nbsp;&nbsp;&nbsp;&nbsp;</h6>
                        <input type="text" name="commentOfCard" size="40"
                           class="form-control" style="width: 300px; font-family:pretendard;"
                           placeholder="자취생을 위한 카드">
                     </div>
                     <div class="d-flex justify-content-start my-3">
                        <h6 class="card mx-5 my-1">연회비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6>
                        <input type="number" name="annualFee" size="40"
                           class="form-control" style="width: 300px; font-family:pretendard;" placeholder="연회비">
                     </div>
                     <div class="d-flex justify-content-start my-3">
                        <h6 class="card mx-5 my-1">연회비 타입</h6>
						<select name="annualCode" class="form-control" style="width:300px; font-family:pretendard;">
							<option value="">연회비 타입을 선택해주세요.</option>
							<option value="A00001">VISA</option>
							<option value="A00002">UNION PAY</option>
							<option value="A00003">MASTER</option>
							<option value="A00004">국내 전용</option>
						</select>  
                     </div>
                     <div class="d-flex justify-content-start my-3">
                        <h6 class="card mx-5 my-1">카드 이미지</h6>
                        <input type="file" multiple name="uploadfile" size="40"
                           class="form-control" style="width: 300px; font-family:pretendard;"
                           onchange="readURL(this);"><br>
                     </div>
                     <div class="d-flex justify-content-center">
                        <img id="preview" /><br>
                     </div>

                     <hr>
                     <h3 class="text-center">
                        <img class="img-fluid" src="images/icon/benefits.png" alt="Image" id="discount" style="width:80px;"><span class="adminResisterCard">&nbsp;&nbsp;혜택 추가</span>
                     </h3>
                     <hr>
                     <div class="cardResisterNotice">* 전달 실적이 없는 경우 '없음'으로 입력해주세요.</div>
                     <div class="cardResisterNotice">* 멀티 카드의 경우 각 페이 결제는 1% 적립으로 자동 등록됩니다.</div>
					 <div class="d-flex justify-content-start my-3">
                        <h6 class="card mx-5 my-1">제휴 가맹코드</h6>
                        <select class="form-control" name="beneCode" style="width:200px; background-color:white; font-family:pretendard;">
                        	<c:forEach items="${aliList}" var="ali">
                        		<option value="${ali.BENE_CODE}">${ali.ALI_TYPE}</option>
                        	</c:forEach>                        
                        </select>             
                     </div>					
                     <div class="d-flex justify-content-start my-3">
                        <h6 class="card mx-5 my-1">할인율&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6>
                        <input type="text" name="beneRate" size="40"
                           class="form-control" style="width: 300px; font-family:pretendard;" placeholder="할인율">%
                     </div>
                     <div class="d-flex justify-content-start my-3">
                        <h6 class="card mx-5 my-1">혜택 한도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6>
                        <input type="text" name="beneLimit" size="40"
                           class="form-control" style="width: 300px; font-family:pretendard;" placeholder="혜택 한도">원
                     </div>
                     <div class="d-flex justify-content-start my-3">
                        <h6 class="card mx-5 my-1">한달
                           실적&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6>
                        <input type="text" name="basePerform" size="40"
                           class="form-control" style="width: 300px; font-family:pretendard;" placeholder="한달 실적">원
                     </div>
                     <br>
                     <div class="d-flex justify-content-center">
                        <button type="button" class="btn btn-secondary" id="benefitadd"
                           onclick="addBenefit();">혜택 추가</button>
                     </div>
                  </div>
                  <div>
                     <div id="cardBenefitContainer" class="text-center"></div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="cancleUploadCard">닫기</button>
                     <button type="submit" class="btn btn-primary" id="uploadCard">카드 등록</button>
                  </div>
               </form>
            </div>
         </div>
      </div>

      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
         data-bs-target="#exampleModal" id="trigger">
         <span style="font-size: 10pt">카드 등록</span>
      </button>
            
      <div id="modalResister">
         <div id="modalCardContainer" title="클릭하면 창이 닫힙니다.">
            <div id="cardResisterAlert"></div> 
         <img class="mt-4" src="images/hana/logo.png" alt="" style="width:180px;">
         <div class="mt-1" id="cardModalAlert">
            <img class="img-fluid" src="gif/credit-card.gif"
                        alt="Image" id="cardResisterImage">카드 등록이 완료 되었습니다.<br>
         </div>   

         </div>
      </div>

   </section>

   <footer>
      <jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
   </footer>

     <!--내 자바스크립트 파일  -->
   <jsp:include page="/WEB-INF/jsp/include/scriptFile.jsp"></jsp:include>
   
<script>	
	function addBenefit(){


		let form = document.benefitForm;
			   	   
		let	beneCode = form.beneCode.value;
		let sortCard = form.sortCard.value;   
		let basePerform = form.basePerform.value;
		let beneRate = form.beneRate.value;
		let beneLimit = form.beneLimit.value;
		let beneType = 'S';
		
		fetch("/addCardBenefit?beneCode="+beneCode+"&sortCard="+sortCard+"&basePerform="+basePerform+"&beneRate="+beneRate+"&beneLimit="+beneLimit+"&beneType="+beneType)
		.then(res=>{
			console.log("추가 성공!");
		})
		

			   
		$('#cardBenefitContainer').append('<div class="btn benefitInformation m-3 col-lg-4 col-xs-12" type="button" id="benefitGround_'+beneCode+'">제휴 코드 - ' + beneCode + '<br>할인율 - '+ beneRate  + '%<br>카드 혜택 - '+ beneLimit + ' 원<div><img src="images/icon/x-mark.png" style="width:20px;" id="deleteBeneButton_'+ beneCode + '" onclick="deleteAddedBeneInfo(this.id)"></div></div>');  
		return new Promise((resolve,reject) => {
			      resolve('성공');
		}) 
   		.then((result)=> {
   		   let form = document.benefitForm;
   		   form.beneCode.value="";
   		   form.beneLimit.value="";   
   		   form.discount.value="";
   		   form.basePerform.value="";
   		   form.beneRate.value=""
   		});   
	}
</script>
      
<script>
document.addEventListener("DOMContentLoaded",()=>{
   
    const myModal = document.getElementById('myModal')
    const myInput = document.getElementById('myInput')

    document.getElementById("trigger").click();
    document.getElementById("trigger").style.display = 'none';
    document.getElementById("modalCardResisterbutton").style.display = 'none';
    
    const cardResister = document.getElementById("cardResister");
   	const cancleUploadCard = document.getElementById("cancleUploadCard");
      
   	cancleUploadCard.addEventListener("click",()=>{
	   
       	$('#modalCardResisterbutton').click();     
   	})
   	  
});
</script>
     <!--카드 이미지 뜨게 하기  -->
<script>
function readURL(input) {
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
/*혜택 추가하기 버튼  */
function deleteAddedBeneInfo(input){
	let form = document.benefitForm;
	let beneCode = input.substring(17);

	let sortCard = form.sortCard.value;  
	
	fetch("/deleteCardBenefit?beneCode="+beneCode+'&sortCard='+sortCard)
	.then(res=>{
		console.log("제거 성공");
	})
	 
	$('#benefitGround_'+beneCode).remove();
}
</script>

<script>
$(function(){ 
     $("#modalCardResisterbutton").click(function(){
       $("#modalResister").fadeIn();
     });  
     $("#modalCardContainer").click(function(){
       $("#modalResister").fadeOut();
       window.location = '/cardSection';  
     });
     
});
</script>

</body>
</html>