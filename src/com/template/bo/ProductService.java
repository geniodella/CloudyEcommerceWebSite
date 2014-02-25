package com.template.bo;

import java.util.List;
import java.util.Map;

import com.template.form.ImageForm;
import com.template.form.ProductDetails;
import com.template.vo.ProductImages;
import com.template.vo.ProductVO;

public interface ProductService {
	
	ProductVO findProductById(int id);
	
	public List<ProductDetails> retrieveMostSoldProducts(Integer[] categoriesId, int productRowNumber);
	
	public long getCountProductVObySubCategoryId(int subCategoryId);
	
	List<ProductVO> getAllproductsWithCategory();

	void insertProductVO(ProductVO productVO);
	
	List<ProductVO> getAllproductWithDetails(String subCategoryId, int pageSize, int pageNumber);

	void insertProductImage(ProductImages productVO);
	
	public List<ImageForm> getAllImagesVOs(int productId);

	void updateProductVO(ProductVO productVO);

	List<ProductVO> getAllProductVOs(int size, int page);

	void removeProductVO(ProductVO productVO);
	
	List<ProductDetails> getProductDetails(String subCategoryId, int pageSize, int pageNumber);
	
	public ProductDetails getProductDetail(String productId);
	
	public int getIdProductVOs();
	
	public List<ProductDetails> getRelatedProducts(int productId, int subCategoryId);

	List<ProductDetails> retrieveProductWithDiscount();
}
