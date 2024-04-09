<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>
<!-- html:html -->

<!-- head -->
<!-- title --> <!-- %=session.getAttribute("PageTitle")%--> <!-- Add Employer Group--> <!-- /title -->
<!-- link rel="stylesheet" href="../styles/Styles.css" type="text/css" -->
<SCRIPT SRC="../Scripts/JScripts/AddCustomer.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCode.js"  type="text/javascript"> </SCRIPT>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
<SCRIPT type="text/javascript">
<!--
function checkFields()
{
	var formElement=document.forms[0];
	if((formElement.AddCustomerYes!=null || formElement.AddCustomerYes!=undefined) && (formElement.AddCustomerNo!=null || formElement.AddCustomerNo!=undefined) )
	if(formElement.AddCustomerYes.checked==false && formElement.AddCustomerNo.checked==false)
		{
	formElement.AddCustomerNo.checked=true;
		}
}

//
-->
</SCRIPT>
<!-- /head -->
<!-- body onload is a must here otherwise the values in sic columns will not be populated -->
<body onLoad="setvalue();">
<%int dataBaseIdViewPrivillage=0;%>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>

<html:form action="/SaveCustomer"  onsubmit="return validateEmployerGroupFields(this.form)">
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
<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/> 

<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>	
		<td valign="top" align="left">
			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<logic:present name="staleDataSubmissionMsg"  scope="request">
					<tr>
						<td class="Error" >
							<bean:message key="error.staleDataSubmissionMsg"/>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</logic:present>
				<tr>
					<td colspan="3">
						<logic:notPresent name="staleDataSubmissionMsg"  scope="request">
							<table WIDTH="760px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
							<tr>
								<td valign="top">		
									<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												<%--<bean:message key="Top.EmployerGroupName"/> --%>
												Employer Group Name
											</td>
											<td class="FormLabels" align="left"  colspan="1" width="220px">
												<a href="../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerId)' />" >
												<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerName)'/></a>
											</td>
										</tr>
										<tr>
											<td  class="FormLabels" align="left" colspan="1">
												<bean:message key="Top.AgencyName"/>
											</td> 
											<td class="sectionhead1" align="left" colspan="2" >
		
							<!-- ********************agency, agent, general ageny details by link *********************-->

		<bean:define id="agencyIdTemp1" name="AddCustomer" property="answer(Agency::AgencyId)"/>
			<%if(!agencyIdTemp1.toString().equals("")) {
			agencyIdTemp=agencyIdTemp1.toString();	
			lngAgencyTemp=Long.parseLong(agencyIdTemp);
			if(lngAgencyTemp>0){%>
				<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
				<logic:present name="agencyDetail2" scope="request">
					<bean:define id="agdetail2" name="agencyDetail2" scope="request"
											type="com.dms.ejb.data.QuestionHashMap" />
					<%agencyId2=Long.parseLong(agdetail2.getString("agencyid"));%>
					<%agencyName2=agdetail2.getString("agencyname");%>
					<%generalagencyid2=Long.parseLong(agdetail2.getString("generalagencyid"));%>
					<%generalagencyname2=agdetail2.getString("generalagencyname");%>
				</logic:present>
			<%}%>

			<bean:define id="AgentId1" name="AddCustomer" property="answer(AgentId)"/>
			<%long lgAgentId1=0;
					try {
					lgAgentId1=Long.parseLong(AgentId1.toString());
				} catch(Exception ex){} %>
			<%if(lgAgentId1>0){%>
				<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId='<%=""+lgAgentId1%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
				<logic:present name="agentDetail" scope="request">
					<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
					<%lngAgentId1=lgAgentId1;%>
					<%strAgentFName=agentDetail1.getString("agentfname");%>
					<%strAgentLName=agentDetail1.getString("agentlname");%>
				</logic:present>
			<%}%>

<!-- *********************************************************************************************-->
<%}else{%>
<!-- ********************agency, agent, general ageny details by customer id *********************-->
		<%
		if(!cId.toString().equals("")){
		%>
			<%long agencyId=0;%>
			<%long lngGeneralAgencyId=0;%>
			<%long lngAgentId=0;%>
			<%String agencyName="";%>
			<%String generalAgencyName="";%>
			<%String agentFName="";%>
			<%String agentLName="";%>
			<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
			<logic:present name="customerDetail1" scope="request">
				<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
													type="com.dms.ejb.data.QuestionHashMap" />
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
			</logic:present>

			<%} else {%>

<!-- ************Agency agent, general agenct detail by user id ******************************-->
			<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
			<logic:present name="agencyIdent" scope="session">
				<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
				<%
				agencyIdTemp=agencyIdid.toString();
				try {
					lngAgencyTemp=Long.parseLong(agencyIdTemp);
				} catch(Exception ex){} %>
				</logic:present>
				<%if(lngAgencyTemp>0){%>
					<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
					<logic:present name="agencyDetail2" scope="request">
						<bean:define id="agdetail2" name="agencyDetail2" scope="request"
												type="com.dms.ejb.data.QuestionHashMap" />
						<% agencyId2=Long.parseLong(agdetail2.getString("agencyid"));%>
						<% agencyName2=agdetail2.getString("agencyname");%>
						<% generalagencyid2=Long.parseLong(agdetail2.getString("generalagencyid"));%>
						<% generalagencyname2=agdetail2.getString("generalagencyname");%>
					</logic:present>
				<%}%>
				<bean:define id="AgentId2" name="AddCustomer" property="answer(AgentId)"/>
				
				<%long lgAgentId2=0;
					try {
					lgAgentId2=Long.parseLong(AgentId2.toString());
				} catch(Exception ex){} %>
				<%if(lgAgentId2>0){%>
					<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId="<%=""+lgAgentId2%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
					<logic:present name="agentDetail" scope="request">
						<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
						<%lngAgentId1=lgAgentId2;%>
						<%strAgentFName=agentDetail1.getString("agentfname");%>
						<%strAgentLName=agentDetail1.getString("agentlname");%>
					</logic:present>
				<%}
			%>
			<!--/logic:present-->
<!-- ****************************************************************************************** -->
		<%}%>
	<%}%>
			
