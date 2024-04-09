<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>


<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="java.util.HashMap"%>


<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/container/assets/skins/sam/container-employergroup.css" />
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/assets/containerariaplugin.js"></script>

<SCRIPT SRC="../Scripts/JScripts/AddCustomer.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/SendEmail.js" type="text/javascript"> </SCRIPT>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
<SCRIPT SRC="../Scripts/JScripts/ZipCode.js" type="text/javascript"> </SCRIPT>
<SCRIPT LANGUAGE="JavaScript"	SRC="../Scripts/JScripts/IndustryFactors.js" type="text/javascript"></SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/commonPopUp.js" type="text/javascript"> </SCRIPT>

<!--begin custom header content for this example-->
<style type="text/css">
#siccodeAutoComplete {
    width:10em; /* set width here or else widget will expand to fit its container */
    padding-bottom:2em;
}
#sicAutoCompleteResContainer {
    width:30em; /* set width here or else widget will expand to fit its container */
    padding-bottom:2em;
}
</style>

<script type="text/javascript">
function GoTOAgencyFindButton(){
var formElement=document.forms[0];
formElement.action="../AgencySearchPageforEmpGroup.do?formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1";
formElement.submit();
return true;
}
</script>

<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />

<link rel="stylesheet" type="text/css" 	href="../styles/yahoo/2.4.1/build/autocomplete/assets/skins/sam/autocomplete.css" />

<jsp:include page="../common/autoCompleteScript.jsp">
	<jsp:param name="autoCompleteSqlLookupName"
		value="AUTOCOMPLETEZIPCODEADDEDITEMPLOYER" />
</jsp:include>

<%--
<body class="yui-skin-sam" onload="setvalue()">
Bug No 10900 Fixed
Modified by rajeshkumar_p@solartis.net on 07/15/2010
 --%>
<body class="yui-skin-sam" onload="setvalue();javascript:document.getElementById('EmployerGroup').BusinessName.focus();">

<bean:define id="userId" property="answer(Object::UserDetail::userName)"
	name="LoginPage" scope="session" />
<bean:define id="CustomerId" name="AddCustomer"
	property="answer(Object::Customer::CustomerId)" />

<%int dataBaseIdViewPrivillage=0;%>
<dmshtml:dms_static_with_connector ruleName='privilage'
	property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or'
	negated="true">
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>

