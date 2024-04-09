<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ProductFeeId" property="answer(Object::Product::Fee::Definition::ProductFeeId)" name="AddFeeDefinition"/>
<bean:define id="ProductFeeName" property="answer(Object::Product::Fee::Definition::FeeName)" name="AddFeeDefinition"/>

<!--  <SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddFee.js"></SCRIPT>-->

<table WIDTH="95%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
	
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					
				<tr>
					<td class="NewSectionHead" colspan="4" align="center">EDIT FEE</td>
				</tr>

				<tr><td>&nbsp;</td></tr>				

				<tr>
					<td width="100%" align="center" class="sectionhead">FEE DETAILS</td>
				</tr>

				<tr><td>&nbsp;</td></tr>
				
				<tr>
					<td colspan="20" class="links" width="400px">
						<a href="../AssociatedStatesListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&FeeName=<%=ProductFeeName%>&ProductFeeId=<%=ProductFeeId%>">Associated States</a>
					</td>	
				</tr>	
				

				<logic:present name="AddFeeDefinitionFailed" scope="request">
					<tr>
						<td class="Error">
							
							Fee Definition Detail Added Failed
						
						</td>
					</tr>
				</logic:present>

				<tr><td>&nbsp;</td></tr>
											
				<tr>	
					<td>
						<html:form action="/UpdateFeeDefinitionAction.do" >		
							
							<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									<td class="TextMatter1">
										
										<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="2">
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Fee Category</td>
												<td class="links"><html:text name="AddFeeDefinition" property="answer(Object::Product::Fee::Definition::FeeCategory)" styleId="FeeCategory" size="30" maxlength="60" styleClass="txtbox" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Fee Name</td>
												<td class="links"><html:text name="AddFeeDefinition"  property="answer(Object::Product::Fee::Definition::FeeName)" styleId="FeeName" size="30" maxlength="60" styleClass="txtbox" /></td>
											</tr>

											<tr>
												<td width="35%" class="FormLabels" align="left">Fee Description</td>
												<td class="links"><html:textarea name="AddFeeDefinition" property="answer(Object::Product::Fee::Definition::FeeDescription)" styleId="FeeDesc" rows="3" cols="29" styleClass="txtarea" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Active</td>
												<td class="links">
													<html:select  name="AddFeeDefinition"  property="answer(Object::Product::Fee::Definition::Active)" styleId="Active" styleClass="txtbox">
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
													<html:hidden property="answer(Object::Product::Fee::Definition::OwnerId)" value="<%= ""+ownerId %>" />
													<html:hidden property="answer(Object::Product::Fee::Definition::VerActive)" value="Y" />
													<html:hidden property="answer(Object::Product::Fee::Definition::CreatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Fee::Definition::UpdatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Fee::Definition::VerCreatedBy)" value="<%=userName.toString()%>" />
													<bean:define id="productFeeId" name="AddFeeDefinition" property="answer(Object::Product::Fee::Definition::ProductFeeId)" />
													<html:hidden property="answer(Object::Product::Fee::Definition::ProductFeeId)" value="<%= ""+productFeeId %>" />
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