<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="com.dms.common.ObjectDescriptor"%>

<table WIDTH="95%" ALIGN="center" border="0" cellspacing="1" cellpadding="1">
		<%
			boolean errorOccured=false;
		%>
		<bean:define id="errorListvalue" name="AddParentQuote" property="answer(Object::error::list)" />
		<bean:define id="ansmap" name="AddParentQuote" property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
		<tr>
			<td class="Error"><%=""+errorListvalue %>
				 <%	errorOccured = true; %>
			</td>
		</tr>					
		<% if(errorOccured)
			{
				((com.dms.ejb.data.QuestionHashMap)ansmap).remove("Object::error::list");
			}
		%>
		
</table>
<logic:present name="OPTIONS_HTML" scope="request">
<bean:define id="htmlPage" name="OPTIONS_HTML"	type="java.lang.StringBuffer" />
<div id="OPTIONS_DIV">
<%out.println(htmlPage.toString());%>
</div>
</logic:present>
