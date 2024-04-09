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

<SCRIPT type="text/JavaScript" src="../Scripts/JScripts/CommonYUIUtil.js"></SCRIPT>
<SCRIPT type="text/JavaScript" src="../Scripts/JScripts/FindProcessingRenewalUI3.js"></SCRIPT>

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

<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>

<html:form action="/SearchProcessingRenewalActionUI3.do" onsubmit="return false;">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>


<div class="formpage01">
	<div class="content">
	<div class="formheadnew"><h2 class="left">FIND CURRENTLY PROCESSING RENEWALS</h2></div>
<br class="clear" />



<div>&nbsp;</div>

<div class="field" style="width:565px">Insured Name:<html:text property="answer(Object::Policy::InsuredName)" styleClass="txtbox" styleId="InsuredName" /></div>
<div class="field" style="width:565px">Policy Number:<html:text property="answer(Object::Policy::PolicyNumber)" styleClass="txtbox" styleId="PolicyNum" /></div>
<div class="field" style="width:654px">Policy Expiration Start Date:<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].expsddd.focus()}" styleId="expsdmm" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].expsdyy.focus()}" styleId="expsddd" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].expedmm.focus()}" styleId="expsdyy" />&nbsp;(MM/DD/YYYY)
</div>
<div class="field" style="width:654px">Policy Expiration End Date:
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].expeddd.focus()}" styleId="expedmm" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].expedyy.focus()}" styleId="expeddd" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="expedyy" />&nbsp;(MM/DD/YYYY)		
</div>

<div class="field" style="width:525px">Renewal Quote Status:
				<html:select property="answer(Object::Policy::QuoteStatus)" styleClass="txtbox">
					<html:option value ="">All</html:option>							
					<html:option value ="In Progress">In Progress</html:option>	
					<html:option value ="Referred">Referred</html:option>						
					<html:option value ="Offered">Offered</html:option>
					<html:option value="Bind Request">Bind Request</html:option>					
					<html:option value ="Lapsed">Lapsed</html:option>	
					<html:option value ="Declined">Declined</html:option>							
				</html:select>
</div>

<div class="field" style="width:654px">Renewal Quote Effective Start Date:
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].esddd.focus()}" styleId="esdmm" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].esdyy.focus()}" styleId="esddd" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].eedmm.focus()}" styleId="esdyy" />&nbsp;(MM/DD/YYYY)
</div>
<div class="field" style="width:654px">Renewal Quote Effective End Date:
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].eeddd.focus()}" styleId="eedmm" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].eedyy.focus()}" styleId="eeddd" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="eedyy" />&nbsp;(MM/DD/YYYY)
</div>
<div class="field" style="width:654px">Renewal Quote Created Start Date:
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].csddd.focus()}" styleId="csdmm" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].csdyy.focus()}" styleId="csddd" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear,this,'Year');if(this.value.length==4) {document.forms[0].cedmm.focus()}" styleId="csdyy" />&nbsp;(MM/DD/YYYY)					
</div>
<div class="field" style="width:654px">Renewal Quote Created End Date:
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].ceddd.focus()}" styleId="cedmm" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].cedyy.focus()}" styleId="ceddd" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear,this,'Year');" styleId="cedyy" />&nbsp;(MM/DD/YYYY)
</div>

<div>&nbsp;</div>

<div class="formcontent" style="width:50%" align="center"><center>
	<html:submit value="Find >" property="Search" styleClass="covbutton" onclick="findProcessingRenewals('../SearchProcessingRenewalsActionUI3.do')"/></center>
</div>


		
<div>&nbsp;</div>
<table>
		<tr>
		<td>&nbsp;</td>
		<td colspan=5><div id="numberofRecords"></div></td>
		<tr>
		<td>&nbsp;</td>
		<td align="left">
<div id="dynamicdata"></div> 
</td>
</tr>
</table>
</div>

</div>


<html:hidden property="answer(RenewalSearchType)" value="processingRenewals"/>
<html:hidden property="answer(Object::Quote::RenewalCreatedStartDate)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Quote::RenewalCreatedEndDate)" value="" styleId="inpCreatedDateEnd"/>
<html:hidden property="answer(Object::Quote::RenewalEffStartDate)" value="" styleId="inpEffDateBegin"/>
<html:hidden property="answer(Object::Quote::RenewalEffEndDate)" value="" styleId="inpEffDateEnd"/>
<html:hidden property="answer(Object::Policy::PolExpStartDate)" value="" styleId="inpExpDateBegin"/>
<html:hidden property="answer(Object::Policy::PolExpEndDate)" value="" styleId="inpExpDateEnd"/>
<html:hidden property="answer(Object::Policy::OwnerId)" value="<%=""+ownerId %>"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden  property="answer(Object::Policy::PageNum)" value="0" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
<input type="hidden" name="privilageForPremium" id="premiumPrivilage" value="No">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREMIUM_VIEW"}%>' connector='or' negated="true">
	<script type="text/javascript">
		document.getElementById("premiumPrivilage").value = "Yes";
	</script>
</dmshtml:dms_static_with_connector>

	<% 
	    long agencyId = 0;
	 	try{
	 		agencyId=Long.parseLong(""+AgencyID);
	 	}catch(Exception ex){}
	 	if(agencyId > 0){
    %>
       <html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectType)" value="AGENCY"/>
	   <html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectId)" value="<%=""+agencyId%>"/>
    <%}else{ 
    %>
<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"  />	
	<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
	<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />	
	<%if(objDescType.toString().equals("ENTITY")){
	%>			
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT"}%>' connector='or' negated="true">
			<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
				<logic:present name="agencyIdent" scope="session">
			 		<bean:define id="agencyID" name="agencyIdent" type="java.lang.Long" scope="session"/>
					<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectType)" value="AGENCY"/>
					<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectId)" value="<%=""+agencyID%>"/>
				</logic:present>
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENCY_EMPLOYEE"}%>' connector='or' negated="true">
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
					<logic:present name="agencyIdent" scope="session">
						<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
						<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectId)" value="<%=""+agencyIdid%>"/>
						<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectType)" value="AGENCY"/>
					</logic:present>
			</dmshtml:dms_static_with_connector>
	<%}else if(objDescType.toString().equals("AGENCY")){
	%>
			<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectType)" value="AGENCY"/>
			<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectId)" value="<%=""+objDescId%>"/>	
	<%} %>
	<%} %> 

</html:form>

