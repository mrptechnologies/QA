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

<html:form action="/FindFeeDefinitionAction.do">

	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td height="5">
			</td>
		</tr>
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">FEE LIST</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan="20" class="links" width="400px">
				<a href="../product/AddFees.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>">Add Fee</a>
			</td>
		</tr>
		<tr>
			<td><hr size="1" noshade></td>
		</tr>
		<logic:notPresent name='findArrOfFeeDefinitionDetail' scope="request">
		<tr>
			<td>
				<table>
					<tr>
						<td class="Error">
							<% String DisplayString ="No Fee Found starting with letter ";
							String searchLetter=request.getParameter("answer(Object::Product::Fee::Definition::FeeName)");%>	
							<%if (searchLetter==null || searchLetter.equals("")) {
								DisplayString="No Fee Found";
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
				
					<logic:present name='findArrOfFeeDefinitionDetail' scope="request">
					
					<tr><td>&nbsp;</td></tr>
					
					<tr>			
						<td class="sectionhead" width="5%" align="center">
							S.No
						</td> 				  					
						<td class="sectionhead" width="30%" align="center">
							Fee Name
						</td>
						<td class="sectionhead" width="30%" align="center">
			  				Fee Category
			  			</td>				    
					    <td class="sectionhead" width="30%" align="center">
					    	Active
					    </td>
				   </tr>
				   <% 
				   		int index=0; 
				   
				   %>
				   <logic:iterate id="findFee" name="findArrOfFeeDefinitionDetail" scope="request">
			   			<tr>
		   					<td class="SearchResult" align="center" width="180px">
								<% index++; %>								
								<%=index%>
							</td>

							<bean:define id="productFeeId" name="findFee" property="Object::Product::Fee::Definition::ProductFeeId" />
				   			<td class="SearchResult" align="center" >
				   				<a href="/GetFeeDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Product::Fee::Definition::OwnerId)=<%=""+ownerId%>&answer(Object::Product::Fee::Definition::ProductFeeId)=<%= ""+productFeeId%>">
									<bean:write name="findFee" property="Object::Product::Fee::Definition::FeeName"/>
								</a>
							</td>
							<td class="SearchResult" align="center" >
								<bean:write name="findFee" property="Object::Product::Fee::Definition::FeeCategory"/>
							</td>
							<td class="SearchResult" align="center" >
								<bean:write name="findFee" property="Object::Product::Fee::Definition::Active"/>
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
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</html:form>
