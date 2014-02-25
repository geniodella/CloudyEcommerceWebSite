package com.template.action;

import java.util.List;
import java.util.Map;


import org.springframework.dao.DataAccessException;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.ProductService;
import com.template.form.ImageForm;
import com.template.form.ProductDetails;
import com.template.vo.ProductImages;
import com.template.vo.ProductVO;

public class ProductAction extends ActionSupport{

	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public ProductDetails getProdDetails() {
		return prodDetails;
	}
	public void setProdDetails(ProductDetails prodDetails) {
		this.prodDetails = prodDetails;
	}

	private static final long serialVersionUID = 1L;
	
	private List<ProductDetails> productDetailsList;

	ProductService productServiceBean;		
	private ProductVO productVO=new ProductVO();
	
	
	public List<ProductDetails> getProductDetailsList() {
		return productDetailsList;
	}
	public void setProductDetailsList(List<ProductDetails> productDetailsList) {
		this.productDetailsList = productDetailsList;
	}

	private ProductDetails prodDetails; 

	
	public int getSubCategoryId() {
		return subCategoryId;
	}
	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}
	public ProductService getProductServiceBean() {
		return productServiceBean;
	}
	public void setProductServiceBean(ProductService productServiceBean) {
		this.productServiceBean = productServiceBean;
	}

	private String name;
	
	private int subCategoryId;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}

	private String  productId;
    private List<ImageForm> images;
	

	public List<ImageForm> getImages() {
		return images;
	}
	public void setImages(List<ImageForm> images) {
		this.images = images;
	}

	private int code;
	private int price;
	private int weight;
	private String description;
	private int categoryId;

	private List<ProductVO> lista;

	public List<ProductVO> getLista() {
		return lista;
	}
	public void setLista(List<ProductVO> lista) {
		this.lista = lista;
	}
	public void setName(String name) {
		this.name = name;
	}	
	public String getName() {
		return name;
	}
	public void setCode(int code) {
		this.code = code;
	}	
	public int getCode() {
		return code;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String populate(){			
		


		
//		lista=productServiceBean.getAllProductVOs();
						
		lista=productServiceBean.getAllproductsWithCategory();
						
		return "populate";
	}	

	public String populated(){		

		try{

			productVO= productServiceBean.findProductById(1);

		}catch(DataAccessException e){}

		return "populated";
	}
	
	public String retrieveDetail(){		

		try{

			prodDetails= productServiceBean.getProductDetail(productId);

		}catch(DataAccessException e){}

		return "retrieveDetail";
	}
	
	public String loadImages(){		

		
		images = productServiceBean.getAllImagesVOs(Integer.parseInt(productId));
		
	

		return "loadImages";
	}
	
	@Override
	public String execute() {

		productVO.setName(name);
		productVO.setWeight(weight);
		productVO.setDescription(description);			

	

			ProductImages image = new ProductImages();
			image.setProductVo(productVO);
			productServiceBean.insertProductVO(productVO);

			productServiceBean.insertProductImage(image);

		

		return SUCCESS;
	}		
	
	public String retrieveRelated(){
		
		productDetailsList = productServiceBean.getRelatedProducts(Integer.parseInt(productId), subCategoryId);
		
		return "retrieveRelated";
	}
	

	public String retrieveMostSold(){
		
		Integer[] categoriesId = {1,2,3};
		
		productDetailsList = productServiceBean.retrieveMostSoldProducts(categoriesId, 4);
		
		return "retrieveRelated";
	}
	
	public String retrieveWithDiscount(){
		productDetailsList=productServiceBean.retrieveProductWithDiscount();
		
		return "retrieveWithDiscount";
	}
}