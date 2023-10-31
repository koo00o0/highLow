/*modal 내용*/
const modal = document.getElementById("modal");
	    
	function modalOn() {
	    modal.style.display = "flex";
	    document.body.style.overflow = 'hidden';
	    
	}

	function isModalOn() {
	    return modal.style.display === "flex"
	}

	function modalOff() {
	    modal.style.display = "none";
	    document.body.style.removeProperty('overflow');
	}

	function clickAddSchedule(itemId, itemName, imgfile){
		event.stopPropagation();
		var selectdate = $(".form-select option:checked").text()
		
		if (selectdate == "Open this select date"){
			swal("날짜를 선택해주세요.");
		}else{
			var innerHtml = "";
			$(".addScheduleBox .textWrap .placeWrap .place").val(itemName);
			$(".addScheduleBox .textWrap .placeWrap .ItemId").val(itemId);
			$(".addScheduleBox .imageWrap img").attr("src" , imgfile);
			$(".addScheduleBox .textWrap .dateWrap .date").val(selectdate);
		
			innerHtml += '<input type="button" value="확인" class="saveButton" onclick="addSchedultItem(\'' + itemId + '\',\'' + itemName +'\',\''+ selectdate +'\',\''+ imgfile +'\')">';
			innerHtml += '<input type="button" value="취소" class="cancelButton" onclick="cancelButton()">';
			$(".addScheduleBox .buttonWrap").html(innerHtml);
			modalOn();
		}
		
	}

	function cancelButton(){
		modalOff();
	}

	modal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("addScheduleWrap")) {
	        modalOff()
	    }
	})

	window.addEventListener("keyup", e => {
	    if(isModalOn() && e.key === "Escape") {
	        modalOff()
	    }
	})