<!-- GENERAL BLOCK -->
	<%if(agencyId2>0){%>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' 
	connector='or' negated="true">	
	<a href="../EditAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&ReadOnly=Yes&agencyId=<%=""+agencyId2%>&primaryObjectId=<%=""+agencyId2%> &primaryObjectType=AGENCY"><%=agencyName2%></a>
	</dmshtml:dms_static_with_connector >
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="false">
	<a><%=agencyName2%></a>
	</dmshtml:dms_static_with_connector >	
	<%}%>
	<%if(dataBaseIdViewPrivillage==1) {%>
			<%="- "%><%=""+agencyId2%>
			<%}%>


	<!-- tr>	
		<td  class="FormLabels" align="left"  colspan="1">&nbsp;
			
		</td>

		<td class="FormLabels" align="left"  colspan="1">
			<html:button value="Change Agency" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return GoTOFindButton()"/>
		</td>
	</tr> -->

<!-- /td -->
</table>


<td valign="top">
	<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
		<tr>
			<td  class="FormLabels" align="left"  colspan="1" width="160px"><bean:message key="Top.GeneralAgency"/></td> 
			<td  class="FormLabels" align="left"  colspan="1" width="220px">

				<%if(generalagencyid2>0){%>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="true">	
					<a href="../EditGAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&ReadOnly=Yes&agencyId=<%=""+generalagencyid2%>&primaryObjectId=<%=""+generalagencyid2%>&primaryObjectType=GENERAL_AGENCY"><%=generalagencyname2%></a>
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
			<td class="FormLabels" align="left" colspan="1">
				<bean:message key="Top.AgentName"/>
			</td> 
			<td class="sectionhead1" align="left" colspan="2">
				<%if(!strAgentLName.equals("") || !strAgentFName.equals("")){%>
					<%=strAgentFName%> <%=" "%><%=strAgentLName%>
				<%}%>
				<%if(dataBaseIdViewPrivillage==1) {%>
				<%="- "%><%=""+lngAgentId1%>
				<%}%>
			</td>
		</tr>	
	</table>
</td>
</tr>


<!-- GENERAL BLOCK STOP -->



</table>



<table WIDTH="770px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
	</tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT EMPLOYER GROUP</td>
	</tr>
	<tr><td  class="FormLabels" align="left" colspan="4">&nbsp; </td></tr>
</logic:notPresent>
<tr>
<td class="Error" width="100%">
<div id="ERROR_CONTAINER"></div>
</td>

<tr>
	<td class="links" width="20%">
		<logic:present name ='arrObjectDetail' scope ='session'>
			<logic:iterate id="arrObjectDetail" name="arrObjectDetail" scope="session" >
				<bean:define id="custid" name="arrObjectDetail" property="id"/> <!--/logic:present-->
				<a href="../QuickAllEmployees.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&customerId=<%=custid.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=custState.toString()%>" title="Click to go to Show All Employees/Add Employee" />Census</a>
	</td>

	<td class="links" width="20%">  <a href="../AllQuotes.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::Customer::State)=<%=custState.toString()%>" title="Click to go to Quotes" />Quotes</a>  </td>
	<!-- 
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DandB_INFORMATIONACCESS"}%>' connector='or' negated="true">	
	<td class="links" align="left" width="25%">
	<a href='../ShowDNBDataMain.do?answer(Object::Customer::CustomerId)=<%=custid.toString()%>&customerId=<%=custid.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::Customer::OwnerId)=<%=ownerId.toString()%>&answer(Agency::AgencyId)=<%=""+agencyId2%>&answer(GeneralAgency::AgencyId)=<%=""+generalagencyid2%>&answer(AgentId)=<%=""+lngAgentId1%>'>D&amp;B Information</a>
	</td>
	</dmshtml:dms_static_with_connector> -->
	<!--/logic:present-->	
</logic:iterate>
</logic:present>
</table>
</td></tr>	
<!-- /td --><!-- /tr -->
<logic:present name="xmlValidationErrorList"  scope="request" >
<tr>
<td colspan="3">
<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="sectionheadblackbig" align="center"><u><b><%="XML Has been generated with following validation Errors"%></b></u></td></tr>

<tr>
<td class="Error" WIDTH="100%">
<ol>
	<bean:define id="arrList" name="xmlValidationErrorList" type="java.util.ArrayList"/>
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
	

	<%
boolean errorOccured=false;
%>
<bean:define id="ansmap" name="AddCustomer" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
<logic:iterate id="element" name="ansmap">
	<bean:define id="errorListkey" name="element" property="key" />
	<logic:equal name="errorListkey" value="Object::error::list">
		<bean:define id="errorListvalue" name="element" property="value" />
		<logic:iterate id="errmsg" name="errorListvalue">
			<tr>
			<td class="Error">
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
}
%>
	<tr>
		<td>&nbsp;</td>
	</tr>
	
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_INSURED_AGENCY"}%>' connector='or' negated="true">	
				<tr>
					<td align="left" colspan="2">
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td class="sectionhead" align="center">Agency Information</td>
							
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td> &nbsp;</td>
							</tr>

						</table>
					</td>
				</tr>
				
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							
							<tr>
								<td class="FormLabels" align="left" width="45%"> 
									Agency *
								</td>	
								<td class="links" width="29%">&nbsp;&nbsp;<html:text  name="AddCustomer" property ="answer(AgencyName)" value='<%=agencyName2%>' size="30" maxlength="60" styleClass="txtbox" readonly="true" styleId="Agenname" />
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;	
									<IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButton()">
									
								</td>
							</tr>
						 	
						</table>

					</td>
				</tr>
			</dmshtml:dms_static_with_connector>
			
	<tr><td align="left" colspan="2">


