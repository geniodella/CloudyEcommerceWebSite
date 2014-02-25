package com.template.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.jms.JmsOrderService;
import com.template.generic.Const;
import com.template.vo.OrderVO;


@Configuration
public class PaypalAction extends ActionSupport{
	
	
	@Value( "${paypal.ipn.host}" )
	 public   String PAYPAL_IPN_HOST;
	
	
	 
	 @Value( "${paypal.ipn.url}" )
	 public   String PAYPAL_IPN_URL;
	 
	

	public String getPAYPAL_IPN_URL() {
		return PAYPAL_IPN_URL;
	}

	public void setPAYPAL_IPN_URL(String pAYPAL_IPN_URL) {
		PAYPAL_IPN_URL = pAYPAL_IPN_URL;
	}

	public JmsOrderService getJmsOrderService() {
		return jmsOrderService;
	}


	public void setJmsOrderService(JmsOrderService jmsOrderService) {
		this.jmsOrderService = jmsOrderService;
	}
	
	JmsOrderService jmsOrderService;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String receiveNotification(){
		
		OrderVO orderVO = new OrderVO();
		
		
		
		HttpServletRequest  request = ServletActionContext.getRequest();

		HttpsURLConnection uc = null;
		
		String res = "";
		
		// read post from PayPal system and add 'cmd'
		Enumeration en = request.getParameterNames();
		StringBuffer strBuffer = new StringBuffer("cmd=_notify-validate");
		String paramName;
		String paramValue;
		while (en.hasMoreElements()) {
			paramName = (String) en.nextElement();
			paramValue = request.getParameter(paramName);
			strBuffer.append("&").append(paramName).append("=")
					.append(URLEncoder.encode(paramValue));
		}
	 
		// post back to PayPal system to validate
		// NOTE: change http: to https: in the following URL to verify using SSL (for increased security).
		// using HTTPS requires either Java 1.4 or greater, or Java Secure Socket Extension (JSSE)
		// and configured for older versions.
		URL u;
		try {
			//u = new URL("https://www.paypal.com/cgi-bin/webscr");
			u = new URL(PAYPAL_IPN_URL);
			 uc = (HttpsURLConnection) u.openConnection();
				uc.setDoOutput(true);
				uc.setRequestProperty("Content-Type",
						"application/x-www-form-urlencoded");
				uc.setRequestProperty("Host",PAYPAL_IPN_HOST);
				PrintWriter pw = new PrintWriter(uc.getOutputStream());
				pw.println(strBuffer.toString());
				pw.close();

				BufferedReader in = new BufferedReader(new InputStreamReader(
						uc.getInputStream()));
				 res = in.readLine();
				in.close();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
	 
	 
		// assign posted variables to local variables
		String itemName = request.getParameter("item_name");
		String itemNumber = request.getParameter("item_number");
		String paymentStatus = request.getParameter("payment_status");
		String paymentAmount = request.getParameter("mc_gross");
		String paymentCurrency = request.getParameter("mc_currency");
		String txnId = request.getParameter("txn_id");
		String receiverEmail = request.getParameter("receiver_email");
		String payerEmail = request.getParameter("payer_email");
		String orderId = request.getParameter("custom");
	 
		// check notification validation
		if (res.equals("VERIFIED")) {
			
			orderVO.setOrderId(Long.parseLong(orderId));
			orderVO.setPaypalTransactionId(txnId);
			orderVO.setPaypalOrderStatus(paymentStatus);
			
			jmsOrderService.sendOrder(orderVO);
			
			// check that paymentStatus=Completed
			// check that txnId has not been previously processed
			// check that receiverEmail is your Primary PayPal email
			// check that paymentAmount/paymentCurrency are correct
			// process payment
		} else if (res.equals("INVALID")) {
			// log for investigation
		} else {
			// error
		}
		
		
		return ActionSupport.NONE;
	}
	

}
