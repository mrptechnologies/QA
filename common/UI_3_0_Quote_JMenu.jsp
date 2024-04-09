<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
<%String insType = (String)session.getAttribute("InsType"); %>
<%
String strDomainName="";
strDomainName=""+request.getServerName();
%>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUICK_QUOTE_DISABLED"}%>' connector='or' negated="true">
	<% if(insType.equals("Professional Liability")){%>
oCMenu.makeMenu('tabQuotes','','&nbsp;&nbsp;&nbsp;&nbsp;Enrollment','','','75','26','','')
	<%}else{ %>
oCMenu.makeMenu('tabQuotes','','&nbsp;&nbsp;&nbsp;&nbsp;Quotes','','','75','26','','')
	<%} %>
<% /* Quote Menu Begis here: adding Quote menu items  */ %>
		<%if(insType.equals("PC")) {%>
			<!-- Quote Menu building -->
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuNewQuote','tabQuotes','&nbsp;Create Quick Quote','../QuickquoteRiskAddAction.do?clear=yes','', 110,'25')
oCMenu.makeMenu('menuFindQuote','tabQuotes','&nbsp;Find Quote','../quote/FindQuoteUI3.jsp','', 110,'25')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUICK_QUOTE_DISABLED"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindQuote','tabQuotes','&nbsp;Find Quote','../quote/FindQuoteUI3.jsp','', 110,'25')
			</dmshtml:dms_static_with_connector>
		<%}else if(insType.equals("Health")){%>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindQuote','tabQuotes','&nbsp;Find Quote','../quote/FindQuoteUI3.jsp','', 110,'25')
			</dmshtml:dms_static_with_connector>
			<%}else if(insType.equals("Professional Liability")){%>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ENROLLMENT_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindQuote','tabQuotes','&nbsp;Existing','../quote/FindQuoteUI3.jsp','', 110,'25')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_SUB_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindQuote','tabQuotes','&nbsp;Find Quote','../quote/FindQuoteUI3.jsp','', 110,'25')
			</dmshtml:dms_static_with_connector>
		<%} %>
<%	/* Quote Menu ENDS here */  %>
</dmshtml:dms_static_with_connector>
