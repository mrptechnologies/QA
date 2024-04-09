<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
<%String insType = (String)session.getAttribute("InsType"); %>



<%
String strDomainName="";
strDomainName=""+request.getServerName();
%>

<% /* Submission Menu Begins here: adding Submission menu items  */ %>
<div id="submissionMenu" class="anylinkcss">
	<ul>
		<%if(insType.equals("PC")) {%>

			<!-- Submission Management Menu building -->  <!-- submission home page add= AddSubmission.do -->
		<%-- 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU"}%>' connector='or' negated="true">
				<li><a href="../CheckClearanceAction.do?clear=yes">Create Submission</a></li>
			</dmshtml:dms_static_with_connector> --%>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU"}%>' connector='or' negated="true">
				<li><a href="../CreateSubmissionAction.do?TabPanelName=Submission_Panel&clear=yes">Create Submission</a></li>
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU"}%>' connector='or' negated="true">
				<li><a href="../FindSubmissionNBF.do?clear=yes">Find Submission</a></li>
			</dmshtml:dms_static_with_connector>

		 <%}else if(insType.equals("Health")){%>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
				<li><a href="../AddCustomers.do?clear=yes">Add Employer Group</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_ADD_APPLICATION"}%>' connector='or' negated="true">
					<li class="yuimenuitem"><a href="../AddCustomersApplication.do?clear=yes">Add Employer Group</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
				<li><a href="../FindCustomers.do?clear=yes">Find Employer Group</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER"}%>' connector='or' negated="true">
			 <li class="yuimenuitem"><a class="yuimenuitemlabel" href="../GetCustomerAction.do">Employer Detail</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CENSUS"}%>' connector='or' negated="true">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER"}%>' connector='or' negated="false">
					<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../GetEmployerHome.do">Employee Detail</a></li>
				 </dmshtml:dms_static_with_connector>
			</dmshtml:dms_static_with_connector>

		<%} else if(insType.equals("Professional Liability")) {%>

			<!-- Insured Management Menu building -->
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CUSTOMER_DETAILS"}%>' connector='or' negated="true">
			<li class="yuimenuitem"><a href="../GetInsuredAction.do?customerId=<%=strPrimObjId%>" >Insured Details</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
				<li><a href="../AddInsured.do?clear=yes">Add Insured</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
				<li><a href="../FindInsured.do?clear=yes">Find Insured</a></li>
			</dmshtml:dms_static_with_connector>

		<%} %>
	</ul>
</div>

<%	/* Submission Menu ENDS here */  %>
