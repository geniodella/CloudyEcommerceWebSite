package com.template.bo.deliveryCompany;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.template.dao.deliveryCompany.DeliveryCompanyDao;
import com.template.dao.priceRange.PriceRangeDao;
import com.template.form.DeliveryStrategyCompanyForm;
import com.template.form.DeliveryStrategyForm;
import com.template.form.ProductDetails;
import com.template.form.ShippingForm;
import com.template.vo.DeliveryCompanyVO;
import com.template.vo.PriceRangeVO;
import com.template.vo.ProductVO;
import com.template.vo.VirtualCartProductRelationVO;

public class DeliveryCompanyServiceImpl  implements DeliveryCompanyService{
	
	

	DeliveryCompanyDao deliveryCompanyDao;
	
	PriceRangeDao priceRangeDao;

	
		
	

	
	public PriceRangeDao getPriceRangeDao() {
		return priceRangeDao;
	}

	public void setPriceRangeDao(PriceRangeDao priceRangeDao) {
		this.priceRangeDao = priceRangeDao;
	}

	public DeliveryCompanyVO findDeliveryCompanyVOById(final long id){
		return deliveryCompanyDao.findDeliveryCompanyById(id);
	}
	
	public DeliveryStrategyForm findDeliveryCompanyFormById(final long id){
		
		DeliveryStrategyForm form = new DeliveryStrategyForm();
		
		DeliveryCompanyVO deliveryCompanyVO =  deliveryCompanyDao.findDeliveryCompanyById(id);
		
		form.setDeliveryStrategyId(deliveryCompanyVO.getId());
		
		form.setDeliveryStrategyName(deliveryCompanyVO.getStrategyName());
		
		form.setMaximumDeliveryRange(deliveryCompanyVO.getUpperBoundTime());
		
		form.setMinimumDeliveryRange(deliveryCompanyVO.getLowerBoundTime());
		
		form.setDeliveryCompanyName(deliveryCompanyVO.getCompanyName());
		
		
		return form;
	}
	
	public List<DeliveryCompanyVO> getAllDeliveryCompanyVOs(final int pageSize, final int pageNumber){
		return deliveryCompanyDao.getAllDeliveryCompanyVOs(pageSize, pageNumber);
	}
	
	
	public HashMap<String,DeliveryStrategyCompanyForm> getAllDeliveryCompanyVOs(){
		
	
		
		HashMap<String,DeliveryStrategyCompanyForm> strategyCompanies = new HashMap<String, DeliveryStrategyCompanyForm>();
		
		List<DeliveryCompanyVO> strategies =  deliveryCompanyDao.getAllDeliveryCompanyVOs();
		
		
		
		for (DeliveryCompanyVO deliveryCompanyVO : strategies) {
			
	DeliveryStrategyForm strategyForm = new DeliveryStrategyForm();
			
			
			strategyForm.setDeliveryStrategyId(deliveryCompanyVO.getId());
			
			strategyForm.setDeliveryStrategyName(deliveryCompanyVO.getStrategyName());
			
			strategyForm.setMaximumDeliveryRange(deliveryCompanyVO.getUpperBoundTime());
			
			strategyForm.setMinimumDeliveryRange(deliveryCompanyVO.getLowerBoundTime());
			
			if (!strategyCompanies.containsKey(deliveryCompanyVO.getCompanyName())){
			   DeliveryStrategyCompanyForm deliveryCompany = new DeliveryStrategyCompanyForm();
			   deliveryCompany.setDeliveryCompanyName(deliveryCompanyVO.getCompanyName());
			  deliveryCompany.getDeliveryStrategies().put(strategyForm.getDeliveryStrategyId(), strategyForm);
			  strategyCompanies.put(deliveryCompanyVO.getCompanyName(), deliveryCompany);
				
			}else{
				DeliveryStrategyCompanyForm deliveryStrategy = (DeliveryStrategyCompanyForm) strategyCompanies.get(deliveryCompanyVO.getCompanyName());
				
				deliveryStrategy.getDeliveryStrategies().put(deliveryCompanyVO.getId(), strategyForm);
			}
			
		
			
	
			
			
		}
		
		return strategyCompanies;
	}

	
	public void insertDeliveryCompanyVO(final DeliveryCompanyVO deliveryCompanyVO, 
			String[] fromRange, String[] toRange,String[] price){
		
		deliveryCompanyDao.insertDeliveryCompanyVO(deliveryCompanyVO);
		
		if(toRange.length !=0 && fromRange.length!=0)
		for (int i = 0; i < toRange.length; i++) {
			PriceRangeVO priceRangeVO = new PriceRangeVO();
			
			priceRangeVO.setDeliveryCompanyVO(deliveryCompanyVO);
			priceRangeVO.setFromRange(Double.parseDouble(fromRange[i]));
			priceRangeVO.setToRange(Double.parseDouble(toRange[i]));
			priceRangeVO.setPrice(new BigDecimal(price[i]));
			
			priceRangeDao.insertPriceRangeVO(priceRangeVO);
			
			
		}
	}

