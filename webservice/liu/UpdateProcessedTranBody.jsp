<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<bean:define id="userName"
	property="answer(Object::UserDetail::userName)" name="LoginPage"
	scope="session" />
	
<html:form action="/UpdateProcessedTran.do" >
<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">UPDATE PROCESSED TRAN</td>
	</tr>
	<tr>
			<td class="FormLabels" align="left" colspan="4">&nbsp; <html:hidden
				property="TabPanelName"
				value="<%=""+request.getParameter("TabPanelName") %>" />
			
			<html:hidden
				property="answer(CreatedBy)"
				value="<%=userName.toString()%>" />
			<html:hidden
				property="answer(Active)"
				value="Y" />
			<html:hidden property="answer(dbName)" value ="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/></td>
		</tr>
		<tr>
			<td align="center"><html:submit value="Save"
				property="answer(button)" styleClass="sbttn"
				onmouseover="this.style.color='#FF0D25';"
				onmouseout="this.style.color='#0042B0';" /> &nbsp;&nbsp;&nbsp; <html:reset
				value="Reset" styleClass="sbttn"
				onmouseover="this.style.color='#FF0D25';"
				onmouseout="this.style.color='#0042B0';" /></td>
		</tr>
</table>
</html:form>
