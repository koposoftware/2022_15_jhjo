<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>     	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HANA FINDER</title>
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
    <div class="container-fluid p-0 wow fadeIn" data-wow-delay="0.1s" id="carouselBackground">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#header-carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1">
                    <img class="img-fluid" src="images/slider/hanaCardSlider5.png" alt="Image">
                </button>
                <button type="button" data-bs-target="#header-carousel" data-bs-slide-to="1" aria-label="Slide 2">
                    <img class="img-fluid" src="images/slider/hanaCardSlider3.png" alt="Image">
                </button>
                <button type="button" data-bs-target="#header-carousel" data-bs-slide-to="2" aria-label="Slide 3">
                    <img class="img-fluid" src="images/slider/hanaCardSlider2.png"" alt="Image">
                </button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-10" src="images/slider/hanaCardSlider2.png" alt="Image">
                    <div class="carousel-caption">
                        <div class="p-3" style="max-width: 900px;">
                           <img class="w-10 pb-3 marketingCard" src="images/hana/hanaMarketing.png" alt="Image" >                       
                            <h1 class="text-white text-uppercase mb-4 animated zoomIn"><p id="notificationBar"></p></h1>
                            <h1 class="display-1 text-white mb-0 animated zoomIn"></h1>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                  <img class="w-10" src="images/slider/hanaCardSlider3.png" alt="Image">
                    <div class="carousel-caption">
                        <div class="p-3" style="max-width: 900px;">   
                           <img class="w-10 pb-3 marketingCard" src="images/hana/hanaMarketing2.jpeg" alt="Image">                          
                            <h4 class="text-white text-uppercase mb-4 animated zoomIn">카드 한장이면 된다</h4>
                            <h4 class="display-5 text-white mb-0 animated zoomIn">원하는 조합대로 사용하세요</h4>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                          <img class="w-10" src="images/slider/hanaCardSlider5.png" alt="Image">
                    <div class="carousel-caption">
                        <div class="p-3" style="max-width: 900px;">
                            <img class="w-10 pb-3 marketingCard" src="images/card/creditCard/credit06.png" alt="Image">
                            <h4 class="text-white text-uppercase mb-4 animated zoomIn">카드 소비를</h4>
                            <h1 class="display-5 text-white mb-0 animated zoomIn">누구보다 알뜰하게!</h1>
                        </div>
                    </div>
                </div>
                
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->
    
    


