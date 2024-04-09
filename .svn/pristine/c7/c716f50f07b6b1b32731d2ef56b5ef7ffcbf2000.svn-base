<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<html:form action="/FindTaxDefinitionAction.do">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td height="5">
			</td>
		</tr>
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">TAX LIST</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan="20" class="links" width="400px">
				<a href="../product/AddTaxDefinition.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>">Add Tax</a>
			</td>
		</tr>
		<tr>
			<td><hr size="1" noshade></td>
		</tr>
		<logic:notPresent name='findArrOfTaxDefinitionDetail' scope="request">
		<tr>
			<td>
				<table>
					<tr>
						<td class="Error">
							<% String DisplayString ="No Tax Found starting with letter ";
							String searchLetter=request.getParameter("answer(Object::Product::Tax::Definition::TaxName)");%>	
							<%if (searchLetter==null || searchLetter.equals("")) {
								DisplayString="No Tax Found";
							}%>
							<%=DisplayString%>
							<%if (searchLetter!=null) {%>	
								<%=searchLetter%>
							<%}%>	
						</td>
					</tr>
					
				</table>
			</td>
		</tr>
		</logic:notPresent>		
		
		
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">		
				
					<logic:present name='findArrOfTaxDefinitionDetail' scope="request">
					
					<tr><td>&nbsp;</td></tr>
					
					<tr>			
						<td class="sectionhead" width="5%" align="center">
							S.No
						</td> 				  					
						<td class="sectionhead" width="30%" align="center">
							Tax Name
						</td>
						<td class="sectionhead" width="30%" align="center">
			  				Tax Category
			  			</td>				    
					    <td class="sectionhead" width="30%" align="center">
					    	Tax Type
					    </td>
					    <td class="sectionhead" width="20%" align="center">
					    	Active
					    </td>
				   </tr>
				   <% 
				   		int index=0; 
				   
				   %>
				   <logic:iterate id="findTax" name="findArrOfTaxDefinitionDetail" scope="request">
			   			<tr>
		   					<td class="SearchResult" align="right" width="180px">
								<% index++; %>								
								<%=index%>
							</td>
							<bean:define id="productTaxId" name="findTax" property="Object::Product::Tax::Definition::ProductTaxId" />
				   			<td class="SearchResult" align="left" >
								<a href="/EditTaxDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Tax::Definition::OwnerId)=<%=""+ownerId%>&answer(Object::Product::Tax::Definition::ProductTaxId)=<%= ""+productTaxId%>">
									<bean:write name="findTax" property="Object::Product::Tax::Definition::TaxName"/>
								</a>
							</td>
							<td class="SearchResult" align="left" >
								<bean:write name="findTax" property="Object::Product::Tax::Definition::TaxCategory"/>
							</td>
							<td class="SearchResult" align="left" >
								<bean:write name="findTax" property="Object::Product::Tax::Definition::TaxType"/>
							</td>
							<td class="SearchResult" align="left" >
								<bean:write name="findTax" property="Object::Product::Tax::Definition::Active"/>
							</td>
						</tr>							
				   </logic:iterate>
				  </logic:present>
				</table>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td align="right">
				<table>
					<tr>
						<td align="center"><dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</html:form>
