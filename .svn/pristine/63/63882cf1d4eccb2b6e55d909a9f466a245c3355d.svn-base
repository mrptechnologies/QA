<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT  type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
<script  type="text/javascript">
<!--
function validateFields(){
	var formElement=document.forms[0];

	if(formElement.elements[2].value=="")
	{
		alert("Please enter the General Agency / Agency Name.");
		return false;
	}
	
	if(formElement.elements[5].value=="")
	{
		alert("Please enter the Address.");
		return false;
	}

	if(formElement.elements[6].value=="")
	{
		alert("Please enter the City.");
		return false;
	}
	if(formElement.elements[7].value=="")
	{
		alert("Please select the State");
		return false;
	}
	if(formElement.elements[8].value=="")
	{
		alert("Please enter the Zip.");
		return false;
	}
	if((!formElement.elements[9].checked) && (!formElement.elements[9].checked))
	{
		alert("Please enter the country.");
		return false;
	}
	if(formElement.elements[11].value=="")
	{
		alert("Please enter your First Name.");
		return false;

	}
	if(formElement.elements[12].value=="")
	{
		alert("Please enter your Last Name.");
		return false;
	}
	if(formElement.contactEmail.value=="")
	{
		alert("Please enter your EMail.");
		return false;
	}
	formElement.userEmail.value = formElement.contactEmail.value;
	if(formElement.userName.value=="")
	{
		alert("Please enter your User Name.");
		return false;
	}
	if(formElement.password.value=="" && formElement.confirmPassword.value!="" )
	{
		alert("Please enter your Password.");
		return false;
	}
		if(formElement.confirmPassword.value=="")
	{
		alert("Please Confirm your  Password.");
		return false;
	}

	if((formElement.confirmPassword.value)!=(formElement.password.value))
	{
		alert("Password and Confirm Password Should Be Same");
		return false;
	}

	return checksubmitcount();


}
//-->
	</script>



<html:form action="/AddGeneralAgency"  onsubmit="return validateFields()">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<tr>
	
		<td>
			<table WIDTH="720px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr><td class="NewSectionHead" colspan="4" align="center">ADD GENERAL AGENCIES </td></tr>
			<tr>
				<td>&nbsp;</td>
			</tr>			
			<tr><td class="TextMatter"><bean:message key="GeneralAgency.Description"/></td></tr>
			<tr><td><hr size="1" noshade></td></tr>
			<logic:present name="message" scope="request">
			<tr>
					<td class="Error">
					<%=request.getAttribute("message")%>
					</td>
			</tr>
			</logic:present>
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
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr><td align="center">

					<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		

						<tr>
							<td class="FormLabels" align="right"><bean:message key="GeneralAgency.Agencyname" />*</td>
							<td class="TextMatter">&nbsp;<html:text property="answer(Object::Agency::BusinessName)" size="50" maxlength="50" styleClass="txtbox"/></td>
						</tr>

							<TR><td class="FormLabels" align="right">Sales Manager</td>
							<!-- -->
							<%
								com.dms.ejb.data.QuestionHashMap qMapALLENTITIES =   new com.dms.ejb.data.QuestionHashMap(10);				
								qMapALLENTITIES.put("ownerId", ownerId);
								qMapALLENTITIES.put("dbname", ""+com.dms.web.util.DbUtils.getReadDS(pageContext));
								qMapALLENTITIES.put("Object::Entity::EntityType", "REGIONAL_SALESMANAGER");			
							%>
							<dmshtml:execute_rules nameInSession="GETALLENTITIESBYTYPE"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"  formName="form::GETALLENTITIESBYTYPE"  answerMap="<%=qMapALLENTITIES%>"  processInstance="preprocess" />
							<logic:present name ='GETALLENTITIESBYTYPE' scope ='request'>
							<%
									if(qMapALLENTITIES.containsKey("ALLENTITIES_BYTYPE"))
									{
           									       java.util.ArrayList arrList=null;
              									    Object objList=qMapALLENTITIES.get("ALLENTITIES_BYTYPE");
                									   if((objList!=null) &&(objList instanceof java.util.ArrayList))
									{
							%>
							<td class="TextMatter" align="left" >&nbsp;
									<html:select property="answer(Object::Agency::LinkedEntityId)" >
										<html:option value ="">Select</html:option>
												<%
      							                arrList=(java.util.ArrayList)objList;
												   for (int i=0; i<arrList.size(); i++)  
														{ 
											   com.dms.ejb.data.QuestionHashMap arrEntitiesQMap=(com.dms.ejb.data.QuestionHashMap)arrList.get(i);
												%>
										<html:option value ='<%=arrEntitiesQMap.getString("ENTITY_ID")%>'>
											<%=arrEntitiesQMap.getString("ENTITY_LNAME") + " " + arrEntitiesQMap.getString("ENTITY_FNAME")%>
										</html:option>
										<%
													}
											%>							
									</html:select>
						</td>
					<%
							}
						}
				%>
				</logic:present>
