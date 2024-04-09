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


<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddSalesManager.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></SCRIPT>

<!-- body onLoad="return popDateFields()" -->
<bean:define id="entityId" name="AddSalesManager" property="answer(Object::Entity::EntityId)" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:form action="/AddSalesManager.do" onsubmit="return validateFields();">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>


<bean:define id="EffectiveDate" property="answer(Object::EntityAdditional::EffectiveDate)" name="AddSalesManager" />

 <%
  String effDate = ""+EffectiveDate;
 
  String arrEffectiveDate[] = effDate.split("/");
  
  String effectiveMonth = "";
  String effectiveDate = "";
  String effectiveYear = "";
  if( arrEffectiveDate.length >= 3){
  	effectiveMonth = arrEffectiveDate[0];
  	effectiveDate = arrEffectiveDate[1];
  	effectiveYear = arrEffectiveDate[2];
  }
 %>
 
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<!--jsp:include page="../common/CustomerAgencyLinkspage.jsp" /-->

	<tr>
	
		<td valign="top" align="left">
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

				<tr><td class="NewSectionHead" colspan="4" align="center">SALES MANAGER DETAILS </td></tr>
<tr>
					<td>&nbsp;</td>
				</tr>
				
	<tr>
		<td class="TextMatter"><bean:message key="AddorEditSalesManager.Description"/>	</td>
	</tr>

	<tr>
		<td class="Error"><hr size="1" noshade></td>
	</tr>
	<%if (request.getParameter("status")!= null) {%>
	<%if (request.getParameter("status").equals("Success")) {%>
	<tr><td class="Error">
	Updated</td></tr>
	<%}%>
	<%if (request.getParameter("status").equals("Failure")) {%>
	<td class="Error">
	Failed to Update!!
	</td>
	<%} }%>


	<logic:present name="msgInfo" scope="request">
	<tr>
		<td class="Error">
		<%=request.getAttribute("msgInfo")%>
		</td>
	</tr>
	</logic:present>
	<TR>
	<TD COLSPAN="2" class="Error">
	<html:errors/>
	</TD>
	</TR>


<tr><td>


<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td></td></tr>
</table>
</td></tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

<%
	boolean errorOccured=false;
%>


<bean:define id="ansmap"  name="AddSalesManager" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
<logic:iterate id="element" name="ansmap">
	<bean:define id="errorListkey" name="element" property="key" />
	<logic:equal name="errorListkey" value="Object::error::list">
		<bean:define id="errorListvalue" name="element" property="value" />
		<logic:iterate id="errmsg" name="errorListvalue">
			<tr>
			<td class="Error" colspan="5">			
			<bean:write name="errmsg" property="errorMessage" />
            <%
        		errorOccured	=true;				
			%>
			</td>
			</tr>
		</logic:iterate>
	</logic:equal>
</logic:iterate> 


