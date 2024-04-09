<!--
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
-->
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddEmployee.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/Employee.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/SendEmail.js" type="text/javascript"> </SCRIPT>
<SCRIPT type="text/javascript">
<!--
function setCheckbox(){
	var formElement=document.forms[0];
	<%
		
		if(request.getParameter("AddNewEntity") != null && request.getParameter("AddNewEntity").equalsIgnoreCase("yes"))
		{
		Object obj = session.getAttribute("AddEntity");
		System.out.println("AddEntity-->"+obj);
		com.dms.web.data.DataForm AddEnt = (com.dms.web.data.DataForm)obj;
		com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap)AddEnt.getAnswerMap();
		qmap.put("Object::Employee::lifeSelected",""+1);
		qmap.put("Object::Employee::wdiSelected",""+1);
		qmap.put("Object::Employee::wdi","Y");
		
		}
		
	%>
		return true;
}
//-->
</SCRIPT>
<style>
	.field{float:left;width:700px;margin:6px 0 3px 42px;font-size:12px;text-align:left;font-weight:normal;}
</style>
<bean:parameter id="EmployeeId" name="answer(Object::Employee::employeeId)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="screenWidth" property="answer(screenWidth)" name="LoginPage" scope="session" />
<bean:define id="screenHeight" property="answer(screenHeight)" name="LoginPage" scope="session" />
<html:form action="/AddEmployee1.do" onsubmit="return validateEmployee();">
<bean:define id="EmployeeStatus1" property="answer(Object::Employee::ApplicationStatus)" name="AddEntity" />
<%String employeeStatus=""+EmployeeStatus1; 
boolean isEnabled=true;
if(!employeeStatus.equalsIgnoreCase("")) {
isEnabled=false;
}
%>
<%String  waiverStatus="";
	boolean isWaivEnabled=true;
