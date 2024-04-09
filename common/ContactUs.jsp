<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
<title>MICA - Contact Us</title>
<meta name="Description" content="MICA Phone, FAX, Email and Mail details.">
<meta name="Keywords" content="municipal, insurance, company, america, health, life, dental, vision, group, mica, micacare, policy, policies, coverage, small, employer, preventative, restorative, care, orthodontic, services, benefits, claim, claims, forms, application, Illinois, Indiana">
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<style type="text/css">
  
a:hover{color:red}
a{text-decoration:none}
.mainmenu{font: 8pt Verdana,Arial;color: #36445e}
.folding{cursor:hand}

.menu_off{background:#cdcdcd;cursor:hand;font: 8pt Verdana,Arial;color: #000000; border-left: #cdcdcd 1px solid;border-top: #cdcdcd 1px solid;border-right: #cdcdcd 1px solid;border-bottom: #cdcdcd 1px solid }
.menu_on{background:#ffffff;cursor:hand;font: 8pt Verdana,Arial;color: #ff0000; border-left: #cccccc 1px solid;border-top: #cccccc 1px solid;border-right: #cccccc 1px solid;border-bottom: #cccccc 1px solid }
.menu_down{background:#999999;cursor:hand;font: 8pt Verdana,Arial;color: #ffffff;border-left: #cccccc 1px solid;border-top: #cccccc 1px solid;border-right: #cccccc 1px solid;border-bottom: #cccccc 1px solid }

.menu:hover{font-weight:normal;color:#ff0000;text-decoration:none} 

 
</style>
</head>
<body>


<html:form action="/logon">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
		<td colspan="3" align="left"><img src="../Images/mc-top1.jpg" WIDTH="780" HEIGHT="60" alt="MICACARE - A WORLD OF WELLNESS"></td>
	</tr>
	<tr>
		<td colspan="3" bgcolor="#40478d" height="2px"></td>
	</tr>
	<tr>
		<td width="200px" valign="top"  bgcolor="#f1f1f1">
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr><td colspan="2">&nbsp;</td></tr>
				<tr><td align="center" class="Error" colspan="2">
				<script type="text/javascript">
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
                  </script>
		
			</td>
		
			</tr>
		
					<tr>
				<td colspan="2" class="TextMatter"><bean:message key="logon.EnterUserPassword"/></td>
			</tr>
			<tr><td colspan="2"><hr size="1" noshade width="95%"></td></tr>
			<tr>
			<td width="50%" align="right" class="FormLabels"><bean:message key="logon.username"/></td>
			<td>&nbsp;<html:text property="answer(Object::UserDetail::userName)" size="12" maxlength="40" tabindex="1" styleClass="txtbox"/></td>
			</tr>
			<tr>
			<td width="50%" align="right" class="FormLabels"><bean:message key="logon.password"/></td>
			<td>&nbsp;<html:password property="answer(Object::UserDetail::passWord)" size="12" maxlength="40"  redisplay="false" styleClass="txtbox"/></td>
			</tr>
			<tr><td colspan="2"><hr size="1" noshade width="95%"></td></tr>
			<tr>
			<td colspan="2" align="center"><html:submit value="Log In" styleClass="sbttn" /></td>
	
	</tr>
	<tr><td colspan="2"><hr size="1" noshade width="95%"></td></tr>
		
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td align="center" class="links" colspan="2"><img SRC="../Images/rtg_rate.gif"  alt="Request An Appointment">&nbsp;<a href="./AppointmentAction.go"><bean:message key="logon.RequestAnAppointment"/></a></td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	

	<tr><td colspan="2">&nbsp;</td></tr>		
				<tr><td colspan="2" align="center"><img SRC="../Images/LeftImage3.jpg" WIDTH="160" HEIGHT="106" alt="Micacare"></td></tr>

</table>
</td>
<td width="1px" bgcolor="#40478d"></td>
	<td valign="top">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" style="height: 100%">
		<tr><td valign="top">
		<table WIDTH="100%" ALIGN="RIGHT" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td width="14%" align="center" class="menu_off" onmousedown="this.className='menu_down'; return true" onmouseover="this.className='menu_on';return true" onmouseout="this.className='menu_off';return true"><a href="./Home.go"><bean:message key="logon.Home"/></a></td>

		<td bgcolor="#cdcdcd" width="1px">|</td>

		<td width="14%" align="center" class="menu_off" onmousedown="this.className='menu_down'; return true" onmouseover="this.className='menu_on';return true" onmouseout="this.className='menu_off';return true"><a href="./AboutUs.go"><bean:message key="logon.AboutUs"/></a></td>

		<td bgcolor="#cdcdcd" width="1px">|</td>

		

		<td width="14%" align="center" class="menu_off" onmousedown="this.className='menu_down'; return true" onmouseover="this.className='menu_on';return true" onmouseout="this.className='menu_off';return true"><a href="./GroupHealth.go"><bean:message key="logon.GroupHealth"/></a></td>

		<td bgcolor="#cdcdcd" width="1px">|</td>

		<td width="14%" align="center" class="menu_off" onmousedown="this.className='menu_down'; return true" onmouseover="this.className='menu_on';return true" onmouseout="this.className='menu_off';return true"><a href="./GroupDental.go"><bean:message key="logon.GroupDental"/></a></td>

		<td bgcolor="#cdcdcd" width="1px">|</td>

		<td width="14%" align="center" class="menu_off" onmousedown="this.className='menu_down'; return true" onmouseover="this.className='menu_on';return true" onmouseout="this.className='menu_off';return true"><a href="./LifeInsurance.go"><bean:message key="logon.LifeInsurance"/></a></td>

		<td bgcolor="#cdcdcd" width="1px">|</td>

		<td width="14%" align="center" class="menu_off" onmousedown="this.className='menu_down'; return true" onmouseover="this.className='menu_on';return true" onmouseout="this.className='menu_off';return true"><a href="http://www.mymicacare.com" target="_new"><bean:message key="logon.MyBenefits"/></a></td>

		

		<td bgcolor="#cdcdcd" width="1px">|</td>

		<td width="14%" align="center" class="menu_off" onmousedown="this.className='menu_down'; return true" onmouseover="this.className='menu_on';return true" onmouseout="this.className='menu_off';return true"><a href="./ContactUs.go"><bean:message key="logon.ContactUs"/></a></td>

	</tr>
	<tr><td height="1px" bgcolor="#40478d" colspan="13"></td></tr>

</table>
		</td></tr>
	
	
<tr>
<td valign="top">
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="1" style="height: 500px">
	<tr>
		<td colspan="3">&nbsp;</td>
		
	</tr>
	<tr>
		<td colspan="3"><img src="../Images/Cus.jpg" alt="Contact Us"></td>
	</tr>
	<tr><td colspan="3"><hr size=1 noshade width="95%"/> </td></tr>
<tr>
<td width="70%" valign="top">
	<table WIDTH="95%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		
	<tr>
		<td >
		<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="4">
			
			<tr>
				<td width="5%"><img src="../Images/phone.jpg" alt="Phone"></td>
				<td class="FormLabels" width="20%" align="left">Phone</td>
				<td class="FormLabels" width="80%">&nbsp;(847)-364-5800</td>
			
			</tr>
			<tr><td colspan="3">&nbsp;</td></tr>
			<tr>
				<td width="5%"><img src="../Images/mail.jpg" alt="E-Mail"></td>
				<td class="FormLabels" align="left">E-Mail</td>
				<td class="FormLabels"><a href="mailto:info@micacare.com">&nbsp;info@micacare.com</a></td>
			
			</tr>
			<tr><td colspan="3">&nbsp;</td></tr>
			<tr>
					<td width="5%"><img src="../Images/smail.jpg" alt="Mail"></td>
					<td class="FormLabels" align="left">Mail</td>
					<td class="FormLabels">&nbsp;The Municipal Insurance Company of America<br>
					&nbsp;85 West Algonquin Road, Suite 300 <br>
					&nbsp;Arlington Heights, Illinois 60005</td>
			
			</tr>
			<tr><td colspan="3">&nbsp;</td></tr>
			<tr>
				<td width="5%"><img src="../Images/fax.jpg" alt="Fax"></td>
				<td class="FormLabels" align="left">FAX</td>
				<td class="FormLabels">&nbsp;(847)-364-5478</td>
			
			</tr>
		</table>
           
		</td>
		<td width="1px" bgcolor="#CCCCCC" height="95%"></td>
		<td width="30%" valign="middle">
		<table WIDTH="98%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="3">
			<tr><td align="right" ><img SRC="../Images/Support.jpg" alt="Contact Us"></td></tr>
	
		</table>
		</td>
	 </tr>
	</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td></tr>
	<tr>
		<td colspan="3" bgcolor="#40478d" height="2px"></td>
		
	</tr>
	<tr>
		<td colspan="3"><img src="../Images/Poweredby.gif" alt="Powered By Solartis"></td>
	</tr>
	
	<!--Add the new two links here-->

	<tr><td align="center" class="PageFooter" colspan="3"><a href="./LegalStatement.go"><bean:message key="logon.LegalStatement"/></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="./Privacy.go"><bean:message key="logon.PrivacyPractice"/></a>
	</td>
	</tr>
	<tr><td height="10px" colspan="3"></td></tr>

	<tr>
		<td colspan="3" align="center" class="PageFooter"><bean:message key="Appointment.Copyright"/></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
		
	</tr>
</table>
<html:hidden property="answer(Object::UserDetail::siteId)" value="<%=""+ownerId %>" /> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
 <html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
  <html:hidden property="formName" value="form::LoginMICACARE" />
<html:hidden property="answer(form::ForwordControl)" value="adminSuccess"/>


    <dmshtml:dms_static ruleName="role" property="GENERAL_AGENT" negated="true">

	 <html:hidden property="answer(form::ForwordControl)" value="gagentSuccess"/>
	 </dmshtml:dms_static>

	 <dmshtml:dms_static ruleName="role" property="GENERAL_EMPLOYEE" negated="true">

	 <html:hidden property="answer(form::ForwordControl)" value="gagentSuccess"/>
	 </dmshtml:dms_static>

    <dmshtml:dms_static ruleName="role" property="AGENT" negated="true">

	 <html:hidden property="answer(form::ForwordControl)" value="agentSuccess"/>
	 </dmshtml:dms_static>

<dmshtml:dms_static ruleName="role" property="AGENCY_ADMIN" negated="true">

	 <html:hidden property="answer(form::ForwordControl)" value="agentSuccess"/>
	 </dmshtml:dms_static>
	 <dmshtml:dms_static ruleName="role" property="AGENCY_EMPLOYEE" negated="true">

	 <html:hidden property="answer(form::ForwordControl)" value="agentSuccess"/>
	 </dmshtml:dms_static>
    <dmshtml:dms_static ruleName="role" property="GENERAL_ADMIN" negated="true">

	 <html:hidden property="answer(form::ForwordControl)" value="gagentSuccess"/>
	 </dmshtml:dms_static>

    <dmshtml:dms_static ruleName="role" property="UNDERWRITER" negated="true">

	 <html:hidden property="answer(form::ForwordControl)" value="underwriterSuccess"/>
	 </dmshtml:dms_static>
	 <html:hidden property="page" value="1" /> 
</html:form>
</body>
</html:html>
