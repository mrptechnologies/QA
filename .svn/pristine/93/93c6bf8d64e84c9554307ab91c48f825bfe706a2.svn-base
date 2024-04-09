<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddEmployee.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
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



<html:form action="/AddEntity.do" onsubmit="return validateFields();">

	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		
		<tr>
			<td><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td>
		</tr>
		
		<tr>
			<td valign="top" align="left">
				<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td height="5" colspan="2"></td>
					</tr>
					<tr>
						<td class="NewSectionHead" align="center" colspan="2">EMPLOYEE CENSUS DETAILS</td>
					</tr>
					<tr><td height="5" colspan="2"></td></tr>

					

				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
					<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
						<tr>
							<td class="links" width="20%">
							<bean:parameter id="custid"	name="answer(Object::Customer::CustomerId)" />
							<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
							<bean:parameter id="ownerId" name="answer(Object::UserDetail::ownerId)" />
							<a href="../QuickAllEmployees.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&customerId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::Employee::PageNum)=0"
								title="Click to go to Show All Employees/Add Employee" />Census</a>
							</td>
							<td class="links" width="20%"><a
								href="../AllQuotes.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>"
								title="Click to go to Quotes" />Quotes</a></td>
							<logic:present name='arrObjectDetail'>
								<logic:present name='AddEntity'>
									<logic:notEmpty name="AddEntity" property="answer(Object::Employee::employeeId)">
									<bean:define id="Emptid" name="AddEntity"
										property="answer(Object::Employee::employeeId)" />
									<td class="links" width="20%"><a
										href="../AllDependents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&Object::Dependent::EmployeeId=<%=Emptid.toString()%>&employeeId=<%=Emptid.toString()%>&answer(Object::Dependent::EmployeeId)=<%=Emptid.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::Name)=<bean:write name='AddEntity' property='answer(Object::Employee::fname)'/> <bean:write name='AddEntity' property='answer(Object::Employee::lname)'/>"
										title="Click to go to Show All Dependents/Add Dependent" />Dependent</a></td>
									</logic:notEmpty>
								</logic:present>
							</logic:present>
						</tr>
					</table>
					</td>
				</tr>
				<%
					boolean errorOccured=false;
				%>
				<bean:define id="ansmap" name="AddEntity" property="answerMap"
					type="com.dms.ejb.data.QuestionHashMap" />
				<logic:iterate id="element" name="ansmap">
					<bean:define id="errorListkey" name="element" property="key" />
					<logic:equal name="errorListkey" value="Object::error::list">
						<bean:define id="errorListvalue" name="element" property="value" />
						<logic:iterate id="errmsg" name="errorListvalue">
							<tr>
								<td class="Error" colspan="5">
									<bean:write name="errmsg" property="errorMessage" />
									<%
						        		errorOccured	=true;				
									%>
								</td>
							</tr>
						</logic:iterate>
					</logic:equal>
				</logic:iterate>
				<%
					if(errorOccured)
					{
						((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
						((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.OBJECT_ERROR_LIST);
					}
				%>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>

				<tr>
					<td colspan="2">
					<table width="760px" align="left" border="0" CELLSPACING="0" CELLPADDING="0" class="boxed">
						<tr>
							<td class="sectionhead" colspan="2" align="center">Employee Information</td></tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">
								<table border="0" width="100%">
									<tr>
										<td class="FormLabels" align="left" height="25" width="25%">
										<bean:message key="EmployeeDetails.FirstName" /></td>
										<td class="links" width="15%">
											<dmshtml:dms_text name="AddEntity" property="answer(Object::Employee::fname)" size="15"	maxlength="15" styleClass="txtbox" /></td>
										<td class="FormLabels" align="left" height="25" width="20%">Prefix</td>										
										<td class="links" width="40%">
											<dmshtml:dms_text name="AddEntity" property="answer(Object::Employee::prefix)" size="4" maxlength="3" styleClass="txtbox" /></td>
									</tr>
									<tr>
										<td class="FormLabels" align="left" height="25">Middle Initial</td>
										<td class="links" align="left" colspan="3" >
											<dmshtml:dms_text name="AddEntity" property="answer(Object::Employee::mname)" size="1" maxlength="1" styleClass="txtbox" /></td>
									</tr>
									<tr>
										<td class="FormLabels" align="left" height="25" width="25%">
											<bean:message key="EmployeeDetails.LastName" /></td>
										<td class="links" width="15%"><dmshtml:dms_text name="AddEntity"
											property="answer(Object::Employee::lname)" size="15"
											maxlength="15" styleClass="txtbox" /></td>
										<td class="FormLabels" align="left" height="25" width="20%">Suffix</td>
										<td class="links" width="40%">
											<dmshtml:dms_text name="AddEntity" property="answer(Object::Employee::suffix)" size="4"	maxlength="3" styleClass="txtbox" /></td>
									</tr>
								</table>
							</td></tr>

						<bean:define id="SSN" name="AddEntity"
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
						<tr>
							<td width="25%" class="FormLabels" align="left" height="25">SSN</td>
							<td class="links"><html:text name="AddEntity"
								property="answer(SSN1)" size="3" styleId="ssn1" maxlength="3"
								styleClass="txtbox" value="<%=xxx%>"
								onkeyup="if(this.value.length==3) {document.forms[0].ssn2.focus()}" />XXX&nbsp;

							<html:text name="AddEntity" property="answer(SSN2)" size="2"
								styleId="ssn2" maxlength="2" styleClass="txtbox" value="<%=xx%>"
								onkeyup="if(this.value.length==2) {document.forms[0].ssn3.focus()}" />XX&nbsp;

							<html:text name="AddEntity" property="answer(SSN3)" size="4"
								styleId="ssn3" maxlength="4" styleClass="txtbox"
								value="<%=xxxx%>" />XXXX</td>

						</tr>
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

						<tr>
							<td width="25%" class="FormLabels" align="left" height="25"><bean:message
								key="EmployeeDetails.DateOfBirth" /></td>
							<td class="links"><html:text styleId="dobmm"
								name="AddEntity" property="answer(Month)" size="2" maxlength="2"
								styleClass="txtbox" value=""
								onkeyup="if(this.value.length==2) {document.forms[0].dobdd.focus()}" />/mm&nbsp;

							<html:text styleId="dobdd" name="AddEntity"
								property="answer(Date)" size="2" maxlength="2"
								styleClass="txtbox" value=""
								onkeyup="if(this.value.length==2) {document.forms[0].dobdd.focus()}" />/dd&nbsp;

							<html:text styleId="dobyy" name="AddEntity"
								property="answer(Year)" size="4" maxlength="4"
								styleClass="txtbox" value="" />/yyyy</td>
						</tr>
						<tr>
							<td width="25%" class="FormLabels" align="left" height="25">Age*</td>
							<td class="links"><dmshtml:dms_text styleId="age"
								name="AddEntity" property="answer(Object::Employee::Age)"
								size="3" maxlength="3" styleClass="txtbox" value="" /></td>
						</tr>
						<%}else{%>
						<tr>
							<td width="25%" class="FormLabels" align="left" height="25"><bean:message
								key="EmployeeDetails.DateOfBirth" /></td>
							<td class="links"><html:text styleId="dobmm"
								name="AddEntity" property="answer(Month)" size="2" maxlength="2"
								styleClass="txtbox" value="<%=mm%>"
								onkeyup="if(this.value.length==2) {document.forms[0].dobdd.focus()}" />/mm&nbsp;

							<html:text styleId="dobdd" name="AddEntity"
								property="answer(Date)" size="2" maxlength="2"
								styleClass="txtbox" value="<%=dd%>"
								onkeyup="if(this.value.length==2) {document.forms[0].dobyy.focus()}" />/dd&nbsp;

							<html:text styleId="dobyy" name="AddEntity"
								property="answer(Year)" size="4" maxlength="4"
								styleClass="txtbox" value="<%=yyyy%>" />/yyyy</td>
						</tr>
						<tr>
							<td width="25%" class="FormLabels" align="left" height="25">Age*</td>
							<td class="links"><dmshtml:dms_text styleId="age"
								name="AddEntity" property="answer(Object::Employee::Age)"
								size="3" maxlength="3" styleClass="txtbox" /></td>
						</tr>
						<%}%>
						<tr>
							<td align="left" class="FormLabels" height="25"><bean:message
								key="EmployeeDetails.Gender" />*</td>
							<td class="TextMatter"><dmshtml:dms_radio name="AddEntity"
								property="answer(Object::Employee::gender)" value="M"
								styleId="gender1">
								<bean:message key="EmployeeDetails.Male" />
							</dmshtml:dms_radio> &nbsp;&nbsp;&nbsp; <dmshtml:dms_radio name="AddEntity"
								property="answer(Object::Employee::gender)" value="F"
								styleId="gender2">
								<bean:message key="EmployeeDetails.Female" />
							</dmshtml:dms_radio></td>
						</tr>

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
						<tr>
							<td class="FormLabels" align="left" height="25"><bean:message
								key="EmployeeDetails.NoOfChildren" />*</td>
							<td class="links"><dmshtml:dms_text name="AddEntity"
								property="answer(Object::Employee::numOfChildren)" size="2"
								maxlength="2" styleClass="txtbox" styleId="numOfChildren" /></td>
						</tr>
						<tr>
							<td class="FormLabels" align="left" height="25">Employment Type</td>
							<td class="links"><html:select name="AddEntity"
								property="answer(Object::Employee::employeeType)"
								styleClass="txtbox">
								<html:option value="">Select</html:option>
								<html:option value="Active">Full-Time</html:option>
								<html:option value='PartTime'>Part-Time</html:option>
								<html:option value='Temporary'>Temporary</html:option>
							</html:select></td>
						</tr>
						<tr>
							<td class="FormLabels" align="left" height="25">Employment Status</td>
							<td  class="TextMatter">
								<html:select name="AddEntity" property="answer(Object::Employee::statusCode)" styleClass="txtbox" styleId="statusCode">
									<html:option value='A'>Active</html:option>
									<html:option value='P'>Pended</html:option>
									<html:option value='T'>Terminated</html:option>
								</html:select>
							</td></tr>
						<tr>
								<td class="FormLabels" align="left" height="25" width="25%">
								<bean:message key="EmployeeDetails.HealthPlanCoverageElection" />*</td>
								<td class="links" align="left">
									<html:select name="AddEntity" property="answer(Object::Employee::healthCareOption)" styleClass="txtbox" styleId="EmployeeElection" onchange="javascript:checkChildren();">
										<html:option value="">Select</html:option>
										<html:option value="EEOnly">EE Only</html:option>
										<html:option value='EEandSpouse'>EE and Spouse</html:option>
										<html:option value='EEandChildren'>EE and Child(ren)</html:option>
										<html:option value='Family'>Family</html:option>
										<html:option value='none'>None</html:option>
									</html:select></td></tr>
						</table></td></tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td  valign="top" width="380px">
						<table width="98%" align="left" border="0" CELLSPACING="0" CELLPADDING="0" class="boxed">
							<tr>
								<td class="sectionhead" colspan="2" align="center">COBRA Options</td></tr>
							<tr>
								<td colspan="2">&nbsp;</td></tr>
							<tr>
								<td align="left" class="FormLabels" height="25" width="35%">COBRA Opted</td>
								<td class="TextMatter">

								<INPUT TYPE=RADIO NAME="answer(Object::Employee::cobra)" VALUE="Y" Id="COBRAOpted1" disabled="disabled" >Yes
								&nbsp;&nbsp;&nbsp;
								<INPUT TYPE=RADIO NAME="answer(Object::Employee::cobra)" VALUE="N" Id="COBRAOpted2" disabled="disabled" >No

									</td>
							</tr>
							<bean:define id="strEmloyeeCovCobra" name="AddEntity" property="answer(Object::Employee::emloyeeCovCobra)" />
							<bean:define id="strSpouseCovCobra" name="AddEntity" property="answer(Object::Employee::spouseCovCobra)" />
							<bean:define id="strChildrenCovCobra" name="AddEntity" property="answer(Object::Employee::childrenCovCobra)" />
							<tr>
								<td align="left" class="FormLabels" height="25" style="Id: cobraText1">Employee covered in COBRA</td>
								<td class="TextMatter">

								<INPUT TYPE=RADIO NAME="answer(Object::Employee::emloyeeCovCobra)" VALUE="Y" Id="EmployeeCoveredInCOBRA1" disabled="disabled" >Yes
								&nbsp;&nbsp;&nbsp;
								<INPUT TYPE=RADIO NAME="answer(Object::Employee::emloyeeCovCobra)" VALUE="N" Id="EmployeeCoveredInCOBRA2" disabled="disabled" >No

<!--
								<%if(strEmloyeeCovCobra.toString().equals("Y")) {%>
								<INPUT TYPE=RADIO NAME="answer(Object::Employee::emloyeeCovCobra)" VALUE="Y" Id="EmployeeCoveredInCOBRA1" onblur="document.forms[0].emloyeeCovCobra.value='Y'" checked>Yes
								&nbsp;&nbsp;&nbsp;
								<INPUT TYPE=RADIO NAME="answer(Object::Employee::emloyeeCovCobra)" VALUE="N" Id="EmployeeCoveredInCOBRA2" onblur="document.forms[0].emloyeeCovCobra.value='N'">No
<!--
									<dmshtml:dms_radio name="AddEntity"	property="answer(Object::Employee::emloyeeCovCobraTemp)" value="Y"	disabled="true" styleId="EmployeeCoveredInCOBRA1" onblur="document.forms[0].emloyeeCovCobra.value=Y">Yes</dmshtml:dms_radio>
									&nbsp;&nbsp;&nbsp;
									<dmshtml:dms_radio name="AddEntity"	property="answer(Object::Employee::emloyeeCovCobraTemp)" value="N" disabled="true" styleId="EmployeeCoveredInCOBRA2" onblur="document.forms[0].emloyeeCovCobra.value=N">No</dmshtml:dms_radio>
									-->
<!--
								<%}else {%>

								<INPUT TYPE=RADIO NAME="answer(Object::Employee::emloyeeCovCobra)" VALUE="Y" Id="EmployeeCoveredInCOBRA1" onblur="document.forms[0].emloyeeCovCobra.value='Y'">Yes
								&nbsp;&nbsp;&nbsp;
								<INPUT TYPE=RADIO NAME="answer(Object::Employee::emloyeeCovCobra)" VALUE="N" Id="EmployeeCoveredInCOBRA2" onblur="document.forms[0].emloyeeCovCobra.value='N'" checked>No

								<%}%>
-->
									</td>
							</tr>
							<tr>
								<td align="left" class="FormLabels" height="25" style="Id: cobraText2">Spouse covered</td>
								<td class="TextMatter">

								<INPUT TYPE=RADIO NAME="answer(Object::Employee::spouseCovCobra)" VALUE="Y" Id="SpouseCoveredInCOBRA1" disabled="disabled" >Yes
									&nbsp;&nbsp;&nbsp;
									<INPUT TYPE=RADIO NAME="answer(Object::Employee::spouseCovCobra)" VALUE="N" Id="SpouseCoveredInCOBRA2" disabled="disabled" >No
<!--
								<%if(strSpouseCovCobra.toString().equals("Y")) {%>
								<INPUT TYPE=RADIO NAME="answer(Object::Employee::spouseCovCobra)" VALUE="Y" Id="SpouseCoveredInCOBRA1" onblur="document.forms[0].spouseCovCobra.value='Y'" checked>Yes
									&nbsp;&nbsp;&nbsp;
									<INPUT TYPE=RADIO NAME="answer(Object::Employee::spouseCovCobra)" VALUE="N" Id="SpouseCoveredInCOBRA2" onblur="document.forms[0].spouseCovCobra.value='N'">No
<!--
									<dmshtml:dms_radio name="AddEntity"	property="answer(Object::Employee::emloyeeCovCobraTemp)" value="Y"	disabled="true" styleId="EmployeeCoveredInCOBRA1" onblur="document.forms[0].emloyeeCovCobra.value=Y">Yes</dmshtml:dms_radio>
									&nbsp;&nbsp;&nbsp;
									<dmshtml:dms_radio name="AddEntity"	property="answer(Object::Employee::emloyeeCovCobraTemp)" value="N" disabled="true" styleId="EmployeeCoveredInCOBRA2" onblur="document.forms[0].emloyeeCovCobra.value=N">No</dmshtml:dms_radio>
									-->
<!--
								<% }else {%>

								<INPUT TYPE=RADIO NAME="answer(Object::Employee::spouseCovCobra)" VALUE="Y" Id="SpouseCoveredInCOBRA1" onblur="document.forms[0].spouseCovCobra.value='Y'">Yes
									&nbsp;&nbsp;&nbsp;
									<INPUT TYPE=RADIO NAME="answer(Object::Employee::spouseCovCobra)" VALUE="N" Id="SpouseCoveredInCOBRA2" onblur="document.forms[0].spouseCovCobra.value='N'" checked>No

								<%}%>
-->

									
									<!-- <dmshtml:dms_radio name="AddEntity" property="answer(Object::Employee::spouseCovCobraTemp)" value="Y" disabled="true" styleId="SpouseCoveredInCOBRA1" onblur="document.forms[0].spouseCovCobra.value=Y">Yes</dmshtml:dms_radio>
									&nbsp;&nbsp;&nbsp;
									<dmshtml:dms_radio name="AddEntity"	property="answer(Object::Employee::spouseCovCobraTemp)" value="N" disabled="true" styleId="SpouseCoveredInCOBRA2" onblur="document.forms[0].spouseCovCobra.value=N">No</dmshtml:dms_radio> -->

								</td>
							</tr>
							<tr>
								<td align="left" class="FormLabels" height="25" style="Id: cobraText3">Number Of Children Covered</td>
								<td class="links"><html:text name="AddEntity" property="answer(Object::Employee::childrenCovCobra)" size="2" disabled="true" maxlength="2" styleClass="txtbox"	styleId="numOfCobraChildren" onblur="javascript:validateNumRange(this, 0, 99, 'Cobra: Number Of Children Covered', true);"/></td>
							</tr>
										
						</table></td>
						<td width="380px" valign="top" rowspan="3">
						<table width="98%" align="left" CELLSPACING="0" CELLPADDING="0" class="boxed">
							<tr>
								<td class="sectionhead" colspan="2" align="center">Enrollment Information</td></tr>
							<tr>
								<td colspan="2">&nbsp;</td></tr>
							<tr>
								<td class="Formlabels" align="left" height="25">Certificate Number</td>
								<td class="TextMatter">
									<html:text name="AddEntity" property="answer(Object::Employee::certificateNumber)" styleId="certificateNumber" maxlength="9" styleClass="txtbox" onblur="javascript:validateNumRange(this, 0, 999999999, 'Certificate Number', true);"/></td></tr>
							<bean:define id="HireDate" name="AddEntity"
								property="answer(Object::Employee::hireDate)" />
							<%
							String StrHireDate=HireDate.toString();
							String HireDateyyyy="";
							String HireDatedd="";
							String HireDatemm="";
							if((!StrHireDate.equals(""))&&StrHireDate.length()==10)
							{
							HireDatemm= StrHireDate.substring(0,2);
							HireDatedd= StrHireDate.substring(3,5);
							HireDateyyyy= StrHireDate.substring(6,10);
							}%>
							<tr>
								<td width="30%" class="FormLabels" align="left" height="25">Hire Date</td>
								<td class="TextMatter"><dmshtml:dms_text styleId="HireDatemm"
									name="AddEntity" property="answer(HireDatemm)" size="2"
									maxlength="2" styleClass="txtbox" value="<%=HireDatemm%>"
									onkeyup="if(this.value.length==2) {document.forms[0].HireDatedd.focus()}" />/mm&nbsp;

								<dmshtml:dms_text styleId="HireDatedd" name="AddEntity"
									property="answer(HireDatedd)" size="2" maxlength="2"
									styleClass="txtbox" value="<%=HireDatedd%>"
									onkeyup="if(this.value.length==2) {document.forms[0].HireDateyy.focus()}" />/dd&nbsp;

								<dmshtml:dms_text styleId="HireDateyy" name="AddEntity"
									property="answer(HireDateyyyy)" size="4" maxlength="4"
									styleClass="txtbox" value="<%=HireDateyyyy%>" />/yyyy</td>
							</tr>

							<bean:define id="EffectiveDate" name="AddEntity"
								property="answer(Object::Employee::emplEffectiveDate)" />
							<%
							String sigEffectiveDate=EffectiveDate.toString();
							String EDyyyy="";
							String EDdd="";
							String EDmm="";
							if((!sigEffectiveDate.equals(""))&&sigEffectiveDate.length()==10)
							{
							EDmm= sigEffectiveDate.substring(0,2);
							EDdd= sigEffectiveDate.substring(3,5);
							EDyyyy= sigEffectiveDate.substring(6,10);
							}%>
							<tr>
								<td width="30%" class="FormLabels" align="left" height="25">Effective Date</td>
								<td class="TextMatter"><dmshtml:dms_text
									styleId="emplEffectiveDatemm" name="AddEntity"
									property="answer(effMM)" size="2" maxlength="2"
									styleClass="txtbox" value="<%=EDmm%>"
									onkeyup="if(this.value.length==2) {document.forms[0].emplEffectiveDatedd.focus()}" />/mm&nbsp;

								<dmshtml:dms_text styleId="emplEffectiveDatedd"
									name="AddEntity" property="answer(effDD)" size="2"
									maxlength="2" styleClass="txtbox" value="<%=EDdd%>"
									onkeyup="if(this.value.length==2) {document.forms[0].emplEffectiveDateyy.focus()}" />/dd&nbsp;

								<dmshtml:dms_text styleId="emplEffectiveDateyy"
									property="answer(effyyyy)" size="4" maxlength="4"
									styleClass="txtbox" value="<%=EDyyyy%>" />/yyyy</td>
							</tr>

							<bean:define id="sigDate" name="AddEntity"
								property="answer(Object::Employee::signatureDate)" />
							<%
							String sigstrDate=sigDate.toString();
							String sigyyyy="";
							String sigdd="";
							String sigmm="";
							if((!sigstrDate.equals(""))&&sigstrDate.length()==10)
							{
							sigmm= sigstrDate.substring(0,2);
							sigdd= sigstrDate.substring(3,5);
							sigyyyy= sigstrDate.substring(6,10);
							}%>
							<tr>
								<td class="FormLabels" align="left" height="25">Signature Date</td>
								<td class="TextMatter"><dmshtml:dms_text
									styleId="signatureDatemm" name="AddEntity"
									property="answer(sigMonth)" size="2" maxlength="2"
									styleClass="txtbox" value="<%=sigmm%>"
									onkeyup="if(this.value.length==2) {document.forms[0].signatureDatedd.focus()}" />/mm&nbsp;

								<dmshtml:dms_text styleId="signatureDatedd" name="AddEntity"
									property="answer(sigDate)" size="2" maxlength="2"
									styleClass="txtbox" value="<%=sigdd%>"
									onkeyup="if(this.value.length==2) {document.forms[0].signatureDateyy.focus()}" />/dd&nbsp;

								<dmshtml:dms_text styleId="signatureDateyy" name="AddEntity"
									property="answer(sigYear)" size="4" maxlength="4"
									styleClass="txtbox" value="<%=sigyyyy%>" />/yyyy</td>
							<tr>
							<bean:define id="approveDate" name="AddEntity"	property="answer(Object::Employee::approveDate)" />
							<%
							String strapproveDate=approveDate.toString();
							String adyyyy="";
							String addd="";
							String admm="";
							if((!strapproveDate.equals(""))&&strapproveDate.length()==10)
							{
							admm= strapproveDate.substring(0,2);
							addd= strapproveDate.substring(3,5);
							adyyyy= strapproveDate.substring(6,10);
							}%>
								<td class="FormLabels" height="25">Approve Date</td>
								<td class="TextMatter">
									<html:hidden name="AddEntity" property="answer(Object::Employee::approveDate)" styleId="approveDate" />
									<html:text name="AddEntity" styleId="approveDateMM" property="answer(appMonth)" value="<%=admm %>" size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].approveDateDD.focus();}"/>/mm&nbsp;
									<html:text name="AddEntity" styleId="approveDateDD" property="answer(appDate)" value="<%=addd %>" size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].approveDateYY.focus();}"/>/dd&nbsp;
									<html:text name="AddEntity" styleId="approveDateYY" property="answer(appYear)" value="<%=adyyyy %>" size="4" maxlength="4" styleClass="txtbox"/>/yyyy&nbsp;
								</td>
							</tr>
							<tr>
								<td class="FormLabels" height="25">Salary</td>
								<td class="TextMatter">
									<html:text name="AddEntity" property="answer(Object::Employee::salary)" maxlength="7" styleId="salary" styleClass="txtbox" onblur="javascript:validateNumRange(this, 0, 9999999, 'Salary');"/>
								</td>
							</tr>
							<tr>
								<td class="FormLabels" height="25">Salary Indicator</td>
								<td class="TextMatter">
									<html:select name="AddEntity" property="answer(Object::Employee::salaryInd)" styleClass="txtbox" styleId="salaryInd">
										<html:option value=''>select</html:option>
										<html:option value='A'>Annual</html:option>
										<html:option value='B'>Bi-weekly</html:option>
										<html:option value='M'>Monthly</html:option>
										<html:option value='S'>Semi-monthly</html:option>
										<html:option value='W'>Weekly</html:option>
									</html:select>
								</td>
							</tr>
							<tr>
								<td class="FormLabels" height="25">Working Class</td>
								<td class="TextMatter">
									<html:select name="AddEntity" property="answer(Object::Employee::workingClass)" styleClass="txtbox" styleId="workingClass">
										<html:option value=''>select</html:option>
										<html:option value='1'>1</html:option>
										<html:option value='2'>2</html:option>
										<html:option value='3'>3</html:option>
										<html:option value='8'>8</html:option>
										<html:option value='9'>9</html:option>
										<html:option value='A'>A</html:option>
										<html:option value='N'>N</html:option>
										<html:option value='P'>P</html:option>
										<html:option value='Y'>Y</html:option>
									</html:select>
								</td>
							</tr>
							<tr>
								<td class="FormLabels" height="25">Hours Worked Per Week</td>
								<td class="TextMatter">
									<html:text name="AddEntity" property="answer(Object::Employee::hoursWorkedPerWeek)" styleId="hoursWorkedPerWeek" styleClass="txtbox" onblur="javascript:validateNumRange(this, 0, 512, 'Hours Worked Per Week', true);"/>
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" height="25">Smoker</td>
								<td  class="TextMatter">
									<html:radio name="AddEntity" property="answer(Object::Employee::isSmoker)" value="Y" styleId="isSmokerY">Yes</html:radio>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<html:radio name="AddEntity" property="answer(Object::Employee::isSmoker)" value="N" styleId="isSmokerN">No</html:radio>
								</td></tr>
							<tr>
								<td class="FormLabels" align="left" height="25">Contribution</td>
								<td  class="TextMatter">
									<html:text name="AddEntity" property="answer(Object::Employee::contribution)"  styleClass="txtbox" styleId="contribution"/>
								</td></tr>
							<tr>
								<td class="FormLabels" align="left" height="25">Late Enrollment Indicator</td>
								<td  class="TextMatter">
									<html:select name="AddEntity" property="answer(Object::Employee::lateEnrollInd)" styleClass="txtbox" styleId="lateEnrollInd">
										<html:option value=''>select</html:option>
										<html:option value='2'>2</html:option>
										<html:option value='3'>3</html:option>
										<html:option value='7'>7</html:option>
									</html:select>
								</td></tr>
								<tr>
									<td class="FormLabels" align="left" height="25">Pre-Existing Condition Status</td>
									<td class="links"><html:select name="AddEntity"
										property="answer(Object::Employee::priorConditionStatus)"
										styleClass="txtbox">
										<html:option value='N'>N</html:option>
										<html:option value='2'>2</html:option>
										<html:option value='3'>3</html:option>
										<html:option value='7'>7</html:option>

									</html:select></td>
								</tr>

								<bean:define id="ExpirationDate" name="AddEntity" property="answer(Object::Employee::expirationDate)" />
								<%
									String StrExpirationDate=ExpirationDate.toString();
									String ExpirationDateyyyy="";
									String ExpirationDatedd="";
									String ExpirationDatemm="";
									if((!StrExpirationDate.equals(""))&&StrExpirationDate.length()==10)
									{
									ExpirationDatemm= StrExpirationDate.substring(0,2);
									ExpirationDatedd= StrExpirationDate.substring(3,5);
									ExpirationDateyyyy= StrExpirationDate.substring(6,10);
								}%>
								<tr>
									<td width="30%" class="FormLabels" align="left" height="25">Pre-Existing Condition Expiration Date</td>
									<td class="links"><dmshtml:dms_text
										styleId="ExpirationDatemm" name="AddEntity"
										property="answer(ExpirationDatemm)" size="2" maxlength="2"
										styleClass="txtbox" value="<%=ExpirationDatemm%>"
										onkeyup="if(this.value.length==2) {document.forms[0].ExpirationDatedd.focus()}" />/mm&nbsp;

									<dmshtml:dms_text styleId="ExpirationDatedd" name="AddEntity"
										property="answer(ExpirationDatedd)" size="2" maxlength="2"
										styleClass="txtbox" value="<%=ExpirationDatedd%>"
										onkeyup="if(this.value.length==2) {document.forms[0].ExpirationDateyy.focus()}" />/dd&nbsp;

									<dmshtml:dms_text styleId="ExpirationDateyy" name="AddEntity"
										property="answer(ExpirationDateyy)" size="4" maxlength="4"
										styleClass="txtbox" value="<%=ExpirationDateyyyy%>" />/yyyy</td>
								</tr>
								<tr><td colspan="2" height="30">&nbsp;</td></tr>
							</table>
							</td></tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td valign="top" width="380px">
								<table width="98%" align="left" CELLSPACING="0" CELLPADDING="0" border="0" class="boxed">
									<tr>
										<td class="sectionhead" colspan="2" align="center">Correspondence Address</td></tr>
									<tr>
										<td colspan="2">&nbsp;</td></tr>							
									<tr>
										<td class="FormLabels" align="left" height="25" width="43%">Line1</td>
										<td class="TextMatter"><dmshtml:dms_text name="AddEntity"
											property="answer(Object::Employee::address1)" size="30"
											maxlength="30" styleClass="txtbox" /></td>
									</tr>
				
									<tr>
										<td class="FormLabels" align="left" height="25">Line2</td>
										<td class="TextMatter"><dmshtml:dms_text name="AddEntity"
											property="answer(Object::Employee::address2)" size="30"
											maxlength="30" styleClass="txtbox" /></td>
									</tr>
				
									<tr>
										<td class="FormLabels" align="left" height="25">City</td>
										<td class="TextMatter"><dmshtml:dms_text name="AddEntity"
											property="answer(Object::Employee::city)" size="20"
											maxlength="20" styleClass="txtbox" /></td>
									</tr>
									<tr>
										<td class="FormLabels" align="left" height="25">County</td>
										<td class="TextMatter"><dmshtml:dms_text name="AddEntity"
											property="answer(Object::Employee::county)" size="10"
											maxlength="10" styleClass="txtbox" /></td>
									</tr>
									<tr>
										<td class="FormLabels" align="left" height="25">County Code</td>
										<td class="TextMatter"><dmshtml:dms_text name="AddEntity"
											property="answer(Object::Employee::countyCode)" size="3" styleId="countyCode"
											maxlength="3" styleClass="txtbox" onblur="javascript:validateNumRange(this, 0, 999, 'County Code', true);"/></td>
									</tr>
				
				
				
									<tr>
									
										<td class="FormLabels">State</td>
										<td class="TextMatter"><dmshtml:get_type nameInSession="arStates"
											dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId)%>"
											dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
											<html:select property="answer(Object::Employee::state)"
												name="AddEntity" styleClass="txtbox">
												<html:option value="">Select</html:option>
												<logic:iterate id="details" name="arStates">
													<bean:define id='test' name="details" property="typeDesc" />
													<html:option value='<%=test.toString()%>'>
														<bean:write name="details" property="dmsType" />
													</html:option>
												</logic:iterate>
											</html:select></td>
									</tr>
									<tr>
										<td class="FormLabels" align="left" height="25">ZIP</td>
										<td class="TextMatter"><html:text name="AddEntity"
											property="answer(Object::Employee::zip)" styleId="zipCode"
											size="10" maxlength="10" styleClass="txtbox"
											onkeyup="if(this.value.length==5) {document.forms[0].zipCode.value=document.forms[0].zipCode.value+'-'}" onblur="javascript:validateNumRange(this, 0, 9999999999, 'Zip Code', true, '-');"/></td>
									</tr>
								<bean:define id="homePhone" name="AddEntity"
										property="answer(Object::Employee::homePhone)" />
									<%String hPhone=homePhone.toString();
				
										String hareaCode="";
										String hexCode="";
										String hphone="";
										if(!hPhone.equals("")&&(hPhone.length()==12)){
										hareaCode=hPhone.substring(0,3);
										hexCode=hPhone.substring(4,7);
										hphone=hPhone.substring(8,12);
										}%>
				
									<tr>
										<td class="FormLabels" align="left" height="25">Home Phone</td>
										<td class="TextMatter"><dmshtml:dms_text styleId="Homeph1"
											name="AddEntity" property="answer(HomePhoneAreaCode)" size="3"
											maxlength="3" styleClass="txtbox" value="<%=hareaCode%>"
											onkeyup="if(this.value.length==3) {document.forms[0].Homeph2.focus()}" />&nbsp;
										<dmshtml:dms_text styleId="Homeph2" name="AddEntity"
											property="answer(HomePhoneExchangeCode)" size="3"
											maxlength="3" styleClass="txtbox" value="<%=hexCode%>"
											onkeyup="if(this.value.length==3) {document.forms[0].Homeph3.focus()}" />&nbsp;
										<dmshtml:dms_text styleId="Homeph3" name="AddEntity"
											property="answer(HomePhone)" size="4" maxlength="4"
											styleClass="txtbox" value="<%=hphone%>" /></td>
									</tr>
									<bean:define id="businessPhone" name="AddEntity"
										property="answer(Object::Employee::businessPhone)" />
									<%String busPhone=businessPhone.toString();
				
										String areaCode="";
										String exCode="";
										String phone="";
										if(!busPhone.equals("")&&(busPhone.length()==12)){
										areaCode=busPhone.substring(0,3);
										exCode=busPhone.substring(4,7);
										phone=busPhone.substring(8,12);
										}%>
				
									<tr>
										<td class="FormLabels" align="left" height="25">Work Phone</td>
										<td class="TextMatter"><dmshtml:dms_text styleId="Workph1"
											name="AddEntity" property="answer(WorkPhoneAreaCode)" size="3"
											maxlength="3" styleClass="txtbox" value="<%=areaCode%>"
											onkeyup="if(this.value.length==3) {document.forms[0].Workph2.focus()}" />&nbsp;
										<dmshtml:dms_text styleId="Workph2" name="AddEntity"
											property="answer(WorkPhoneExchangeCode)" size="3"
											maxlength="3" styleClass="txtbox" value="<%=exCode%>"
											onkeyup="if(this.value.length==3) {document.forms[0].Workph3.focus()}" />&nbsp;
										<dmshtml:dms_text styleId="Workph3" name="AddEntity"
											property="answer(WorkPhone)" size="4" maxlength="4"
											styleClass="txtbox" value="<%=phone%>" /></td>
									</tr>
									<tr>
										<td align="left" class="FormLabels" height="25">
										Mail correspondence to Employee</td>
										<td class="TextMatter"><dmshtml:dms_radio name="AddEntity"
											property="answer(Object::Employee::mailCorrespondence)"
											value="Y">
											Yes
											</dmshtml:dms_radio> &nbsp;&nbsp;&nbsp; <dmshtml:dms_radio name="AddEntity"
											property="answer(Object::Employee::mailCorrespondence)"
											value="N">
											No
											</dmshtml:dms_radio></td>
									</tr>								
								</table></td></tr>

						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						
						<tr>
							<td width="380px" rowspan="3" valign="top">
							<table width="98%" align="left" CELLSPACING="0" CELLPADDING="0" class="boxed">
								<tr>
									<td class="sectionhead" colspan="2" align="center">Life Options</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td></tr>
								<tr>
									<td class="FormLabels" align="left" height="25">LIFE Option
									</td>
									<td class="TextMatter"><dmshtml:dms_checkbox name="AddEntity"
										property="answer(Object::Employee::lifeSelected)" value="1" />
									</td>
								</tr>									
								<tr>
									<td class="FormLabels" align="left" height="25">Life Term</td>
									<td class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::lifeTerm)" styleClass="txtbox" styleId="lifeTerm">
											<html:option value='5'>5 Years</html:option>
											<html:option value='10'>10 Years</html:option>
										</html:select>
									</td></tr>
								<tr>
									<td class="FormLabels" align="left" height="25">Life Amount</td>
									<td  class="TextMatter">
										<html:text name="AddEntity" property="answer(Object::Employee::lifeAmount)" maxlength="6" styleId="lifeAmount" styleClass="txtbox" onblur="javascript:validateLifeAmount(this);"/>								
									</td></tr>
								<tr>
									<td class="FormLabels" align="left" height="25">Premium Class</td>
									<td  class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::premiumClass)" styleClass="txtbox" styleId="premiumClass">
											<html:option value='P'>Preferred</html:option>
											<html:option value='S'>Standard</html:option>
										</html:select>
									</td></tr>
								<tr>
									<td class="FormLabels" align="left" height="25">Premium Payment</td>
									<td  class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::premiumPayment)" styleClass="txtbox" styleId="premiumPayment">
											<html:option value='A'>Annual</html:option>
											<html:option value='S'>Semi-Annual</html:option>
											<html:option value='Q'>Quaterly</html:option>
											<html:option value='M'>Special Monthly</html:option>
											<html:option value='P'>Payroll</html:option>
										</html:select>							
									</td></tr>
								<tr>
									<td class="FormLabels" align="left" height="25">Waiver of Premium</td>
									<td  class="TextMatter">
										<html:radio name="AddEntity" property="answer(Object::Employee::premiumWaiver)" value="Y" styleId="premiumWaiverYes">Yes</html:radio>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<html:radio name="AddEntity" property="answer(Object::Employee::premiumWaiver)" value="N" styleId="premiumWaiverNo">No</html:radio>
									</td></tr>									
								<tr>
									<td class="FormLabels" align="left" height="25">Accidental Death Benefit</td>
									<td  class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::deathBenefit)" styleClass="txtbox" styleId="deathBenefit">
											<html:option value='0.0'>none</html:option>
											<html:option value='500.0'>$500</html:option>
											<html:option value='600.0'>$600</html:option>
											<html:option value='700.0'>$700</html:option>
											<html:option value='800.0'>$800</html:option>
											<html:option value='900.0'>$900</html:option>
											<html:option value='1000.0'>$1,000</html:option>
											<html:option value='1100.0'>$1,100</html:option>
											<html:option value='1200.0'>$1,200</html:option>
											<html:option value='1300.0'>$1,300</html:option>
											<html:option value='1400.0'>$1,400</html:option>
											<html:option value='1500.0'>$1,500</html:option>																		
										</html:select>
									</td></tr>																																																															
								<tr>
									<td class="FormLabels" align="left" height="25">Death Benefit Payable Period</td>
									<td  class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::deathBenifitPayablePeriod)" styleClass="txtbox" styleId="deathBenifitPayablePeriod">
											<html:option value=''>select</html:option>
											<html:option value='60'>60 months</html:option>
											<html:option value='120'>120 months</html:option>
										</html:select>										
									</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td></tr>
								<tr>
									<td colspan="2">
									<table width="98%" align="center" CELLSPACING="0" CELLPADDING="0" class="boxed">
										<tr>
											<td class="sectionhead" colspan="2" align="center">Life Insurance Beneficiary</td></tr>
										<tr>
											<td colspan="2">&nbsp;</td></tr>							
										<tr>
											<td class="FormLabels" align="left" height="25">First
											Name</td>
											<td><dmshtml:dms_text name="AddEntity"
												property="answer(Object::Employee::lifeBeniFname)" size="13"
												maxlength="13" styleClass="txtbox" /></td>
										</tr>
										<tr>
											<td class="FormLabels" align="left" height="25">Middle
											Initial</td>
											<td><dmshtml:dms_text name="AddEntity"
												property="answer(Object::Employee::lifeBeniMname)" size="1"
												maxlength="1" styleClass="txtbox" /></td>
										</tr>
					
										<tr>
											<td class="FormLabels" align="left" height="25">Last Name</td>
											<td><dmshtml:dms_text name="AddEntity"
												property="answer(Object::Employee::lifeBeniLname)" size="13"
												maxlength="13" styleClass="txtbox" /></td>
										</tr>
										<tr>
											<td class="FormLabels" align="left" height="25">Relationship</td>
											<td class="links"><html:select name="AddEntity"
												property="answer(Object::Employee::lifeBeniRelationship)"
												styleClass="txtbox">
												<html:option value="">Select</html:option>
												<html:option value='2'>Married Spouse</html:option>
												<html:option value='3'>Male Child</html:option>
												<html:option value='4'>Female Child</html:option>
												<html:option value='B'>Brother</html:option>
												<html:option value='C'>Children, Equally</html:option>
												<html:option value='E'>Estate of the Insured</html:option>
												<html:option value='F'>Father</html:option>
												<html:option value='G'>Grandparent</html:option>
												<html:option value='I'>Immediate Family Members, Equally</html:option>
												<html:option value='M'>Mother</html:option>
												<html:option value='N'>Non-Relation</html:option>
												<html:option value='P'>Parents, Equally</html:option>
												<html:option value='R'>Relation, Other</html:option>
												<html:option value='S'>Sister</html:option>
												<html:option value='U'>Unmarried (Common Law) Spouse</html:option>
											</html:select></td>
										</tr>
										<tr>
											<td colspan="2" height="50">&nbsp;</td>
										</tr>
									</table>
									</td></tr>
								<tr><td colspan="2" height="10"></td></tr>
							</table>
							</td>
							<td width="380px" valign="top">
							<table width="98%" align="left" CELLSPACING="0" CELLPADDING="0" class="boxed">
								<tr>
									<td class="sectionhead" colspan="2" align="center">Weekly Disability Income (WDI) Options</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td></tr>
								<tr>
									<td class="FormLabels" align="left" height="25">WDI Option</td>
									<td><dmshtml:dms_checkbox name="AddEntity"
										property="answer(Object::Employee::wdiSelected)" value="1" onchange="javascript:toggleWDI(this);"/>
									<html:hidden name="AddEntity" property="answer(Object::Employee::wdi)" styleId="styleWDI"/>
									</td>
								</tr>								
								<tr>
									<td class="FormLabels" height="25">WDI Period</td>
									<td class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::wdiPeriod)" styleClass="txtbox" styleId="wdiPeriod">
											<html:option value=''>select</html:option>
											<html:option value='1'>1 Year</html:option>
											<html:option value='2'>2 Year</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" height="25">WDI Amount</td>
									<td class="TextMatter">
										<html:text name="AddEntity" property="answer(Object::Employee::wdiAmount)" styleClass="txtbox" styleId="wdiAmount" maxlength="4" onblur="validateNumRange(this, 500, 2000, 'WDI Amount');"/>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" height="25">WDI Coverage</td>
									<td class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::wdiCoverage)" styleClass="txtbox" styleId="wdiCoverage">
											<html:option value=''>select</html:option>
											<html:option value='S'>Accident and Sickness</html:option>
											<html:option value='A'>Accident Only</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" height="25">Sickness Elimination Period</td>
									<td class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::sickEliminatePeriod)" styleClass="txtbox" styleId="sickEliminatePeriod">
											<html:option value=''>select</html:option>
											<html:option value='30'>30 days</html:option>
											<html:option value='60'>60 days</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" height="25">Payment Method</td>
									<td class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::wdiPaymentMethod)" styleClass="txtbox" styleId="wdiPaymentMethod">
											<html:option value=''>select</html:option>
											<html:option value='P'>Payroll Deduction</html:option>
											<html:option value='D'>Direct Bill</html:option>
											<html:option value='B'>Bank Draft</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" height="25">Occupation Class</td>
									<td class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::occupationClass)" styleClass="txtbox" styleId="occupationClass">
											<html:option value=''>select</html:option>
											<html:option value='1'>1</html:option>
											<html:option value='2'>2</html:option>
											<html:option value='3'>3</html:option>
											<html:option value='4'>4</html:option>
										</html:select>
									</td>
								</tr>
								<!-- <tr><td colspan="2" height="10"></td></tr> -->
							</table></td>
						</tr>
						<!-- <tr><td colspan="2" height="10"></td></tr> -->
						<tr>
							<td width="380px" valign="bottom">
							<table width="98%" align="left" CELLSPACING="0" CELLPADDING="0" class="boxed">
								<tr>
									<td class="sectionhead" colspan="2" align="center">Dental Options</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td></tr>
								<tr>
									<td align="left" class="FormLabels" height="25">Dental</td>
									<td class="TextMatter">
										<dmshtml:dms_checkbox property="answer(Object::Employee::dental)" value="Y" />
								</tr>
								<tr>
									<td class="FormLabels" height="25">Dental Plan</td>
									<td class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::dentalPlan)" styleClass="txtbox" styleId="dentalPlan">
											<html:option value=''>select</html:option>
											<html:option value='SS'>Standard with Orthodontic Coverage</html:option>
											<html:option value='SO'>Standard without Orthodontic Coverage</html:option>
											<html:option value='PL'>Primary - Low Option</html:option>
											<html:option value='PH'>Primary - High Option</html:option>
											<html:option value='CL'>Comprehensive - Low Option</html:option>
											<html:option value='CH'>Comprehensive - High Option</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" height="25">Employee Involvement</td>
									<td class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::dentalEmpInvolvement)" styleClass="txtbox" styleId="dentalEmpInvolvement">
											<html:option value=''>select</html:option>
											<html:option value='V'>Voluntary</html:option>
											<html:option value='C'>Contributory</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" height="25">Current Dental Coverage</td>
									<td class="TextMatter">
										<html:radio name="AddEntity" property="answer(Object::Employee::dentalCoverage)" value="Y" styleId="dentalCoverageYes">Yes</html:radio>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<html:radio name="AddEntity" property="answer(Object::Employee::dentalCoverage)" value="N" styleId="dentalCoverageNo">No</html:radio>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" height="25">Dental Elections</td>
									<td class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::dentalElection)" styleClass="txtbox" styleId="dentalElection">
											<html:option value='EE'>Employee Only</html:option>
											<html:option value='E1'>EE + one (spouse or child)</html:option>
											<html:option value='E2'>EE + two or more</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" height="25">Industry Class</td>
									<td class="TextMatter">
										<html:select name="AddEntity" property="answer(Object::Employee::dentalIndustryClass)" styleClass="txtbox" styleId="dentalIndustryClass">
											<html:option value=''>select</html:option>
											<html:option value='1'>I</html:option>
											<html:option value='2'>II</html:option>
											<html:option value='3'>III</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td></tr>
							</table>
							</td>
						</tr>

						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
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
								<tr><td><html:hidden name="AddEntity" property="answer(Object::Employee::medicarePrimary)" value="YES" /></td></tr>
								<%
									}else{
								%>
								<tr><td><html:hidden name="AddEntity" property="answer(Object::Employee::medicarePrimary)" value="NO" /></td></tr>
								<%
									}
								%>
							</logic:present>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
					</table>
					</td>
				</tr>

				<tr>
					<td align="center"><html:submit value="Save"
						property="amswer(button)" styleClass="sbttn"
						/>&nbsp;&nbsp; <html:reset
						value="Reset" styleClass="sbttn" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr><td><html:hidden property="answer(Object::Employee::govtNumber)"
					value="" styleId="ssn1ss2ss3" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::businessPhone)"
					value="" styleId="businessPhone" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::homePhone)"
					value="" styleId="homePhone" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::signatureDate)"
					value="" styleId="signatureDate" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::emplEffectiveDate)"
					value="" styleId="emplEffectiveDate" />
				<html:hidden name="AddEntity" property="answer(Object::Employee::hireDate)" value=""
					styleId="hireDate" />
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


				<%
	String addNewEntity = request.getParameter("AddNewEntity");
	if(addNewEntity != null && addNewEntity.equalsIgnoreCase("yes"))
	{
%>
				<html:hidden property="formName" value="form::ADDEMPLOYEE" />
				<html:hidden property="AddNewEntity" value="yes" />
				<%
	} else if(addNewEntity != null && addNewEntity.equalsIgnoreCase("no"))
	{
%>
				<html:hidden property="formName" value="form::EDITEMPLOYEE" />
				<html:hidden property="AddNewEntity" value="no" />
				<%
	}
