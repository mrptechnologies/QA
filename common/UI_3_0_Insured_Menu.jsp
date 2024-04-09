<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

	<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
	<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
	<%String insType = (String)session.getAttribute("InsType"); %>


	<%
		String DomainName="";
		String PageTitle="";

		DomainName=(String)session.getAttribute("DomainName");
		PageTitle=(String)session.getAttribute("PageTitle");

		if(DomainName==null || DomainName.length()==0){
			DomainName=(""+request.getServerName());
			session.setAttribute("DomainName",DomainName);
		}

		String strDomainName="";
		strDomainName=""+request.getServerName();
	%>

<% /* adding insured menu items  */ %>
<div id="insuredMenu" class="anylinkcss">
	<ul>
		<%if(insType.equals("PC")) {%>

				<!-- Insured Management Menu building -->
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
					<li><a href="../AddInsured.do?clear=yes">Add Insured</a></li>
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_COM_INSURED_MENU"}%>' connector='or' negated="true">
					<li><a href="../AddInsuredCom.do?clear=yes&answer(Object::PageType)=ADD_INSURED">Add Insured</a></li>
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_LIU_INSURED_MENU"}%>' connector='or' negated="true">
					<li><a href="../AddLIUInsured.do?clear=yes&answer(Object::PageType)=ADD_INSURED">Add Insured</a></li>
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
					<li><a href="../FindInsured.do?clear=yes">Find Insured</a></li>
				</dmshtml:dms_static_with_connector>

		 <%}else if(insType.equals("Health")){%>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
					<li><a href="../AddCustomers.do?clear=yes">Add Employer Group</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_ADD_APPLICATION"}%>' connector='or' negated="true">
					<li><a href="../AddCustomersApplication.do?clear=yes">Add Employer Group</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
					<li><a href="../FindCustomers.do?clear=yes">Find Employer Group</a>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER"}%>' connector='or' negated="true">
					<li><a class="yuimenuitemlabel" href="../GetCustomerAction.do?TabPanelName=Insured_Panel">Employer Detail</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CENSUS"}%>' connector='or' negated="true">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER"}%>' connector='or' negated="false">
						<li><a class="yuimenuitemlabel" href="../GetEmployerHome.do?TabPanelName=Insured_Panel">Employee Detail</a></li>
				</dmshtml:dms_static_with_connector>
			</dmshtml:dms_static_with_connector>

		<%} else if(insType.equals("Professional Liability")) {%>
			<!-- Insured Management Menu building -->
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CUSTOMER_DETAILS"}%>' connector='or' negated="true">
					<li><a href="../GetInsuredAction.do?customerId=<%=strPrimObjId%>" >Insured Details</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
					<li><a href="../AddInsured.do?clear=yes">Add Insured</a></li>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
					<li><a href="../FindInsured.do?clear=yes">Find Insured</a></li>
			</dmshtml:dms_static_with_connector>
			<!-- static documents Menu building -->
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
				<li><a href="../documents/Documents.jsp?TabPanelName=Insured_Panel">Documents</a>
					<div id="insured_tab_staticdocuments" class="yuimenu">
						<div class="bd">
							<ul>
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
										<ul><li><a href="../documents/AdminForms.jsp?TabPanelName=Insured_Panel">Administrative Forms</a></li>
										<ul><li><a href="../documents/BenefitAndContact.jsp?TabPanelName=Insured_Panel">Benefit Summary & Contact Info</a></li>
									<%if(strDomainName.indexOf("mica")>=0)
									{%>
											<ul><li><a href="../documents/MicaCommissionDocuments.jsp?TabPanelName=Insured_Panel">Commission Documents</a></li>
									<%}%>
								</dmshtml:dms_static_with_connector>
							</ul>
						</div>
					</div>
				</li>
			</dmshtml:dms_static_with_connector>
		<%} %>
	</ul>
</div>

<%	/* Menu ENDS here */  %>