<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">	
	<tr>
		<td colspan="2" align="center" class="sectionhead">EMPLOYER GROUP DETAILS</td>
		
	</tr>
	<tr>
		<td colspan="2" align="right" class="links" >
			<html:submit value="Save" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
		</td>
	</tr>
	<%if(dataBaseIdViewPrivillage==1) {%>
	<tr>
		<td width="45%" class="FormLabels" align="left">Employer Group Id</td>
		<td class="links">&nbsp;&nbsp;<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerId)' /></td>
	</tr>
<%}%>
	<tr>
		<td width="45%" class="FormLabels" align="left">
			Member of Association			
		</td>
		<td class="TextMatter" style="Class:txtbox">&nbsp;
			<html:select styleClass="txtbox" property="answer(Object::Customer::MemberAssociation)" styleId="memOfAssociation">
				<html:option value ="">None</html:option>
				<html:option value="Louisiana Dental Association">Louisiana Dental Association</html:option>
				<html:option value="Louisiana Pharmacists Association">Louisiana Pharmacists Association</html:option>
				<html:option value="E. Baton Rouge Medical Society">E. Baton Rouge Medical Society</html:option>
			</html:select>			
		</td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left">
			Member Association Number
		</td>
		<td class="links" >&nbsp;
		<html:text name="AddCustomer"   property ="answer(Object::CustomerAdditional::AssociationNumber)"  size="20" maxlength="20" styleClass="txtbox"  />
		</td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left">Business Name*</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName)"  size="30" maxlength="30" styleClass="txtbox" styleId="BusinessName"/></td>
	</tr>
	
	<tr>
		<td width="45%" class="FormLabels" align="left">Employer Group Number</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerNumber)"  size="8" maxlength="8" styleClass="txtbox"/></td>
	</tr>

	<%
