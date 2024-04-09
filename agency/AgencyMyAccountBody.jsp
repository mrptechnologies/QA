<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></<td class="Error" COLSPAN="2"></SCRIPT>
<% 
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
%>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/prototype.js"></script>

<link rel="stylesheet" type="text/css"  id="container.css"  href="../Scripts/YUI/2.4.1/build/container/assets/container.css" />
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>

<html:form action="/UpdateAgencyInformation.do" name="ChangeUser" type ="com.dms.web.data.DataForm" scope="session" onsubmit="return ValidationFormLabelss();">
<div class="SubjectivityPage1">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>


<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td class="formhead"><h2 class="left">CHANGE PASSWORD</h2></td></tr>

	
	<tr><td class="details"><bean:message key="UserAccounts.ModDesc1"/></td></tr>
		<tr>
		<td><hr size="1" noshade></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<TR><TD class="Error"><ul>
	<html:errors/></ul></TD></TR>
	<tr>
			<td class="Error" COLSPAN="2">
			 
<bean:define id="ansmap" name="ChangeUser" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
		<logic:iterate id="element" name="ansmap">
			<bean:define id="errorListkey" name="element" property="key" />
			<logic:equal name="errorListkey" value="Object::error::list">
			<bean:define id="errorListvalue" name="element" property="value" />
			<logic:iterate id="errmsg" name="errorListvalue">
			<ul><li>
			<bean:write name="errmsg" property="errorMessage" />
			</li></ul>
		</logic:iterate>
	</logic:equal>
</logic:iterate> 
</td>
			</tr>

<tr><td align="left">
<bean:define id="objectType" name="ChangeUser"  property="answer(Object::UserDetail::PrimaryObjectType)" />
<bean:define id="primaryObjectId" name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectId)" />
	<bean:define id="primaryObjectType" name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectType)" />
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
	<tr>
		<td colspan="2" align="center" ><h3 class="left">User Information</h3></td>
	
	</tr>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<%if((""+objectType).equals("CUSTOMER")){ %>
	<tr>
		<td class="FormLabels" align="right" width="20%">Business Name</td>
		<td class="TextMatter">&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" size="30" maxlength="50"/>
		</td>	</tr>
	
	<%}else { %>
	<tr>
	<td class="FormLabels" align="right">Primary Role</td>
	
		<td>&nbsp;<bean:write  property="answer(Object::UserDetail::roleName)" name="ChangeUser" /></td>
	</tr>
	
	<tr>
	  <td class="FormLabels" align="right">Agency Name</td>
	  <td>&nbsp;<bean:write  property="answer(Object::Agency::BusinessName)" name="ChangeUser" /></td>
	</tr>
		
	<tr>
		<td class="FormLabels" align="right" width="20%"><bean:message key="Appointment.FirstName"/></td>
		<td class="TextMatter">&nbsp;<html:text styleClass="txtbox"  property="answer(Object::AgencyAdditional::firstname)" size="30" maxlength="50"/>
		</td>	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.LastName"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::AgencyAdditional::lastname)" size="30" maxlength="50"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.MiddleName"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::AgencyAdditional::middlename)" size="5" maxlength="5"/></td>
	</tr>
	<%} %>
	
		
		<tr><td>&nbsp;</td></tr>
		<!-- Business Address -->
				<tr>
					<td colspan="2" align="center"><h3 class="left">Address Information</h3></td>						
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.Address"/>1
					</td>
					<td>	
						&nbsp;<html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address1)"  styleId="Address1" size="30" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;Address 2
					</td>
					<td>
						&nbsp;<html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address2)" styleId="Address2" size="30" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.City"/>
					</td>
					<td>
						&nbsp;<dmshtml:dms_text styleClass="txtbox" styleId="City" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::City)" size="30" maxlength="30"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;State
					</td>
					<td>
					<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
					  &nbsp;<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
						<html:select property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::State)" styleClass="txtbox" styleId="State">
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
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;Country
					</td>
					<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="USA"  />USA&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="Canada" />
						Canada
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.Zip"/>
					</td>
					<td>
						&nbsp;<dmshtml:dms_text styleClass="txtbox" styleId="Zip"  property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Zip)" size="10" maxlength="10"/>
						<!--Zipcode lookup start -->
						<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=ChangeUser&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>

					</td>
						<!--  end-->		
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.PhoneNo"/>
					</td>
					<td>
						&nbsp;<dmshtml:dms_text styleClass="txtbox" styleId="BusinessPhoneNum"  property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::WorkPhone)" size="40" maxlength="40"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;Fax
					</td>
					<td>
						&nbsp;<dmshtml:dms_text styleClass="txtbox" styleId="BusinessFaxNum"  property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Fax)" size="40" maxlength="40"/>
					</td>
				</tr>
		<tr>
					<td>&nbsp;</td>
				</tr>
		
		<tr>
					<td colspan="2" align="center"><h3 class="left">BRANCH INFORMATION 	</h3>					
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">&nbsp;&nbsp;Branch Name</td>
					<td class="links" style="Class:txtbox">&nbsp;
					
						<html:select property="answer(Object::Agency::BranchName)" styleClass="txtbox" styleId="DocType">
							<html:option value ="Toronto">Toronto</html:option>
							<html:option value ="Calgary">Calgary</html:option>							
							<html:option value ="Puerto Rico">Puerto Rico</html:option>
							<html:option value ="Boston">Boston</html:option>
							<html:option value ="Miami">Miami</html:option>
							<html:option value ="New York">New York</html:option>
							<html:option value ="San Francisco">San Francisco</html:option>
							<html:option value ="Denver">Denver</html:option>																									
						</html:select>
					</td>
				</tr> 
		
	
		<tr><td>&nbsp;</td></tr>	
		 <tr> 
    <td></td>
       <td  align="left"   class="Links">&nbsp;&nbsp;<html:button value="Save Address Information" property="answer(SaveAddressInfo)" styleClass="buttonbig" onclick="SaveAddressInfo();"/></td>
   </tr>
   <tr><td>&nbsp;</td></tr>	 
   <tr>
		<td colspan="2" align="center"><h3 class="left">User EmailId</h3></td>
	
	</tr>	 
   <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.EMail"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::email)" size="30" maxlength="50" /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	 
	<tr>
		<td colspan="2" align="center"><h3 class="left">User Security Information</h3></td>
	
	</tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="ChangeUser"  property="answer(Object::UserDetail::userName)" /></td>
	</tr> 
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.OldPassword"/>*</td>
		<td>
			&nbsp;<input id="oldPassword" type="password" name="answer(Object::UserDetail::passWord)" maxlength="30" size="30" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.NewPassword"/>*</td>
		<td class="menulinks">
			&nbsp;<input id="newPassword" type="password" name="answer(Object::UserDetailAdditional::NewPassword)" maxlength="30" size="30" class="txtbox" autocomplete="off" value="">&nbsp;<bean:message key="UserAccounts.pwvalidation"/>
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.ConfirmNewPassword"/>*</td>
		<td>
			&nbsp;<input id="confirmPassword" type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="30" size="30" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Question"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintQuestion)" size="30" maxlength="50" styleId="hintQuestion"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Answer"/></td>
		<td>
			&nbsp;<input id="hintAnswer" type="password" name="answer(Object::UserDetail::hintAnswer)" maxlength="50" size="30" class="txtbox" autocomplete="off">
		</td>
	</tr>
	<tr>
					<td align="right" class="FormLabels">Title
					</td>
					<td >
						<html:text styleClass="txtbox"  property="answer(Object::Entity::Title)" size="40" maxlength="40"/>
					</td>
				</tr>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	

    <tr> 
    <td></td>
       <td  align="left"   class="Links">&nbsp;&nbsp;<html:submit value="Save User Information" styleClass="buttonbig" /></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   </table>
