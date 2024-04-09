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
<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../SearchAlertDefinitionAction.do?answer(ownerId)=<%=""+ownerId %>&answer(Object::Alert::Definition::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>

<html:form action="/SearchAlertDefinitionAction.do">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>


	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td height="5">
			</td>
		</tr>
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">ALERT DEFINITON LIST</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td class="links" align="left" colspan="2"><a href="../AddAlertDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&clear=yes" >Add ALERT DEFINITION</a>
			</td>
		</tr>
		<tr><td></td></tr>
		
		<logic:notPresent name='listOfAlertDefinition' scope="request">
		<tr>
			<td>
				<table>
					<tr>
						<td class="Error">
							<% String DisplayString ="No Document Found starting with letter ";
							String searchLetter=request.getParameter("answer(Object::Alert::Definition::AlertName)");%>	
							<%if (searchLetter==null || searchLetter.equals("")) {
								DisplayString="No Document Found";
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
		
		<logic:present name='alertSize' scope="request">
			<bean:define id="alertSize1" name="alertSize" />
			<tr><td><html:hidden property="answer(Object::Alert::Definition::TotalRec)" value="<%= alertSize1.toString()%>" /></td></tr>
			<tr><td class="FormLabels">No of Documents Found:&nbsp;<%=alertSize1.toString()%></td></tr>
			<tr><td>&nbsp;</td></tr>
		</logic:present>	
		
		
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">		
					<logic:present name='listOfAlertDefinition' scope="request">
						<tr>
							<td align="Left" class="links" colspan="3">
								<logic:present name="prevDocument"  scope="request" >
									<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >
									<bean:message key="Common.Previous"/></a>
								</logic:present>
							</td>
							
							<td align="right" class="links" colspan="4">
								<logic:present name="moreDocument"  scope="request" >
									<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)+1)%>)" >Next&gt;&gt;</a>
								</logic:present>
							</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
					
						<tr>			
							<td class="sectionhead" width="3%" align="left">
								<bean:message key="AlertList.Sno"/>
							</td> 				  					
							<td class="sectionhead" width="10%" align="left">
								<bean:message key="AlertList.AlertName"/>
							</td>
							<td class="sectionhead" width="40%" align="left">
				  				<bean:message key="AlertList.AlertType"/>
				  			</td>				    
						    <td class="sectionhead" width="10%" align="left">
						    	<bean:message key="AlertList.ExpirationType"/>
						    </td>
						    <td class="sectionhead" width="10%" align="left">
						    	<bean:message key="AlertList.ExpirationUnit"/>
						    </td>
						    <td class="sectionhead" width="10%" align="left">
						    	<bean:message key="AlertList.ObjectType"/>
						    </td>
						    <td class="sectionhead" width="4%" align="left">
						    	Active
						    </td>
						    	    
					   </tr>
					
					<!-- logic:present name='listOfAlertDefinition' scope="request" -->
						<% int index=0; %>
						
						<%
							String pageNum = (String)intPageNum.toString();	%>						
<%							try{
								index = Integer.parseInt(pageNum);
								index = index*40;
							}catch(NumberFormatException nfe){
								index=0;
							}
							
						%>			
						
						<!-- logic:iterate id="listOfAlertDefinition" name="listOfAlertDefinition" scope="request" -->			
							
							
							<%
								java.util.ArrayList arrlistdocs = (java.util.ArrayList)request.getAttribute("listOfAlertDefinition");
								for(int docIndex=0;docIndex<arrlistdocs.size();docIndex++){
									com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistdocs.get(docIndex);										
							%>
							
							<tr>
								<td class="SearchResult" align="left" width="180px">
									<% index++; %>								
									
									<%=index%>
									
								</td>
								<td class="SearchResult" align="left" >
									<%=qmap.getString("Object::Alert::Definition::AlertName") %>
									<!-- bean:write name="listOfAlertDefinition" property="Object::Alert::Definition::AlertName" / -->&nbsp;
								</td>
								<td class="SearchResult" align="left" >									
									<%=qmap.getString("Object::Alert::Definition::AlertType") %>
									<!-- bean:write name="listOfAlertDefinition" property="Object::Alert::Definition::AlertType" /--> </a>&nbsp;
								</td>									
								<td class="SearchResult" align="left" >
									<%=qmap.getString("Object::Alert::Definition::ExpirationType") %>
									<!-- bean:write name="listOfAlertDefinition" property="Object::Alert::Definition::ExpirationType" /-->&nbsp;
								</td>
								<td class="SearchResult" align="left" >
									<%=qmap.getString("Object::Alert::Definition::ExpirationUnit")  %>	
									<!-- bean:write name="listOfAlertDefinition" property="Object::Alert::Definition::ExpirationUnit" / -->&nbsp;
								</td>
								<td class="SearchResult" align="left" >
									<%=qmap.getString("Object::Alert::Definition::ObjectType") %>
									<!-- bean:write name="listOfAlertDefinition" property="Object::Alert::Definition::ObjectType" / -->&nbsp;
								</td>
								<td class="SearchResult" align="center" >
									<%= qmap.getString("Object::Alert::Definition::Active")%>
									<!-- bean:write name="listOfAlertDefinition" property="Object::Alert::Definition::Active" / -->&nbsp;
								</td>		
							</tr>							
							<%}%>
						<!-- /logic:iterate -->
					
					<tr><td>&nbsp;</td></tr>	
					<tr>
						<td align="left" class="links" colspan="3">
							<logic:present name="prevDocument"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
				
						<td align="right" class="links" colspan="4">
							<logic:present name="moreDocument"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)+1)%>)" >Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>							
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
		
