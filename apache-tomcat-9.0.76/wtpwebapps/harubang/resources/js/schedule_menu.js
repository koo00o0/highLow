//addInfo
$(".infoWrap .menuWrap ul li").on("click", function(){
	var filter = $(this).html().toLowerCase();
	if(filter == "호텔"){
	    filter = "hotel";
	}else if(filter == "장소"){
	    filter = "location";
	}else if(filter == "찜목록"){
	    filter = "likeList";
	}
    $(".infoWrap .menuWrap ul li").removeClass("active");
    $(this).addClass("active");
    
    if(filter == "location"){
    	$(".scrollItem").not("[data-filter='"+filter+"']").removeClass("scrollItem").hide();
  	  	$("[data-filter='travel']").addClass("scrollItem").attr("style", null).show();
  	  	$("[data-filter='food']").addClass("scrollItem").attr("style", null).show();
    }else{
    	  $(".scrollItem").not("[data-filter='"+filter+"']").removeClass("scrollItem").hide();
    	  $("[data-filter='"+filter+"']").addClass("scrollItem").attr("style", null).show();
    }
});
