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

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>


<table WIDTH="90%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td height="5">
			</td>
		</tr>
		<tr>
			<td class="NewSectionHead" colspan="9" align="center">CLEARED DATA RESULT</td>
		</tr>
		<tr><td>&nbsp;</td></tr>		
		<tr><td></td></tr>		
		<logic:notPresent name='ClearanceRecords' scope="request">
				<tr>
					<td>
						<table>
							<tr>
								<td class="Error">
									<% String DisplayString ="No Records Found";%>							
									<%=DisplayString%>								
								</td>
							</tr>
							
						</table>
					</td>
				</tr>				
				</logic:notPresent>			
				<logic:present name='ClearanceRecords' scope="request" >									
									<tr>				
										<td class="sectionhead" align="left">No</td>										
										<td class="sectionhead" align="left">Policy Number</td>
										<td class="sectionhead" align="left">Agency Name</td>
										<td class="sectionhead" align="left">Legal Name1</td>
										<td class="sectionhead" align="left">Legal Name2</td>
										<td class="sectionhead" align="left">First Name</td>
										<td class="sectionhead" align="left">Last Name</td>
										<td class="sectionhead" align="left">Product</td>
										<td class="sectionhead" align="left">Zipcode</td>
									</tr>									
									<%
										java.util.ArrayList arrlistdocs = (java.util.ArrayList)request.getAttribute("ClearanceRecords");
										int index=0;
										for(int docIndex=0;docIndex<arrlistdocs.size();docIndex++){
											com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistdocs.get(docIndex);										
									%>														
									<tr>
										<td class="SearchResult" align="left" width="180px">
											<% index++;%>
											<%=index%>								
										</td>
										<!-- <td class="SearchResult" align="left" >
											 <%//=qmap.getString("Object::Clearance::ClearanceId") %>
										</td> -->
										<td class="SearchResult" align="left" >
											<%=qmap.getString("Object::Clearance::PolicyNumber") %>
										</td>										
										<td class="SearchResult" align="left" >
											<%=qmap.getString("Object::Clearance::Agency") %>
										</td>
										<td class="SearchResult" align="left" >
											<%=qmap.getString("Object::Clearance::LegalName1") %>									
										</td>									
										<td class="SearchResult" align="left" >
											<%=qmap.getString("Object::Clearance::LegalName2") %>									
										</td>
										<td class="SearchResult" align="left" >
											<%=qmap.getString("Object::Clearance::FirstName") %>									
										</td>									
										<td class="SearchResult" align="left" >
											<%=qmap.getString("Object::Clearance::LastName") %>									
										</td>
										<td class="SearchResult" align="left" >
											<%=qmap.getString("Object::Clearance::Product") %>
										</td>
										<td class="SearchResult" align="left" >
											<%=qmap.getString("Object::Clearance::Zipcode") %>
										</td>																																			
									</tr>							
									<%}%>							
							<tr><td>&nbsp;</td></tr>			
						</logic:present>							
</table>
			
				

		
