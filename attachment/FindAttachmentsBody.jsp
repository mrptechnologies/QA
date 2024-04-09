<%@ page import="java.util.*;" %>

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
function clearAll()
{
	for (var i=7;i>1;i--)
	{
		document.forms[0].elements[i].value="";
	}
	document.forms[0].elements[2].focus();
	/*frm.credFMonth.value="";
	frm.credFDate.value="";
	frm.credFYear.value="";
	frm.credTMonth.value="";
	frm.credTDate.value="";
	frm.credTYear.value="";
	frm.credFMonth.focus();*/
}
function validateForm(formElement)
{

var CrebeginMM= formElement.credFMonth.value;
var CrebeginDD= formElement.credFDate.value;
var CrebeginYY= formElement.credFYear.value;
var CreendMM= formElement.credTMonth.value;
var CreendDD= formElement.credTDate.value;
var CreendYY= formElement.credTYear.value;

if((CrebeginMM!="")&&(CrebeginDD!="")&&(CrebeginYY!="")) {
formElement.inpCreatedDateBegin.value=CrebeginMM+"/"+CrebeginDD+"/"+CrebeginYY;
}

if((CreendMM!="")&&(CreendDD!="")&&(CreendYY!="")) {
formElement.inpCreatedDateEnd.value=CreendMM+"/"+CreendDD+"/"+CreendYY;
}

/* Uncomment this to start debugging
alert("Start");
var temp1;
for (var j=0;formElement.elements[j]!=null; j++)
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
<!-- <body onload="clearAll()" >-->
	<html:form action="/FindAllAttachments.do" styleId="frm" onsubmit="return validateForm(this)">
		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

 		<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
				<tr><td class="Error"><html:errors/></td></tr>
				<!-- <tr>-->
				<tr><td class="MH">FIND ATTACHMENTS</td></tr>
				<tr><td><hr size="1"></td></tr>
				<tr><td>
					<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2" >
						<tr><td class="sectionhead" colspan ="2" align="center" >ATTACHMENT DETAILS 	</td></tr>
						<tr><td> <br> </td><td> <br> </td></tr>
						<tr>
							<td width="30%" class="FormLabels" align="right" height="25">State</td>
							<td class="links">
								<html:text  property ="answer(Object::Attachment::AttachmentState)"   styleClass="txtbox" styleId="state" />
							</td>
						</tr>
						<tr>
							<td width="30%" class="FormLabels" align="right" height="25">Status</td>
							<td class="links">
								<html:text  property ="answer(Object::Attachment::AttachmentStatus)"   styleClass="txtbox" styleId="status" />
							</td>
						</tr>
						<tr>
							<td width="30%" class="FormLabels" align="right" height="25">Type</td>
							<td class="links">
								<html:text  property ="answer(Object::Attachment::AttachmentType)" styleClass="txtbox" styleId="type" />
							</td>
						</tr>
						<tr>
							<td width="30%" class="FormLabels" align="right" height="25">Created Date From</td>
							<td class="links">
								<html:text  property ="answer(Month1)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {frm.credFDate.select()}" styleId="credFMonth" />&nbsp;
								<html:text  property ="answer(Date1)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {frm.credFYear.select()}" styleId="credFDate" />&nbsp;
								<html:text  property ="answer(Year1)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {frm.credTMonth.select()}" styleId="credFYear" />&nbsp;(MM/DD/YYYY)
							</td>
						</tr>
						<tr>
							<td width="30%" class="FormLabels" align="right" height="25">Created Date To</td>
							<td class="links">
								<html:text  property ="answer(Month2)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {frm.credTDate.select()}" styleId="credTMonth" />&nbsp;
								<html:text  property ="answer(Date2)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {frm.credTYear.select()}" styleId="credTDate" />&nbsp;
								<html:text  property ="answer(Year2)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {frm.Search.focus()}" styleId="credTYear" />&nbsp;(MM/DD/YYYY)
							</td>
			 		   </tr>	
						<tr>
							<td colspan="2" align="center" >
								<TABLE><TR>
									<TD><html:submit value="Find" property="Search" styleClass="sbttn"/></TD><TD></TD>
									<TD><html:reset value="Clear" styleClass="sbttn"/></TD>
									<TD><html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></TD></TR></TABLE>
							</td>
						</tr>
				</table>	
			</td></tr>
		<tr><td><hr size="1" ></td></tr>
		</table>
		<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
			<tr><td><html:hidden property="answer(Object::Customer::Equals::CreatedDateBegin)" value="" styleId="inpCreatedDateBegin"/></td></tr>
			<tr><td><html:hidden property="answer(Object::Customer::Equals::CreatedDateEnd)" value="" styleId="inpCreatedDateEnd"/></td></tr>
	
<tr><td><html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" /></td></tr>
		</table>
	</html:form>
<!-- </body>-->