%>
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<%--  <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		
		<tr>
			<td><jsp:include page="../common/CoseEmployerHeader.jsp" /></td>
		</tr>
		
		<tr>
			<td valign="top" align="left">
				
					<jsp:include page="../common/CoseEmployeeHeader.jsp">
						<jsp:param name="employeeId" value="<%=""+EmployeeId%>" />
						<jsp:param name="heading" value="<%="EMPLOYEE CENSUS DETAILS "%>" />
					</jsp:include>
				
		    </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	</table>--%> 	
						<%
						String custid="";
						if(request.getParameter("answer(Object::Customer::CustomerId)")!=null) { %>
							<bean:parameter id="custid1" name="answer(Object::Customer::CustomerId)" />
						<%
						custid=""+custid1;
						}else {
							custid=""+request.getAttribute("Object::Customer::CustomerId");
						} %>
						<%
						String agencyIdTemp="";
						if(request.getParameter("answer(Object::Agency::AgencyId)")!=null) {%>
							<bean:parameter id="agencyIdTemp1" name="answer(Object::Agency::AgencyId)" />							
						<%
						agencyIdTemp=agencyIdTemp1;
						} else { %>
						<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=custid.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
							<logic:present name="customerDetail1" scope="request">
							<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
							<%agencyIdTemp=customerDetailMap.getString("agencyid");%>
							</logic:present>		
						<%} %>
						<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
						 	<!-- 	<logic:present name='arrObjectDetail'>
							<logic:present name='AddEntity'>
								<logic:notEmpty name="AddEntity" property="answer(Object::Employee::employeeId)">
								<bean:define id="Emptid" name="AddEntity" property="answer(Object::Employee::employeeId)" />
								 &nbsp;&nbsp;
									<a href="../customer/AddEmployeeCencusApplication.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(teritory)=<%=""%>&Navigation=&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&tabNo=0&answer(Object::Customer::CustomerId)=<%=""+custid%>&answer(Object::Employee::EmployeeId)=<%=""+Emptid%>"><font color="white">Employee Application</font></a>
								 							
								
								<%--<a
									href="../AllDependents.do?Object::Dependent::EmployeeId=<%=Emptid.toString()%>&employeeId=<%=Emptid.toString()%>&answer(Object::Dependent::EmployeeId)=<%=Emptid.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::Name)=<bean:write name='AddEntity' property='answer(Object::Employee::fname)'/> <bean:write name='AddEntity' property='answer(Object::Employee::lname)'/>"
									title="Click to go to Show All Dependents/Add Dependent" />Dependent</a>--%>
								</logic:notEmpty>
							</logic:present>
						</logic:present>-->		
						
						<!-- Employee Application PDF Start -->
						
						<%-- <bean:define id="Empid" name="AddEntity" property="answer(Object::Employee::employeeId)" />
						
						<td class="links" width="25%">											
							<a href='../EmployeeApplListPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=EMPLOYEE&answer(applicationType)=EMPLOYEE&answer(applicationSubType)=<%=""%>&answer(state)=<%=""%>&answer(teritory)=<%=""%>&answer(CustomerBeanInvocation)=YES&answer(isPreview)=false&customerId=<%=custid.toString()%>&SearchObjectId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Employee::EmployeeId)=<%=""+Empid%>' target="_new">
							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Employee Application PDF</a>
						</td>	
										
						<!-- Employee Application PDF End -->	--%>
						<p class="pagehead">Employee Information </p>
						<p align="right"><dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CUSTOMER"}%>' connector='or' negated="true">
						<a href="../QuickAllEmployeeCencus.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&customerId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::Employee::PageNum)=0"
							title="Click to go to Show All Employees/Add Employee" />Census</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</dmshtml:dms_static_with_connector> 
							<logic:present name='AddEntity'>
								<logic:notEmpty name="AddEntity" property="answer(Object::Employee::employeeId)">
								<bean:define id="Emptid" name="AddEntity" property="answer(Object::Employee::employeeId)" />
							<dmshtml:get_no_of_eligible_employees_under_a_customer nameInSession="NoOfEmployees" customerId="<%=Long.parseLong(""+custid)%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' /> 
								<logic:notEmpty	name="NoOfEmployees">
									<dmshtml:dms_user_object_connector objectId="<%=""+Emptid%>"	objectType="<%="EMPLOYEE"%>" negated="true">
										<a href="/GetEmployeeFlashUI.do?answer(Object::Customer::CustomerId)=<%=""+custid%>&employeeId=<%=""+Emptid%>&answer(Object::Employee::EmployeeId)=<%=""+Emptid%>&showEmployeePDFLink=YES">Employee
										Health Application</a>
									</dmshtml:dms_user_object_connector>
							</logic:notEmpty>
							</logic:notEmpty>
							</logic:present> </p>
							<p>You can edit or update an employee's record. Change the spelling of a name or update an email address.
						 Please note that if an employee's 'employee application status or waiver status' is changed to 'E-submitted or Paper Submitted' the employee will no longer be able to access the electronic application.</p>				
						
			
		<%
			boolean errorOccured=false;
		%>
		<bean:define id="ansmap" name="AddEntity" property="answerMap"	type="com.dms.ejb.data.QuestionHashMap" />
		<div align="right" style="font-weight:bold">
		<logic:iterate id="element" name="ansmap">
			<bean:define id="errorListkey" name="element" property="key" />
			<logic:equal name="errorListkey" value="Object::error::list">
				<bean:define id="errorListvalue" name="element" property="value" />
				<logic:iterate id="errmsg" name="errorListvalue">
								<bean:write name="errmsg" property="errorMessage" />
								<%
					        		errorOccured	=true;				
								%>
				</logic:iterate>
			</logic:equal>
		</logic:iterate>
		</div>
		<%
			if(errorOccured)
			{
				((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
				((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.OBJECT_ERROR_LIST);
			}
		%>
		
				<bean:define id="Emptid1" name="AddEntity" property="answer(Object::Employee::employeeId)" />
				<bean:define id="emailId" name="AddEntity" property="answer(Object::Employee::emailAddress1)" />
				<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
				<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::emailId1)" value="<%=""+emailId%>" />		
						
								<!-- Added For Notes (Start) 				
								<div id="dialog1" style='display: none;'>
									<div class="hd">Enter Your Notes Here</div>
										<div class="bd">
  	    											 <h6>Notes Description:</h6>
											         <input type = text name="answer(Object::Notes::Description)" id="notesDesc" size="50" maxlength="54" />
													         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal View Only 
											        <input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/> 
													   <h6>Notes:</h6>
										  				<div id="text">
										  					 <textarea  name="answer(Object::Notes::Notes)" id="editor" rows="6" cols="80"> </textarea> 
										  				</div> 
														<html:button property="Save" value=" Save " styleClass="uibutton"  styleId="save" onmouseover="" />
														<html:button property="Cancel" value="Cancel" styleClass="uibutton" styleId="cancel" />
									</div>
								</div>
												
						 Added For Notes (End) -->	
						<br>
						<div class="field">
								Primary Contact E-mail
								<html:text name="AddEntity" property="answer(Object::Employee::emailAddress1)" styleId="emailId" style="width:200px;margin:0px 0px 0px 225px;"/>								
								
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CREATE_RISK_USER"}%>' connector='or' negated="true">
								<dmshtml:dms_user_object_connector objectId="<%=""+Emptid1%>" objectType="<%="EMPLOYEE"%>" negated="false">
								<a href="javaScript:void(0)"><IMG SRC="../Images/mail1.jpg" onclick="EmailPopup('../ComposeMail1.do?answer(Object::Notification::Email::ObjectId)=<%=""+Emptid1%>&answer(Object::Customer::CustomerName)=<bean:write name='AddEntity' property='answer(Object::Employee::fname)'/> <bean:write name='AddEntity' property='answer(Object::Employee::lname)'/>&answer(Object::Notification::UserDetail::ToEmail)=<%=""+emailId %>&answer(Object::Notification::UserDetail::Email)=<%=""+email%>&answer(Object::Notification::UserDetail::RoleName)=<%=""+roleName%>&answer(Object::Notification::Email::ObjectVerId)=<%="0"%>&answer(Object::Notification::Email::ObjectType)=EMPLOYEE&answer(Object::Notification::Email::NotificationType)=<%="EMAIL"%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(Object::Notification::Email::EmailPurpose)=COSE_INIVITATION_EMPLOYER','Email')" BORDER="0" align="top" id="emailIMG"></a>
									</dmshtml:dms_user_object_connector>
								</dmshtml:dms_static_with_connector>
						</div>
						<div class="field">
								<bean:message key="EmployeeDetails.FirstName" />
								<html:text name="AddEntity" property="answer(Object::Employee::fname)" style="width:200px;margin:0px 0px 0px 300px;"/>&nbsp;
							Prefix
								<html:text name="AddEntity" property="answer(Object::Employee::prefix)" style="width:60px;" />
						</div>
						<div class="field">Middle Initial 
								<html:text name="AddEntity" property="answer(Object::Employee::mname)" style="width:40px;margin:0px 0px 0px 287px;"/>
						</div>
						<div class="field">
								<bean:message key="EmployeeDetails.LastName" /> 
						<html:text name="AddEntity"
									property="answer(Object::Employee::lname)" style="width:200px;margin:0px 0px 0px 300px;" />&nbsp;
							Suffix
								<html:text name="AddEntity" property="answer(Object::Employee::suffix)" style="width:60px;"/>
						</div>
						<%-- 	<bean:define id="SSN" name="AddEntity"
							property="answer(Object::Employee::govtNumber)" />
						<%String ssNValue=SSN.toString();
								String xxx="";
							String xx="";
							String xxxx="";
							if(!ssNValue.equals("")&&(ssNValue.length()==9)){
							xxx=ssNValue.substring(0,3);
							xx=ssNValue.substring(3,5);
							xxxx=ssNValue.substring(5,9);
							}%>
					 	<div class="field">
							SSN 
							<html:text name="AddEntity"
								property="answer(SSN1)" styleId="ssn1" maxlength="3" style="width:40px;margin:0px 0px 0px 217px;"
								styleClass="txtbox" value="<%=xxx%>" 
								onkeyup="if(this.value.length==3) {document.forms[0].ssn2.focus()}" />XXX&nbsp;

							<html:text name="AddEntity" property="answer(SSN2)" maxlength="2"
								styleId="ssn2" value="<%=xx%>" style="width:30px;"
								onkeyup="if(this.value.length==2) {document.forms[0].ssn3.focus()}" />XX&nbsp;

							<html:text name="AddEntity" property="answer(SSN3)" maxlength="4"
								styleId="ssn3" style="width:50px;"
								value="<%=xxxx%>" />XXXX
						</div> --%>
						<bean:define id="Dob" name="AddEntity"
							property="answer(Object::Employee::dob)" />
						<%
							String strDate=Dob.toString();
							String yyyy="";
							String dd="";
							String mm="";
							if(!strDate.equals(""))
							{
					  		mm= strDate.substring(0,2);
							dd= strDate.substring(3,5);
							yyyy= strDate.substring(6,10);
							}
						%>
						<%if(errorOccured){%>

						<div class="field"><bean:message
								key="EmployeeDetails.DateOfBirth" />
							<html:text styleId="dobMonth"
								name="AddEntity" property="answer(Month)" size="2" maxlength="2"
								style="margin:0px 0px 0px 285px;" value=""
								onkeyup="if(this.value.length==2) {document.forms[0].dobDate.focus()}" />/mm&nbsp;

							<html:text styleId="dobDate" name="AddEntity"
								property="answer(Date)" size="2" maxlength="2"
								 value=""
								onkeyup="if(this.value.length==2) {document.forms[0].dobYear.focus()}" />/dd&nbsp;

							<html:text styleId="dobYear" name="AddEntity"
								property="answer(Year)" size="4" maxlength="4"
								 value="" />/yyyy
						</div>
						<%-- <div class="field">
							Age
							<dmshtml:dms_text styleId="age"
								name="AddEntity" property="answer(Object::Employee::Age)"
								size="3" maxlength="3" style="margin:0px 0px 0px 220px;" value="" />
						</div> --%>
						<%}else{%>
						<div class="field">
							<bean:message
								key="EmployeeDetails.DateOfBirth" />
							<html:text styleId="dobMonth"
								name="AddEntity" property="answer(Month)" size="2" maxlength="2"
								style="margin:0px 0px 0px 285px;" value="<%=mm%>"
								onkeyup="if(this.value.length==2) {document.forms[0].dobDate.focus()}" />/mm&nbsp;

							<html:text styleId="dobDate" name="AddEntity"
								property="answer(Date)" size="2" maxlength="2"
								 value="<%=dd%>"
								onkeyup="if(this.value.length==2) {document.forms[0].dobYear.focus()}" />/dd&nbsp;

							<html:text styleId="dobYear" name="AddEntity"
								property="answer(Year)" size="4" maxlength="4"
								 value="<%=yyyy%>" />/yyyy
						</div>
						<%-- <div class="field">
							Age
							<dmshtml:dms_text styleId="age"
								name="AddEntity" property="answer(Object::Employee::Age)"
								size="3" maxlength="3" style="margin:0px 0px 0px 220px;" />
						</div>--%>
						<%}%> 
						
						<div class="field">
							<bean:message
								key="EmployeeDetails.Gender" /> 
							<html:radio name="AddEntity"
								property="answer(Object::Employee::gender)" value="M"
								styleId="gender1" style="margin:0px 0px 0px 315px;">
								<bean:message key="EmployeeDetails.Male" />
							</html:radio> &nbsp;&nbsp;&nbsp; <html:radio name="AddEntity"
								property="answer(Object::Employee::gender)" value="F"
								styleId="gender2" style="margin:0px 0px 0px 25px;">
								<bean:message key="EmployeeDetails.Female" />
							</html:radio>
						</div> 
						
								
						<!-- <tr>
								<td class="FormLabels" align="left" height="25"><bean:message key="EmployeeDetails.HealthPlanCoverageElection"/>* </td>
								<td class="links"><html:select name="AddEntity" property="answer(Object::EntityAdditional::HealthPlan)" styleClass="txtbox">
								<html:option value ="">Select</html:option>
								<html:option value ="EEOnly">EE Only</html:option>
									<html:option value ='EEandSpouse'>EE and Spouse</html:option>
									<html:option value ='EEandChildren'>EE and Child(ren)</html:option>
									<html:option value ='Family'>Family</html:option>
									<html:option value ='LifeOnly'>Life Only</html:option>
									<html:option value ='none'>none</html:option>
								</html:select>
								</td>
							</tr> -->
						<!-- 
						<tr>
							<td class="FormLabels" align="left" height="25"><bean:message
								key="EmployeeDetails.NoOfChildren" />*</td>
							<td class="links"><dmshtml:dms_text name="AddEntity"
								property="answer(Object::Employee::numOfChildren)" size="2"
								maxlength="2" styleClass="txtbox" styleId="numOfChildren" /></td>
						</tr>
						 -->
						<div class="field">Employment Type 
							<html:select name="AddEntity"
								property="answer(Object::Employee::employeeType)"
								style="width:100px;margin:0px 0px 0px 256px;">
								<html:option value="">Select</html:option>
								<html:option value="Active">Full-Time</html:option>
								<html:option value='PartTime'>Part-Time</html:option>
								<html:option value='Temporary'>Temporary</html:option>
							</html:select>
						</div>
						<div class="field">Employment Status 
								<html:select name="AddEntity" property="answer(Object::Employee::statusCode)" style="width:100px;margin:0px 0px 0px 245px;" styleId="statusCode">
									<html:option value='A'>Active</html:option>
									<html:option value='P'>Pended</html:option>
									<html:option value='T'>Terminated</html:option>
								</html:select>
						</div>
						<div class="field"> 
							<bean:message key="EmployeeDetails.HealthPlanCoverageElection" />
								<html:select name="AddEntity" property="answer(Object::Employee::healthCareOption)" style="width:130px;margin:0px 0px 0px 178px;" styleId="EmployeeElection" onchange="javascript:checkChildren();">
									<html:option value="">Select</html:option>
									<html:option value="EEOnly">EE Only</html:option>
									<html:option value='EEandSpouse'>EE and Spouse</html:option>
									<html:option value='EEandChildren'>EE and Child(ren)</html:option>
									<html:option value='Family'>Family</html:option>
									<html:option value='none'>None</html:option>
								</html:select>
						</div>
						<%--<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_EMPLOYEE_STATUS"}%>' connector='or' negated="true">	--%>
						<div class="field"> 
								Employee Application Status 
								<html:select  property="answer(Object::Employee::ApplicationStatus)"  styleId="EmployeeStatus" value="<%=""+EmployeeStatus1 %>" style="width:130px;margin:0px 0px 0px 190px;" styleClass="txtbox">
									<%if(!employeeStatus.equalsIgnoreCase("SENT_TO_UNDERWRITING")){ %>
										<html:option value="IN_PROGRESS" styleId="IN_PROGRESS">In Progress</html:option>
									<%if(!employeeStatus.equalsIgnoreCase("PAPER_SUBMITTED")){ %>	
										<html:option value="E_SUBMITTED"  styleId="E_SUBMITTED" disabled="<%=isEnabled%>"> E Submitted</html:option>
									<%}%>	
				 					<%if(!employeeStatus.equalsIgnoreCase("E_SUBMITTED")){ %>
										<html:option value="PAPER_SUBMITTED" styleId="PAPER_SUBMITTED" disabled="<%=isEnabled%>">Paper Submitted</html:option>
									<%}} if(!employeeStatus.equalsIgnoreCase("IN_PROGRESS")) {%>
										<html:option value="SENT_TO_UNDERWRITING" styleId="SENT_TO_UNDERWRITING" disabled="<%=isEnabled%>">Sent to Underwriting </html:option>
									<%} %>	
								</html:select>
							</div>
						
						<dmshtml:Get_Employee_EmployeeHeaderDetail nameInSession="employeeHeaderList" employeeId="<%=""+Emptid1 %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
							<logic:present name="employeeHeaderList" >
		     					<logic:iterate id="employeeHeaderList" name="employeeHeaderList">
			     					<bean:define id="INSWaiverStatus" name="employeeHeaderList" property="Object::EmployeeHeader::INSWaiverStatus" />		     								     						     						
		     						<%waiverStatus=""+INSWaiverStatus; 										
										if(!waiverStatus.equalsIgnoreCase("")) {
											isWaivEnabled=false;
										}
									%>
		     					</logic:iterate>
	     					</logic:present>
	     						
	     						<div class="field"> 
								Waiver Status 
								<html:select  property="answer(Object::Employee::InsWaiver::InsWaiverStatus__DMS_EMPLOYEE_INS_WAIVER~INS_WAIVER_STATUS)" style="width:130px;margin:0px 0px 0px 279px;" styleId="WaiverStatus" value="<%=""+waiverStatus %>" styleClass="txtbox">
									<html:option value="IN_PROGRESS" styleId="IN_PROGRESS">In Progress</html:option>								
									<html:option value="WAIVER_SUBMITTED"  styleId="WAIVER_SUBMITTED" disabled="<%=isWaivEnabled%>"> Waiver Submitted</html:option>								
									<html:option value="E_SUBMITTED" styleId="E_SUBMITTED" disabled="<%=isWaivEnabled%>">E Submitted</html:option>
								</html:select>
								</div>
						
						<%--</dmshtml:dms_static_with_connector>--%>
						
		
		<%
			com.dms.ejb.data.QuestionHashMap qmapArea =   new com.dms.ejb.data.QuestionHashMap(10);				
			qmapArea.put("ownerId", ""+ownerId);
			qmapArea.put("dbname", ""+com.dms.web.util.DbUtils.getWriteDS(pageContext));
			qmapArea.put("Object::Customer::CustomerId", ""+custid);		
		%>
			<dmshtml:execute_rules nameInSession="CHECKFORMEDICAREPRIMARY"
			dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"
			formName="form::CHECKFORMEDICAREPRIMARY"
			answerMap="<%=qmapArea%>" processInstance="preprocess" />
			<logic:present name='CHECKFORMEDICAREPRIMARY' scope='request'>
			<%
				if(qmapArea.getString("ISMEDICARE")!=null && qmapArea.getString("ISMEDICARE").length()>0   && qmapArea.getString("ISMEDICARE").equalsIgnoreCase("yes")){
			%>
				<html:hidden name="AddEntity" property="answer(Object::Employee::medicarePrimary)" value="YES" />
		<%
		}else{
		%>
				<html:hidden name="AddEntity" property="answer(Object::Employee::medicarePrimary)" value="NO" />
		<%
			}
		%>
		</logic:present>
		<p>&nbsp;.</p>
		<br>
		<div align="center">
		<html:submit value=" " styleClass="submitbutton"
			onmouseover="style.cursor='hand'" property="amswer(button)" /></div>
		<%--  <html:reset
		value=" " onmouseover="style.cursor='hand'" styleClass="resetbutton" />--%>
	
	<p>&nbsp;</p>
	<p>&nbsp;</p>
		
		
				<html:hidden property="answer(Object::Employee::govtNumber)"
					value="" styleId="ssn1ss2ss3" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::businessPhone)"
					value="" styleId="businessPhone" />				
				<html:hidden name="AddEntity" property="answer(Object::Employee::signatureDate)"
					value="" styleId="signatureDate" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::emplEffectiveDate)"
					value="" styleId="emplEffectiveDate" />				
				<html:hidden name="AddEntity" property="answer(Object::Employee::expirationDate)"
					value="" styleId="ExpirationDate" />				

				<html:hidden property="orderBy" value="LNAME" />
				<html:hidden property="objectType" value="ENTITY" />
				<html:hidden property="entityType" value="EMPLOYEE" />

				<bean:define id="Emptid" name="AddEntity"
					property="answer(Object::Employee::employeeId)" />
				<%if(! Emptid.toString().equals("")) {%>
				<html:hidden property="answer(Object::Employee::employeeId)"
					value="<%=Emptid.toString()%>" />
				<%} %>


				<html:hidden property="answer(Object::UserDetail::ownerId)"
					value="<%=ownerId.toString()%>" />
				<html:hidden property="answer(1*Entity::Equals::SearchObjectType)"
					value="CUSTOMER" />
				<html:hidden property="answer(Object::Entity::SiteId)" value="2" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::Age)" />


				<%
	String addNewEntity = request.getParameter("AddNewEntity");
	if(addNewEntity != null && addNewEntity.equalsIgnoreCase("yes"))
	{
%>
				<html:hidden property="formName" value="form::ADDEMPLOYEE1" />
				<html:hidden property="AddNewEntity" value="yes" />
				<%
	} else if(addNewEntity != null && addNewEntity.equalsIgnoreCase("no"))
	{
%>
				<html:hidden property="formName" value="form::EDITEMPLOYEE1" />
				<html:hidden property="AddNewEntity" value="no" />
				<%
	} else { %>
		<html:hidden property="formName" value="form::EDITEMPLOYEE1" />
		<html:hidden property="AddNewEntity" value="no" />
	<%} %>
				

				<html:hidden property="answer(Object::Employee::spouseSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::employeeSelected)" value="1" />
				<html:hidden property="answer(Object::Employee::childSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::empOnlySelected)" value="0" />
				<html:hidden property="answer(Object::Employee::empSpouseSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::empChildSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::familySelected)" value="0" />

				
				<html:hidden name="AddEntity" property="answer(Object::Employee::EmployeeSignature)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::EncryptedEmployeeSignature)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::SpouseSignature)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::EncryptedSpouseSignature)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::EnployeeSubmittedDate)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::SpouseSubmittedDate)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::state)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::zip)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::city)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::homePhone)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::jobTitle)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::maritalStatus)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::employmentStatus)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::dept)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::terminationDate)" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::hireDate)" />

				<html:hidden property="answer(Object::Employee::emloyeeCovCobra)" value="N" styleId="emloyeeCovCobra" />
				<html:hidden property="answer(Object::Employee::spouseCovCobra)" value="N" styleId="spouseCovCobra"/>
				<html:hidden property="answer(Object::Employee::childrenCovCobra)" value="0" styleId="childrenCovCobra"/>
				<html:hidden property="answer(Object::Employee::cobra)" value="N" />
				<html:hidden property="TabPanelName" styleId="tabPanelNAME" value="<%=""+request.getParameter("TabPanelName") %>" />


				<html:hidden property="answer(Object::Employee::govtIdType)"
					value="SSN" />

				<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerID"
					value="<%=custid.toString()%>" />
				<html:hidden property="answer(Object::Employee::customerId)"
					value="<%=custid.toString()%>" />
				<html:hidden property="answer(Object::Agency::AgencyId)"
					value="<%=agencyIdTemp.toString()%>" />
				<html:hidden property="answer(Object::Employee::PageNum)" value="0" />

				<bean:define id="userName"
					property="answer(Object::UserDetail::userName)" name="LoginPage"
					scope="session" />
				<html:hidden property="answer(Object::Employee::createdBy)"
					value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Employee::updatedBy)"
					value="<%=userName.toString()%>" />
				
				<html:hidden property="answer(Object::Entity::ObjectType)" value="ENTITY" />
				<html:hidden property="answer(Object::Entity::EntityType)" value="EMPLOYEE" />
				
				<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="EMPLOYEE" />
				
				<html:hidden property="answer(Object::UserDetail::roleName)" value="EMPLOYEE"/>
				
				<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" />
				<html:hidden property="answer(Object::UserDetail::User)" value="<%=userName.toString()%>" />
				
				<html:hidden property="answer(entityType)" value="EMPLOYEE" />
				<html:hidden property="answer(objectType)" value="ENTITY" />	
				<html:hidden property="answer(forwardNavigate)" value="success" />
				

				<html:hidden property="answer(Object::Employee::EmployeeId)" styleId="employeeID" value="<%=EmployeeId.toString()%>" />
				<html:hidden property="answer(applicationId)" value="123" />
				<html:hidden property="answer(applicationVerId)" value="179" />
				<html:hidden property="answer(SubApplicationId)" value="220" />
				<html:hidden property="answer(SubApplicationVerId)" value="274" />				
				<html:hidden property="answer(loadUpdatedXML)" value="Y" />
				<html:hidden property="answer(objectName)" value="EMPLOYEE_EXTENDED" />
				<html:hidden property="answer(applicationType)" value="EMPLOYEE" />
				<html:hidden property="answer(objectId)" value="0" />
				<html:hidden property="answer(objectVerId)" value="0" />
				<html:hidden property="answer(applicationSubType)" value="" />
				<html:hidden property="answer(state)" value="" />
				<html:hidden property="answer(teritory)" value="" />
				<html:hidden property="answer(Object::Employee::InsWaiver::InsWaiverStatus1)" value="<%=waiverStatus%>" />
				
									


				<%if((""+EmployeeId).length()>0) {%>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_NOTES_EMPLOYEE"}%>' connector='or' negated="true">
							
								<jsp:include page="../notes/DairyNotes.jsp">
									<jsp:param name="answer(Object::Notes::ObjectId)" value="<%=""+EmployeeId%>" />
									<jsp:param name="answer(Object::Notes::ObjectVerId)" value="0" />
									<jsp:param name="answer(Object::Notes::ObjectType)" value="EMPLOYEE" />
									<jsp:param name="answer(Object::Notes::UserName)" value="<%=""+userId%>" />
									<jsp:param name="answer(Object::Notes::UserRole)" value="<%=""+EmployeeId%>" />
								</jsp:include>
					</dmshtml:dms_static_with_connector>	
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_ATTACHEMENT_EMPLOYEE"}%>' connector='or' negated="true">
						
								<jsp:include page="../attachment/Attachment.jsp">
								  	<jsp:param name="answer(Object::Attachment::ObjectId)" value="<%=""+EmployeeId%>" />
								  	<jsp:param name="answer(Object::Attachment::ObjectVerId)" value="0" />
								  	<jsp:param name="answer(Object::AttachmentObjectLink::ObjectType)" value="EMPLOYEE" />
								 </jsp:include>
								
					</dmshtml:dms_static_with_connector>
					<%} %>