<section class="portfolio section-sm" id="portfolio">
   <div class="container-fluid">
      <div class="row ">
         <div class="col-lg-12">

            <!-- section title -->
            <div class="text-center pt-5">
               <h2>
                  <span class="m-3"><img src="gif/credit-card.gif" style="width:90px;"></span>   
         		  
         		  <c:if test="${loginVO.userType eq 'ADMIN'}">   		
                  	<button type="button" style="border-radius:5px;" class="btn mb-1" data-bs-toggle="modal" data-bs-target="#exampleModal" id="goResister" onclick="location.href='/resisterCard'">
                      	 <span style="font-size:20px; border-radius:4px; hover:color:black;"><div href="/resisterCard">카드 등록</div></span>
                  	</button>
                  </c:if>
                </h2>
               <p> </p>
               <div class="border"></div>
               <div class="cardFilterBySortType mt-3" style="margin-bottom: 3rem; color:black;">
                  <a style="cursor:pointer; font-size: 20px; onclick="changeCardType(this)">신용카드</a>&nbsp|&nbsp
                  <a style="cursor:pointer; font-size: 20px;" onclick="changeCardType(this)">체크카드</a>&nbsp|&nbsp
                  <a style="cursor:pointer; font-size: 20px;" onclick="changeCardType(this)">멀티카드</a>
                  <!-- <a style="cursor:pointer;">제휴카드</a><br> -->
               </div>
               <!-- 검색어 -->

               <div class="portfolio-filter contact-form ">
                  <div class="row">
                     <div class="col-lg-3 col-md-2 col-sm-2"></div>
                        <div class="d-flex justify-content-center">
                        </div>
                  </div>
               </div>
            </div>
            <!-- /section title -->
            <!-- data-filter로 필터링하고 버튼 클릭된거로 다시 필터링  -->
            <div class="portfolio-filter d-flex justify-content-center mt-5" style="font-family:pretendard; font-size:32px;">
               <button type="button" class="clicked btn m-2 cardCateSortButton" onclick="showAllCard()">모든 카드</button>
               <button type="button" class="btn m-2 cardCateSortButton" onclick="changeCardFilter('의료')">의료</button>
               <button type="button" class="btn m-2 cardCateSortButton" onclick="changeCardFilter('요식/유흥')">요식/유흥</button>
               <button type="button" class="btn m-2 cardCateSortButton" onclick="changeCardFilter('스포츠/문화/레저')">스포츠/문화</button>
               <button type="button" class="btn m-2 cardCateSortButton" onclick="changeCardFilter('교육/학원')">교육/학원</button>
               <button type="button" class="btn m-2 cardCateSortButton" onclick="changeCardFilter('가정생활/서비스')">통신비/보험</button>
               <button type="button" class="btn m-2 cardCateSortButton" onclick="changeCardFilter('여행/교통')">여행/교통</button>  
               <button type="button" class="btn m-2 cardCateSortButton" onclick="changeCardFilter('유통')">마트/편의점</button>                              
            </div>
            <hr>
            
            <div class="row">
               <div class="col-lg-2 col-md-1 col-sm-0"></div>
               <div class="col-lg-8 col-md-10 col-sm-12 row" >
                  <div class="card-sort-filter" >
                     <div class="form-group col-sm-2" style="float:right;">
                             <select name="sortAnnualFeeType" class="form-control" id="sortType" style="text-align:center; font-family:pretendard;">
                           			<option value="0" selected>연회비 타입</option>
                        			<option value="MASTER">MASTER</option>
                           			<option value="VISA">VISA</option>
                           			<option value="DOMESTIC">국내전용</option>
                           			<option value="UNIPAY">UNIPAY</option>
                        </select>
                          </div>
                  </div>
               </div>
               <div class="container text-center">
               	   <div class="d-flex justify-content-center">
                   		 <h1 align="center" class="" id="MyCardTitle"><img class="" src="images/hana/logo.png" alt=""
								style="width:300px;"><span class="mt-2">  </span><h1 class="mt-1">&nbsp카드</h1></h1>
                    </div>
                    <div class="d-flex justify-content-center">
                       <hr align="center" style="border:12px #008675; width: 30%; height:5px" class="">
                    </div>
                  <div class="row" id="cardImageList">
                  
                    
                    
                  </div>
               <div>
            </div>
         </div> <!-- /end col-lg-12 -->
      </div> <!-- end row -->
   </div> <!-- end container -->
</section> <!-- End section -->




</section>
   <button id="modalCardResisterbutton"></button>
   <div id="detailmodalResister">
      <div id="detailCardContainer" title="클릭하면 창이 닫힙니다.">
			

 			
        	<div class="cardDetailDescriptionInModal" style="color:black;"><img class="mt-5 mb-5" src="gif/paper.gif" alt="" style="width:80px;" id="closeModalTriggerInCardSection">&nbsp;카드 상세 정보</div> 
         	
         	<div class="mt-4 mb-3" id="cardModalAlert">
         	
         	</div>
       
      </div>
   </div>






   <footer>
      <jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
   </footer> 

	<button id="addCartNoticeModalButton">모달창</button>

	<div class="addCartNoticeModalInSection">
  		<div class="addCartNoticeModal_contentInSection" title="클릭하면 창이 닫힙니다.">
    	  	<img class="addCartNoticeModalImage" src="gif/shopping.gif" alt="Image">
    	  	<div>
    	  		장바구니에 카드가<br> 등록되었습니다! 
    	  	</div>
    	</div>
	</div>
  	<a href="/recommendCard">
		<img src="gif/shopping-cart.gif" alt="image" class="locateRadius_img_2"
		id="locateMyCardCart">
	</a>




 
 


     <!--내 자바스크립트 파일  -->
   <jsp:include page="/WEB-INF/jsp/include/scriptFile.jsp"></jsp:include>

