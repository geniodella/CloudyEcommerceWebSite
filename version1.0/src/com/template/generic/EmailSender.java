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
	
	 @Value( "${mail.smtp.host}" )
	 public   String SMTP_HOST;
	 
	 @Value( "${org.ecom.subscription}" )
	 public   String SUBSCRIPTION_MESSAGE;
	 
	 @Value( "${domain.url}" )
	 public   String DOMAIN_URL;
	 
	 
	 
	 @Value( "${company.address}" )
	 public   String COMPANY_EMAIL;
	 
	 @Value( "${account.username}" )
	 public   String ACCOUNT_USERNAME;
	 
	 @Value( "${account.password}" )
	 public   String ACCOUNT_PASSWORD;
	 
	 private Properties props;
	 
	 private  Authenticator authenticator;
	 
	 public void connectionSetup(	){
		 
			String from = "pinolfo@formez-consulting.com";
		 
			// Set properties
			 props = new Properties();
			props.put("mail.smtp.host", SMTP_HOST);
		props.put("mail.debug", "true");
		props.put("mail.smtp.auth",true);
		props.put("mail.smtp.starttls.enable","true");
		
		 authenticator = new Authenticator(ACCOUNT_USERNAME,ACCOUNT_PASSWORD);
		 
	 }
	

	
	public void sendEmail(String sender, String message, ByteArrayOutputStream outputStream){
		
		 byte[] bytes = outputStream.toByteArray();
		 
		   DataSource dataSource = new ByteArrayDataSource(bytes, "application/pdf");
		
		   
		
			String from = "pinolfo@formez-consulting.com";
		 
			connectionSetup();
			  
			// Get session
		Session session = Session.getInstance(props,authenticator);
			  
			try {
			    // Instantiate a message
			    Message msg = new MimeMessage(session);
			  
			    // Set the FROM message
			    msg.setFrom(new InternetAddress(from));
			  
			    // The recipients can be more than one so we use an array but you can
			    // use 'new InternetAddress(to)' for only one address.
			    InternetAddress[] address = {new InternetAddress(COMPANY_EMAIL)};
			    msg.setRecipients(Message.RecipientType.TO, address);
			  
			    // Set the message subject and date we sent it.
			    msg.setSubject("Email from JavaMail test");
			    msg.setSentDate(new Date());
			    
			    
			    	// Here create two parts and set as message contect
			    	// Create and fill first part
			   	MimeBodyPart part1 = new MimeBodyPart();
			   	part1.setText("This is part one of this multipart message.");
			    	  
			    	// Create and fill second part
			    	MimeBodyPart part2 = new MimeBodyPart();
			    	part2.setContent("<h1>Sample</h1><p>This is a sample HTML part</p>", "text/html");
			    	  
			    	// Create the Multipart.
			    	Multipart mp = new MimeMultipart("alternative");
			    	mp.addBodyPart(part1);
			    	mp.addBodyPart(part2);
		
				    
			    MimeBodyPart pdf = new MimeBodyPart();
			    pdf.setFileName("pipa");
			    pdf.setHeader("Content-Type","text/plain; charset=\"utf-8\"");
			    pdf.setDataHandler(new DataHandler(dataSource));
			    	mp.addBodyPart(pdf);
			    	  
			    	// Set the message's content
			    	msg.setContent(mp);

			    // Send the message
			    Transport.send(msg);
			}
			catch (MessagingException mex) {
			    mex.printStackTrace();
			}


	
	}
	
	
	public void sendSubscriptionEmail(String sender, String activationCode){
		
	
	
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
			    msg.setSubject("Email from JavaMail test");
			    msg.setSentDate(new Date());
			    

			    msg.setText(SUBSCRIPTION_MESSAGE + "   "+ DOMAIN_URL+"#/subscription?code="+activationCode);
		 


			  
			  
			    // Send the message
			    Transport.send(msg);
			}
			catch (MessagingException mex) {
			    mex.printStackTrace();
			}


	
	}
		
	
	
	

}