<html:form action="/SaveEmpGroupAppl" styleId="EmployerGroup" onsubmit="return validataEmployer()" >
	<!-- onsubmit="return validateEmployerGroupFields(this.form)"-->
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
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="versionNum" value="1.0" />
	<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
	<html:hidden property="formName" value="form::LINKCUSTOMER" />
	 <bean:define	id="customerApplicationStatus"		property="answer(Object::Customer::Status)" name="AddCustomer" />
	<%
							     					String employerGroupStatus1=""+customerApplicationStatus;
							     					if(employerGroupStatus1.equalsIgnoreCase("IN_PROGRESS")){
							     						employerGroupStatus1="In Progress";
							     					}else if(employerGroupStatus1.equalsIgnoreCase("E_SUBMITTED")){
							     						employerGroupStatus1="E Submitted";
							     					}else if (employerGroupStatus1.equalsIgnoreCase("PAPER_SUBMITTED")){
							     						employerGroupStatus1="Paper Submitted";
							     					}else if (employerGroupStatus1.equalsIgnoreCase("SENT_TO_UNDERWRITING")){
							     						employerGroupStatus1="Sent to Underwriting";
							     					}else{
							     						employerGroupStatus1="";
							     					}				
												%>
		<!--<table width="300px" align="Left" border="0">
	
			<tr>
				<td class="FormLabels" align="left" colspan="1" width="160px"><%--<bean:message key="Top.EmployerGroupName"/> 
				Employer Group Name--%></td>
				<td class="FormLabels" align="left" colspan="1" width="220px"><%--<a
					href="../GetCustomerAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&customerId=<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerId)' />">
				<bean:write name='AddCustomer'
					property='answer(Object::Customer::CustomerName)' /></a>--%></td>
			</tr>
	
				<%--<td class="FormLabels" align="left" colspan="1"><bean:message
					key="Top.AgencyName" /></td>--%>
			
	
	 	<tr>
				<td class="FormLabels" align="left" colspan="1">&nbsp;</td>
				
											<td class="FormLabels" align="left"  colspan="1">
												<html:button value="Change Agency" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return GoTOAgencyFindButton()"/>
											</td>
									
			</tr>
		</table> -->
		
		<!--<table width="300px" align="right" border="0">
			 <tr>
											<td  class="FormLabels" align="left"  colspan="1" width="160px"><bean:message key="Top.GeneralAgency"/></td> 
											<td  class="FormLabels" align="left"  colspan="1" width="220px">
	
												<%if(generalagencyid2>0){%>
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="true">	
													<a href="../EditGAgencies.do?TabPanelName=Manage_Panel&ReadOnly=Yes&agencyId=<%=""+generalagencyid2%>&primaryObjectId=<%=""+generalagencyid2%>&primaryObjectType=GENERAL_AGENCY"><%=generalagencyname2%></a>
													</dmshtml:dms_static_with_connector >
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="false">
													<%=generalagencyname2%>
													</dmshtml:dms_static_with_connector >
					
													<%}%>
													<%if(dataBaseIdViewPrivillage==1) {%>
													<%="- "%><%=""+generalagencyid2%>
												<%}%>
											</td>
										</tr> 
			<tr>
				<td class="FormLabels" align="left" colspan="1"><%--<bean:message
					key="Top.AgentName" />--%></td>
				<td class="sectionhead1" align="left" colspan="2"><%if(!strAgentLName.equals("") || !strAgentFName.equals("")){%>
				<%--<%=strAgentFName%> <%=" "%><%=strAgentLName%>--%> <%}%> <%if(dataBaseIdViewPrivillage==1) {%>
			<%-- 	<%="- "%><%=""+lngAgentId1%> --%><%}%></td>
			</tr>
			
			<tr>
				 <td class="FormLabels" align="left" colspan="1">EmployerGroup Status</td>
				
				<td class="sectionhead1" align="left" colspan="2"> <%=""+employerGroupStatus1 %></td>
			</tr>
	</table>-->
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<div id="ERROR_CONTAINER"></div>
	<div id="ZIP_ERROR_CONTAINER">
	<logic:present name ='customerDetail' scope ='session'>
			<%session.removeAttribute("customerDetail"); %>
		<div id="STATUS" align="right">
		<font color="green"><b>Employer Group Information Added/Updated Successfully </b></font>						
		</div>
	</logic:present>
	<div style="padding:0 0 0 21px">
	<p class="pagehead" style="margin:0;">Employer Detail</p>
	<div style="margin:0px 0px 0px 250px" >
	<logic:present name ='arrObjectDetail' scope ='session'>
	<logic:iterate id="arrObjectDetail" name="arrObjectDetail" scope="session" >
	<bean:define id="custid" name="arrObjectDetail" property="id"/> 
	<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/> 
	<bean:define id="custEmail" property="answer(Object::Customer::EMailAddress)" name="AddCustomer"/>
	<!-- <a href="../customer/AddEmployerGroupApplication.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(teritory)=<%=""%>&Navigation=&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&tabNo=0&answer(Object::Customer::CustomerId)=<%=""+custid%>" /><font color="white">Employer Application</font></a>			 -->						
	<a href="/GetCustomerFlashUI.do?answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::Customer::EMailAddress)=<%=""+custEmail %>&answer(Object::Customer::CustomerId)=<%=""+custid%>&showEmployerPDFLink=YES" title="Click to fill up Other Employer Group Information">Group Enrollment Application</a>&nbsp;&nbsp;&nbsp;
	<a href="../QuickAllEmployeeCencus.do?customerId=<%=custid.toString()%>&SearchObjectId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::EMailAddress)=<%=""+custEmail %>&answer(Object::Customer::State)=<%=custState.toString()%>" title="Click to go to Show All Employees/Add Employee" />Census</a>&nbsp;&nbsp;&nbsp;
	<a href='../EmployerApplListPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=EMPLOYER_GROUP&answer(applicationType)=EMPLOYER&answer(applicationSubType)=<%=""%>&answer(state)=<%=""%>&answer(teritory)=<%=""%>&answer(CustomerBeanInvocation)=YES&answer(isPreview)=false&customerId=<%=custid.toString()%>&SearchObjectId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::EMailAddress)=<%=""+custEmail %>' target="_new">
				<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Employer Application PDF</a>
	</logic:iterate>
	</logic:present></div>
	<logic:present name="xmlValidationErrorList" scope="request">
					<u><b><%="XML Has been generated with following validation Errors"%></b></u>
	
	
					<ol>
						<bean:define id="arrList" name="xmlValidationErrorList"
							type="java.util.ArrayList" />
						<logic:iterate id="errMsg" name="arrList" type="java.lang.String">
							<li><%=errMsg%></li>
						</logic:iterate>
					</ol>
	</logic:present>
   
	<% boolean errorOccured=false;%>
	<bean:define id="ansmap" name="AddCustomer" property="answerMap"
		type="com.dms.ejb.data.QuestionHashMap" />
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

	<%
			if(errorOccured)
			{
				((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
			}
	%>
	<div align="right" style="margin-bottom:10px;">
		<bean:define
					id="cId" name="AddCustomer"
					property="answer(Object::Customer::CustomerId)" /> <bean:define
					id="usernameId" property="answer(Object::UserDetail::userName)"
					name="LoginPage" scope="session" /> <bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" /> <%--  ********************agency, agent, general ageny details by link ********************* --%>
	
				<bean:define id="agencyIdTemp1" name="AddCustomer"
					property="answer(Agency::AgencyId)" /> <%if(!agencyIdTemp1.toString().equals("")) {
													agencyIdTemp=agencyIdTemp1.toString();	
													lngAgencyTemp=Long.parseLong(agencyIdTemp);
													if(lngAgencyTemp>0){%> <dmshtml:Get_Agency_Details
					nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>"
					dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' /> <logic:present
					name="agencyDetail2" scope="request">
					<bean:define id="agdetail2" name="agencyDetail2" scope="request"
						type="com.dms.ejb.data.QuestionHashMap" />
					<%agencyId2=Long.parseLong(agdetail2.getString("agencyid"));%>
					<%agencyName2=agdetail2.getString("agencyname");%>
					<%generalagencyid2=Long.parseLong(agdetail2.getString("generalagencyid"));%>
					<%generalagencyname2=agdetail2.getString("generalagencyname");%>
				</logic:present> <%}%> <bean:define id="AgentId1" name="AddCustomer"
					property="answer(AgentId)" /> <%long lgAgentId1=0;
															try {
															lgAgentId1=Long.parseLong(AgentId1.toString());
														} catch(Exception ex){} %> <%if(lgAgentId1>0){%> <dmshtml:Get_Agent_Details
					nameInSession="agentDetail" agentId='<%=""+lgAgentId1%>'
					dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> <logic:present
					name="agentDetail" scope="request">
					<bean:define id="agentDetail1" name="agentDetail" scope="request"
						type="com.dms.ejb.data.QuestionHashMap" />
					<%lngAgentId1=lgAgentId1;%>
					<%strAgentFName=agentDetail1.getString("agentfname");%>
					<%strAgentLName=agentDetail1.getString("agentlname");%>
				</logic:present> <%}%> <!-- *********************************************************************************************-->
				<%}else{ %> <!-- ********************agency, agent, general ageny details by customer id *********************-->
				<%
													if(!cId.toString().equals("")){
													%> <%long agencyId=0;%> <%long lngGeneralAgencyId=0;%> <%long lngAgentId=0;%>
				<%String agencyName="";%> <%String generalAgencyName="";%> <%String agentFName="";%>
				<%String agentLName="";%> <dmshtml:Get_Customer_Agency_Agent_Details
					nameInSession="customerDetail1" customerId="<%=cId.toString()%>"
					dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' /> <logic:present
					name="customerDetail1" scope="request">
					<bean:define id="customerDetailMap" name="customerDetail1"
						scope="request" type="com.dms.ejb.data.QuestionHashMap" />
					<%try{%>
					<%agencyId=Long.parseLong(customerDetailMap.getString("agencyid"));%>
					<%}catch(Exception nfe) {agencyId=0;    }%>
					<%try{%>
					<%lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));%>
					<%}catch(Exception nfe) {lngAgentId=0;    }%>
					<%agencyName=customerDetailMap.getString("agencyname");%>
					<%agentFName=customerDetailMap.getString("agentfirstname");%>
					<%agentLName=customerDetailMap.getString("agentlastname");%>
					<%try{%>
					<%lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));%>
					<%}catch(Exception nfe) {lngGeneralAgencyId=0;    }%>
					<%generalAgencyName=customerDetailMap.getString("generalagencyname");%>
					<%agencyIdTemp=""+agencyId;
															lngAgencyTemp=Long.parseLong(agencyIdTemp);
															agencyId2=Long.parseLong(agencyIdTemp);
															agencyName2=agencyName;
															generalagencyid2=lngGeneralAgencyId;
															generalagencyname2=generalAgencyName;
															lngAgentId1=lngAgentId;
															strAgentFName=""+agentFName;
															strAgentLName=""+agentLName;
															%>
				</logic:present> <%} else {%> <!-- ************Agency agent, general agenct detail by user id ******************************-->
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent"
					ownerId="<%=Long.parseLong(""+ownerId)%>"
					dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"
					userId="<%=usernameId.toString()%>" /> <logic:present
					name="agencyIdent" scope="session">
					<bean:define id="agencyIdid" name="agencyIdent"
						type="java.lang.Long" scope="session" />
					<%
														agencyIdTemp=agencyIdid.toString();
														try {
															lngAgencyTemp=Long.parseLong(agencyIdTemp);
														} catch(Exception ex){} %>
				</logic:present> <%if(lngAgencyTemp>0){%> <dmshtml:Get_Agency_Details
					nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>"
					dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' /> <logic:present
					name="agencyDetail2" scope="request">
					<bean:define id="agdetail2" name="agencyDetail2" scope="request"
						type="com.dms.ejb.data.QuestionHashMap" />
					<% agencyId2=Long.parseLong(agdetail2.getString("agencyid"));%>
					<% agencyName2=agdetail2.getString("agencyname");%>
					<% generalagencyid2=Long.parseLong(agdetail2.getString("generalagencyid"));%>
					<% generalagencyname2=agdetail2.getString("generalagencyname");%>
				</logic:present> <%}%> <bean:define id="AgentId2" name="AddCustomer"
					property="answer(AgentId)" /> <%long lgAgentId2=0;
															try {
															lgAgentId2=Long.parseLong(AgentId2.toString());
														} catch(Exception ex){} %> <%if(lgAgentId2>0){%> <dmshtml:Get_Agent_Details
					nameInSession="agentDetail" agentId="<%=""+lgAgentId2%>"
					dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> <logic:present
					name="agentDetail" scope="request">
					<bean:define id="agentDetail1" name="agentDetail" scope="request"
						type="com.dms.ejb.data.QuestionHashMap" />
					<%lngAgentId1=lgAgentId2;%>
					<%strAgentFName=agentDetail1.getString("agentfname");%>
					<%strAgentLName=agentDetail1.getString("agentlname");%>
				</logic:present> <%}else {%> <dmshtml:Get_ObjDesc_By_UserId
					nameInSession="objectDescriptor"
					ownerId="<%=Long.parseLong(""+ownerId)%>"
					dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"
					userId="<%=usernameId.toString()%>" /> <%String objType="";%> <logic:present
					name="objectDescriptor" scope="request">
					<bean:define id="objDescType" name="objectDescriptor"
						property="objectType" />
					<bean:define id="objDescId" name="objectDescriptor"
						property="objectId" />
					<%long lgObjAgentId=0;
															try {
																lgObjAgentId=Long.parseLong(objDescId.toString());
															} catch(Exception ex){} %>
					<%if(lgObjAgentId>0){%>
					<dmshtml:Get_Agent_Details nameInSession="agentDetail"
						agentId="<%=""+objDescId%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<logic:present name="agentDetail" scope="request">
						<bean:define id="agentDetail1" name="agentDetail" scope="request"
							type="com.dms.ejb.data.QuestionHashMap" />
						<%lngAgentId1=lgObjAgentId;%>
						<%strAgentFName=agentDetail1.getString("agentfname");%>
						<%strAgentLName=agentDetail1.getString("agentlname");%>
					</logic:present>
					<%} %>
				</logic:present> <%	}%> <!--/logic:present--> <!-- ****************************************************************************************** -->
				<%}%> <%}%> <!-- GENERAL BLOCK --> <%if(agencyId2>0){ %> <dmshtml:dms_static_with_connector
					ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>'
					connector='or' negated="true">
					<a
						href="../EditAgencies.do?TabPanelName=Manage_Panel&ReadOnly=Yes&agencyId=<%=""+agencyId2%>&primaryObjectId=<%=""+agencyId2%> &primaryObjectType=AGENCY"><%=agencyName2%></a>&nbsp;&nbsp;
				</dmshtml:dms_static_with_connector> <dmshtml:dms_static_with_connector
					ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>'
					connector='or' negated="false">
					<%--<a><%=agencyName2%></a>--%>
				</dmshtml:dms_static_with_connector> <%}%> <%if(dataBaseIdViewPrivillage==1) {%>
				<%--<%="- "%><%=""+agencyId2%> --%><%}%>
	

	</div>

	<p style="width:700px;margin:5px 5px 5px 0;" align="justify">To add or edit employer detail, fill out the form below or make the required changes. Be sure to click 'SAVE' when you are done. Required fields are marked with an '<span
		class="star">*</span>'.</p>
		
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_INSURED_AGENCY"}%>' connector='or' negated="true">
		<div class="field"><b>Agency Details</b></div>
		<div class="field">	Agency Name							
				<html:text  name="AddCustomer" property ="answer(AgencyName)" style="width:190px;margin:0px 0px 0px 355px;" value='<%=agencyName2%>'  size="30" maxlength="30"/>	
				<input	type="button"	onclick="return GoTOAgencyFindButton()"	value="Find" name="B1" class="button" style="width:60px; height:22px">																		
		</div>
	</dmshtml:dms_static_with_connector>


	<%if(dataBaseIdViewPrivillage==1) {%>
	<div class="field"><p>Employer Group Id</p>
	<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerId)' />
	</div>
	<%}%>
	
	<%--  
	<div class="field"><p>Business name</p> <span class="star">*</span><html:text
		name="AddCustomer" property="answer(Object::Customer::CustomerName)"
		style="width:250px;margin:0px 0px 0px 292px;" styleId="BusinessName" size="30" maxlength="125" tabindex="0"/></div>

	<div class="field"><p>Has this business ever been known by another name? </p>
	<html:radio style="margin:-2px 0px 0px 47px;" tabindex="1"
		name="AddCustomer"
		property="answer(Object::CustomerAdditional::BusinessKnownByAnotherName)" styleId="AnotherNameY"
		value="Y" onclick="EnableBusinessEvent()">Yes</html:radio> <html:radio
		style="margin:0px 0px 0px 25px;" name="AddCustomer" styleId="anotherNameN"
		property="answer(Object::CustomerAdditional::BusinessKnownByAnotherName)"
		value="N" onclick="DisableBusinessEvent()" styleId="AnotherNameN">No</html:radio></div>
	
	<div class="field"><p>If yes, what name?</p><html:text name="AddCustomer"
		property="answer(Object::CustomerAdditional::CutomerAnotherName)"
		style="width:250px;margin:0px 0px 0px 305px;"
		styleId="BusinessAnotherName" size="30" maxlength="125"/></div>
	<bean:define id="customerIdForEmail" name="AddCustomer"	property="answer(Object::Customer::CustomerId)" />
	<bean:define id="customerBusinessName" name="AddCustomer" property="answer(Object::Customer::CustomerName)" />
	<bean:define id="customermailId" name="AddCustomer"	property="answer(Object::Customer::EMailAddress)" />
	<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
	<bean:define id="roleName"	property="answer(Object::UserDetail::roleName)" name="LoginPage"	scope="session" />

	<%customerBusinessName=(""+customerBusinessName).replaceAll("'","\\\\'"); %>
	<script type="text/javascript">
		var customerName = escape('<%=""+customerBusinessName%>');
	</script>
	
	<div class="field"><p>Primary Contact E-mail</p><span class="star">*</span><html:text
		name="AddCustomer" property="answer(Object::Customer::EMailAddress)"
		style="width:250px;margin:0px 0px 0px 275px;"
		onblur="return validateAccount()" styleId="EmailId" maxlength="75" />
	<div id="AJAX_INDICATOR" style="display:none"><IMG
		SRC="../Images/loader1.gif" BORDER="0" align="top" id="loader">
	Validating EmailId...</div>
	<dmshtml:dms_static_with_connector ruleName='privilage'
		property='<%=new String[]{"CREATE_CUSTOMER_USER"}%>' connector='or'
		negated="true">
		<%if((""+customerIdForEmail).length()>0) {%>
		<a href="javaScript:void(0)"><IMG SRC="../Images/mail1.jpg"
			onclick="EmailPopup('../ComposeMail1.do?answer(Object::Notification::Email::ObjectId)=<%=""+customerIdForEmail%>&answer(Object::Customer::CustomerName)='+customerName+'&answer(Object::Notification::UserDetail::ToEmail)=<%=""+customermailId %>&answer(Object::Notification::UserDetail::Email)=<%=""+email%>&answer(Object::Notification::UserDetail::RoleName)=<%=""+roleName%>&answer(Object::Notification::Email::ObjectVerId)=<%="0"%>&answer(Object::Notification::Email::ObjectType)=EMPLOYER&answer(Object::Notification::Email::NotificationType)=<%="EMAIL"%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(Object::Notification::Email::EmailPurpose)=COSE_INIVITATION_EMPLOYER','Email')"
			BORDER="0" align="top" id="emailIMG"></a>
		<%} %>
	</dmshtml:dms_static_with_connector></div>
	
	<div class="field"><p>Confirm Primary Contact E-mail</p><span class="star">*</span><html:text
		property="answer(ConfirmEMailAddress)" value="<%=""+customermailId %>"
		size="30" styleId="ConfirmEmailId" maxlength="75" style="width:250px;margin:0px 0px 0px 222px;" /></div>
	
	<div class="field"><p>COSE Membership #</p><html:text name="AddCustomer"
		property="answer(Object::Customer::CustomerNumber)"
		styleId="CoseMemberShipNo"
		style="width:250px;margin:0px 0px 0px 296px;" size="30" maxlength="30"/></div>
	
	<div class="field"><p>Business Address (No P.O. Boxes)</p><html:textarea styleId="BusinessAddress" style="float:left;width:250px;margin:0px 0px 5px 213px;" name="AddCustomer" property="answer(Object::CustomerAdditional::BusinessAddress)" rows="3" cols="21" /></div>
	
	<div class="field"><p>If Billing address is same as Business address then
	check <br> the Box</p><html:checkbox name="AddCustomer"
		property="answer(Object::CustomerAdditional::isSameAsBusinessAddress)"
		value="Yes" styleId="setBillingAddressId"
		onclick="setBillingAddress();" style="margin:0px 0px 0px 10px;" /></div>
	
	<div class="field"><p>Billing Address</p><html:textarea
		style="width:250px;margin:0px 0px 0px 335px;" styleId="BillingAddress"
		name="AddCustomer"
		property="answer(Object::CustomerAdditional::BillingAddress)" rows="3"
		cols="21" /></div>
	
		
	<jsp:include page="../common/AutoCompleteZipcode.jsp">
		<jsp:param name="autoCompleteSqlLookupName" value="AUTOCOMPLETEZIPCODEEMPLOYERSTATEOH" />
	</jsp:include>
	</div>
		
	<%-- <div class="field"><p>Zip Code</p><html:text name="AddCustomer"
		property="answer(Object::Customer::Zip)"
		style="width:70px;margin:0px 0px 0px 395px;" styleId="Zip" />&nbsp; <a
		href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes"
		id="zipLink" title="Search for zip code, state, county" /></a><input
		type="button"
		onclick="return ZipCodePopup(document.getElementById('zipLink'), 'ZipCode');"
		value="Find" name="B1" class="button" style="width:60px; height:22px"></div>
	
	<div class="field"><p>City</p><html:text name="AddCustomer"
		property="answer(Object::Customer::City)"
		style="width:150px;margin:0px 0px 0px 427px;" styleId="cityFromDB" /></div>
	
	<div class="field"><p>County</p><html:text name="AddCustomer"
		property="answer(Object::Customer::County)"
		style="width:150px;margin:0px 0px 0px 405px;" styleId="countyFromDB" /></div>
	
	<div style="padding:0 0 0 21px">
	<div class="field"><p>State</p><dmshtml:get_type nameInSession="arStates"
		dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> <html:select
		style="width:150px;margin:0px 0px 0px 390px;"
		property="answer(Object::Customer::State)" styleId="State">
		<html:option value="OH">Ohio</html:option>
	</html:select></div>

	<div class="field"><p>Country</p><dmshtml:get_type nameInSession="arStates"
		dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> <html:select
		property="answer(Object::Customer::Address::Country)"
		style="width:150px;margin:0px 0px 0px 375px;" styleId="Country">
		<html:option value="USA">USA</html:option>
	</html:select></div>
	
	<div id="dialog1" style='display:none;'>
		<div class="hd"><p>Enter Your Notes Here</p></div>
				<div class="bd">
						 <h6>Notes Description:</h6>
				         <input type = text name="answer(Object::Notes::Description)" id="notesDesc" size="50" maxlength="54" />
											         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal View Only 
				        <input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/> </td>
					   <h6>Notes:</h6>
		  				<div id="text">
			  					 <textarea  name="answer(Object::Notes::Notes)" id="editor" rows="6" cols="80"> </textarea> 
				  		</div> 
						<html:button property="Save" value=" Save " styleClass="uibutton"  styleId="save" onmouseover="" />
  						<html:button property="Cancel" value="Cancel" styleClass="uibutton" styleId="cancel" />
					</div>
	</div>
	
	<div class="field"><p>Chief Executive Officer</p><html:text name="AddCustomer"
		property="answer(Object::CustomerAdditional::ExecutiveOfficer)"
		style="width:250px;margin:0px 0px 0px 285px;" size="30" maxlength="30"/></div>
	
	<div class="field"><p>Billing Contact</p><html:text name="AddCustomer"
		property="answer(Object::CustomerAdditional::BillingContact)"
		style="width:250px;margin:0px 0px 0px 338px;" size="30" maxlength="30"/></div>
	
	<div class="field"><p>Business Phone Number</p><span class="star">*</span> 
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneAreaCode)"	style="width:60px;margin:0px 0px 0px 262px;"  styleId="PhoneNumber1"	 size="3" maxlength="3" onkeyup="if(this.value.length==3) {document.getElementById('EmployerGroup').PhoneNumber2.focus()}" />&nbsp;
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneExchangeCode)"	style="width:60px;" styleId="PhoneNumber2" size="3" maxlength="3" onkeyup="if(this.value.length==3) {document.getElementById('EmployerGroup').PhoneNumber3.focus()}" />&nbsp;
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhone)"	styleId="PhoneNumber3" style="width:60px;" size="4" maxlength="4"/>
	</div>
	
	<div class="field"><p>Business Fax Number</p>
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxAreaCode)"	style="width:60px;margin:0px 0px 0px 293px;" styleId="FaxNumber1" size="3" maxlength="3"	onkeyup="if(this.value.length==3) {document.getElementById('EmployerGroup').FaxNumber2.focus()}" />&nbsp;
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxExchangeCode)" style="width:60px;" styleId="FaxNumber2"	size="3" maxlength="3" onkeyup="if(this.value.length==3) {document.getElementById('EmployerGroup').FaxNumber3.focus()}" />&nbsp;
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::Fax)" styleId="FaxNumber3" style="width:60px;" size="4" maxlength="4" />
	</div>
	
	<div class="field"><p>Number of years in business</p><html:text
		name="AddCustomer"
		property="answer(Object::CustomerAdditional::NumberofYrsInBusiness)"
		style="width:250px;margin:0px 0px 0px 250px;"
		styleId="YearsInBussiness" 
		size="3" maxlength="3" /></div>
	
	<div class="field"><p>If less than one year specify the date the business
	started</p><bean:define id="bisStatrDate" name="AddCustomer"
		property="answer(Object::CustomerAdditional::BusinessStartDate)" /> <%
							String month="01";
							String busdate="";
							String year="2007";							
							if(!(""+bisStatrDate).equals("")){
								String date[] = (""+bisStatrDate).split("/");
								month=date[1];
								busdate=date[2];
								year=date[0];								
							}
							
							%> <html:select property="answer(BusinessStartMonth)"
		style="width:90px;margin:0px 0px 0px 57px;" value="<%=""+month %>"
		styleId="BusinessStartMonth">
		<html:option value="01">January</html:option>
		<html:option value="02">February</html:option>
		<html:option value="03">March</html:option>
		<html:option value="04">April</html:option>
		<html:option value="05">May</html:option>
		<html:option value="06">June</html:option>
		<html:option value="07">July</html:option>
		<html:option value="08">August</html:option>
		<html:option value="09">September</html:option>
		<html:option value="10">October</html:option>
		<html:option value="11">November</html:option>
		<html:option value="12">December</html:option>
	</html:select> <html:text style="width:40px;"
		property="answer(BusinessStartDate)" size="2" value="<%=""+busdate%>"
		maxlength="2" styleId="BusinessStartDate" /> <html:select
		style="width:60px;" property="answer(BusinessStartYear)"
		value="<%=""+year%>" styleId="BusinessStartYear">
		<html:option value="2007">2007</html:option>
		<html:option value="2008">2008</html:option>
		<html:option value="2009">2009</html:option>
		<html:option value="2010">2010</html:option>
		<html:option value="2011">2011</html:option>
		<html:option value="2012">2012</html:option>
	</html:select></div>
	
	<div class="field"><p>Type of Business (be specific)</p><html:textarea
		name="AddCustomer"
		property="answer(Object::CustomerAdditional::BusinessType)" rows="3"
		cols="60" style="width:250px;margin:0px 0px 0px 245px;" 
		/></div>
		
		
	
	<%--<div class="field"><p>SIC Code</p><html:text name="AddCustomer"
		property="answer(Object::CustomerAdditional::SicCode)"
		style="float:left;width:60px;margin:0px 0px 0px 393px;" styleId="sicCode"
		onblur="setvalue()" /></div>
		
	<jsp:include page="../common/AutoCompleteSICLookup.jsp">  
			<jsp:param name="autoCompleteSqlLookupName" value="AUTOCOMPLETESICCODE" />
	</jsp:include>
	
	
	<div class="field"><p>SIC Division</p><html:select
		property="answer(Object::CustomerAdditional::SicDivision)"
		style="width:250px;margin:0px 0px 0px 355px;" name="AddCustomer"
		styleId="sicDiv" onchange="setGroup(this);">
		<html:option value="">Please Select SIC Division</html:option>
		<html:option value='0'>Agriculture, Forestry & Fishing</html:option>
		<html:option value='1'>Mining</html:option>
		<html:option value='2'>Construction</html:option>
		<html:option value='3'>Manufacturing</html:option>
		<html:option value='4'>Transportation</html:option>
		<html:option value='5'>Pipelines, except Nat. Gas & Freight Forwarding</html:option>
		<html:option value='6'>Transportation Services</html:option>
		<html:option value='7'>Communication</html:option>
		<html:option value='8'>Electric, Gas & Sanitary Services</html:option>
		<html:option value='9'>Wholesale Trade</html:option>
		<html:option value='10'>Retail Trade</html:option>
		<html:option value='11'>Finance, Insurance, & Real Estate</html:option>
		<html:option value='12'>Services</html:option>
		<html:option value='13'>Public Administration</html:option>
	</html:select></div>
	
	<div class="field"><p>SIC Group</p><html:select styleClass="txtbox"
		property="answer(Object::CustomerAdditional::SicGroup)"
		style="width:250px;margin:0px 0px 0px 364px;" name="AddCustomer"
		styleClass="txtbox" styleId="sicGroup" onchange='setIndustry(this);'>
		<html:option value="">Please Select a SIC Group</html:option>
	</html:select></div>
	
	<div class="field"><p>SIC Industry</p><html:select styleClass="txtbox"
		style="width:250px;margin:0px 0px 0px 351px;"
		property="answer(Object::CustomerAdditional::SicIndustry)"
		name="AddCustomer" styleClass="txtbox" styleId="sicIndus"
		onchange='setSiccode(this);'>
		<option value="">Please Select SIC Industry</option>
	</html:select></div>
	
	
	<div class="field"><p>Employer/Federal Tax ID #</p><html:text
		name="AddCustomer"
		property="answer(Object::CustomerAdditional::FederalTaxId)"
		style="width:100px;margin:0px 0px 0px 261px;" 
		size="30" maxlength="11" /></div>
	
	<div class="field"><p>Do you have any affiliations with other companies or
	unions</p> <html:radio name="AddCustomer" style="margin:0px 0px 0px 49px;"
		property="answer(Object::CustomerAdditional::AnyAffiliationWithOtherCompanies)"
		value="Y" onclick="enableAffEvent()">Yes</html:radio> <html:radio name="AddCustomer"
		style="margin:0px 0px 0px 25px;" 
		property="answer(Object::CustomerAdditional::AnyAffiliationWithOtherCompanies)" styleId="AffilN"
		value="N" onclick="disableAffEvent()">No</html:radio></div>
	
	<div class="field"><p>If yes, please describe</p> <html:textarea
		name="AddCustomer"
		property="answer(Object::CustomerAdditional::Affliations)"
		style="width:250px;margin:0px 0px 0px 288px;" rows="3" cols="60" styleId="AffUnion"/></div>

	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' connector='or' negated="true">	
		<div class="field"><p>Active</p><html:select property="answer(Object::Customer::active)" style="width:170px;margin:0px 0px 0px 395px;" >
										<html:option value ="Y">Yes</html:option>
										<html:option value ='D'>No</html:option>
									</html:select>
		</div>
	</dmshtml:dms_static_with_connector>
	
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_EMPLOYER_STATUS"}%>' connector='or' negated="true">	
		<div class="field"><p>Employer Status</p>	<html:select  property="answer(Object::Customer::Status)" style="width:130px;margin:0px 0px 0px 328px;" styleId="CustomerStatus" value="<%=""+CustomerStatus1 %>">						
									<%if(!customerStatus.equalsIgnoreCase("SENT_TO_UNDERWRITING")){ %>
										<html:option value="IN_PROGRESS" styleId="IN_PROGRESS">In Progress</html:option>	
									<%if(!customerStatus.equalsIgnoreCase("PAPER_SUBMITTED")){ %>	
										<html:option value="E_SUBMITTED"  styleId="E_SUBMITTED" disabled="<%=isEnabled%>"> E Submitted</html:option>
									<%}%>	
				 					<%if(!customerStatus.equalsIgnoreCase("E_SUBMITTED")){ %>
										<html:option value="PAPER_SUBMITTED" styleId="PAPER_SUBMITTED" disabled="<%=isEnabled%>">Paper Submitted</html:option>
									<%}} if(!customerStatus.equalsIgnoreCase("IN_PROGRESS")) {%>
										<html:option value="SENT_TO_UNDERWRITING" styleId="SENT_TO_UNDERWRITING" disabled="<%=isEnabled%>">Sent to Underwriting </html:option>
									<%} %>	
								</html:select>
			</div>
	</dmshtml:dms_static_with_connector>
	<p>&nbsp;</p>
	<p align="center">
		<html:reset	value=" " onmouseover="style.cursor='hand'" styleClass="resetbutton" />
		<html:submit value=" " styleClass="submitbutton"
		onmouseover="style.cursor='hand'" property="amswer(button)" />
	</p>
	
	Bug No 10900 fixed.
	Modified by rajeshkumar_p@solartis.net on 07/15/2010--%>
	
	<div class="field"><p>Business name</p> <span class="star">*</span><html:text
		name="AddCustomer" property="answer(Object::Customer::CustomerName)"
		style="width:250px;margin:0px 0px 0px 292px;" styleId="BusinessName" size="30" maxlength="125" tabindex="1"/></div>

	<div class="field"><p>Has this business ever been known by another name? </p>
	<html:radio style="margin:-2px 0px 0px 47px;" tabindex="2"
		name="AddCustomer"
		property="answer(Object::CustomerAdditional::BusinessKnownByAnotherName)" styleId="AnotherNameY"
		value="Y" onclick="EnableBusinessEvent()">Yes</html:radio> <html:radio
		style="margin:-2px 0px 0px 8px;" tabindex="3" name="AddCustomer" styleId="anotherNameN"
		property="answer(Object::CustomerAdditional::BusinessKnownByAnotherName)"
		value="N" onclick="DisableBusinessEvent()" styleId="AnotherNameN">No</html:radio></div>
	
	<div class="field"><p>If yes, what name?</p><html:text name="AddCustomer"
		property="answer(Object::CustomerAdditional::CutomerAnotherName)"
		style="width:250px;margin:-2px 0px 0px 275px;"
		styleId="BusinessAnotherName" size="30" maxlength="125" tabindex="4"/></div>
	<bean:define id="customerIdForEmail" name="AddCustomer"	property="answer(Object::Customer::CustomerId)" />
	<bean:define id="customerBusinessName" name="AddCustomer" property="answer(Object::Customer::CustomerName)" />
	<bean:define id="customermailId" name="AddCustomer"	property="answer(Object::Customer::EMailAddress)" />
	<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
	<bean:define id="roleName"	property="answer(Object::UserDetail::roleName)" name="LoginPage"	scope="session" />

	<%customerBusinessName=(""+customerBusinessName).replaceAll("'","\\\\'"); %>
	<script type="text/javascript">
		var customerName = escape('<%=""+customerBusinessName%>');
	</script>
	
	<div class="field"><p>Primary Contact E-mail</p><span class="star">*</span><html:text
		name="AddCustomer" property="answer(Object::Customer::EMailAddress)"
		style="width:250px;margin:-2px 0px 0px 246px;"
		onblur="return validateAccount()" styleId="EmailId" maxlength="75" tabindex="5"/>
	<div id="AJAX_INDICATOR" style="display:none"><IMG
		SRC="../Images/loader1.gif" BORDER="0" align="top" id="loader">
	Validating EmailId...</div>
	<dmshtml:dms_static_with_connector ruleName='privilage'
		property='<%=new String[]{"CREATE_CUSTOMER_USER"}%>' connector='or'
		negated="true">
		<%if((""+customerIdForEmail).length()>0) {%>
		<a href="javaScript:void(0)"><IMG SRC="../Images/mail1.jpg"
			onclick="EmailPopup('../ComposeMail1.do?answer(Object::Notification::Email::ObjectId)=<%=""+customerIdForEmail%>&answer(Object::Customer::CustomerName)='+customerName+'&answer(Object::Notification::UserDetail::ToEmail)=<%=""+customermailId %>&answer(Object::Notification::UserDetail::Email)=<%=""+email%>&answer(Object::Notification::UserDetail::RoleName)=<%=""+roleName%>&answer(Object::Notification::Email::ObjectVerId)=<%="0"%>&answer(Object::Notification::Email::ObjectType)=EMPLOYER&answer(Object::Notification::Email::NotificationType)=<%="EMAIL"%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(Object::Notification::Email::EmailPurpose)=COSE_INIVITATION_EMPLOYER','Email')"
			BORDER="0" align="top" id="emailIMG"></a>
		<%} %>
	</dmshtml:dms_static_with_connector></div>
	
	<div class="field"><p>Confirm Primary Contact E-mail</p><span class="star">*</span><html:text
		property="answer(ConfirmEMailAddress)" value="<%=""+customermailId %>"
		size="30" styleId="ConfirmEmailId" maxlength="75" style="width:250px;margin:0px 0px 0px 194px;" tabindex="6" /></div>
	
	<div class="field"><p>COSE Membership #</p><html:text name="AddCustomer"
		property="answer(Object::Customer::CustomerNumber)"
		styleId="CoseMemberShipNo"
		style="width:250px;margin:0px 0px 0px 267px;" size="30" maxlength="30" tabindex="7"/></div>
	
	<div class="field"><p>Business Address (No P.O. Boxes)</p><html:textarea styleId="BusinessAddress" style="float:left;width:250px;margin:0px 0px 5px 185px;" name="AddCustomer" property="answer(Object::CustomerAdditional::BusinessAddress)" rows="3" cols="21" tabindex="8"/></div>
	
	<div class="field"><p>If Billing address is same as Business address then
	check <br> the Box</p><html:checkbox name="AddCustomer"
		property="answer(Object::CustomerAdditional::isSameAsBusinessAddress)"
		value="Yes" styleId="setBillingAddressId"
		onclick="setBillingAddress();" style="margin:-3px 0px 0px 30px;" tabindex="9" /></div>
	
	<div class="field"><p>Billing Address</p><html:textarea
		style="width:250px;margin:0px 0px 0px 305px;" styleId="BillingAddress"
		name="AddCustomer"
		property="answer(Object::CustomerAdditional::BillingAddress)" rows="3"
		cols="21" tabindex="10"/></div>
	
		
	<jsp:include page="../common/AutoCompleteZipcode.jsp">
		<jsp:param name="autoCompleteSqlLookupName" value="AUTOCOMPLETEZIPCODEEMPLOYERSTATEOH" />
	</jsp:include>
	</div>
		
	<%-- <div class="field"><p>Zip Code</p><html:text name="AddCustomer"
		property="answer(Object::Customer::Zip)"
		style="width:70px;margin:0px 0px 0px 395px;" styleId="Zip" />&nbsp; <a
		href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes"
		id="zipLink" title="Search for zip code, state, county" /></a><input
		type="button"
		onclick="return ZipCodePopup(document.getElementById('zipLink'), 'ZipCode');"
		value="Find" name="B1" class="button" style="width:60px; height:22px"></div>
	
	<div class="field"><p>City</p><html:text name="AddCustomer"
		property="answer(Object::Customer::City)"
		style="width:150px;margin:0px 0px 0px 427px;" styleId="cityFromDB" /></div>
	
	<div class="field"><p>County</p><html:text name="AddCustomer"
		property="answer(Object::Customer::County)"
		style="width:150px;margin:0px 0px 0px 405px;" styleId="countyFromDB" /></div>
	--%>
	<div style="padding:0 0 0 21px">
	<div class="field"><p>State</p><dmshtml:get_type nameInSession="arStates"
		dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> <html:select
		style="width:150px;margin:0px 0px 0px 362px;"
		property="answer(Object::Customer::State)" styleId="State" >
		<html:option value="OH">Ohio</html:option>
	</html:select></div>

	<div class="field"><p>Country</p><dmshtml:get_type nameInSession="arStates"
		dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> <html:select
		property="answer(Object::Customer::Address::Country)"
		style="width:150px;margin:0px 0px 0px 346px;" styleId="Country" >
		<html:option value="USA">USA</html:option>
	</html:select></div>
	
	<div id="dialog1" style='display:none;'>
		<div class="hd"><p>Enter Your Notes Here</p></div>
				<div class="bd">
						 <h6>Notes Description:</h6>
				         <input type = text name="answer(Object::Notes::Description)" id="notesDesc" size="50" maxlength="54" />
											         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal View Only 
				        <input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/> </td>
					   <h6>Notes:</h6>
		  				<div id="text">
			  					 <textarea  name="answer(Object::Notes::Notes)" id="editor" rows="6" cols="80"> </textarea> 
				  		</div> 
						<html:button property="Save" value=" Save " styleClass="uibutton"  styleId="save" onmouseover="" />
  						<html:button property="Cancel" value="Cancel" styleClass="uibutton" styleId="cancel" />
					</div>
	</div>
	
	<div class="field"><p>Chief Executive Officer</p><html:text name="AddCustomer"
		property="answer(Object::CustomerAdditional::ExecutiveOfficer)"
		style="width:250px;margin:0px 0px 0px 256px;" size="30" maxlength="30" tabindex="14"/></div>
	
	<div class="field"><p>Billing Contact</p><html:text name="AddCustomer"
		property="answer(Object::CustomerAdditional::BillingContact)"
		style="width:250px;margin:-2px 0px 0px 307px;" size="30" maxlength="30" tabindex="15"/></div>
	
	<div class="field"><p>Business Phone Number</p><span class="star">*</span> 
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneAreaCode)"	style="width:60px;margin:0px 0px 0px 231px;"  styleId="PhoneNumber1" tabindex="16"	 size="3" maxlength="3" onkeyup="if(this.value.length==3) {document.getElementById('EmployerGroup').PhoneNumber2.focus()}" />&nbsp;
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneExchangeCode)"	style="width:60px;" styleId="PhoneNumber2" size="3" maxlength="3" tabindex="17" onkeyup="if(this.value.length==3) {document.getElementById('EmployerGroup').PhoneNumber3.focus()}" />&nbsp;
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhone)"	styleId="PhoneNumber3" style="width:60px;" size="4" maxlength="4" tabindex="18" />
	</div>
	
	<div class="field"><p>Business Fax Number</p>
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxAreaCode)"	style="width:60px;margin:0px 0px 0px 261px;" styleId="FaxNumber1"  tabindex="19" size="3" maxlength="3"	onkeyup="if(this.value.length==3) {document.getElementById('EmployerGroup').FaxNumber2.focus()}" />&nbsp;
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxExchangeCode)" style="width:60px;" styleId="FaxNumber2" tabindex="20"	size="3" maxlength="3" onkeyup="if(this.value.length==3) {document.getElementById('EmployerGroup').FaxNumber3.focus()}" />&nbsp;
		<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::Fax)" styleId="FaxNumber3" style="width:60px;" size="4" maxlength="4" tabindex="21" />
	</div>
	
	<div class="field"><p>Number of years in business</p><html:text
		name="AddCustomer"
		property="answer(Object::CustomerAdditional::NumberofYrsInBusiness)"
		style="width:250px;margin:0px 0px 0px 217px;"
		styleId="YearsInBussiness" 
		size="3" maxlength="3" tabindex="22"/></div>
	
	<div class="field"><p>If less than one year specify the date the business
	started</p><bean:define id="bisStatrDate" name="AddCustomer"
		property="answer(Object::CustomerAdditional::BusinessStartDate)" /> <%
							String month="01";
							String busdate="";
							String year="2007";							
							if(!(""+bisStatrDate).equals("")){
								String date[] = (""+bisStatrDate).split("/");
								month=date[1];
								busdate=date[2];
								year=date[0];								
							}
							
							%> <html:select property="answer(BusinessStartMonth)"
		style="width:90px;margin:0px 0px 0px 25px;" value="<%=""+month %>"
		styleId="BusinessStartMonth" tabindex="23">
		<html:option value="01">January</html:option>
		<html:option value="02">February</html:option>
		<html:option value="03">March</html:option>
		<html:option value="04">April</html:option>
		<html:option value="05">May</html:option>
		<html:option value="06">June</html:option>
		<html:option value="07">July</html:option>
		<html:option value="08">August</html:option>
		<html:option value="09">September</html:option>
		<html:option value="10">October</html:option>
		<html:option value="11">November</html:option>
		<html:option value="12">December</html:option>
	</html:select> <html:text style="width:40px;" tabindex="24"
		property="answer(BusinessStartDate)" size="2" value="<%=""+busdate%>"
		maxlength="2" styleId="BusinessStartDate" /> <html:select tabindex="25"
		style="width:60px;" property="answer(BusinessStartYear)"
		value="<%=""+year%>" styleId="BusinessStartYear">
		<html:option value="2007">2007</html:option>
		<html:option value="2008">2008</html:option>
		<html:option value="2009">2009</html:option>
		<html:option value="2010">2010</html:option>
		<html:option value="2011">2011</html:option>
		<html:option value="2012">2012</html:option>
	</html:select></div>
	
	<div class="field"><p>Type of Business (be specific)</p><html:textarea
		name="AddCustomer"
		property="answer(Object::CustomerAdditional::BusinessType)" rows="3"
		cols="60" style="width:250px;margin:0px 0px 0px 211px;" 
		/></div>
		
		
	
	<%--<div class="field"><p>SIC Code</p><html:text name="AddCustomer"
		property="answer(Object::CustomerAdditional::SicCode)"
		style="float:left;width:60px;margin:0px 0px 0px 393px;" styleId="sicCode"
		onblur="setvalue()"/></div>--%>
		
	<jsp:include page="../common/AutoCompleteSICLookup.jsp">  
			<jsp:param name="autoCompleteSqlLookupName" value="AUTOCOMPLETESICCODE" />
	</jsp:include>
	
	
	<div class="field"><p>SIC Division</p><html:select
		property="answer(Object::CustomerAdditional::SicDivision)" tabindex="27"
		style="width:310px;margin:-17px 0px 0px 421px;" name="AddCustomer"
		styleId="sicDiv" onchange="setGroup(this);">
		<html:option value="">Please Select SIC Division</html:option>
		<html:option value='0'>Agriculture, Forestry & Fishing</html:option>
		<html:option value='1'>Mining</html:option>
		<html:option value='2'>Construction</html:option>
		<html:option value='3'>Manufacturing</html:option>
		<html:option value='4'>Transportation</html:option>
		<html:option value='5'>Pipelines, except Nat. Gas & Freight Forwarding</html:option>
		<html:option value='6'>Transportation Services</html:option>
		<html:option value='7'>Communication</html:option>
		<html:option value='8'>Electric, Gas & Sanitary Services</html:option>
		<html:option value='9'>Wholesale Trade</html:option>
		<html:option value='10'>Retail Trade</html:option>
		<html:option value='11'>Finance, Insurance, & Real Estate</html:option>
		<html:option value='12'>Services</html:option>
		<html:option value='13'>Public Administration</html:option>
	</html:select></div>
	
	<div class="field"><p>SIC Group</p><html:select styleClass="txtbox"
		property="answer(Object::CustomerAdditional::SicGroup)" tabindex="28"
		style="width:310px;margin:0px 0px 0px 333px;" name="AddCustomer"
		styleClass="txtbox" styleId="sicGroup" onchange='setIndustry(this);'>
		<html:option value="">Please Select a SIC Group</html:option>
	</html:select></div>
	
	<div class="field"><p>SIC Industry</p><html:select styleClass="txtbox"
		style="width:310px;margin:0px 0px 0px 318px;" tabindex="29"
		property="answer(Object::CustomerAdditional::SicIndustry)"
		name="AddCustomer" styleClass="txtbox" styleId="sicIndus"
		onchange='setSiccode(this);'>
		<option value="">Please Select SIC Industry</option>
	</html:select></div>
	
	
	<div class="field"><p>Employer/Federal Tax ID #</p><html:text
		name="AddCustomer" tabindex="30"
		property="answer(Object::CustomerAdditional::FederalTaxId)"
		style="width:100px;margin:-2px 0px 0px 229px;" 
		size="30" maxlength="11" /></div>
	
	<div class="field"><p>Do you have any affiliations with other companies or
	unions</p> <html:radio name="AddCustomer" tabindex="31" style="margin:-5px 0px 0px 16px;"
		property="answer(Object::CustomerAdditional::AnyAffiliationWithOtherCompanies)"
		value="Y" onclick="enableAffEvent()">Yes</html:radio> <html:radio name="AddCustomer" tabindex="32"
		style="margin:-5px 0px 0px 25px;" 
		property="answer(Object::CustomerAdditional::AnyAffiliationWithOtherCompanies)" styleId="AffilN"
		value="N" onclick="disableAffEvent()">No</html:radio></div>
	
	<div class="field"><p>If yes, please describe</p> <html:textarea
		name="AddCustomer" tabindex="33"
		property="answer(Object::CustomerAdditional::Affliations)"
		style="width:250px;margin:0px 0px 0px 256px;" rows="3" cols="60" styleId="AffUnion"/></div>

	<!-- Onchange event will be called whenever the Active field changes to update the Employer Group Status
			Modified by Srividhyalakshmi July 17 2010-->

	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' connector='or' negated="true">	
		<div class="field"><p>Active</p><html:select property="answer(Object::Customer::active)" style="width:170px;margin:0px 0px 0px 361px;" styleId="onch" onchange="{document.forms[0].userActiveFlag.value = this.value}">
									
										<html:option value ="Y">Yes</html:option>
										
									
									<html:option value ="D">No</html:option>
										
										
									</html:select>
		</div>
	</dmshtml:dms_static_with_connector>
	
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_EMPLOYER_STATUS"}%>' connector='or' negated="true">	
		<div class="field"><p>Employer Status</p>	<html:select  property="answer(Object::Customer::Status)" style="width:150px;margin:0px 0px 0px 295px;" styleId="CustomerStatus" value="<%=""+CustomerStatus1 %>">						
									<%if(!customerStatus.equalsIgnoreCase("SENT_TO_UNDERWRITING")){ %>
										<html:option value="IN_PROGRESS" styleId="IN_PROGRESS">In Progress</html:option>	
									<%if(!customerStatus.equalsIgnoreCase("PAPER_SUBMITTED")){ %>	
										<html:option value="E_SUBMITTED"  styleId="E_SUBMITTED" disabled="<%=isEnabled%>"> E Submitted</html:option>
									<%}%>	
				 					<%if(!customerStatus.equalsIgnoreCase("E_SUBMITTED")){ %>
										<html:option value="PAPER_SUBMITTED" styleId="PAPER_SUBMITTED" disabled="<%=isEnabled%>">Paper Submitted</html:option>
									<%}} if(!customerStatus.equalsIgnoreCase("IN_PROGRESS")) {%>
										<html:option value="SENT_TO_UNDERWRITING" styleId="SENT_TO_UNDERWRITING" disabled="<%=isEnabled%>">Sent to Underwriting </html:option>
									<%} %>	
								</html:select>
			</div>
	</dmshtml:dms_static_with_connector>
	<p>&nbsp;</p>
	<p align="center">
		<html:reset	value=" " onmouseover="style.cursor='hand'" styleClass="resetbutton" />
		<html:submit value=" " styleClass="submitbutton"
		onmouseover="style.cursor='hand'" property="amswer(button)" tabindex="34"/>
	</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER_HOME"}%>' connector='or' negated="true">
	<p align="right">
	<input	type="button" value="Continue to Employer Landing Page>>" class="button" style="width:250px; height:22px; font-weight:bold"  onclick="parent.location='../customer/CoseEnrollmentApplication.jsp'">
	</p>
	</dmshtml:dms_static_with_connector>
	</div>
