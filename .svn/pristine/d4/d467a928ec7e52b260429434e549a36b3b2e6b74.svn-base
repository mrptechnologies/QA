<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ page import="java.util.*, com.dms.ejb.attachment.*, java.text.*;" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/LinkAgenttoCustomerAction.do">
<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="2">
<tr><td>

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="formName" value="form::SEARCHATTACHMENTS" />
</td></tr>

<tr><td class="MH">ATTACHMENTS FOUND IN SEARCH</td></tr>
<tr><td><hr size="1" noshade ></td></tr>

<!--
<tr><td class="MH">ATTACHMENTS FOUND IN SEARCH</td></tr>
<tr><td><hr size="1" noshade ></td><tr>
-->
<tr>
	<td class="Error"><html:errors/>
	<logic:notPresent name ='ATTACHMENT_SEARCH_RESULT' scope ='request'>
		Sorry! No results were found.<br/><br/><br/><br/><br/>
	</td>
	</tr>
	<tr align="center">
	<td class="Error" align>
		<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
	</td>
	</logic:notPresent>
	</td>
</tr>
<logic:present name="ATTACHMENT_SEARCH_RESULT" scope="request">
<tr><td>
	<table WIDTH="95%" ALIGN="center" cellspacing=1 cellpadding="0" border="0">
	<tr><td colspan="9" >&nbsp;</td></tr>
	<tr >
		<td class="sectionhead" width="7%">Sl. No</td>
		<td class="sectionhead" width="7%">Group#</td>
		<td class="sectionhead" width="10%">Group Name</td>
		<td class="sectionhead" width="14%">Attachment Name</td>
		<td class="sectionhead" width="5%">Attachment Type</td>
		<td class="sectionhead" width="18%">Attachment Desc</td>
		<td class="sectionhead" width="18%">Attachment File</td>
		<td class="sectionhead" width="5%">State</td>
		<td class="sectionhead" width="5%">Status</td>
		<td class="sectionhead" width="7%">Created By.</td>
		<td class="sectionhead" width="10%">Created Date</td>
		<td class="sectionhead" width="7%">Updated By.</td>
		<td class="sectionhead" width="10%">Updated Date</td>
	</tr>			 						
	
						<% int i=1;%>
						<logic:iterate id="arrAttResult" name="ATTACHMENT_SEARCH_RESULT" scope="request" >
						<tr>
							<bean:define id="hMap" name="arrAttResult" type="java.util.HashMap"/>
							<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId='<%=((Long)hMap.get("OBJECT_ID")).toString()%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
							<td class="SearchResult">
								<a href='../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<%=((Long)hMap.get("OBJECT_ID")).toString()%>'><%=i%><% i++;%></a>
							</td>
							<td class="SearchResult" >
								<a href='../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<%=((Long)hMap.get("OBJECT_ID")).toString()%>'>
									<bean:write name="customerDetail1" property="customerNumber" />
								</a>
								<bean:define id="attDetails" name="hMap" property="ATTACHMENT_DETAIL"/>
							</td>
							<td class="SearchResult" >
								<bean:write name="customerDetail1" property="customerName" />
							</td>
							<td class="SearchResult" >
		  						 <bean:write name="attDetails" property="attachmentName"/>
		  					</td>
		   					<td class="SearchResult" >
		   							<bean:write name="attDetails" property="attachmentType"/>
		   					</td>
		  					<td class="SearchResult" >
		  						 <bean:write name="attDetails" property="attachmentDesc"/>
		  					</td>
		    				<td class="SearchResult" >
								<a href="/doc.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&docName=<bean:write name='attDetails' property='attachmentUrl'/>">
									<bean:write name="attDetails" property="attachmentName"/>
								</a>
							</td>
		   					<!--bean:write name="attDetails" property="attachmentUrl"/></a></td-->
		   					<td class="SearchResult" >
		   						<bean:write name="attDetails" property="attachmentState"/>
		   					</td>
		   					<td class="SearchResult" >
	   							 <bean:write name="attDetails" property="attachmentStatus"/>
	   						</td>
		   					<td class="SearchResult" >
		   						<bean:write name="attDetails" property="createdBy"/>
		   					</td>
		   					<td class="SearchResult" >
		  						 <bean:write name="attDetails" property="createdDate"/>&nbsp;<bean:write name="attDetails" property="createdTime"/>
		  					</td>
		   					<td class="SearchResult" >
		  						 <bean:write name="attDetails" property="updatedBy"/>
		  					</td>
   		  					<td class="SearchResult" >
		    					<bean:write name="attDetails" property="updatedDate"/>&nbsp;<bean:write name="attDetails" property="updatedTime"/>
		    				</td>
								<%--<td class="SearchResult" >
								<bean:write name="attDetails" property="createdDate"/>&nbsp;<bean:write name="attDetails" property="createdTime"/></td>
								<td class="SearchResult" >
								<bean:write name="attDetails" property="createdBy"/></td>
								<!--<td class="SearchResult" >
								<bean:write name="attDetails" property="attachmentStatus"/></td>
								<td class="SearchResult" >
								<bean:write name="attDetails" property="attachmentState"/></td>
								<td class="SearchResult" >
								<bean:write name="attDetails" property="updatedBy"/></td>-->--%>
						</tr>
						</logic:iterate>
				</table></td>
</tr>
</logic:present>
</table>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

</html:form>
