
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/header.jsp"%>

<body>
	<%@ include file="/include/headerLayout.jsp"%>
	<div id="content-container">

		<div id="content">

			<table style="background: transparent; border-spacing: 0;">
				<tr>
					<td style="width: 50%; background: transparent"></td>

					<td style="border-radius: 5px; background: transparent">

						<div id="content-body">
							<div class="subcolumn1-1" id="content-text">

								<br> <img
									src="<s:property value="#imagePath"/>/diagramma.png">
							</div>

						</div>

						</div>

						<div id="content-footer">
							<a href="https://www.paypal.com/it/mrb/pal=9GUSU3SCTGKWU"
								target="_blank"><img
								src="<s:property value="#imagePath"/>/bnr_paypal_mrb_banner_468wx60h.gif"
								alt="%{getText('it.ecomweb.global.paypal.subscription')}"
								border="0"></a>
						</div> <%@ include file="/include/footerLayout.jsp"%>
					</td>

					<td style="width: 100%; background: transparent"></td>

				</tr>
			</table>

		</div>
</body>