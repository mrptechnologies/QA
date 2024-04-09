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

<script type="text/JavaScript" src="../Scripts/JScripts/FindPolicy.js"></script>
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

<script type="text/javascript">
function nospaces(t){
if(t.value.match(/\s/g)){
alert('Invalid Quote Number');
t.value=t.value.replace(/\s/g,'');
}
}
</script>

<html:form action="/SearchPolicyAction.do" onsubmit="return false;">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>


<div class="formpage01">
	<div class="content">
	<div class="formheadnew"><h2 class="left">Find Policy</h2></div>
<br class="clear" />



<div>&nbsp;</div>

<div class="field" style="width:500px">Policy Number:<html:text  property="answer(Object::Policy::PolicyNumber)" styleClass="txtbox" styleId="PolicyNum" /></div>
<div class="field" style="width:740px">Insured Name:<html:text  property ="answer(Object::Policy::InsuredName)"  size="60" maxlength="110" styleClass="txtbox" styleId="InsuredName"/></div>
<div class="field" style="width:500px">Quote Number:<html:text  property ="answer(Object::Policy::QuoteNumber)"   styleClass="txtbox" styleId="quoteNumberTemp" onkeyup="nospaces(this)"/></div>
<div class="field" style="width:447px">Policy Status:
						<html:select property="answer(Object::Policy::PolicyStatus)" styleClass="txtbox">
								<html:option value ="">All</html:option>							
								<html:option value ="Bound">Bound</html:option>	
								<html:option value ="Issued">Issued</html:option>
								<html:option value ="Canceled">Cancelled</html:option>
								<html:option value ="Expired">Expired</html:option>
								</html:select>
</div>

<div class="field" style="width:463px">Policy Type:
						<html:select property="answer(Object::Policy::PolicyType)" styleClass="txtbox">
								<html:option value ="">All</html:option>
								<html:option value ="POLICY">Policy</html:option>							
								<html:option value ="RENEWAL">Renewal</html:option>	
								<html:option value ="ENDORSEMENT">Endorsement</html:option>							
						</html:select>
</div>
<div class="field" style="width:783px">Policy Created Date:
		<span style="width:50px">From :</span>
				<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].csddd.focus()}" styleId="csdmm" />
		<span style="width:15px">/</span>
				<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].csdyy.focus()}" styleId="csddd" />
		<span style="width:15px">/</span>			
				<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear+1,this,'Year');if(this.value.length==4) {document.forms[0].cedmm.focus()}" styleId="csdyy" />
			
		<span style="width:50px">To :</span>
				<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].ceddd.focus()}" styleId="cedmm" />
		<span style="width:15px">/</span>
				<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].cedyy.focus()}" styleId="ceddd" />
		<span style="width:15px">/</span>
				<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear+1,this,'Year');" styleId="cedyy" />
	    <span style="width:50px">(MM/DD/YYYY)</span>
</div>


<div class="field" style="width:783px">Quote Effective Date:
	<span style="width:50px">From :</span>
		<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].esddd.focus()}" styleId="esdmm" />
	<span style="width:15px">/</span>
		<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].esdyy.focus()}" styleId="esddd" />
	<span style="width:15px">/</span>
		<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px" onkeyup="if(this.value.length==4) {document.forms[0].eedmm.focus()}" styleId="esdyy" />
		
	<span style="width:50px">To :</span>
		<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].eeddd.focus()}" styleId="eedmm" />
	<span style="width:15px">/</span>
		<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].eedyy.focus()}" styleId="eeddd" />
	<span style="width:15px">/</span>
		<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px"  styleId="eedyy" />
	    <span style="width:50px">(MM/DD/YYYY)</span>		
</div>

<div class="formcontent" style="width:50%" align="center"  title="<bean:message key='ToolTip.FindPolicy.Find'/>"><center>
<input type="submit" value="Find >" class="covbutton" onclick="listPolicies('../SearchPolicyActionUI3.do?')" style="width:90px;">	</center>
</div>


		

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

</div>

<html:hidden property="answer(Object::Policy::PolCreatedStartDate)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Policy::PolCreatedEndDate)" value="" styleId="inpCreatedDateEnd"/>
<html:hidden property="answer(Object::Policy::PolEffStartDate)" value="" styleId="inpEffDateBegin"/>
<html:hidden property="answer(Object::Policy::PolEffEndDate)" value="" styleId="inpEffDateEnd"/>
<html:hidden property="answer(Object::Policy::OwnerId)" value="<%=""+ownerId %>"/>
<html:hidden property="answer(Object::Policy::QuoteSubNumber)" styleId="quoteSubNumber" />
<html:hidden property="answer(Object::Policy::QuoteNumber)" styleId="quoteNumber" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden  property="answer(Object::Policy::PageNum)" value="0" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
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


