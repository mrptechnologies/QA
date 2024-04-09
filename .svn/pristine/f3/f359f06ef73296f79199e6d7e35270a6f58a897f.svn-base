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

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">	
	<tr>
		<td height="5">
		</td>
	</tr>
	<tr>
		<td valign="top">
			<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">POLICY LIST</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
				
				<logic:present name="noPolicy">
					<tr>
						<td class="error">
							No Policies associated to the insured
						</td>
					</tr>
				</logic:present>
				
				<logic:present name="policyList">
					<tr>						
						<td class="sectionhead" width="20%" align="left">
							Policy Number
						</td>						
						<td class="sectionhead" width="25%" align="left">
							Created Date
						</td>
						<td class="sectionhead" width="25%" align="left">
							Effective Date
						</td>
						<td class="sectionhead" width="20%" align="left">
							Policy Status
						</td>
						<td class="sectionhead" width="15%" align="left">
							Created By
						</td>
					</tr>					
				<%--
       				java.util.ArrayList arrListpolicy = (java.util.ArrayList)request.getAttribute("policyList");
		     		for(int polIndex=0;polIndex<arrListpolicy.size();polIndex++){
					com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrListpolicy.get(polIndex);							
					String policyNumber = qmap.getString("Object::Policy::PolicyNumber");
				--%>
				<logic:iterate id="policyList" name="policyList">
					<tr>
						<td>
							<bean:define id="policyNumber" property="Object::Policy::PolicyNumber" name="policyList" />							
						</td>
					</tr>
					<tr>
						<td class="SearchResult" align="left">
							<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>">
								<bean:write name="policyList" property="Object::Policy::PolicyNumber" />
								<%-- =""+qmap.getString("Object::Policy::PolicyNumber") --%>
							</a>
						</td>
						<td class="SearchResult" align="left">
							<bean:write name="policyList" property="Object::Policy::PolCreatedDate" />
							<%-- =""+qmap.getString("Object::Policy::PolCreatedDate") --%>
						</td>
						<td class="SearchResult" align="left">
							<bean:write name="policyList" property="Object::Policy::PolEfftDate" />
							<%-- =""+qmap.getString("Object::Policy::PolEfftDate") --%>
						</td>
						<td class="SearchResult" align="left">
							<bean:write name="policyList" property="Object::Policy::PolicyStatus" />
							<%-- =""+qmap.getString("Object::Policy::PolEfftDate") --%>
						</td>
						<td class="SearchResult" align="left">
							<bean:write name="policyList" property="Object::Policy::CreatedBy" />
							<%-- =""+qmap.getString("Object::Policy::CreatedBy") --%>
						</td>						
					</tr>		
					</logic:iterate>		
				<%-- } --%>			
				</logic:present>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center" height="20">
						<html:button value="Back" styleClass="sbttn" property="answer(submit)" onclick="javascript:history.go(-1);"/>&nbsp;
					</td>

				</tr>
							
			</table>
		</td>
	</tr>
</table>