<!-- -->
			</TR>
 			<tr>
				<td class="FormLabels" align="right">Agency Commission</td>
				<td class="TextMatter">&nbsp;<html:text property="answer(Object::AgencyAdditional::AgencyCommission)" size="6" maxlength="6" styleClass="txtbox"/></td>
			</tr>

			<tr>
				<td height="8px"></td>
			</tr>
			<tr>
					<td class="sectionhead" align="center" colspan="2"><bean:message key="GeneralAgency.businessaddress" /></td>
			</tr>
			<tr>
					<td height="8px"></td>
			</tr>
			<tr>
				<td class="FormLabels" align="right"><bean:message key="GeneralAgency.address" />*</td>
				<td class="TextMatter">&nbsp;<dmshtml:dms_textarea property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address1)" rows="3" cols="30"/></td>
			</tr>
			<tr>
				<td class="FormLabels" align="right"><bean:message key="GeneralAgency.city" />*</td>
				<td class="TextMatter">&nbsp;<html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::City)" size="30" maxlength="30" styleClass="txtbox" styleId="City"/></td>
			</tr>

			<tr>
				<td class="FormLabels" align="right"><bean:message key="GeneralAgency.state" />*</td>
				<td class="TextMatter">&nbsp;<dmshtml:get_type nameInSession="arStates" dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/><html:select property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::State)" styleId="State">
									<html:option value ="">Select</html:option>
       									 <logic:present name="arStates" scope="request">
          									 <logic:iterate id="details" name="arStates" scope="request" >
		  									  <bean:define id='test' name="details"  property="typeDesc" />
		    									<html:option value ='<%=test.toString()%>'>
		     								 		 <bean:write name="details" property="dmsType" />
		   									 </html:option>
											</logic:iterate>
											</logic:present>
									</html:select>
				</td>
		</tr>
		<tr>
			<td class="FormLabels" align="right"><bean:message key="GeneralAgency.zip" />*</td>
			<td class="TextMatter">&nbsp;<html:text name="AddGeneralAgency"  property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Zip)" size="20" maxlength="20" styleClass="txtbox" styleId="Zip"/>
		
				<!--Zipcode lookup start -->
				<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddGeneralAgency&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County." ></a>
			</td>
				<!--  end-->
                <!-- </td>-->
		</tr>
		<tr>
			<td class="FormLabels" align="right"><bean:message key="GeneralAgency.country" />*</td>
			<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="us" /><bean:message key="GeneralAgency.us"/>&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property ="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="canada" /><bean:message key="GeneralAgency.canada"/></td>
		</tr>
		<tr>
			<td height="8px"></td>
		</tr>
		<tr>
			<td class="sectionhead" align="center" colspan="2"><bean:message key="GeneralAgency.personalinfo" /></td>
		</tr>
		<tr>
				<td height="8px"></td>
		</tr>
		<tr>
				<td class="FormLabels" align="right"><bean:message key="GeneralAgency.firstname" />*</td>
				<td class="TextMatter">&nbsp;<html:text property="answer(Object::AgencyAdditional::firstname)" size="30" maxlength="30" styleClass="txtbox"/></td>
		</tr>
		<tr>
				<td class="FormLabels" align="right"><bean:message key="GeneralAgency.lastname" />*</td>
				<td class="TextMatter">&nbsp;<html:text property="answer(Object::AgencyAdditional::lastname)" size="30" maxlength="30" styleClass="txtbox"/></td>
		</tr>
		<tr>
				<td class="FormLabels" align="right"><bean:message key="GeneralAgency.middlename" /></td>
				<td class="TextMatter">&nbsp;<html:text property="answer(Object::AgencyAdditional::middlename)" size="5" maxlength="5" styleClass="txtbox"/></td>
		</tr>
		<tr>
			<td class="FormLabels" align="right"><bean:message key="GeneralAgency.jobtitle" /></td>
			<td class="TextMatter">&nbsp;<html:text property="answer(Object::AgencyAdditional::jobtitle)" size="50" maxlength="50" styleClass="txtbox"/></td>
		</tr>
		<tr>
			<td class="FormLabels" align="right"><bean:message key="GeneralAgency.jobfunction" /></td>
			<td class="TextMatter">&nbsp;<html:text property="answer(Object::AgencyAdditional::jobfunction)" size="50" maxlength="50" styleClass="txtbox"/></td>
		</tr>
		<tr>
			<td class="FormLabels" align="right"><bean:message key="GeneralAgency.phone" /></td>
			<td class="TextMatter">&nbsp;<html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::HomePhone)" size="30" maxlength="30" styleClass="txtbox"/></td>
		</tr>
		<tr>
				<td class="FormLabels" align="right"><bean:message key="GeneralAgency.fax" /></td>
				<td class="TextMatter">&nbsp;<html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::Fax)" size="30" maxlength="30" styleClass="txtbox"/></td>
		</tr>
		<tr>
				<td class="FormLabels" align="right"><bean:message key="GeneralAgency.email" />*</td>
				<td class="TextMatter">&nbsp;<html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::EMailAddress)" size="30" maxlength="30" styleClass="txtbox" styleId="contactEmail"/>
				<html:hidden property="answer(Object::UserDetail::email)" styleClass="txtbox" styleId="userEmail"/></td>
		</tr>
