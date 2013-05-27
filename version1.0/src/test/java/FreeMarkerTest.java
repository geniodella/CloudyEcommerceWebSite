package test.java;

import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreeMarkerTest {
	
	
	public static void main (String args[]){
		
		 /* Create and adjust the configuration */
        Configuration cfg = new Configuration();
        try {
			cfg.setDirectoryForTemplateLoading(
			      new File("c:/"));
			
        	
        	
			  cfg.setObjectWrapper(new DefaultObjectWrapper());
			
		     /* ------------------------------------------------------------------- */    
	        /* You usually do these for many times in the application life-cycle:  */    
	                
	        /* Get or create a template */
	        Template temp = cfg.getTemplate("test.ftl");
	        
	        /* Create a data-model */
	        Map<String, Object> root = new HashMap<String, Object>();
	        root.put("user", "Big Joe");
	        Map<String, String> latest = new HashMap<String, String>();
	        root.put("latestProduct", latest);
	        latest.put("url", "./greenmouse.html");
	        latest.put("name", "green mouse");

	        /* Merge data-model with template */
	        Writer out = new OutputStreamWriter(System.out);
	        temp.process(root, out);
	        out.flush();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
        

     

   
		
	}

}