boolean branchPresent = true;
boolean deptPresent = true;
	try{
%>
<bean:define id="branchId" name="AddCustomer"   property ="answer(Object::CustomerAdditional::Branch)" />
<%
		if(branchId==null || branchId.equals("") ){
			branchPresent = false;
		}
	}catch(Exception e){}

	try{
%>
<bean:define id="deptId" name="AddCustomer"   property ="answer(Object::CustomerAdditional::Dept)" />
<%
		if(deptId==null || deptId.equals("") ){
			deptPresent = false;
		}
	}catch(Exception e){}
%>
	<tr>
		<td width="45%" class="FormLabels" align="left">Branch </td>
		<td class="links">&nbsp;
		<% if(branchPresent){ %>
		<html:text name="AddCustomer"   property ="answer(Object::CustomerAdditional::Branch)"  size="4" maxlength="4" styleClass="txtbox"  />
		<%}else{ %>
		<html:text name="AddCustomer"   property ="answer(Object::CustomerAdditional::Branch)"  size="4" maxlength="4" styleClass="txtbox"  value="0" />
		<%} %>
		</td>
	</tr>

	<tr>
		<td width="45%" class="FormLabels" align="left">Department</td>
		<td class="links">&nbsp;
		<% if(deptPresent){ %>
		<html:text name="AddCustomer"   property ="answer(Object::CustomerAdditional::Dept)"  size="3" maxlength="3"  styleClass="txtbox" />
		<%}else{ %>
		<html:text name="AddCustomer"   property ="answer(Object::CustomerAdditional::Dept)"  size="3" maxlength="3"  styleClass="txtbox" value="0" />
		<%} %>
		</td>
	</tr>
		
	<tr>
		<td width="45%" class="FormLabels" align="left">SIC Code</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer" property="answer(Object::CustomerAdditional::SicCode)" size="5" maxlength="5" styleClass="txtbox" styleId="sicCode" onblur="validateSICCode()"/></td>
	</tr>
	
	<tr>
		<td  width="45%" class="FormLabels" align="left">SIC Division*</td> 
		<td class="TextMatter" style="Class: txtbox">&nbsp;
			<html:select styleClass="txtbox" property="answer(Object::CustomerAdditional::SicDivision)" name="AddCustomer" styleClass="txtbox" styleId="sicDiv" onchange="setGroup(this);">
				<html:option value="">Please Select SIC Division</html:option>
				<html:option value ='0'>Agriculture, Forestry & Fishing</html:option>
			    <html:option value ='1'>Mining</html:option>
				<html:option value ='2'>Construction</html:option>
				<html:option value ='3'>Manufacturing</html:option>
				<html:option value ='4'>Transportation</html:option>
				<html:option value ='5'>Pipelines, except Nat. Gas & Freight Forwarding</html:option>
				<html:option value ='6'>Transportation Services</html:option>
				<html:option value ='7'>Communication</html:option>
				<html:option value ='8'>Electric, Gas & Sanitary Services</html:option>
				<html:option value ='9'>Wholesale Trade</html:option>
				<html:option value ='10'>Retail Trade</html:option>
				<html:option value ='11'>Finance, Insurance, & Real Estate</html:option>
				<html:option value ='12'>Services</html:option>
				<html:option value ='13'>Public Administration</html:option>		    
			</html:select>		
		</td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left">SIC Group*</td>
		<td class="TextMatter" style="Class: txtbox">&nbsp;
			<html:select styleClass="txtbox" property="answer(Object::CustomerAdditional::SicGroup)" name="AddCustomer" styleClass="txtbox" styleId="sicGroup" onchange='setIndustry(this);' >
				<html:option value="">Please Select a SIC Group</html:option>
			</html:select>	
		</td>					
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left">SIC Industry*</td>
		<td class="TextMatter" style="Class: txtbox">&nbsp;
			<html:select styleClass="txtbox" property="answer(Object::CustomerAdditional::SicIndustry)" name="AddCustomer" styleClass="txtbox" styleId="sicIndus" onchange='setSiccode(this);' onblur="validateSICCode()">
				<option value="">Please Select SIC Industry</option>
			</html:select>	
		</td>					
	</tr>	
	<tr>
		<td width="45%" class="FormLabels" align="left">Street Number</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::StreetNumber)" size="10" maxlength="10" styleClass="txtbox" styleId="StreetNumber" /> 					</td>
	</tr>	
    <tr>
		<td width="45%" class="FormLabels" align="left">Street Name</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::StreetName)" size="24" maxlength="25" styleClass="txtbox" styleId="StreetName"/></td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left">Address 2</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::Address2)" size="30" maxlength="30" styleClass="txtbox" styleId="Address2"/></td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left"><bean:message key="AddCustomer.City" /></td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::City)" size="20" maxlength="20" styleClass="txtbox" styleId="City"/></td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left">County</td>
		<td class="links">&nbsp;&nbsp;<html:text   property="answer(Object::Customer::County)" size="20" maxlength="20" styleClass="txtbox" styleId="County"/></td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left"><bean:message key="AddCustomer.State"/>*</td>
		<td class="TextMatter" style="Class:txtbox">&nbsp;
			<dmshtml:get_type nameInSession="arStates" dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
				<html:select styleClass="txtbox" property="answer(Object::Customer::State)" styleId="State">
					<html:option value ="">Select</html:option>
 						<logic:present name="arStates" scope="request">
    					 	<logic:iterate id="details" name="arStates" scope="request" >
							  <bean:define id='test' name="details"  property="typeDesc" />
								<html:option value ='<%=test.toString()%>'>
 									<bean:write name="details" property="dmsType" />
								</html:option>
							</logic:iterate>
						</logic:present>
				</html:select>
		</td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left">Zip Code*</td>
