package com.template.bo.order;

import java.math.BigDecimal;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.template.bo.invoice.InvoiceService;
import com.template.dao.ProductDao;
import com.template.dao.address.AddressDao;
import com.template.dao.customer.CustomerDao;
import com.template.dao.deliveryCompany.DeliveryCompanyDao;
import com.template.dao.order.OrderDao;
import com.template.dao.order.OrderProductRelationsDao;
import com.template.dao.shipping.ShippingDao;
import com.template.dao.shipping.ShippingProductRelationsDao;
import com.template.dao.virtualCart.CheckoutDao;
import com.template.dao.virtualCart.VirtualCartProductRelationsDao;
import com.template.form.OrderForm;
import com.template.form.ProductDetails;
import com.template.form.ReviewPriceForm;
import com.template.form.ShippingForm;
import com.template.vo.AddressVO;
import com.template.vo.CheckoutVO;
import com.template.vo.CustomerVO;
import com.template.vo.DeliveryCompanyVO;
import com.template.vo.OrderProductRelationVO;
import com.template.vo.OrderStatus;
import com.template.vo.OrderVO;
import com.template.vo.PriceRangeVO;
import com.template.vo.ProductImages;
import com.template.vo.ProductVO;
import com.template.vo.ShippingProductRelationVO;
import com.template.vo.ShippingVO;
import com.template.vo.VirtualCartProductRelationVO;
import com.template.vo.VirtualCartVO;

public class OrderServiceImpl implements OrderService {

	OrderDao orderDao;

	DeliveryCompanyDao deliveryCompanyDao;

	ShippingDao shippingDao;

	AddressDao addressDao;

	public CheckoutDao getCheckoutDao() {
		return checkoutDao;
	}

	public void setCheckoutDao(CheckoutDao checkoutDao) {
		this.checkoutDao = checkoutDao;
	}

	

	public VirtualCartProductRelationsDao getVirtualCartProductRelationsDao() {
		return virtualCartProductRelationsDao;
	}

	public void setVirtualCartProductRelationsDao(
			VirtualCartProductRelationsDao virtualCartProductRelationsDao) {
		this.virtualCartProductRelationsDao = virtualCartProductRelationsDao;
	}



	ProductDao productDao;
	
	CheckoutDao checkoutDao;
	
	VirtualCartProductRelationsDao virtualCartProductRelationsDao;

	ShippingProductRelationsDao shippingProductRelationsDao;

	OrderProductRelationsDao orderProductRelationsDao;

	CustomerDao customerDao;
	
	InvoiceService invoiceServiceBean;
	
	

	public InvoiceService getInvoiceServiceBean() {
		return invoiceServiceBean;
	}

