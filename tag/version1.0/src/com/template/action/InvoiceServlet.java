package com.template.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.template.vo.VirtualCartVO;

/**
 * Servlet implementation class InvoiceServlet
 */
public class InvoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InvoiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   /* Create a data-model */
		
	
        String user = new String("Big Joe");
        Map latest = new HashMap();
      
        latest.put("url", "products/greenmouse.html");
        latest.put("name", "green mouse");
        
        request.setAttribute("user", user);
        
        request.setAttribute("latestProduct", latest);
        
        request.getRequestDispatcher("/test.ftl").forward(request, response);
	}

}
