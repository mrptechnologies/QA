<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ProductTaxId" property="answer(Object::Product::Tax::Definition::ProductTaxId)" name="AddTaxDefinition"/>
<bean:define id="ProductTaxName" property="answer(Object::Product::Tax::Definition::TaxName)" name="AddTaxDefinition"/>

<!--  <SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddTax.js"></SCRIPT>-->

<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
	
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td class="NewSectionHead" colspan="4" align="center">TAX SUMMARY</td>
				</tr>

				<tr><td>&nbsp;</td></tr>
				
				<tr>
					<td width="100%" align="center" class="sectionhead">TAX DETAILS</td>
				</tr>
				
				<tr><td>&nbsp;</td></tr>
			<tr>
					<td colspan="20" class="links" width="400px">
						<a href="../taxdefinition/AssociateStateTax.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&StateTaxId=<%=ProductTaxId%>">Associate New State</a>
					</td>	
				</tr>	
					
				<tr>
					<td><hr size="1" noshade></td>
				</tr>
				<tr><td>&nbsp;</td></tr>				
				<tr>	
					<td>
						<html:form action="/AddTaxDefinitionAction.do" >		
							
							<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
								<tr>
									<td class="TextMatter1">
										
										<table WIDTH="60%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
											
											<tr>
												<td  class="sectionhead1" align="left" width="25%">Tax Category</td>
												<td class="TextMatter" align="left">:<bean:write  property='answer(Object::Product::Tax::Definition::TaxCategory)' name='AddTaxDefinition' /></td>
											</tr>
											
											<tr>
												<td class="sectionhead1" align="left">Tax Name</td>
												<td class="TextMatter" align="left">:<bean:write property="answer(Object::Product::Tax::Definition::TaxName)" name="AddTaxDefinition"/></td>
											</tr>

											<tr>
												<td class="sectionhead1" align="left">Tax Description</td>
												<td class="TextMatter" align="left">:<bean:write property="answer(Object::Product::Tax::Definition::TaxDescription)" name="AddTaxDefinition" /></td>
											</tr>
											
											<tr>
												<td class="sectionhead1" align="left">Active</td>
												<td class="TextMatter" align="left">:<bean:write property="answer(Object::Product::Tax::Definition::Active)" name="AddTaxDefinition" /></td>
											</tr>											
											 
											<tr><td>&nbsp;</td></tr>
											<tr><td>&nbsp;</td></tr>
											
											<tr>
												<td>
													
													<html:hidden property="answer(dbName)" value='<bean:message key="DMS.dbname" />' />
													<html:hidden property="answer(Object::Product::Tax::Definition::OwnerId)" value="<%= ""+ownerId %>" />
													<html:hidden property="answer(Object::Product::Tax::Definition::VerActive)" value="Y" />
													<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
													<html:hidden property="answer(Object::Product::Tax::Definition::CreatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Tax::Definition::UpdatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Tax::Definition::VerCreatedBy)" value="<%=userName.toString()%>" />
												</td>
											</tr>
											
										</table>
										<tr>
											<td align="left">
												<table>
													<tr>
														<td align="center"><dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</td>
								</tr>
							</table>
						</html:form>			
					</td>
				</tr>

			</table>
		</td>
	</tr>
</table>