<%




	if(errorOccured)
	{
		((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
		((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.OBJECT_ERROR_LIST);
	}
%>
<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td align="center">
						<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td colspan="2" align="center" class="sectionhead">ADD/EDIT SALES MANAGER</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="90%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
							
							<tr>
								<td width="35%" class="FormLabels" align="left" height="25"><bean:message key="EmployeeDetails.FirstName"/>*</td>
								<td class="links"><dmshtml:dms_text  name="AddSalesManager" property ="answer(Object::Entity::FirstName)" styleId="FirstName"  size="15" maxlength="15" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td width="30%" class="FormLabels" align="left" height="25">Middle Initial</td>
								<td class="links"><dmshtml:dms_text name="AddSalesManager"  property ="answer(Object::Entity::middleName)"  size="1" maxlength="1" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td width="30%" class="FormLabels" align="left" height="25"><bean:message key="EmployeeDetails.LastName"/>*</td>
								<td class="links"><dmshtml:dms_text name="AddSalesManager"  property ="answer(Object::Entity::LastName)" styleId="LastName" size="15" maxlength="15" styleClass="txtbox"/></td>
							</tr>
							



							<tr>
							<td  class="FormLabels">
							Type *</td><td>
							
														
					<!--select name="answer(Object::Entity::EntityType)"><option value="">Select</option>
					<option value="SALESMANAGER">Sales Manager</option>
					<option value="REGIONAL_SALESMANAGER" >Regional Sales Manager</option></select-->		
					

					<html:select property="answer(Object::Entity::EntityType)" name="AddSalesManager" styleId="Type">
					<html:option value =''>Select</html:option>		
					<html:option value ='SALESMANAGER'>Sales Manager</html:option>					
					<html:option value ='REGIONAL_SALESMANAGER'>Regional Sales Manager</html:option>
				</html:select>
							
					
</td>
							</tr>
						
							<tr><td>&nbsp;</td><td>&nbsp;</td></tr>



<!--Address-->

					<tr>
						<td colspan="2" >
						
							<tr>
								<td class="FormLabels" align="Center" height="25" colspan="2"><u>Address:</u></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" height="25" width="35%">Address1</td><td><dmshtml:dms_text name="AddSalesManager"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Address1)" size="30" maxlength="30" styleClass="txtbox"/></td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left" height="25">Address2</td><td><dmshtml:dms_text name="AddSalesManager"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Address2)" size="30" maxlength="30" styleClass="txtbox"/></td>
							</tr>

							<tr>
								<td class="FormLabels" align="left" height="25">City</td><td><dmshtml:dms_text name="AddSalesManager"  property="answer(Object::Entity::Addresses::HOME::Object::Address::City)" styleId="City" size="20" maxlength="20" styleClass="txtbox"/></td>
							</tr>
							
							<tr>
								<!--  <td width="42%" class="FormLabels" align="left">County</td> -->
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::County)" styleId="County" /></td>
							</tr>
							
							<tr>
							<td  class="FormLabels">
							State</td><td>
							<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							<html:select property="answer(Object::Entity::Addresses::HOME::Object::Address::State)" styleClass="txtbox" styleId="State">
							<html:option value ="">Select</html:option>
							<logic:iterate id="details" name="arStates" scope="request" >
							<bean:define id='test' name="details"  property="typeDesc" />
							<html:option value ='<%=test.toString()%>'>
							<bean:write name="details" property="dmsType" />
							</html:option>
							</logic:iterate>
							</html:select>
							</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" height="25">ZIP</td><td><dmshtml:dms_text name="AddSalesManager"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Zip)" styleId="Zip" size="10" maxlength="10" styleClass="txtbox" onkeyup="if(this.value.length==5) {this.value=this.value+'-'}" />
								<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddSalesManager&HomeFlag=Business&clear=yes" title="Search for zip code, state" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
								</td>
							</tr>
							
								<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
		

<!--Contact-->
							<tr>
								<td class="FormLabels" align="Center" height="25" colspan="2"><u>Contact:</u></td>
							</tr>

							<tr>
								<td class="FormLabels" align="left">Work Phone</td>
								<td class="links"><dmshtml:dms_text  name="AddSalesManager" property ="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhoneAreaCode)"  size="3" maxlength="3" styleClass="txtbox" />&nbsp;<dmshtml:dms_text  name="AddSalesManager" property ="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhoneExchangeCode)"  size="3" maxlength="3" styleClass="txtbox" />&nbsp;
								<dmshtml:dms_text  name="AddSalesManager" property ="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)"  size="4" maxlength="4" styleClass="txtbox" /></td>
							</tr>	








						 	<tr>


						<bean:define id="MobileNum" name="AddSalesManager"
							property="answer(Object::Entity::Contacts::HOME::Object::Contact::MobilePhone)" />
						<%
							String MobileNumber=MobileNum.toString();
							String mob1="";
							String mob2="";
							String mob3="";
							if(!MobileNumber.equals(""))
							{
					  		mob1= MobileNumber.substring(0,3);
							mob2= MobileNumber.substring(3,6);
							mob3= MobileNumber.substring(6);
							}
						%>



								<td class="FormLabels" align="left">Cell Phone</td>
								<td class="links"><dmshtml:dms_text  name="AddSalesManager" property ="answer(mob1)" value="<%=mob1%>" styleId="mobile1" size="3" maxlength="3" styleClass="txtbox" />
								
								<dmshtml:dms_text  name="AddSalesManager" property ="answer(mob2)" value="<%=mob2%>"   styleId="mobile2" size="3" maxlength="3" styleClass="txtbox" />&nbsp;
								
								<dmshtml:dms_text  name="AddSalesManager" property ="answer(mob3)" value="<%=mob3%>"   styleId="mobile3" size="4" maxlength="4" styleClass="txtbox" />
								
								<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::MobilePhone)" styleId="MobileNumber"  /></td>
						
								
							</tr>	 






							<tr>
								<td class="FormLabels" align="left" height="25" width="35%">Fax</td><td><dmshtml:dms_text name="AddSalesManager"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::Fax)" size="30" maxlength="30" styleClass="txtbox"/></td>
							</tr>

							<tr>
								<bean:define id="emailid" name="AddSalesManager"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" />
								<td class="FormLabels" align="left" height="25" width="35%">Email Id</td><td><dmshtml:dms_text name="AddSalesManager"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" size="30" maxlength="30" styleClass="txtbox" styleId="contactEmail"/>
								<input id="userEmail" name="answer(Object::UserDetail::email)" value="<%=emailid %>" class="txtbox" type="hidden"></td>
							</tr>


							<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
				
					
