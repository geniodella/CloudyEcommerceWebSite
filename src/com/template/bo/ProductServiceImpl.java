package com.template.bo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Value;

import com.template.dao.ProductDao;
import com.template.dao.mostSoldProducts.MostSoldProductsDao;
import com.template.dao.order.OrderProductRelationsDao;
import com.template.form.CharacteristicDataForm;
import com.template.form.CharacteristicDetails;
import com.template.form.ImageForm;
import com.template.form.ProductDetails;
import com.template.generic.Const;
import com.template.vo.CharProductRelationVO;
import com.template.vo.CharacteristicDataVO;
import com.template.vo.MostSoldProductsVO;
import com.template.vo.OrderProductRelationVO;
import com.template.vo.OrderVO;
import com.template.vo.ProductImages;
import com.template.vo.ProductVO;

public class ProductServiceImpl implements ProductService{

	ProductDao productDao;
	
	 @Value("${application.code}")
	 private String applicationCode;

	public MostSoldProductsDao getMostSoldProductsDao() {
		return mostSoldProductsDao;
	}

	public void setMostSoldProductsDao(MostSoldProductsDao mostSoldProductsDao) {
		this.mostSoldProductsDao = mostSoldProductsDao;
	}


	MostSoldProductsDao mostSoldProductsDao;

	public OrderProductRelationsDao getOrderProductRelationsDao() {
		return orderProductRelationsDao;
	}

	public void setOrderProductRelationsDao(
			OrderProductRelationsDao orderProductRelationsDao) {
		this.orderProductRelationsDao = orderProductRelationsDao;
	}


	OrderProductRelationsDao orderProductRelationsDao;

	String imageFolder = Const.IMAGE_FOLDER;



	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	/**
	 * findProductById
	 * 
	 * @param id
	 *            int
	 * @return ProductVO
	 * @todo Implement this org.annotationmvc.service.ProductService method
	 */
	public ProductVO findProductById(final int id) {
		return productDao.findProductVOById(id);
	}

	/**
	 * getAllProductVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.ProductService method
	 */
	public List<ProductVO> getAllProductVOs(int size, int page) {
		return productDao.getAllProductVOs(size,page);
	}

	/**
	 * insertProductVO
	 * 
	 * @param productVO
	 *            ProductVO
	 * @todo Implement this org.annotationmvc.service.ProductService method
	 */

	public List<ProductVO> getAllproductsWithCategory(){
		return productDao.getAllproductsWithCategory();
	}

	public void insertProductVO(final ProductVO productVO) {
		productDao.insertProductVO(productVO);
	}

	public void insertProductImage(final ProductImages productVO) {
		productDao.insertProductImage(productVO);
	}


	public List<ProductVO> getAllproductWithDetails(String subCategoryId, int pageSize, int pageNumber){
		return productDao.getAllproductWithDetails(subCategoryId,  pageSize,  pageNumber);
	}

	/**
	 * removeProductVO
	 * 
	 * @param productVO
	 *            ProductVO
	 * @todo Implement this org.annotationmvc.service.ProductService method
	 */
	public void removeProductVO(final ProductVO productVO) {
		productDao.removeProductVO(productVO);
	}

	/**
	 * updateProductVO
	 * 
	 * @param productVO
	 *            ProductVO
	 * @todo Implement this org.annotationmvc.service.ProductService method
	 */
	public void updateProductVO(final ProductVO productVO) {
		productDao.updateProductVO(productVO);
	}


	public List<ImageForm> getAllImagesVOs(int productId) {

		List<ProductImages> images = productDao.getAllImagesVOs(productId);

		List<ImageForm> imagesForm = new ArrayList<ImageForm>();

		for (ProductImages productImages : images) {
			ImageForm imageForm = new ImageForm();

			imageForm.setValue("/EcommerceRoot/"+applicationCode+"/images/"+productImages.getImageName());
			imageForm.setValuehref("/EcommerceRoot/"+applicationCode+"/images/"+productImages.getImageName());
			imagesForm.add(imageForm);
		}




		return imagesForm;
	}


