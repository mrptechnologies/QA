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

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<SCRIPT type="text/JavaScript">
<!--
function GoTOFindButton()
{
var formElement=document.forms[0];

var cbeginMM=formElement.csdmm.value;
var cbeginDD=formElement.csddd.value;
var cbeginYY=formElement.csdyy.value;

var cendMM=formElement.cedmm.value;
var cendDD=formElement.ceddd.value;
var cendYY=formElement.cedyy.value;

var ubeginMM=formElement.usdmm.value;
var ubeginDD=formElement.usddd.value;
var ubeginYY=formElement.usdyy.value;

var uendMM=formElement.uedmm.value;
var uendDD=formElement.ueddd.value;
var uendYY=formElement.uedyy.value;


if((cbeginMM!="")&&(cbeginDD!="")&&(cbeginYY!="")) {
formElement.inpCreatedDateBegin.value=cbeginYY+"-"+cbeginMM+"-"+cbeginDD;	
}

if((cendMM!="")&&(cendDD!="")&&(cendYY!="")) {
formElement.inpCreatedDateEnd.value=cendYY+"-"+cendMM+"-"+cendDD;
}

if((ubeginMM!="")&&(ubeginDD!="")&&(ubeginYY!="")) {
formElement.inpUpdatedDateBegin.value=ubeginYY+"-"+ubeginMM+"-"+ubeginDD;
}

if((uendMM!="")&&(uendDD!="")&&(uendYY!="")) {
formElement.inpUpdatedDateEnd.value=uendYY+"-"+uendMM+"-"+uendDD;
}

return true;
}

function validateDate(val,obj,desc){
	if(obj.value>val) {
		obj.value='';
		obj.focus();
		alert("Please Enter the Valid "+desc);
		return false;
	}	
}

//-->
</SCRIPT>

