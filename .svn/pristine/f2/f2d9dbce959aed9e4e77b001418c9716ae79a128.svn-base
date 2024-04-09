<!--
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
-->
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript">
<!--
function GoTOFindButton()
{
var formElement=document.forms[0];

var uCrebeginMM=formElement.csdmm.value;
var uCrebeginDD=formElement.csddd.value;
var uCrebeginYY=formElement.csdyy.value;

var uCreendMM=formElement.cedmm.value;
var uCreendDD=formElement.ceddd.value;
var uCreendYY=formElement.cedyy.value;

if((uCreendMM!="")&&(uCrebeginDD!="")&&(uCrebeginYY!="")) {
formElement.inpCreatedDateBegin.value=uCrebeginYY+"-"+uCrebeginMM+"-"+uCrebeginDD;
}

if((uCreendMM!="")&&(uCreendDD!="")&&(uCreendYY!="")) {
formElement.inpCreatedDateEnd.value=uCreendYY+"-"+uCreendMM+"-"+uCreendDD;
}	

return true;
}

//-->
</SCRIPT>

<html:form action="/FindBilling.do"  onsubmit="return GoTOFindButton()">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td height="5">
		
		</td>
	</tr>

	<tr>
		<td class="NewSectionHead" colspan="4" align="center">FIND BILLING</td>
	</tr>

 	<tr>
 		<td>
 			&nbsp;
 		</td>
 	</tr>

	<tr>
		<td>
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">

				<tr>
					<td width="40%" align="right" class="FormLabels">
					
						Quote Id
					</td> 
					
					<td align="left" >
						
						<html:text  property="answer(Object::Billing::Quoteid)" styleClass="txtbox" styleId="quoteIdTemp" />
					</td>
				</tr>
				
				<tr>
					<td width="40%" align="right" class="FormLabels">
					
						Quote Number
					</td> 
					
					<td align="left" >
						
						<html:text  property="answer(Object::Billing::QuoteNum)" styleClass="txtbox" styleId="quoteNumberTemp" />
					</td>
				</tr>

				<tr>
					<td width="30%" class="FormLabels" align="right">
					
						Policy Number
					 </td>
					<td class="links">
				
						<html:text  property ="answer(Object::Billing::PolicyNumber)"   styleClass="txtbox"/>
					</td>
				</tr>
				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
						Create Start Date
					</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].csddd.focus()}" styleId="csdmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].csdyy.focus()}" styleId="csddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].cedmm.focus()}" styleId="csdyy" />&nbsp;(MM/DD/YYYY)
					</td>
				</tr>

				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
					Create End Date
				</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].ceddd.focus()}" styleId="cedmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].cedyy.focus()}" styleId="ceddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="cedyy" />&nbsp;(MM/DD/YYYY)
					</td>

				</tr>
								

				<tr>
					<td width="30%" class="FormLabels" align="right">
							Send Status 
					</td>
					
					<td class="links">
						<html:select property="answer(Object::Billing::SendStatus)" styleClass="txtbox">
							<html:option value ="">All</html:option>				
							<html:option value ="NEW">NEW</html:option>				
							<html:option value ="PROCESSED">PROCESSED</html:option>	
							<html:option value ="ERROR">ERROR</html:option>						
							<html:option value ="RESUBMITTED">RESUBMITTED</html:option>						 						
						</html:select>
					</td>
				</tr>
				
				
				<tr>
					<td width="30%" class="FormLabels" align="right">
							Error Type
					</td>
					
					<td class="links">
						<html:select property="answer(Object::Billing::ErrorType)" styleClass="txtbox">
							<html:option value ="">All</html:option>							
							<html:option value ="DATA_ERROR">DATA ERROR</html:option>	
							<html:option value ="RESPONSE_ERROR">RESPONSE ERROR</html:option>						
							<html:option value ="SEND_ERROR">SEND ERROR</html:option>
							<html:option value ="DUPLICATE_BILLING">DUPLICATE BILLING ERROR</html:option>
						</html:select>
					</td>
				</tr>
				

					

				<tr>
					<td>
						&nbsp;
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center" >
						<html:submit value="Find" property="Search" styleClass="sbttn"/>
						&nbsp;&nbsp;&nbsp;
						<html:reset value="Clear" styleClass="sbttn"/>
						&nbsp;&nbsp;&nbsp;
						<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/>
					</td>
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


<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::Billing::createdDateBegin)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Billing::createdDateEnd)" value="" styleId="inpCreatedDateEnd"/>
<html:hidden  property="answer(OwnerId)" value="<%=""+ownerId%>" />

<html:hidden  property="answer(Object::SearchBilling::PageNum)" value="0" />
<html:hidden  property="answer(Object::SearchBilling::CurrentPageNum)" value="0" />
<html:hidden  property="answer(Object::SearchBilling::TotalRec)" value="<%="0"%>" />
<html:hidden  property="answer(Object::SearchBilling::TotalPageNum)" value="<%="1"%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
	
</html:form>
