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
<bean:define id="intPageNum" property="answer(Object::Alert::PageNum)" name="SearchAlert" />

<html:form action="/SearchAlertAction.do" >


	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		
		<tr>	
		<td class="sectionhead" width="6%" align="left">
							Number of Records Found:<%= request.getAttribute("noOfRecords") %>
		</td>
		</tr>
		
		<tr>
			<td>&nbsp;</td>
		</tr>
		
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">ALERT LIST</td>
		</tr>
		
		<tr>
			<td>&nbsp;</td>
		</tr>				
		
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">		
					<logic:present name='listOfalert' scope="request">
						
						<tr>
							<td>&nbsp;</td>
						</tr>
					
						<tr>
							<td class="sectionhead" width="3%" align="center">
								S.no
							</td>
							<td>&nbsp;</td>	
							<td class="sectionhead" width="6%" align="center">
								AlertId
							</td>	
							<td>&nbsp;</td>								  					
							<td class="sectionhead" width="6%" align="center">
								AlertName
							</td>
							<td>&nbsp;</td>
							<td class="sectionhead" width="6%" align="center">
								AlertMessage
							</td>
							<td>&nbsp;</td>																			    
						    <td class="sectionhead" width="6%" align="center">
						    	ObjectType
						    </td>
						    <td>&nbsp;</td>
						    <td class="sectionhead" width="6%" align="center">
						    	ObjectStatus
						    </td>
						    <td>&nbsp;</td>
						    <td class="sectionhead" width="6%" align="center">
						    	AssignedUser
						    </td>						    
						    <td>&nbsp;</td>	
						    <td class="sectionhead" width="6%" align="center">
						    	AssignedRoleId
						    </td>	
						    <td>&nbsp;</td>					    
						    <td class="sectionhead" width="4%" align="center">
						    	CreatedBy
						    </td>
						    <td>&nbsp;</td>
						    <td class="sectionhead" width="4%" align="center">
						    	UpdatedBy
						    </td>
						    <td>&nbsp;</td>
						    <td class="sectionhead" width="4%" align="center">
						    	CreatedDate
						    </td>
						    <td>&nbsp;</td>
						    <td class="sectionhead" width="4%" align="center">
						    	UpdatedDate
						    </td>
						    	    
					   </tr>
					   
					    <% int index=0; %>							
						<%  
							java.util.ArrayList arrlistdocs = (java.util.ArrayList)request.getAttribute("listOfalert");
							for(int Index=0;Index<arrlistdocs.size();Index++){
								com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistdocs.get(Index);										
						%>
							
						<tr>
							<td class="SearchResult" align="left" width="180px">									
									<% index++; %>								
									<%=index%>
									
							</td>
							<td>&nbsp;</td>
							<td class="SearchResult" align="center" >
								<a href="/alert/AssociateAlert.jsp?TabPanelName=Manage_Panel&answer(Object::Alert::OwnerId)=<%=qmap.getString("Object::Alert::OwnerId") %>&answer(Object::Alert::AlertId)=<%=qmap.getString("Object::Alert::AlertId") %>"> <%=qmap.getString("Object::Alert::AlertId") %> </a>
								
							</td>
							<td>&nbsp;</td>
							<td class="SearchResult" align="center" >
								<%=qmap.getString("Object::Alert::AlertName") %>								
							</td>
							<td>&nbsp;</td>
							<td class="SearchResult" align="center" >
								<%=qmap.getString("Object::Alert::AlertMessage") %>								
							</td>
													
							<td>&nbsp;</td>
							<td class="SearchResult" align="center" >
								<%=qmap.getString("Object::Alert::ObjectType") %>
								
							</td>
							<td>&nbsp;</td>
							<td class="SearchResult" align="center" >
								<%=qmap.getString("Object::Alert::ObjectStatus") %>
								
							</td>
							<td>&nbsp;</td>
							<td class="SearchResult" align="center" >
								<%=qmap.getString("Object::Alert::AssignedUser") %>
								
							</td>
							<td>&nbsp;</td>
							<td class="SearchResult" align="center" >
								<%=qmap.getString("Object::Alert::AssignedRoleId") %>
								
							</td>
							<td>&nbsp;</td>														
							<td class="SearchResult" align="center" >
								<%= qmap.getString("Object::Alert::CreatedBy")%>
								
							</td>
							<td>&nbsp;</td>
							<td class="SearchResult" align="center" >
								<%= qmap.getString("Object::Alert::UpdatedBy")%>
								
							</td>
							<td>&nbsp;</td>
							<td class="SearchResult" align="center" >
								<%= qmap.getString("Object::Alert::CreatedDate")%>
								
							</td>
							<td>&nbsp;</td>
							<td class="SearchResult" align="center" >
								<%= qmap.getString("Object::Alert::UpdatedDate")%>
								
							</td>			
						</tr>							
							<%}%>
						
					
						<tr><td>&nbsp;</td></tr>	
											
				</logic:present>
			</table>
				
		</td>
	</tr>
		
		<tr>
			<td>
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
		
