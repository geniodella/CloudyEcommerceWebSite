package com.template.bo.virtualCart;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.RandomStringUtils;

import com.template.dao.ProductDao;
import com.template.dao.order.OrderDao;
import com.template.dao.virtualCart.CheckoutDao;
import com.template.dao.virtualCart.VirtualCartDao;
import com.template.dao.virtualCart.VirtualCartProductRelationsDao;
import com.template.form.CharacteristicDetails;
import com.template.form.CheckAvailabilitesForm;
import com.template.form.OrderForm;
import com.template.form.ProductDetails;
import com.template.vo.CharProductRelationVO;
import com.template.vo.CharacteristicDataVO;
import com.template.vo.CheckoutVO;
import com.template.vo.CustomerVO;
import com.template.vo.OrderVO;
import com.template.vo.ProductImages;
import com.template.vo.ProductVO;
import com.template.vo.VirtualCartProductRelationVO;
import com.template.vo.VirtualCartVO;

public class VirtualCartServiceImpl implements VirtualCartService {
	
	VirtualCartDao virtualCartDao;
	
	OrderDao orderDao;
	
	public OrderDao getOrderDao() {
		return orderDao;
	}



	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}



	public CheckoutDao getCheckoutDao() {
		return checkoutDao;
	}



	public void setCheckoutDao(CheckoutDao checkoutDao) {
		this.checkoutDao = checkoutDao;
	}

	CheckoutDao checkoutDao;
	
	public VirtualCartProductRelationsDao getVirtualCartProductRelationsDao() {
		return virtualCartProductRelationsDao;
	}



	public void setVirtualCartProductRelationsDao(
			VirtualCartProductRelationsDao virtualCartProductRelationsDao) {
		this.virtualCartProductRelationsDao = virtualCartProductRelationsDao;
	}

	ProductDao productDao;
	
	/**
	 * 
	 */
	VirtualCartProductRelationsDao virtualCartProductRelationsDao;
	


	public VirtualCartDao getVirtualCartDao() {
		return virtualCartDao;
	}



	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	/**
	 * findCategoryById
	 * 
	 * @param id
	 *            int
	 * @return VirtualCartVO
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public VirtualCartVO findVirtualCartById(final int id) {
		return virtualCartDao.findVirtualCartVOById(id);
	}

	/**
	 * getAllVirtualCartVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public List getAllVirtualCartVOs(int size, int page) {
		return virtualCartDao.getAllVirtualCartVOs(size,page);
	}
	
	
	/**
	 * getAllVirtualCartVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public List getAllVirtualCartVOs() {
		return virtualCartDao.getAllVirtualCartVOs();
	}

	/**
	 * insertVirtualCartVO
	 * 
	 * @param virtualCartVo
	 *            VirtualCartVO
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void insertVirtualCartVO(final VirtualCartVO virtualCartVo) {
		virtualCartDao.insertVirtualCartVO(virtualCartVo);
	}

	
	public List<ProductDetails> retrieveProducts(VirtualCartVO virtualCartVO){
		
		
		virtualCartVO = virtualCartDao.mergeVirtualCart(virtualCartVO);
		
		List<VirtualCartProductRelationVO> products = virtualCartVO.getVirtualCartProductRelations();
		List<ProductDetails> prodDetailsList = new ArrayList<ProductDetails>();
		
		if (null != products){
		for (VirtualCartProductRelationVO relationVO : products) {
			ProductDetails productDetails = new ProductDetails();
			productDetails.setName(relationVO.getProductVO().getName());
			productDetails.setId(relationVO.getProductVO().getProductId());
			productDetails.setPrice(relationVO.getProductVO().getPrice());
			productDetails.setAvailabilityTime(relationVO.getProductVO().getAvailabilityTime());
			productDetails.setAvailability(relationVO.getProductVO().getAvailability());
			productDetails.setProducer(relationVO.getProductVO().getProducer());
			productDetails.setQuantity(relationVO.getProductQuantity());
			productDetails.setSubCategoryId(relationVO.getProductVO().getSubCategoryVO().getSubCategoryId());
			
			
			for (ProductImages productImage : relationVO.getProductVO().getProductsImages()) {
				if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
					productDetails.setImagePath(productImage.getImageName());
				
			}
			
			prodDetailsList.add(productDetails);
			
			Set<CharProductRelationVO> characteristicDatas = relationVO.getProductVO().getCharProductRelations();
			
			for (CharProductRelationVO charRelationVO : characteristicDatas) {
			
				CharacteristicDataVO characteristicDataVO = charRelationVO.getCharVO();
				
				if(characteristicDataVO.getCharVO().isChecked()==true){
					CharacteristicDetails charDetails = new CharacteristicDetails();
					charDetails.setName(characteristicDataVO.getCharVO().getName());
					charDetails.setValue(characteristicDataVO.getData());
					
					productDetails.getCharacteristicDetails().add(charDetails);
				}
			
			}
			
			
		}
		
		}
	
		return prodDetailsList;
	}
	
	
	/**
	 * removeVirtualCartVO
	 * 
	 * @param virtualCartVo
	 *            VirtualCartVO
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void removeVirtualCartVO(final VirtualCartVO virtualCartVo) {
		virtualCartDao.removeVirtualCartVO(virtualCartVo);
	}

	/**
	 * updateVirtualCartVO
	 * 
	 * @param virtualCartVo
	 *            VirtualCartVO
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void updateVirtualCartVO(final VirtualCartVO virtualCartVo) {
		virtualCartDao.updateVirtualCartVO(virtualCartVo);
	}

	public void setVirtualCartDao(final VirtualCartDao virtualCartDao) {
		this.virtualCartDao = virtualCartDao;
	}
	
	
	 public VirtualCartVO findVirtualCartVOByCustomer( final int customerId){
		return  virtualCartDao.findVirtualCartVOByCustomer(customerId);
	 }
	 
	 public ProductVO insertProductIntoCart(int productId, VirtualCartVO virtualCartVO, long productQuantity){
		 
		 ProductVO productVO = productDao.findProductVOById(productId);
		 
		 VirtualCartProductRelationVO relation = new VirtualCartProductRelationVO();
		 
		 relation.getId().setProductId(productVO.getProductId());
		 
		 relation.getId().setVirtualCartId(virtualCartVO.getVirtualCartId());

		
		 
		 relation.setProductQuantity(new Long(1L));
		 
		VirtualCartProductRelationVO productRelationVO =  virtualCartProductRelationsDao.findVirtualCartProductRelationVOByProductId(productId, virtualCartVO.getVirtualCartId());
		 
		
		if (productRelationVO ==null)
		 virtualCartProductRelationsDao.insertVirtualCartProductRelationVO(relation);
		 
	
		 
		 return productVO;
		 
	 }
	 
 public void  removeProductIntoCart(int productId, VirtualCartVO virtualCartVO){
		 
		 
		 
		 VirtualCartProductRelationVO relation = virtualCartProductRelationsDao.findVirtualCartProductRelationVOByProductId(productId, virtualCartVO.getVirtualCartId());
		 
	
		 virtualCartProductRelationsDao.removeVirtualCartProductRelationVO(relation);
		 
	
		
		 
		 
		
		 
	 }
	 
	 
	 public void refreshVirtualCart(VirtualCartVO virtualCartVO){
		 virtualCartDao.refreshVirtualCart(virtualCartVO);
	 }
	 
	 
	 public double calculatePartialPrice(List<ProductDetails> prodDetails){
		 
		 double partialPrice =0.0;
		 
		 for (ProductDetails productDetails : prodDetails) {
			
			 partialPrice += productDetails.getPrice().doubleValue();
		}
		 
		 return partialPrice;
		 
	 }
	 
	 public OrderVO lockProductQuantities(CustomerVO customerVO, VirtualCartVO virtualCartVO ){
		 
		 virtualCartVO = virtualCartDao.mergeVirtualCart(virtualCartVO);
		
		 OrderVO orderVO = new OrderVO();
		 
		 orderDao.insertOrderVO(orderVO);
			
			List<VirtualCartProductRelationVO> relations = virtualCartVO.getVirtualCartProductRelations();
			
			String uuid = RandomStringUtils.randomAlphanumeric(20).toUpperCase();
			
		 
		 for (VirtualCartProductRelationVO virtualCartProductRelationVO : relations) {
			ProductVO productVO = virtualCartProductRelationVO.getProductVO();
			
			// check if the product is available otherwise it gets flagged 
			// so that it can be excluded from the calculations
			if(!productVO.getAvailability().equals("yes")){
				virtualCartProductRelationVO.setCheckoutFlag(false);
				
				
			}else
			{
				
				virtualCartProductRelationVO.setCheckoutFlag(true);
			productVO.setQuantity(new Long((productVO.getQuantity()-virtualCartProductRelationVO.getProductQuantity())).intValue());
			
			if (productVO.getQuantity()==0)
				productVO.setAvailability("arriving");
			
			CheckoutVO checkoutVO = new CheckoutVO();
			
			checkoutVO.setCheckoutId(uuid);
			
			checkoutVO.setCustomerVO(customerVO);
			
			checkoutVO.setOrderVO(orderVO);
			
			checkoutVO.setProductVO(productVO);
			
			 java.util.Date date= new java.util.Date();
			
			checkoutVO.setTimestamp(date);
			
			checkoutVO.setQuantity(virtualCartProductRelationVO.getProductQuantity().intValue());
			
		productDao.updateProductVO(productVO);
			
			//productDao.updateProductVO(virtualCartProductRelationVO.getProductVO());
			
			checkoutDao.insertCheckoutVO(checkoutVO);
			
			}
		}
		 
		 return orderVO;
		 
	 }
	 
	 
	 public CheckAvailabilitesForm checkProductAvailabilities(VirtualCartVO virtualCartVO ){
		 
		 CheckAvailabilitesForm checkAvailabilitesForm =new CheckAvailabilitesForm();
		 
		 List<VirtualCartProductRelationVO> relations = virtualCartVO.getVirtualCartProductRelations();

		 List<ProductDetails> products = new ArrayList<ProductDetails>();
		 
		 boolean productEmpty=true;
			
		 
		 for (VirtualCartProductRelationVO virtualCartProductRelationVO : relations) {
			ProductVO productVO = virtualCartProductRelationVO.getProductVO();
			
			ProductVO updatedProduct = productDao.findProductVOById(productVO.getProductId());
			
			if (updatedProduct.getQuantity()<virtualCartProductRelationVO.getProductQuantity() && updatedProduct.getAvailability().equals("yes")){
				ProductDetails product = new ProductDetails();
				product.setProductId(productVO.getProductId());
				product.setName(productVO.getName());
				products.add(product);
			}
			
			if (updatedProduct.getAvailability().equals("yes"))
				productEmpty =false;
				
			
		
			
		 }
		 
			checkAvailabilitesForm.setProductDetails(products);
			
			checkAvailabilitesForm.setEmptyProducts(productEmpty);
		 
		 return checkAvailabilitesForm;
		 
	 }
	 
	 public int changeQuantity(int productId, long productQuantity, VirtualCartVO virtualCartVO){
		 
		 virtualCartVO = virtualCartDao.mergeVirtualCart(virtualCartVO);
		 
		List<VirtualCartProductRelationVO>  relations = virtualCartVO.getVirtualCartProductRelations();
		
		for (VirtualCartProductRelationVO virtualCartProductRelationVO : relations) {
			if (virtualCartProductRelationVO.getProductVO().getProductId() == productId){
				
				if(virtualCartProductRelationVO.getProductVO().getQuantity()<productQuantity){
					return virtualCartProductRelationVO.getProductVO().getQuantity();
				}else
				{
				virtualCartProductRelationVO.setProductQuantity(productQuantity);
				
				virtualCartProductRelationsDao.updateVirtualCartProductRelationVO(virtualCartProductRelationVO);
				return 0;
				}
			}
		}
		
		return 0;
		
		 
	 }
 
	 public OrderForm retrievePrice(VirtualCartVO virtualCartVO){
						
			virtualCartVO = virtualCartDao.mergeVirtualCart(virtualCartVO);
			
			List<VirtualCartProductRelationVO> products = virtualCartVO.getVirtualCartProductRelations();
						
			BigDecimal totalPrice = new BigDecimal("0.0");
			BigDecimal totalPriceWithTaxes = new BigDecimal("0.0");
			
			OrderForm orderForm= new OrderForm();
			
			for (VirtualCartProductRelationVO relationVO : products) {
				
			    if (relationVO.getProductVO().getAvailability().equals("yes")){
				
				
				BigDecimal productPrice = relationVO.getProductVO().getPrice();

				BigDecimal productVat = relationVO.getProductVO().getVat();
				
				totalPriceWithTaxes = totalPriceWithTaxes.add(productPrice.multiply(new BigDecimal(relationVO.getProductQuantity())));

				totalPrice = totalPrice.add(productPrice.subtract(productPrice.multiply(productVat.divide(new BigDecimal("100")))).multiply(new BigDecimal(relationVO.getProductQuantity())));
			
				orderForm.setTotalPrice(totalPrice);
				orderForm.setTotalPriceWithTaxes(totalPriceWithTaxes);
			    }
			}		
			return orderForm;
		}
	
}
