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

<SCRIPT type="text/javascript">
<!--
function GoTOFindButton()
{

var formElement=document.forms[0];

var beginMM=formElement.elements[10].value;
var beginDD=formElement.elements[11].value;
var beginYY=formElement.elements[12].value;
var endMM=formElement.elements[13].value;
var endDD=formElement.elements[14].value;
var endYY=formElement.elements[15].value;

var CrebeginMM=formElement.elements[4].value;
var CrebeginDD=formElement.elements[5].value;
var CrebeginYY=formElement.elements[6].value;
var CreendMM=formElement.elements[7].value;
var CreendDD=formElement.elements[8].value;
var CreendYY=formElement.elements[9].value;

if(CreendYY!="" && CrebeginMM < 1 || CrebeginMM > 12){
	alert("month should be 1-12");
	return false;
}	
if(beginMM!="" && beginMM < 1 || beginMM > 12){
	alert("month should be 1-12");
	return false;
}
if(endMM!="" && endMM < 1 ||endMM > 12){
	alert("month should be 1-12");
	return false;
}
if(CreendMM!="" && CreendMM < 1 || CreendMM > 12){
	alert("month should be 1-12");
	return false;
}

if(CrebeginDD!="" && CrebeginDD < 1 || CrebeginDD > 31){
	alert("date should be 1-31");
	return false;
}	
if(beginDD!="" && beginDD < 1 || beginDD > 31){
	alert("date should be 1-31");
	return false;
}
if(endDD!="" && endDD < 1 ||endDD > 31){
	alert("date should be 1-31");
	return false;
}
if(CreendDD!="" && CreendDD < 1 || CreendDD > 31){
	alert("date should be 1-31");
	return false;
}

if(beginYY!="" && beginYY<999){
	alert("year should be >999");
	return false;
}
if(endYY!="" && endYY<999){
	alert("year should be >999");
	return false;
}
if(CrebeginYY!="" && CrebeginYY<999){
	alert("year should be >999");
	return false;
}
if(CreendYY!="" && CreendYY<999){
	alert("year should be >999");
	return false;
}


if(isNaN(CrebeginMM)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(CrebeginDD)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(CrebeginYY)){
		alert("should be numeric.");
		return false;
		
	}		
if(isNaN(beginDD)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(beginYY)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(beginMM)){
		alert("should be numeric.");
		return false;
		
	}		
if(isNaN(endMM)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(endDD)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(endYY)){
		alert("should be numeric.");
		return false;
		
	}		
if(isNaN(CreendMM)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(CrebeginDD)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(CreendYY)){
		alert("should be numeric.");
		return false;
		
	}		

if((CrebeginMM!="")&&(CrebeginDD!="")&&(CrebeginYY!="")) {
formElement.inpCreatedDateBegin.value=CrebeginYY+"-"+CrebeginMM+"-"+CrebeginDD;
}

if((CreendMM!="")&&(CreendDD!="")&&(CreendYY!="")) {
formElement.inpCreatedDateEnd.value=CreendYY+"-"+CreendMM+"-"+CreendDD;
}

if((beginMM!="")&&(beginDD!="")&&(beginYY!="")) {
formElement.inpUpdatedDateBegin.value=beginYY+"-"+beginMM+"-"+beginDD;
}

if((endMM!="")&&(endDD!="")&&(endYY!="")) {
formElement.inpUpdatedDateEnd.value=endYY+"-"+endMM+"-"+endDD; 
}

/*
Uncomment this to debug
var temp1;
for (var j=20;formElement.elements[j]!=null; j++)
{
	temp1 = formElement.elements[j].value;
	alert("element "+j+" is "+formElement.elements[j].name+" = "+temp1);
}
*/
return true;
}

//
-->
</SCRIPT>


<html:form name="FindForm" type="com.dms.web.data.DataForm" action="/FindAllInsuredXml.do" focus="InsuredName" onsubmit="return GoTOFindButton()">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
 <table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
		

<tr><td height="5"></td></tr>
<tr>
	<td class="NewSectionHead" colspan="4" align="center">FIND INSURED</td>
</tr>


	    <tr><td>&nbsp;</td></tr>
		
	
		<tr><td>
<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">

