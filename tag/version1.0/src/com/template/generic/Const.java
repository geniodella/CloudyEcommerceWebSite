package com.template.generic;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Const {
	
	public Const(){
		
	}
	
	 public static final  String TEMP_IMAGE_FOLDER = "c:/test/images/temp/";
	 
	 public static final  String IMAGE_FOLDER = "c:/test/images/";
	 
	 public static final String BUNDLE_FOLDER = "/js/resources/";
	 
	 
	 @Value( "${paypal.ipn.url}" )
	 public   String PAYPAL_IPN_URL;
	 
	

	public String getPAYPAL_IPN_URL() {
		return PAYPAL_IPN_URL;
	}

	public void setPAYPAL_IPN_URL(String pAYPAL_IPN_URL) {
		PAYPAL_IPN_URL = pAYPAL_IPN_URL;
	}

	@Value( "${paypal.ipn.host}" )
	 public   String PAYPAL_IPN_HOST;
	 

public static final String EMAIL_ADMIN_ADDRESS = "pinolfo@formez-consulting.com";
	 
	 public static final String EMAIL_SMTP_SERVER = "mail.formez-consulting.com";

	

}
