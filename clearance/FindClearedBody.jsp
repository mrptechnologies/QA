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
	
	var beginMM=formElement.LastModified1.value;
	var beginDD=formElement.LastModified2.value;
	var beginYY=formElement.LastModified3.value;
	var endMM=formElement.LastModified4.value;
	var endDD=formElement.LastModified5.value;
	var endYY=formElement.LastModified6.value;
	
	var CrebeginMM=formElement.CreatedDate1.value;
	var CrebeginDD=formElement.CreatedDate2.value;
	var CrebeginYY=formElement.CreatedDate3.value;
	var CreendMM=formElement.CreatedDate4.value;
	var CreendDD=formElement.CreatedDate5.value;
	var CreendYY=formElement.CreatedDate6.value;
	
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
	
	
	<html:form name="CheckClearance" type="com.dms.web.data.DataForm" action="/FindClearedAction.do" onsubmit="return GoTOFindButton()">
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<html:hidden property="answer(Object::Clearance::OwnerId)"	value="<%=ownerId.toString()%>" styleId="ownerIdfrmjsp" />
	
	 <table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		
			
	
	<tr><td height="5"></td></tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">FIND CLEARED DATA</td>
	</tr>
	
	
		    <tr><td>&nbsp;</td></tr>
			
		
			<tr><td>
	<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
	<tr><td class="sectionhead" colspan ="2" align="center" >CLEARED DATA SEARCH CRITERIA</td></tr>
			    <tr><td>&nbsp;</td></tr>
	
		<tr>
			<td width="40%" align="right" class="FormLabels">
			Legal Name 1 &nbsp;&nbsp;
			</td> 
			<td align="left" ><html:text  property="answer(Object::Clearance::LegalName1)" styleClass="txtbox" styleId="LegalName1"/></td>
		</tr>
		<tr>
			<td width="40%" align="right" class="FormLabels">
			Legal Name 2 &nbsp;&nbsp;
			</td> 
			<td align="left" ><html:text  property="answer(Object::Clearance::LegalName2)" styleClass="txtbox" styleId="LegalName2"/></td>
		</tr>
		<tr>
			<td width="40%" align="right" class="FormLabels">
			Zipcode &nbsp;&nbsp;
			</td> 
			<td align="left" ><html:text  property="answer(Object::Clearance::Zipcode)" styleClass="txtbox" styleId="Zip"/></td>
		</tr>
		<tr>
			<td width="30%" class="FormLabels" align="right" height="25">Proposed Effective Date&nbsp;&nbsp;</td>
			<td class="links">
			<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="csdmm" onkeyup="if(this.value.length==2) {document.forms[0].csddd.focus()}" />&nbsp;
			<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="csddd" onkeyup="if(this.value.length==2) {document.forms[0].csdyy.focus()}" />&nbsp;
			<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="csdyy" />&nbsp;(MM/DD/YYYY)</td>	
		</tr>
		<br><br>		
	<tr>
		<td width="30%" class="FormLabels" align="right" height="25">Created Start Date&nbsp;&nbsp;</td>
		<td class="links">
		<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="CreatedDate1" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate2.focus()}" />&nbsp;
		<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="CreatedDate2" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate3.focus()}" />&nbsp;
		<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="CreatedDate3" onkeyup="if(this.value.length==4) {document.forms[0].CreatedDate4.focus()}" />&nbsp;(MM/DD/YYYY)</td>
	</tr>

	<tr>
		<td width="30%" class="FormLabels" align="right" height="25">Created End Date&nbsp;&nbsp;</td>
		<td class="links">
		<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="CreatedDate4" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate5.focus()}" />&nbsp;
		<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="CreatedDate5" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate6.focus()}" />&nbsp;
		<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="CreatedDate6" />&nbsp;(MM/DD/YYYY)</td>

	
	</tr>

	<tr>
		<td width="30%" class="FormLabels" align="right" height="25">Updated Start Date &nbsp;&nbsp;</td>
		<td class="links">
		<html:text  property ="answer(Month)"  size="2" maxlength="2" styleId="UpdatedDate1" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].elements[11].focus()}" />&nbsp;
		<html:text  property ="answer(Date)"  size="2" maxlength="2" styleId="UpdatedDate2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].elements[12].focus()}" />&nbsp;
		<html:text  property ="answer(Year)"  size="4" maxlength="4" styleId="UpdatedDate3" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].elements[13].focus()}" />&nbsp;(MM/DD/YYYY)</td>
		
	</tr>

	<tr>
		<td width="30%" class="FormLabels" align="right" height="25">Updadted End Date &nbsp;&nbsp;</td>
		<td class="links">
		<html:text  property ="answer(Month)"  size="2" maxlength="2" styleId="UpdatedDate4" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].elements[14].focus()}" />&nbsp;
		<html:text  property ="answer(Date)"  size="2" maxlength="2" styleId="UpdatedDate5" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].elements[15].focus()}" />&nbsp;
		<html:text  property ="answer(Year)"  size="4" maxlength="4" styleId="UpdatedDate6" styleClass="txtbox"  />&nbsp;(MM/DD/YYYY)
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
		
	
		
		 <tr><td>&nbsp;</td></tr>
	
	
	<tr>
			<td colspan="2" align="center" >
			<html:submit value="Find" property="Search" styleClass="sbttn"/>
			&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
	</tr>
	</table>	
 </table>
	
	<%
	session.removeAttribute("showAllCustomers");
	
	%>
	<html:hidden property="answer(Object::Customer::Equals::CreatedDateBegin)" value="" styleId="inpCreatedDateBegin"/>
	<html:hidden property="answer(Object::Customer::Equals::CreatedDateEnd)" value="" styleId="inpCreatedDateEnd"/>
	<html:hidden property="answer(Object::Customer::Equals::UpdatedDateBegin)" value="" styleId="inpUpdatedDateBegin"/>
	<html:hidden property="answer(Object::Customer::Equals::UpdatedDateEnd)" value="" styleId="inpUpdatedDateEnd"/>	
	<html:hidden styleId="inpPageNum" property="answer(Object::Customer::PageNum)" value="0"/>
	<html:hidden styleId="orderby" property="answer(Customer::orderBy)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	</html:form>
