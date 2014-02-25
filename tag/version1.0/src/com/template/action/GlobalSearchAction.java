package com.template.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.globalSearch.GlobalSearchService;
import com.template.form.ProductDetails;
import com.template.form.SearchForm;
import com.template.form.TagForm;

public class GlobalSearchAction extends ActionSupport{
	
	
	List<ProductDetails> productList;
	
	String query; 
	
	private int priceRangeId;
		
	
	
	public int getPriceRangeId() {
		return priceRangeId;
	}



	public void setPriceRangeId(int priceRangeId) {
		this.priceRangeId = priceRangeId;
	}



	public int getSubCategoryId() {
		return subCategoryId;
	}



	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}



	int subCategoryId;
	
	public SearchForm getSearchForm() {
		return searchForm;
	}



	public void setSearchForm(SearchForm searchForm) {
		this.searchForm = searchForm;
	}



   private Integer[] charDataId;








	public Integer[] getCharDataId() {
	return charDataId;
}



public void setCharDataId(Integer[] charDataId) {
	this.charDataId = charDataId;
}



	private long tagId;
	
	SearchForm searchForm;
	

    private List<TagForm> tagForms;


	



	public List<TagForm> getTagForms() {
		return tagForms;
	}



	public void setTagForms(List<TagForm> tagForms) {
		this.tagForms = tagForms;
	}



	public long getTagId() {
		return tagId;
	}



	public void setTagId(long tagId) {
		this.tagId = tagId;
	}



	public List<ProductDetails> getProductList() {
		return productList;
	}



	public void setProductList(List<ProductDetails> productList) {
		this.productList = productList;
	}



	public String getQuery() {
		return query;
	}



	public void setQuery(String query) {
		this.query = query;
	}







	GlobalSearchService globalSearchServiceBean;

	



	public GlobalSearchService getGlobalSearchServiceBean() {
		return globalSearchServiceBean;
	}



	public void setGlobalSearchServiceBean(
			GlobalSearchService globalSearchServiceBean) {
		this.globalSearchServiceBean = globalSearchServiceBean;
	}



	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public String reindexManually(){
		
		globalSearchServiceBean.manualIndexing();
		
		return "reindexManually";
	}
	
	
	
	public String populateScreeningPanel(){
		
		
		return "populateScreeningPanel";
	}
	
	
	public String execute(){
		
		
		searchForm = globalSearchServiceBean.liveSearch(tagId,subCategoryId);
		
		return "success";
	}
	
	public String retrieveResults(){
		
		if(query !=null && query != "")
		tagForms = globalSearchServiceBean.retrieveTagsBySearch(query);
		
		return "retrieveResults";
	}
	
	public String filter(){
		
		searchForm = globalSearchServiceBean.filterSearch(charDataId,priceRangeId,tagId,subCategoryId);
		
		return "filter";
	}
	
	public String filterByCat(){
		
		searchForm = globalSearchServiceBean.screeningByCategory(tagId);
		
		return "filterByCat";
	}

}
