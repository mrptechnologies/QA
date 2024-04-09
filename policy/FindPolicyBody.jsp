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

var effbeginMM=formElement.esdmm.value;
var effbeginDD=formElement.esddd.value;
var effbeginYY=formElement.esdyy.value;

var effendMM=formElement.eedmm.value;
var effendDD=formElement.eeddd.value;
var effendYY=formElement.eedyy.value;



if((cbeginMM!="")&&(cbeginDD!="")&&(cbeginYY!="")) {
formElement.inpCreatedDateBegin.value=cbeginYY+"-"+cbeginMM+"-"+cbeginDD;	
}

if((cendMM!="")&&(cendDD!="")&&(cendYY!="")) {
formElement.inpCreatedDateEnd.value=cendYY+"-"+cendMM+"-"+cendDD;
}

if((effbeginMM!="")&&(effbeginDD!="")&&(effbeginYY!="")) {
formElement.inpEffDateBegin.value=effbeginYY+"-"+effbeginMM+"-"+effbeginDD;
}

if((effendMM!="")&&(effendDD!="")&&(effendYY!="")) {
formElement.inpEffDateEnd.value=effendYY+"-"+effendMM+"-"+effendDD;
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

<html:form action="/SearchPolicyAction.do" onsubmit="return GoTOFindButton()">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr>
			<td height="5">&nbsp;</td>
		</tr>
	
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">FIND POLICY</td>
		</tr>
	
	 	<tr>
	 		<td>&nbsp;</td>
	 	</tr>
	
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
					<tr>
						<td width="40%" align="right" class="FormLabels">Policy Number</td> 
						
						<td align="left" >
							<html:text property="answer(Object::Policy::PolicyNumber)" styleClass="txtbox" styleId="PolicyNum" />
						</td>
					</tr>	
					
					<tr>
						<td width="30%" class="FormLabels" align="right">						
							Insured Name
						 </td>
						<td class="links">					
							<html:text property="answer(Object::Policy::InsuredName)" styleClass="txtbox" styleId="InsuredName" />
						</td>
					</tr>
					
					<tr>
						<td width="30%" class="FormLabels" align="right">						
							Quote Number
						 </td>
						<td class="links">
							<html:text property="answer(Object::Policy::QuoteNumber)" styleClass="txtbox" styleId="InsuredNumber" />						
						</td>
					</tr>
					
					<tr>
						<td width="30%" class="FormLabels" align="right">						
							Policy Status
						 </td>
						<td class="links">
							<html:select property="answer(Object::Policy::PolicyStatus)" styleClass="txtbox">
								<html:option value ="">All</html:option>							
								<html:option value ="Bound">Bound</html:option>	
								<html:option value ="Issued">Issued</html:option>
								<html:option value ="Canceled">Cancelled</html:option>																							
							</html:select>
						</td>
						
					</tr>
					<tr>
					 	<td width="30%" class="FormLabels" align="right">						
							Policy Type
						</td>	
					
					  <td class="links">
							<html:select property="answer(Object::Policy::PolicyType)" styleClass="txtbox">
								<html:option value ="">All</html:option>
								<html:option value ="POLICY">Policy</html:option>							
								<html:option value ="RENEWAL">Renewal</html:option>	
								<html:option value ="ENDORSEMENT">Endorsement</html:option>							
							</html:select>
						</td>
					</tr>
					<tr>
						<td width="30%" class="FormLabels" align="right" height="25">
							Policy Created Start Date
						</td>
						<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].csddd.focus()}" styleId="csdmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].csdyy.focus()}" styleId="csddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear,this,'Year');if(this.value.length==4) {document.forms[0].cedmm.focus()}" styleId="csdyy" />&nbsp;(MM/DD/YYYY)

						</td>
					</tr>
					
					<tr>
						<td width="30%" class="FormLabels" align="right" height="25">
							Policy Created End Date
						</td>
						<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].ceddd.focus()}" styleId="cedmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].cedyy.focus()}" styleId="ceddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear,this,'Year');" styleId="cedyy" />&nbsp;(MM/DD/YYYY)
						</td>
					</tr>
					
					<tr>
						<td width="30%" class="FormLabels" align="right" height="25">
							Policy Effective Start Date
						</td>
						<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].esddd.focus()}" styleId="esdmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].esdyy.focus()}" styleId="esddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].eedmm.focus()}" styleId="esdyy" />&nbsp;(MM/DD/YYYY)

						</td>			
					</tr>
	
					<tr>
						<td width="30%" class="FormLabels" align="right" height="25">							
							Policy Effective End Date
						</td>			
						<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].eeddd.focus()}" styleId="eedmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].eedyy.focus()}" styleId="eeddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="eedyy" />&nbsp;(MM/DD/YYYY)

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

<html:hidden property="answer(Object::Policy::PolCreatedStartDate)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Policy::PolCreatedEndDate)" value="" styleId="inpCreatedDateEnd"/>
<html:hidden property="answer(Object::Policy::PolEffStartDate)" value="" styleId="inpEffDateBegin"/>
<html:hidden property="answer(Object::Policy::PolEffEndDate)" value="" styleId="inpEffDateEnd"/>
<html:hidden property="answer(Object::Policy::OwnerId)" value="<%=""+ownerId %>"/>
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

