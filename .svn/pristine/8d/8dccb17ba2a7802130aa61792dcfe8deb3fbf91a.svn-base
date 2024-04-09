<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>
			<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="links">
			<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" />
			<% String custid=""+request.getParameter("answer(Object::Customer::CustomerId)"); %>
			<a href="../customer/AddEmployerGroupExtendedApplication.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(teritory)=<%=""%>&Navigation=&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&tabNo=0&answer(Object::Customer::CustomerId)=<%=""+custid%>" title="Click to fill up Other Employer Group Information" />Enrollment Application2</a>
		</td>		
	</tr>
</table>
<body>
<dmshtml:DisplyApplication nameInSession="Application"   ownerId='<%="11"%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName="EMPLOYER" applicationType="EMPLOYER" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveEmployerGroupApplicationAction.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
</body>