%>


				<html:hidden property="answer(Object::Employee::spouseSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::employeeSelected)" value="1" />
				<html:hidden property="answer(Object::Employee::childSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::empOnlySelected)" value="0" />
				<html:hidden property="answer(Object::Employee::empSpouseSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::empChildSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::familySelected)" value="0" />



				<html:hidden property="answer(Object::Employee::emloyeeCovCobra)" value="N" styleId="emloyeeCovCobra" />
				<html:hidden property="answer(Object::Employee::spouseCovCobra)" value="N" styleId="spouseCovCobra"/>
				<html:hidden property="answer(Object::Employee::childrenCovCobra)" value="0" styleId="childrenCovCobra"/>
				<html:hidden property="answer(Object::Employee::cobra)" value="N" />



				<html:hidden property="answer(Object::Employee::govtIdType)"
					value="SSN" />

				<html:hidden property="answer(Object::Customer::CustomerId)"
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
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	</td></tr>

			</table>
<script type="text/javascript">
<!--
if(document.forms[0].premiumWaiverYes.checked==false && document.forms[0].premiumWaiverNo.checked==false){
	document.forms[0].premiumWaiverNo.checked=true;
}
if(document.forms[0].COBRAOpted1.checked==false && document.forms[0].COBRAOpted2.checked==false){
	document.forms[0].COBRAOpted2.checked=true;
}
checkChildren();
//-->
</script>

</html:form>
<!-- /body -->
