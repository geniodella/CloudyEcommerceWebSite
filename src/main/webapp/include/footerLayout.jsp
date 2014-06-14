
<script>
	
	jQuery(document).ready(function() {
					jQuery.i18n.properties({
						    name:'Application', 
						    path:'./resources/', 
						    mode:'both',
						    	  callback: function() {
								  
									$('#footerLabel').append(jQuery.i18n.prop('org.commercialsite.footer.descr'));
									}
					});
	});
</script>

<div id="footer">
	<table align="center";width="480">
           <tr>
         <td id="footerLabel" style="color:black; text-align:center; font-size:12px;line-height: 2;font-family: arial;">
			 			
					
         </td>
    
         </tr>
         </table>
</div>