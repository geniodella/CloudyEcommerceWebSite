package com.template.bo.invoice;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringBufferInputStream;
import java.io.StringWriter;
import java.util.List;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.ParseErrorException;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.w3c.dom.Document;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.template.dao.CompanyInformationDao;
import com.template.dao.order.OrderDao;
import com.template.form.ProductDetails;
import com.template.form.ShippingForm;
import com.template.generic.EmailSender;
import com.template.vo.CompanyInformationVO;
import com.template.vo.CustomerVO;
import com.template.vo.OrderVO;




public class InvoiceServiceImpl implements InvoiceService{
	
	OrderDao orderDao;
	
	public OrderDao getOrderDao() {
		return orderDao;
	}




	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}




	CompanyInformationDao companyInformationDao;
	
	


	public CompanyInformationDao getCompanyInformationDao() {
		return companyInformationDao;
	}




	public void setCompanyInformationDao(CompanyInformationDao companyInformationDao) {
		this.companyInformationDao = companyInformationDao;
	}




	



	public void createInvoice(List<ProductDetails> prodDetails, long transactionId,List<ShippingForm> shippings,CustomerVO customerVO){
		
		OrderVO orderVO = orderDao.findOrderVOById(transactionId);
				
		CompanyInformationVO companyInformationVO = companyInformationDao.findCompanyInformationById(1);
		
		 Properties vProps = new Properties(); 
	        vProps.put(Velocity.RESOURCE_LOADER, "classpath"); 
	        vProps.put("classpath." + Velocity.RESOURCE_LOADER + ".class" , ClasspathResourceLoader.class.getName()); 
	       
	        VelocityEngine engine = new VelocityEngine();
	        VelocityContext context = new VelocityContext();
	        ByteArrayOutputStream os = new ByteArrayOutputStream();
		
	        try {
	        	
	        	engine  = new VelocityEngine(vProps);
	        	engine.init();
	      
	               /*
	                *  now render the template into a Writer, here 
	                *  a StringWriter 
	                */

	               StringWriter writer = new StringWriter();
	               context.put("prodDetails", prodDetails);
	               context.put("companyInfo", companyInformationVO);
	               context.put("customer", customerVO);
	               context.put("shippings", shippings);
	               
	               Template t = engine.getTemplate( "template.vm" );

	               t.merge( context, writer );
				
				
				String bingo =  writer.toString();
				DocumentBuilderFactory fac = DocumentBuilderFactory.newInstance();
			
				
				// disabling all the xml validation that slows down everything
				fac.setNamespaceAware(false);		
				fac.setValidating(false);		
			    fac.setFeature("http://xml.org/sax/features/namespaces", false);    
			    fac.setFeature("http://xml.org/sax/features/validation", false);    
			    fac.setFeature("http://apache.org/xml/features/nonvalidating/load-dtd-grammar", false);		    
			    fac.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);

				 // parse the markup into an xml Document
			    DocumentBuilder builder = fac.newDocumentBuilder();
			
			    Document doc = builder.parse(new StringBufferInputStream(bingo));

			    ITextRenderer renderer = new ITextRenderer();
			    renderer.setDocument(doc, null);

			    renderer.layout();
			    renderer.createPDF(os);
			    
			    EmailSender sender = new EmailSender();
			    
			    sender.sendEmail("", "", os);
			    
			    os.close();
			    
	    	} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ResourceNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseErrorException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
