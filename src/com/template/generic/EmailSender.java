package com.template.generic;

import java.io.ByteArrayOutputStream;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import org.springframework.beans.factory.annotation.Value;

public class EmailSender {
	
	@Value( "${account.email}" )
	 public   String ACCOUNT_EMAIL;
	
	 @Value( "${mail.smtp.host}" )
	 public   String SMTP_HOST;
	 
	 @Value( "${org.ecom.subscription}" )
	 public   String SUBSCRIPTION_MESSAGE;
	 
	 @Value( "${domain.url}" )
	 public   String DOMAIN_URL;
	 
	 
	 
	 @Value( "${company.address}" )
	 public   String COMPANY_EMAIL;
	 

	 @Value("${mail.smtp.port}")
	 public   String SMTP_PORT;
	 
	 @Value( "${account.username}" )
	 public   String ACCOUNT_USERNAME;
	 
	 
	 
	 @Value( "${account.password}" )
	 public   String ACCOUNT_PASSWORD;
	 
	 @Value("${org.ecom.emailSender.requestSubscription}")
	 public   String REQUEST_SUBSCRIPTION;
	 
	 private Properties props;
	 
	 private  Authenticator authenticator;
	 
	 public void connectionSetup(	){
		 
			String from = "pinolfo@formez-consulting.com";
		 
			// Set properties
			 props = new Properties();
			props.put("mail.smtp.host", SMTP_HOST);
		props.put("mail.debug", "true");
		props.put("mail.smtp.port",SMTP_PORT);
		props.put("mail.smtp.auth",true);
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.ssl.trust", "*");
		 authenticator = new Authenticator(ACCOUNT_USERNAME,ACCOUNT_PASSWORD);
		 
	 }
	

	
	public void sendEmail(String mail,String payerId,String payerEmail,String firstName,String lastName){
		
		try {
			connectionSetup();

		
			// Get session
			Session session = Session.getInstance(props,authenticator);			

			// Instantiate a message
			Message msg = new MimeMessage(session);

			// Set the FROM message
			msg.setFrom(new InternetAddress(ACCOUNT_EMAIL));

			// The recipients can be more than one so we use an array but you can
			// use 'new InternetAddress(to)' for only one address. 
			InternetAddress[] address = {new InternetAddress(mail)};
			msg.setRecipients(Message.RecipientType.TO, address);

			// Set the message subject and date we sent it.
			msg.setSubject("HEADER");
			msg.setSentDate(new Date());


			msg.setText("Id: 4"+", Email: jonathanB@gmail.com"+", Nome: Jonathan"+", Cognome: Bonarli");

			// Send the message
			Transport.send(msg);
		} catch (MessagingException  e) {
			// TODO Auto-generated catch block
			//log.error("SEND CONTACT US EMAIL ",e);
		}
	
	}
	
	public void sendEmailBuyer(String payerEmail){
		
		try {
			connectionSetup();

		
			// Get session
			Session session = Session.getInstance(props,authenticator);			

			// Instantiate a message
			Message msg = new MimeMessage(session);

			// Set the FROM message
			msg.setFrom(new InternetAddress(ACCOUNT_EMAIL));

			// The recipients can be more than one so we use an array but you can
			// use 'new InternetAddress(to)' for only one address. 
			InternetAddress[] address = {new InternetAddress(payerEmail)};
			msg.setRecipients(Message.RecipientType.TO, address);

			// Set the message subject and date we sent it.
			msg.setSubject("HEADER");
			msg.setSentDate(new Date());


			msg.setText("Grazie per aver acquistato il nostro prodotto.");

			// Send the message
			Transport.send(msg);
		} catch (MessagingException  e) {
			// TODO Auto-generated catch block
			//log.error("SEND CONTACT US EMAIL ",e);
		}
	
	}
	
	
	public void sendSubscriptionEmail(String sender, String activationCode,String username){
		
	
	
		connectionSetup();
		
			String from = "pinolfo@formez-consulting.com";
			
		 
		
			  
			// Get session
		Session session = Session.getInstance(props,authenticator);
			  
			try {
			    // Instantiate a message
			    Message msg = new MimeMessage(session);
			  
			    // Set the FROM message
			    msg.setFrom(new InternetAddress(from));
			  
			    // The recipients can be more than one so we use an array but you can
			    // use 'new InternetAddress(to)' for only one address.
			    InternetAddress[] address = {new InternetAddress(sender)};
			    msg.setRecipients(Message.RecipientType.TO, address);
			  
			    // Set the message subject and date we sent it.
			    msg.setSubject(REQUEST_SUBSCRIPTION);
			    msg.setSentDate(new Date());
			    

			    msg.setText(SUBSCRIPTION_MESSAGE + "username: "+username+" e  password: "+activationCode);
		 


			  
			  
			    // Send the message
			    Transport.send(msg);
			}
			catch (MessagingException mex) {
			    mex.printStackTrace();
			}


	
	}
		
	
	
	

}
