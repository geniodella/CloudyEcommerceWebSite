window.onload = (function(){try{

	$("img.rollover").hover(
			function()
			{
				this.src = this.src.replace("_off","_on");
			},
			function()
			{
				this.src = this.src.replace("_on","_off");
			}
	);
	
	function calculatePrice(){
		var rateOfCharge = parseFloat($("#article_rateOfCharge").attr("value"));
		var purchasePrice = parseFloat($("#article_purchasePrice").attr("value"));
		var unitPrice = parseFloat($("#article_unitPrice").attr("value"));
		var unitPriceFidelity = parseFloat($("#article_unitPriceFidelity").attr("value"));
		var discount = parseFloat($("#article_discount").attr("value"));
		var discountFidelity = parseFloat($("#article_discountFidelity").attr("value"));
		var iva = parseFloat($("#article_iva").attr("value"));
		
		var charge =  (purchasePrice * rateOfCharge / 100);
		
		var result = (purchasePrice + charge);
		var unitDiscount = result * discount / 100;
		var customerPriceNf =  (result - unitDiscount);
		var customerPrice =  customerPriceNf.toFixed(4);
		var ivaCustomerPriceNf = (customerPriceNf + (customerPriceNf * iva / 100));
		var ivaCustomerPrice = ivaCustomerPriceNf.toFixed(4);
		
		var resultFidelity = customerPriceNf;
		var unitDiscountFidelity = resultFidelity * discountFidelity / 100;
		var customerPriceNfFidelity =  (resultFidelity - unitDiscountFidelity);
		var customerPriceFidelity =  customerPriceNfFidelity.toFixed(4);
		var ivaCustomerPriceNfFidelity = (customerPriceNfFidelity + (customerPriceNfFidelity * iva / 100));
		var ivaCustomerPriceFidelity = ivaCustomerPriceNfFidelity.toFixed(4);
		
		
		$("#article_customerPrice").html(customerPrice+" &euro;");
		$("#article_ivaCustomerPrice").html(ivaCustomerPrice+" &euro;");
		$("#article_unitPrice").val(result);
		$("#article_totalPrice").attr("value",ivaCustomerPrice);
		
		$("#article_customerPriceFidelity").html(customerPriceFidelity+" &euro;");
		$("#article_ivaCustomerPriceFidelity").html(ivaCustomerPriceFidelity+" &euro;");
		$("#article_unitPriceFidelity").val(customerPriceNfFidelity);
		$("#article_totalPriceFidelity").attr("value",ivaCustomerPriceFidelity);
	}
	
	calculatePrice();
	
	$("#article_unitPrice").bind("change", function(e){
		calculatePrice();
	  });
	
	$("#article_unitPriceFidelity").bind("change", function(e){
		calculatePrice();
	  });
	
	$("#article_rateOfCharge").bind("change", function(e){
		calculatePrice();
	  });

	$("#article_purchasePrice").bind("change", function(e){
		calculatePrice();
	  });

	$("#article_discount").bind("change", function(e){
		calculatePrice();
	  });
	
	$("#article_discountFidelity").bind("change", function(e){
		calculatePrice();
	  });

	$("#article_iva").bind("change", function(e){
		calculatePrice();
	  });
	
}catch(e){}});