<html:form action="/SearchAlertAction.do" onsubmit="return GoTOFindButton()">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr>
			<td height="5">&nbsp;</td>
		</tr>
	
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">FIND ALERT</td>
		</tr>
	
	 	<tr>
	 		<td>&nbsp;</td>
	 	</tr>
	
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
					    <tr>
							<td width="35%" class="FormLabels" align="left">Alert Name *</td>
							<td class="links"><html:text property="answer(Object::Alert::AlertName)" styleId="AlertName"
								size="31" maxlength="40" styleClass="txtbox" /></td>
						</tr>						
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Description </td>
							<td class="links"><html:textarea property="answer(Object::Alert::AlertDesc)" styleId="AlertDesc" rows="3" cols="30" styleClass="txtarea" />
							</td>
						</tr>						
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Message </td>
							<td class="links"><html:textarea property="answer(Object::Alert::AlertMessage)" styleId="AlertMessage" rows="3" cols="30" styleClass="txtarea" />
							</td>
						</tr>						
						<tr>
							<td width="35%" class="FormLabels" align="left">Expiration Date Time </td>
							<td class="links"><html:text property="answer(Object::Alert::ExpirationDateTime)" styleId="ExpirationDateTime"
								size="31" maxlength="25" styleClass="txtbox" />(YYYY-MM-DD HH:MM:SS)</td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Start Date Time </td>
							<td class="links"><html:text property="answer(Object::Alert::StartDateTime)" styleId="StartDateTime"
								size="31" maxlength="25" styleClass="txtbox" />(YYYY-MM-DD HH:MM:SS)</td>
						</tr>						
						<tr>
							<td width="35%" class="FormLabels" align="left">Object Type </td>
							<td class="links">
								<html:select property="answer(Object::Alert::ObjectType)" styleId="ObjectType" styleClass="txtbox">
									<html:option value ="" >Select</html:option>
 									<html:option value ="Quote">QUOTE</html:option>
									<html:option value ="Policy">POLICY</html:option>
									<html:option value ="Broker">BROKER</html:option>
									<html:option value ="Broker_Firm">BROKER_FIRM</html:option>
									<html:option value ="Insured">INSURED</html:option>
									<html:option value ="Risk">RISK</html:option>
									<html:option value ="Subjectivity">SUBJECTIVITY</html:option>
								</html:select></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Object Id </td>
							<td class="links"><html:text property="answer(Object::Alert::ObjectId)" styleId="ObjectId"
								size="31" maxlength="10" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Object Ver Id </td>
							<td class="links"><html:text property="answer(Object::Alert::ObjectVerId)" styleId="ObjectVerId"
								size="31" maxlength="10" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Object Status </td>
							<td class="links">
								<html:select property="answer(Object::Alert::ObjectStatus)" styleId="ObjectStatus" styleClass="txtbox">
									<html:option value ="">Select</html:option>
 									<html:option value ="InProgress">INPROGRESS</html:option>
									<html:option value ="Referred">REFERRED</html:option>
									<html:option value ="Offered">OFFERED</html:option>
									<html:option value ="Bind_Request">BIND_REQUEST</html:option>
									<html:option value ="Bound">BOUND</html:option>
									<html:option value ="Issued">ISSUED</html:option>
									<html:option value ="Cancelled">CANCELLED</html:option>
									<html:option value ="Declined">DECLINED</html:option>
									<html:option value ="Lapsed">LAPSED</html:option>
								</html:select></td>
						</tr>
						<!--   <tr>
							<td width="35%" class="FormLabels" align="left">Search Alerts By </td>
							<td class="links">
								<html:select property="answer(Object::Alert::SearchByDays)" styleId="SearchAlertsBy" styleClass="txtbox">
									<html:option value ="">Select</html:option>
 									<html:option value ="7">Last 7 Days</html:option>
									<html:option value ="14">Last 14 Days</html:option>
									<html:option value ="30">Last Month</html:option>
									<html:option value ="-1">All</html:option>
								</html:select></td>
						</tr> -->
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Assigned To Me</td>
							<td class="links"><html:checkbox property="answer(Object::Alert::AssignedToMe)" value="true" /></td>
						</tr>
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Assigned To Others</td>
							<td class="links"><html:checkbox property="answer(Object::Alert::AssignedToOthers)" value="true" /></td>
						</tr>
												
						<tr>
							<td width="35%" class="FormLabels" align="left">UnAssigned</td>
							<td class="links"><html:checkbox property="answer(Object::Alert::UnAssigned)" value="true" /></td>
						</tr>
						
						<tr>
						<td width="35%" class="FormLabels" align="left" height="25">
							Alert Created Start Date
						</td>
						<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].csddd.focus()}" styleId="csdmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].csdyy.focus()}" styleId="csddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear,this,'Year');if(this.value.length==4) {document.forms[0].cedmm.focus()}" styleId="csdyy" />&nbsp;(MM/DD/YYYY)

						</td>
					</tr>
					
					<tr>
						<td width="35%" class="FormLabels" align="left" height="25">
							Alert Created End Date
						</td>
						<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].ceddd.focus()}" styleId="cedmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].cedyy.focus()}" styleId="ceddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear,this,'Year');" styleId="cedyy" />&nbsp;(MM/DD/YYYY)
						</td>
					</tr>
					
					<tr>
						<td width="35%" class="FormLabels" align="left" height="25">
							Alert Updated Start Date
						</td>
						<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].usddd.focus()}" styleId="usdmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].usdyy.focus()}" styleId="usddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear,this,'Year');if(this.value.length==4) {document.forms[0].uedmm.focus()}" styleId="usdyy" />&nbsp;(MM/DD/YYYY)
						<!-- <html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].uedmm.focus()}" styleId="usdyy" />&nbsp;(MM/DD/YYYY) -->

						</td>			
					</tr>
	
					<tr>
						<td width="35%" class="FormLabels" align="left" height="25">							
							Alert Updated End Date
						</td>			
						<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].ueddd.focus()}" styleId="uedmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].uedyy.focus()}" styleId="ueddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear,this,'Year');" styleId="uedyy" />&nbsp;(MM/DD/YYYY)

						</td>
					</tr>
					
										
					<tr height="80">
							<td colspan="2" align="center" >
							<html:submit value="Find" property="Search" styleClass="sbttn"/>
							&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
					</tr>
													
				</table>
			</td>
		</tr>
		
		<tr>
			<td>
				<hr size="1" noshade>
			</td>
	</tr>
</table>

<html:hidden property="answer(Object::Alert::CreatedBeginDate)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Alert::CreatedEndDate)" value="" styleId="inpCreatedDateEnd"/>
<html:hidden property="answer(Object::Alert::UpdatedBeginDate)" value="" styleId="inpUpdatedDateBegin"/>
<html:hidden property="answer(Object::Alert::UpdatedEndDate)" value="" styleId="inpUpdatedDateEnd"/>
<html:hidden  property="answer(Object::Alert::PageNum)" value="0" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

</html:form>
