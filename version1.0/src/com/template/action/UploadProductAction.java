package com.template.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.ProductService;

public class UploadProductAction extends ActionSupport {
	
	ProductService productServiceBean;
	
	public ProductService getProductServiceBean() {
		return productServiceBean;
	}



	public void setProductServiceBean(ProductService productServiceBean) {
		this.productServiceBean = productServiceBean;
	}



	private HttpServletRequest servletRequest;
	
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File upload;//The actual file
	  private String uploadContentType; //The content type of the file
	  private String uploadFileName; //The uploaded file name
	  private String fileCaption;//The caption of the file entered by user
	  public String execute() throws Exception {
		  System.out.println("\n\n upload2");
	        System.out.println("files:");
	     
	        System.out.println("filenames:");
	        for (String n: name) {
	            System.out.println("*** "+n);
	        }
	        System.out.println("content types:");
	        for (String c: uploadContentTypes) {
	            System.out.println("*** "+c);
	        }
	        System.out.println("\n\n");
		 
	  return SUCCESS;

	  }
	  
	  
	  
	   private String[] name;
	    private File file;
	    private String[] uploadContentTypes;
	    
	   

	

	  



		public String[] getName() {
			return name;
		}



		public void setName(String[] name) {
			this.name = name;
		}



		public File getFile() {
			return file;
		}



		public void setFile(File file) {
			this.file = file;
		}



		public String[] getUploadContentType() { return this.uploadContentTypes; }
	    public void setUploadContentType(String[] uploadContentType) { this.uploadContentTypes = uploadContentType; }

	
		  public String form() {

				return "form";
			}




}
