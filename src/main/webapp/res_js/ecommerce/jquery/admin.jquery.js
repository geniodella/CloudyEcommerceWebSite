$(function() {

	// highlight layout, for debug purpose only
	/*
	var hcss = {'border':'1px solid red'};
	$('#header').css(hcss);
	$('#left').css(hcss);
	$('#right').css(hcss);
	$('#footer').css(hcss);
	*/
	
	// build accordion menu
	/*
	$("#menu").accordion({
		header: "h3"
	});
	*/
	
	 function findValue(li) {
		 if( li == null ) return alert("No match!");
		 // if coming from an AJAX call, let's use the CityId as the value
		 if( !!li.extra ) var sValue = li.extra[0];
		 // otherwise, let's just display the value in the text box
		 else var sValue = li.selectValue;
		 //alert("The value you selected was: " + sValue);
	}

	 function selectItem(li) {
		 findValue(li);
	 }

	 function formatItem(row) {
		 return row[0] + " (id: " + row[1] + ")";
	 }

	 function lookupAjax(fieldName){
		 var oSuggest = $(fieldName)[0].autocompleter;
		 oSuggest.findValue();
		 return false;
	 }
	
	// apply style to all form elements
 	
	$('input[type="submit"]').addClass('submit');
	
	$('input[type="submit"]').hover(
		function(){
			$(this).addClass('submithover');
		},
		function(){		
			$(this).removeClass('submithover');
		}
	);
	
	$('select').addClass('input');
	$('textarea').addClass('input');
	$('input[type="text"]').addClass('input');
	$('input[type="text"]').focus(function(){
		$(this).addClass('inputhover');
	});
	$('input[type="text"]').blur(function(){
		$(this).removeClass('inputhover');
	});
	
	$('input[type="password"]').addClass('input');
	$('input[type="password"]').focus(function(){
		$(this).addClass('inputhover');
	});
	$('input[type="password"]').blur(function(){
		$(this).removeClass('inputhover');
	});
	
	$('input[type="checkbox"]').addClass('input');
	$('input[type="checkbox"]').focus(function(){
		$(this).addClass('inputhover');
	});
	$('input[type="checkbox"]').blur(function(){
		$(this).removeClass('inputhover');
	});
	
	
	// automatic adjustment right box
	/*
	$("#right").css({'width': ($(document).width()-270) +'px'})
	$(window).resize(function(){
		$("#right").css({'width': ($(document).width()-270) +'px'})
	});
	*/
	
	// set focus on first input element
	$("input:first").focus();
	
	// configure all input tooltip
	//$("input").tooltip();

	// setup datepicker widget
	/*
	$('input.datepicker').datepicker({
		dateFormat: 'dd/mm/yy',
		firstDay: 1,
		monthNames: ['Gennaio','Febbraio','Marzo', 'Aprile','Maggio','Giugno','Luglio','Agosto', 'Settembre','Ottobre','Novembre','Dicembre'],
		dayNamesMin: ['Do', 'Lu', 'Ma', 'Me', 'Gi', 'Ve', 'Sa']
	});
	*/
	
	$("#datepickerFrom").datepicker({
		dateFormat: 'dd/mm/yy'
	});
	
	$("#datepickerTo").datepicker({
		dateFormat: 'dd/mm/yy'
	});
	
	$("#datepickerSchedule").datepicker({
		dateFormat: 'dd/mm/yy'
	});
	
	$("#resizable").resizable(
		{
			minWidth: 520,
			minHeight: 170,
			maxWidth: 520,
			maxHeight: 800
		}
	);
	
	$("#fidelity_code_autocomplete").autocomplete("../../autocomplete/completeFidelityCard.action?field=barCode",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	
	$("#customer_name_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=name",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_username_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=username",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_firstName_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=firstName",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_lastName_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=lastName",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_fiscalCode_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=fiscalCode",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_piva_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=piva",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_country_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=country",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_state_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=state",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_city_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=city",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_address_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=address",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_postalCode_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=postalCode",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#customer_mail_autocomplete").autocomplete("../../autocomplete/completeCustomer.action?field=mail",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	
	$("#supplier_name_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=name",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_username_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=username",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_firstName_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=firstName",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_lastName_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=lastName",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_fiscalCode_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=fiscalCode",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_piva_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=piva",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_country_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=country",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_state_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=state",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_city_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=city",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_address_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=address",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_postalCode_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=postalCode",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#supplier_mail_autocomplete").autocomplete("../../autocomplete/completeSupplier.action?field=mail",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	
	$("#article_name_autocomplete").autocomplete("../../autocomplete/completeArticle.action?field=name",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#article_code_autocomplete").autocomplete("../../autocomplete/completeArticle.action?field=code",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#article_barCode_autocomplete").autocomplete("../../autocomplete/completeArticle.action?field=barCode",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#article_shortDescription_autocomplete").autocomplete("../../autocomplete/completeArticle.action?field=shortDescription",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#article_longDescription_autocomplete").autocomplete("../../autocomplete/completeArticle.action?field=longDescription",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	
	$("#corder_code_autocomplete").autocomplete("../../../autocomplete/completeOrder.action?field=code&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	
	$("#cddt_type_autocomplete").autocomplete("../../../autocomplete/completeDdt.action?field=type&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#cddt_number_autocomplete").autocomplete("../../../autocomplete/completeDdt.action?field=number&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#cddt_description_autocomplete").autocomplete("../../../autocomplete/completeDdt.action?field=description&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#cddt_causal_autocomplete").autocomplete("../../../autocomplete/completeDdt.action?field=causal&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	
	
	$("#ccreditnote_number_autocomplete").autocomplete("../../../autocomplete/completeCreditNote.action?field=number&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#ccreditnote_description_autocomplete").autocomplete("../../../autocomplete/completeCreditNote.action?field=description&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#ccreditnote_causal_autocomplete").autocomplete("../../../autocomplete/completeCreditNote.action?field=causal&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});

	
	$("#cdeferredinvoice_number_autocomplete").autocomplete("../../../autocomplete/completeDeferredInvoice.action?field=number&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#cdeferredinvoice_description_autocomplete").autocomplete("../../../autocomplete/completeDeferredInvoice.action?field=description&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#cdeferredinvoice_causal_autocomplete").autocomplete("../../../autocomplete/completeDeferredInvoice.action?field=causal&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});

	$("#cimmediatelyinvoice_number_autocomplete").autocomplete("../../../autocomplete/completeImmediatelyInvoice.action?field=number&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#cimmediatelyinvoice_description_autocomplete").autocomplete("../../../autocomplete/completeImmediatelyInvoice.action?field=description&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#cimmediatelyinvoice_causal_autocomplete").autocomplete("../../../autocomplete/completeImmediatelyInvoice.action?field=causal&type=C",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	
	$("#sorder_code_autocomplete").autocomplete("../../../autocomplete/completeOrder.action?field=code&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	
	$("#sddt_type_autocomplete").autocomplete("../../../autocomplete/completeDdt.action?field=type&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#sddt_number_autocomplete").autocomplete("../../../autocomplete/completeDdt.action?field=number&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#sddt_description_autocomplete").autocomplete("../../../autocomplete/completeDdt.action?field=description&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#sddt_causal_autocomplete").autocomplete("../../../autocomplete/completeDdt.action?field=causal&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	
	$("#screditnote_number_autocomplete").autocomplete("../../../autocomplete/completeCreditNote.action?field=number&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#screditnote_description_autocomplete").autocomplete("../../../autocomplete/completeCreditNote.action?field=description&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#screditnote_causal_autocomplete").autocomplete("../../../autocomplete/completeCreditNote.action?field=causal&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});

	$("#sdeferredinvoice_number_autocomplete").autocomplete("../../../autocomplete/completeDeferredInvoice.action?field=number&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#sdeferredinvoice_description_autocomplete").autocomplete("../../../autocomplete/completeDeferredInvoice.action?field=description&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#sdeferredinvoice_causal_autocomplete").autocomplete("../../../autocomplete/completeDeferredInvoice.action?field=causal&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});

	$("#simmediatelyinvoice_number_autocomplete").autocomplete("../../../autocomplete/completeImmediatelyInvoice.action?field=number&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#simmediatelyinvoice_description_autocomplete").autocomplete("../../../autocomplete/completeImmediatelyInvoice.action?field=description&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	$("#simmediatelyinvoice_causal_autocomplete").autocomplete("../../../autocomplete/completeImmediatelyInvoice.action?field=causal&type=S",{delay:10,minChars:1,matchSubset:1,matchContains:1,cacheLength:10,autoFill:true});
	
	
});