<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.web.data.DataForm"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Online Appointment Application
</title>
<link rel="stylesheet" href="./styles/Styles.css" type="text/css">
<style type="text/css">
  
a:hover{color:red}
a{text-decoration:none}
.mainmenu{font: 8pt Verdana,Arial;color: #336699}
.folding{cursor:hand}

.menu_off{background:##336699;cursor:hand;font: 8pt Verdana,Arial;color: #000000; border-left: #e7efff 1px solid;border-top: #e7efff 1px solid;border-right: #e7efff 1px solid;border-bottom: #e7efff 1px solid }
.menu_on{background:#fff7bd;cursor:hand;font: 8pt Verdana,Arial;color: #ff0000; border-left: #cccccc 1px solid;border-top: #cccccc 1px solid;border-right: #cccccc 1px solid;border-bottom: #cccccc 1px solid }
.menu_down{background:#ffffff;cursor:hand;font: 8pt Verdana,Arial;color: #ff0000;border-left: #cccccc 1px solid;border-top: #cccccc 1px solid;border-right: #cccccc 1px solid;border-bottom: #cccccc 1px solid }

.menu:hover{font-weight:normal;color:#336699;text-decoration:none} 

 
</style>
<script type="text/javascript">
<!--
function validateFields(){
	var formElement=document.forms[1];
	if(formElement.elements[2].value=="")
	{
		alert("Please enter your First Name.");
		return false;
	}

	if(formElement.elements[4].value=="")
	{
		alert("Please enter your Last Name.");
		return false;
	}

	if((!formElement.elements[8].checked) && (!formElement.elements[9].checked))
	{
		alert("Please specify if you are a U.S Citizen.");
			return false;
	}

	if(formElement.elements[10].value=="")
	{
		alert("Please enter your Business Address.");
			return false;
	}

		if(formElement.elements[11].value=="")
	{
		alert("Please enter your Business City");
			return false;
	}

	if(formElement.elements[12].value=="")
	{
		alert("Please select Business State.");
			return false;
	}

	if(formElement.elements[13].value=="")
	{
		alert("Please enter your Business Zip.");
			return false;
	}

	if(formElement.elements[14].value=="")
	{
		alert("Please enter your Business Phone#.");
			return false;
	}

	if(formElement.elements[15].value=="")
	{
		alert("Please enter your Business E-Mail Address");
			return false;
	}

	if(!formElement.elements[16].checked)
	{
		if(formElement.elements[18].value=="")
		{
			alert("Please enter your Home City.");
				return false;
		}
		if(formElement.elements[19].value=="")
		{
			alert("Please select your Home State.");
				return false;
		}

	}

		if(formElement.elements[36].value==""){
		alert("In the states you want to be appointed in,please list the insurance companies that you are currently licensed with.");
			return false;
	}
	
	if((!formElement.elements[37].checked) && (!formElement.elements[38].checked)){
		alert("Please specify if you have non-resident licenses in other state(s)?.");
			return false;
	}

	/*if((!formElement.elements[37].checked) && (!formElement.elements[38].checked) && (!formElement.elements[39].checked))
	{
		msg=msg+ "Your Status should be selected. \n";
	}*/

	if((!formElement.elements[44].checked) && (!formElement.elements[45].checked))
	{
		alert("Please specify if you carry Errors & Omissions Insurance.");
			return false;
	}
	if((!formElement.elements[46].checked) && (!formElement.elements[47].checked))
	{
		alert("Please specify if you ever had an application for an insurance license declined by an insurance department.");
			return false;
	}
	if((!formElement.elements[48].checked) && (!formElement.elements[49].checked))
	{
		alert("Please specify if you ever had have an insurance license suspended or revoked by an insurance department or had a complaint issued against you by an insurance department?");
			return false;
	}
	if((!formElement.elements[50].checked) && (!formElement.elements[51].checked))
	{
		alert("Please specify if you ever been charged or convicted of felony.");
			return false;
	}
	if((!formElement.elements[52].checked) && (!formElement.elements[53].checked))
	{
		alert("Please specify if you have any outstanding judgments or liens (including state or federal tax liens) against you.");
			return false;
	}
	if((!formElement.elements[54].checked) && (!formElement.elements[55].checked))
	{
		alert("Please specify if an insurer, insured or other person claim any indebtedness of you as a result of any insurance transactions or business?.");
			return false;
	}

	else
	{
		return true;
	}

}

function setHomeAddress(){
	var formElement=document.forms[1];

	if(formElement.elements[16].checked)
	{
		formElement.elements[17].value=formElement.elements[10].value;
		formElement.elements[18].value=formElement.elements[11].value;
		formElement.elements[19].value=formElement.elements[12].value;
		formElement.elements[20].value=formElement.elements[13].value;
		formElement.elements[21].value=formElement.elements[14].value;
	}
}
//-->
</script>
</head>

<body >


<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td colspan="3" align="left"><img src="../Images/SC-Logo.gif" WIDTH="150" HEIGHT="50" alt="Solartis Insurance"></td>
		
	</tr>
	<tr>
		<td colspan="3" bgcolor="#336699" height="2px"></td>
		
	</tr>
	<tr>
		<td width="200px" valign="top" bgcolor="#336699">
		<html:form action="/logon">
		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

		<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td colspan="2">&nbsp;</td></tr>
		<tr><td align="center" class="WhiteMsg" colspan="2">
		 <script type="text/JavaScript">
<!--
var arrMonth, dtNow, dateStr;

arrMonth = new Array(12);

arrMonth[0] = "January";
arrMonth[1] = "February";
arrMonth[2] = "March";
arrMonth[3] = "April";
arrMonth[4] = "May";
arrMonth[5] = "June";
arrMonth[6] = "July";
arrMonth[7] = "August";
arrMonth[8] = "September";
arrMonth[9] = "October";
arrMonth[10] = "November";
arrMonth[11] = "December";

dtNow = new Date();

dateStr = arrMonth[dtNow.getMonth()] + " " + dtNow.getDate() + ","  + dtNow.getFullYear();

document.write(dateStr);
//-->
                  </script>
		
		</td>
		
		</tr>
		
		<tr><td colspan="2"><hr size="1" noshade width="95%"></td>
		
		</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr><td colspan="2" align="center"> <img SRC="../Images/ReAp.jpg" alt="Micacare" border="1" > </td></tr>
				<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr><td colspan="2"><hr size="1" noshade width="95%"></td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td align="center" class="links" colspan="2"><!--a href="http://www.aetna.com/sharedsvcs/Redirect?d=std&t=/exit_disclaimer/external_link.html&u=http://www.adobe.com/products/acrobat/readstep2.html" target="_new"--><a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_new"><img src="../Images/AdobeLogo.gif" alt="Get Adobe Reader" border="0"></a></td></tr>	
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>		
				
</table>
<html:hidden property="answer(Object::UserDetail::siteId)" value="<%=""+ownerId %>" /> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 

	      <html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
 <html:hidden property="formName" value="form::LoginMICACARE" />
	 <html:hidden property="answer(form::ForwordControl)" value="adminSuccess"/>
	 <html:hidden property="page" value="1" />
</html:form>
<td width="1px" bgcolor="#40478d"></td>

		
		<td valign="top">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" style="height:700px">
		<tr><td valign="top">
		<table WIDTH="100%" ALIGN="RIGHT" BORDER="0" CELLSPACING="0" CELLPADDING="0">

	<tr>
		<td width="14%" align="center" class="menu_off" onmousedown="this.className='menu_down'; return true" onmouseover="this.className='menu_on';return true" onmouseout="this.className='menu_off';return true"><a href="./Default.jsp">Home</a></td>

		<td bgcolor="#e7efff" width="1px">|</td>

		
	<tr><td height="1px" bgcolor="#40478d" colspan="13"></td></tr>

	<tr><td height="1px" bgcolor="#40478d" colspan="12"></td></tr>
</table>

		
		</td></tr>
		<tr>
		<td valign="top">
				<logic:present name="arrObjectDetail" scope="session">
			<bean:define id="actionid" value="/AddAppointment"  toScope="session"/>
			

			<dmshtml:dms_static ruleName="role" property="GUEST" negated="true">
            <%System.out.println("Inside role-guest");
			((DataForm)session.getAttribute("AddAllEntities")).clear();
			((DataForm)session.getAttribute("AddAllEntities")).setId(0);
			System.out.println("Cleared form");
			actionid="/AddAppointment";
			%>			
		    </dmshtml:dms_static>
			
			<dmshtml:dms_static ruleName="role" property="ADMIN" negated="true">
            <%
			actionid="/AddAppointmentRequest";
			%>			
			</dmshtml:dms_static>

<html:form action="<%=actionid.toString()%>">
        <!--  <%
		 if(session.getAttribute("org.apache.struts.taglib.html.TOKEN")==null)
		 {

		 %>
         <input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="">
		 <%
		 }%> -->
		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="3">
		<tr>
			<td colspan="2" height="10px"></td>
			
		</tr>
		<tr>
			<td colspan="2"><img src="../Images/AR.gif" alt="Online Appointment Application"></td>
		</tr>
		<tr><td colspan="2"><hr size=1 noshade width="100%"/> </td></tr>
		<tr>
		<td colspan="2" align="right" class="FormLabels"><img SRC="../Images/pdficon.gif"	alt="Print">&nbsp;&nbsp;<a href="../appointment/BlankForm.pdf" target="_new">Blank Appointment Application(if completing application by hand)</a></td>
		
	</tr>
		<tr><td class="TextMatter" colspan="2">Please respond as completely as you are able. You will need to at least answer the questions marked with an asterisk to submit the application. </td></tr>

		
		<tr>
			<td colspan="2" align="center"><hr size="1" noshade></td>
			
		</tr>
		<TR><TD COLSPAN="2" class="Error"><html:errors/>
		<%
		if (request.getAttribute("msgUserAlreadyExists")!=null){%>
		<bean:message key="Appointment.userExists"/>
		<%}%>
		</TD></TR>
	
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.PersonalInfo"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.FirstName"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" size="40" maxlength="40"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.MiddleInitial"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::middleName)" size="10" maxlength="10"/></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.LastName"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::LastName)" size="40" maxlength="40"/></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.DateOfBirth"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Dob)" size="11" maxlength="11"/>&nbsp;(MM/DD/YYYY)</td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Gender"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::Entity::Sex)" value="Male" /><bean:message key="Appointment.Male"/>&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::Entity::Sex)" value="Female" /><bean:message key="Appointment.Female"/></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AreYouAUSCitizen"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::AreYouAUSCitizen)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::AreYouAUSCitizen)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	<!--tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.SocialSecurityNo"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::GovtIdNum)" size="12" maxlength="10"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels">
		<bean:message key="Appointment.LegalCorporationName" /></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::LegalCorporationName)" size="30" maxlength="30"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.FederalTaxID"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::FederalTaxID)" size="30" maxlength="30"/></td>
	</tr>-->
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.BUSINESSADDRESS"/></td></tr>
	
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Address"/>*</td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address1)" rows="3" cols="30"/></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.City"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)" size="30" maxlength="30"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.State"/>*</td>
		<td class="links">&nbsp;<html:select property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::State)">
		<html:option value ="">Select</html:option>
		<html:option value="IL">ILLINOIS</html:option>
		<html:option value="IN">INDIANA</html:option>
		<html:option value="WI">WISCONSIN</html:option>
		<html:option value="OH">OHIO</html:option>
		<html:option value="ID">IDAHO</html:option>
		<html:option value="AL">ALABAMA</html:option>
		<html:option value="AK">ALASKA</html:option>
		<html:option value="AB">ALBERTA</html:option>
		<html:option value="AS">AMERICAN MOA</html:option>
		<html:option value="AZ">ARIZONA</html:option>
		<html:option value="AR">ARKANSAS</html:option>
		<html:option value="BC">BRITISH COLUMBIA</html:option>
		<html:option value="CA">CALIFORNIA</html:option>
		<html:option value="CO">COLORADO</html:option>
		<html:option value="CT">CONNECTICUT</html:option>
		<html:option value="DE">DELAWARE</html:option>
        <html:option value="DC">DISTRICT OF COLUMBIA</html:option>
	    <html:option value="FL">FLORIDA</html:option>
		<html:option value="00">FOREIGN STATE</html:option>
		<html:option value="GA">GEORGIA</html:option>
		<html:option value="GU">GUAM</html:option>
		<html:option value="HI">HAWAII</html:option>
		<html:option value="IA">IOWA</html:option>
		<html:option value="KS">KANSAS</html:option>
		<html:option value="KY">KENTUCKY</html:option>
		<html:option value="LA">LOUISIANA</html:option>
		<html:option value="ME">MAINE</html:option>
		<html:option value="MB">MANITOBA</html:option>
	    <html:option value="MH">MARSHALL ISLANDS</html:option>
	    <html:option value="MD">MARYLAND</html:option>
	    <html:option value="MA">MASSACHUSETTS</html:option>
	    <html:option value="MI">MICHIGAN</html:option>
	    <html:option value="MN">MINNESOTA</html:option>
		<html:option value="MS">MISSISSIPPI</html:option>
		<html:option value="MO">MISSOURI</html:option>
		<html:option value="MT">MONTANA</html:option>
		<html:option value="NE">NEBRASKA</html:option>
		<html:option value="NV">NEVADA</html:option>
        <html:option value="NB">NEW RUNSWICK</html:option>
	    <html:option value="NH">NEW HAMPSHIRE</html:option>
        <html:option value="NJ">NEW JERSEY</html:option>
        <html:option value="NM">NEW MEXICO</html:option>
        <html:option value="NY">NEW YORK</html:option>
		<html:option value="NF">NEWFOUNDLAND</html:option>
        <html:option value="NC">NORTH CAROLINA</html:option>
        <html:option value="ND">NORTH DAKOTA</html:option>
        <html:option value="MP">NORTHERN MARIANA ISL</html:option>
        <html:option value="NT">NORTHWEST TERRITORIES</html:option>
		<html:option value="NS">NOVA SCOTIA</html:option>
		<html:option value="OK">OKLAHOMA</html:option>
		<html:option value="ON">ONTARIO</html:option>
		<html:option value="OR">OREGON</html:option>
		<html:option value="PW">PALAU</html:option>
		<html:option value="PA">PENNSYLVANIA</html:option>
	    <html:option value="PE">PRINCE EDWARD ISLAND</html:option>
		<html:option value="PR">PUERTO RICO</html:option>
		<html:option value="QC">QUEBEC</html:option>
		<html:option value="RI">RHODE ISLAND</html:option>
		<html:option value="SK">SASKATCHEWAN</html:option>
		<html:option value="SC">SOUTH CAROLINA</html:option>
		<html:option value="SD">SOUTH DAKOTA</html:option>
		<html:option value="TN">TENNESSEE</html:option>
		<html:option value="TX">TEXAS</html:option>
		<html:option value="TT">TRUST TERRITORIES</html:option>
		<html:option value="UT">UTAH</html:option>
		<html:option value="VT">VERMONT</html:option>
		<html:option value="VI">VIRGIN ISLANDS</html:option>
		<html:option value="VA">VIRGINIA</html:option>
		<html:option value="WA">WASHINGTON</html:option>
		<html:option value="WV">WEST VIRGINIA</html:option>
		<html:option value="WY">WYOMING</html:option>
		<html:option value="YT">YUKON TERRITORIES</html:option>
		</html:select>
		</td>

	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Zip"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Zip)" size="10" maxlength="10"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.PhoneNo"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)" size="40" maxlength="40"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.EMailAddress"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" size="50" maxlength="50"/></td>
	</tr>
	
	<!--tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Howlonghaveyoulived"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Howlonghaveyoulived)" size="5" maxlength="5"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Iflessthan5years" /></td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Iflessthan5years)" rows="3" cols="30"/></td>
	</tr-->
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.HOMEADDRESS"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.HomeAddressSame"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::HomeAddressSame)" value="Yes" onclick="setHomeAddress()"/></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Address"/></td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Address1)" rows="3" cols="30"/></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.City"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Addresses::HOME::Object::Address::City)" size="30" maxlength="30"/></td>
	</tr>
		<tr>
		<td class="FormLabels" align="right">State*</td>
		<td class="Links">&nbsp;
		<html:select property="answer(Object::Entity::Addresses::HOME::Object::Address::State)" >
	    <html:option value ="">Select</html:option>
		<html:option value="IL">ILLINOIS</html:option>
		<html:option value="IN">INDIANA</html:option>
		<html:option value="WI">WISCONSIN</html:option>
		<html:option value="OH">OHIO</html:option>
		<html:option value="ID">IDAHO</html:option>
		<html:option value="AL">ALABAMA</html:option>
		<html:option value="AK">ALASKA</html:option>
		<html:option value="AB">ALBERTA</html:option>
		<html:option value="AS">AMERICAN MOA</html:option>
		<html:option value="AZ">ARIZONA</html:option>
		<html:option value="AR">ARKANSAS</html:option>
		<html:option value="BC">BRITISH COLUMBIA</html:option>
		<html:option value="CA">CALIFORNIA</html:option>
		<html:option value="CO">COLORADO</html:option>
		<html:option value="CT">CONNECTICUT</html:option>
		<html:option value="DE">DELAWARE</html:option>
        <html:option value="DC">DISTRICT OF COLUMBIA</html:option>
	    <html:option value="FL">FLORIDA</html:option>
		<html:option value="00">FOREIGN STATE</html:option>
		<html:option value="GA">GEORGIA</html:option>
		<html:option value="GU">GUAM</html:option>
		<html:option value="HI">HAWAII</html:option>
		<html:option value="IA">IOWA</html:option>
		<html:option value="KS">KANSAS</html:option>
		<html:option value="KY">KENTUCKY</html:option>
		<html:option value="LA">LOUISIANA</html:option>
		<html:option value="ME">MAINE</html:option>
		<html:option value="MB">MANITOBA</html:option>
	    <html:option value="MH">MARSHALL ISLANDS</html:option>
	    <html:option value="MD">MARYLAND</html:option>
	    <html:option value="MA">MASSACHUSETTS</html:option>
	    <html:option value="MI">MICHIGAN</html:option>
	    <html:option value="MN">MINNESOTA</html:option>
		<html:option value="MS">MISSISSIPPI</html:option>
		<html:option value="MO">MISSOURI</html:option>
		<html:option value="MT">MONTANA</html:option>
		<html:option value="NE">NEBRASKA</html:option>
		<html:option value="NV">NEVADA</html:option>
        <html:option value="NB">NEW RUNSWICK</html:option>
	    <html:option value="NH">NEW HAMPSHIRE</html:option>
        <html:option value="NJ">NEW JERSEY</html:option>
        <html:option value="NM">NEW MEXICO</html:option>
        <html:option value="NY">NEW YORK</html:option>
		<html:option value="NF">NEWFOUNDLAND</html:option>
        <html:option value="NC">NORTH CAROLINA</html:option>
        <html:option value="ND">NORTH DAKOTA</html:option>
        <html:option value="MP">NORTHERN MARIANA ISL</html:option>
        <html:option value="NT">NORTHWEST TERRITORIES</html:option>
		<html:option value="NS">NOVA SCOTIA</html:option>
		<html:option value="OK">OKLAHOMA</html:option>
		<html:option value="ON">ONTARIO</html:option>
		<html:option value="OR">OREGON</html:option>
		<html:option value="PW">PALAU</html:option>
		<html:option value="PA">PENNSYLVANIA</html:option>
	    <html:option value="PE">PRINCE EDWARD ISLAND</html:option>
		<html:option value="PR">PUERTO RICO</html:option>
		<html:option value="QC">QUEBEC</html:option>
		<html:option value="RI">RHODE ISLAND</html:option>
		<html:option value="SK">SASKATCHEWAN</html:option>
		<html:option value="SC">SOUTH CAROLINA</html:option>
		<html:option value="SD">SOUTH DAKOTA</html:option>
		<html:option value="TN">TENNESSEE</html:option>
		<html:option value="TX">TEXAS</html:option>
		<html:option value="TT">TRUST TERRITORIES</html:option>
		<html:option value="UT">UTAH</html:option>
		<html:option value="VT">VERMONT</html:option>
		<html:option value="VI">VIRGIN ISLANDS</html:option>
		<html:option value="VA">VIRGINIA</html:option>
		<html:option value="WA">WASHINGTON</html:option>
		<html:option value="WV">WEST VIRGINIA</html:option>
		<html:option value="WY">WYOMING</html:option>
		<html:option value="YT">YUKON TERRITORIES</html:option>
		</html:select>
		</td>

	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Zip"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Zip)" size="10" maxlength="10"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.PhoneNo" /></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Contacts::HOME::Object::Contact::HomePhone)" size="40" maxlength="40"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.EMailAddress"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Contacts::HOME::Object::Contact::EMailAddress)" size="50" maxlength="50"/></td>
	</tr>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.PROFESSIONALDESIGNATIONS"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.CLU"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CLU)" value="Yes" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.CPCU"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CPCU)" value="Yes" /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.MDRT"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::MDRT)" value="Yes" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.NQA"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::NQA)" value="Yes" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.NASD"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::NASD)" value="Yes" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Others"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Others)" size="30" maxlength="30"/></td>
	</tr>
	
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.LICENSE"/></td></tr>
	<tr>
		<td class="Formlabels" align="right"><bean:message key="Appointment.Lineofinsurance"/></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Life"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::Life)" value="Yes" /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AccidentOrHealth" /></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::AccidentOrHealth)" value="Yes" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Others"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Others1)" size="30" maxlength="50"/></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Selectthestates"/></td>
		<td class="TextMatter">&nbsp;<!--31--> 
		<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates1)" value="Illinois"/>&nbsp;Illinois&nbsp;
				<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates2)" value="Indiana"/>&nbsp;Indiana	&nbsp;
				<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates3)" value="Iowa"/>&nbsp;Iowa	&nbsp;
				<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates4)" value="Wisconsin"/>&nbsp;Wisconsin	</td>
	</tr> 
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Inthestates"/></td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Inthestates)" rows="5" cols="40"/></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Doyouhavenonresidentlicenses"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doyouhavenonresidentlicenses)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doyouhavenonresidentlicenses)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Ifsolistthestates"/></td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Ifsolistthestates)" rows="5" cols="40"/></td>
	</tr>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.OTHERDETAILS"/></td></tr>
	<tr>
		<td colspan="2" class="TextMatter"><bean:message key="Appointment.Ifyouareassigning"/></td>	</tr>


	<!-- <td>-->
	<!--tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AgencyAvailableName"/></td>
		
		<td>&nbsp;<html:select property="answer(Object::Agency::ParentAgencyId)" >
		<html:option value ="-1">Select Your Agency</html:option>
		</html:select>
		</td></tr>-->
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AgencyName"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::AgencyName)" size="30" maxlength="30"/></td>
	</tr>
	



	<!--tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.FederalTaxID"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::FederalTaxID1)" size="30" maxlength="30"/></td>
	</tr>
	
	
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Address"/></td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Address)" rows="3" cols="30"/>