	/**
	 * Method that populates a list of productDetails
	 * used to feed an image grid with informations coming from the product
	 * @param subCategoryId
	 * @return
	 */
	public List<ProductDetails> getProductDetails(String subCategoryId, int pageSize, int pageNumber){
		List<ProductVO> products = productDao.getAllproductWithDetails(subCategoryId,pageSize,pageNumber);
		List<ProductDetails> prodDetailsList = new ArrayList<ProductDetails>();

		for (ProductVO productVO : products) {
			ProductDetails prodDetails = new ProductDetails();
			prodDetails.setName(productVO.getName());
			prodDetails.setId(productVO.getProductId());
			prodDetails.setPrice(productVO.getPrice());
			prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
			prodDetails.setAvailability(productVO.getAvailability());
			prodDetails.setProducer(productVO.getProducer());



			for (ProductImages productImage : productVO.getProductsImages()) {
				if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
					prodDetails.setImagePath(productImage.getImageName());

			}

			prodDetailsList.add(prodDetails);

			Set<CharProductRelationVO> characteristicDatas = productVO.getCharProductRelations();

			for (CharProductRelationVO relationVO : characteristicDatas) {

				CharacteristicDataVO characteristicDataVO = relationVO.getCharVO();

				if(characteristicDataVO.getCharVO().isChecked()==true){
					CharacteristicDetails charDetails = new CharacteristicDetails();
					charDetails.setName(characteristicDataVO.getCharVO().getName());
					charDetails.setValue(characteristicDataVO.getData());

					prodDetails.getCharacteristicDetails().add(charDetails);
				}

			}


		}

		return prodDetailsList;
	}


	/**
	 * Method that populates a list of productDetails
	 * used to feed an image grid with informations coming from the product
	 * @param subCategoryId
	 * @return
	 */
	public ProductDetails getProductDetail(String productId){

		HashMap<Integer,CharacteristicDetails> characteristics = new HashMap<Integer,CharacteristicDetails>();

		ProductVO productVO = productDao.findProductVOById(Integer.parseInt(productId));

		ProductDetails prodDetails= new ProductDetails();
		prodDetails.setName(productVO.getName());
		prodDetails.setProductId(productVO.getProductId());
		prodDetails.setAvailability(productVO.getAvailability());
		prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
		prodDetails.setDescription(productVO.getDescription());
		prodDetails.setPrice(productVO.getPrice());
		prodDetails.setProducer(productVO.getProducer());
		prodDetails.setSubCategoryId(productVO.getSubCategoryVO().getSubCategoryId());

		if(productVO.getDiscountVO()!=null)
			prodDetails.setDiscountPercentage(productVO.getDiscountVO().getPercentage());

		for (ProductImages productImage : productVO.getProductsImages()) {
			if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
				prodDetails.setImagePath(productImage.getImageName());

		}



		Set<CharProductRelationVO> characteristicDatas = productVO.getCharProductRelations();

		for (CharProductRelationVO relationVO : characteristicDatas) {



			CharacteristicDataVO characteristicDataVO = relationVO.getCharVO();

			if (characteristics.containsKey(characteristicDataVO.getCharVO().getCharacteristicId())){

				CharacteristicDetails charDetails = characteristics.get(characteristicDataVO.getCharVO().getCharacteristicId());

				CharacteristicDataForm charDataForm = new CharacteristicDataForm();

				charDataForm.setCharDataId(characteristicDataVO.getId());

				charDataForm.setName(characteristicDataVO.getData());

				charDetails.getCharList().add(charDataForm);

			}else{

				CharacteristicDetails charDetails = new CharacteristicDetails();

				charDetails.setName(characteristicDataVO.getCharVO().getName());

				charDetails.setId(characteristicDataVO.getCharVO().getCharacteristicId());

				CharacteristicDataForm charDataForm = new CharacteristicDataForm();



				charDataForm.setCharDataId(characteristicDataVO.getId());

				charDataForm.setName(characteristicDataVO.getData());

				charDetails.getCharList().add(charDataForm);

				characteristics.put(characteristicDataVO.getCharVO().getCharacteristicId(), charDetails);
			}


			//prodDetails.getCharacteristicDetails().add(charDetails);

		}					


		prodDetails.setCharacteristicDetails(new ArrayList<CharacteristicDetails>(characteristics.values()));

		return prodDetails;
	}


	/**
	 * @param productId
	 * @return
	 */
	public List<ProductDetails> getRelatedProducts(int productId, int subCategoryId){

		// the number of products that will be displayed in the view item
		int productFormQuantity =0;

		HashMap<Integer,ProductDetails> prodDetailsList = new HashMap<Integer,ProductDetails>();

		List<OrderProductRelationVO> relations = orderProductRelationsDao.findOrderProductRelationVOByProduct(productId);

		for (OrderProductRelationVO orderProductRelationVO : relations) {

			OrderVO orderVO = orderProductRelationVO.getOrderVO();

			List<OrderProductRelationVO> productRelations = orderVO.getOrderProductRelations();

			for (OrderProductRelationVO orderProductRelationVO2 : productRelations) {

				ProductVO productVO =  orderProductRelationVO2.getProductVO();

				if(orderProductRelationVO2.getProductVO().getSubCategoryVO().getSubCategoryId() == 
						subCategoryId && orderProductRelationVO2.getProductVO().getProductId() !=productId){

					ProductDetails prodDetails = new ProductDetails();
					prodDetails.setName(productVO.getName());
					prodDetails.setId(productVO.getProductId());
					prodDetails.setAvailability(productVO.getAvailability());
					prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
					prodDetails.setDescription(productVO.getDescription());
					prodDetails.setPrice(productVO.getPrice());
					prodDetails.setProducer(productVO.getProducer());

					for (ProductImages productImage : productVO.getProductsImages()) {
						if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
							prodDetails.setImagePath(productImage.getImageName());

					}

					if(prodDetailsList.containsKey(prodDetails.getId())){
						prodDetailsList.get(prodDetails.getId()).setCount(	prodDetailsList.get(prodDetails.getId()).getCount()+1);

						// we retrieve the total of the quantitySold for that given product
						prodDetailsList.get(prodDetails.getId()).setQuantitySold(	prodDetailsList.get(prodDetails.getId()).getQuantitySold()+
								orderProductRelationVO2.getQuantitySold());
					}
					else {
						prodDetailsList.put(prodDetails.getId(), prodDetails);	

						productFormQuantity++;
					}



				}

			}


		}

		List sordedList = sortByComparator(prodDetailsList);

		return sordedList;
	}


