<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/SaveEmpGroupAppl">

<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="CustomerStatus1" property="answer(Object::Customer::Status)" name="AddCustomer" />
<%String customerStatus=""+CustomerStatus1; 
boolean isEnabled=true;
if(!customerStatus.equalsIgnoreCase("")) {
isEnabled=false;
}
%>

<%String agencyIdTemp="";%>
<%String agencyIdtoLink="";%>

<%String strAgentFName="";%>
<%String strAgentLName="";%>
<%long lngAgentId1=0;%>
<%long lngAgencyTemp=0;%>
<%long agencyId2=0;%>
<%String agencyName2="";%>
<%long generalagencyid2=0;%>
<%String generalagencyname2="";%>

<%if (request.getParameter("agencyIdtoLink")!= null) {
agencyIdtoLink=request.getParameter("agencyIdtoLink");
agencyId2=Long.parseLong(agencyIdtoLink.toString());
}%>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />
<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
<html:hidden property="formName" value="form::LINKCUSTOMER" />
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="agencyIdTemp1" name="AddCustomer" property="answer(Agency::AgencyId)"/>
<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/> 
<bean:define id="custEmail" property="answer(Object::Customer::EMailAddress)" name="AddCustomer"/>	
<% long custId = Long.parseLong(""+cId); %>
<% long employeeId = 0; %>

	<p class="pagehead" style="margin:0;">COSE Enrollment Application</p>
	<p style="text-align:justify">As your group's representative, you can select plans on behalf of your group and set up the application process for each of your group's employees (including yourself).</p>
<p style="text-align:justify">At any point in the process please feel free to contact your COSE health insurance representative to answer any questions you may have.</p>
<p style="text-align:justify">As the group representative you have three important roles:</p>
<br>
<p style="text-align:justify"><img border="0" src="../Images/LandingPage_01.jpg" width="103" height="98" align="left"><b>
<a href="/GetCustomerFlashUI.do?answer(Object::Agency::AgencyId)=<%=""+agencyIdTemp1%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&showEmployerPDFLink=YES" title="Click to fill up Other Employer Group Information"> 
<%--<a href="../customer/AddEmployerAppl.jsp">--%>
Complete the Employer Group Enrollment Application for your company</a></b><br><br>
You can review any existing data and add any missing data. Complete each page and move forward through each step in the process. When you have completed the application, do not forget to electronically sign the application and select submit. At any time in the process you can save or print your application.</p>
<br>
<p style="text-align:justify"><img border="0" src="../Images/LandingPage_02.jpg" width="103" height="98" align="left"><b>
<a href="../QuickAllEmployeeCencus.do?customerId=<%=cId.toString()%>&SearchObjectId=<%=cId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::EMailAddress)=<%=""+custEmail %>&answer(Object::Customer::State)=<%=custState.toString()%>">Add your Employee(s)</a></b><br><br>
You can add an employee at any time in the application process using the group census. You can also edit employee records, email an employee their username and password, and even check the completion status of each of your employee's application.</p>
<br>
<p style="text-align:justify"><img border="0" src="../Images/LandingPage_03.jpg" width="103" height="98" align="left" style="margin:10px 0px 0px 0px"><b>
<logic:present name="userDetailObject" scope="session">
	<%
	 employeeId = ((com.dms.ejb.user.UserDetail) session.getAttribute("userDetailObject")).getObjectType("EMPLOYEE");
	%>
</logic:present>
<% if(employeeId > 0) {%>
<dmshtml:get_no_of_eligible_employees_under_a_customer nameInSession="NoOfEmployees" customerId="<%=custId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
		<logic:notEmpty name="NoOfEmployees">
				<dmshtml:dms_user_object_connector objectId="<%=""+employeeId%>" objectType="<%="EMPLOYEE"%>" negated="true">
									<%--<a href="javascript:void(0)" onclick="gotoEmployeeApplPage();" title="Click to fill up Other Employee Health Information">Employee Health Application</a>--%>
							<a href="/GetEmployeeFlashUI.do?answer(Object::Customer::CustomerId)=<%=cId.toString()%>&employeeId=<%=""+employeeId%>&answer(Object::Employee::EmployeeId)=<%=""+employeeId%>&showEmployeePDFLink=YES">Complete the Employee Application for yourself (if applicable)</a>
					</dmshtml:dms_user_object_connector>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CENSUS_APPLICATION"}%>' connector='or' negated="true">
									<%--<a href="javascript:void(0)" onclick="gotoEmployeeApplPage();" title="Click to fill up Other Employee Health Information">Employee Health Application</a> --%>
							<a href="/GetEmployeeFlashUI.do?answer(Object::Customer::CustomerId)=<%=cId.toString()%>&employeeId=<%=""+employeeId%>&answer(Object::Employee::EmployeeId)=<%=""+employeeId%>&showEmployeePDFLink=YES">Complete the Employee Application for yourself (if applicable)</a>
					</dmshtml:dms_static_with_connector>
		</logic:notEmpty></b>
		<% } else {%>

Complete the Employee Application for yourself (if applicable)</b><%} %><br><br>
If you have added yourself as an employee using the same email address, you can now complete your Employee Application. Complete each page and move forward through each step in the process. When you have completed the application, do not forget to electronically sign the application and select submit. At any time in the process you can save or print your application.
<br><br>
If a different email was used under the census information, you will receive an email with login instructions.</p>
<!-- <b>Note: The system does not generate new employee applications in real-time. Log out and log back in to generate new applications.</b>-->

</html:form>