</table>
</div>
	
	
		
	

<html:hidden property="page" value="8" />
		
<html:hidden property="formName" value="MicaCare::ChangePassWord"/>
	<html:hidden name="ChangeUser" property="answer(entityId)" value='<%=request.getParameter("entityId")%>'/>
<html:hidden name="ChangeUser" property="answer(forwardNavigate)" value="failure"/>
<html:hidden name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectId)" value='<%=request.getParameter("entityId")%>'/>
<html:hidden name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectType)" value='<%=request.getParameter("objectType")%>'/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::County)" styleId="County"/>
<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<!--input type="hidden" name="entityId" value='<%=request.getParameter("entityId")%>'-->

</html:form>

<Script type="text/javascript">
function ValidationFormLabelss(){
	var oldPassword = document.getElementById("oldPassword").value;
	var newPassword = document.getElementById("newPassword").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	var hintQuestion = document.getElementById("hintQuestion").value;
	var hintAnswer = document.getElementById("hintAnswer").value;
	
	if(oldPassword != "" && newPassword != ""){
		if(newPassword.length > 6){
			if(oldPassword == newPassword){
				alert("New Password must not be the same as previous Password");
				return false;
			}
			if(newPassword != confirmPassword){
				alert("Password and Confirm password should be same.");
				return false;
			}
		}else{
			alert("The Password should be at least 6 alphanumeric characters");
			return false;
		}	
	}else{
		alert("1. Old Password is required. \n2. New Password is required. \n3. Confirm Password is required.");
		return false;
	}	
	
	if(hintQuestion != ""){
		if(hintAnswer == ""){
			alert("Please Enter the Answer for the given Question.");
			document.getElementById("hintAnswer").style.background='#FFCC33';
			document.getElementById("hintAnswer").focus();
			return false;
		}
	}
	if(hintAnswer != ""){
		if(hintQuestion == ""){
			alert("Please Enter the Question for the given Answer.");
			document.getElementById("hintQuestion").style.background='#FFCC33';
			document.getElementById("hintQuestion").focus();
			return false;
		}
	}
}
 
   
  

 
function SaveAddressInfo(){
document.forms[0].action="/UpdateAgencyAddressInformation.do";
 document.forms[0].submit();
}
    

</Script>