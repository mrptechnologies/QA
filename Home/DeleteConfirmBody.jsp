<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/EntitiesDeleteAction">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td >&nbsp;</td></tr>
		<tr><td class="MH">DELETE CONFIRMATION - APPOINTMENT REQUESTS</td></tr>
		<tr><td><hr size="1" noshade ></td></tr>
		
		<tr>
			<td valign="top">
				<table WIDTH="550px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr>
						<td align="left" class="TextMatter">Do you wish to delete the selected appointment requests?</td>
					</tr>
					<tr><td >&nbsp;</td></tr>
					<tr>
						<td align="center">
					  		<html:submit value="Yes" styleClass="sbttn"/>&nbsp;&nbsp;
							<html:reset value="Cancel" onclick="javascript:history.go(-1);" styleClass="sbttn"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
		
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
	<html:hidden property="answer(entityType)" value="AGENT" />
	<html:hidden property="answer(objectType)" value="ENTITY" />

</html:form>