<script>
$(function(){ 	
     $("#modalCardResisterbutton").click(function(){
       $("#detailmodalResister").fadeIn();
     });  
     $('#closeModalTriggerInCardSection').click(function(){
       $("#detailmodalResister").fadeOut();
     });
     $("#addCartNoticeModalButton").click(function(){
 	    $(".addCartNoticeModalInSection").fadeIn();
   	 });   	  
   	 $(".addCartNoticeModal_contentInSection").click(function(){
 	    $(".addCartNoticeModalInSection").fadeOut();
  	 });  	     
 });

</script>      
  
    


<script>


document.addEventListener("DOMContentLoaded",()=>{

   const myModal = document.getElementById('myModal')
   const myInput = document.getElementById('myInput')


    const cardResister = document.getElementById("cardResister");
   
    document.getElementById("modalCardResisterbutton").style.display = 'none';
 
    

    $("#video_area").fadeIn(10000);
      
    var app = document.getElementById('notificationBar');
    var typewriter = new Typewriter(app,{
          loop: true,
          cursor: "",
    });
      
   typewriter.typeString('카드소비 뭐가 현명하지?')
       .pauseFor(2500)
       .deleteAll()
       .typeString('하나 FINDER에 물어봐!')
       .pauseFor(2500)
       .deleteAll()
       .typeString('소비도 현명하게')   
          .pauseFor(2500)
       .start();
   $('.marketingCard').fadeIn( 'slow' ); 
    
});
</script>


<script>

$(document).ready(function() { 
      $.ajax({          
      type:'post'
         ,url:'/showCardImage'
         ,datatype:'jsonp'
         ,success:callback   
         ,error:function(){
            alert('실패');
         }
      });
 
   
})
   

function callback(result){
	let thisCardCateNum = '';
    let list = result
    let benefit ='';
    $(list).each(function(){
       thisCardCateNum = this.CARD_CATE_NUM;	

       let str = ' ';
       str+='<div class="col-4 mt-5 mb-5 cardImage" data-aos="flip-right">';
       str+='<div class="d-flex justify-content-center">'
       str+='<div class="mb-2" id="cardComment" style="color:black;">'+this.CARD_NAME+'</div>'
       str+='</div>'
       str+='<img src="' +this.IMG_URL+'" class ="mb-1 cardSectionImage" id='+this.CARD_CATE_NUM+' onClick="showThisCardDetail(this.id)">';
       str+='<div id='+this.CARD_CATE_NUM+'_div class="seokyungPick"></div>';
       str+='<div class="cardSimpleInfo mb-2" data-aos="flip-down">';
	  
       str+=this.COMMENT_OF_CARD;
       str+='<br>'
       str+='<div class="d-flex justify-content-center">'
       str+='<div class="cardSortType mt-1">'+this.SORT_CARD+'</div>';
       str+='</div>'
       str+='</div>';
       str+='</div>';
       $('#cardImageList').append(str);

       fetch('/showMyCardBenefit?myCardId='+this.CARD_CATE_NUM)
       .then(res=> res.json())
       .then(res =>{
    	   let benefitList = res;
		   $('#'+this.CARD_CATE_NUM+'_div').append('<div class="mb-3">');
    	   $(benefitList).each(function(){
    		   $('#'+this.CARD_CATE_NUM+'_div').append('<div type="button" class="btn btn-outline-primary mx-1 mb-1 cardSectionCateBtn">#'+this.SMALL_CATE+'</div>');
    	   })
    	   $('#'+this.CARD_CATE_NUM+'_div').append('</div>');
       })
       
       
    })
           
   
    
      
}

