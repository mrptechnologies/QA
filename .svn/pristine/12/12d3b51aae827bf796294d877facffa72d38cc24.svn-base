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
	
	var uCrebeginMM=formElement.sentStartMonth.value;
	var uCrebeginDD=formElement.sentStartDate.value;
	var uCrebeginYY=formElement.sentStartYear.value;
	
	var uCreendMM=formElement.sentEndMonth.value;
	var uCreendDD=formElement.sentEndDate.value;
	var uCreendYY=formElement.sentEndYear.value;


	if((uCrebeginMM!="")&&(uCrebeginDD!="")&&(uCrebeginYY!="")) {
		formElement.inpCreatedDateBegin.value=uCrebeginYY+"-"+uCrebeginMM+"-"+uCrebeginDD;
	}

	if((uCreendMM!="")&&(uCreendDD!="")&&(uCreendYY!="")) {
		formElement.inpCreatedDateEnd.value=uCreendYY+"-"+uCreendMM+"-"+uCreendDD;
	}	

	return true;
}

</SCRIPT>




<html:form action="/ListOfEmail.do" onsubmit="return GoTOFindButton(this)">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="ObjectId"  property="answer(Object::Notification::Email::ObjectId)"  name="PrefilledEmailAction"  />


 <table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	    <tr><td>&nbsp;</td></tr>
		<tr><td class="NewSectionHead" colspan="4" align="center">FIND EMAIL</td></tr>
		<tr><td><hr size="1" noshade></td></tr>
		<tr>
		 <td>
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Quote Number &nbsp;
					</td> 
					<td align="left" ><html:text  property="answer(Object::Notification::Email::ObjectId)" size="30" styleClass="txtbox"/></td>
				</tr>	
				
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Quote Type &nbsp;
					</td> 
					<td class="links" align="left" >
						<html:select  property="answer(Object::Notification::Email::ObjectType)" styleClass="txtbox">
							<html:option value="">ALL</html:option>
							<html:option value="Quote">QUOTE</html:option>
							<html:option value="Endorsement">ENDORSEMENT</html:option>
							<html:option value="Renewal">RENEWAL</html:option>
						</html:select></td>
				</tr>
				
				<tr>
					<td width="40%" align="right" class="FormLabels">
						From Address &nbsp;
					</td> 
					<td align="left" ><html:text  property="answer(Object::Notification::Email::FromAddress)" size="30" styleClass="txtbox"/></td>
				</tr>	
				<tr>
					<td width="40%" align="right" class="FormLabels">
						To Address &nbsp;
					</td> 
					<td align="left" ><html:text property="answer(Object::Notification::Email::ToAddress)" size="30" styleClass="txtbox"/></td>
				</tr>
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Cc Address &nbsp;
					</td> 
					<td align="left" ><html:text property="answer(Object::Notification::Email::CcAddress)" size="30" styleClass="txtbox"/></td>
				</tr>
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Bcc Address &nbsp;
					</td> 
					<td align="left" ><html:text property="answer(Object::Notification::Email::BccAddress)" size="30" styleClass="txtbox"/></td>
				</tr>
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Subject &nbsp;
					</td> 
					<td align="left" ><html:text property="answer(Object::Notification::Email::EmailSubject)" size="30" maxlength="50" styleClass="txtbox"/></td>
				</tr>
				<tr>
					<td width="40%"  align="right" class="FormLabels">
						Message &nbsp;
					</td> 
					<td align="left" ><html:textarea property="answer(Object::Notification::Email::EmailMessage)" rows="10" cols="50" styleClass="txtbox"/></td>
				</tr>
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Send Status &nbsp;
					</td> 
					<td class="links" align="left" >
						<html:select  property="answer(Object::Notification::Email::SendStatus)" styleClass="txtbox">
							<html:option value="">ALL</html:option>
							<html:option value="SENT">SENT</html:option>
							<html:option value="NOT_SENT">NOT SENT</html:option>
						</html:select></td>
				</tr>
			
				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
						Sent Start-Date &nbsp;
					</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].sentStartDate.focus()}" styleId="sentStartMonth" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].sentStartYear.focus()}" styleId="sentStartDate" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].sentEndMonth.focus()}" styleId="sentStartYear" />&nbsp;(MM/DD/YYYY)
					</td>
				</tr>
			
				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
						Sent End-Date &nbsp;
					</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].sentEndDate.focus()}" styleId="sentEndMonth" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].sentEndYear.focus()}" styleId="sentEndDate" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="sentEndYear" />&nbsp;(MM/DD/YYYY)
					</td>
				</tr>
			
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center" >
					<html:submit value="Find" property="Search" styleClass="sbttn"/>
					&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/></td>
			</tr>
		</table>
	</td>	
</tr>
<tr><td><hr size="1" noshade></td></tr>
</table>

<html:hidden property="answer(Object::Notification::Email::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Notification::Email::SentDateBegin)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Notification::Email::SentDateEnd)" value="" styleId="inpCreatedDateEnd"/>

<html:hidden  property="answer(Object::Notification::Email::PageNum)" value="0" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>
