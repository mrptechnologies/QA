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

<title><%=session.getAttribute("PageTitle")%> - Factor Calculator</title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<%



String frmName=(String)request.getParameter("FormName");
%>
<SCRIPT LANGUAGE="JavaScript" SRC="../Scripts/JScripts/FactorCalculator.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--


function CloseWindow(){
top.opener.location.reload(true);
window.close();
}
function loadParent(){
//window.opener.location.href=url;
setTimeout( "window.close();", 1250 );
}


var searchFlag = 0;
//-->
</SCRIPT>
<html:form action="CalculateFactor"  styleId="FactorCalculate" onsubmit="return DoFactorCalculate(this)">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="CurrentTotalMonthlyPremium" name="FactorCalculator" property="answer(Object::Quote::CurrentTotalMonthlyPremium)" scope="request" />

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="1" CELLPADDING="1">
		<tr><td colspan="3" align="center">&nbsp;</td></tr>
		<tr><td colspan="3" align="center" class="sectionhead">Factor Calculate<BR></td></tr>
		<tr><td colspan="3" align="center">&nbsp;</td></tr>
		
			<td class="TableColorStyle1" align="left" >Current Total Medical Premium</td>
			<td class="TableColorStyle1" ><dmshtml:dms_text name="FactorCalculator"  property="answer(Object::FactorCalculate::CurrentTotalMedicalPremium)"  title="Current Total Medical Premium" styleId="ThisCurrentTotalMedicalPremium" size="14" maxlength="14" styleClass="txtbox"/></td>
		</tr>
		<tr>
		<td class="TableColorStyle1" align="left" height="25">Current UW Factor</td>
			<td class="TableColorStyle1" ><dmshtml:dms_text name="FactorCalculator"  property="answer(Object::FactorCalculate::CurrentUWFactor)"  title="Current UW Factor"  styleId="ThisCurrentUWFactor" size="14" maxlength="14" styleClass="txtbox"/></td>
		</tr>

		<tr>
			<td class="TableColorStyle1" align="left">Desired Percentage Change</td>
			<td class="TableColorStyle1" ><dmshtml:dms_text name="FactorCalculator"  property="answer(Object::FactorCalculate::DesiredPercentageChange)"  title="Current UW Factor"  styleId="ThisDesiredPercentageChange" size="14" maxlength="14" styleClass="txtbox" onblur="javascript:setDesiredTotalMedialPremiumValue(this);"/></td>
		</tr>

		<tr>
		<td class="TableColorStyle1" align="left" height="25">Desired Total Medial Premium</td>
			<td class="TableColorStyle1" ><dmshtml:dms_text name="FactorCalculator"  property="answer(Object::FactorCalculate::DesiredTotalMedialPremium)"  title="Please enter Desired Total Medial Premium"  styleId="ThisDesiredTotalMedialPremium" size="14" maxlength="14" styleClass="txtbox" onblur="javascript:setDesiredPercentageChangeValue(this);"/></td>
		</tr>
		

		<tr><td>&nbsp;</td></tr>

		<tr>
		<td class="TableColorStyle2" align="left" height="25">New Factor</td>
			<td class="TableColorStyle2" ><html:text readonly="true" name="FactorCalculator"  property="answer(Object::FactorCalculate::NewFactor)"  title="New Factor"  styleId="ThisNewFactor" size="14" maxlength="14" styleClass="txtboxWithBg"/></td>
		</tr>

		<tr><td colspan="3" align="center">&nbsp;</td></tr>


		<tr>
			<td colspan="1" align="left">
				<a href="javascript:window.close();"><img style="margin-right:20px;" src="../Images/button_close_window.gif" alt="Close Window" border="0" /></a>
			</td>

			<td align="right">
			<input type="submit" name="Calculate" value="Calculate" title="Please click button to Calculate" class="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
			</td>
		</tr>

		</table>
<html:hidden property="answer(Object::Quote::CurrentTotalMonthlyPremium)" styleId="ThisTotalMonthlyPremium" value="<%=CurrentTotalMonthlyPremium.toString()%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</html:form>
			
<script>
<!--
	if (searchFlag==0)
		submitToChild();
//-->
</script>
