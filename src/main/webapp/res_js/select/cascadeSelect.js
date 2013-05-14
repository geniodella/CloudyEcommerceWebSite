window.onload = (function(){try{
	$("#countrySelect").bind("change", function(e){
		updateCitySelect();
	  });

	function showAndHideItem(id) {
	    var e = document.getElementById(id);
	    if (e.style.visibility == 'hidden') {
	        e.style.visibility = 'visible';
	        e.style.display = 'block';
	    } else {
	        e.style.visibility = 'hidden';
	        e.style.display = 'none';
	    }
	}
	
	function updateCitySelect(){
		var citySelectOptions = $("#citySelect").options;
		$("#citySelect").empty();
		showAndHideItem("loadingDiv");
		showAndHideItem("citySelect");
		if( $("#countrySelect").val() == 'default' ){
			$("#citySelect").html('<option value="default">-- Select --</option>');
			return;
		}
		
		$.ajax(
			{
				type: "GET",
				dataType: "json",
				url: "customerUpdateSelect.action", 
				data: "countryCcFips="+$("#countrySelect").val(),
				success: function(json){
					var options = '';
					for(i=0; i<json.length;i++){
						
						options += '<option value="'+json[i].ccFips+'">'+json[i].name+'</option>';
					}				
					
					$("#citySelect").html('<option value="default">-- Select --</option>'+options);
					showAndHideItem("loadingDiv");
					showAndHideItem("citySelect");
				}
			}
		);
		
	}
}catch(e){}});