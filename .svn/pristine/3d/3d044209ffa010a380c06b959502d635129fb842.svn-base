<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
<%String insType = (String)session.getAttribute("InsType"); %>


<%
String strDomainName="";
strDomainName=""+request.getServerName();
%>

<% /* Quote Menu Begis here: adding Quote menu items  */ %>
<div id="quotesMenu" class="anylinkcss">
	<ul>
		<%if(insType.equals("PC")) {%>
			<!-- Quote Menu building -->
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
				<li><a href="../QuickquoteRiskAddAction.do?clear=yes">Create Quick Quote</a> </li>
				<li><a href="../quote/FindQuote.jsp">Find Quote</a> </li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUICK_QUOTE_DISABLED"}%>' connector='or' negated="true">
				<li><a href="../quote/FindQuote.jsp">Find Quote</a> </li>
			</dmshtml:dms_static_with_connector>
		<%}else if(insType.equals("Health")){%>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
				<li><a href="../quote/FindQuote.jsp">Find Quote</a> </li>
			</dmshtml:dms_static_with_connector>
			<%}else if(insType.equals("Professional Liability")){%>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ENROLLMENT_MENU"}%>' connector='or' negated="true">
				<li><a href="../quote/FindQuote.jsp">Existing</a> </li>
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_SUB_MENU"}%>' connector='or' negated="true">
				<li><a href="../quote/FindQuote.jsp">Find Quote</a> </li>
			</dmshtml:dms_static_with_connector>
		<%} %>
	</ul>
</div>

<%	/* Quote Menu ENDS here */  %>
