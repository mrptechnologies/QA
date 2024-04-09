<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ProductTaxId" property="answer(Object::Product::Tax::Definition::ProductTaxId)" name="AddTaxDefinition"/>
<bean:define id="ProductTaxName" property="answer(Object::Product::Tax::Definition::TaxName)" name="AddTaxDefinition"/>


<table WIDTH="95%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
	
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
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
						<a href="../TaxAssociatedStatesListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&TaxName=<%=ProductTaxName%>&ProductTaxId=<%=ProductTaxId%>">Associated States</a>
					</td>	
				</tr>				
				<tr>
					<td><hr size="1" noshade></td>
				</tr>

				<tr><td>&nbsp;</td></tr>
											
				<tr>	
					<td>
						<html:form action="/AddTaxDefinitionAction.do" >		
							
							<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									<td class="TextMatter1">
										
										<table WIDTH="60%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
											
											<tr>
												<td width="25%" class="sectionhead1" align="left">Tax Category</td>
												<td class="links">:<bean:write property="answer(Object::Product::Tax::Definition::TaxCategory)" name="AddTaxDefinition"/></td>
											</tr>
											
											<tr>
												<td width="25%" class="sectionhead1" align="left">Tax Name</td>
												<td class="links">:<bean:write property="answer(Object::Product::Tax::Definition::TaxName)" name="AddTaxDefinition" /></td>
											</tr>
											
											<tr>
												<td width="25%" class="sectionhead1" align="left">Tax Type</td>
												<td class="links">:<bean:write property="answer(Object::Product::Tax::Definition::TaxType)" name="AddTaxDefinition" /></td>
											</tr>

											<tr>
												<td width="25%" class="sectionhead1" align="left">Tax Description</td>
												<td class="links">:<bean:write  property="answer(Object::Product::Tax::Definition::TaxDescription)" name="AddTaxDefinition" /></td>
											</tr>
											
											<tr>
												<td width="25%" class="sectionhead1" align="left">Active</td>
												<td class="links">:<bean:write property="answer(Object::Product::Tax::Definition::Active)" name="AddTaxDefinition"/></td>
											</tr>											
											<tr>
												<td>
													
													<html:hidden property="answer(dbName)" value='<bean:message key="DMS.dbname" />' />
													<html:hidden property="answer(Object::Product::Tax::Definition::OwnerId)" value="<%= ""+ownerId %>" />
													<html:hidden property="answer(Object::Product::Tax::Definition::VerActive)" value="Y" />
													<html:hidden property="answer(Object::Product::Tax::Definition::CreatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Tax::Definition::UpdatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Tax::Definition::VerCreatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
												</td>
											</tr>
											
										</table>										
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