</textarea></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.City"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::City)" size="30" maxlength="30"/></td>
	</tr>
		<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.State"/></td>
		<td class="Links">&nbsp; 
		<html:select property="answer(Object::EntityAdditional::State)" >
		<html:option value ="">Select</html:option>
        <logic:present name="arStates" scope="session">
           <logic:iterate id="details" name="arStates" scope="session" >
		    <bean:define id='test' name="details"  property="typeDesc" />
		    <html:option value ='<%=test.toString()%>'>
		    <bean:write name="details" property="dmsType" />
		    </html:option>
		</logic:iterate>
		</logic:present>
		</html:select></td>

	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Zip"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Zip)" size="15" maxlength="15"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.PhoneNo"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::PhoneNo)" size="15" maxlength="15"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.EMailAddress"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::EMailAddress)" size="30" maxlength="30"/></td>
	</tr-->
		
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Status"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::OwnerOrPartner)" value="Yes" /><bean:message key="Appointment.OwnerOrPartner"/></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels">&nbsp;</td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CorporateOfficier)" value="Yes" /><bean:message key="Appointment.CorporateOfficier"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels">&nbsp;</td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::Representative)" value="Yes" /><bean:message key="Appointment.Representative"/></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.DoyoucarryErrors"/><br>
		<bean:message key="Appointment.MicaRequires"/></td><!--43-->
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::DoyoucarryErrors)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::DoyoucarryErrors)" value="No" /><bean:message key="Common.No"/></td>
	</tr>	
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Haveyoueverhadanapplication"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadanapplication)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadanapplication)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Haveyoueverhadhaveaninsurancesuspended"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadhaveaninsurancesuspended)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadhaveaninsurancesuspended)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Havechargedorconvicted"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Havechargedorconvicted)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Havechargedorconvicted)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Arethereanyoutstandingjudgments"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Arethereanyoutstandingjudgments)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Arethereanyoutstandingjudgments)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels">
		<bean:message key="Appointment.Doesaninsurerinsured"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doesaninsurerinsured)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doesaninsurerinsured)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	<tr>
		<td colspan="2" class="Formlabels"><bean:message key="Appointment.PleasenotethatYes"/></td>
		
	</tr>
	<tr>
		<td colspan="2" align="center"><dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::PleasenotethatYes)" rows="3" cols="80"/></td>
		
	</tr>
	<tr>
		<td colspan="2"><hr size="1" noshade width="95%"></td>
		
	</tr>
	<!--tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.USERACCOUNT"/></td></tr>
	<tr>
		<tr>
		<td align="right" class="FormLabels">
		<bean:message key="logon.username"/>
		&nbsp;</td>
		<td >&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::UserDetail::userName)" size="15" maxlength="15" styleClass="txtbox"/></td>
	</tr>
		<tr>
		<td align="right" class="FormLabels"><bean:message key="logon.password"/>
		&nbsp;</td>
		<td>&nbsp;<html:password property="answer(Object::UserDetail::passWord)" size="15" maxlength="15" styleClass="txtbox"/></td>
	</tr>
		<tr>
		<td align="right" class="FormLabels">
		<bean:message key="logon.ConfirmPassword"/>
		&nbsp;</td>
		<td>&nbsp;<html:password property="answer(Object::UserDetail::passWordConfirm)" size="15" maxlength="15" styleClass="txtbox"/></td>
	</tr-->

	<tr>
		<td colspan="2"><hr size="1" noshade width="95%"></td>
		
	</tr>
     	<dmshtml:dms_static ruleName="role" property="ADMIN" negated="true">
	<tr>
		<td align="right" class="FormLabels">
		<bean:message key="Appointments.status"/>
		&nbsp;</td>
		<td>&nbsp;<html:select property="answer(Object::EntityAdditional::Status)" >
		<html:option value="">Select A Status</html:option>
		<html:option value="Approved">Approved</html:option>
		<html:option value="Rejected">Rejected</html:option>
		</html:select></td>
	</tr>
	<tr>
		<td align="right" class="FormLabels">
		<bean:message key="Appointment.Comments"/>
		&nbsp;</td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Comments)" rows="3" cols="30"/></td>
	</tr>
	</dmshtml:dms_static>
	<tr>
		<td colspan="2" align="center">
		<html:submit value="Submit" styleClass="sbttn" onclick="return validateFields()"/>
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
</table>
<logic:notPresent name="arrObjectDetail" scope="session">
<html:hidden property="answer(Object::UserDetail::userName)" value="SysUser" />
</logic:notPresent>
<dmshtml:dms_static ruleName="role" property="ADMIN">
<html:hidden property="answer(Object::UserDetail::roleName)" value="GUEST" /> 
</dmshtml:dms_static>
<html:hidden property="answer(Object::Entity::Active)" value="Y" /> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
<html:hidden property="page" value="<%=""+ownerId %>" /> 
<html:hidden property="formName" value="MicacareEntity::AddAppointment" />
<html:hidden property="answer(freshAppointment)" value="yes" />
<html:hidden property="answer(ruleStatus)" value="success" />