<tr><td class="sectionhead" colspan ="2" align="center" >INSURED SEARCH CRITERIA</td></tr>
		    <tr><td>&nbsp;</td></tr>

	<tr>
		<td width="40%" align="right" class="FormLabels">
		Insured Name (Last Name, First Name)
		</td> 
		<td align="left" ><html:text  property="answer(Object::Customer::Like::customerName)" styleClass="txtbox" styleId="InsuredName"/></td>
	</tr>

	<tr>
		<td width="30%" class="FormLabels" align="right">Insured Number</td>
		<td class="links"><html:text  property ="answer(Object::Customer::Like::CustomerNumber)"  size="8" maxlength="8" styleClass="txtbox" styleId="InsuredNumber"/></td>
	</tr>

	<tr>
		<td width="30%" class="FormLabels" align="right" height="25">Created Date From</td>
		<td class="links">
		<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="CreatedDate1" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate2.focus()}" />&nbsp;
		<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="CreatedDate2" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate3.focus()}" />&nbsp;
		<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="CreatedDate3" onkeyup="if(this.value.length==4) {document.forms[0].CreatedDate4.focus()}" />&nbsp;(MM/DD/YYYY)</td>
	</tr>

	<tr>
		<td width="30%" class="FormLabels" align="right" height="25">Created Date To</td>
		<td class="links">
		<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="CreatedDate4" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate5.focus()}" />&nbsp;
		<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="CreatedDate5" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate6.focus()}" />&nbsp;
		<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="CreatedDate6" />&nbsp;(MM/DD/YYYY)</td>

	
	</tr>

	<tr>
		<td width="30%" class="FormLabels" align="right" height="25">Last Modified From</td>
		<td class="links">
		<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].elements[11].focus()}" />&nbsp;
		<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].elements[12].focus()}" />&nbsp;
		<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].elements[13].focus()}" />&nbsp;(MM/DD/YYYY)</td>
		
	</tr>

	<tr>
		<td width="30%" class="FormLabels" align="right" height="25">Last Modified To</td>
		<td class="links">
		<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].elements[14].focus()}" />&nbsp;
		<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].elements[15].focus()}" />&nbsp;
		<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  />&nbsp;(MM/DD/YYYY)
		</td>	
	
	</tr>

	<!--
	<tr>
	<td class="FormLabels" align="right" height="25">Data Entry Status</td>
	<td class="links">
	<html:select property="answer(CustomerAdditional::DataEntry::Like::String)" styleClass="txtbox">
		<html:option value ="">Select</html:option>
		<html:option value ="Completed">Completed</html:option>
		<html:option value ="In-Progress">In-Progress</html:option>
		<html:option value ="In-Complete">In-Complete</html:option>
		<html:option value ="Sent">Sent</html:option>
		<html:option value ="SentError">Sent Error</html:option>
		<html:option value ="InCoStar">In Co-Star</html:option>
		</html:select>
	</td>
</tr>
	-->
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 
	connector='or' negated="true">
	<tr>
		<td width="40%" align="right" class="FormLabels">
		Active
		</td> 
		<td align="left" >
			<html:select  property="answer(Object::Customer::Equals::Active)">
				<html:option value="Y">Active</html:option>
				<html:option value="D">Deactive</html:option>
			</html:select></td>
	</tr>
	</dmshtml:dms_static_with_connector>
	 

	
	 <tr><td>&nbsp;</td></tr>


<tr>
		<td colspan="2" align="center" >
		<html:submit value="Find" property="Search" styleClass="sbttn"/>
		&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
</tr>
</table>	
<!-- <tr><td><hr size="1" noshade></td></tr> --> </table>

<%
session.removeAttribute("showAllCustomers");

%>
<html:hidden property="answer(Object::Customer::Equals::CreatedDateBegin)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Customer::Equals::CreatedDateEnd)" value="" styleId="inpCreatedDateEnd"/>
<html:hidden property="answer(Object::Customer::Equals::UpdatedDateBegin)" value="" styleId="inpUpdatedDateBegin"/>
<html:hidden property="answer(Object::Customer::Equals::UpdatedDateEnd)" value="" styleId="inpUpdatedDateEnd"/>
<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN","GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN","AGENCY_EMPLOYEE"}%>' connector='or' negated="true">


<logic:present name="LoginPage" scope="session">

	<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>	
	<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
	<%String objType="";%>
	<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
	<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
		<%if(objDescType.toString().equals("ENTITY")){%>			
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN","AGENCY_EMPLOYEE"}%>' connector='or' negated="true">
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
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
	
</logic:present>



</dmshtml:dms_static_with_connector>


<html:hidden styleId="inpPageNum" property="answer(Object::Customer::PageNum)" value="0"/>
<html:hidden styleId="orderby" property="answer(Customer::orderBy)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
	
</html:form>
