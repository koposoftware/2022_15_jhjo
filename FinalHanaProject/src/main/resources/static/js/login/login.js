/**
 * 
 */
 
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