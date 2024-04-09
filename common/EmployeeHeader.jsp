<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<script type="text/javascript" src="../Scripts/JScripts/PolicyHeader.js">
</script>

<bean:parameter id="employeeId" name="employeeId" />
<bean:parameter id="heading" name="heading" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />	
<table align="center" border="0" width="100%">
<tr>
	<td>
		
	<div id="policyheadercontainer">
		<div id="policyheadernav">	
			<table align="center" border="0" width="100%">
				<tr>
					<td align="left" width="45%">						
						<a rel="policyheader" onclick="showHidePolicyHeader('policyheadernav');"><img src="../Images/minus.gif" name="policyHeaderImg" height="12" width="12" align="left"></img>&nbsp;<span id="Policy:TxtChange">Click to hide the detail</span></a>						
					</td>	
					<td align="left"><b class="title"><%=""+heading %></b></td>												
				</tr>
			</table>
		</div>
		
		<div id="policyheader" class="innercontent3">
	  
		     <table width="100%" align="center" border="0" bgcolor="#C6DEEA">
		     	<tr>
		     		<td>
		     			<dmshtml:Get_Employee_EmployeeHeaderDetail nameInSession="employeeHeaderList" employeeId="<%=""+employeeId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
		     				<logic:present name="employeeHeaderList" >
		     					<logic:iterate id="employeeHeaderList" name="employeeHeaderList">
		     					<bean:define id="INSWaiverStatus" name="employeeHeaderList" property="Object::EmployeeHeader::INSWaiverStatus" />
		     					<bean:define id="applicationStatus" name="employeeHeaderList" property="Object::EmployeeHeader::ApplicationStatus" />
		     					<bean:define id="customerId" name="employeeHeaderList" property="Object::EmployeeHeader::CustomerId" />	
		     					<bean:define id="agencyId" name="employeeHeaderList" property="Object::EmployeeHeader::Customer::AgencyId" />
		     						     					
		     					<%
		     					String applicationStatus1=""+applicationStatus;
		     					String insWaiverStatus1=""+INSWaiverStatus;
		     					if(applicationStatus1.equalsIgnoreCase("IN_PROGRESS")){
		     						applicationStatus1="In Progress";
		     					}else if(applicationStatus1.equalsIgnoreCase("E_SUBMITTED")){
		     						applicationStatus1="E Submitted";
		     					}else if (applicationStatus1.equalsIgnoreCase("PAPER_SUBMITTED")){
		     						applicationStatus1="Paper Submitted";
		     					}else if (applicationStatus1.equalsIgnoreCase("SENT_TO_UNDERWRITING")){
		     						applicationStatus1="Sent to Underwriting";
		     					}else{
		     						applicationStatus1="";
		     					}
		     					if(insWaiverStatus1.equalsIgnoreCase("IN_PROGRESS")){
		     						insWaiverStatus1="Inprogress";
		     					}else if(insWaiverStatus1.equalsIgnoreCase("E_SUBMITTED")){
		     						insWaiverStatus1="E Submitted";
		     					}else if(insWaiverStatus1.equalsIgnoreCase("WAIVER_SUBMITTED")){
		     						insWaiverStatus1="Waiver Submitted";
		     					}else if (insWaiverStatus1.equalsIgnoreCase("PAPER_SUBMITTED")){
		     						insWaiverStatus1="Paper Submitted";
		     					}else if (insWaiverStatus1.equalsIgnoreCase("SENT_TO_UNDERWRITING")){
		     						insWaiverStatus1="Sent to Underwriting";
		     					}else{
		     						insWaiverStatus1="";
		     					}
		     					
		     					%>
			     				<tr>
									<td align="left" class="FormLabels"  colspan="1" width="24%">
										Employee Name
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="34%">
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_EMPLOYEE"}%>' connector='or' negated="true">
											<a href="../EditEmployeeCencus.do?TabPanelName=Insured_Panel&employeeId=<%=""+employeeId%>&answer(Object::Employee::employeeId)=<%=""+employeeId%>&answer(Object::Customer::CustomerId)=<%=customerId%>&answer(Object::Agency::AgencyId)=<%=agencyId%>&formName=form::EDITEMPLOYEE&AddNewEntity=no&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">
												<bean:write name='employeeHeaderList' property='Object::EmployeeHeader::EmployeeLName'/>
												<bean:write name='employeeHeaderList' property='Object::EmployeeHeader::EmployeeFName'/>
											</a>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_EMPLOYEE"}%>' connector='or' negated="false">
											<bean:write name='employeeHeaderList' property='Object::EmployeeHeader::EmployeeLName'/>
											<bean:write name='employeeHeaderList' property='Object::EmployeeHeader::EmployeeFName'/>
										</dmshtml:dms_static_with_connector>
									</td>
									<td align="left" class="FormLabels"  colspan="1" width="15%">
										Application Status
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="20%">
										<%=""+applicationStatus1 %>
									</td>
									
								</tr>
			     				<tr>
			     					<td align="left" class="FormLabels"  colspan="1" width="24%">
										Created By
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="34%">
										<bean:write name='employeeHeaderList' property='Object::EmployeeHeader::CreatedBy'/>
									</td>
									<td  class="FormLabels" align="left"  colspan="1" width="15%">
										INS Waiver Status
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="20%">
										<%=""+insWaiverStatus1 %>
									</td>
								</tr>
									
									</logic:iterate>							
		     				</logic:present>
		     			</td>	
						
		     		</tr>
		   	</table>
		</div> 

    </div>	
     </td>
     </tr>
	</table>	
		
		
		
		
		
		
		
		
		
		
		
		