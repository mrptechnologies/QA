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
<%String feeName = ""; 
  String productFeeId = ""; %>
<%feeName = String.valueOf(request.getAttribute("FeeName")); %>
<%productFeeId = String.valueOf(request.getAttribute("ProductFeeId")); %>

<html:form action="/GetStateFeeAction.do" >

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		 	<tr>
				<td>				
					<jsp:include page="../common/FeeHeader.jsp">
					<jsp:param name="FeeName" value="<%=feeName%>" />
					</jsp:include>
				 </td>
			</tr>
	</table> 

	<table WIDTH="960px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
			<td height="20"></td>
		</tr>
		<tr>
			<td class="NewSectionHead" align="center" colspan ="10" >Associated States Results</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr align = left>
			<td colspan="20" class="links" width="400px">
					<a href="../feedefinition/AssociateStateFee.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&StateFeeId=<%=productFeeId%>">Associate New State</a>
			</td>
		</tr>
		
		<tr>
			<td>
				<table WIDTH="470px" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
					<logic:present name ='AssociatedStatesList' scope="request">
						<% int count=0; %>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td class="FormLabels" colspan="10"></td>
						</tr>
						<tr>
							<td class="sectionhead" width="5%" align="center">S.No</td>
							<td class="sectionhead" width="30%" align="center">Fee Description </td>
							<td class="sectionhead" width="25%" align="center">State Code</td>
							<td class="sectionhead" width="8%" align="center">Territory</td>
							<td class="sectionhead" width="50%" align="center">County Code</td>
							
						</tr>
						
						<logic:iterate id="searchResultQMap"  name='AssociatedStatesList' type="com.dms.ejb.data.QuestionHashMap">
							<tr>
								<td class="SearchResult" align="center" width="8%">
									<%=++count%>
								</td>
								
								<td class="SearchResult" width="10%" id="FeeDesc" align="center">
									<%=searchResultQMap.getString("Object::Product::Fee::Definition::FeeDescription")%> 
								</td>
								
								<td class="SearchResult" width="10%" id="StateCode" align="center">
								<a href ="../GetStateFeeAction.do?TabPanelName=Manage_Panel&productStateFeeId=<%=searchResultQMap.getString("Object::Product::Fee::ProductStateFeeId")%>&productStateFeeVerId=<%=searchResultQMap.getString("Object::Product::Fee::ProductFeeIdVer")%>">
									<%=searchResultQMap.getString("Object::Product::Fee::StateCode")%> 
								</a>	
								</td>
								<td class="SearchResult" width="10%" id="Territory" align="center">
									<%=searchResultQMap.getString("Object::Product::Fee::Territory")%> 
								</td>
								<td class="SearchResult" width="10%" id="CountyCode" align="center">
									<%=searchResultQMap.getString("Object::Product::Fee::CountyCode")%> 
								</td>							
							</tr>
						</logic:iterate>
						<tr><td>&nbsp;</td></tr>
					</logic:present>
				</table>
					<logic:notPresent name ='AssociatedStatesList'>
						<tr> 
							<td class="Error" colspan="3">
								No Associated States 
 							</td> 
						</tr>
					</logic:notPresent>
				</td>
			</tr>						 
				
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
				<html:hidden property="answer(Object::Product::Fee::VerCreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::VerUpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</td>
		</tr>
	</table>
</html:form>