	public void setInvoiceServiceBean(InvoiceService invoiceServiceBean) {
		this.invoiceServiceBean = invoiceServiceBean;
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public ShippingProductRelationsDao getShippingProductRelationsDao() {
		return shippingProductRelationsDao;
	}

	public void setShippingProductRelationsDao(
			ShippingProductRelationsDao shippingProductRelationsDao) {
		this.shippingProductRelationsDao = shippingProductRelationsDao;
	}

	public OrderProductRelationsDao getOrderProductRelationsDao() {
		return orderProductRelationsDao;
	}

	public void setOrderProductRelationsDao(
			OrderProductRelationsDao orderProductRelationsDao) {
		this.orderProductRelationsDao = orderProductRelationsDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public AddressDao getAddressDao() {
		return addressDao;
	}

	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}

	public ShippingDao getShippingDao() {
		return shippingDao;
	}

	public void setShippingDao(ShippingDao shippingDao) {
		this.shippingDao = shippingDao;
	}

	public DeliveryCompanyDao getDeliveryCompanyDao() {
		return deliveryCompanyDao;
	}

	public void setDeliveryCompanyDao(DeliveryCompanyDao deliveryCompanyDao) {
		this.deliveryCompanyDao = deliveryCompanyDao;
	}

	/**
	 * findOrderById
	 * 
	 * @param id
	 *            int
	 * @return OrderVO
	 * @todo Implement this org.annotationmvc.service.OrderService method
	 */
	public OrderVO findOrderById(final int id) {
		return orderDao.findOrderVOById(id);
	}

	public OrderDao getOrderDao() {
		return orderDao;
	}

	/**
	 * getAllOrderVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.OrderService method
	 */
	public List getAllOrderVOs(int size, int page) {
		return orderDao.getAllOrderVOs(size, page);
	}

	/**
	 * getAllOrderVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.OrderService method
	 */
	public List getAllOrderVOs() {
		return orderDao.getAllOrderVOs();
	}

	/**
	 * insertOrderVO
	 * 
	 * @param categoryVo
	 *            OrderVO
	 * @todo Implement this org.annotationmvc.service.OrderService method
	 */
	public void insertOrderVO(final OrderVO categoryVo) {
		orderDao.insertOrderVO(categoryVo);
	}

	/**
	 * removeOrderVO
	 * 
	 * @param categoryVo
	 *            OrderVO
	 * @todo Implement this org.annotationmvc.service.OrderService method
	 */
	public void removeOrderVO(final OrderVO categoryVo) {
		orderDao.removeOrderVO(categoryVo);
	}

	/**
	 * This method checks whether the products in the cart are available or if
	 * the quantities are not available
	 * 
	 * @param products
	 * @return
	 */
	public List<ProductDetails> checkProductAvailabilities(
			List<VirtualCartProductRelationVO> products) {

		List<ProductDetails> outOfStockProducts = new ArrayList<ProductDetails>();

		for (VirtualCartProductRelationVO relationVO : products) {

			ProductVO productVO = relationVO.getProductVO();

			if (relationVO.getProductQuantity() > Integer.parseInt(productVO
					.getAvailability())) {
				ProductDetails prodDetails = new ProductDetails();
				prodDetails.setName(productVO.getName());
				prodDetails.setId(productVO.getProductId());
				prodDetails.setPrice(productVO.getPrice());
				prodDetails
				.setAvailabilityTime(productVO.getAvailabilityTime());
				prodDetails.setAvailability(productVO.getAvailability());
				prodDetails.setProducer(productVO.getProducer());

				outOfStockProducts.add(prodDetails);
			}

		}

		return outOfStockProducts;
	}

	/**
	 * updateOrderVO
	 * 
	 * @param categoryVo
	 *            OrderVO
	 * @todo Implement this org.annotationmvc.service.OrderService method
	 */
	public void updateOrderVO(final OrderVO categoryVo) {
		orderDao.updateOrderVO(categoryVo);
	}

	public void setOrderDao(final OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public void calculatePartialShippingPrice(ShippingForm shippingForm,
			long deliveryStrategyId) {

		List<ProductDetails> prodDetails = shippingForm.getProducts();

		double totalWeight = calculateTotalWeight(prodDetails);

		DeliveryCompanyVO deliveryVO = deliveryCompanyDao
				.findDeliveryCompanyById(deliveryStrategyId);

		Set<PriceRangeVO> ranges = deliveryVO.getPriceRangesVO();

		for (PriceRangeVO priceRangeVO : ranges) {
			double toRange = priceRangeVO.getToRange();

			double fromRange = priceRangeVO.getFromRange();

			if (totalWeight >= fromRange && totalWeight <= toRange) {
				shippingForm.setShippingPrice(priceRangeVO.getPrice());
				break;
			}
		}

	}

	/**
	 * Method that calculates the shipping prices taking the totalweight of the
	 * shippings and comparing with the values of the priceRanges
	 * 
	 * @param shippings
	 * @param deliveryStrategyId
	 */
	public void calculateShippingPrice(List<ShippingForm> shippings,
			long deliveryStrategyId) {

		for (ShippingForm shippingForm : shippings) {

			List<ProductDetails> prodDetails = shippingForm.getProducts();

			double totalWeight = calculateTotalWeight(prodDetails);

			DeliveryCompanyVO deliveryVO = deliveryCompanyDao
					.findDeliveryCompanyById(deliveryStrategyId);

			Set<PriceRangeVO> ranges = deliveryVO.getPriceRangesVO();

			for (PriceRangeVO priceRangeVO : ranges) {
				double toRange = priceRangeVO.getToRange();

				double fromRange = priceRangeVO.getFromRange();

				if (totalWeight >= fromRange && totalWeight <= toRange) {
					shippingForm.setShippingPrice(priceRangeVO.getPrice());
					break;
				}
			}

		}

	}

	public BigDecimal calculateTotalPrice(
			List<VirtualCartProductRelationVO> prodDetails) {

		BigDecimal totalPrice = new BigDecimal("0.0");

		for (VirtualCartProductRelationVO productDetails : prodDetails) {
			
			if (productDetails.getCheckoutFlag()==true){

			BigDecimal productPrice = productDetails.getProductVO().getPrice();

			totalPrice = totalPrice.add(productPrice.multiply(new BigDecimal(
					productDetails.getProductQuantity())));
			}
		}

		return totalPrice;
	}

	public BigDecimal calculateTotalPriceWithoutTaxes(
			List<VirtualCartProductRelationVO> prodDetails) {

		BigDecimal totalPrice = new BigDecimal("0.0");

		for (VirtualCartProductRelationVO productDetails : prodDetails) {
			
			if (productDetails.getCheckoutFlag()){

			BigDecimal productPrice = productDetails.getProductVO().getPrice();

			BigDecimal productVat = productDetails.getProductVO().getVat();

			totalPrice = totalPrice.add(productPrice.subtract(
					productPrice.multiply(productVat.divide(new BigDecimal(
							"100")))

					).multiply(new BigDecimal(productDetails.getProductQuantity())));
			}
		}

		return totalPrice;
	}

	public double calculateTotalWeight(List<ProductDetails> prodDetails) {

		double totalWeight = 0.0;

		for (ProductDetails productDetails : prodDetails) {

			totalWeight += productDetails.getWeight()
					* productDetails.getQuantity();
		}

		return totalWeight;
	}

	public ReviewPriceForm prepareOrderReview(List<ShippingForm> shippings,
			long deliveryStrategyId, List<VirtualCartProductRelationVO> products) {

		ReviewPriceForm reviewPriceForm = new ReviewPriceForm();

		BigDecimal shippingCosts = new BigDecimal(0.0);

		calculateShippingPrice(shippings, deliveryStrategyId);

		// iterate all the shippings to calculate the total
		for (ShippingForm shippingForm : shippings) {
			shippingCosts = shippingCosts.add(shippingForm.getShippingPrice());
		}

		reviewPriceForm.setPartialPrice(calculateTotalPrice(products));

		reviewPriceForm.setTotalPriceWithTaxes(calculateTotalPrice(products)
				.add(shippingCosts));

		reviewPriceForm.setTotalPrice(calculateTotalPriceWithoutTaxes(products)
				.add(shippingCosts));

		reviewPriceForm.setShippingPrice(shippingCosts);

		return reviewPriceForm;

	}

	public OrderVO insertOrder(ReviewPriceForm reviewPriceForm,
			List<ShippingForm> shippings, Integer addressId,
			int deliveryStrategyId, int customerId,OrderVO orderVO) {

		AddressVO addressVO = addressDao.findAddressById(addressId);

		CustomerVO customerVO = customerDao.findCustomerById(customerId);

		

		orderVO.setTotalPrice(reviewPriceForm.getTotalPrice());

		orderVO.setTotalPriceWithTaxes(reviewPriceForm.getTotalPriceWithTaxes());

		orderVO.setCustomerVO(customerVO);

		orderVO.setProductCreation(new Date());

		orderVO.setStatus(OrderStatus.NOTACTIVE);

		 orderDao.updateOrderVO(orderVO);

		for (ShippingForm shippingForm : shippings) {
			ShippingVO shippingVO = new ShippingVO();

			calculateShippingDate(shippingForm, deliveryStrategyId);

			shippingVO.setOrderVO(orderVO);

			shippingVO.setMinimumDeliveryDate(shippingForm
					.getBeginDeliveryTime());

			shippingVO
			.setMaximumDeliveryDate(shippingForm.getEndDeliveryTime());

			shippingVO.setOrderStatus(OrderStatus.HANDLING);

			shippingVO.setAddressVO(addressVO);

			shippingVO.setLastUpdate(new Date());

			calculatePartialShippingPrice(shippingForm, deliveryStrategyId);

			List<ProductDetails> prodDetails = shippingForm.getProducts();

			shippingVO.setShippingPrice(shippingForm.getShippingPrice());

			shippingDao.insertShippingVO(shippingVO);

			for (ProductDetails productDetails : prodDetails) {

				ProductVO productVO = productDao
						.findProductVOById(productDetails.getId());

				ShippingProductRelationVO shippingProdRelation = new ShippingProductRelationVO();

				OrderProductRelationVO orderProductRelation = new OrderProductRelationVO();

				orderProductRelation.getId().setOrderId(orderVO.getOrderId());

				orderProductRelation.getId().setProductId(
						productVO.getProductId());

				orderProductRelation.setQuantitySold(productDetails
						.getQuantitySold());

				orderProductRelationsDao
				.insertOrderProductRelationVO(orderProductRelation);

				shippingProdRelation.getId().setProductId(
						productVO.getProductId());

				shippingProdRelation.getId().setShippingId(
						shippingVO.getShippingId());

				shippingProductRelationsDao
				.insertShippingProductRelationVO(shippingProdRelation);
				
				productDetails.setVat(productVO.getVat());
				productDetails.setUnitaryPrice((productDetails.getPrice()).multiply(new BigDecimal(productDetails.getQuantitySold())));

			}
			shippingForm.setNameState(shippingVO.getAddressVO().getStateVO().getNameState());
			shippingForm.setNameRegion(shippingVO.getAddressVO().getRegionVO().getNameRegion());
			shippingForm.setNameCity(shippingVO.getAddressVO().getCityVO().getNameCity());
			shippingForm.setStreet(shippingVO.getAddressVO().getStreet());
			shippingForm.setTotalPriceWithTaxes(shippingVO.getOrderVO().getTotalPriceWithTaxes());
			
			Format formatter = new SimpleDateFormat("dd-MM-yyyy");
			Date minDeliveryDate = shippingForm.getBeginDeliveryTime();
			shippingForm.setBeginDateFormatted(formatter.format(minDeliveryDate));
			Date maxDeliveryDate = shippingForm.getEndDeliveryTime();
			shippingForm.setEndDateFormatted(formatter.format(maxDeliveryDate));
			
			//invoiceServiceBean.createInvoice(prodDetails,1,shippings,customerVO);
	
		}

		return orderVO;
	}

	/**
	 * @param shippingForm
	 * @param deliveryStrategyId
	 */
	public void calculateShippingDate(ShippingForm shippingForm,
			int deliveryStrategyId) {

		DeliveryCompanyVO deliveryVO = deliveryCompanyDao
				.findDeliveryCompanyById(deliveryStrategyId);

		int minimumDeliveryTime = (int) deliveryVO.getLowerBoundTime();

		int maximumDeliveryTime = (int) deliveryVO.getUpperBoundTime();

		List<ProductDetails> details = shippingForm.getProducts();

		int latestDeliveryTime = 0;

		for (ProductDetails productDetails : details) {

			if (latestDeliveryTime <= productDetails.getAvailabilityTime()) {
				latestDeliveryTime = productDetails.getAvailabilityTime();
			}
		}

		Calendar minimumDeliveryDate = Calendar.getInstance();

		Calendar maximumDeliveryDate = Calendar.getInstance();

		minimumDeliveryDate.add(Calendar.DATE, latestDeliveryTime
				+ minimumDeliveryTime);

		maximumDeliveryDate.add(Calendar.DATE, latestDeliveryTime
				+ maximumDeliveryTime);

		shippingForm.setBeginDeliveryTime(minimumDeliveryDate.getTime());

		shippingForm.setEndDeliveryTime(maximumDeliveryDate.getTime());

	}

	public List<OrderForm> getAllOrderByCustomer(int customerId) {	

		List<OrderVO>listaOrder=orderDao.getAllOrderByCustomer(customerId);

		List<OrderForm>listForm=new ArrayList<OrderForm>();

		for (OrderVO orderVO : listaOrder) {

			OrderForm orderForm=new OrderForm();

			orderForm.setNameCustomer(orderVO.getCustomerVO().getFirstName());
			orderForm.setLastNameCustomer(orderVO.getCustomerVO().getLastName());			
			orderForm.setOrderId(orderVO.getOrderId());
			orderForm.setProductCreation(orderVO.getProductCreation());
			orderForm.setTotalPriceWithTaxes(orderVO.getTotalPriceWithTaxes());

			listForm.add(orderForm);

			List<ShippingVO>listShipping=orderVO.getShippings();

			for (ShippingVO shippingVO : listShipping) {
				orderForm.setMinimumDeliveryDate(shippingVO.getMinimumDeliveryDate());
				orderForm.setMaximumDeliveryDate(shippingVO.getMaximumDeliveryDate());
			}

			List<OrderProductRelationVO> productRelations = orderVO.getOrderProductRelations();

			for (OrderProductRelationVO orderProductRelationVO : productRelations) {

				ProductVO productVO = orderProductRelationVO.getProductVO();

				ProductDetails prodDetails = new ProductDetails();
				prodDetails.setName(productVO.getName());
				prodDetails.setId(productVO.getProductId());
				prodDetails.setPrice(productVO.getPrice());
				prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
				prodDetails.setAvailability(productVO.getAvailability());								
				prodDetails.setProducer(productVO.getProducer());

				orderForm.getProducts().add(prodDetails);	

				for (ProductImages productImage : productVO.getProductsImages()) {
					if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
						prodDetails.setImagePath(productImage.getImageName());

				}
			}

		}
		return listForm;
	}

	public List<ShippingForm> getAllShippingsByOrder(long orderId) {	

		List<ShippingVO>listaShipping=orderDao.getAllShippingsByOrder(orderId);

		List<ShippingForm>listForm=new ArrayList<ShippingForm>();

		for (ShippingVO shippingVO : listaShipping) {

			ShippingForm shippingForm=new ShippingForm();

			shippingForm.setShippingPrice(shippingVO.getShippingPrice());
			shippingForm.setFirstNameCustomer(shippingVO.getOrderVO().getCustomerVO().getFirstName());
			shippingForm.setLastNameCustomer(shippingVO.getOrderVO().getCustomerVO().getLastName());
			shippingForm.setStreet(shippingVO.getAddressVO().getStreet());
			shippingForm.setNameCity(shippingVO.getAddressVO().getCityVO().getNameCity());
			shippingForm.setNameRegion(shippingVO.getAddressVO().getRegionVO().getNameRegion());
			shippingForm.setNameState(shippingVO.getAddressVO().getStateVO().getNameState());
			shippingForm.setDeliveryCompanyName(shippingVO.getDeliveryCompanyVO().getCompanyName());
			shippingForm.setDeliveryStrategyName(shippingVO.getDeliveryCompanyVO().getStrategyName());
			shippingForm.setTotalPrice(shippingVO.getOrderVO().getTotalPrice());
			shippingForm.setTotalPriceWithTaxes(shippingVO.getOrderVO().getTotalPriceWithTaxes());

			listForm.add(shippingForm);

			List<ShippingProductRelationVO>productRelationVOs=shippingVO.getShippingRelations();
			for (ShippingProductRelationVO shippingProductRelationVO : productRelationVOs) {

				ProductVO productVO=shippingProductRelationVO.getProductVO();
				ProductDetails prodDetails = new ProductDetails();
				prodDetails.setName(productVO.getName());
				prodDetails.setProducer(productVO.getProducer());
				prodDetails.setPrice(productVO.getPrice());	
				prodDetails.setVat(productVO.getVat());

				shippingForm.getProducts().add(prodDetails);

				List<OrderProductRelationVO>listOrderProductRelationVO=shippingVO.getOrderVO().getOrderProductRelations();
				for (OrderProductRelationVO orderProductRelationVO : listOrderProductRelationVO) {
					prodDetails.setQuantitySold(orderProductRelationVO.getQuantitySold());
				}
			}


		}
		return listForm;
	}

	public List<OrderForm> getOrderByDate(Date insData,int customerId) {

		List<OrderVO> orderVOs = orderDao.getAllOrderByCustomer(customerId);
		List<OrderForm>listaOrdini=new ArrayList<OrderForm>();
		Calendar now =  Calendar.getInstance();

		for (OrderVO orderVO : orderVOs) {

			Calendar compare = Calendar.getInstance();

			compare.setTime(orderVO.getProductCreation());

			now.setTime(insData);
			
			OrderForm orderForm=new OrderForm();
			if (compare.before(now)){
				orderForm.setNameCustomer(orderVO.getCustomerVO().getFirstName());
				orderForm.setLastNameCustomer(orderVO.getCustomerVO().getLastName());			
				orderForm.setOrderId(orderVO.getOrderId());
				orderForm.setProductCreation(orderVO.getProductCreation());
				orderForm.setTotalPriceWithTaxes(orderVO.getTotalPriceWithTaxes());

				listaOrdini.add(orderForm);

				List<ShippingVO>listShipping=orderVO.getShippings();

				for (ShippingVO shippingVO : listShipping) {
					orderForm.setMinimumDeliveryDate(shippingVO.getMinimumDeliveryDate());
					orderForm.setMaximumDeliveryDate(shippingVO.getMaximumDeliveryDate());
				}

				List<OrderProductRelationVO> productRelations = orderVO.getOrderProductRelations();

				for (OrderProductRelationVO orderProductRelationVO : productRelations) {

					ProductVO productVO = orderProductRelationVO.getProductVO();

					ProductDetails prodDetails = new ProductDetails();
					prodDetails.setName(productVO.getName());
					prodDetails.setId(productVO.getProductId());
					prodDetails.setPrice(productVO.getPrice());
					prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
					prodDetails.setAvailability(productVO.getAvailability());								
					prodDetails.setProducer(productVO.getProducer());

					orderForm.getProducts().add(prodDetails);	

					for (ProductImages productImage : productVO.getProductsImages()) {
						if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
							prodDetails.setImagePath(productImage.getImageName());

					}
				}
			}
			
		}

		return listaOrdini;
	}

	public List<OrderForm> getOrderByShipping(OrderStatus shippingStatus,int customerId) {

		List<OrderVO> orderVOs = orderDao.getAllOrderByCustomer(customerId);
		List<OrderForm>listOrderByShipping=new ArrayList<OrderForm>();


		for (OrderVO orderVO : orderVOs) {

			OrderForm orderForm=new OrderForm();
			
			List<ShippingVO>listShipping=orderVO.getShippings();

			for (ShippingVO shippingVO : listShipping) {
				
				if ((shippingVO.getOrderStatus().name()).compareTo(shippingStatus.name())==0){
					
					orderForm.setMinimumDeliveryDate(shippingVO.getMinimumDeliveryDate());
					orderForm.setMaximumDeliveryDate(shippingVO.getMaximumDeliveryDate());
					orderForm.setNameCustomer(orderVO.getCustomerVO().getFirstName());
					orderForm.setLastNameCustomer(orderVO.getCustomerVO().getLastName());			
					orderForm.setOrderId(orderVO.getOrderId());
					orderForm.setProductCreation(orderVO.getProductCreation());
					orderForm.setTotalPriceWithTaxes(orderVO.getTotalPriceWithTaxes());

					listOrderByShipping.add(orderForm);


					List<OrderProductRelationVO> productRelations = orderVO.getOrderProductRelations();

					for (OrderProductRelationVO orderProductRelationVO : productRelations) {

						ProductVO productVO = orderProductRelationVO.getProductVO();

						ProductDetails prodDetails = new ProductDetails();
						prodDetails.setName(productVO.getName());
						prodDetails.setId(productVO.getProductId());
						prodDetails.setPrice(productVO.getPrice());
						prodDetails.setAvailabilityTime(productVO.getAvailabilityTime());
						prodDetails.setAvailability(productVO.getAvailability());								
						prodDetails.setProducer(productVO.getProducer());

						orderForm.getProducts().add(prodDetails);	

						for (ProductImages productImage : productVO.getProductsImages()) {
							if(productImage.getPrincipalImage().equalsIgnoreCase("true"))
								prodDetails.setImagePath(productImage.getImageName());

						}
					}
				}
			}
		}

		return listOrderByShipping;
	}
	
	/* (non-Javadoc)
	 * @see com.template.bo.order.OrderService#activateOrder(com.template.vo.OrderVO)
	 */
	public void activateOrderInsert(OrderVO orderVO){
		
		
		
		OrderVO orderVO2 = orderDao.findOrderVOById(orderVO.getOrderId());
		
		CustomerVO customerVO = orderVO2.getCustomerVO();
		
		VirtualCartVO virtualCartVO = customerVO.getVirtualCartVO();
		
		List<VirtualCartProductRelationVO> virtualCartProductRelations = virtualCartVO.getVirtualCartProductRelations();
		
		orderVO2.setPaypalOrderStatus(orderVO.getPaypalOrderStatus());
		
		orderVO2.setPaypalTransactionId(orderVO.getPaypalTransactionId());
		
		orderVO2.setStatus(OrderStatus.ACTIVE);
		
		orderDao.updateOrderVO(orderVO2);
		
		List<OrderProductRelationVO> productRelations = orderVO2.getOrderProductRelations();
		
		
		// erasing all the products processed in the order from the cart
		for (OrderProductRelationVO orderProductRelationVO : productRelations) {
			
			for (VirtualCartProductRelationVO virtualCartProductRelationVO : virtualCartProductRelations) {
				if (orderProductRelationVO.getProductVO().getProductId()==virtualCartProductRelationVO.getProductVO().getProductId())
					virtualCartProductRelationsDao.removeVirtualCartProductRelationVO(virtualCartProductRelationVO);
			}
			
			
		}
		
		
		// cleaning the checkout table
		List<CheckoutVO> checkouts = checkoutDao.getAllCheckoutVOs();
		
		for (CheckoutVO checkoutVO : checkouts) {
		  if (checkoutVO.getCustomerVO().getCustomerId()==customerVO.getCustomerId())
			  checkoutDao.removeCheckoutVO(checkoutVO);
		}
		
		
		
	}
	
	public void cancelOrder(long orderId){
		
		// cleaning the checkout table
		List<CheckoutVO> checkouts = checkoutDao.getAllCheckoutVOs();
		
		OrderVO orderVO = orderDao.findOrderVOById(orderId);
		
		CustomerVO customerVO = orderVO.getCustomerVO();
		
		for (CheckoutVO checkoutVO : checkouts) {
			if (checkoutVO.getCustomerVO().getCustomerId()==customerVO.getCustomerId()){
				ProductVO productVO = checkoutVO.getProductVO();
				
				productVO.setQuantity(productVO.getQuantity()+checkoutVO.getQuantity());
				
				productDao.updateProductVO(productVO);
				
				checkoutDao.removeCheckoutVO(checkoutVO);
			}
				
		}
		
		orderDao.removeOrderVO(orderVO);
		
		
	}
}
