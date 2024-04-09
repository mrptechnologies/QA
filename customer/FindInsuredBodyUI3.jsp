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
<script type="text/javascript" src="../Scripts/JScripts/FindInsured.js" ></script>
<script type="text/javascript" src="../Scripts/JScripts/CommonYUIUtil.js"></script>



<html:form name="FindForm" type="com.dms.web.data.DataForm" action="/FindAllInsuredXml.do" focus="InsuredName" onsubmit="return false;">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<div class="formpage01">
<div class="content">
<div class="formheadnew"><h2 class="left">Find Insured</h2></div>

<br class="clear" />

<div>&nbsp;</div>
<div class="field" style="width:605px">Insured Name:<html:text  property="answer(Object::Customer::Like::customerName)" styleClass="txtbox"  size="60" maxlength="110" styleId="InsuredName" value=""/></div>
<div class="field" style="width:455px">Insured Number:<html:text  property ="answer(Object::Customer::Like::CustomerNumber)" size="35" maxlength="8"  styleClass="txtbox" styleId="InsuredNumber"/></div>

<div class="field" style="width:651px">Created Date:
		<span style="width:50px">From :</span>			
			<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" styleId="CreatedDate1" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate2.focus()}" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  styleId="CreatedDate2" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate3.focus()}" />			
		<span style="width:15px">/</span>
			<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px" styleId="CreatedDate3" onkeyup="if(this.value.length==4) {document.forms[0].CreatedDate4.focus()}" />
			
			
		<span style="width:50px">To :</span>
			<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" styleId="CreatedDate4" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate5.focus()}" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  styleId="CreatedDate5" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate6.focus()}" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px" styleId="CreatedDate6" />
		<span style="width:50px">(MM/DD/YYYY)</span>
</div>
<div class="field" style="width:651px">Last Modified Date:
		<span style="width:50px">From :</span>
			<html:text  property ="answer(Month)"  size="2" maxlength="2" styleId="LastModified1" style="width:25px" onkeyup="if(this.value.length==2) {document.forms[0].elements[11].focus()}" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Date)"  size="2" maxlength="2" styleId="LastModified2" style="width:25px"  onkeyup="if(this.value.length==2) {document.forms[0].elements[12].focus()}" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Year)"  size="4" maxlength="4" styleId="LastModified3" style="width:40px" onkeyup="if(this.value.length==4) {document.forms[0].elements[13].focus()}" />
			
		<span style="width:50px">To :</span>
			<html:text  property ="answer(Month)"  size="2" maxlength="2" styleId="LastModified4" style="width:25px" onkeyup="if(this.value.length==2) {document.forms[0].elements[14].focus()}" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Date)"  size="2" maxlength="2" styleId="LastModified5" style="width:25px"  onkeyup="if(this.value.length==2) {document.forms[0].elements[15].focus()}" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Year)"  size="4" maxlength="4" styleId="LastModified6" style="width:40px"  />
		<span style="width:50px">(MM/DD/YYYY)</span>
</div>

<div>&nbsp;</div>

<div class="formcontent" style="width:50%" align="center" title="<bean:message key='ToolTip.FindInsured.Find'/>"><center>
<input type="submit" value="Find >" class="covbutton" onclick="FindInsured('../FindAllInsuredXmlUI3.do')" style="width:90px;">	</center>
</div>

<table>
		<tr>
		<td>&nbsp;</td>
		<td colspan=5><div id="DivTotalRecords"></div></td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		<td align="left">
<div id="dynamicdata"></div> 
</td>
</tr>
</table>
</div>

<script type="text/JavaScript" src="../Scripts/JScripts/FindInsured.js" ></script>		
<div>&nbsp;</div>
</div>
<%session.removeAttribute("showAllCustomers");%>
<html:hidden styleId="inpPageNum" property="answer(Object::Customer::PageNum)" value="0"/>
<html:hidden styleId="orderby" property="answer(Customer::orderBy)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(Object::Customer::Equals::CreatedDateBegin)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Customer::Equals::CreatedDateEnd)" value="" styleId="inpCreatedDateEnd"/>
<html:hidden property="answer(Object::Customer::Equals::UpdatedDateBegin)" value="" styleId="inpUpdatedDateBegin"/>
<html:hidden property="answer(Object::Customer::Equals::UpdatedDateEnd)" value="" styleId="inpUpdatedDateEnd"/>

<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN","GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN","AGENCY_EMPLOYEE","SSO_AGENT","SSO_AGENCY"}%>' connector='or' negated="true">


<logic:present name="LoginPage" scope="session">
	<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
	<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>	
	<bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
	<% 
	    long agencyId = 0;
	 	try{
	 		agencyId=Long.parseLong(""+AgencyID);
	 	}catch(Exception ex){}
	 	if(agencyId > 0){
    %>
       <html:hidden property="answer(1*Customer::Equals::SearchObjectType)" value="AGENCY"/>
	   <html:hidden property="answer(1*Customer::Equals::SearchObjectId)" value="<%=""+agencyId%>"/>
    <%}else{ 
    %>
	
	<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>" />
	<%String objType="";%>
	<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
	<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
		<%if(objDescType.toString().equals("ENTITY")){%>			
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN","AGENCY_EMPLOYEE"}%>' connector='or' negated="true">
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>" />
				<logic:present name="agencyIdent" scope="session">
					<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
					<html:hidden property="answer(1*Customer::Equals::SearchObjectId)" value="<%=agencyIdid.toString()%>"/>
					<html:hidden property="answer(1*Customer::Equals::SearchObjectType)" value="AGENCY"/>				
				</logic:present>
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN"}%>' connector='or' negated="true">
				<dmshtml:Get_GeneralAgency_By_AgentUserId userId="<%=usernameId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="gaagencyIdentity"/>  
				<logic:present name="gaagencyIdentity" scope="session">
					<bean:define id="gaIdent" name="gaagencyIdentity" type="java.lang.Long" scope="session"/>
					<html:hidden property="answer(2*Customer::Equals::SearchObjectId)" value="<%=gaIdent.toString()%>"/>
					<html:hidden property="answer(2*Customer::Equals::SearchObjectType)" value="GENERAL_AGENCY"/>
				</logic:present>
			</dmshtml:dms_static_with_connector>
		<%}else if(objDescType.toString().equals("GENERAL_AGENCY")){%>
				<html:hidden property="answer(3*Customer::Equals::SearchObjectId)" value="<%=""+objDescId%>"/>
				<html:hidden property="answer(3*Customer::Equals::SearchObjectType)" value="GENERAL_AGENCY"/>
		<%}else if(objDescType.toString().equals("AGENCY")){%>
				<html:hidden property="answer(4*Customer::Equals::SearchObjectId)" value="<%=""+objDescId%>"/>
				<html:hidden property="answer(4*Customer::Equals::SearchObjectType)" value="AGENCY"/>
		<%}%>
		
 <%} %>		
		
	
</logic:present>



</dmshtml:dms_static_with_connector>


<html:hidden styleId="inpPageNum" property="answer(Object::Customer::PageNum)" value="0"/>
<html:hidden styleId="orderby" property="answer(Customer::orderBy)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>