	public void removeDeliveryCompanyVO(final DeliveryCompanyVO deliveryCompanyVO){
		deliveryCompanyDao.removeDeliveryCompanyVO(deliveryCompanyVO);
	}
	
	public void updateDeliveryCompanyVO(final DeliveryCompanyVO deliveryCompanyVO){
		deliveryCompanyDao.updateDeliveryCompanyVO(deliveryCompanyVO);
	}
	public void setDeliveryCompanyDao(final DeliveryCompanyDao deliveryCompanyDao){
		this.deliveryCompanyDao=deliveryCompanyDao;
	}
	
	public int getNumberDeliveryCompanies() {
		return deliveryCompanyDao.getNumberDeliveryCompanies();
	}
	
	public List<DeliveryCompanyVO> search ( final String searchTerm,final String field){
		//return deliveryCompanyDao.search(searchTerm, field);
		return null;
	}
	
	
	
	public List<PriceRangeVO> getPriceRangesByDeliveryCompany(long deliveryCompanyId){
		return priceRangeDao.getAllPriceRangesByDeliveryCompany(deliveryCompanyId);
	}

	
	public void updatePriceRanges(final DeliveryCompanyVO deliveryCompanyVO, 
			String[] fromRange, String[] toRange,String[] price,String[] priceRangeId){
		
		deliveryCompanyDao.updateDeliveryCompanyVO(deliveryCompanyVO);
		
		for (int i = 0; i < toRange.length; i++) {
			PriceRangeVO priceRangeVO = new PriceRangeVO();
			DeliveryCompanyVO deliveryVO = new DeliveryCompanyVO();
			deliveryVO.setId(deliveryCompanyVO.getId());
			
			priceRangeVO.setFromRange(Double.parseDouble(fromRange[i]));
			priceRangeVO.setToRange(Double.parseDouble(toRange[i]));
			priceRangeVO.setPrice(new BigDecimal(price[i]));
			priceRangeVO.setId(Long.parseLong(priceRangeId[i]));
			priceRangeVO.setDeliveryCompanyVO(deliveryVO);
			
			priceRangeDao.updatePriceRangeVO(priceRangeVO);
			
			
		}
		
	
	}
	