</script>



<script>
   function showThisCardDetail(input){
	  window.scrollTo({ left: 0, top: 800, behavior: "smooth" }); 
      $.ajax({          
         type:'post'
            ,url:'/showCardDetailInModal'
            ,data:{
               cardCateNum:input
            }
            ,datatype:'jsonp'
            ,success:showDetailCard   
            ,error:function(){
               alert('실패');
            }
         });      
   }
   
   function showDetailCard(result){
      
      
      let cardDetailList = result;
      let cardNetworkList =''
      fetch('/showCardDetailImg?cardCateNum='+result[0].CARD_CATE_NUM)
      .then(res => res.json())
      .then(res=>{
         console.log(res);
         $('#cardModalAlert').empty();
         let str = ' '
         str += '<div id="commentOfCard" class="mb-5" style="color:#212121; font-family:hanaFont;">['+ result[0].COMMENT_OF_CARD+']</div>'
             
         str += '<div class="container text-center mb-5"><div class="row" style="width:100%;"><div class="col-7">'
         str += '<img class ="" src="' +res[0].IMG_URL+'" id="cardImageInModal">'
         if(result[0].CARD_CATE_NUM.substring(0,2)==='CH'){
            str+='<div class="d-flex justify-content-center"><div class="cardDetailTypeCardSectionInModal mt-3">체크 카드</div></div>'
         }else if(result[0].CARD_CATE_NUM.substring(0,2)==='CR'){
            str+='<div class="d-flex justify-content-center"><div class="cardDetailTypeCardSectionInModal mt-3">신용 카드</div></div>'
         }else{
            str+='<div class="d-flex justify-content-center"><div class="cardDetailTypeCardSectionInModal mt-3">멀티 카드</div></div>'
         } 
         str +='</div>'   
         
         str += '<div class="col-5  mt-2">'
                 
         str += '<div id="detailCardTitleInModal" class="mb-3 mt-4 pb-3">'+ result[0].CARD_NAME+'</div>'
         str += '<div class="" data-aos-anchor="#example-anchor" data-aos-offset="500" data-aos-duration="500">' 
         str += '<div class="" style="display:flex; justify-content:center; align-items:center;"><img src="gif/shopping-basket.gif" style="width:120px;"><button type="button" class="addSelectedCardInCardSection" id="cartCateNum'+result[0].CARD_CATE_NUM+'" onClick="addCardInMyCart(this.id)">카드 찜하기</button></div>'                   
             
         str += '</div>'
         str += '</div>'
          
         str+='</div>'
         str+='</div></div>'
         $('#cardModalAlert').append(str);
         $('#commentOfCard').hide();
         $('#commentOfCard').fadeIn(2000);
         $('#cardImageInModal').hide();
         $('#cardImageInModal').fadeIn(2000);
         $('#detailCardTitleInModal').hide();
         $('#detailCardTitleInModal').fadeIn(800);
         
          
         return new Promise((resolve,reject)=>{
            resolve('sucess');
         })
      })
      .then(res=>{

         fetch('/showNetworkImg?cardCateNum='+result[0].CARD_CATE_NUM)
           .then(res => res.json())
           .then(res=>{
              let firstNumber = Math.floor(Math.random()*10+1);
              let lastNumber = firstNumber + Math.floor(Math.random()*3+1);
              $('#cardModalAlert').append('<div id="detailCardComment" class="mt-2 mb-2">카드 혜택</div>');
              for(let i=firstNumber;i<=lastNumber;i++){
                  $('#cardModalAlert').append('<img src="images/ali/ali_'+i+'.png" class="mb-2 aliImageInModal">');
              }
           	 $('.aliImageInModal').hide();
           	 $('.aliImageInModal').fadeIn(3000);
              
            
               $('#cardModalAlert').append('<div class="d-flex justify-content-center mb-3"><hr align="center" style="border:12px #008675; width: 30%; height:10px" class="mb-5"></div>')
               $('#cardModalAlert').append('<div class="cardSectionAliImage d-flex justify-content-center mb-4" style="overflow:hidden"></div>')
               cardNetworkList = res
               let str = '';
               	 str +='<div div class="d-flex justify-content-center">'
                 str +='<table class="table" id="cardInfoTable">'
                 str +='<thead>'
                 str +='<th scope="col" class="cardTableInfo" width="30%">혜택</th>'
                 str +='<th scope="col" class="cardTableInfo" width="10%">혜택 한도</th>'
                 str +='<th scope="col" class="cardTableInfo" width="60%">혜택 가맹점</th>'
                 str +='</thead>'
                 str +='<tbody class="table-group-divider">'
                for(let i=0 ;i<cardDetailList.length;i++){  
                  if(i==0){
                	   $('.cardSectionAliImage').append('<div class="cardSectionAliParentImage"><img src="images/ali_icon/'+cardDetailList[i].ALI_TYPE+'.png" class="cardSectionAliIcon"></div>')
                       str +='<tr>'
                       str +='<th width="25%">'
                       str += '<span class="cardCategory mt-3">'+cardDetailList[i].SMALL_CATE+'</span>'
                       str +='</th>'
                       str +='<td>'
                       str +='<span class="bene_limit mt-3"id="bene_upper_'+cardDetailList[i].BENE_LIMIT+'">'+ cardDetailList[i].BENE_LIMIT +' 원</span>'         
                       str +='</td>'
                       str +='<td>'    
                       str +='<span class="aliType">['+cardDetailList[i].ALI_TYPE+']<span>  </span></span>'
                       str +='<span class="discount">'+cardDetailList[i].DISCOUNT +'%<img class="" src="images/icon/money-bag.png" alt=""style="width:28px;">&nbsp;&nbsp;</span>'

                   }else{
                     if(cardDetailList[i-1].SMALL_CATE==cardDetailList[i].SMALL_CATE){
                    	  $('.cardSectionAliImage').append('<div class="cardSectionAliParentImage"><img src="images/ali_icon/'+cardDetailList[i].ALI_TYPE+'.png" class="cardSectionAliIcon"></div>')
                       str +='<span class="aliType">['+cardDetailList[i].ALI_TYPE+']<span>  </span></span>'
                       str +='<span class="discount">'+cardDetailList[i].DISCOUNT +'%<img class="" src="images/icon/money-bag.png" alt=""style="width:28px;">&nbsp;&nbsp;</span>'
                     }else{
                    	 $('.cardSectionAliImage').append('<div class="cardSectionAliParentImage"><img src="images/ali_icon/'+cardDetailList[i].ALI_TYPE+'.png" class="cardSectionAliIcon"></div>')
                     	 str +='</td>'
                         str +='</tr>'
                         str +='<tr>'
                         str +='<th>'
                         str += '<span class="cardCategory">'+cardDetailList[i].SMALL_CATE+'</span>'
                       	 str +='</th>'
                      	 str +='<td>'
                     	 str +='<span class="bene_limit" id="bene_upper_'+cardDetailList[i].BENE_LIMIT+'">'+ cardDetailList[i].BENE_LIMIT +' 원</span>'   
                     	 str +='</td>'
                         str +='<td>'
                         str +='<span class="aliType">['+cardDetailList[i].ALI_TYPE+']<span>  </span></span>'
                         str +='<span class="discount">'+cardDetailList[i].DISCOUNT +'%<img class="" src="images/icon/money-bag.png" alt=""style="width:28px;">&nbsp;&nbsp;</span>'
                  		 
                     }               
                  }
               }

                let str1 ='';
                str +='</td>';
                str +='</tbody>'
                str +='</table>';
                str +='</div>'
               	$('#cardModalAlert').append(str); 
                $('#cardInfoTable').hide();
                $('#cardInfoTable').fadeIn(3000);
                
                $('#cardModalAlert').append('<div class="d-flex justify-content-end px-5 switchDetailBasePerform"><p id="checkBasePerform" class="px-3">전월 실적 확인하기</p><label class="switch"><input type="checkbox" id="checkSelectedCardBasePerform" onchange="wantToSeeBasePerform();"><span class="slider round"></span></label></div>');
                $('#cardModalAlert').append('<div class="detailBenefitListAboutBasePerform mb-3"></div>')
                $(cardNetworkList).each(function(){
                    str1 +='<img src="' +this.IMG_URL+'" class="detailNetworkImg cardImage m-2">';   
                })     
                str1 +='<div div class="d-flex justify-content-center">'
             	str1 +='<table class="table w-75" id="cardInfoTable">'
              	str1 +='<thead>'
              	str1 +='<th scope="col" class="cardTableInfo" width="25%">연회비 타입</th>'
              	str1 +='<th scope="col" class="cardTableInfo" width="25%">연회비</th>'
              	str1 +='</thead>'
              	str1 +='<tbody class="table-group-divider">'
              	$(cardNetworkList).each(function(){
                  str1 +='<tr>'
                  str1 +='<th>';
                  str1 +=this.NETWORK;
                  str1 +='</th>';
                  str1 +='<td>';
                  str1 +=this.ANNUAL_FEE;
                  str1 +='</td>';
                  str1 +='</tr>'
              	})     
                str1 +='</tbody>'
                str1 +='</table>';
                str1 +='</div>'
                str1 +='<div><img src="images/hana/logo.png" style="width:120px; margin-top:30px;"></div>'
                $('#cardModalAlert').append(str1);
                return new Promise((resolve,reject)=>{
                  resolve('success')
               })
           })
           .then(res =>{
             $('#modalCardResisterbutton').click();   
           })
        
      })

         

   }
   

