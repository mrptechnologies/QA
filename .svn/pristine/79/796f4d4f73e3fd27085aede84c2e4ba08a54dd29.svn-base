<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ProductTaxId" property="answer(Object::Product::Tax::Definition::ProductTaxId)" name="AddTaxDefinition"/>
<bean:define id="ProductTaxName" property="answer(Object::Product::Tax::Definition::TaxName)" name="AddTaxDefinition"/>

<!--  <SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddTax.js"></SCRIPT>-->

<table WIDTH="95%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
	
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					
				<tr>
					<td class="NewSectionHead" colspan="4" align="center">EDIT TAX</td>
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
				

				<logic:present name="AddTaxDefinitionFailed" scope="request">
					<tr>
						<td class="Error">
							
							Tax Definition Detail Added Failed
						
						</td>
					</tr>
				</logic:present>

				<tr><td>&nbsp;</td></tr>
											
				<tr>	
					<td>
						<html:form action="/UpdateTaxDefinitionAction.do" >		
							
							<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									<td class="TextMatter1">
										
										<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="2">
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Tax Category</td>
												<td class="links"><html:text name="AddTaxDefinition" property="answer(Object::Product::Tax::Definition::TaxCategory)" styleId="TaxCategory" size="30" maxlength="60" styleClass="txtbox" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Tax Name</td>
												<td class="links"><html:text name="AddTaxDefinition"  property="answer(Object::Product::Tax::Definition::TaxName)" styleId="TaxName" size="30" maxlength="60" styleClass="txtbox" /></td>
											</tr>
											<tr>
												<td width="35%" class="FormLabels" align="left">Tax Type</td>
												<td class="links"><html:text name="AddTaxDefinition" property="answer(Object::Product::Tax::Definition::TaxType)" styleId="TaxType" size="30" maxlength="60" styleClass="txtbox" /></td>
											</tr>


											<tr>
												<td width="35%" class="FormLabels" align="left">Tax Description</td>
												<td class="links"><html:textarea name="AddTaxDefinition" property="answer(Object::Product::Tax::Definition::TaxDescription)" styleId="TaxDesc" rows="3" cols="29" styleClass="txtarea" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Active</td>
												<td class="links">
													<html:select  name="AddTaxDefinition"  property="answer(Object::Product::Tax::Definition::Active)" styleId="Active" styleClass="txtbox">
														<html:option value ="Y">Active</html:option>
														<html:option value ="N">InActive</html:option>														
													</html:select>
												</td>
											</tr>											
											
											<tr><td>&nbsp;</td></tr>
											<tr><td>&nbsp;</td></tr>
											
											<tr>
												<td>&nbsp;</td>
												<td align="left">
													<html:submit value="Save" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>&nbsp;&nbsp;&nbsp;
													<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
												</td>
											</tr>
											
											<tr>
												<td>
													
													<html:hidden property="answer(dbName)" value='<bean:message key="DMS.dbname" />' />
													<html:hidden property="answer(Object::Product::Tax::Definition::OwnerId)" value="<%= ""+ownerId %>" />
													<html:hidden property="answer(Object::Product::Tax::Definition::VerActive)" value="Y" />
													<html:hidden property="answer(Object::Product::Tax::Definition::CreatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Tax::Definition::UpdatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Tax::Definition::VerCreatedBy)" value="<%=userName.toString()%>" />
													<bean:define id="productTaxId" name="AddTaxDefinition" property="answer(Object::Product::Tax::Definition::ProductTaxId)" />
													<html:hidden property="answer(Object::Product::Tax::Definition::ProductTaxId)" value="<%= ""+productTaxId %>" />
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