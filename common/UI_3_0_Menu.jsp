<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

	<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
	<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
	<%String insType = (String)session.getAttribute("InsType"); %>
	<%String Target = (String) session.getAttribute("ToDoListURL");%>
	<%
		String tabName="";
		if ((String)request.getParameter("TabPanelName") != null){
			tabName=(String)request.getParameter("TabPanelName");
			request.setAttribute("TabPanelName",tabName);
			System.out.println("TabPanelName:"+tabName);
		}else{
			tabName=(String)request.getParameter("answer(TabPanelName)");
			request.setAttribute("TabPanelName",tabName);
			System.out.println("answer(TabPanelName):"+tabName);
		}
		if( tabName==null || tabName.length()==0 ) {
			System.out.println("*****NOT FOUND TabPanelName*************");
			tabName = "Home_Panel";
			request.setAttribute("TabPanelName",tabName);
		}
	%>

<div class="nav">
    <ul>
    	
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"HOME_MENU"}%>' connector='or' negated="true">
		<li><a href="/Home/UnderwriterHome.jsp">To do List</a></li>	
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU"}%>' connector='or' negated="true">
			<li><a class="anchorclass" rel="submissionMenu">Submissions</a></li>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
			<%if(insType.equals("PC")|| insType.equals("Professional Liability")) {%>
				<li><a class="anchorclass" rel="insuredMenu">Insured</a></li>
			<%}else if(insType.equals("Health")){%>
				<li><a class="anchorclass" rel="insuredMenu">Employer Group</a></li>
			<%} %>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
			<% if(insType.equals("Professional Liability")){%>
				<li><a class="anchorclass" rel="quotesMenu">Enrollment</a></li>
			<%}else{ %>
				<li><a class="anchorclass" rel="quotesMenu">Quotea</a></li>
			<%} %>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUICK_QUOTE_DISABLED"}%>' connector='or' negated="true">
			<% if(insType.equals("Professional Liability")){%>
				<li><a class="anchorclass" rel="quotesMenu">Enrollment</a></li>
			<%}else{ %>
				<li><a class="anchorclass" rel="quotesMenu">Quote</a></li>
			<%} %>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_MENU"}%>' connector='or' negated="true">
				<li><a class="anchorclass" rel="policyMenu">Policies</a></li>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CERTIFICATE_MENU"}%>' connector='or' negated="true">
				<li><a class="anchorclass" rel="policyMenu">Certificate</a></li>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MANAGE_MENU"}%>' connector='or' negated="true">
			<li><a class="anchorclass" rel="manageMenu">Manage</a></li>
		</dmshtml:dms_static_with_connector>
    </ul>
  
  
</div>

<jsp:include page="../common/UI_3_0_Quote_Menu.jsp" />
<jsp:include page="../common/UI_3_0_Insured_Menu.jsp" />
<jsp:include page="../common/UI_3_0_Policy_Menu.jsp" />
<jsp:include page="../common/UI_3_0_Submission_Menu.jsp" />
<jsp:include page="../common/UI_3_0_Manage_Menu.jsp" />

<%	/* Menu ENDS here */  %>