</script>

<script>
	function addCardInMyCart(input){
		$("#addCartNoticeModalButton").click();
		$('#closeModalTriggerInCardSection').click();
		let cardCateNum = input.substring(11);
		let memberNum = ${loginVO.memberNum};
    	fetch("/addSelectedCardIntoCart?cardCateNum="+cardCateNum+"&memberNum="+memberNum)
    	.then(res=>{
    		console.log("성공!")
    	}) 
	}
    function wantToSeeBasePerform(){
    	let cardSort = $('.cardDetailTypeCardSectionInModal').text();
    	if($('#checkBasePerform').text()==='전월 실적 확인하기'){
    		$('#checkBasePerform').empty();
    		$('#checkBasePerform').append('닫기')
		}else{
    		$('#checkBasePerform').empty();
    		$('#checkBasePerform').append('전월 실적 확인하기')
		}    	
  		let array = [];
  		for(let i=0;i<$('.bene_limit').length;i++){
  			array.push(Number($('.bene_limit')[i].id.substring(11)));
  		}
  		if($('.detailBenefitListAboutBasePerform').is(':empty')){
  			let basePerform = Math.max.apply(null, array);
  			let basePerform_2 = Math.ceil(basePerform*(2/3)/1000)*1000;
  			let basePerform_3 = Math.ceil(basePerform*(1/3)/1000)*1000;
  			let str = '';
  			if(cardSort !='멀티 카드'){
  				str +='<div class="d-flex justify-content-center">'
  				str +='<table class="table lastMonthPerformTable"><thead>'
  				str +='<tr><th scope="col">※ 전달 실적표</th>'
  				str +='<th scope="col">30만원 이상</th>'
  				str +='<th scope="col">50만원 이상</th>'
  				str +='<th scope="col">70만원 이상</th>'
  				str +='</tr></thead>'
  				str +='<tbody><tr>'
  				str +='<th scope="row">전 달 실적</th>'
  				str +='<th scope="row">월 최대 '+basePerform_3+'원 하나머니'+'<img src="images/icon/hanaMoney.png" style="width:40px;"></th>'
  				str +='<th scope="row">월 최대 '+basePerform_2+'원 하나머니'+'<img src="images/icon/hanaMoney.png" style="width:40px;"></th>'
  				str +='<th scope="row">월 최대 '+basePerform+'원 하나머니'+'<img src="images/icon/hanaMoney.png" style="width:40px;"></th>'
  				str +='</tbody></tr></table></div>'
  			}else if(cardSort =='멀티 카드' & basePerform>=50000){
  				str +='<div class="d-flex justify-content-center">'
  				str +='<table class="table lastMonthPerformTable"><thead>'
  	  			str +='<tr><th scope="col">전달 실적표</th>'
  	  			str +='<th scope="col">전 달 실적</th>'
  	  			str +='</tr></thead>'
  	  			str +='<tbody><tr>'
  	  			str +='<th scope="row">실적</th>'
				str +='<th scope="row">전달 실적 없이 월 최대 '+basePerform+'원 하나머니 지급'+'<img src="images/icon/hanaMoney.png" style="width:40px;"></th>'
				str +='<tbody></tr></table></div>'
  			}else{
 				str +='<div class="d-flex justify-content-center">'
 	  			str +='<table class="table lastMonthPerformTable"><thead>'
 	  			str +='<tr><th scope="col">전 달 실적표</th>'
 	  			str +='<th scope="col">30만원 이상</th>'
 	  			str +='<th scope="col">50만원 이상</th>'
 	  			str +='<th scope="col">70만원 이상</th>'
 	  			str +='</tr></thead>'
 	  			str +='<tbody><tr>'
 	  			str +='<th scope="row">전 달 실적</th>'
 	  			str +='<th scope="row">월 최대 '+basePerform_3+'원 하나머니'+'<img src="images/icon/hanaMoney.png" style="width:40px;"></th>'
 	  			str +='<th scope="row">월 최대 '+basePerform_2+'원 하나머니'+'<img src="images/icon/hanaMoney.png" style="width:40px;"></th>'
 	  			str +='<th scope="row">월 최대 '+basePerform+'원 하나머니'+'<img src="images/icon/hanaMoney.png" style="width:40px;"></th>'
 	  			str +='</tbody></tr></table></div>'
  			}
  			
  			if(cardSort === '멀티 카드'){
  	  			str +='<div class="detailMultiCardDescription d-flex justify-content-start"><img src="images/icon/bell.png" style="width:20px;">&nbsp;하나원큐페이, 삼성페이, 네이버페이, 쿠페이, LG페이, L페이, 카카오페이, SSG페이, 페이코에 카드를 등록하여 결제하는 건 1.0% 씩 적립됩니다.</div>'		
  	  			str +='<div class="detailMultiCardDescription d-flex justify-content-start"><img src="images/icon/bell.png" style="width:20px;">&nbsp;국내 외 전 가맹점은 0.7% 씩 적립이 됩니다.</div>'
  			}
  			$('.detailBenefitListAboutBasePerform').append(str);
  		}else{
  			$('.detailBenefitListAboutBasePerform').empty();
  		}
  		$('.lastMonthPerformTable').fadeIn(2000);
     } 
