function incrementArticle(article_id){
	
	var qava = $("#quantity_available_"+article_id);
	var qcho = $("#quantity_chosen_"+article_id);
	
	if(parseInt(qava.html())>0){
		qcho.html(parseInt(qcho.html()) + 1); 
		qava.html(parseInt(qava.html()) - 1); 
	}

	updateHiddenChooserField();
}

function decrementArticle(article_id){
	
	var qava = $("#quantity_available_"+article_id);
	var qcho = $("#quantity_chosen_"+article_id);
	
	if(parseInt(qcho.html())>0){
		qcho.html(parseInt(qcho.html()) - 1); 
		qava.html(parseInt(qava.html()) + 1); 
	}
	
	updateHiddenChooserField();
}

function increment10Article(article_id){
	
	var qava = $("#quantity_available_"+article_id);
	var qcho = $("#quantity_chosen_"+article_id);
	
	if(parseInt(qava.html())>9){
		qcho.html(parseInt(qcho.html()) + 10); 
		qava.html(parseInt(qava.html()) - 10); 
	}

	updateHiddenChooserField();
}

function decrement10Article(article_id){
	
	var qava = $("#quantity_available_"+article_id);
	var qcho = $("#quantity_chosen_"+article_id);
	
	if(parseInt(qcho.html())>9){
		qcho.html(parseInt(qcho.html()) - 10); 
		qava.html(parseInt(qava.html()) + 10); 
	}
	
	updateHiddenChooserField();
}


function updateHiddenChooserField() 
{
	
	var hiddenInput = $("#chosenListContent");
	hiddenInput.val('');
	$(".articleQuantityChosen").each(function(i){	
		articleId = parseInt(this.id.substring(this.id.lastIndexOf("_")+1)); 
		hiddenInput.val(hiddenInput.val() + articleId+ "="+ this.innerHTML +",");
	});	
}