<!-- /body -->
</html:form>

<script type="text/javascript" >
	function gotoEmployeeApplPage(){		
		var scrWidth = screen.width;
		var scrHeight= screen.height;
		
		var applWidth;
		var applHeight;
		
		if(scrWidth==1024 && scrHeight==768){
			applWidth = "100%";
			applHeight= "94%"
		}else if(scrWidth==1280 && scrHeight==768){
			applWidth = "1150px";
			applHeight= "1250px"
		}else if(scrWidth==800 && scrHeight==600){
			applWidth = "99%";
			applHeight= "68%"
		}
		
		else if(scrWidth==1152 && scrHeight==864){
			applWidth = "99%";
			applHeight= "88%"
		}else if(scrWidth==1280 && scrHeight==600){
			applWidth = "1150px";
			applHeight= "1250px"
		}else if(scrWidth==1280 && scrHeight==720){
			applWidth = "1160px";
			applHeight= "1250px"
		}else if(scrWidth==1280 && scrHeight==800){
			applWidth = "1160px";
			applHeight= "1250px"
		}else if(scrWidth==1280 && scrHeight==960){
			applWidth = "1160px";
			applHeight= "1250px"
		}else if(scrWidth==1280 && scrHeight==1024){
			applWidth = "1160px";
			applHeight= "1250px"
		}else if(scrWidth>1280){
			applWidth = "1160px";
			applHeight= "1250px"
		}else if(scrWidth<800){
			applWidth = "99%";
			applHeight= "68%"
		}else{
			applWidth = "1150px";
			applHeight= "1250px"
		}
		
		var employeeId = document.forms[0].employeeID.value;
		var customerId = document.forms[0].customerID.value;
		var panelName = document.forms[0].tabPanelNAME.value;	
				
		document.location.href = '/GetEmployeeFlashUI.do?TabPanelName='+panelName+'&answer(Object::Customer::CustomerId)='+customerId+'&employeeId='+employeeId+'&answer(Object::Employee::EmployeeId)='+employeeId+'&answer(applWidth)='+escape(applWidth)+'&answer(applHeight)='+escape(applHeight);
	}
	
</script>