<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::Zip)" size="10" maxlength="5" styleClass="txtbox" styleId="Zip" onkeyup="if(this.value.length==5) {this.value=this.value+'-'}"/>
			<!--Zipcode lookup start 05-06-2006-->
			<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
			<!-- 05-06-2006 end-->	
		</td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left"><bean:message key="EmployeeDetails.Phone1" /></td>
		<td class="links">&nbsp;&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhoneAreaCode)"  size="3" maxlength="3" styleClass="txtbox"  onkeyup="if(this.value.length==3) {document.forms[0].elements[24].focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhoneExchangeCode)"  size="3" maxlength="3" styleClass="txtbox" onkeyup="if(this.value.length==3) {document.forms[0].elements[25].focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhone)"  size="4" maxlength="4" styleClass="txtbox" /></td>
	</tr>	
	<tr>
		<td width="45%" class="FormLabels" align="left"><bean:message key="EmployeeDetails.Fax" /></td>
		<td class="links">&nbsp;&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::FaxAreaCode)"  size="3" maxlength="3" styleClass="txtbox" onkeyup="if(this.value.length==3) {document.forms[0].elements[27].focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::FaxExchangeCode)"  size="3" maxlength="3" styleClass="txtbox" onkeyup="if(this.value.length==3) {document.forms[0].elements[28].focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::Fax)"  size="4" maxlength="4" styleClass="txtbox" /></td>
	</tr>	
	<tr>
		<td width="45%" class="FormLabels" align="left"><u>President</u></td></tr>
	<tr>
		<td class="FormLabels" align="left">First Name</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer" property="answer(Object::CustomerAdditional::PresidentFName)" size="15" maxlength="15" styleClass="txtbox"/></td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left">Last Name</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer"  property="answer(Object::CustomerAdditional::PresidentLName)" size="15" maxlength="15" styleClass="txtbox"/></td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left"><u>Contact Person</u></td>
	</tr>
	<tr>
		<td width="45%" class="FormLabels" align="left">First Name</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer"  property="answer(Object::CustomerAdditional::ContactPersonFname)" size="30" maxlength="30" styleClass="txtbox"/></td>
	</tr>	
	<tr>
		<td width="45%" class="FormLabels" align="left">Middle Name</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer"  property="answer(Object::CustomerAdditional::ContactPersonMname)" size="30" maxlength="30" styleClass="txtbox"/></td>
	</tr>	
	<tr>
		<td width="45%" class="FormLabels" align="left">Last Name</td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer"  property="answer(Object::CustomerAdditional::ContactPersonLname)" size="30" maxlength="30" styleClass="txtbox"/></td>
	</tr>	
	<tr>
		<td width="45%" class="FormLabels" align="left"><bean:message key="EmployeeDetails.Title" /></td>
		<td class="links">&nbsp;&nbsp;<html:text  name="AddCustomer"  property="answer(Object::CustomerAdditional::ContactPersonTitle)" size="30" maxlength="30" styleClass="txtbox"/></td>
	</tr>	
	<tr>
		<td width="45%" class="FormLabels" align="left"><bean:message key="EmployeeDetails.EmailAddress" /></td>
		<td class="links">&nbsp;&nbsp;<html:text   name="AddCustomer" property="answer(Object::Customer::EMailAddress)" size="30" maxlength="30" styleClass="txtbox"/></td>
	</tr>	
	<tr>
		<td width="45%" class="FormLabels" align="left"><bean:message key="EmployeeDetails.NatureOfBusiness" /></td>
		<td class="links">&nbsp;&nbsp;<html:text   name="AddCustomer" property="answer(Object::CustomerAdditional::NatureOfBusiness)" size="30" maxlength="30" styleClass="txtbox"/></td>
	</tr>	
	<tr>
		<td width="45%" class="FormLabels" align="left"><bean:message key="EmployeeDetails.NumberOfEmployees" /></td>
		<td class="links">&nbsp;&nbsp;<html:text styleId="NoOfEmployees"  name="AddCustomer" property="answer(Object::CustomerAdditional::NumberOfEmployees)" size="5" maxlength="5" styleClass="txtbox"/></td>
	</tr>	
	<tr>
		<td width="45%" class="FormLabels" align="left"><bean:message key="EmployeeDetails.NumberOfEligibleEmployees" /></td>
		<td class="links">&nbsp;&nbsp;<html:text styleId="NoOfEligibleEmp"  name="AddCustomer" property="answer(Object::CustomerAdditional::NumberOfEligibleEmployees)" size="5" maxlength="5" styleClass="txtbox"/></td>
	</tr>	
	<tr>
		<td align="left" class="FormLabels" height="25">
		<bean:message key="EmployeeDetails.OtherLocations" />
		</td>
		<td class="TextMatter">&nbsp;
			<dmshtml:dms_radio name="AddCustomer" property = "answer(Object::CustomerAdditional::OtherLocations)" value="Y" >
			Yes
			</dmshtml:dms_radio>
			&nbsp;&nbsp;&nbsp;
			<dmshtml:dms_radio name="AddCustomer" property = "answer(Object::CustomerAdditional::OtherLocations)" value="N" >
			No
			</dmshtml:dms_radio>
		</td>
	</tr>
	<tr>
		<td align="left" class="FormLabels" height="25">
		<bean:message key="EmployeeDetails.ERISA" />
		</td>
		<td class="TextMatter">&nbsp;
			<dmshtml:dms_radio name="AddCustomer" property = "answer(Object::CustomerAdditional::ERISA)" value="Y" >
			Yes
			</dmshtml:dms_radio>
			&nbsp;&nbsp;&nbsp;
			<dmshtml:dms_radio name="AddCustomer" property = "answer(Object::CustomerAdditional::ERISA)" value="N" >
			No
			</dmshtml:dms_radio>
		</td>
	</tr>
	<tr>
		<td class="FormLabels" align="left" height="25"><bean:message key="EmployeeDetails.WaitingPeriod"/> </td>
		<td class="links">&nbsp;
			<html:select styleClass="txtbox" name="AddCustomer" property="answer(Object::CustomerAdditional::WaitingPeriod)" styleClass="txtbox">
				<html:option value ="">Select</html:option>
				<html:option value ="30">30</html:option>
				<html:option value ="60">60</html:option>
				<html:option value ="90">90</html:option>
				<html:option value ="180">180</html:option>
			</html:select>
		</td>
	</tr>
	<tr>
		<td class="FormLabels" align="left">Employer's contribution towards employees' premium</td>
		<td class="links">&nbsp;&nbsp;<html:text   name="AddCustomer" property="answer(Object::CustomerAdditional::EmployersContribution)" size="6" maxlength="6" styleClass="txtbox"/></td>
	</tr><!--	
	<tr>
		<td class="FormLabels" align="left">Medicare Primary</td>
		<td class="TextMatter">
			<dmshtml:dms_radio name="AddCustomer" property = "answer(Object::CustomerAdditional::MedicarePrimary)" value="Y" styleId="AddCustomerYes">
			Yes
			</dmshtml:dms_radio>
			&nbsp;&nbsp;&nbsp;
			<dmshtml:dms_radio name="AddCustomer" property = "answer(Object::CustomerAdditional::MedicarePrimary)" value="N" styleId="AddCustomerNo">
			No
			</dmshtml:dms_radio>
		</td>
	
		
	</tr>
