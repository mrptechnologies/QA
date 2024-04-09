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

function GoTOFindButton()
{
var formElement=document.forms[0];

var cbeginMM=formElement.csdmm.value;
var cbeginDD=formElement.csddd.value;
var cbeginYY=formElement.csdyy.value;



if((cbeginMM!="")&&(cbeginDD!="")&&(cbeginYY!="")) {
formElement.inpCreatedDateBegin.value=cbeginYY+"-"+cbeginMM+"-"+cbeginDD;	
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


</SCRIPT>

< form action=" " onsubmit="return GoTOFindButton()">



	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr>
			<td height="5">&nbsp;</td>
		</tr>
	
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">CHECK CLEARANCE</td>
		</tr>
	
	 	<tr>
	 		<td>&nbsp;</td>
	 	</tr>
	
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
					    <tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							
							<tr>
								<td class="FormLabels" align="left" width="40%"> &nbsp;&nbsp;Agency *</td>	
								<td class="links" width="26%">&nbsp;<html:text  name="AddCustomer" property ="answer(AgencyName)" size="60" maxlength="60" styleClass="txtbox" readonly="true" styleId="Agenname" /></td>
								<td><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButton()"></td>								
							</tr>		 	
						</table>

					</td>
				</tr>					
												
												
						<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Insured Name Type</td>
								<td class="links" style="Class:txtbox">&nbsp;<html:select name="AddCustomer" property="answer(Object::Clearance::NameType)" styleClass="txtbox" styleId="NameType" onchange="showCompanyInformation(this.form)">
										 <html:option value ="Person" styleClass="txtbox">Person</html:option>
									     <html:option value ="Company" styleClass="txtbox">Company</html:option>
								</html:select>
								</td>
							</tr> 							
							<tr><td>&nbsp;&nbsp;&nbsp;</td></tr>																		
							<tr>
								<td width="40%" class="FormLabels" align="left" id="insuredNameBlock" >&nbsp;&nbsp;Leagal Name 1 *</td>
								<td class="links" width="29%">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Clearance::CustomerName)"  size="65" styleClass="txtbox" styleId="InsuredName" /> </td>
								<td><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButton()"> </td>
							</tr>							
							<tr>
								<td width="40%" class="FormLabels" align="left" id="insuredNameBlock" >&nbsp;&nbsp;Leagal Name 2 *</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Clearance::CustomerName2)"  size="65" styleClass="txtbox" styleId="InsuredName2" /></td>
							</tr>		
							<tr id="DBABlock">
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;DBA</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Clearance::DBA)"  size="65" styleClass="txtbox" styleId="DBA" /></td>
							</tr>	
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Zip Code*</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Clearance::Zip)" size="10" maxlength="10" styleClass="txtbox" styleId="Zip" onkeyup="if(this.value.length==5) {this.value=this.value+'-'}"/>
								<!--Zipcode lookup start 05-06-2006-->
								<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a></td>
								<!-- 05-06-2006 end-->																	
							</tr>							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Select Product* </td>
								<td class="links" style="Class:txtbox">&nbsp;<html:select name="AddCustomer" property="answer(Object::Clearance::Product)" styleClass="txtbox" styleId="NameType" onchange="showCompanyInformation(this.form)">
										 <html:option value ="" styleClass="txtbox"></html:option>
									     <html:option value ="" styleClass="txtbox"></html:option>
								</html:select>
								</td>
							</tr>							
							<tr><td>&nbsp;&nbsp;&nbsp;</td></tr>							
							<tr>
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Proposed Effective Date</td>								
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
							
																			
						</table>
					</td>
				</tr>
						
							
								
						
						
						
					
										
					<tr height="80">
							<td colspan="2" align="center" >
							<html:submit value="Clear" property="Search" styleClass="sbttn"/>
							&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
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

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />



</form>
