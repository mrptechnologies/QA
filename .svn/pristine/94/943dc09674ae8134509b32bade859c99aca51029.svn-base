<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
<%String insType = (String)session.getAttribute("InsType"); %>


<%
String strDomainName="";
strDomainName=""+request.getServerName();
%>

<% /* Policy Menu Begins here: adding Policy menu items  */ %>
<div id="policyMenu" class="anylinkcss">
	<ul>

		<!-- Policy Menu building -->
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_MENU"}%>' connector='or' negated="true">
			<li><a href="/SearchPolicyDisplayAction.do">Find Policy</a></li>
		</dmshtml:dms_static_with_connector>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_CERTIFICATE_MENU"}%>' connector='or' negated="true">
			<li><a href="/SearchPolicyDisplayAction.do">Find Certificate</a></li>
		</dmshtml:dms_static_with_connector>
	</ul>
</div>

<%	/* Policy Menu ENDS here */  %>
