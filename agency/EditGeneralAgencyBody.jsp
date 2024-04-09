<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></SCRIPT>
<script type="text/javascript">
<!--
function validateFields(){
	var formElement=document.forms[0];

/*	for(i=0;i<formElement.elements.length;i++){
		alert("Element = "+ i + " " +formElement.elements[i].value);
	}

	var msg="";*/
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
	if((!formElement.elements[9].checked) && (!formElement.elements[10].checked))
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
	if(formElement.elements[18].value=="")
	{
		alert("Please enter your EMail.");
		return false;
	}
	
	if(formElement.userName!= null && formElement.userName.value==""){	
		alert("Please enter your User Name.");
		return false;
	}

	if(formElement.userName!= null && formElement.userName.value=="" && formElement.password.value!=""){
		alert("Please enter your Password.");
		return false;
	}
	if(formElement.userName!= null && (formElement.password.value)!=(formElement.confirmPassword.value)){
		alert("Password and Confirm Password Should Be Same");
		return false;
	}
	
	return checksubmitcount();


}
//-->
	</script>
	
<html:form action="/EditGeneralAgency" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="AgencyId1" name="AddGeneralAgency" property="answer(Object::Agency::AgencyId)"/> 
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

	<tr>
	
		<td valign="top" align="left" width="100%">
		<table WIDTH="580px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>				
			<td>&nbsp;</td>
		</tr>
		<tr><td class="NewSectionHead" align="center">ADD/EDIT GENERAL AGENCIES </td></tr>
		<tr><td>&nbsp;</td> </tr>
		<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>	
		
	</tr>
	
		<tr><td class="TextMatter"><bean:message key="GeneralAgency.Description"/></td>
		<tr><td><hr size="1" noshade></td></tr>
		<logic:present name="message" scope="request">
	<tr>
		<td class="Error">
		The information is added/edited successfully.
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
<table WIDTH="1000px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td width="80%">&nbsp;</td> <dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' 			
		connector='or' negated="true"><td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="../SearchActivityManagerAction2.do?TabPanelName=Quote_Panel&answer(Object::Activity::OwnerId)=<%=""+ownerId%>&answer(Object::Activity::CreatedBy)=<%=userId.toString()%>&answer(Object::Activity::PageNum)=0&answer(Object::Activity::ActivityType)=<%= "Agency Management" %>&answer(Object::Activity::ObjectType)=<%="Agency" %>&answer(Object::Activity::ObjectId)=<%=""+AgencyId1%>">Activity Log </a>
		</td>
		
	</dmshtml:dms_static_with_connector>
	</tr>
</table>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	

<bean:define id='GAgencyId1'  name="AddGeneralAgency" property="answer(Object::Agency::AgencyIdTemp)" />

	<tr>
		<td class="FormLabels" align="right">General Agency Id&nbsp;</td>
		<td class="TextMatter">&nbsp;<%=GAgencyId1%></td>
	</tr>

</dmshtml:dms_static_with_connector>



<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.Agencyname" />*</td>
		<td>&nbsp;<html:text property="answer(Object::Agency::BusinessName)" size="50" maxlength="50" styleClass="txtbox"/></td>
</tr>

<TR>
<td class="FormLabels" align="right">Sales Manager</td>
<!-- -->
<bean:define id="ansmap" name="AddGeneralAgency" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
<dmshtml:execute_rules nameInSession="GETOBJECTIDBYAGENCYID"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"  formName="form::GETOBJECTIDBYAGENCYID"  answerMap="<%=ansmap%>"  processInstance="preprocess" />
	<%
			com.dms.ejb.data.QuestionHashMap qMapALLENTITIES =   new com.dms.ejb.data.QuestionHashMap(10);				
			qMapALLENTITIES.put("ownerId",""+ownerId);
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
			<td class="SearchResult" align="left" >&nbsp;
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
		<td class="FormLabels">&nbsp;<html:text property="answer(Object::AgencyAdditional::AgencyCommission)" size="6" maxlength="6" styleClass="txtbox"/></td>
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
		<td>&nbsp;<dmshtml:dms_textarea property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address1)" rows="3" cols="30"/></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.city" />*</td>
		<td>&nbsp;<html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::City)" size="30" maxlength="30" styleClass="txtbox" styleId="City"/></td>
</tr>

<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.state" />*</td>
		<td>&nbsp;<dmshtml:get_type nameInSession="arStates" dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/><html:select property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::State)" styleId="State">
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
		<td>&nbsp;<html:text name="AddGeneralAgency"  property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Zip)" size="20" maxlength="20" styleClass="txtbox" styleId="Zip"/>
		
<!--Zipcode lookup start -->
<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddGeneralAgency&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County." ></a>
	</td>
<!--  end-->

