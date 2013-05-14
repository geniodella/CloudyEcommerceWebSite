package com.template.bo.jms;

import org.springframework.jms.core.JmsTemplate;

import com.template.dao.order.OrderDao;
import com.template.vo.OrderStatus;
import com.template.vo.OrderVO;

public class JmsOrderServiceImpl implements JmsOrderService{
	
	 private JmsTemplate jmsTemplate;
	 
	 private OrderDao orderDao;
	    
	    public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

		public JmsTemplate getJmsTemplate() {
			return jmsTemplate;
		}

		public void setJmsTemplate(JmsTemplate jmsTemplate) {
			this.jmsTemplate = jmsTemplate;
		}

		public void sendOrder( OrderVO orderVO){
			
			orderVO = orderDao.findOrderVOById(orderVO.getOrderId());
			orderVO.setStatus(OrderStatus.HANDLING);
			
			orderDao.updateOrderVO(orderVO);
			
			  jmsTemplate.convertAndSend(orderVO);
		

	        System.out.println("Order sent - id: "+ orderVO.getTotalPrice());
	    }

}