<html:hidden name="AddCustomer" property="answer(Object::CustomerAdditional::BusinessStartDate)" styleId="BusStartDate"/>
<html:hidden name="AddCustomer" property="answer(Object::CustomerAdditional::DunBradstreet)" />
<html:hidden name="AddCustomer" property="answer(Object::CustomerAdditional::GroupMMO)" />
<html:hidden styleId="hideCity" property="answer(Object::CustomerAdditional::City)" value="" />
<html:hidden styleId="hideState" property="answer(Object::CustomerAdditional::State)" value="" />

<bean:define id="hidSicDiv" name="AddCustomer" property="answer(Object::CustomerAdditional::SicDivision)" />
<%--<%="hidSicDiv::"+hidSicDiv %>--%>
<html:hidden styleId="hideSicDiv" property="answer(Object::CustomerAdditional::SicDivision)" value="<%=hidSicDiv.toString()%>" />

<bean:define id="hidSicGroup" name="AddCustomer" property="answer(Object::CustomerAdditional::SicGroup)" />
<%--<%="hidSicGroup::"+hidSicGroup %>--%>
<html:hidden styleId="hideSicGrp" property="answer(Object::CustomerAdditional::SicGroup)" value="<%=hidSicGroup.toString()%>" />

<bean:define id="hidSicIndus" name="AddCustomer" property="answer(Object::CustomerAdditional::SicIndustry)" />
<%--<%="hidSicIndus::"+hidSicIndus %>--%>
<html:hidden styleId="hideSicInd" property="answer(Object::CustomerAdditional::SicIndustry)" value="<%=hidSicIndus.toString()%>" />

