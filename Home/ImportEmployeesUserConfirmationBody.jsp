<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/javaScript">
<!--
function validateFields(){
	var answer = window.confirm("Do you want to Import the Census?");
	if (!answer) {
		return false;
	}
	return true;

}

function CloseWindow(){
top.opener.location.reload(true);
window.close();
}
//-->
</SCRIPT>


<%java.util.ArrayList arrEmployeeTable=null;
java.util.ArrayList errorList=null;
%>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td>&nbsp;</td></tr>
		<tr><td><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>
</table>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>				

	<tr>
		<td class="MH">&nbsp;EMPLOYEE CENSUS IMPORT</td>
	</tr>
	
	<tr>
		<td colspan="4"><hr size="1" noshade ></td>
	</tr>

	<tr>
		<td class="Error" COLSPAN="2">
			<%if(request.getAttribute("Error")!=null){%>
			<%=request.getAttribute("Error")%>
			<%}%>
			<%if (request.getParameter("status")!= null) {%>
			<%if (request.getParameter("status").equals("success")) {%>
			 
			<%}%>
			<%if (request.getParameter("status").equals("failure")) {%>
			Failed to Import You cannot import an excel file intrepretation error!!  
			<%} }%>
		</td>
	</tr>

	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="false">	
		
	<tr>
		<td class="sectionhead">
			you don't have the privilage to access this page please contact administrator
		</td>
	</tr>
		
	</dmshtml:dms_static_with_connector>

	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="true">	

		<logic:present name="employeeTable" scope="request">
			<bean:define id="ImportedEmployeeDetails" name="employeeTable" type="com.dms.ejb.data.QuestionHashMap" />
				<%
					arrEmployeeTable=(java.util.ArrayList)ImportedEmployeeDetails.get("employeeTable");
					errorList=(java.util.ArrayList)ImportedEmployeeDetails.get("ERRORLIST");
				%>
		</logic:present>

		
	

	<!-- <tr><td class="NewSectionHead" colspan ="2" align="center" >Census Import </td></tr> -->

	<tr>
		<td>
		<html:form action="/ImportCensusFileUserConfirmation" enctype="multipart/form-data" >
			<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="3" CELLPADDING="0">	
			<%
				boolean imported=false;
				if(errorList.size()>0) {
				if(errorList.get(0).toString().equals("Census Imported Sucessfully.."))	{
				imported=true;
				}
			}
			if(!imported){%>
			<tr>
				<td colspan="4"class="TextMatter" >
					<FONT SIZE="2" COLOR="#000099"><B><U><%=request.getAttribute("FileName")%></U> uploaded successfully<BR><BR>To complete Census Import follow the steps below<BR><U>Step 1</U>. Click Validate Data and check to make sure the data is interpreted correctly<BR><U>Step 2</U>. If the data came out correctly, Click Import to complete the census import<BR></B></FONT>
				</td>
			</tr>
			<tr><td colspan="6" >&nbsp;</td></tr>
			<%}%>

			<%if(errorList.size()>0) {%>
			<%if(!errorList.get(0).toString().equals("Census Imported Sucessfully..")){%>
	
			<tr>
				<td  align="Left">
				<html:submit value="Validate Data"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
				<FONT SIZE="1" COLOR="#330099">(Change selection and Import Again)</FONT>
				</td>
			</tr>
			<%}
			} 
			else {%>

			<tr>
				<td  align="Left">
				<html:submit value="Validate Data"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
				<FONT SIZE="1" COLOR="#330099">(Change selection and Import Again)</FONT>
				</td>
			</tr>
			<%}%>
						
			<%if(!imported)
			{%>
			<tr>
				<td align="left" class="FormLabels" height="25" width="50%">Do you want to delete all existing employees before Import:
				</td>
				
				<td class="links" align="left">
				<html:select property="answer(Census::Excel::DeleteExistingEmployees)" styleClass="txtbox">
					<html:option value ="Yes">Yes</html:option>
					<html:option value ='No'>No</html:option>
				</html:select>
				</td>
			</tr>
								
			<tr>
				<td align="left" class="FormLabels" height="25" width="50%">Select Excel Tab/Sheet To Import</td>
				<td class="links" align="left">
					<bean:define id="sheetNamesMap" name="SheetNamesInExcel" type="com.dms.ejb.data.QuestionHashMap"/>
					<html:select property="answer(Census::Excel::SheetNumber)" >
						<%int i=0;
						boolean MoreSheets=true; 
						String SheetName="";
						while (MoreSheets) {
						SheetName=sheetNamesMap.getString("sheet"+i);%>
						<%if(!SheetName.equals("")) {%>
							<html:option value ='<%=""+i%>'><%=SheetName%></html:option>
						<%} else {
							MoreSheets=false;
						}%>
				
						<%
							i++;	
						}%>
					</html:select>
				</td>
			</tr>

			<tr>
				<td align="left" class="FormLabels" height="25" width="50%">
					Enter Starting Row # of the data in the Excel
				</td>
				
				<td class="links">
					<dmshtml:dms_text   property ="answer(Census::Excel::StartingRow)"  size="3" maxlength="3" styleClass="txtbox" />
				</td>
			</tr>

			<tr>
				<td align="left" class="FormLabels" height="25" width="50%">
					Enter Column Name where Employee First Name is stored (remove/empty if no first name in the data)
				</td>
				
				<td class="links">
					<dmshtml:dms_text   property ="answer(Census::Excel::FnameColumn)"   name="ExportEmployeeCensus" size="3" maxlength="3" styleClass="txtbox" />
				</td>
																
			</tr>

			<tr>
				<td align="left" class="FormLabels" height="25" width="50%">
					Enter Column Name where Employee Last Name is stored (remove/empty if no first name in the data)	
				</td>
	
				<td class="links"><dmshtml:dms_text   property ="answer(Census::Excel::LnameColumn)"   name="ExportEmployeeCensus" size="3" maxlength="3" styleClass="txtbox" />
				</td>
			</tr>

		<tr>
			<td align="left" class="FormLabels" height="25" width="50%">
				Enter Column Name where Employee Gender is stored
			</td>
	
			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::GenderColumn)"  name="ExportEmployeeCensus"  size="3" maxlength="3" styleClass="txtbox"/>
			</td>
		</tr>

		<tr>
			<td  class="FormLabelsLightBlue" align="left" height="25" width="50%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;What is the Value for Male employee
			</td>
		
			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::MaleInExcel)"   name="ExportEmployeeCensus"  size="20" maxlength="20" styleClass="txtbox" />
			</td>
		</tr>

		<tr>
			<td  class="FormLabelsLightBlue" align="left" height="25" width="50%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;What is the Value for Female employee
			</td>

			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::FeMaleInExcel)"  name="ExportEmployeeCensus"  size="20" maxlength="20" styleClass="txtbox"/>
			</td>
		</tr>

		<tr>
			<td align="left" class="FormLabels" height="25" width="50%">
				Enter Column Name where Employee Age is stored (remove/empty if no age in the data):
			</td>
	
			<td class="links"><dmshtml:dms_text   property ="answer(Census::Excel::EmployeeAgeColumn)"  name="ExportEmployeeCensus"  size="3" maxlength="3" styleClass="txtbox" />
			</td>
		</tr>

		<tr>
			<td align="left" class="FormLabels" height="25" width="50%">
				Enter Column Name where Employee Date of Birth is stored (remove/empty if no DOB in the data):
			</td>

			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::EmployeeDoBColumn)"  name="ExportEmployeeCensus"  size="3" maxlength="3" styleClass="txtbox" />
			</td>
		</tr>

		<tr>
			<td  class="FormLabelsLightBlue" align="left" height="25" width="50%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;What is DOB format (if DOB is in the data)
			</td>
		
			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::DOBInExcel)"  size="20" maxlength="20"  name="ExportEmployeeCensus"  styleClass="txtbox"/>
			</td>
		</tr>
					
		<tr>
			<td align="left" class="FormLabels" height="25" width="50%">
				Enter Column Name where Employee Health Plan is stored
			</td>
	
			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanColumn)"  name="ExportEmployeeCensus"  size="3" maxlength="3" styleClass="txtbox"/>
			</td>
		</tr>

		<tr>
			<td  class="FormLabelsLightBlue" align="left" height="25" width="50%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value for Employee Only
			</td>
			
			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanEEOnlyFormat)"  name="ExportEmployeeCensus"  size="25" maxlength="25" styleClass="txtbox"/>
			</td>
		</tr>

		<tr>
			<td  class="FormLabelsLightBlue" align="left" height="25" width="50%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value for Employee and Spouse 
			</td>
		
			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanEEAndSpFormat)"  name="ExportEmployeeCensus"  size="25" maxlength="25" styleClass="txtbox"/>
			</td>
		</tr>

		<tr>
			<td  class="FormLabelsLightBlue" align="left" height="25" width="50%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value for Employee and Children 
			</td>
		
			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanEEAndChFormat)"  name="ExportEmployeeCensus"  size="25" maxlength="25" styleClass="txtbox" />
			</td>
		</tr>
			
		<tr>
			<td  class="FormLabelsLightBlue" align="left" height="25" width="50%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value of Family 
			</td>

			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanFamilyFormat)"  name="ExportEmployeeCensus"  size="25" maxlength="25" styleClass="txtbox"/>
			</td>
		</tr>
			
		<tr>
			<td  class="FormLabelsLightBlue" align="left" height="25" width="50%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value of None or Life Only
			</td>
			
			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanNoneFormat)"  name="ExportEmployeeCensus"  size="25" maxlength="25" styleClass="txtbox" />
			</td>
		</tr>
			
		<tr>
			<td align="left" class="FormLabels" height="25" width="50%">
				Enter Column Name where No. Of Children data is stored in the Excel
			</td>

			<td class="links">
				<dmshtml:dms_text   property ="answer(Census::Excel::NoOfChildrenColumn)"  name="ExportEmployeeCensus"   size="3" maxlength="3" styleClass="txtbox" />
			</td>
		</tr>		

		<tr>
			<td align="left" class="FormLabels" height="25" width="50%">
				No of Import result Records
			</td>

			<td class="links" align="left">
				<html:select property="answer(Census::Excel::NoofResultPerPage)"  
						name="ExportEmployeeCensus"  styleClass="txtbox">
						<html:option value ="1000">1000</html:option>
						<html:option value ="100">100</html:option>
						<html:option value ='-1'>Error Rows Only</html:option>
						<html:option value ='1000'>All</html:option>
				</html:select>
			</td>
		</tr>		
		<%
		}%>

		<%if(errorList.size()>0) 
		{%>

		<%if(!errorList.get(0).toString().equals("Census Imported Sucessfully.."))
		{%>

		<tr>
			<td  align="Left">
				<html:submit value="Validate Data"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
				<FONT SIZE="1" COLOR="#330099">(Change selection and Import Again)</FONT>
			</td>
		</tr>
		<%}
		}
		else 
		{%>
		<tr>
			<td  align="Left">
				<html:submit value="Validate Data"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
				<FONT SIZE="1" COLOR="#330099">(Change selection and Import Again)</FONT>
			</td>
		</tr>
		<%
		}%>
	


				<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
				<bean:define id="excelFileName" property="answer(Census::Excel::FileName)" name="ExportEmployeeCensus" scope="session"/>
				<bean:define id="CustomerId" property="answer(Census::Excel::CustomerId)" name="ExportEmployeeCensus" scope="session"/>
				<bean:define id="CustomerName" property="answer(Census::Excel::CustomerName)" name="ExportEmployeeCensus" scope="session"/>
				<bean:define id="CustomerNumber" property="answer(Census::Excel::CustomerNumber)" name="ExportEmployeeCensus" scope="session"/>
				<bean:define id="userName" property="answer(Census::Excel::userName)" name="ExportEmployeeCensus" scope="session"/>

				<tr><td>
				<html:hidden property="answer(Census::Excel::dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

				<html:hidden property="answer(Object::AttachmentObjectLink::OwnerId)" value="<%=ownerId.toString()%>" />
				<html:hidden property="answer(Object::AttachmentObjectLink::ObjectType)" value="CUSTOMER" />
				<html:hidden property="answer(Object::AttachmentObjectLink::ObjectId)" value="<%=CustomerId.toString()%>" />
				<html:hidden property="answer(Object::AttachmentObjectLink::CreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::AttachmentObjectLink::UpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::AttachmentObjectLink::Status)" value="uploaded" />
				<html:hidden property="answer(Object::AttachmentObjectLink::Active)" value="Y" />
				<html:hidden property="answer(Census::Excel::ConfirmImport)" value="No" />

				<html:hidden property="answer(Object::Attachment::OwnerId)" value="<%=ownerId.toString()%>" />
				<html:hidden property="answer(Object::Attachment::AttachmentLocType)" value="HTTP" />
				<html:hidden property="answer(Object::Attachment::AttachmentObjType)" value="XLS DOCUMENT" />
				<html:hidden property="answer(Object::Attachment::AttachmentState)" value="Uploaded" />
				<!--html:hidden property="answer(Object::Attachment::AttachmentStatus)" value="Uploaded" /-->
				<html:hidden property="answer(Object::Attachment::AttachmentType)" value="Census" />
				<html:hidden property="answer(Object::Attachment::AttachmentDesc)" value="CencesDetails" />
				<html:hidden property="answer(Object::Attachment::Active)" value="Y" />
				<html:hidden property="answer(Object::Attachment::CreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Attachment::UpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(ImportType)" value="IMPORT_CENSUS" />

				<html:hidden property="CustomerName" value="<%=CustomerName.toString()%>" />
				<html:hidden property="CustomerNumber" value="<%=CustomerNumber.toString()%>" />
				<html:hidden property="userName" value="<%=userName.toString()%>" />
				<html:hidden property="CustomerId" value="<%=CustomerId.toString()%>" />
				<html:hidden property="upLoadFile" value="yes"/>
				<html:hidden property="SendMail" value="yes"/>
				<html:hidden property="answer(excelFileName)" value="<%=""+excelFileName%>"/>
				</td></tr>
    		
	</table></html:form>
	</td>
