package com.template.generic;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.Session;

import org.apache.log4j.Logger;
import org.springframework.jms.listener.SessionAwareMessageListener;

import com.template.bo.order.OrderService;
import com.template.vo.OrderVO;

public class JmsOrderListener implements SessionAwareMessageListener {
	
	OrderService orderServiceBean;

	  public OrderService getOrderServiceBean() {
		return orderServiceBean;
	}

	public void setOrderServiceBean(OrderService orderServiceBean) {
		this.orderServiceBean = orderServiceBean;
	}

	private static final Logger LOG = Logger.getLogger(JmsOrderListener.class);

	 public void onMessage( Message message , Session session ) throws JMSException{
	     
		  OrderVO orderVO = null;
	
			
			orderVO = (OrderVO)((ObjectMessage)message).getObject();
			
		 
	       
	       orderVO.getOrderId();
	       String orderStatus = orderVO.getPaypalOrderStatus();
	     
	       if (orderStatus.equals("Failed")){
	    	   
	       }else
	       {
	    	   orderServiceBean.activateOrderInsert(orderVO);
	       }
	      // LOG.info("Consumed message: " + msg.getJMSMessageID());
	       //throw new JMSException("..exception");
	  }

}
