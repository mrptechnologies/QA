<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<html:html>

<head>
<title><%=session.getAttribute("PageTitle")%></title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
</head>
<body >
	<tr>
	
		<td>
			<table width="760px" align="Left" border="0" bgcolor="#C6DEEA">
				<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
					<tr>
						<td valign="top">
							<table width="380px" align="Left" border="0" bgcolor="#C6DEEA" >

								<%Object agencyIdTemp=null;%>
								<%Object cId=null;%>
								<%Object EmployeeIdParm=null;%>

								<%if(request.getParameter("answer(Object::Dependent::EmployeeId)")== null) {%>
								<bean:define id="EmpIdSession" name="AddEntity" property="answer(Object::Dependent::EmployeeId)"/>
								<%
								EmployeeIdParm=EmpIdSession;
								%>
								<%} else {%>
								<bean:parameter id="Emppara" name="answer(Object::Dependent::EmployeeId)" />
								<%EmployeeIdParm=Emppara;%>
								<%}
								if(EmployeeIdParm!=null && !EmployeeIdParm.toString().equals("") &&request.getParameter("answer(Object::Employee::employeeId")!= null) {%>
									<bean:parameter id="Empemppara" name="answer(Object::Employee::employeeId)" />
									<%EmployeeIdParm=Empemppara;%>
								<%} %>
								



								<%if(request.getParameter("answer(Object::Customer::CustomerId)")== null) {%>
								<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
								<%
								cId=cIdSession;
								%>
								<%} else {%>
								<bean:parameter id="cIdpara" name="answer(Object::Customer::CustomerId)" />
								<%cId=cIdpara;%>
								<%}%>

								<%if((request.getParameter("answer(Object::Agency::AgencyId)")== null)){%>
								<bean:define id="agencyIdTempsession" name="AddCustomer" property="answer(Agency::AgencyId)"/>
								<%agencyIdTemp=agencyIdTempsession;	%>
								<%} else {%>
								<bean:parameter id="agencyIdpara" name="answer(Object::Agency::AgencyId)" />
								<%agencyIdTemp=agencyIdpara;%>
								<%}%>

								<tr>
									<td class="FormLabels" align="left" width="160px">
									<bean:message key="Top.EmployerGroupName"/>
									</td>

										<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
										<logic:present name="customerDetail1" scope="request">
											<bean:define id="CustomerName1" name="customerDetail1" property="customerName" scope="request" />
									
											<td class="sectionhead1" align="left" width="220px">
												<a href="../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<%=cId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>" ><%=CustomerName1.toString()%></a>
											</td>

										</logic:present>
								</tr>
								


								<tr>
									<td  class="FormLabels" align="left" width="160px">
										<bean:message key="Top.AgencyName"/>
									</td> 
									<td class="sectionhead1" align="left" width="220px">
										<logic:present name ='AddCustomer' scope ='session'>
							
								
											<%
									
												if(!cId.toString().equals("")){
											%>


											<dmshtml:Get_Objects_Linked_To_Customers nameInRequest="objectsLinkToEmployeerGroup" objectId="<%=cId.toString()%>" objectType="AGENCY" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
											<logic:present name="objectsLinkToEmployeerGroup" scope="request">
												<logic:iterate id="agencyObjectDescriptor" name="objectsLinkToEmployeerGroup" type="com.dms.common.ObjectDescriptor">
									
													<bean:define id="agencyId" name="agencyObjectDescriptor" property="objectId"/>
													<dmshtml:get_agency_detail nameInSession="agencyDetail2" agencyId="<%=agencyId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
												</logic:iterate>
											</logic:present>
											<%}
											%>
											
											<%if(!agencyIdTemp.toString().equals("")){
											%>
									
									
												<dmshtml:get_agency_detail nameInSession="agencyDetail2" agencyId="<%=agencyIdTemp.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
											<%}%>
											
											<logic:present name="agencyDetail2" scope="request">
												<bean:define id="agdetail2" name="agencyDetail2" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request"/>
												<bean:define id="businessname" name="agdetail2" property="businessName"/>
												<bean:define id="id" name="agdetail2" property="id"/>
												<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="true">	
												<a href="../EditAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&ReadOnly=Yes&agencyId=<%=id%>&primaryObjectId=<%=id%> &primaryObjectType=AGENCY"><%=businessname%></a>
												</dmshtml:dms_static_with_connector >
												<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="false">
												<%=businessname%></a>
												</dmshtml:dms_static_with_connector >	
											</logic:present>
										</logic:present>
									</td>
								</tr>


							</table>
						</td>


						<td valign="top">
							<table width="380px" align="Left" border="0" bgcolor="#C6DEEA" >



							<bean:define id="EmpFName" name="AddEntity" property="answer(Object::Employee::fname)"/> 
								<bean:define id="EmpLName" name="AddEntity" property="answer(Object::Employee::lname)"/> 
								<bean:define id="EmpMName" name="AddEntity" property="answer(Object::Employee::mname)"/> 
								<bean:define id="EmployeeId" name="AddEntity" property="answer(Object::Employee::employeeId)"/> 
								
								<tr> 
									<td class="FormLabels" align="left" width="160px">
										<bean:message key="Top.GeneralAgency"/>
									</td>

									<td class="sectionhead1" align="left" width="220px"> 
										<logic:present name ='AddCustomer' scope ='session'>
											<logic:present name="agencyDetail2" scope="request">
												<bean:define id="parentAgencyId" name="agdetail2" property="parentAgencyId"/>
										
											

												<%
												if(!parentAgencyId.toString().equals("0")){%>
								
													<dmshtml:get_agency_detail nameInSession="gaAgencyDetail2" agencyId="<%=parentAgencyId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<%}%>	
												<logic:present name="gaAgencyDetail2" scope="request">
													<bean:define id="gaAgdetail2" name="gaAgencyDetail2" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request"/>
													<bean:define id="gaBusinessname1" name="gaAgdetail2" property="businessName"/>
													<bean:define id="gaId" name="gaAgdetail2" property="id"/>
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="true">	
													<a href="../EditGAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&ReadOnly=Yes&agencyId=<%=gaId%>&primaryObjectId=<%=gaId%>&primaryObjectType=GENERAL_AGENCY"><%=gaBusinessname1%></a>
													</dmshtml:dms_static_with_connector>
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="false">
													<%=gaBusinessname1%>
													</dmshtml:dms_static_with_connector>
												</logic:present>
											</logic:present>
										</logic:present>
									</td>
								</tr>

								
								<tr>
									<td class="FormLabels" align="left" width="160px">
										<bean:message key="Top.EmployeeName"/>
									</td>
									<td class="sectionhead1" align="left" width="220px">
									<%if(request.getParameter("answer(Object::Employee::Name)")!=null) { %>
										<bean:parameter id="emName" name="answer(Object::Employee::Name)"/>
										<html:hidden property="answer(Object::Employee::Name)" value="<%=emName %>"/>
										<a href="../EditEmployee.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&employeeId=<%=EmployeeIdParm %>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&AddNewEntity=no"><bean:write name="emName"/></a>
									<%} else {%>
										<a href="../EditEmployee.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&employeeId=<%=EmployeeIdParm %>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&AddNewEntity=no"><bean:write name="AddDependent" property="answer(Object::Employee::Name)"/></a>
									<%} %>
									</td>
								</tr>

							</table>
						</td>

					</tr>
				</table>
		</td>
	</tr>
</body>
</html:html>




