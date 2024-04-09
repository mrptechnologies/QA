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
<bean:define id="intPageNum" property="answer(Object::Product::Document::Definition::PageNum)" name="FindDocumentDefinition" />
<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../FindDocumentDefinitionAction.do?answer(ownerId)=<%=""+ownerId %>&answer(Object::Product::Document::Definition::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>

<html:form action="/FindDocumentDefinitionAction.do">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="documentId" property="answer(Object::Product::Document::Definition::DocId)" name="FindDocumentDefinition" scope="request"/>
<bean:define id="documentVerId" property="answer(Object::Product::Document::Definition::VerId)" name="FindDocumentDefinition" scope="request"/>




	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td height="5">
			</td>
		</tr>
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">DOCUMENT LIST</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td class="links" align="left" colspan="2"><a href="../AddDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&clear=yes" >Add Document</a>
			</td>
		</tr>
		<tr><td></td></tr>
		
		<logic:notPresent name='findArrOfDocumentDefinitionDetail' scope="request">
		<tr>
			<td>
				<table>
					<tr>
						<td class="Error">
							<% String DisplayString ="No Document Found starting with letter ";
							String searchLetter=request.getParameter("answer(Object::Product::Document::Definition::DocName)");%>	
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
		
		<logic:present name='documentSize' scope="request">
			<bean:define id="documentSize1" name="documentSize" />
			<tr><td><html:hidden property="answer(Object::Product::Document::Definition::TotalRec)" value="<%= documentSize1.toString()%>" /></td></tr>
			<tr><td class="FormLabels">No of Documents Found:&nbsp;<%=documentSize1.toString()%></td></tr>
			<tr><td>&nbsp;</td></tr>
		</logic:present>	
		
		
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">		
					<logic:present name='findArrOfDocumentDefinitionDetail' scope="request">
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
								<bean:message key="DocumentList.Sno"/>
							</td> 				  					
							<td class="sectionhead" width="10%" align="left">
								<bean:message key="DocumentList.DocumentNo"/>
							</td>
							<td class="sectionhead" width="40%" align="left">
				  				<bean:message key="DocumentList.DocumentName"/>
				  			</td>				    
						    <td class="sectionhead" width="10%" align="left">
						    	<bean:message key="DocumentList.DocumentType"/>
						    </td>
						    <td class="sectionhead" width="10%" align="left">
						    	<bean:message key="DocumentList.DocumentStatus"/>
						    </td>
						    <td class="sectionhead" width="10%" align="left">
						    	<bean:message key="DocumentList.VersionNo"/>
						    </td>
						    <td class="sectionhead" width="4%" align="left">
						    	Active
						    </td>
						    	    
					   </tr>
					
					<!-- logic:present name='findArrOfDocumentDefinitionDetail' scope="request" -->
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
						
						<!-- logic:iterate id="findArrOfDocumentDefinitionDetail" name="findArrOfDocumentDefinitionDetail" scope="request" -->			
							
							
							<%
								java.util.ArrayList arrlistdocs = (java.util.ArrayList)request.getAttribute("findArrOfDocumentDefinitionDetail");
								for(int docIndex=0;docIndex<arrlistdocs.size();docIndex++){
									com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistdocs.get(docIndex);										
							%>
							
							<tr>
								<td class="SearchResult" align="left" width="180px">
									<% index++; %>								
									
									<%=index%>
									
								</td>
								<td class="SearchResult" align="left" >
									<%=qmap.getString("Object::Product::Document::Definition::DocNum") %>
									<!-- bean:write name="findArrOfDocumentDefinitionDetail" property="Object::Product::Document::Definition::DocNum" / -->&nbsp;
								</td>
								<td class="SearchResult" align="left" >
									<a href="/EditDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Product::Document::Definition::OwnerId)=<%= qmap.getString("Object::Product::Document::Definition::OwnerId")%>&answer(Object::Product::Document::Definition::DocId)=<%= qmap.getString("Object::Product::Document::Definition::DocId")%>&answer(Object::Product::Document::Definition::VerId)=<%= qmap.getString("Object::Product::Document::Definition::VerId")%>">
									
									<%=qmap.getString("Object::Product::Document::Definition::DocName") %>
									<!-- bean:write name="findArrOfDocumentDefinitionDetail" property="Object::Product::Document::Definition::DocName" /--> </a>&nbsp;
								</td>									
								<td class="SearchResult" align="left" >
									<%=qmap.getString("Object::Product::Document::Definition::DocType") %>
									<!-- bean:write name="findArrOfDocumentDefinitionDetail" property="Object::Product::Document::Definition::DocType" /-->&nbsp;
								</td>
								<td class="SearchResult" align="left" >
									<%=qmap.getString("Object::Product::Document::Definition::ReleaseStatus")  %>	
									<!-- bean:write name="findArrOfDocumentDefinitionDetail" property="Object::Product::Document::Definition::ReleaseStatus" / -->&nbsp;
								</td>
								<td class="SearchResult" align="left" >
									<%=qmap.getString("Object::Product::Document::Definition::RevisionNumber") %>
									<!-- bean:write name="findArrOfDocumentDefinitionDetail" property="Object::Product::Document::Definition::VerName" / -->&nbsp;
								</td>
								<td class="SearchResult" align="center" >
									<%= qmap.getString("Object::Product::Document::Definition::VerActive")%>
									<!-- bean:write name="findArrOfDocumentDefinitionDetail" property="Object::Product::Document::Definition::VerActive" / -->&nbsp;
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
				<bean:define id="active" name="FindDocumentDefinition" property="answer(Object::Product::Document::Definition::Active)" /> 
				<bean:define id="docname" name="FindDocumentDefinition" property="answer(Object::Product::Document::Definition::DocName)" /> 
				<bean:define id="doctype" name="FindDocumentDefinition" property="answer(Object::Product::Document::Definition::DocType)" /> 				
				<bean:define id="docnum" name="FindDocumentDefinition" property="answer(Object::Product::Document::Definition::DocNum)" /> 
				<bean:define id="releasestatus" name="FindDocumentDefinition" property="answer(Object::Product::Document::Definition::ReleaseStatus)" /> 
				
				<html:hidden property="answer(Object::Product::Document::Definition::Active)" value="<%=""+active %>" />
				<html:hidden property="answer(Object::Product::Document::Definition::DocName)" value="<%=""+docname %>" />
				<html:hidden property="answer(Object::Product::Document::Definition::DocType)" value="<%=""+doctype %>" />
				<html:hidden property="answer(Object::Product::Document::Definition::DocNum)" value="<%=""+docnum %>" />
				<html:hidden property="answer(Object::Product::Document::Definition::ReleaseStatus)" value="<%=""+releasestatus %>" />
				<html:hidden property="answer(Object::Product::Document::OwnerId)" value="<%=""+ownerId %>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
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
		
