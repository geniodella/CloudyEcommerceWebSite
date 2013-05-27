package test.java;

import static org.junit.Assert.fail;

import java.io.File;
import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriverService;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.gargoylesoftware.htmlunit.WebClient;

public class prova {
	private WebDriver driver;
	private String baseUrl;
	private StringBuffer verificationErrors = new StringBuffer();
	private static ChromeDriverService service;
	 WebClient webClient;
	 WebDriverWait wait;
	@Before
	public void setUp() throws Exception {
		
		service = new ChromeDriverService.Builder()
        .usingChromeDriverExecutable(new File("c:/chromedriver.exe"))
        .usingAnyFreePort()
        .build();
    service.start();
		
    driver = new RemoteWebDriver(service.getUrl(),
            DesiredCapabilities.chrome());
		baseUrl = "http://localhost:8080";
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		  webClient = new WebClient();
	        webClient.setJavaScriptEnabled(true);
	        webClient.setThrowExceptionOnScriptError(false);
	}

	@Test
	public void testProva() throws Exception {
	
		 driver.get("http://localhost:8080/WebProjectTemplate/js/Ecommerce/index.html");
		 if (wait == null)            
	            wait = new WebDriverWait(driver, 30);

	        //wait.Until(driver);
	        wait.until((new ExpectedCondition<WebElement>(){
	        
	        	public WebElement apply(WebDriver d) {
	        		return d.findElement(By.id("categoryFormHiddenField"));
	        	}}));
		
		
			((JavascriptExecutor) driver).executeScript("Ext.ComponentQuery.query('#menuTree')[0].getView().findItemByChild('categoryFormHiddenField').click()");
	//	driver.findElement(By.id("nameCategory")).clear();
		
		//driver.findElement(By.id("nameCategory")).sendKeys("automobili");
		//driver.findElement(By.id("descriptionCategory")).clear();
		//driver.findElement(By.id("descriptionCategory")).sendKeys("belle");
		//driver.findElement(By.xpath("//div[@id=\"submit\"]")).click();
	}

	@After
	public void tearDown() throws Exception {
		//driver.quit();
		String verificationErrorString = verificationErrors.toString();
		if (!"".equals(verificationErrorString)) {
			fail(verificationErrorString);
		}
	}

	private boolean isElementPresent(By by) {
		try {
			driver.findElement(by);
			return true;
		} catch (NoSuchElementException e) {
			return false;
		}
	}
}
