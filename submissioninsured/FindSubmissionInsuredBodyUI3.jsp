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

<SCRIPT type="text/javascript" src="../Scripts/JScripts/FindSubmission.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CommonYUIUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>

<html:form name="FindForm" type="com.dms.web.data.DataForm"	action="/SubmissionSearchResult.do" focus="InsuredName" onsubmit="return false;">
	<div class="formpage01">
	<div class="content">
		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
		<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td colspan="4">
				<div class="formhead">
					<h2 class="left">FIND SUBMISSION</h2>
				</div>
				</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
			</tr>


			<tr>
				<td>
					<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="2">
						<tr>
							<td colspan="2">
								<h3>Submission Search Criteria</h3>
							</td>
						</tr>
						

						<tr>
							<td width="40%" align="right" class="field">Submission Name (Business Name or Last Name, First Name) &nbsp;&nbsp;</td>
							<td align="left" class="links">
								<html:text value=""	property="answer(Object::Customer::Like::customerName)"	styleClass="txtbox" styleId="InsuredName" />
							</td>
						</tr>
						<dmshtml:dms_static_with_connector ruleName='privilage'	property='<%=new String[]{"INSURED_NUMBER_AVAILABLE"}%>' connector='or' negated="true">
						<tr>
							<td width="30%" class="field" align="right">Submission Number &nbsp;&nbsp;</td>
							<td class="links">
								<html:text value=""	property="answer(Object::Customer::Like::SubmissionNumber)"	size="10" maxlength="10" styleClass="txtbox" styleId="InsuredNumber" />
							</td>
						</tr>
						</dmshtml:dms_static_with_connector>
						<tr>
							<td width="30%" class="field" align="right" height="25">Created	Date From &nbsp;&nbsp;</td>
							<td class="links">
								<html:text property="answer(Month)" size="2" maxlength="2" styleClass="txtbox" styleId="CreatedDate1" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate2.focus()}" />&nbsp;
								<html:text property="answer(Date)" size="2" maxlength="2" styleClass="txtbox" styleId="CreatedDate2" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate3.focus()}" />&nbsp;
								<html:text property="answer(Year)" size="4" maxlength="4" styleClass="txtbox" styleId="CreatedDate3" onkeyup="if(this.value.length==4) {document.forms[0].CreatedDate4.focus()}" />&nbsp;(MM/DD/YYYY)
							</td>
						</tr>

						<tr>
							<td width="30%" class="field" align="right" height="25">Created	Date To &nbsp;&nbsp;</td>
							<td class="links">
								<html:text property="answer(Month)" size="2" maxlength="2" styleClass="txtbox" styleId="CreatedDate4" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate5.focus()}" />&nbsp;
								<html:text property="answer(Date)" size="2" maxlength="2" styleClass="txtbox" styleId="CreatedDate5" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate6.focus()}" />&nbsp;
								<html:text property="answer(Year)" size="4" maxlength="4" styleClass="txtbox" styleId="CreatedDate6" />&nbsp;(MM/DD/YYYY)
							</td>
						</tr>

						<tr>
							<td width="30%" class="field" align="right" height="25">Last Modified From &nbsp;&nbsp;</td>
							<td class="links"><html:text property="answer(Month)" size="2" maxlength="2" styleId="LastModified1" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].elements[11].focus()}" />&nbsp;
								<html:text property="answer(Date)" size="2" maxlength="2" styleId="LastModified2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].elements[12].focus()}" />&nbsp;
								<html:text property="answer(Year)" size="4" maxlength="4" styleId="LastModified3" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].elements[13].focus()}" />&nbsp;(MM/DD/YYYY)
							</td>

						</tr>
	
						<tr>
							<td width="30%" class="field" align="right" height="25">Last Modified To &nbsp;&nbsp;</td>
							<td class="links">
								<html:text property="answer(Month)" size="2" maxlength="2" styleId="LastModified4" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].elements[14].focus()}" />&nbsp;
								<html:text property="answer(Date)" size="2" maxlength="2" styleId="LastModified5" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].elements[15].focus()}" />&nbsp;
								<html:text property="answer(Year)" size="4" maxlength="4" styleId="LastModified6" styleClass="txtbox" />&nbsp;(MM/DD/YYYY)
							</td>

						</tr>
						<dmshtml:dms_static_with_connector ruleName='privilage'
						property='<%=new String[]{"SUBMISSION_STATUS_CHANGE"}%>'
						connector='or' negated="true">
						<tr>
							<td class="field" align="right" height="25">Submission Status&nbsp;&nbsp;</td>
							<td class="links" style="Class:txtbox">
								<html:select property="answer(Object::Customer::Status)" value="All" styleClass="txtbox">
									<html:option value="ALL">All</html:option>
									<html:option value="In Progress">In Progress</html:option>
									<!--Commented for Bug 12504	<html:option value ="Blocked">Blocked</html:option>-->
									<html:option value="Declined">Declined</html:option>
									<html:option value="Lapsed">Lapsed</html:option>
									<!--  		<html:option value ="Referred">Referred</html:option>-->
									<html:option value="Registered">Registered</html:option>
								</html:select>
							</td>
						</tr>
						</dmshtml:dms_static_with_connector>


						<dmshtml:dms_static_with_connector ruleName='privilage'
						property='<%=new String[]{"OBJECT-DELETE"}%>' connector='or'
						negated="true">
						<tr>
							<td width="40%" align="right" class="FormLabels">Active	&nbsp;&nbsp;</td>
							<td align="left">
								<html:select property="answer(Object::Customer::Equals::Active)">
									<html:option value="Y">Active</html:option>
									<html:option value="D">Deactive</html:option>
								</html:select>
							</td>
						</tr>
						</dmshtml:dms_static_with_connector>
						<bean:define id="submissionNo"><bean:message key='ToolTip.SubmissionList.SubmissionNumber'/></bean:define>
						<bean:define id="submissionName"><bean:message key='ToolTip.SubmissionList.SubmissionName'/></bean:define>
						<tr>
							<td colspan="2" align="center">
							<table width="100%">
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							
							<tr>
								<td class="formcontent" style="width:50%" align="center" colspan="3" title="<bean:message key='ToolTip.FindSubmission.Find'/>">
									<center><input type="submit" value="Find >" class="covbutton" onclick="FindSubmission('../SubmissionSearchResultUI3.do');" style="width:90px;"/></center>
								</td>
							
							</tr>
							</table>
							</td>
						</tr>
					<!-- <tr><td><hr size="1" noshade></td></tr> -->
					</table>
				</td>
			</tr>
		</table>

