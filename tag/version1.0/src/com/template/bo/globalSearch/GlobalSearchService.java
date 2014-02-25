package com.template.bo.globalSearch;

import java.util.List;

import com.template.form.ProductDetails;
import com.template.form.SearchForm;
import com.template.form.TagForm;


public interface GlobalSearchService {
	
	public SearchForm liveSearch(long tagId,int subCategoryId);
	
	public List<TagForm> retrieveTagsBySearch(String searchTerm);
	
	public void manualIndexing();
	
	public SearchForm filterSearch(Integer[] charDataId, int priceRange, long tagId,int subCategoryId);
	
	public SearchForm screeningByCategory(long tagId);

	

}