<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::User)" value="SysUser" />
   <html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::User)" value="SysUser" />
   <html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::User)" value="SysUser" />
   </html:form>



				</logic:present>
		<logic:notPresent name="arrObjectDetail" scope="session">
			<html:form action="/AddAppointment">
			<%
		 if(session.getAttribute("org.apache.struts.taglib.html.TOKEN")==null)
		 {

		 %>
         <input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="">
		 <%
		 }%>
		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

		<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="3">
	<tr>
		<td colspan="2" height="10px"></td>
		
	</tr>
	<tr>
		<td colspan="2"><img src="../Images/AR.gif" alt="Online Appointment Applicaiton"></td>
	</tr>
	<tr><td colspan="2"><hr size=1 noshade width="100%"/> </td></tr>
	<tr>
		<td colspan="2" align="right" class="FormLabels"><img SRC="./Images/pdficon.gif"	alt="Print">&nbsp;&nbsp;<a href="./BlankForm.pdf" target="_new">Blank Appointment Application(if completing application by hand)</a></td>
		
	</tr>
	
	<tr><td class="TextMatter" colspan="2">Please respond as completely as you are able. You will need to at least answer the questions marked with an asterisk to submit the application. </td></tr>
	<tr>
		<td colspan="2" align="center"><hr size="1" noshade></td>
		
	</tr>
	
	<TR><TD COLSPAN="2" class="Error"><html:errors/>
	<%
		if (request.getAttribute("msgUserAlreadyExists")!=null){%>
		<bean:message key="Appointment.userExists"/>
		<%}%>
	
		</TD></TR>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.PersonalInfo"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.FirstName"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" size="40" maxlength="40"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.MiddleInitial"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::middleName)" size="10" maxlength="10"/></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.LastName"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::LastName)" size="40" maxlength="40"/></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.DateOfBirth"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Dob)" size="11" maxlength="11"/>&nbsp;(MM/DD/YYYY)</td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Gender"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::Entity::Sex)" value="Male" /><bean:message key="Appointment.Male"/>&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::Entity::Sex)" value="Female" /><bean:message key="Appointment.Female"/></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AreYouAUSCitizen"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::AreYouAUSCitizen)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::AreYouAUSCitizen)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	<!-- <tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.SocialSecurityNo"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::GovtIdNum)" size="12" maxlength="10"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels">
		<bean:message key="Appointment.LegalCorporationName" /></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::LegalCorporationName)" size="30" maxlength="30"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.FederalTaxID"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::FederalTaxID)" size="30" maxlength="30"/></td>
	</tr>-->
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.BUSINESSADDRESS"/></td></tr>
	
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Address"/>*</td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address1)" rows="3" cols="30"/></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.City"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)" size="30" maxlength="30"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.State"/>*</td>
		<td class="links">&nbsp;<html:select property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::State)">
		<html:option value ="">Select</html:option>
		<html:option value="IL">ILLINOIS</html:option>
		<html:option value="IN">INDIANA</html:option>
		<html:option value="WI">WISCONSIN</html:option>
		<html:option value="OH">OHIO</html:option>
		<html:option value="ID">IDAHO</html:option>
		<html:option value="AL">ALABAMA</html:option>
		<html:option value="AK">ALASKA</html:option>
		<html:option value="AB">ALBERTA</html:option>
		<html:option value="AS">AMERICAN MOA</html:option>
		<html:option value="AZ">ARIZONA</html:option>
		<html:option value="AR">ARKANSAS</html:option>
		<html:option value="BC">BRITISH COLUMBIA</html:option>
		<html:option value="CA">CALIFORNIA</html:option>
		<html:option value="CO">COLORADO</html:option>
		<html:option value="CT">CONNECTICUT</html:option>
		<html:option value="DE">DELAWARE</html:option>
        <html:option value="DC">DISTRICT OF COLUMBIA</html:option>
	    <html:option value="FL">FLORIDA</html:option>
		<html:option value="00">FOREIGN STATE</html:option>
		<html:option value="GA">GEORGIA</html:option>
		<html:option value="GU">GUAM</html:option>
		<html:option value="HI">HAWAII</html:option>
		<html:option value="IA">IOWA</html:option>
		<html:option value="KS">KANSAS</html:option>
		<html:option value="KY">KENTUCKY</html:option>
		<html:option value="LA">LOUISIANA</html:option>
		<html:option value="ME">MAINE</html:option>
		<html:option value="MB">MANITOBA</html:option>
	    <html:option value="MH">MARSHALL ISLANDS</html:option>
	    <html:option value="MD">MARYLAND</html:option>
	    <html:option value="MA">MASSACHUSETTS</html:option>
	    <html:option value="MI">MICHIGAN</html:option>
	    <html:option value="MN">MINNESOTA</html:option>
		<html:option value="MS">MISSISSIPPI</html:option>
		<html:option value="MO">MISSOURI</html:option>
		<html:option value="MT">MONTANA</html:option>
		<html:option value="NE">NEBRASKA</html:option>
		<html:option value="NV">NEVADA</html:option>
        <html:option value="NB">NEW RUNSWICK</html:option>
	    <html:option value="NH">NEW HAMPSHIRE</html:option>
        <html:option value="NJ">NEW JERSEY</html:option>
        <html:option value="NM">NEW MEXICO</html:option>
        <html:option value="NY">NEW YORK</html:option>
		<html:option value="NF">NEWFOUNDLAND</html:option>
        <html:option value="NC">NORTH CAROLINA</html:option>
        <html:option value="ND">NORTH DAKOTA</html:option>
        <html:option value="MP">NORTHERN MARIANA ISL</html:option>
        <html:option value="NT">NORTHWEST TERRITORIES</html:option>
		<html:option value="NS">NOVA SCOTIA</html:option>
		<html:option value="OK">OKLAHOMA</html:option>
		<html:option value="ON">ONTARIO</html:option>
		<html:option value="OR">OREGON</html:option>
		<html:option value="PW">PALAU</html:option>
		<html:option value="PA">PENNSYLVANIA</html:option>
	    <html:option value="PE">PRINCE EDWARD ISLAND</html:option>
		<html:option value="PR">PUERTO RICO</html:option>
		<html:option value="QC">QUEBEC</html:option>
		<html:option value="RI">RHODE ISLAND</html:option>
		<html:option value="SK">SASKATCHEWAN</html:option>
		<html:option value="SC">SOUTH CAROLINA</html:option>
		<html:option value="SD">SOUTH DAKOTA</html:option>
		<html:option value="TN">TENNESSEE</html:option>
		<html:option value="TX">TEXAS</html:option>
		<html:option value="TT">TRUST TERRITORIES</html:option>
		<html:option value="UT">UTAH</html:option>
		<html:option value="VT">VERMONT</html:option>
		<html:option value="VI">VIRGIN ISLANDS</html:option>
		<html:option value="VA">VIRGINIA</html:option>
		<html:option value="WA">WASHINGTON</html:option>
		<html:option value="WV">WEST VIRGINIA</html:option>
		<html:option value="WY">WYOMING</html:option>
		<html:option value="YT">YUKON TERRITORIES</html:option>
		</html:select>
		</td>

	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Zip"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Zip)" size="10" maxlength="10"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.PhoneNo"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)" size="40" maxlength="40"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.EMailAddress"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" size="50" maxlength="50"/></td>
	</tr>
	
	<!--tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Howlonghaveyoulived"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Howlonghaveyoulived)" size="5" maxlength="5"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Iflessthan5years" /></td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Iflessthan5years)" rows="3" cols="30"/></td>
	</tr-->
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.HOMEADDRESS"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.HomeAddressSame"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::HomeAddressSame)" value="Yes" onclick="setHomeAddress()"/></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Address"/></td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Address1)" rows="3" cols="30"/></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.City"/>*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Addresses::HOME::Object::Address::City)" size="30" maxlength="30"/></td>
	</tr>
		<tr>
		<td class="FormLabels" align="right">State*</td>
		<td class="TextMatter">&nbsp;
		<html:select property="answer(Object::Entity::Addresses::HOME::Object::Address::State)" >
	   <html:option value ="">Select</html:option>
		<html:option value="IL">ILLINOIS</html:option>
		<html:option value="IN">INDIANA</html:option>
		<html:option value="WI">WISCONSIN</html:option>
		<html:option value="OH">OHIO</html:option>
		<html:option value="ID">IDAHO</html:option>
		<html:option value="AL">ALABAMA</html:option>
		<html:option value="AK">ALASKA</html:option>
		<html:option value="AB">ALBERTA</html:option>
		<html:option value="AS">AMERICAN MOA</html:option>
		<html:option value="AZ">ARIZONA</html:option>
		<html:option value="AR">ARKANSAS</html:option>
		<html:option value="BC">BRITISH COLUMBIA</html:option>
		<html:option value="CA">CALIFORNIA</html:option>
		<html:option value="CO">COLORADO</html:option>
		<html:option value="CT">CONNECTICUT</html:option>
		<html:option value="DE">DELAWARE</html:option>
        <html:option value="DC">DISTRICT OF COLUMBIA</html:option>
	    <html:option value="FL">FLORIDA</html:option>
		<html:option value="00">FOREIGN STATE</html:option>
		<html:option value="GA">GEORGIA</html:option>
		<html:option value="GU">GUAM</html:option>
		<html:option value="HI">HAWAII</html:option>
		<html:option value="IA">IOWA</html:option>
		<html:option value="KS">KANSAS</html:option>
		<html:option value="KY">KENTUCKY</html:option>
		<html:option value="LA">LOUISIANA</html:option>
		<html:option value="ME">MAINE</html:option>
		<html:option value="MB">MANITOBA</html:option>
	    <html:option value="MH">MARSHALL ISLANDS</html:option>
	    <html:option value="MD">MARYLAND</html:option>
	    <html:option value="MA">MASSACHUSETTS</html:option>
	    <html:option value="MI">MICHIGAN</html:option>
	    <html:option value="MN">MINNESOTA</html:option>
		<html:option value="MS">MISSISSIPPI</html:option>
		<html:option value="MO">MISSOURI</html:option>
		<html:option value="MT">MONTANA</html:option>
		<html:option value="NE">NEBRASKA</html:option>
		<html:option value="NV">NEVADA</html:option>
        <html:option value="NB">NEW RUNSWICK</html:option>
	    <html:option value="NH">NEW HAMPSHIRE</html:option>
        <html:option value="NJ">NEW JERSEY</html:option>
        <html:option value="NM">NEW MEXICO</html:option>
        <html:option value="NY">NEW YORK</html:option>
		<html:option value="NF">NEWFOUNDLAND</html:option>
        <html:option value="NC">NORTH CAROLINA</html:option>
        <html:option value="ND">NORTH DAKOTA</html:option>
        <html:option value="MP">NORTHERN MARIANA ISL</html:option>
        <html:option value="NT">NORTHWEST TERRITORIES</html:option>
		<html:option value="NS">NOVA SCOTIA</html:option>
		<html:option value="OK">OKLAHOMA</html:option>
		<html:option value="ON">ONTARIO</html:option>
		<html:option value="OR">OREGON</html:option>
		<html:option value="PW">PALAU</html:option>
		<html:option value="PA">PENNSYLVANIA</html:option>
	    <html:option value="PE">PRINCE EDWARD ISLAND</html:option>
		<html:option value="PR">PUERTO RICO</html:option>
		<html:option value="QC">QUEBEC</html:option>
		<html:option value="RI">RHODE ISLAND</html:option>
		<html:option value="SK">SASKATCHEWAN</html:option>
		<html:option value="SC">SOUTH CAROLINA</html:option>
		<html:option value="SD">SOUTH DAKOTA</html:option>
		<html:option value="TN">TENNESSEE</html:option>
		<html:option value="TX">TEXAS</html:option>
		<html:option value="TT">TRUST TERRITORIES</html:option>
		<html:option value="UT">UTAH</html:option>
		<html:option value="VT">VERMONT</html:option>
		<html:option value="VI">VIRGIN ISLANDS</html:option>
		<html:option value="VA">VIRGINIA</html:option>
		<html:option value="WA">WASHINGTON</html:option>
		<html:option value="WV">WEST VIRGINIA</html:option>
		<html:option value="WY">WYOMING</html:option>
		<html:option value="YT">YUKON TERRITORIES</html:option>
		</html:select>
	
	</td>

	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Zip"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Zip)" size="10" maxlength="10"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.PhoneNo" /></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Contacts::HOME::Object::Contact::HomePhone)" size="40" maxlength="40"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.EMailAddress"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Contacts::HOME::Object::Contact::EMailAddress)" size="50" maxlength="50"/></td>
	</tr>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.PROFESSIONALDESIGNATIONS"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.CLU"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CLU)" value="Yes" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.CPCU"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CPCU)" value="Yes" /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.MDRT"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::MDRT)" value="Yes" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.NQA"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::NQA)" value="Yes" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.NASD"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::NASD)" value="Yes" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Others"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Others)" size="30" maxlength="30"/></td>
	</tr>
		<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.LICENSE"/></td></tr>
	<tr>
		<td class="Formlabels" align="right"><bean:message key="Appointment.Lineofinsurance"/></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Life"/></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::Life)" value="Yes" /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AccidentOrHealth" /></td>
		<td>&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::AccidentOrHealth)" value="Yes" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Others"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Others1)" size="30" maxlength="50"/></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Selectthestates"/></td>
		<td class="TextMatter">&nbsp; 
	<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates1)" value="Illinois"/>&nbsp;Illinois&nbsp;
				<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates2)" value="Indiana"/>&nbsp;Indiana	&nbsp;
				<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates3)" value="Iowa"/>&nbsp;Iowa	&nbsp;
				<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates4)" value="Wisconsin"/>&nbsp;Wisconsin