<!--Additonal Info-->

	<tr>

		<td class="FormLabels" align="Center" height="25" colspan="2"><u>Additonal Info:</u></td>
	</tr>

	<tr>
		<td width="30%" class="FormLabels" align="left" height="25">Effective Date</td>
		<td class="links">	
		<dmshtml:dms_text  name="AddSalesManager" property ="answer(effMM)" value="<%= effectiveMonth %>" size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].effdd.focus()}" styleId="effmm"  />/mm&nbsp;				
		<dmshtml:dms_text  name="AddSalesManager" property ="answer(effDD)"  value="<%= effectiveDate %>" size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].effyy.focus()}"  styleId="effdd"  />/dd&nbsp;								
		<dmshtml:dms_text  name="AddSalesManager" property ="answer(effyyyy)" value="<%= effectiveYear %>" size="4" maxlength="4" styleClass="txtbox" styleId="effyy"  />/yyyy</td>
	</tr>
	<tr>
		<td class="FormLabels" align="left" height="25" width="35%">Designation</td><td><dmshtml:dms_text name="AddSalesManager"  property="answer(Object::EntityAdditional::Designation)" size="30" maxlength="30" styleClass="txtbox"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="left" height="25" width="35%">Assigned States/Regions</td><td><dmshtml:dms_text name="AddSalesManager"  property="answer(Object::EntityAdditional::Assigned)" size="30" maxlength="30" styleClass="txtbox"/></td>
	</tr>


	<tr><td>&nbsp;</td><td>&nbsp;</td></tr>




<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.UserAccount"/></td>
	
	</tr>

	<logic:notEmpty name="AddSalesManager" property="answer(Object::UserDetail::userName)">
	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/></td>
		<td class="menulinks">:<bean:write  name="AddSalesManager" property="answer(Object::UserDetail::userName)" />&nbsp;&nbsp;<A HREF="../ChangePasswordForUsers.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&userId=<bean:write  name='AddSalesManager' property='answer(Object::UserDetail::userName)' />"><IMG SRC="../Images/GoButton.jpg" WIDTH="30" HEIGHT="16" BORDER="0" ALT=""></A>
		<html:hidden property="answer(EDIT)" value="YES" />
		<html:hidden name="AddSalesManager"  property="answer(Object::UserDetail::userName)"/>
		<html:hidden name="AddSalesManager" property="answer(Object::UserDetail::hintQuestion)" />
		<html:hidden name="AddSalesManager" property="answer(Object::UserDetail::hintAnswer)"/>
		</td>
	</tr> 
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Question"/></td>
		<td class="TextMatter">:<bean:write name="AddSalesManager" property="answer(Object::UserDetail::hintQuestion)" /></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Answer"/></td>
		<td class="TextMatter">:<bean:write name="AddSalesManager" property="answer(Object::UserDetail::hintAnswer)" /></td>
	</tr>
	</logic:notEmpty>
	<logic:empty name="AddSalesManager" property="answer(Object::UserDetail::userName)">
	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/></td>
		<td class="menulinks">&nbsp;<html:text styleId="userName" styleClass="txtbox"  property="answer(Object::UserDetail::userName)" value="" size="20" maxlength="40"/>&nbsp;At least 6 characters</td>

	</tr> 
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Password"/></td>
		<td class="menulinks">
			&nbsp;<input id="password" type="password" name="answer(Object::UserDetail::passWord)" maxlength="10" size="12" class="txtbox" autocomplete="off" value="">&nbsp;At least 6 alphanumeric characters
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.ConfirmPassword"/></td>
		<td>
			&nbsp;<input id="confirmPassword" type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="10" size="12" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Question"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintQuestion)" size="30" maxlength="50"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Answer"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintAnswer)" size="30" maxlength="50"/></td>
	</tr>
	</logic:empty>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 
		connector='or' negated="true">	
		<tr>
			<td class="FormLabels" align="right">Active&nbsp;</td>
			<td class="TextMatter">&nbsp;<html:select property="answer(Object::Entity::Active)" >
			<html:option value ="Y">Yes</html:option>
			<html:option value ='D'>No</html:option>
			</html:select></td>
		</tr>
	</dmshtml:dms_static_with_connector>




		</table>					
	
					</td>	</tr>		
							
							<tr><td >&nbsp;</td></tr>
						</table>
					</td>
				</tr>

				<tr>
					<td align="center">
					<html:submit value="Save" property="amswer(button)" styleClass="sbttn" />&nbsp;&nbsp;
					<html:reset value="Reset" styleClass="sbttn"/>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>





		<!-- /td -->
	<!-- /tr -->
</table>


<input type="hidden" name="objectType" value="ENTITY"/>
<html:hidden property="page" value="2" /> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Entity::Equals::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
<bean:define id="userpassword" property="answer(Object::UserDetail::passWord)" name="AddSalesManager" scope="session"/> 
<html:hidden property="answer(Object::UserDetail::passWordConfirm)" value="<%=userpassword.toString()%>" />
<html:hidden property="answer(Object::EntityAdditional::EffectiveDate)" value="" styleId="EffectiveDate"/>




<html:hidden property="answer(isDuplicateAllowed)" value="NO"/>
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
<html:hidden property="answer(Object::UserDetail::roleName)" value="SALESMANAGER" />
<input type="hidden" id="IdEntityId" name="IdEntityId" value="<%=entityId.toString()%>"/>
<html:hidden property="answer(Object::Entity::EntityId)" value="<%=entityId.toString()%>" /> 
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>
