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
<bean:define id="intPageNum" property="answer(Object::Alert::Definition::PageNum)" name="SearchAlertDefinition" />

<html:form action="/SearchAlertDefinitionAction.do" >


	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">ALERT DEFINITON LIST</td>
		</tr>
		
		<tr>
			<td>&nbsp;</td>
		</tr>				
		
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">		
					<logic:present name='listOfAlertDefinition' scope="request">
						
						<tr>
							<td>&nbsp;</td>
						</tr>
					
						<tr>
							<td class="sectionhead" width="3%" align="left">
								S.no
							</td>										  					
							<td class="sectionhead" width="6%" align="left">
								AlertName
							</td>
							<td class="sectionhead" width="6%" align="left">
				  				AlertType
				  			</td>				  							    
						    <td class="sectionhead" width="6%" align="left">
						    	ExpirationType
						    </td>
						    <td class="sectionhead" width="6%" align="left">
						    	ExpirationUnit
						    </td>
						    <td class="sectionhead" width="6%" align="left">
						    	ObjectType
						    </td>
						    <td class="sectionhead" width="6%" align="left">
						    	ObjectStatus
						    </td>
						    <td class="sectionhead" width="4%" align="left">
						    	Active
						    </td>
						    <td class="sectionhead" width="4%" align="left">
						    	CreatedBy
						    </td>
						    <td class="sectionhead" width="4%" align="left">
						    	UpdatedBy
						    </td>
						    <td class="sectionhead" width="4%" align="left">
						    	CreatedDate
						    </td>
						    <td class="sectionhead" width="4%" align="left">
						    	UpdatedDate
						    </td>
						    	    
					   </tr>
					   
					    <% int index=0; %>							
						<%  
							java.util.ArrayList arrlistdocs = (java.util.ArrayList)request.getAttribute("listOfAlertDefinition");
							for(int Index=0;Index<arrlistdocs.size();Index++){
								com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistdocs.get(Index);										
						%>
							
						<tr>
							<td class="SearchResult" align="left" width="180px">									
									<% index++; %>								
									<%=index%>
									
							</td>	
							<td class="SearchResult" align="left" >
								<%=qmap.getString("Object::Alert::Definition::AlertName") %>
								
							</td>
							<td class="SearchResult" align="left" >									
								<%=qmap.getString("Object::Alert::Definition::AlertType") %>
								
							</td>									
							<td class="SearchResult" align="left" >
								<%=qmap.getString("Object::Alert::Definition::ExpirationType") %>
								
							</td>
							<td class="SearchResult" align="left" >
								<%=qmap.getString("Object::Alert::Definition::ExpirationUnit")  %>	
								
							</td>
							<td class="SearchResult" align="left" >
								<%=qmap.getString("Object::Alert::Definition::ObjectType") %>
								
							</td>
							<td class="SearchResult" align="left" >
								<%=qmap.getString("Object::Alert::Definition::ObjectStatus") %>
								
							</td>
							<td class="SearchResult" align="left" >
								<%= qmap.getString("Object::Alert::Definition::Active")%>
								
							</td>
							<td class="SearchResult" align="left" >
								<%= qmap.getString("Object::Alert::Definition::CreatedBy")%>
								
							</td>
							<td class="SearchResult" align="left" >
								<%= qmap.getString("Object::Alert::Definition::UpdatedBy")%>
								
							</td>
							<td class="SearchResult" align="left" >
								<%= qmap.getString("Object::Alert::Definition::CreatedDate")%>
								
							</td>
							<td class="SearchResult" align="left" >
								<%= qmap.getString("Object::Alert::Definition::UpdatedDate")%>
								
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
		