	/**
	 * Method that splits the products if 
	 * there are products not immediately available
	 * @param products
	 * @return
	 */
	public List<ShippingForm> splitShipping(List<VirtualCartProductRelationVO> products, int splittingDecision){
		

		List<ShippingForm> shippings = new ArrayList<ShippingForm>();
		
		// the faster shipping
		ShippingForm xShipping = new ShippingForm();
		
		//the customer chose not to split the order
		// the products are put only in the xShipping
		if (splittingDecision==0 || products.size() ==1){
			
for (VirtualCartProductRelationVO relationVO : products) {
	
			
				// if the product is not in the cart it 
				// doesn't be added
				if (relationVO.getCheckoutFlag()){
				
				
				
				ProductVO productVO = relationVO.getProductVO();
				
				ProductDetails prodDetails = new ProductDetails();
				prodDetails.setName(productVO.getName());
				prodDetails.setId(productVO.getProductId());
				prodDetails.setPrice(productVO.getPrice());
				prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
				prodDetails.setAvailability(productVO.getAvailability());
				prodDetails.setProducer(productVO.getProducer());
				prodDetails.setWeight(productVO.getWeight());
				prodDetails.setQuantity(relationVO.getProductQuantity());
				prodDetails.setQuantitySold((relationVO.getProductQuantity().intValue()));
				
				// here i make a check
				// if the product quantity is more that zero the product will go
				// in the xshipping otherwise is the product don't go over the threshold
				// the product will go in the xshipping but if it goes over the threshold
				// the product is a good candidate to be shipped in the yshipping
				
					
						xShipping.getProducts().add(prodDetails);
				
			}
}

			shippings.add(xShipping);
			return shippings;
			
		}
		
		// the slower shipping
		ShippingForm yShipping = new ShippingForm();
		
		List<Integer> availabilietes = new ArrayList<Integer>();
		
		int splitThreshold;
		
		boolean checkAvailability = false;
		
		for (VirtualCartProductRelationVO relationVO : products) {
			
			if (relationVO.getCheckoutFlag()){
		
			ProductVO productVO = relationVO.getProductVO();
			
			
			// here we add to the availability 
			// array all the availability times of the products			
			availabilietes.add(productVO.getAvailabilityTime());
			}
		}
		
	
		Integer[] availabilitesArray = (Integer[]) availabilietes.toArray(new Integer[availabilietes.size()]);
		
		int biggest = 0;
		
		for (int i = 0; i < availabilitesArray.length; i++) {
		
			if(biggest<=availabilitesArray[i].intValue())
			biggest = availabilitesArray[i].intValue();
		}
		
		
	
		// here we use an euristic and we make the assumption
		// that the split threshold will be 1/3 of the biggest product availability time
		splitThreshold = biggest/3;
		
		
		// ok here we make the assumption that
		// if the biggest avaialibity time is bigger than 5 
		// we are going to split the order in two orders
		if (biggest>5)
		{
			for (VirtualCartProductRelationVO relationVO : products) {
				
				if (relationVO.getCheckoutFlag()){
				
				checkAvailability = true;
				
				ProductVO productVO = relationVO.getProductVO();
				
				ProductDetails prodDetails = new ProductDetails();
				prodDetails.setName(productVO.getName());
				prodDetails.setId(productVO.getProductId());
				prodDetails.setPrice(productVO.getPrice());
				prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
				prodDetails.setAvailability(productVO.getAvailability());
				prodDetails.setProducer(productVO.getProducer());
				prodDetails.setWeight(productVO.getWeight());
				prodDetails.setQuantity(relationVO.getProductQuantity());
				
				// here i make a check
				// if the product quantity is more that zero the product will go
				// in the xshipping otherwise is the product don't go over the threshold
				// the product will go in the xshipping but if it goes over the threshold
				// the product is a good candidate to be shipped in the yshipping
				
					if(productVO.getAvailabilityTime()>splitThreshold){
						yShipping.getProducts().add(prodDetails);
					}else{
						xShipping.getProducts().add(prodDetails);
					}
				
				
				}
				
			}
			
		}
		
		// the xShipping is added either case
		  // adding the xShipping only if there are products into it
		if (xShipping.getProducts().size()>0)
		shippings.add(xShipping);
	
			
			shippings.add(yShipping);
		
	
		
		
		
		return shippings;
		
	}
	
public List<ShippingForm> checkSplitShipping(List<VirtualCartProductRelationVO> products){
		

		List<ShippingForm> shippings = new ArrayList<ShippingForm>();
		
		// the faster shipping
		ShippingForm xShipping = new ShippingForm();
		
	
		// the products are put only in the xShipping
		if ( products.size() ==1){
			
for (VirtualCartProductRelationVO relationVO : products) {
				
	
				// if the product is not in the cart it 
				// doesn't be added
				if (relationVO.getCheckoutFlag()){
				
				ProductVO productVO = relationVO.getProductVO();
				
				ProductDetails prodDetails = new ProductDetails();
				prodDetails.setName(productVO.getName());
				prodDetails.setId(productVO.getProductId());
				prodDetails.setPrice(productVO.getPrice());
				prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
				prodDetails.setAvailability(productVO.getAvailability());
				prodDetails.setProducer(productVO.getProducer());
				prodDetails.setWeight(productVO.getWeight());
				prodDetails.setQuantity(relationVO.getProductQuantity());
				prodDetails.setQuantitySold((relationVO.getProductQuantity().intValue()));
				
				// here i make a check
				// if the product quantity is more that zero the product will go
				// in the xshipping otherwise is the product don't go over the threshold
				// the product will go in the xshipping but if it goes over the threshold
				// the product is a good candidate to be shipped in the yshipping
				
					
						xShipping.getProducts().add(prodDetails);
				
			}

			}
			shippings.add(xShipping);
			return shippings;
			
		}
		
		
		// the slower shipping
		ShippingForm yShipping = new ShippingForm();
		
		List<Integer> availabilietes = new ArrayList<Integer>();
		
		int splitThreshold;
		
		boolean checkAvailability = false;
		
		for (VirtualCartProductRelationVO relationVO : products) {
			
			
			if (relationVO.getCheckoutFlag()){
		
			ProductVO productVO = relationVO.getProductVO();
			
			
			// here we add to the availability 
			// array all the availability times of the products			
			availabilietes.add(productVO.getAvailabilityTime());
			}
		}
		
	
		Integer[] availabilitesArray = (Integer[]) availabilietes.toArray(new Integer[availabilietes.size()]);
		
		int biggest = 0;
		
		for (int i = 0; i < availabilitesArray.length; i++) {
		
			if(biggest<=availabilitesArray[i].intValue())
			biggest = availabilitesArray[i].intValue();
		}
		
		
	
		// here we use an euristic and we make the assumption
		// that the split threshold will be 1/3 of the biggest product availability time
		splitThreshold = biggest/3;
		
		
		// ok here we make the assumption that
		// if the biggest avaialibity time is bigger than 5 
		// we are going to split the order in two orders
		if (biggest>5)
		{
			for (VirtualCartProductRelationVO relationVO : products) {
				
				if (relationVO.getCheckoutFlag()){
				
				checkAvailability = true;
				
				ProductVO productVO = relationVO.getProductVO();
				
				ProductDetails prodDetails = new ProductDetails();
				prodDetails.setName(productVO.getName());
				prodDetails.setId(productVO.getProductId());
				prodDetails.setPrice(productVO.getPrice());
				prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
				prodDetails.setAvailability(productVO.getAvailability());
				prodDetails.setProducer(productVO.getProducer());
				prodDetails.setWeight(productVO.getWeight());
				prodDetails.setQuantity(relationVO.getProductQuantity());
				
				// here i make a check
				// if the product quantity is more that zero the product will go
				// in the xshipping otherwise is the product don't go over the threshold
				// the product will go in the xshipping but if it goes over the threshold
				// the product is a good candidate to be shipped in the yshipping
				
					if(productVO.getAvailabilityTime()>splitThreshold){
						yShipping.getProducts().add(prodDetails);
					}else{
						xShipping.getProducts().add(prodDetails);
					}
				
				
				}
				
			}
			
		}
		
		// the xShipping is added either case
        // adding the xShipping only if there are products into it
		if (xShipping.getProducts().size()>0)
		shippings.add(xShipping);
		
	
			
			shippings.add(yShipping);
		
	
		
		
		return shippings;
		
	}
	

	
	public double calculateTotalWeight(List<ProductDetails>  prodDetails){
		
		double totalWeight = 0.0;
		
		for (ProductDetails productDetails : prodDetails) {
			
			totalWeight += productDetails.getWeight()*productDetails.getQuantity();
		}
		
		return totalWeight;
	}

}