<html:hidden styleId="hideCustZip" property="answer(Object::CustomerAdditional::Zip)" value="" />
<html:hidden styleId="hideCustAdd1" property="answer(Object::CustomerAdditional::Address1)" value="" />
<html:hidden styleId="hideCustAdd2" property="answer(Object::CustomerAdditional::Address2)" value="" />
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerID" value="<%=Customerid.toString()%>" />
<%}%>

<bean:define id="hidSicGrp1" name="AddCustomer" property="answer(Object::CustomerAdditional::SicGroup)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden styleId="hidSicGrp3" property="answer(Object::CustomerAdditional::SicGroup)" value="<%=hidSicGrp1.toString()%>" />

<%}%>

<html:hidden property="answer(duplicateAllowed)" value="no"  />
<html:hidden property="answer(Object::Entity::SiteId)" value="1"  />
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Customer::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Customer::CreatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Customer::UpdatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
<html:hidden name="DataForm" property="answer(versionid)" value="3"/>
<html:hidden name="DataForm" property="answer(RootTemplate)" value="yes"/>
<!-- To create user account -->
<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="CUSTOMER" />
<html:hidden property="answer(Object::UserDetail::email)" value=""/>
<html:hidden property="answer(Object::UserDetail::userName)" value=""/>
<html:hidden property="answer(Object::UserDetail::passWord)" value="" />
<html:hidden property="answer(Object::UserDetail::PasswordKey)" value="COSE_DEFAULT_PASSWORD" />
<html:hidden property="answer(Object::UserDetail::passWordConfirm)" value="" />
<html:hidden property="answer(Object::UserDetail::roleName)" value="CUSTOMER"/>
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" />
<html:hidden property="answer(Object::UserDetail::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(forwardNavigate)" value="success" />