</script>
<script>
	function changeCardFilter(input){
		$('#cardImageList').empty();
		fetch("/displayCardInfoByConsumeCate?consumeCate="+input)
		.then(res=>res.json())
		.then(res=>{
			let thisCardCateNum = '';
		    let list = res
		    let benefit ='';
		   	for(let i=0;i<list.length;i++){
		       thisCardCateNum = list[i].cardCateNum;	

		       let str = ' ';
		       str+='<div class="col-4 mt-5 mb-5 cardImage" data-aos="flip-right">';
		       str+='<div class="d-flex justify-content-center">'
		       str+='<div class="mb-2" id="cardComment" style="color:black;">'+list[i].cardName+'</div>'
		       str+='</div>'
		       str+='<img src="'+list[i].imgUrl+'" class ="mb-1 cardSectionImage" id='+list[i].cardCateNum+' onClick="showThisCardDetail(this.id)">';
		       str+='<div id='+list[i].cardCateNum+'_div class="seokyungPick"></div>';
		       str+='<div class="cardSimpleInfo mb-2" data-aos="flip-down">';
			  
		       str+=list[i].commentOfCard;
		       str+='<br>'
		       str+='<div class="d-flex justify-content-center">'
		       str+='<div class="cardSortType mt-1">'+list[i].sortCard+'</div>';
		       str+='</div>'
		       str+='</div>';
		       str+='</div>';
		       $('#cardImageList').append(str);

		       fetch('/showMyCardBenefit?myCardId='+list[i].cardCateNum)
		       .then(res=> res.json())
		       .then(res =>{
		    	   let benefitList = res;
				   $('#'+list[i].cardCateNum+'_div').append('<div class="mb-3">');
		    	   $(benefitList).each(function(){
		    		   $('#'+this.CARD_CATE_NUM+'_div').append('<div type="button" class="btn btn-outline-primary mx-1 mb-1 cardSectionCateBtn">#'+this.SMALL_CATE+'</div>');
		    	   })
		    	   $('#'+list[i].cardCateNum+'_div').append('</div>');
		       })		       
		    }
		})
	}