</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.country" />*</td>
		<td class="FormLabels">&nbsp;<dmshtml:dms_radio property = "answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="us" /><bean:message key="GeneralAgency.us"/>&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property ="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="canada" /><bean:message key="GeneralAgency.canada"/></td>
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
		<td>&nbsp;<html:text property="answer(Object::AgencyAdditional::firstname)" size="30" maxlength="30" styleClass="txtbox"/></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.lastname" />*</td>
		<td>&nbsp;<html:text property="answer(Object::AgencyAdditional::lastname)" size="30" maxlength="30" styleClass="txtbox"/></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.middlename" /></td>
		<td>&nbsp;<html:text property="answer(Object::AgencyAdditional::middlename)" size="5" maxlength="5" styleClass="txtbox"/></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.jobtitle" /></td>
		<td>&nbsp;<html:text property="answer(Object::AgencyAdditional::jobtitle)" size="50" maxlength="50" styleClass="txtbox"/></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.jobfunction" /></td>
		<td>&nbsp;<html:text property="answer(Object::AgencyAdditional::jobfunction)" size="50" maxlength="50" styleClass="txtbox"/></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.phone" /></td>
		<td>&nbsp;<html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::HomePhone)" size="30" maxlength="30" styleClass="txtbox"/></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.fax" /></td>
		<td>&nbsp;<html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::Fax)" size="30" maxlength="30" styleClass="txtbox"/></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.email" />*</td>
		<td>&nbsp;<html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::EMailAddress)" size="30" maxlength="30" styleClass="txtbox"/></td>
</tr>

<tr>
	<td height="8px"></td>
</tr>

<tr>
	<td height="8px"></td>
</tr>

<tr>
		<td class="sectionhead" align="center" colspan="2"><bean:message key="GeneralAgency.remarks" /></td>
</tr>
<tr>
	<td height="8px"></td>
</tr>
<tr>
		<td class="FormLabels" align="right"><bean:message key="GeneralAgency.comments" /></td>
		<td>&nbsp;<dmshtml:dms_textarea property="answer(Object::AgencyAdditional::comments)" rows="3" cols="30"/></td>
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


	<bean:define id="UserName" name='AddGeneralAgency' property='answer(Object::UserDetail::userName)'/>
		<tr>
			<td class="FormLabels" align="right"><bean:message key="GeneralAgency.username" />* </td>
			<td class="FormLabels">
			<dmshtml:dms_is_string_empty ruleName="areStringsSame" property="<%=UserName.toString()%>">
				<bean:write  name='AddGeneralAgency' property='answer(Object::UserDetail::userName)' />
				<A HREF="../ChangePasswordForUsers.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&userId=<bean:write  name='AddGeneralAgency' property='answer(Object::UserDetail::userName)' />">
				<IMG SRC="../Images/GoButton.jpg" WIDTH="30" HEIGHT="16" BORDER="0" ALT=""></A>
			</dmshtml:dms_is_string_empty>
			<dmshtml:dms_is_string_empty ruleName="areStringsSame" property="<%=UserName.toString()%>" negated="true">
				&nbsp;<html:text styleId="userName" property="answer(Object::UserDetail::userName)" size="15" maxlength="15" styleClass="txtbox"/>
				<tr>
				<td class="FormLabels" align="right"><bean:message key="GeneralAgency.password" />*</td>
				<td>
					&nbsp;<input id="password" type="password" name="answer(Object::UserDetail::passWord)" maxlength="15" size="15" class="txtbox" autocomplete="off" value="">
				</td>
				</tr>
				<tr>
				<td class="FormLabels" align="right"><bean:message key="GeneralAgency.confirmpassword" />*</td>
				<td>
					&nbsp;<input id="confirmPassword" type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="15" size="15" class="txtbox" autocomplete="off" value="">
				</td>
				</tr>
			</dmshtml:dms_is_string_empty>
			</td>


		<td colspan="2"><hr size="1" noshade width="95%"></td>

	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 
		connector='or' negated="true">	
		<tr>
			<td class="FormLabels" align="right">Active&nbsp;</td>
			<td class="TextMatter">&nbsp;<html:select property="answer(Object::Agency::Active)" >
			<html:option value ="Y">Yes</html:option>
			<html:option value ='D'>No</html:option>
			</html:select></td>
		</tr>
	</dmshtml:dms_static_with_connector>

</table>
</td></tr>	
</table></td></tr>
<%Object readOnly1=request.getAttribute("ReadOnly"); 
String readOnly="No";
if(readOnly1!=null)
{
readOnly=(String)readOnly1;
}
%>
<tr><td>
	</td></tr>
	<tr><td >&nbsp;</td></tr>

	<%if(!(readOnly.equals("Yes"))) {%>
	<tr><td  align="center">

		<html:button value="Save" styleClass="sbttn" property="answer(submit)" onclick="return validateFields()"/>
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn"/>
	</td></tr>
	<%}%>
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
<%} %>
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
<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::County)" value="" styleId="County"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=""+ownerId%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=""+ownerId%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Agency"%>"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Agency Management"%>"/>
	<html:hidden property="answer(Object::Activity::ObjectId)" value="<%=""+GAgencyId%>"/>
	
 </html:form>