<!--tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.marketsegment" /></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::AgencyAdditional::marketsegment)" value="lessthan100" /> &nbsp;<bean:message key="GeneralAgency.lessthan100" />
		&nbsp;
		<dmshtml:dms_radio property="answer(Object::AgencyAdditional::marketsegment)" value="lessthan500" /> &nbsp;<bean:message key="GeneralAgency.lessthan500"/>
	&nbsp;
		<dmshtml:dms_radio property = "answer(Object::AgencyAdditional::marketsegment)" value="greaterthan500" />&nbsp;<bean:message key="GeneralAgency.greaterthan500"/>
		</td>
</tr-->
		<tr>
			<td height="8px"></td>
		</tr>

		<tr>
			<td height="8px"></td>
		</tr>
<!--tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.licencefor" /></td>
		<td class="links">&nbsp;<dmshtml:dms_checkbox property="answer(Object::AgencyAdditional::licenceforAH)" value="a&h">&nbsp;<bean:message key="GeneralAgency.a&h"/>
		</dmshtml:dms_checkbox>&nbsp;
		<dmshtml:dms_checkbox property = "answer(Object::AgencyAdditional::licenceforProperty)" value="property">&nbsp;<bean:message key="GeneralAgency.property"/>
		</dmshtml:dms_checkbox>&nbsp;
		<dmshtml:dms_checkbox property = "answer(Object::AgencyAdditional::licenceforCasuality)" value="casuality" >&nbsp;<bean:message key="GeneralAgency.casuality"/></dmshtml:dms_checkbox>&nbsp;
		<dmshtml:dms_checkbox property = "answer(Object::AgencyAdditional::licenceforSurety)" value="surety">&nbsp;<bean:message key="GeneralAgency.surety"/></dmshtml:dms_checkbox>&nbsp;
		<dmshtml:dms_checkbox property = "answer(Object::AgencyAdditional::licenceforOthers)" value="others">&nbsp;<bean:message key="GeneralAgency.others"/>
		</dmshtml:dms_checkbox>
		</td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.licencetype" /></td>
		<td class="FormLabels">&nbsp;<dmshtml:dms_radio property = "answer(Object::AgencyAdditional::licencetype)" value="resident" /><bean:message key="GeneralAgency.resident"/>&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::AgencyAdditional::licencetype)" value="nonresident" /><bean:message key="GeneralAgency.nonresident"/></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.statelicenced" /></td>
		<td>&nbsp;<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
<html:select property="answer(Object::AgencyAdditional::State)" >
		<html:option value ="">Select</html:option>
        <logic:present name="arStates" scope="session">
           <logic:iterate id="details" name="arStates" scope="session" >
		    <bean:define id='test' name="details"  property="typeDesc" />
		    <html:option value ='<%=test.toString()%>'>
		       <bean:write name="details" property="dmsType" />
		    </html:option>
		</logic:iterate>
		</logic:present>
		</html:select>
		</td>
</tr-->
<!--tr>
	<td height="8px"></td>
</tr-->
<tr>
		<td class="sectionhead" align="center" colspan="2"><bean:message key="GeneralAgency.remarks" /></td>
</tr>
<tr>
	<td height="8px"></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.comments" /></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_textarea property="answer(Object::AgencyAdditional::comments)" rows="3" cols="30"/></td>
</tr>
<tr>
	<td height="8px"></td>
</tr>
<tr>
		<td class="sectionhead" align="center" colspan="2"><bean:message key="GeneralAgency.useraccount" /></td>
