package com.template.action;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.ParseErrorException;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.NicelyResynchronizingAjaxController;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.template.bo.ProductService;
import com.template.form.ProductDetails;

public class CrawlServlet implements Filter {
	
	
    private ProductService productServiceBean;

	public ProductService getProductServiceBean() {
		return productServiceBean;
	}



	public void setProductServiceBean(ProductService productServiceBean) {
		this.productServiceBean = productServiceBean;
	}

	final WebClient webClient = new WebClient(BrowserVersion.FIREFOX_17);

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException {

		HttpServletRequestWrapper reqWrapper = new HttpServletRequestWrapper(
				(HttpServletRequest) request);

		String queryString = reqWrapper.getQueryString();

//System.out.println("user agent :"+reqWrapper.getHeader("user-agent"));
		
	

		if ((queryString != null)
				&& (queryString.contains("_escaped_fragment_")) && !reqWrapper
				.getHeader("user-agent")
				.equals("facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)")) {
			         
			StringBuilder pageNameSb = new StringBuilder("http://");
			pageNameSb.append(reqWrapper.getServerName());
			reqWrapper.getParameter("productId");
			if (reqWrapper.getServerPort() != 0) {
				pageNameSb.append(":");
				pageNameSb.append(reqWrapper.getServerPort());
			}
			pageNameSb.append(reqWrapper.getRequestURI());
			queryString = rewriteQueryString(queryString);
			pageNameSb.append(queryString);

			// rewrite the URL back to the original #! version
			// remember to unescape any %XX characters

			String url_with_hash_fragment = pageNameSb.toString();
			String pageName = pageNameSb.toString();
			// use the headless browser to obtain an HTML snapshot

			webClient
					.setAjaxController(new NicelyResynchronizingAjaxController());
			// webClient.getJavaScriptEngine().pumpEventLoop(10000);
			// webClient.setJavaScriptTimeout(50000);

			webClient.getOptions().setJavaScriptEnabled(true);

			HtmlPage page = null;
			try {
				page = myGetPage(webClient, url_with_hash_fragment, true);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// HtmlPage page = webClient.getPage(url_with_hash_fragment);

			// webClient.waitForBackgroundJavaScriptStartingBefore(30000);

			webClient.waitForBackgroundJavaScript(40000);

			// important! Give the headless browser enough time to execute
			// JavaScript
			// The exact time to wait may depend on your application.

			// return the snapshot
			// System.out.println(page.asXml());
			/*
			 * FileWriter fileWriter = null; File newTextFile = new
			 * File("C:/test/test.txt"); fileWriter = new
			 * FileWriter(newTextFile); fileWriter.write(page.asXml());
			 * fileWriter.close();
			 */

			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println(page.asXml());
			webClient.closeAllWindows();
			out.close();
			
	
		}else if
		(	reqWrapper
				.getHeader("user-agent")
				.equals("facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)")){
			
			
			
			StringBuilder pageNameSb = new StringBuilder("http://");
			pageNameSb.append(reqWrapper.getServerName());
			reqWrapper.getParameter("productId");
			if (reqWrapper.getServerPort() != 0) {
				pageNameSb.append(":");
				pageNameSb.append(reqWrapper.getServerPort());
			}
			pageNameSb.append(reqWrapper.getRequestURI());
			queryString = rewriteQueryString(queryString);
			pageNameSb.append(queryString);
			
		
			String[] split = queryString.split("productId=");
			
			ProductDetails productDetail = productServiceBean.getProductDetail(split[1]);
			
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
		              context.put("product", productDetail);
		            
		               
		               Template t = engine.getTemplate( "facebookMetaTagTemplate.vm" );

		               t.merge( context, writer );
		               
		           	PrintWriter out = response.getWriter();
		           	out.println( writer.toString());
					out.close();
			
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
		}else 
			
		
		
			try {
				// not an _escaped_fragment_ URL, so move up the chain of
				// servlet (filters)
				chain.doFilter(request, response);
			} catch (ServletException e) {
				System.err.println("Servlet exception caught: " + e);
				e.printStackTrace();
			}
		}

	

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public static HtmlPage myGetPage(WebClient webClient, String url,
			boolean clearCache) throws Exception {
		if (clearCache) {
			webClient.getCache().clear();
		}
		return webClient.getPage(url);
	}

	private static String rewriteQueryString(String queryString) {
		StringBuilder queryStringSb = new StringBuilder(queryString);
		int i = queryStringSb.indexOf("&_escaped_fragment_");
		try {
			if (i != -1) {
				StringBuilder tmpSb = new StringBuilder(
						queryStringSb.substring(0, i));
				tmpSb.append("#!");

				tmpSb.append(URLDecoder.decode(
						queryStringSb.substring(i + 20, queryStringSb.length()),
						"UTF-8"));

				queryStringSb = tmpSb;
			}

			i = queryStringSb.indexOf("_escaped_fragment_");
			if (i != -1) {
				StringBuilder tmpSb = new StringBuilder(
						queryStringSb.substring(0, i));
				tmpSb.append("#!");
				tmpSb.append(URLDecoder.decode(
						queryStringSb.substring(i + 18, queryStringSb.length()),
						"UTF-8"));
				queryStringSb = tmpSb;
			}
			if (queryStringSb.indexOf("#!") != 0) {
				queryStringSb.insert(0, '?');
			}
			queryString = queryStringSb.toString();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return queryString;
	}
}