<html:hidden property="answer(Object::Customer::SubmittedDate)" name="AddCustomer" />
<html:hidden property="answer(Object::Customer::AuthorizedSignatureEncrypted)" name="AddCustomer" />
<html:hidden property="answer(Object::Customer::AuthorizedSignature)" name="AddCustomer" />
<html:hidden property="answer(Object::CustomerAdditional::AuthorizedSignatureName)" name="AddCustomer" />
<html:hidden property="answer(Object::CustomerAdditional::AuthorizedSignatureTitle)" name="AddCustomer" />
		
<html:hidden property="answer(AgentId)" value="<%=""+lngAgentId1%>" />
<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />

<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>


<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Object::Agency::AgencyId)" styleId="agencyID" value="<%=""+agencyId2%>" />
<%}%>

<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />
 
 <html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" value="no" />				

 
<%	if(!Customerid.equals("")){%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />

<%}	
%>
<html:hidden property="TabPanelName" styleId="tabPanelNAME" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(TabPanelName)" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(Object::UserDetail::active)"styleId="userActiveFlag" />
</div>
</html:form>
</body>
<div>
<%if((""+CustomerId).length()>0) {%>
				<p><%-- 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_NOTES_EMPLOYEE"}%>' connector='or' negated="true">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<jsp:include page="../notes/DairyNotes.jsp">
								<jsp:param name="answer(Object::Notes::ObjectId)" value="<%=""+CustomerId%>" />
								<jsp:param name="answer(Object::Notes::ObjectVerId)" value="0" />
								<jsp:param name="answer(Object::Notes::ObjectType)" value="EMPLOYER" />
								<jsp:param name="answer(Object::Notes::UserName)" value="<%=""+userId%>" />
								<jsp:param name="answer(Object::Notes::UserRole)" value="<%=""+CustomerId%>" />
							</jsp:include>
					</dmshtml:dms_static_with_connector>	--%>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_ATTACHEMENT_EMPLOYEE"}%>' connector='or' negated="true">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<jsp:include page="../attachment/Attachment.jsp">
						  			<jsp:param name="answer(Object::Attachment::ObjectId)" value="<%=""+CustomerId%>" />
						  			<jsp:param name="answer(Object::Attachment::ObjectVerId)" value="0" />
						  			<jsp:param name="answer(Object::AttachmentObjectLink::ObjectType)" value="EMPLOYER" />
								 </jsp:include>
					</dmshtml:dms_static_with_connector>
					</p>
<%} %>
<SCRIPT SRC="../Scripts/JScripts/EmployerGroup.js" type="text/javascript"> </SCRIPT>
<SCRIPT language="JavaScript" type="text/javascript">
document.getElementById("BusinessName").focus();
//setvalue();
//setGroup(document.forms[0].sicDiv);
//setIndustry(document.forms[0].sicGroup);

