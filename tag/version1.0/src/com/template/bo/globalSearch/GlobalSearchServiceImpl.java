package com.template.bo.globalSearch;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.template.dao.ProductDao;
import com.template.dao.characteristicDataDao.CharProductRelationsDao;
import com.template.dao.tag.TagDao;
import com.template.dao.tag.TagProductRelationsDao;
import com.template.form.CategoryForm;
import com.template.form.CharacteristicDataForm;
import com.template.form.CharacteristicDetails;
import com.template.form.CharacteristicForm;
import com.template.form.Manufacturer;
import com.template.form.PriceRangeForm;
import com.template.form.ProductDetails;
import com.template.form.SearchForm;
import com.template.form.SubCategoryForm;
import com.template.form.TagForm;
import com.template.vo.CategoryVo;
import com.template.vo.CharProductRelationVO;
import com.template.vo.CharacteristicDataVO;
import com.template.vo.ProductImages;
import com.template.vo.ProductVO;
import com.template.vo.SubCategoryVO;
import com.template.vo.TagProductRelationVO;
import com.template.vo.TagVO;

public class GlobalSearchServiceImpl implements GlobalSearchService{
	
	
	public ProductDao getProductDao() {
		return productDao;
	}





	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}



    public TagDao getTagDao() {
		return tagDao;
	}





	public void setTagDao(TagDao tagDao) {
		this.tagDao = tagDao;
	}




	public CharProductRelationsDao getCharProductRelationsDao() {
		return charProductRelationsDao;
	}





	public void setCharProductRelationsDao(
			CharProductRelationsDao charProductRelationsDao) {
		this.charProductRelationsDao = charProductRelationsDao;
	}




	CharProductRelationsDao charProductRelationsDao;
	
	




	TagDao tagDao;
	
	TagProductRelationsDao tagProductRelationsDao;

	ProductDao productDao;

	
	
	
	public TagProductRelationsDao getTagProductRelationsDao() {
		return tagProductRelationsDao;
	}





	public void setTagProductRelationsDao(
			TagProductRelationsDao tagProductRelationsDao) {
		this.tagProductRelationsDao = tagProductRelationsDao;
	}





	public List<TagForm> retrieveTagsBySearch(String searchTerm){
		
		List<TagVO> tags = tagDao.search(searchTerm, "name");
		
	List<TagForm> tagsForm = new ArrayList<TagForm>();
		
		
		for (TagVO TagVO : tags) {
			
			TagForm tagForm = new TagForm();
			tagForm.setTagId(TagVO.getId());
			tagForm.setName(TagVO.getName());
			
			
			
			
			tagsForm.add(tagForm);
			
		}
		
		return tagsForm;
		
	
	}
	
	public SearchForm screeningByCategory(long tagId){
		
	SearchForm searchForm  = new SearchForm();
	
	List<ProductDetails> prodDetailsList = new ArrayList<ProductDetails>();
	
	HashMap<Long,CategoryForm> categories = new 	HashMap<Long,CategoryForm>();
		
		List<TagProductRelationVO> relations = tagProductRelationsDao.findTagProductRelationVOByTagId(tagId);
		
		for (TagProductRelationVO relationVO : relations) {
			ProductVO productVO = relationVO.getProductVO();
			ProductDetails prodDetails = new ProductDetails();
			prodDetails.setName(productVO.getName());
			prodDetails.setId(productVO.getProductId());
			prodDetails.setPrice(productVO.getPrice());
			prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
			prodDetails.setAvailability(productVO.getAvailability());
			prodDetails.setProducer(productVO.getProducer());
			
			SubCategoryVO subCatVO = productVO.getSubCategoryVO();
			
			CategoryVo catVO = productVO.getCategoryVo();
			
			CategoryForm categoryForm = new CategoryForm();
			
			SubCategoryForm subCatForm = new SubCategoryForm();
			
			subCatForm.setSubCategoryId(subCatVO.getSubCategoryId());
			
			subCatForm.setSubCategoryName(subCatVO.getSubCategoryName());
			
			categoryForm.setName(catVO.getName());
			categoryForm.setId(catVO.getCategoryId());
			
			if(categories.containsKey(categoryForm.getId())){
				CategoryForm tempCatVO = categories.get(categoryForm.getId());
				
				tempCatVO.getSubCategoriesMap().put(subCatForm.getSubCategoryId(), subCatForm);
			}else{
				categoryForm.getSubCategoriesMap().put(subCatForm.getSubCategoryId(), subCatForm);
				categories.put(categoryForm.getId(), categoryForm);
			}
			
			
			for (ProductImages productImage : productVO.getProductsImages()) {
				if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
					prodDetails.setImagePath(productImage.getImageName());
				
			}
			
			Set<CharProductRelationVO> characteristicDatas = productVO.getCharProductRelations();
			
			for (CharProductRelationVO relationCharVO : characteristicDatas) {
			
				CharacteristicDataVO characteristicDataVO = relationCharVO.getCharVO();
				if(characteristicDataVO.getCharVO().isChecked()==true){
					CharacteristicDetails charDetails = new CharacteristicDetails();
					charDetails.setName(characteristicDataVO.getCharVO().getName());
					charDetails.setValue(characteristicDataVO.getData());
					
					prodDetails.getCharacteristicDetails().add(charDetails);
				}
			
			}
			
			prodDetailsList.add(prodDetails);
		}
		
		searchForm.setProducts(prodDetailsList);
		
		searchForm.setCategories(categories);
		
	
		
		return searchForm;
		
	}
	
	
	private List<PriceRangeForm> createPriceFilter(List<ProductDetails> prodDetailsList){
		
		List<PriceRangeForm> priceRanges = new ArrayList<PriceRangeForm>();
		
		int lowestPrice =0;
		
		int highestPrice = 0;
		
		for (ProductDetails productDetails : prodDetailsList) {
			
			if(productDetails.getPrice().intValue()<lowestPrice)
				lowestPrice=productDetails.getPrice().intValue();
			
			
			if(productDetails.getPrice().intValue()>highestPrice)
				highestPrice=productDetails.getPrice().intValue();
				
			
			
		}
		
		if (highestPrice>25){
			PriceRangeForm priceRangeForm = new PriceRangeForm();
			priceRangeForm.setToRange(50);
			priceRangeForm.setFromRange(25);
			priceRangeForm.setId(1);
			priceRanges.add(priceRangeForm);
			
		}
		
		if (highestPrice>50){
			PriceRangeForm priceRangeForm = new PriceRangeForm();
			priceRangeForm.setToRange(100);
			priceRangeForm.setFromRange(50);
			priceRangeForm.setId(2);
			priceRanges.add(priceRangeForm);
		}
		
		if (highestPrice>100){
			PriceRangeForm priceRangeForm = new PriceRangeForm();
			priceRangeForm.setToRange(200);
			priceRangeForm.setFromRange(100);
			priceRangeForm.setId(3);
			priceRanges.add(priceRangeForm);
		}
		
		return priceRanges;
			
	}
	
	
	
	
	/* 
	 * Metodo che ricerca tutti i prodotti per tag e successivamente
	 * conta le occorrenze delle caratteristiche 
	 */
	public SearchForm liveSearch(long tagId,int subCategoryId){
		
		SearchForm searchForm  = new SearchForm();
		
		List<TagProductRelationVO> relations = tagProductRelationsDao.findTagProductRelationVOByTagId(tagId);
		
		
		List<ProductDetails> prodDetailsList = new ArrayList<ProductDetails>();
		HashMap<String,Manufacturer> manufacturers = new 	HashMap<String,Manufacturer>();
		
		HashMap <Integer, CharacteristicForm> chars = new HashMap<Integer, CharacteristicForm>();
		
		for (TagProductRelationVO relationVO : relations) {
			
			
			
			ProductVO productVO = relationVO.getProductVO();
			
			if(productVO.getSubCategoryVO().getSubCategoryId()==subCategoryId){
				
			
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
			
			Set<CharProductRelationVO> characteristicDatas = productVO.getCharProductRelations();
			
			for (CharProductRelationVO relationCharVO : characteristicDatas) {
			
				CharacteristicDataVO characteristicDataVO = relationCharVO.getCharVO();
				
					CharacteristicDetails charDetails = new CharacteristicDetails();
					charDetails.setName(characteristicDataVO.getCharVO().getName());
					charDetails.setValue(characteristicDataVO.getData());
					
					prodDetails.getCharacteristicDetails().add(charDetails);
				
			
			}
			
			buildChars(chars,productVO.getCharProductRelations());
			
			Manufacturer manufacturer = new Manufacturer();
			
			manufacturer.setManufacturerName(prodDetails.getProducer());
			
			manufacturers.put(prodDetails.getProducer(),manufacturer);
			
			prodDetailsList.add(prodDetails);
			
			}
			}
			
		searchForm.setCharacteristics(chars);
		
		searchForm.setProducts(prodDetailsList);
		
		searchForm.setManufacturers(manufacturers);
		
		searchForm.setPriceRanges(createPriceFilter(prodDetailsList));
		
		return searchForm;
		
		
	}
	
	/**
	 * Method that groups all the characteristics contained in a list of products
	 * and for every characteristic lists all the characteristic data and counts the occurrencies
	 * of every datainstance present in the list of products that is the result of the search.
	 * @param chars
	 * @param charDataRelations
	 */
	private void buildChars(HashMap<Integer,CharacteristicForm> chars, Set<CharProductRelationVO> charDataRelations){
		
		for (CharProductRelationVO charProductRelationVO : charDataRelations) {
			CharacteristicDataVO charDataVO= charProductRelationVO.getCharVO();
			
			if(chars.containsKey(new Integer(charDataVO.getCharVO().getCharacteristicId()))){
				HashMap<Integer,CharacteristicDataForm> charDatas = ((CharacteristicForm)chars.get(charDataVO.getCharVO().getCharacteristicId())).getCharDatas();
				
				
				if (charDatas.containsKey(new Integer(charDataVO.getId()))){
					charDatas.get(new Integer(charDataVO.getId())).setCount((
							charDatas.get(new Integer(charDataVO.getId())).getCount())+1);
				}else
				{
					CharacteristicDataForm charDataForm = new CharacteristicDataForm(charDataVO.getId(),charDataVO.getData());
					
					charDataForm.setCount(1);
					
					charDatas.put(new Integer(charDataForm.getCharDataId()), charDataForm);
				}
					
				
			}else
			{
				CharacteristicForm form  = new CharacteristicForm(charDataVO.getCharVO().getCharacteristicId(), charDataVO.getCharVO().getName());
				
				CharacteristicDataForm charDataForm =  new CharacteristicDataForm(charDataVO.getId(),charDataVO.getData()); 
				
				charDataForm.setCount(1);
				
				form.getCharDatas().put(charDataVO.getId(), charDataForm);
				
				chars.put(new Integer(charDataVO.getCharVO().getCharacteristicId()),form);
				
				
			}
				
			
		
			
		}
		
		
	}
	
	
	public SearchForm filterSearch(Integer[] charDataId, int priceRange,long tagId,int subCategoryId){
		
		SearchForm searchForm = new SearchForm();
		
		List<ProductDetails> prodDetailsList = new ArrayList<ProductDetails>();
		
		 List<ProductVO> products =charProductRelationsDao.filteredSearch(charDataId, 20, 50, true, tagId, subCategoryId);
		 
		 List<ProductVO> filteredProducts =new ArrayList<ProductVO>();
		 
		 if(charDataId[0]!=null){
			 for (ProductVO productVO : products) {
				 
				 Set<CharProductRelationVO> relations =productVO.getCharProductRelations();
				 
				int counter = 0;
				 
				 for (CharProductRelationVO charProductRelationVO : relations) {
					 
					
					
					 for (int i=0; i<charDataId.length;i++){
						 if(charProductRelationVO.getCharVO().getId()==charDataId[i]){
							 counter++;
							 
						 }
					 
					 }
					 
					
				}
				 
				 if (counter == charDataId.length)
					 filteredProducts.add(productVO);
				 
			}
		 }else{
			 filteredProducts = products;
		 }
		 HashMap <Integer, CharacteristicForm> chars = new HashMap<Integer, CharacteristicForm>();
		 
		 for (ProductVO productVO : filteredProducts) {
			 
			
			 
			 ProductDetails prodDetails = new ProductDetails();
				prodDetails.setName(productVO.getName());
				prodDetails.setId(productVO.getProductId());
				prodDetails.setAvailability(productVO.getAvailability());
				prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
				prodDetails.setDescription(productVO.getDescription());
				prodDetails.setPrice(productVO.getPrice());
				prodDetails.setProducer(productVO.getProducer());
				prodDetails.setSubCategoryId(productVO.getSubCategoryVO().getSubCategoryId());
				
				
				for (ProductImages productImage : productVO.getProductsImages()) {
					if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
						prodDetails.setImagePath(productImage.getImageName());
					
				}
				
				buildChars(chars,productVO.getCharProductRelations());
			
				prodDetailsList.add(prodDetails);
				
		}
		 
		 searchForm.setCharacteristics(chars);
		 
		 searchForm.setProducts(prodDetailsList);
		
		return 	searchForm;
	
		
	}
	
	
	public void manualIndexing(){
		
		productDao.fullIndexing();
	}
	
	
}