</td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Inthestates"/></td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Inthestates)" rows="5" cols="40"/></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Doyouhavenonresidentlicenses"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doyouhavenonresidentlicenses)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doyouhavenonresidentlicenses)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Ifsolistthestates"/></td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Ifsolistthestates)" rows="5" cols="40"/></td>
	</tr>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.OTHERDETAILS"/></td></tr>
	<tr>
		<td colspan="2" class="TextMatter"><bean:message key="Appointment.Ifyouareassigning"/></td>	</tr>


	
	<!--tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AgencyAvailableName"/></td>
		
		<td>&nbsp;<html:select property="answer(Object::Agency::ParentAgencyId)" >
		<html:option value ="-1">Select Your Agency</html:option>
		</html:select>
		</td></tr-->
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AgencyName"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::AgencyName)" size="30" maxlength="30"/></td>
	</tr>
	



	<!--tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.FederalTaxID"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::FederalTaxID1)" size="30" maxlength="30"/></td>
	</tr>
	
	
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Address"/></td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Address)" rows="3" cols="30"/>

</textarea></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.City"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::City)" size="30" maxlength="30"/></td>
	</tr>
		<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.State"/></td>
		<td class="TextMatter">&nbsp; 
		<html:select property="answer(Object::EntityAdditional::State)" >
		<html:option value ="">Select</html:option>
        <logic:present name="arStates" scope="session">
           <logic:iterate id="details" name="arStates" scope="session" >
		    <bean:define id='test' name="details"  property="typeDesc" />
		    <html:option value ='<%=test.toString()%>'>
		    <bean:write name="details" property="dmsType" />
		    </html:option>
		</logic:iterate>
		</logic:present>
		</html:select></td>

	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Zip"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Zip)" size="15" maxlength="15"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.PhoneNo"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::PhoneNo)" size="15" maxlength="15"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.EMailAddress"/></td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::EMailAddress)" size="30" maxlength="30"/></td>
	</tr-->
		
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Status"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::OwnerOrPartner)" value="Yes" /><bean:message key="Appointment.OwnerOrPartner"/></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels">&nbsp;</td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CorporateOfficier)" value="Yes" /><bean:message key="Appointment.CorporateOfficier"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels">&nbsp;</td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::Representative)" value="Yes" /><bean:message key="Appointment.Representative"/></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.DoyoucarryErrors"/><br>
		<bean:message key="Appointment.MicaRequires"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::DoyoucarryErrors)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::DoyoucarryErrors)" value="No" /><bean:message key="Common.No"/></td>
	</tr>	
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Haveyoueverhadanapplication"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadanapplication)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadanapplication)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Haveyoueverhadhaveaninsurancesuspended"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadhaveaninsurancesuspended)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadhaveaninsurancesuspended)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Havechargedorconvicted"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Havechargedorconvicted)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Havechargedorconvicted)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Arethereanyoutstandingjudgments"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Arethereanyoutstandingjudgments)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Arethereanyoutstandingjudgments)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels">
		<bean:message key="Appointment.Doesaninsurerinsured"/></td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doesaninsurerinsured)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doesaninsurerinsured)" value="No" /><bean:message key="Common.No"/></td>
	</tr>
	<tr>
		<td colspan="2" class="Formlabels"><bean:message key="Appointment.PleasenotethatYes"/></td>
		
	</tr>
	<tr>
		<td colspan="2" align="center"><dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::PleasenotethatYes)" rows="3" cols="80"/></td>
		
	</tr>
	<tr>
		<td colspan="2"><hr size="1" noshade width="95%"></td>
		
	</tr>
	<!--tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.USERACCOUNT"/></td></tr>
	<tr><td colspan="2" class="TextMatter"><bean:message key="UserAccounts.Desc"/></td></tr>
		<tr>
		<td align="right" class="FormLabels">
		<bean:message key="logon.username"/>
		&nbsp;</td>
		<td >&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::UserDetail::userName)" size="15" maxlength="15"/></td>
	</tr>
		<tr>
		<td align="right" class="FormLabels"><bean:message key="logon.password"/>
		&nbsp;</td>
		<td>&nbsp;<html:password styleClass="txtbox" property="answer(Object::UserDetail::passWord)" size="15" maxlength="15"/></td>
	</tr>
		<tr>
		<td align="right" class="FormLabels">
		<bean:message key="logon.ConfirmPassword"/>
		&nbsp;</td>
		<td>&nbsp;<html:password styleClass="txtbox"property="answer(Object::UserDetail::passWordConfirm)" size="15" maxlength="15"/></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr-->

	<tr>
		<td colspan="2"><hr size="1" noshade width="95%"></td>
		
	</tr>
     	<dmshtml:dms_static ruleName="role" property="ADMIN" negated="true">
	<tr>
		<td align="right" class="FormLabels">
		<bean:message key="Appointments.status"/>
		&nbsp;</td>
		<td>&nbsp;<html:select property="answer(Object::EntityAdditional::Status)" >
		<html:option value="">Select A Status</html:option>
		<html:option value="Approved">Approved</html:option>
		<html:option value="Rejected">Rejected</html:option>
		</html:select></td> 
	</tr>
	<tr>
		<td align="right" class="FormLabels">
		<bean:message key="Appointment.Comments"/>
		&nbsp;</td>
		<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Comments)" rows="3" cols="30"/></td>
	</tr>
	</dmshtml:dms_static>
	<tr>
		<td colspan="2" align="center">
		<html:submit value="Submit" styleClass="sbttn" onclick="return validateFields()"/>
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
</table>
<logic:notPresent name="arrObjectDetail" scope="session">
<html:hidden property="answer(Object::UserDetail::userName)" value="SysUser" />
<dmshtml:dms_static ruleName="role" property="ADMIN">
<html:hidden property="answer(Object::EntityAdditional::Status)" value="Pending" />
</dmshtml:dms_static>
<html:hidden property="page" value="2" /> 
</logic:notPresent>
<dmshtml:dms_static ruleName="role" property="ADMIN">
<html:hidden property="answer(Object::UserDetail::roleName)" value="GUEST" /> 
</dmshtml:dms_static>
<html:hidden property="answer(Object::Entity::Active)" value="Y" /> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<!-- This hidden field  is added for identifying the the fresh appointment request-->
<html:hidden property="answer(freshAppointment)" value="yes" />
<html:hidden property="answer(ruleStatus)" value="success" />
<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
<html:hidden property="formName" value="MicacareEntity::AddAppointment" />
<html:hidden property="answer(Object::Entity::EntityType)" value="AGENT" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::User)" value="SysUser" />
   <html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::User)" value="SysUser" />
   <html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::User)" value="SysUser" />
   </html:form>
		</logic:notPresent>
	
		</td>
	</tr>
</table>

		</td>
	</tr>
	<tr>
		<td colspan="3" bgcolor="#40478d" height="2px"></td>
		
	</tr>
	<tr>
		<td colspan="3"><img src="../Images/Poweredby.gif" alt="Powered By Solartis" WIDTH="100" HEIGHT="25"></td>
	</tr>
<tr>
		<td colspan="3" height="10px"></td>
		
	</tr>
	<tr><td align="center" class="PageFooter" colspan="3">Legal Statement&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Privacy Practice
	</td>
	</tr>
	<tr>
		<td colspan="3" height="10px"></td>
		
	</tr>
	<tr>
		<td colspan="3" align="center" class="PageFooter"><bean:message key="prompt.CopyRight"/></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
		
	</tr>

</table>


</body>
</html:html>
