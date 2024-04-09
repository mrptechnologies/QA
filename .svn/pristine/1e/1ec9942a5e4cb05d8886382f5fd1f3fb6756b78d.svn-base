<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<html:html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title><%=session.getAttribute("PageTitle")%></title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css"></head>
<body leftmargin="0" rightmargin="0" topmargin="0">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td width="200px" align="center" valign="center" height="60px"><img SRC="../Images/MICA-logo.gif" WIDTH="160" HEIGHT="60"></td>
		<td align="right"><img SRC="../Images/Welcome.jpg" WIDTH="400" HEIGHT="50"></td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="#40478d" height="2px"></td>
		
	</tr>
	<tr>
		<td width="200px" valign="top">
		<html:form action="/logon">
		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
		<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr><td align="center" class="formLabels" colspan="2">
		 <script language="JavaScript">
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
		
		</td></tr>
		
		<tr><td colspan="2"><hr size="1" noshade width="95%"></td></tr>
	<tr>
		<td colspan="2" class="TextMatter">Please enter your user name and password.</td>
		
	</tr>
	<tr><td colspan="2"><hr size="1" noshade width="95%"></td></tr>
	<tr>
		<td width="50%" align="right" class="FormLabels"><bean:message key="logon.username"/></td>
		<td>&nbsp;<html:text property="answer(Object::UserDetail::userName)" size="12" maxlength="15" tabindex="1"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="FormLabels"><bean:message key="logon.password"/></td>
		<td>&nbsp;<html:password property="answer(Object::UserDetail::passWord)" size="12" maxlength="15"  redisplay="false"/></td>
	</tr>
		<tr><td colspan="2"><hr size="1" noshade width="95%"></td></tr>
	<tr>
		<td colspan="2" align="center"><html:submit value="Log In" styleClass="sbttn" /></td>
	
	</tr>
	<tr><td colspan="2"><hr size="1" noshade width="95%"></td></tr>
		
			<tr><td colspan="2">&nbsp;<a href="../Default.jsp"><img SRC="../Images/Home.jpg" WIDTH="150" HEIGHT="70" border="0"></a></td></tr>
			<tr><td colspan="2">&nbsp;<img SRC="../Images/AboutUs.jpg" WIDTH="150" HEIGHT="70"></td></tr>
			<tr><td colspan="2">&nbsp;<img SRC="../Images/GD.jpg" WIDTH="150" HEIGHT="70"></td></tr>
			<tr><td colspan="2">&nbsp;<img SRC="../Images/ContactUs.jpg" WIDTH="150" HEIGHT="70"></td></tr>
				<tr><td colspan="2" align="center"><img SRC="../Images/Family-abstract.gif" WIDTH="152" HEIGHT="171"></td></tr>
</table>
<html:hidden property="answer(Object::UserDetail::siteId)" value="<%=""+ownerId %>" /> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 

	      <html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
 <html:hidden property="formName" value="form::LoginMICACARE" />
	 <html:hidden property="answer(form::ForwordControl)" value="adminSuccess"/>
	 <html:hidden property="page" value="<%=""+ownerId %>" />
</html:form>
		</td>
		<td valign="top">
		<html:form action="/AddAppointmentRequest" >
    
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>


<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2" bgcolor="#dfe8cf"  height="700px">
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td class="TextMatter"><b>
		<bean:message key="logon.AgentLogin"/></b>
		</td></tr>
		<tr>
		<td class="TextMatter">
		<bean:message key="logon.Description"/>
		</td></tr>
		<tr><td>
		<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
		<tr>
			<td width="40%" align="right" class="FormLabels">&nbsp;</td></tr>
	   	<tr>
		<td align="right" class="FormLabels">
		<bean:message key="logon.username"/>
		&nbsp;</td>
		<td >&nbsp;<html:text property="answer(Object::UserDetail::userName)" size="8" maxlength="10"/></td>
	</tr>
		<tr>
		<td align="right" class="FormLabels"><bean:message key="logon.password"/>
		&nbsp;</td>
		<td>&nbsp;<html:password property="answer(Object::UserDetail::passWord)" size="8" maxlength="15"/></td>
	</tr>
		<tr>
		<td align="right" class="FormLabels">
		<bean:message key="logon.ConfirmPassword"/>
		&nbsp;</td>
		<td>&nbsp;<html:password property="answer(Object::UserDetail::passWordConfirm)" size="8" maxlength="15"/></td>
	</tr>
     	
		
		
			 <tr>
		<td colspan="2"><hr size="1" noshade></td>
		</tr>
		
	  <tr>
		<td colspan="2" align="center"><html:submit value="Save" property ="submit" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Cancel" styleClass="sbttn"/></td>
		</tr>
			 <tr>
		<td colspan="2"><hr size="1" noshade></td>
		</tr>
		
		

</table>
</td></tr>
    </table>
     <html:hidden property="answer(Object::UserDetail::siteId)" value="<%=""+ownerId %>" /> 
	 <html:hidden property="answer(Object::UserDetail::roleName)" value="GUEST" /> 
	 <html:hidden property="page" value="6" />
	 <html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 

  </html:form>
		</td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="#40478d" height="2px"></td>
		
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
	<tr>
		<td colspan="2" align="center" class="links">|&nbsp;<bean:message key="Appointment.PrivacyPolicy"/>&nbsp;|&nbsp;<bean:message key="Appointment.TermsAndConditions"/>&nbsp;|</td>
		
	</tr>
	<tr>
		<td colspan="2" align="center" class="PageFooter"><bean:message key="Appointment.Copyright"/></td>
		
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
</table>


</body>
</html:html>