<table>
		<tr>
		<td>&nbsp;</td>
		<td colspan=5><div id="numberofRecords"></div></td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		<td align="left">
<div id="dynamicdata"></div> 
</td>
</tr>
</table>
</div>

			
<div>&nbsp;</div>
</div>
			<%
session.removeAttribute("showAllCustomers");

%>
<html:hidden property="answer(Object::Customer::Equals::CreatedDateBegin)"	value="" styleId="inpCreatedDateBegin" /> 
<html:hidden property="answer(Object::Customer::Equals::CreatedDateEnd)" value="" styleId="inpCreatedDateEnd" />
<html:hidden property="answer(Object::Customer::Equals::UpdatedDateBegin)" value="" styleId="inpUpdatedDateBegin" /> 
<html:hidden property="answer(Object::Customer::Equals::UpdatedDateEnd)" value="" styleId="inpUpdatedDateEnd" /> 

<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN","GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN","AGENCY_EMPLOYEE","SSO_AGENT","SSO_AGENCY"}%>' connector='or' negated="true">
	<logic:present name="LoginPage" scope="session">
		<bean:define id="LoginType"	property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session" />
		<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
		<bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
	<% 
	    long agencyId = 0;
	 	try{
	 		agencyId=Long.parseLong(""+AgencyID);
	 	}catch(Exception ex){}
	 	if(agencyId > 0){
    %>
		<html:hidden property="answer(1*Customer::Equals::SearchObjectType)" value="AGENCY" />
		<html:hidden property="answer(1*Customer::Equals::SearchObjectId)"	value="<%=""+agencyId%>" />
	<%}else{ %>
		<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId) %>"	dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>" />
			<%String objType="";%>
		<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session" />
		<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
		<%if(objDescType.toString().equals("ENTITY")){%>
		<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN","AGENCY_EMPLOYEE"}%>' connector='or' negated="true">
		<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>" />
		<logic:present name="agencyIdent" scope="session">
			<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session" />
				<html:hidden property="answer(1*Customer::Equals::SearchObjectId)" value="<%=agencyIdid.toString()%>" />
				<html:hidden property="answer(1*Customer::Equals::SearchObjectType)" value="AGENCY" />
		</logic:present>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN"}%>' connector='or' negated="true">
		<dmshtml:Get_GeneralAgency_By_AgentUserId userId="<%=usernameId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="gaagencyIdentity" />
			<logic:present name="gaagencyIdentity" scope="session">
				<bean:define id="gaIdent" name="gaagencyIdentity" type="java.lang.Long" scope="session" />
				<html:hidden property="answer(2*Customer::Equals::SearchObjectId)" value="<%=gaIdent.toString()%>" />
				<html:hidden property="answer(2*Customer::Equals::SearchObjectType)" value="GENERAL_AGENCY" />
			</logic:present>
		</dmshtml:dms_static_with_connector>
		<%}else if(objDescType.toString().equals("GENERAL_AGENCY")){%>
			<html:hidden property="answer(3*Customer::Equals::SearchObjectId)" value="<%=""+objDescId%>" />
			<html:hidden property="answer(3*Customer::Equals::SearchObjectType)" value="GENERAL_AGENCY" />
		<%}else if(objDescType.toString().equals("AGENCY")){%>
			<html:hidden property="answer(4*Customer::Equals::SearchObjectId)" value="<%=""+objDescId%>" />
			<html:hidden property="answer(4*Customer::Equals::SearchObjectType)" value="AGENCY" />
		<%}%>

	<%} %>

	</logic:present>

</dmshtml:dms_static_with_connector> 
<html:hidden styleId="inpPageNum" property="answer(Object::Customer::PageNum)" value="0" /> 
<html:hidden styleId="orderby" property="answer(Customer::orderBy)" value="DMS_SUBMISSION_INSURED_VER.CUSTOMER_NAME" /> 
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />




</html:form>



		
