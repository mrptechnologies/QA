<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<% String productStateTaxId = "";
   String productStateTaxVerId="";	%>
<% productStateTaxId = String.valueOf(request.getAttribute("productStateTaxId")); %>
<% productStateTaxVerId = String.valueOf(request.getAttribute("productStateTaxVerId")); %>

<html:form action="/GetStateTaxVersionAction.do" >
	<table WIDTH="960px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
			<td height="20"></td>
		</tr>
		<tr>
			<td class="NewSectionHead" align="center" colspan ="10" >StateTax Version Results</td>
		</tr>
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
					<logic:present name ='TaxVersionList' scope="request">
						<% int count=0; %>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td class="FormLabels" colspan="6"></td>
						</tr>
						<tr>
							<td class="sectionhead" width="5%">S.No</td>
							<td class="sectionhead" width="20%">Tax Name</td>
							<td class="sectionhead" width="25%">State</td>
							<td class="sectionhead" width="10%">Territory</td>
							<td class="sectionhead" width="10%">County Code</td>
							<td class="sectionhead" width="10%">Tax Code</td>
							<td class="sectionhead" width ="10%">Version No</td>
							<td class="sectionhead" width="20%">Version Desc</td>
						</tr>
						
						<logic:iterate id="searchResultQMap"  name='TaxVersionList' type="com.dms.ejb.data.QuestionHashMap">
							<tr>
								<td class="SearchResult" align="left" width="8%">
									<%=++count%>
								</td>
	    						<td class="SearchResult" width="20%" id="TaxName">

									<a href="../GetStateTaxVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Product::Tax::ProductStateTaxId)=<%=""+productStateTaxId %>&answer(Object::Product::Tax::ProductTaxIdVer)=<%=""+searchResultQMap.getString("Object::Product::Tax::ProductTaxIdVer") %>">
									<%=searchResultQMap.getString("Object::Product::Tax::Definition::TaxName")%>
									</a>
								</td>
								<td class="SearchResult" width="20%" id="StateCode">
									<%=searchResultQMap.getString("Object::Product::Tax::StateCode")%> 
								</td>
								<td class="SearchResult" width="20%" id="Territory">
									<%=searchResultQMap.getString("Object::Product::Tax::Territory")%> 
								</td>
								<td class="SearchResult" width="20%" id="CountyCode">
									<%=searchResultQMap.getString("Object::Product::Tax::CountyCode")%> 
								</td>
								<td class="SearchResult" width="20%" id="TaxCode">
									<%=searchResultQMap.getString("Object::Product::Tax::TaxCode")%> 
								</td>
								<td class="SearchResult" width="10%" id="VersionNo">
									<%=searchResultQMap.getString("Object::Product::Tax::VersionNum")%> 
								</td>
								<td class="SearchResult" width="10%" id="VersionDesc">
									<%=searchResultQMap.getString("Object::Product::Tax::VersionDesc")%> 
								</td>
							</tr>
						</logic:iterate>
						<tr><td>&nbsp;</td></tr>
					</logic:present>
				</table>
				</td>
			</tr>	
				<logic:notPresent name ='TaxVersionList'>
					<tr> 
						<td class="Error" colspan="3">
							No State Tax Version Found
 						</td> 
					</tr>
				</logic:notPresent>
				<tr>
					<td height="8px"></td>
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
			<tr>
			<td>		
				<html:hidden property="answer(Object::Product::Tax::VerCreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::VerUpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</td>
		</tr>
	</table>
</html:form>
