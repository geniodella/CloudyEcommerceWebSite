
<%@ include file="/include/head.jsp" %>
<%@ include file="/include/header.jsp" %>

<body>
	<div id="content-container">
	<%@ include file="/include/headerLayout.jsp" %>

		<p><br></p>
		<div id="content">
			<div id="content-header">
				<h1><s:text name="it.ecomweb.page.title.product"/></h1>
			</div>
			<div id="content-body">
					<div class="subcolumn1-1" id="content-text">
						<h2><s:text name="it.ecomweb.page.product.text1"/></h2><br>
						<p><s:text name="it.ecomweb.page.product.text2"/></p>
						<p><s:text name="it.ecomweb.page.product.text3"/></p>
						<p><s:text name="it.ecomweb.page.product.text4"/></b>
						<p><s:text name="it.ecomweb.page.product.text5"/></p>
						<p><s:text name="it.ecomweb.page.product.text6"/></p>
					</div>
				
					<div class="subcolumn1-3" id="content-form">
						<h2><s:text name="it.ecomweb.page.product.text7"/></h2><br>
						<p><s:text name="it.ecomweb.page.product.text8"/>
						<br>
						<s:text name="it.ecomweb.page.product.text9"/>
						<br>
						<s:text name="it.ecomweb.page.product.text10"/>
						<a href="<s:property value="#pagePath" />/main/download.action#compareProduct">
						<s:text name="it.ecomweb.page.product.text11"/>
						</a>
						</p>
					</div>
					
					<div class="subcolumn2-3" id="content-text">
						<h2><s:text name="it.ecomweb.page.product.text12"/></h2><br>
						<p>Immagine versione free</p>
					</div>
					
					<div class="subcolumn3-3" id="content-text">
						<h2><s:text name="it.ecomweb.page.product.text13"/></h2><br>
						<p>Immagine versione enterprise</p>
					</div>
					
				</div>
			
			</div>
			
			    <div id="content-footer">
			<a style="float: left;"><img style="margin: 10px;"src="./res_img/creditCards.png"
				
								<!-- AddThis Button BEGIN -->
				<div style="margin-right: 30px;margin-top: 10px;margin-left: 100px;width: 250px;display: inline-block;" class="addthis_toolbox addthis_default_style addthis_32x32_style">
				
				<p style="font-size:15px;color:#36aad8;font-family: arial;font-weight: normal;margin-right: 10px;line-height: 0.3;">Condividi</p>
				 <a class="addthis_button_facebook"></a>
	    					   <a class="addthis_button_twitter"></a>
	    					   <a class="addthis_button_pinterest_share"></a>
	    					   <a class="addthis_button_linkedin"></a>
	    					   <a class="addthis_button_google_plusone_share"></a>
				</div>
				
				
					<a style="float: right;margin-right: 30px;font-size: 15px;color: #36aad8;font-family: arial;font-weight: normal;" href="./termsAndConditions.jsp"><br>Termini e condizioni di vendita</a>
				
				
				
				<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-525d1d5f0490962c"></script>
				
				<!-- per rimuovere hash dall'url -->
				<script type="text/javascript">
		          var addthis_config = addthis_config||{};
		          addthis_config.data_track_addressbar = false;
		        </script>
				<!-- AddThis Button END -->
				
		</div>
		</div>
	</div>
	<%@ include file="/include/footerLayout.jsp" %>
</body>