</script>
<script>
	function showAllCard(){
		$('#cardImageList').empty();
		fetch('/showCardImage')
		.then(res=>res.json())
		.then(res=>{
			let thisCardCateNum = '';
		    let list = res
		    let benefit ='';
		    $(list).each(function(){
		       thisCardCateNum = this.CARD_CATE_NUM;	

		       let str = ' ';
		       str+='<div class="col-4 mt-5 mb-5 cardImage" data-aos="flip-right">';
		       str+='<div class="d-flex justify-content-center">'
		       str+='<div class="mb-2" id="cardComment">'+this.CARD_NAME+'</div>'
		       str+='</div>'
		       str+='<img src="' +this.IMG_URL+'" class ="mb-1 cardSectionImage" id='+this.CARD_CATE_NUM+' onClick="showThisCardDetail(this.id)">';
		       str+='<div id='+this.CARD_CATE_NUM+'_div class="seokyungPick"></div>';
		       str+='<div class="cardSimpleInfo mb-2" data-aos="flip-down">';
			  
		       str+=this.COMMENT_OF_CARD;
		       str+='<br>'
		       str+='<div class="d-flex justify-content-center">'
		       str+='<div class="cardSortType mt-1">'+this.SORT_CARD+'</div>';
		       str+='</div>'
		       str+='</div>';
		       str+='</div>';
		       $('#cardImageList').append(str);

		       fetch('/showMyCardBenefit?myCardId='+this.CARD_CATE_NUM)
		       .then(res=> res.json())
		       .then(res =>{
		    	   let benefitList = res;
				   $('#'+this.CARD_CATE_NUM+'_div').append('<div class="mb-3">');
		    	   $(benefitList).each(function(){
		    		   $('#'+this.CARD_CATE_NUM+'_div').append('<div type="button" class="btn btn-outline-primary mx-1 mb-1 cardSectionCateBtn">#'+this.SMALL_CATE+'</div>');
		    	   })
		    	   $('#'+this.CARD_CATE_NUM+'_div').append('</div>');
		       })
		       
		       
		    })
			
		})
	}
</script>

<script>
   AOS.init();
</script>



</body>
</html>