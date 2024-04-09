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

<SCRIPT type="text/javascript">
<!--
function CloseWindow(){
top.opener.location.reload(true);
window.close();
}
//-->
</SCRIPT>
<html:form action="/ImportCensusFileUserConfirmation" enctype="multipart/form-data" >
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
		<td colspan="4"><hr size="1" noshade> </td>
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
			Failed to Upload!!  
			<%} }%>
		</td>
	</tr>


	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="false">	
	<tr>
		<td class="sectionhead">you don't have the privilage to access this page please contact administrator</td>
	</tr>
	</dmshtml:dms_static_with_connector>

	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="true">	

    
	
	<tr><td><html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/></td></tr>

	<!-- tr><td class="NewSectionHead" colspan ="2" align="center" >Census Import </td></tr -->

	<tr><td>
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="3" CELLPADDING="0">	

	<tr>
		<td colspan="4"class="TextMatter" ><FONT SIZE="2" COLOR="#000099"><B>
		<logic:present name="FileName" scope="request">
			<U><%=request.getAttribute("FileName")%></U> uploaded successfully.
		</logic:present>
	
		<logic:notPresent name="FileName" scope="request">
			<U><%=request.getParameter("answer(excelFileName)")%></U> is ready to be validated.
		</logic:notPresent>
		<BR><BR>To complete Census Import follow the steps below<BR><U>Step 1</U>. Click Validate Data and check to make sure the data is interpreted correctly<BR><U>Step 2</U>. If the data came out correctly, Click Import to complete the census import<BR></B></FONT>
		</td>
	</tr>

	<tr><td>&nbsp;</td></tr>

	<tr>
		<td  align="Left">
		<html:submit value="Validate Excel"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
		&nbsp;&nbsp;&nbsp;
		</td>
	</tr>

	<tr>
		<td align="left" class="FormLabels" height="25" width="50%">Do you want to delete all existing employees before Import:	</td>
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
		<td align="left" class="FormLabels" height="25" width="50%">Enter Starting Row # of the data in the Excel</td>
		<td class="links"><dmshtml:dms_text   property ="answer(Census::Excel::StartingRow)"  name="ExportEmployeeCensus" size="3" maxlength="3" styleClass="txtbox" value="2"/></td>
	</tr>

	<tr>
		<td align="left" class="FormLabels" height="25" width="50%">Enter Column Name where Employee First Name is stored (remove/empty if no first name in the data)</td>
		<td class="links"><dmshtml:dms_text   property ="answer(Census::Excel::FnameColumn)"  name="ExportEmployeeCensus"  size="3" maxlength="3" styleClass="txtbox" value="A"/></td>
	</tr>

	<tr>
		<td align="left" class="FormLabels" height="25" width="50%">Enter Column Name where Employee Last Name is store (remove/empty if no first name in the data) </td>
		<td class="links"><dmshtml:dms_text   property ="answer(Census::Excel::LnameColumn)"  name="ExportEmployeeCensus"  size="3" maxlength="3" styleClass="txtbox" value="B"/></td>
	</tr>

	<tr>
		<td align="left" class="FormLabels" height="25" width="50%">Enter Column Name where Employee Gender is stored</td>
		<td class="links"><dmshtml:dms_text   property ="answer(Census::Excel::GenderColumn)"  name="ExportEmployeeCensus"  size="3" maxlength="3" styleClass="txtbox" value="C"/></td>
	</tr>
	
	<tr>	
		<td class="FormLabelsLightBlue" align="left" height="25" width="50%">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;What is the Value for Male employee
		</td>
		<td class="links">
			<dmshtml:dms_text   property ="answer(Census::Excel::MaleInExcel)"  name="ExportEmployeeCensus"  size="20" maxlength="20"  styleClass="txtbox" value="M"/>
		</td>							
	</tr>
	
	<tr>
		<td class="FormLabelsLightBlue" align="left" height="25" width="50%">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;What is the Value for Female employee
		</td>
		<td class="links">
		<dmshtml:dms_text   property ="answer(Census::Excel::FeMaleInExcel)"   name="ExportEmployeeCensus" size="20" maxlength="20" styleClass="txtbox" value="F"/>
		</td>						
	</tr>
	
	<tr>
		<td align="left" class="FormLabels" height="25" width="50%">Enter Column Name where Employee Age is stored (remove/empty if no age in the data):</td>
		<td class="links"><dmshtml:dms_text   property ="answer(Census::Excel::EmployeeAgeColumn)"  name="ExportEmployeeCensus"  size="3" maxlength="3" styleClass="txtbox" value="D"/></td>								
	</tr>		

	<tr>
		<td align="left" class="FormLabels" height="25" width="50%">Enter Column Name where Employee Date of Birth is store (remove/empty if no DOB in the data):</td>
		<td class="links"><dmshtml:dms_text   property ="answer(Census::Excel::EmployeeDoBColumn)" name="ExportEmployeeCensus"   size="3" maxlength="3" styleClass="txtbox" value="E"/></td>
	</tr>
	
	<tr>
		<td class="FormLabelsLightBlue" align="left" height="25" width="50%">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;What is DOB format (if DOB is in the data)
		</td>
		<td class="links">
		<dmshtml:dms_text   property ="answer(Census::Excel::DOBInExcel)"  name="ExportEmployeeCensus"  size="20" maxlength="20" styleClass="txtbox" value="MM/DD/YYYY"/>
		</td>							
	</tr>
					
	<tr>
		<td align="left" class="FormLabels" height="25" width="50%">Enter Column Name where Employee Health Plan is stored</td>
		<td class="links"><dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanColumn)"   name="ExportEmployeeCensus"  size="3" maxlength="3" styleClass="txtbox" value="F"/></td>
	</tr>
	
	<tr>			
		<td class="FormLabelsLightBlue" align="left" height="25" width="50%">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value for Employee Only 
		</td>
		<td class="links">
		<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanEEOnlyFormat)"   name="ExportEmployeeCensus"  size="25" maxlength="25" styleClass="txtbox" value="E"/>
		</td>							
	</tr>
		
	<tr>			
		<td class="FormLabelsLightBlue" align="left" height="25" width="50%">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value for Employee and Spouse 
		</td>
		<td class="links">
		<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanEEAndSpFormat)"  name="ExportEmployeeCensus"  size="25" maxlength="25" styleClass="txtbox" value="S"/>
		</td>							
	</tr>
			
	<tr>
			
		<td class="FormLabelsLightBlue" align="left" height="25" width="50%">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value for Employee and Children 
		</td>
		<td class="links">
		<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanEEAndChFormat)"  name="ExportEmployeeCensus"  size="25" maxlength="25" styleClass="txtbox" value="C"/>
		</td>							
	</tr>
		
	<tr>	
		<td class="FormLabelsLightBlue" align="left" height="25" width="50%">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value of Family
		</td>
		<td class="links">
		<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanFamilyFormat)"  name="ExportEmployeeCensus"  size="25" maxlength="25" styleClass="txtbox" value="F"/>
		</td>							
	</tr>
		
	<tr>		
		<td class="FormLabelsLightBlue" align="left" height="25" width="50%">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value of None or Life Only 	
		</td>	
		<td class="links">
		<dmshtml:dms_text   property ="answer(Census::Excel::HealthPlanNoneFormat)"  name="ExportEmployeeCensus"  size="25" maxlength="25" styleClass="txtbox" value="N"/>
		</td>							
	</tr>
	
	<tr>
		<td align="left" class="FormLabels" height="25" width="50%">Enter Column Name where No. Of Children data is stored in the Excel</td>
		<td class="links"><dmshtml:dms_text   property ="answer(Census::Excel::NoOfChildrenColumn)"   name="ExportEmployeeCensus"  size="3" maxlength="3" styleClass="txtbox" value="G"/></td>
	</tr>		
	
	<tr>
		<td align="left" class="FormLabels" height="25" width="50%">No of Import result Records</td>
		<td class="links" align="left">
		<html:select property="answer(Census::Excel::NoofResultPerPage)"  name="ExportEmployeeCensus"  styleClass="txtbox">
			<html:option value ="1000">1000</html:option>
			<html:option value ="100">100</html:option>
			<html:option value ='-1'>Error Rows Only</html:option>
			<html:option value ='1000'>All</html:option>
		</html:select>
		</td>								
	</tr>		
	
	<tr>	
		<td  align="Left">
		<html:submit value="Validate Excel"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
		&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	</table>
	</td></tr>

	<tr><td colspan="6" >&nbsp;</td></tr>
	
	<tr><td><html:hidden property="upLoadFile" value="yes"/></td></tr>
  
  	<tr><td colspan="6" >&nbsp;</td></tr>

	<logic:present name="ExcelValidationErrorList"  scope="request" >
	<tr><td colspan="3">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr><td>&nbsp;</td></tr>
			<tr><td class="sectionheadblackbig" align="center"><u><b><%="Census Import status"%></b></u></td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class="Error" WIDTH="100%">
				<ol>
					<bean:define id="arrList" name="ExcelValidationErrorList" type="java.util.ArrayList"/>
					<logic:iterate id="errMsg" name="arrList" type="java.lang.String">
					<li>
						<%=errMsg%>
					</li>
					</logic:iterate>
				</ol>
				</td>
			</tr>
		</table>	
	</td>
	</tr>
	</logic:present >


	<bean:define id="agencyId" property="answer(Object::Agency::AgencyId)" name="ExportEmployeeCensus" scope="session"/>
	<tr><td><html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyId.toString()%>" /></td></tr>
	
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<bean:define id="excelFileName" property="answer(Census::Excel::FileName)" name="ExportEmployeeCensus" scope="session"/>
	<bean:define id="CustomerId" property="answer(Census::Excel::CustomerId)" name="ExportEmployeeCensus" scope="session"/>
	<bean:define id="CustomerName" property="answer(Census::Excel::CustomerName)" name="ExportEmployeeCensus" scope="session"/>
	<bean:define id="CustomerNumber" property="answer(Census::Excel::CustomerNumber)" name="ExportEmployeeCensus" scope="session"/>
	<bean:define id="userName" property="answer(Census::Excel::userName)" name="ExportEmployeeCensus" scope="session"/>
	
	<tr><td><html:hidden property="answer(Census::Excel::dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	
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
	<html:hidden property="answer(excelFileName)" value="<%=""+excelFileName%>"/></td></tr>



</dmshtml:dms_static_with_connector>
</table>
</html:form>
