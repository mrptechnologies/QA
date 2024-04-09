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

function GoTOFindButton()
{
	var formElement=document.forms[0];
	
	var uCrebeginMM=formElement.processStartMonth.value;
	var uCrebeginDD=formElement.processStartDate.value;
	var uCrebeginYY=formElement.processStartYear.value;
	
	var uCreendMM=formElement.processEndMonth.value;
	var uCreendDD=formElement.processEndDate.value;
	var uCreendYY=formElement.processEndYear.value;


	if((uCrebeginMM!="")&&(uCrebeginDD!="")&&(uCrebeginYY!="")) {
		formElement.inpCreatedDateBegin.value=uCrebeginYY+"-"+uCrebeginMM+"-"+uCrebeginDD;
	}

	if((uCreendMM!="")&&(uCreendDD!="")&&(uCreendYY!="")) {
		formElement.inpCreatedDateEnd.value=uCreendYY+"-"+uCreendMM+"-"+uCreendDD;
	}	

	return true;
}

</SCRIPT>




<html:form action="/FindUploadClaims.do" onsubmit="return GoTOFindButton(this)">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

 <table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	    <tr><td>&nbsp;</td></tr>
		<tr><td class="NewSectionHead" colspan="4" align="center">FIND IMPORT CLEARANCE</td></tr>
		<tr><td><hr size="1" noshade></td></tr>
		<tr>
		 <td>
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
				<tr><td>&nbsp;</td></tr>
				
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Insured Name &nbsp;
					</td> 
					<td align="left" ><html:text  property="answer(Object::Claims::PolicyNumber)" size="30" styleClass="txtbox"/></td>
				</tr>	
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Zip &nbsp;
					</td> 
					<td align="left" ><html:text property="answer(Object::Claims::ClaimPolicyNumber)" size="30" styleClass="txtbox"/></td>
				</tr>
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Claim Number &nbsp;
					</td> 
					<td align="left" ><html:text property="answer(Object::Claims::ClaimNumber)" size="30" styleClass="txtbox"/></td>
				</tr>
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Clearance File Status &nbsp;
					</td> 
					<td class="links" align="left" >
						<html:select  property="answer(Object::Claims::FileStatus)" styleClass="txtbox">
							<html:option value="">ALL</html:option>
							<html:option value="ERROR">ERROR</html:option>
							<html:option value="NO_ERROR">NO ERROR</html:option>
						</html:select></td>
				</tr>
	
					
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Claim Record Status &nbsp;
					</td> 
					<td class="links" align="left" >
						<html:select  property="answer(Object::Claims::RecordStatus)" styleClass="txtbox">
							<html:option value="">ALL</html:option>
							<html:option value="ERROR">ERROR</html:option>
							<html:option value="INSERTED">INSERTED</html:option>
							<html:option value="UPDATED">UPDATED</html:option>
						</html:select></td>
				</tr>
			
				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
						Process Start-Date &nbsp;
					</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].processStartDate.focus()}" styleId="processStartMonth" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].processStartYear.focus()}" styleId="processStartDate" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].processEndMonth.focus()}" styleId="processStartYear" />&nbsp;(MM/DD/YYYY)
					</td>
				</tr>
			
				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
						Process End-Date &nbsp;
					</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].processEndDate.focus()}" styleId="processEndMonth" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].processEndYear.focus()}" styleId="processEndDate" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="processEndYear" />&nbsp;(MM/DD/YYYY)
					</td>
				</tr>
			
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center" >
					<html:submit value="Find" property="Search" styleClass="sbttn"/>
					&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
			</tr>
		</table>
	</td>	
</tr>
<tr><td><hr size="1" noshade></td></tr>
</table>

<html:hidden property="answer(Object::Claims::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Claims::ProcessDateBegin)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Claims::ProcessDateEnd)" value="" styleId="inpCreatedDateEnd"/>

<html:hidden  property="answer(Object::Claims::PageNum)" value="0" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(claimUploadActionType)" value="FindClaimsUpload" />
</html:form>
