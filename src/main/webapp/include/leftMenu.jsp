<%
/**
* Title: E-Commerce CMS 
* Description: E-Commerce CMS 
* Copyright: Copyright (c) 2008
* Company: 
* 
* @author Enrico Cesaretti
* @version 1.0
*/
 %>
<table  cellpadding="0" cellspacing="0" class="globalBackground">
	<%//<tr><td align="left"><img src="<s:property value="#imagePath"/>/menusx_up.jpg" ></td></tr>%>
	<s:if test="%{menuItems.size != 0}">		
		<tr>
			<td align="left">
				<table class="leftMenu" width="100%"  cellpadding="0" cellspacing="0">
					<s:iterator value="%{menuItems}" id="menuItem">
						<s:if test="%{#menuItem.active && parent == ''}">
<tr>
<td height="5"></td>
</tr>
							<tr>
								<td class="leftMenu">
									<s:if test="%{#menuItem.url != null && #menuItem.url != '' && #menuItem.url.size != 0}">
										<span class="menu"><a class="leftMenu" href="#"><s:text name="%{#menuItem.description}"/></a></span>
									</s:if>
									<s:elseif test="%{#menuItem.url != null && #menuItem.url == '' && #menuItem.actionName == ''}">
										<span class="menu"><a class="leftMenu" href="#"><s:text name="%{#menuItem.description}"/></a></span>
									</s:elseif>
									<s:else>
										<span class="menu"><a class="leftMenu" href="#"><s:text name="%{#menuItem.description}"/></a></span>
									</s:else>
								</td>
							</tr>
							<tr>
								<td height="10"/>
							</tr>
							<%-- se ha sottomenu associati al ruolo li visualizzo --%>

							<s:if test="%{#menuItem.sons.size > 0 }">
								
								<tr>
									<td class="leftSubMenu">
										<table class="leftSubMenu">
											<tr>
												<td class="leftSubMenu">
													<div class="submenu">
														<s:iterator value="#menuItem.sons" id="subMenu">
															<s:set name="isInRole" value="false"/>
																<s:iterator value="#subMenu.roles" id="itemRole">
																	<s:if test="%{#itemRole.id == userRole.id}">
																		<s:set name="isInRole" value="true"/>
																	</s:if>
																</s:iterator>
																<s:if test="%{#isInRole == true}">
																	<table class="leftSubMenu">
																		<tr>
																			<td class="leftSubMenu" height="20">
																				<s:if test="%{#menuItem.url != null && #subMenu.url != '' && #subMenu.url.size != 0}">
																					- <a class="leftSubMenu" href="<s:property value="#subMenu.url" />"><s:text name="%{#menuItem.description}"/></a>
																				</s:if>
																				<s:else>
																					- <a class="leftSubMenu" href="<s:url action="%{#subMenu.actionName}" namespace="%{#subMenu.namespace}"></s:url>"><s:text name="%{#subMenu.description}"/></a>
																				</s:else>
																			</td>
																		</tr>
																		<tr>
																			<td height="5"/>
																		</tr>
																	</table>
																</s:if>
														</s:iterator>
													</div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</s:if>
						</s:if>
					</s:iterator>
					<tr><td height="10"></tr>
					<tr>
						<td><a class="logout" href="<s:url action="main/logout" namespace="/panel" />">Logout</a></td>
					</tr>
				</table>
			</td>
		</tr>
	</s:if>
	<tr><td height="5"></tr>
</table>