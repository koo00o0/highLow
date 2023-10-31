/*계획 추가 입니다.*/


// 추가 계획 JSON 
DateJson = {};

function addSchedultItem(ItemId, ItemName, SelectDate, ImgFile){
	modalOff()
	const startTime = $(".startTime").val();
	const endTime = $(".endTime").val();
	var innerHtml = "";
	innerHtml += '<div class="scrollItemAdd '+ ItemId +' '+ SelectDate +'">';
	innerHtml += '<div class="imgItem">';
	innerHtml += '<img src="'+ ImgFile +'" alt="">';
	innerHtml += '</div>';
	innerHtml += '<div class="textItem">';
	innerHtml += '<h4>'+ ItemName +'</h4>';
	innerHtml += '<p>날짜 : '+ SelectDate +'</p>';
	innerHtml += '<p>시간 : ' + startTime + ' ~ ' + endTime+'</p>';
	innerHtml += '</div>';
	innerHtml += '<div class="cancle">';
	innerHtml += '<img src="/resources/images/icon/cancel.png" alt="" onclick="deleteDiv(\''+ItemId+'\',\''+SelectDate+'\',\''+ItemName+'\',\''+startTime+'\',\''+endTime+'\')">';
	innerHtml += '</div>';
	innerHtml += '</div>';
	$(".scrollWrapAdd").append(innerHtml);
	
	var selectDateAdd = {};
	
	selectDateAdd = {"text": ItemName, "startTime": startTime, "endTime": endTime, "imgFile" : ImgFile};
    /*데이터 추가*/
	checkDate = Object.keys(DateJson).includes(SelectDate);
	if (checkDate == false){
		DateJson[SelectDate] = [];
	}
	
	DateJson[SelectDate].push(selectDateAdd);
}


function deleteDiv(ItemId, SelectDate, ItemName, StartTime, EndTime){

	var checkDateValue = {"text": ItemName, "startTime": startTime, "endTime": endTime, "imgFile" : ImgFile};
	var strObj2 = JSON.stringify(checkDateValue);
	for(var i=0; i < DateJson[SelectDate].length; i++ ){
		var strObj1 = JSON.stringify(DateJson[SelectDate][i]);
		result = strObj1 == strObj2;
		if (result == true){
			DateJson[SelectDate].splice(i, 1);
		}	
	}

	var className = ".scrollItemAdd." + ItemId + "." +SelectDate;
	const removeDiv = $(className);
	removeDiv.remove();
}

/*저장 BUTTON*/
function saveAllSchedule(id){
	var schedulename = $(".sectionWrap .itemWrap .scheduleWrap .schedulenameInput").val();
	var detail = JSON.stringify(DateJson);
	if(schedulename == ""){
		swal("일정명을 입력해주세요.");
	}else{
		$.ajax({
	    	dataType: 'text',
	    	type:"POST",
	    	url:"/schedule/AddSchedule",
	    	data: {
	    		"id" : id,
	    		"scheduleName" : schedulename,
	    		"detailSchedule" : detail,
	    	},
	    	success : function(result){
	    		if(result=="T"){
	    			location.href="/schedule/schedule";
	    		}else{
	    			location.href="/schedule/makeSchedule";
	    		}
	    	}
		});
	}
}
