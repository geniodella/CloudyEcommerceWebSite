package test.java;

import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.protocol.HttpContext;
import org.browsermob.core.har.Har;
import org.browsermob.proxy.ProxyServer;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Proxy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class FirefoxTst {
	
	String PROXY = "localhost:4444";
	
	private WebDriver driver;
	private String baseUrl;
	 WebDriverWait wait;

	   ProxyServer server;
	private StringBuffer verificationErrors = new StringBuffer();
	@Before
	public void setUp() throws Exception {
		driver = new FirefoxDriver();
		baseUrl = "http://localhost:9090/";
	//	driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		// start the proxy
		 server = new ProxyServer(4444);
		
		server.start();
		
	
	    server.setCaptureHeaders(true);
	      
        
        server.setCaptureContent(true);
		// get the Selenium proxy object
		Proxy proxy = server.seleniumProxy();
		proxy.setHttpProxy(PROXY)
	     .setFtpProxy(PROXY)
	     .setSslProxy(PROXY);

		// configure it as a desired capability
		DesiredCapabilities capabilities = new DesiredCapabilities();
		capabilities.setCapability(CapabilityType.PROXY, proxy);

		// start the browser up
	driver = new FirefoxDriver(capabilities);
	
	   server.addRequestInterceptor(new HttpRequestInterceptor() {
	        public void process(HttpRequest request, HttpContext context) throws HttpException, IOException {
	         
	            
	                HttpHost host = (HttpHost) context.getAttribute("http.target_host");
	        
	             //   System.out.println("Host = " +  request.getLastHeader("Location").getValue());
	           Header[] head =  request.getHeaders("Referer");
	           head.clone();
	                System.out.println("Path = " + request.getParams());
	                String response;
	           
	                
	            }
	       

	   });
	}
	
	@Test
	public void testProva() throws Exception {
		server.newHar("prova.har");
		 driver.get("http://151.1.158.102:8090/WebProjectTemplate/js/Ecommerce/index.html");
		 if (wait == null)            
	            wait = new WebDriverWait(driver, 30);

	        //wait.Until(driver);
	        wait.until((new ExpectedCondition<WebElement>(){
	        
	        	public WebElement apply(WebDriver d) {
	        		return d.findElement(By.id("categoryFormHiddenField"));
	        	}}));
	        
	    	
			((JavascriptExecutor) driver).executeScript("Ext.ComponentQuery.query('#menuTree')[0].getView().findItemByChild('categoryFormHiddenField').click();");
			
		
			wait.until((new ExpectedCondition<WebElement>(){
		        
	        	public WebElement apply(WebDriver d) {
	        		return d.findElement(By.id("categoryFormHiddenField"));
	        	}}));
		
	    	
			((JavascriptExecutor) driver).executeScript("Ext.getCmp('categoryInsertForm').down('#categoryInsertFormName').setValue('test');");			
			((JavascriptExecutor) driver).executeScript("Ext.getCmp('categoryInsertForm').down('#categoryInsertFormDescription').setValue('test');");
			
			((JavascriptExecutor) driver).executeScript("Ext.getCmp('categoryInsertForm').down('#submit').btnEl.dom.click();");
			
		
wait.until((new ExpectedCondition<WebElement>(){
		        
	        	public WebElement apply(WebDriver d) {
	        		return d.findElement(By.id("categoryFormHiddenField"));
	        	}}));
		
		    
		    
		    Har har = server.getHar();
		    
		  
		    
		    String strFilePath = "C:/Selenium_test.har";
		    FileOutputStream fos = new FileOutputStream(strFilePath);
		    har.writeTo(fos);
		    server.stop();
	}

}
