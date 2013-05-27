package com.template.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.ProductService;
import com.template.form.ProductDetails;

public class ShowItemsAction extends ActionSupport {
	
	ProductService productServiceBean;			
	
	int page;
    public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}



	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}



	long total;
	
	List<ProductDetails> prodDetails;
	
public List<ProductDetails> getProdDetails() {
		return prodDetails;
	}

public void setProdDetails(List<ProductDetails> prodDetails) {
		this.prodDetails = prodDetails;
	}

public ProductService getProductServiceBean() {
		return productServiceBean;
	}

	public void setProductServiceBean(ProductService productServiceBean) {
		this.productServiceBean = productServiceBean;
	}

	

private String subCategoryId;
	
	
	
	

	public String getSubCategoryId() {
	return subCategoryId;
}

public void setSubCategoryId(String subCategoryId) {
	this.subCategoryId = subCategoryId;
}

	

	/**
	 * 
	 */
	private static final long serialVersionUID = -7820999098486880781L;

	public String execute() {
		
		prodDetails = productServiceBean.getProductDetails(subCategoryId,12,(page-1));
		
		total = productServiceBean.getCountProductVObySubCategoryId(Integer.parseInt(subCategoryId));
		
		return SUCCESS;
	}

}