</tr>

			<tr><td>
				<html:form action="/ImportCensusFile" enctype="multipart/form-data" onsubmit="return validateFields()">
			<table>
				<tr><td colspan="6" >&nbsp;</td></tr>
				<tr><td><html:hidden property="upLoadFile" value="yes"/></td></tr>

				<tr>
					<td valign="top">
						<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
						<tr><td></td></tr>
							<%if(arrEmployeeTable.size()>0) 
							{%>				
								<tr><td colspan="8" >&nbsp;</td></tr>
								<tr>
									<td  align="right" colspan="8">
										<html:submit value="Import"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
										&nbsp;&nbsp;&nbsp;
									</td>
								</tr>								
								
								<tr>
									<td class="NewSectionHead" colspan ="10" align="center" >
										Interpreted Data View
									</td>
								</tr>
								
								<tr>
									<td class="sectionhead"  width="2%"></td>
									
									<td class="sectionhead" width="15%" align="Left">
										Col <bean:write name="ExportEmployeeCensus"  property="answer(Census::Excel::FnameColumn)" />
									</td>

									<td class="sectionhead" width="20%" align="Left">
										Col <bean:write name="ExportEmployeeCensus"  property="answer(Census::Excel::LnameColumn)" />
									</td>

									<td class="sectionhead" width="10%"  align="Left">
										Col <bean:write name="ExportEmployeeCensus"  property="answer(Census::Excel::GenderColumn)" />
									</td>

									<td class="sectionhead" width="20%" align="Left">
										Col <bean:write name="ExportEmployeeCensus"  property="answer(Census::Excel::EmployeeDoBColumn)" />
									</td>

									<td class="sectionhead" width="10%" align="Left">
										Col <bean:write name="ExportEmployeeCensus"  property="answer(Census::Excel::EmployeeAgeColumn)" />
									</td>
									
									<td class="sectionhead" width="30%" align="Left">
										Col <bean:write name="ExportEmployeeCensus"  property="answer(Census::Excel::HealthPlanColumn)" />
									</td>

									<td class="sectionhead" width="8%" align="Left">
										Col <bean:write name="ExportEmployeeCensus"  property="answer(Census::Excel::NoOfChildrenColumn)" />
									</td>	
								</tr>
								
								<tr><td class="NewSectionHead" colspan ="8" align="center" ></td></tr>
								<tr>
									<td class="sectionhead"  width="2%" align="Left">No.</td>
									<td class="sectionhead" width="20%" align="Left">First Name</td>
									<td class="sectionhead" width="15%" align="Left">Last Name</td>
									<td class="sectionhead" width="10%" align="Left">Gender</td>
									<td class="sectionhead" width="20%" align="Left">&nbsp;&nbsp;Date Of Birth<br>&nbsp;&nbsp;YYYY-&nbsp;MM-&nbsp;DD</td>
									<td class="sectionhead" width="10%" align="Left">Age</td>
									<td class="sectionhead" width="30%" align="Left">Health Plan Cov</td>
									<td class="sectionhead" width="8%" align="Left">No of Children</td>	
								</tr>
							<%
							}%>

							<%if(errorList.size()==1) 
							{%>
								<tr>
									<td COLSPAN="3">
										<FONT SIZE="2" COLOR="#CC0000">
											<%=""+errorList.get(0)%>..<BR>Change the data and Upload again
										</FONT>
									</td>
								</tr>
							<%
							} 
							else if	(errorList.size()>1) 
							{%>
								<tr>
									<td COLSPAN="3">
										<FONT SIZE="2" COLOR="#CC0000">
											<%if(errorList.get(0).toString().equals("Census Imported Sucessfully..")){%>
											Census Imported Successfully..
											<%}else
											{%>
												<%=""+errorList.get(0)%>
											<%}%>
											<BR><%=""+errorList.get(1)%><BR>
											<BR>Please do not refresh this page.
										</FONT>
									</td>
								</tr>
							<%
							}%>

							<bean:define id="NoofResultPerPage" property="answer(Census::Excel::NoofResultPerPage)" name="ExportEmployeeCensus" scope="session"/>
						
							<%if(arrEmployeeTable.size()>0) 
							{
								boolean errorsOnly=false;
								boolean errorInRow=false;
								int resultPageSize=arrEmployeeTable.size();

								if(resultPageSize>1000) {
									resultPageSize=1000;		
								}
								if(NoofResultPerPage.toString().equals("100")) {
									resultPageSize=resultPageSize;		
								} else if(NoofResultPerPage.toString().equals("1000")) {
									resultPageSize=resultPageSize;		
								}
								
								if(NoofResultPerPage.toString().equals("-1")) {//errors only
									errorsOnly=true;		
								}		
						
								int siNo=0;
								com.dms.ejb.data.QuestionHashMap employee=null;
								String gender="";
								String dob="";
								String Age="";
								String healthCareOption="";
								String numOfChildren="";
								String displyclass="";
								%>
						
								<%for (int i=0;i<resultPageSize;i++) 
								{

									employee=(com.dms.ejb.data.QuestionHashMap)arrEmployeeTable.get(i);
									gender=employee.getString("Object::Employee::gender");
									dob=employee.getString("Object::Employee::dob");
									Age=employee.getString("Object::Employee::Age");
									healthCareOption=employee.getString("Object::Employee::healthCareOption");
									numOfChildren=employee.getString("Object::Employee::numOfChildren");
									displyclass="SearchResult";
									
									if(gender=="Error" || dob=="Error" || Age=="Error" || healthCareOption=="Error" || numOfChildren=="Error" ) 
									{
										displyclass="ErrorSearchResult";
										errorInRow=true;
									}

									if(errorInRow && errorsOnly)
									{
										errorInRow=false;
										%>
								
										<tr>
											<td class="<%=displyclass%>">
												<%=++siNo%>
											</td>
						
											<td class="<%=displyclass%>" >
												<%=employee.getString("Object::Employee::fname")%>&nbsp;
											</td>

											<td class="<%=displyclass%>" >
												<%=employee.getString("Object::Employee::lname")%>&nbsp;
											</td>
													
											<td class="<%=displyclass%>" >
												<%if(!gender.equals("Error")) 
												{%>
													<%=gender%>&nbsp;
													<%
												}
												else 
												{%>
													<FONT SIZE="2" COLOR="#CC0000">Error</FONT>	&nbsp;
													<%
												}%>
											</td>

											<td class="<%=displyclass%>" >
												<%if(!dob.equals("Error")) {%>
													<%=dob%>&nbsp;
												<%} else {%>
													Error	&nbsp;
												<%}%>
											</td>

											<td class="<%=displyclass%>" >
												<%if(!Age.equals("Error")) {%>
													<%=Age%>&nbsp;
												<%} else {%>
													<FONT SIZE="2" COLOR="#CC0000">Error</FONT>	&nbsp;
												<%}%>
											</td>
										
											<td class="<%=displyclass%>" >
												<%if(!healthCareOption.equals("Error")) {%>
													<%=healthCareOption%>&nbsp;
												<%} else {%>
													<FONT SIZE="2" COLOR="#CC0000">Error</FONT>	&nbsp;
												<%}%>
											</td>
										
											<td class="<%=displyclass%>" >
												<%if(!numOfChildren.equals("Error")) {%>
													<%=numOfChildren%>&nbsp;
												<%} else {%>
													<FONT SIZE="2" COLOR="#CC0000">Error</FONT>	&nbsp;
												<%}%>
												&nbsp;
											</td>
										</tr>	
									<%
									}
									else if(!errorsOnly) 
									{%>								
										<tr>
											<td class="<%=displyclass%>">
												<%=++siNo%>
											</td>
								
											<td class="<%=displyclass%>" >
												<%=employee.getString("Object::Employee::fname")%>&nbsp;
											</td>

											<td class="<%=displyclass%>" >
												<%=employee.getString("Object::Employee::lname")%>&nbsp;
											</td>
														
											<td class="<%=displyclass%>" >
												<%if(!gender.equals("Error")) {%>
													<%=gender%>&nbsp;
												<%} else {%>
													<FONT SIZE="2" COLOR="#CC0000">Error</FONT>	&nbsp;
												<%}%>
											</td>

											<td class="<%=displyclass%>" >
												<%if(!dob.equals("Error")) {%>
													<%=dob%>&nbsp;
												<%} else {%>
													Error	&nbsp;
												<%}%>
											</td>

											<td class="<%=displyclass%>" >
												<%if(!Age.equals("Error")) {%>
													<%=Age%>&nbsp;
												<%} else {%>
													<FONT SIZE="2" COLOR="#CC0000">Error</FONT>	&nbsp;
												<%}%>
											</td>
										
											<td class="<%=displyclass%>" >
												<%if(!healthCareOption.equals("Error")) {%>
													<%=healthCareOption%>&nbsp;
												<%} else {%>
													<FONT SIZE="2" COLOR="#CC0000">Error</FONT>	&nbsp;
												<%}%>
											</td>
										
											<td class="<%=displyclass%>" >
												<%if(!numOfChildren.equals("Error")) {%>
													<%=numOfChildren%>&nbsp;
												<%} else {%>
													<FONT SIZE="2" COLOR="#CC0000">Error</FONT>	&nbsp;
												<%}%>
													&nbsp;
											</td>
										</tr>									
									<%
									}
								}
							}%>

						</table>					
					</td>
				</tr>

				<bean:define id="agencyId" property="answer(Object::Agency::AgencyId)" name="ExportEmployeeCensus" scope="session"/>
				<tr><td><html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyId.toString()%>" />

				<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
				<bean:define id="excelFileName" property="answer(Census::Excel::FileName)" name="ExportEmployeeCensus" scope="session"/>
				<bean:define id="CustomerId" property="answer(Census::Excel::CustomerId)" name="ExportEmployeeCensus" scope="session"/>
				<bean:define id="CustomerName" property="answer(Census::Excel::CustomerName)" name="ExportEmployeeCensus" scope="session"/>
				<bean:define id="CustomerNumber" property="answer(Census::Excel::CustomerNumber)" name="ExportEmployeeCensus" scope="session"/>
				<bean:define id="userName" property="answer(Census::Excel::userName)" name="ExportEmployeeCensus" scope="session"/>

				<html:hidden property="answer(Census::Excel::dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
				<bean:define id="AttachmentId" property="answer(Object::Attachment::AttachmentId)" name="ExportEmployeeCensus" scope="session"/>
				<html:hidden property="answer(Object::AttachmentObjectLink::AttachmentId)" value="<%=AttachmentId.toString()%>" />
				<html:hidden property="answer(Object::AttachmentObjectLink::OwnerId)" value="<%=ownerId.toString()%>" />
				<html:hidden property="answer(Object::AttachmentObjectLink::ObjectType)" value="CUSTOMER" />
				<html:hidden property="answer(Object::AttachmentObjectLink::ObjectId)" value="<%=CustomerId.toString()%>" />
				<html:hidden property="answer(Object::AttachmentObjectLink::CreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::AttachmentObjectLink::UpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::AttachmentObjectLink::Status)" value="uploaded" />
				<html:hidden property="answer(Object::AttachmentObjectLink::Active)" value="Y" />
				<html:hidden property="answer(Census::Excel::ConfirmImport)" value="Yes" />

				<html:hidden property="answer(Object::Attachment::OwnerId)" value="<%=ownerId.toString()%>" />
				<html:hidden property="answer(Object::Attachment::AttachmentLocType)" value="HTTP" />
				<html:hidden property="answer(Object::Attachment::AttachmentObjType)" value="XLS DOCUMENT" />
				<html:hidden property="answer(Object::Attachment::AttachmentState)" value="Imported" />
				<html:hidden property="answer(Object::Attachment::AttachmentType)" value="Census" />
				<html:hidden property="answer(Object::Attachment::AttachmentDesc)" value="CencesDetails" />
				<html:hidden property="answer(Object::Attachment::Active)" value="Y" />
				<html:hidden property="answer(Object::Attachment::CreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Attachment::UpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(ImportType)" value="IMPORT_CENSUS" />

				<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=CustomerId.toString()%>" />

				<html:hidden property="CustomerName" value="<%=CustomerName.toString()%>" />
				<html:hidden property="CustomerNumber" value="<%=CustomerNumber.toString()%>" />
				<html:hidden property="userName" value="<%=userName.toString()%>" />
				<html:hidden property="CustomerId" value="<%=CustomerId.toString()%>" />
				<html:hidden property="upLoadFile" value="yes"/>
				<html:hidden property="SendMail" value="yes"/>
				<html:hidden property="answer(excelFileName)" value="<%=""+excelFileName%>"/></td></tr>

				<%if(arrEmployeeTable.size()>0) {%>
					<tr>
						<td valign="top">
							<table width="90%" align="center" border="0" CELLSPACING="2" CELLPADDING="2">
								<tr>
									<td colspan="8" >&nbsp;</td>
				
									<td  align="right">
										<html:submit value="Import"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
									</td>
								</tr>
								<tr><td colspan="6" >&nbsp;</td></tr>
							</table>
						</td>
					</tr>
				<%}%>
			</table>
			</html:form></td></tr>
		
		</dmshtml:dms_static_with_connector>
	</table>