-->
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EXPORT_XML"}%>' connector='or' negated="true">	
	<tr>
		<td class="FormLabels" align="left">Billing Frequency</td>
		<td class="TextMatter">&nbsp;
			<html:select name="AddCustomer" property="answer(Object::CustomerAdditional::BillingFrequency)" styleClass="txtbox" styleId="billFrequency">
				<html:option value ="">Select</html:option>
				<html:option value ="A">Annually</html:option>
				<html:option value ="M">Monthly</html:option>
				<html:option value ="Q">Quaterly</html:option>
				<html:option value ="S">Semi-Annually</html:option>
			</html:select></td>		
	</tr>
	<tr>
		<td class="FormLabels" align="left">Billing Level</td>
		<td class="TextMatter">&nbsp;
			<html:select name="AddCustomer" property="answer(Object::CustomerAdditional::BillingLevel)" styleClass="txtbox" styleId="billLevel">
				<html:option value ="">Select</html:option>
				<html:option value ="M">Main</html:option>
				<html:option value ="B">Branch</html:option>
				<html:option value ="D">Department</html:option>
				<html:option value ="I">Individual</html:option>
			</html:select>
		</td>		
	</tr>
	<tr>
		<td class="FormLabels" align="left">Uses PEO</td>
		<td class="TextMatter">&nbsp;
			<html:radio name="AddCustomer" property="answer(Object::CustomerAdditional::UsesPEO)" styleClass="txtbox" styleId="usesPEOyes" value="Y">Yes</html:radio>
			&nbsp;&nbsp;&nbsp;
			<html:radio name="AddCustomer" property="answer(Object::CustomerAdditional::UsesPEO)" styleClass="txtbox" styleId="usesPEOno" value="N">No</html:radio>		
		</td>		
	</tr>
	<tr>
		<td class="FormLabels" align="left">New Employees Waiting</td>
		<td class="TextMatter">&nbsp;
			<html:select name="AddCustomer" property="answer(Object::CustomerAdditional::NewEmpWaiting)" styleClass="txtbox" styleId="newEmpWaiting">
				<html:option value ="">Select</html:option>
				<html:option value ="1">1</html:option>
				<html:option value ="2">2</html:option>
				<html:option value ="3">3</html:option>
				<html:option value ="6">6</html:option>
			</html:select>
		</td>		
	</tr>
