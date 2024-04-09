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

	<table>
		<tr>
			<td>
				<br>
				<br>
			</td>
		</tr>
	</table>
	<table width="92%" align="center" border="0">
		<tr height="20">
			<td class="FormLabels" border="0">
				As your group's representative you can make plan selections on behalf of your group and set up the application process for each of your group's employee (including yourself).
			</td>
		</tr>
		<tr height="40">
			<td border="0" class="FormLabels">
				At any point in the process please feel free to contact your COSE health insurance representative to answer any questions you may have.
			</td>
		</tr>
		<tr>
			<td border="0" class="FormLabels">
				As the group representative you have three important roles:
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td border="0">
				<table border="0">
					<tr>
						<td border="0" class="FormLabels">
							1. Complete your Employer Group Enrollment Application
						</td>
						<td width="20%" align="left" border="0">
							<%--<a href="javascript:void(0)" onclick="gotoEmployerApplPage();" title="Click to fill up Other Employer Group Information">Employer Application</a>--%>
							<a href="/GetCustomerFlashUI.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Agency::AgencyId)=<%=""+agencyIdTemp1%>&answer(Object::Customer::CustomerId)=<%=""+cId%>" title="Click to fill up Other Employer Group Information">Employer Application</a>
						</td>
					</tr>
				</table>			
			</td>
		</tr>
		<tr>
			<td>
				<table width="90%" align="center" border="0">
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td width="90%" rowspan="2" border="0"> 
						<p>	
							You can review any existing data and add any missing data. Each section of the application is a separate tab that you can click on to move forward in the process. When you have completed the application, don't forget to electronically sign the application and select submit. At any time in the process you can save or print your application.
						</p>	
						</td>
					</tr>		
				</table>	
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td border="0">
				<table border="0">
					<tr>
						<td width="73%" border="0" class="FormLabels">
							2. Employees
						</td>
						<td width="20%" align="left" border="0">
							<a href="../QuickAllEmployeeCencus.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&customerId=<%=cId.toString()%>&SearchObjectId=<%=cId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::EMailAddress)=<%=""+custEmail %>&answer(Object::Customer::State)=<%=custState.toString()%>"
							title="Click to go to Show All Employees/Add Employee" />Census and Tracking</a> 
						</td>
					</tr>					
				</table>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<table width="90%" align="center" border="0">
					<tr>
						<td width="80%" rowspan="2" border="0">
							<p>
								Identify who they are?<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You can add employees to your group census at any time in the application process.<br>
								To add an employee, enter their first and last name, gender, age or date of birth and their email address twice.
								Then select Add. <br><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You can edit employee records that have been previously entered by clicking on the edit button next to that employee.
								This takes you to the employee census detail page for that employee.
								It is here where you can also click on an email icon next to the employee's email address to generate a populated email to them with their user name and password.
								<br><br>
								Have employees completed their Application?<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;On your group census summary page you can see the completion status of each of your employees' applications. Use this information to follow up with your employees to help them complete their applications either online or by hand.							
								<br><br>
								Application can be saved or printed at any point.							
								<br><br>
							</p>
						</td>
					</tr>					
				</table>
			</td>
		</tr>		

		<tr>
			<td>
				<table>
					<tr>
						<td width="55%" class="FormLabels">
							3. Complete your Employee Application (if applicable)
						</td>
						<td width="20%">
						<%String employeeId=""; %>
						<dmshtml:GetEmployeeIdforCustIdMail nameInSession="empIdforCustId" customerId="<%=Long.parseLong(cId.toString())%>" customerEmailId="<%=""+custEmail%>" ownerId="<%=Long.parseLong(""+ownerId)%>" DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
						<logic:present name="empIdforCustId" scope="request">
						<bean:define id="employeeId1" name="empIdforCustId"/>								
							<dmshtml:dms_user_object_connector objectId="<%=""+employeeId1%>" objectType="<%="EMPLOYEE"%>" negated="true">								
								<a href="/GetEmployeeFlashUI.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Customer::CustomerId)=<%=""+cId%>&employeeId=<%=""+employeeId%>&answer(Object::Employee::EmployeeId)=<%=""+employeeId%>" title="Click to fill up Other Employee Health Information">Employee Health Application</a>
							</dmshtml:dms_user_object_connector> 
						</logic:present>
						</td>	
					</tr>
				</table>
			</td>
		</tr>
		<tr><td><br><br><br></td></tr>
		<tr>
			<td>
				
					<html:hidden property="answer(Object::Agency::AgencyId)" styleId="agencyID" value="<%=""+agencyIdTemp1%>" />
				
				<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
				<%if(!Customerid.toString().equals("")) {%>
					<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerID" value="<%=Customerid.toString()%>" />
				<%}%>
				<html:hidden property="TabPanelName" styleId="tabPanelNAME" value="<%=""+request.getParameter("TabPanelName") %>" />							
				<html:hidden property="answer(Object::Customer::EMailAddress)" styleId="customerEMail" value="<%=custEmail.toString()%>" />
				<html:hidden property="answer(Object::Employee::EmployeeId)" styleId="employeeID" value="<%=""+employeeId %>" />
				
			</td>
		</tr>
	</table>
</html:form>
