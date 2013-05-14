package com.template.bo.jms;

import org.springframework.jms.core.JmsTemplate;

import com.template.dao.order.OrderDao;
import com.template.form.SubscriptionForm;

public class JmsSubscriptionServiceImpl implements JmsSubscriptionService{
	
	
 private JmsTemplate jmsSubscriptionTemplate;
	 
	 private OrderDao orderDao;
	    
	    public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	

		public JmsTemplate getJmsSubscriptionTemplate() {
		return jmsSubscriptionTemplate;
	}

	public void setJmsSubscriptionTemplate(JmsTemplate jmsSubscriptionTemplate) {
		this.jmsSubscriptionTemplate = jmsSubscriptionTemplate;
	}

		public void sendSubscriptionEmail(String code,String emailAddress){
			
			SubscriptionForm subscriptionForm = new SubscriptionForm();
			
			subscriptionForm.setActivationCode(code);
			
			subscriptionForm.setEmailAddress(emailAddress);
			
			jmsSubscriptionTemplate.convertAndSend(subscriptionForm);
		

	        
	    }

}
