package com.template.bo.order;

import java.util.Date;
import java.util.List;

import com.template.form.OrderForm;
import com.template.form.ReviewPriceForm;
import com.template.form.ShippingForm;
import com.template.vo.OrderStatus;
import com.template.vo.OrderVO;
import com.template.vo.VirtualCartProductRelationVO;

/**
 * @author frank dragon
 *
 */
public interface OrderService {
	
	OrderVO findOrderById(int id);

	void insertOrderVO(OrderVO orderVO);

	void updateOrderVO(OrderVO orderVO);

	List<OrderVO> getAllOrderVOs(int size, int page); 
		
	List<OrderVO> getAllOrderVOs();
	
	public void cancelOrder(long orderId);
	
	/**
	 * @param orderVO
	 */
	public void activateOrderInsert(OrderVO orderVO);
	
	public void calculateShippingPrice(List<ShippingForm> shippings, long deliveryStrategyId);
	
	public ReviewPriceForm  prepareOrderReview(List<ShippingForm> shippings, long deliveryStrategyId,List<VirtualCartProductRelationVO> products);

	void removeOrderVO(OrderVO orderVO);
	
	public void calculatePartialShippingPrice(ShippingForm shippingForm, long deliveryStrategyId);
	
	public OrderVO insertOrder(ReviewPriceForm reviewPriceForm, List<ShippingForm> shippings, Integer addressId, int deliveryStrategyId, int customerId, OrderVO orderVO);
	
	List<OrderForm> getAllOrderByCustomer(int customerId);
	
	List<ShippingForm> getAllShippingsByOrder(long orderId);

	public List<OrderForm> getOrderByDate(Date insData,int customerId);
	
	public List<OrderForm> getOrderByShipping(OrderStatus shippingStatus,int customerId);
}