</dmshtml:dms_static_with_connector><!-- End EXPORT_DATA Data Entry -->
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EXPORT_XML"}%>' connector='or' negated="false">	
	<tr><td><html:hidden name="AddCustomer" property="answer(Object::CustomerAdditional::BillingFrequency)"/></td></tr>
	<tr><td><html:hidden name="AddCustomer" property="answer(Object::CustomerAdditional::BillingLevel)"/></td></tr>
	<tr><td><html:hidden  name="AddCustomer" property="answer(Object::CustomerAdditional::UsesPEO)"/></td></tr>
	<tr><td><html:hidden name="AddCustomer" property="answer(Object::CustomerAdditional::NewEmpWaiting)"/></td></tr>
</dmshtml:dms_static_with_connector>
</table>
</td></tr>	
</table>		
</td>
</tr>
	<tr>
		<td><hr size="1" noshade width="95%"></td>
	</tr>
	<tr>
		<td>
			<table WIDTH="300px" ALIGN="right" border="0"CELLSPACING="0" CELLPADDING="2">
				<tr>
					<td class="FormLabels" align="right" height="25" WIDTH="150px">Data Entry Status</td>
					<td class="links" WIDTH="150px">&nbsp;
						<html:select name="AddCustomer" property="answer(Object::CustomerAdditional::DataEntry)" styleClass="txtbox">
							<html:option value ="In-Progress">In-Progress</html:option>
							<html:option value ="Completed">Completed</html:option>
							<html:option value ="In-Complete">In-Complete</html:option>
							<html:option value ="Sent">Sent</html:option>
							<html:option value ="SentError">Sent Error</html:option>
							<html:option value ="InCoStar">In Co-Star</html:option>		
						</html:select>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right" WIDTH="150px">Created Date</td>
					<td class="sectionhead1" WIDTH="150px">&nbsp;&nbsp;<bean:write name='AddCustomer' property="answer(Object::Customer::CreatedDate)" /></td>
				</tr>
				<tr>
					<td class="FormLabels" align="right" WIDTH="150px">Last Updated Date</td>
					<td class="sectionhead1" WIDTH="150px">&nbsp;&nbsp;<bean:write name='AddCustomer' property="answer(Object::Customer::UpdatedDate)" /></td>
				</tr>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' connector='or' negated="true">	
				<tr>
					<td class="FormLabels" align="right">Active&nbsp;</td>
					<td class="TextMatter">&nbsp;
						<html:select property="answer(Object::Customer::active)" >
							<html:option value ="Y">Yes</html:option>
							<html:option value ='D'>No</html:option>
						</html:select>
					</td>
				</tr>
			</dmshtml:dms_static_with_connector>
		</table>
	</td>