</tr>
<tr>
	<td height="8px"></td>
</tr>

<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.username" />*</td>

		<bean:define id="UserName" name='AddGeneralAgency' property='answer(Object::UserDetail::userName)'/>
		<td class="TextMatter">&nbsp;<html:text property="answer(Object::UserDetail::userName)" size="15" maxlength="15" styleClass="txtbox" styleId="userName"/>
		</td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.password" />*</td>
		<td class="TextMatter">
			&nbsp;<input id="password" type="password" name="answer(Object::UserDetail::passWord)" maxlength="15" size="15" class="txtbox" autocomplete="off">
		</td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.confirmpassword" />*</td>
	<td class="TextMatter">
		&nbsp;<input id="confirmPassword" type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="15" size="15" class="txtbox" autocomplete="off">
	</td>
</tr>
</table>
</td></tr>	
</table></td></tr>
<tr>
		<td><hr size="1" noshade width="95%"></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr><td  align="center">
		<html:submit value="Save" styleClass="sbttn"  property="answer(submit)"/>
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn"/>
	</td></tr>
		<tr><td >&nbsp;</td></tr>
			<tr><td >&nbsp;</td></tr>
</table>
		
<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>
<html:hidden property="answer(Object::UserDetail::roleName)" value=""/>
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 

<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="" />
	<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="" />
	 <html:hidden property="page" value="6" />

<html:hidden property="answer(Object::Agency::SiteId)" value="1"  />
<html:hidden property="answer(Object::Agency::ObjectType)" value="agency"   />
		
 <html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Agency::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::UserDetail::User)" value="<%=userName.toString()%>" />
 <html:hidden  property="answer(rule_execution_staus)" value=""/>
    <html:hidden property="formName" value="Agency::AddAgency" />

    <html:hidden property="answer(form::ForwordControl)" value="success"/>


	<!-- Code to Prevent the back Button Issue-->
	
<bean:define id="GAgencyId" name="AddGeneralAgency" property="answer(Object::Agency::AgencyId)"/> 
<%if(! GAgencyId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=GAgencyId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::AgencyId)" value="-1"  />
<%}%>

<html:hidden property="answer(Object::Agency::ParentAgencyId)" value="-1"  />

<!-- Passing Agency Address ID -->
<bean:define id="AgencyPrimaryAddressId" name="AddGeneralAgency" property="answer(Object::Agency::PrimaryAddressId)"/> 

<%if(AgencyPrimaryAddressId==null) {%>
<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="0"  />
<%} else if(! AgencyPrimaryAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="<%=AgencyPrimaryAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="0"  />
<%}%>
<!-- Passing Agency BUSINESS Address ID -->
<bean:define id="AgencyBusinessAddressId" name="AddGeneralAgency" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)"/> 

<%if(AgencyBusinessAddressId==null) {%>
<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
<%} else if(! AgencyBusinessAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="<%=AgencyBusinessAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
<%}%>

<!-- Passing Agency HOME Address ID -->
<bean:define id="AgencyHomeAddressId" name="AddGeneralAgency" property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)"/> 

<%if(AgencyHomeAddressId==null) {%>
<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="0"  />
<%} else if(! AgencyHomeAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="<%=AgencyHomeAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="0"  />
<%}%>



<!-- Passing Primary Agency Contact ID -->
<bean:define id="AgencyPrimaryContactId" name="AddGeneralAgency" property="answer(Object::Agency::PrimaryContactId)"/> 

<%if(AgencyPrimaryContactId==null) {%>
<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="0"  />
<%} else if(! AgencyPrimaryContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="<%=AgencyPrimaryContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="0"  />
<%}%>

<!-- Passing BUSINESS Agency Contact ID -->
<bean:define id="AgencyBusSinessContactId" name="AddGeneralAgency" property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)"/> 

<%if(AgencyBusSinessContactId==null) {%>
<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
<%} else if(! AgencyBusSinessContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="<%=AgencyBusSinessContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
<%}%>
<!-- Passing HOME Agency Contact ID -->
<bean:define id="AgencyHomeContactId" name="AddGeneralAgency" property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)"/> 

<%if(AgencyHomeContactId==null) {%>
<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
<%} else if(! AgencyHomeContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="<%=AgencyHomeContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
<%}%>
<html:hidden property="answer(Object::Agency::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Agency::Active)" value="Y" />
<html:hidden property="answer(Object::Agency::Active)" value="" styleId="County"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Agency"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Agency Management"%>"/>
	<html:hidden property="answer(status)" value="Y" />
</html:form>


