/* LOOK MY SCHEDULE CLICK  */
function lookMyScehdule(id, schedulenumber){
	$.ajax({
    	dataType: 'json',
    	type:"POST",
    	url:"/schedule/myDetailSchedule",
    	data: {
    		"id" : id,
    		"schedulenumber" : schedulenumber,
    		
    	},success : function(mydetailresult){
    		localStorage.setItem("dataFromPreviousPage", JSON.stringify(mydetailresult[0]));
    		window.location.href= "/schedule/myDetailSchedule";
    	}
	})
	
}