</tr>

<tr>
	<td align="center">
		<html:submit value="Save" property="amswer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
	</td>
</tr>
</table>

<html:hidden styleId="hideCity" property="answer(Object::CustomerAdditional::City)" value="" />
<html:hidden styleId="hideState" property="answer(Object::CustomerAdditional::State)" value="" />
<html:hidden styleId="hideSicDiv" property="answer(Object::CustomerAdditional::SicDivision)" value="" />
<html:hidden styleId="hideSicGrp" property="answer(Object::CustomerAdditional::SicGroup)" value="" />
<bean:define id="hidSicIndus" name="AddCustomer" property="answer(Object::CustomerAdditional::SicIndustry)" />
<html:hidden styleId="hideSicInd" property="answer(Object::CustomerAdditional::SicIndustry)" value="<%=hidSicIndus.toString()%>" />
<html:hidden styleId="hideCustZip" property="answer(Object::CustomerAdditional::Zip)" value="" />
<html:hidden styleId="hideCustAdd1" property="answer(Object::CustomerAdditional::Address1)" value="" />
<html:hidden styleId="hideCustAdd2" property="answer(Object::CustomerAdditional::Address2)" value="" />
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}%>

<bean:define id="hidSicGrp1" name="AddCustomer" property="answer(Object::CustomerAdditional::SicGroup)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden styleId="hidSicGrp3" property="answer(Object::CustomerAdditional::SicGroup)" value="<%=hidSicGrp1.toString()%>" />

<%}%>


<html:hidden property="answer(duplicateAllowed)" value="no"  />
<html:hidden property="answer(Object::Entity::SiteId)" value="1"  />
<!-- <html:hidden property="answer(Object::Entity::ObjectType)" value="ENTITY" />
<html:hidden property="answer(Object::Entity::EntityType)" value="CUSTOMER" /> -->
<!-- <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> -->
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" styleId="hidOwnerId"/>

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

<SCRIPT LANGUAGE="JavaScript" SRC="../Scripts/JScripts/IndustryFactors.js" type="text/javascript">

</SCRIPT>

		
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
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

	<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />
 
 <html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" value="no" />				

<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%	if(!Customerid.equals("")){%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />

<%}	
%>

  <SCRIPT LANGUAGE="JavaScript" type="text/javascript">
<!--

checkFields();
setGroup(document.forms[0].sicDiv);
setIndustry(document.forms[0].sicGroup);	

	

//-->
</SCRIPT>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
 </html:form>
</body>
<!-- /html:html -->