	private static List<ProductDetails> sortByComparator(Map unsortMap) {

		List<ProductDetails> list = new ArrayList<ProductDetails>(unsortMap.values());

		// sort list based on comparator
		Collections.sort(list, new ProductDetails());

		// put sorted list into map again
		//LinkedHashMap make sure order in which keys were inserted
		/*	Map sortedMap = new LinkedHashMap();
		for (Iterator it = list.iterator(); it.hasNext();) {
			ProductDetails entry = (ProductDetails) it.next();
			sortedMap.put(entry.getId(), entry);
		}*/
		return list;
	}



	public int getIdProductVOs(){		
		return productDao.getIdProductVOs();
	}

	public long getCountProductVObySubCategoryId(int subCategoryId){
		return productDao.getCountProductVObySubCategoryId(subCategoryId);
	}



	/* (non-Javadoc)
	 * @see com.template.bo.ProductService#retrieveMostSoldProducts(java.lang.Integer[], int)
	 */
	public List<ProductDetails> retrieveMostSoldProducts(Integer[] categoriesId, int productRowNumber){

		List<MostSoldProductsVO> products = mostSoldProductsDao.getAllMostSoldProductsVOs();
		List<ProductDetails> prodDetailsList = new ArrayList<ProductDetails>();

		for (MostSoldProductsVO mostSoldProductVO : products) {

			ProductVO productVO = mostSoldProductVO.getProductVO();

			ProductDetails prodDetails = new ProductDetails();
			prodDetails.setName(productVO.getName());
			prodDetails.setId(productVO.getProductId());
			prodDetails.setPrice(productVO.getPrice());
			prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
			prodDetails.setAvailability(productVO.getAvailability());
			prodDetails.setProducer(productVO.getProducer());



			for (ProductImages productImage : productVO.getProductsImages()) {
				if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
					prodDetails.setImagePath(productImage.getImageName());

			}

			prodDetailsList.add(prodDetails);

			Set<CharProductRelationVO> characteristicDatas = productVO.getCharProductRelations();




		}

		return prodDetailsList;
	}


	public List<ProductDetails> retrieveProductWithDiscount(){

		List<ProductVO> productVO = productDao.getAllProductVOs();
		List<ProductDetails>prodDetailsList=new ArrayList<ProductDetails>();
		Random randomGenerator= new Random();
		for (ProductVO productVO2 : productVO) {

			if(productVO2.getDiscountVO()!=null){
				ProductDetails prodDetails= new ProductDetails();
				prodDetails.setName(productVO2.getName());
				prodDetails.setId(productVO2.getProductId());
				prodDetails.setProductId(productVO2.getProductId());
				prodDetails.setAvailability(productVO2.getAvailability());
				prodDetails.setAvailabilityTime(productVO2.getAvailabilityTime());
				prodDetails.setDescription(productVO2.getDescription());
				prodDetails.setPrice(productVO2.getPrice());
				prodDetails.setProducer(productVO2.getProducer());
				prodDetails.setSubCategoryId(productVO2.getSubCategoryVO().getSubCategoryId());


				prodDetails.setDiscountPercentage(productVO2.getDiscountVO().getPercentage());

				for (ProductImages productImage : productVO2.getProductsImages()) {
					if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
						prodDetails.setImagePath(productImage.getImageName());

				}

				prodDetailsList.add(prodDetails);												
			}			

		}
		//noi al max visualizziamo 4 prodotti quindi se viene superato questo numero scatta questosto metodo
		while(prodDetailsList.size()>4){
			int index = randomGenerator.nextInt(prodDetailsList.size()); //VIENE PRESO CASUALMENTE UN ELEMENTO DALLA LISTA
			prodDetailsList.remove(index);  // E POI QUESTO ELEMENTO RANDOMIZZATO VIENE RIMOSSO
		}

		return prodDetailsList;
	}


}
