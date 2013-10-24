package com.template.generic;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.Session;

import org.apache.log4j.Logger;
import org.springframework.jms.listener.SessionAwareMessageListener;

import com.template.form.SubscriptionForm;

public class JmsSubscriptionListener implements SessionAwareMessageListener{
	
	private static final Logger LOG = Logger.getLogger(JmsOrderListener.class);
	
	
	public EmailSender getEmailServiceBean() {
		return emailServiceBean;
	}

	public void setEmailServiceBean(EmailSender emailServiceBean) {
		this.emailServiceBean = emailServiceBean;
	}

	EmailSender emailServiceBean;
	
	
	
	
	

	 public void onMessage( Message message,Session  session) throws JMSException{
		
		 try{
		 SubscriptionForm subscriptionForm = (SubscriptionForm)((ObjectMessage)message).getObject();
		 
		
		 emailServiceBean.sendSubscriptionEmail(subscriptionForm.getEmailAddress() ,subscriptionForm.getPassword(),subscriptionForm.getUsername());
	
	 }catch (Exception e){
				e.printStackTrace();
				try {
					session.rollback();
				} catch (JMSException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		
		 }


}