</SCRIPT>

<script type="text/javascript">
function DisableBusinessEvent(){
  document.getElementById("EmployerGroup").BusinessAnotherName.disabled=true;
}
function EnableBusinessEvent(){
 document.getElementById("EmployerGroup").BusinessAnotherName.disabled=false;
}
function disableAffEvent(){
 document.getElementById("EmployerGroup").AffUnion.disabled=true;
}
function enableAffEvent(){
	document.getElementById("EmployerGroup").AffUnion.disabled=false
}
if(document.getElementById("EmployerGroup").AnotherNameN.checked==true){
   DisableBusinessEvent();
}
if(document.getElementById("EmployerGroup").AffilN.checked==true){
   disableAffEvent();
}
</script>
<script type="text/javascript">
YAHOO.example.BasicRemote = function() {
    // Use an XHRDataSource    
    var sicODS = new YAHOO.util.XHRDataSource('../AutoCompleteSICCode.do');
    //var sicODS = new YAHOO.util.XHRDataSource('../acTest/sicData.jsp');
    // Set the responseType
    sicODS.responseType = YAHOO.util.XHRDataSource.TYPE_JSARRAY;
    sicODS.responseSchema = {fields:["Siccode", "SicDivision","SicGroup","SicIndustry"]};

    // Enable caching
    sicODS.maxCacheEntries = 5;

    // Instantiate the AutoComplete
    var sicOAC = new YAHOO.widget.AutoComplete("sicCode", "sicAutoCompleteResContainer", sicODS);
    // The webservice needs custom parameters 
    sicOAC.generateRequest = function(sQuery) { 
        return "?answer(Object::ZipCode::PageNum)=0&AutoCompleteLookupSqlname="+document.getElementById('EmployerGroup').sicLookupName.value+"&FormName=AddCustomer&query=" + sQuery ; 
    };
    
    sicOAC.useShadow = true;
    sicOAC.resultTypeList = false;
	sicOAC.applyLocalFilter = false;
	sicOAC.queryMatchSubset = false;
	sicOAC.minQueryLength = 3;	
	sicOAC.queryDelay = 1;
	sicOAC.prehighlightClassName = "yui-ac-prehighlight";
	
	// Display up to 20 results in the container
	sicOAC.maxResultsDisplayed = 20

    // Custom formatter to highlight the matching letters
    sicOAC.formatResult = function(oSICResultData, sQuery, sSICResultMatch) {
        var query = sQuery.toLowerCase(),
            siccode = oSICResultData.Siccode,
            sivDivision = oSICResultData.SicDivision,
            sicGroup = oSICResultData.SicGroup || "", // Guard against null value
            query = sQuery.toLowerCase(),
            siccodeMatchIndex = siccode.toLowerCase().indexOf(query),
            sicDivisionMatchIndex = sivDivision.toLowerCase().indexOf(query),
            sicgroupMatchIndex = sicGroup.toLowerCase().indexOf(query),
            displaySICcode, displaySicDivision, displaynsicgroup;

        if(siccodeMatchIndex > -1) {
            displaySICcode = highlightSICMatch(siccode, query, siccodeMatchIndex);
        }
        else {
            displaySICcode = siccode;
        }

        if(sicDivisionMatchIndex > -1) {
            displaySicDivision = highlightSICMatch(sivDivision, query, sicDivisionMatchIndex);
        }
        else {
            displaySicDivision = sivDivision;
        }

        if(sicgroupMatchIndex > -1) {
            displaynsicgroup = highlightSICMatch(sicGroup, query, sicgroupMatchIndex);
        }
        else {
            displaynsicgroup = sicGroup ? sicGroup : "";
        }
		
        return displaySICcode + "\t" + displaySicDivision + "\t" + displaynsicgroup + "\t" + oSICResultData.SicIndustry + "\t"  ;

    };

    // Helper function for the formatter
    var highlightSICMatch = function(full, snippet, matchindex) {
        return full.substring(0, matchindex) +
                "<span class='match'>" +
                full.substr(matchindex, snippet.length) +
                "</span>" +
                full.substring(matchindex + snippet.length);
    };

    // Define an event handler to populate a hidden form field
    // when an item gets selected and populate the input field
    var myHiddenField1 = YAHOO.util.Dom.get("myHidden1");
    var myHandler1 = function(sType, aArg) {

        var myAC1 = aArg[0]; // reference back to the AC instance
        var elLI1 = aArg[1]; // reference to the selected LI element
        var oData1 = aArg[2]; // object literal of selected item's result data
        
        document.getElementById("EmployerGroup").sicDiv.value = oData1.SicDivision;
		document.getElementById("EmployerGroup").sicGroup.value = oData1.SicGroup;
		document.getElementById("EmployerGroup").sicIndus.value = oData1.SicIndustry;
        
        // update hidden form field with the selected item's ID
        myHiddenField1.value = elLI1.Siccode;
        myAC1.getInputEl().value = oData1.Siccode + "\t" + oData1.SicDivision+"\t" + (oData1.SicGroup ? " (" + oData1.SicIndustry + ")" : "")+ "\t" + oData1.SicIndustry + "\t" ;
		
    };
    sicOAC.itemSelectEvent.subscribe(myHandler1);
	
    return {
        sicODS: sicODS,
        sicOAC: sicOAC
    };

}();
</script>
