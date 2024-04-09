<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dms.ejb.data.QuestionHashMap" %>
<script type="text/javascript" src="../Scripts/JScripts/QuoteHeader.js">
</script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>

		<%Object cId=null;%>
<%String customerCreatedBy=""; %>
<%String customerCreatedDate="";
String customerUpdatedDate=""; 
%>

<%long lngAgencyId=0;%>
<%long lngAgentId=0;%>
<%String agencyName="";%>
<%String agentFName="";%>
<%String agentLName="";%>
<%String generalAgencyId="";%>
<%long lngGeneralAgencyId=0;%>
<%String generalAgencyName="";%>

<bean:parameter name="paretQuoteStatus" id="paretQuoteStatus"/>
<bean:parameter name="policyNumber" id="policyNumber"/>
<bean:parameter name="customerId" id="customerId"/>
<bean:parameter id="parentQuoteId" name="ParentQuoteId" />

<%
	Object custId = request.getAttribute("Object::Customer::CustomerId");	
    if((""+custId).length()>0 && custId !=null && !((""+custId).equals("0"))) {
		cId=custId; 
	}else if(request.getParameter("answer(Object::Customer::CustomerId)")!= null && request.getParameter("answer(Object::Customer::CustomerId)")!="") {%>
	<bean:parameter id="cIdpara" name="answer(Object::Customer::CustomerId)" />
	<%cId=cIdpara;%>
	<%}else if(request.getParameter("answer(customerId)")!= null) {%>
	<bean:parameter id="cIdparam2" name="answer(customerId)" />
	<%cId=cIdparam2;
	} else {%>	
	<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
	<%	cId=cIdSession;%>
	<%}
    String cId1 = ""+cId;
	if(Integer.parseInt(cId1) <= 0){%>
	<%
	cId = ""+customerId;
	}%>
	
<%
	
if(parentQuoteId!=null && (!parentQuoteId.toString().equals(""))){%>
	<dmshtml:Get_Customer_Agency_Agent_QuoteSummary nameInSession="quoteInsuredDetail" parentQuoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'></dmshtml:Get_Customer_Agency_Agent_QuoteSummary>	
	<logic:present name="quoteInsuredDetail" scope="request">

		<bean:define id="customerDetailMap" name="quoteInsuredDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		
		<%try{
		lngAgencyId=Long.parseLong(customerDetailMap.getString("agencyid"));
		}catch(Exception nfe) {lngAgencyId=0;    }
		try{
		lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
		}catch(Exception nfe) {lngAgentId=0;    }
		agencyName=customerDetailMap.getEncodedString("agencyname");
		agentFName=customerDetailMap.getEncodedString("agentFirstName");
		agentLName=customerDetailMap.getEncodedString("agentLastName");
		customerCreatedBy = customerDetailMap.getEncodedString("customerCreatedBy");
		customerCreatedDate = customerDetailMap.getString("customerCreatedDate");
		
		try{
		lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));
		}catch(Exception nfe) {lngGeneralAgencyId=0;    }
		generalAgencyName=customerDetailMap.getString("generalagencyname");%>
		

		
		<bean:parameter id="productVerId" name="productVerId" />
		<bean:parameter id="heading" name="heading"  />
		<%
		String parentQuoteStatus = "";
		%>
		<%if(request.getParameter("paretQuoteStatus") != null){ %>
			<bean:parameter id="pQS" name="paretQuoteStatus" />
			
		<% 
			parentQuoteStatus = pQS;
		}%>
		
		<%if(request.getAttribute("answer(Object::Quote::QuoteStatus)") != null){ %>
			
			
		<% 
			parentQuoteStatus = paretQuoteStatus.toString();
		}%>
		
		
		
		<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
			
		
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<%
String strQuoteId = parentQuoteId;
if(!strQuoteId.equals("null") && !strQuoteId.equals("")){ %>
<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
<%} %>
<logic:present name="parentQuoteDetail" scope="request">
	<bean:define id="parentQuoteDetailObject" name="parentQuoteDetail" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
	
	<bean:define id="prodId" name="parentQuoteDetail" property="productId" scope="request"/>

	
<!--##########################NEW QUOTE HEADER START #########################################-->
<%boolean premiumViewPrivilage=false;%>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREMIUM_VIEW"}%>' connector='or' negated="true">  
<%premiumViewPrivilage=true;%>
</dmshtml:dms_static_with_connector>
<dmshtml:Get_Quote_Header_Values nameInSession="headerDetail1" quoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+prodId)%>" hasPrimiumViewPrivileage="<%=premiumViewPrivilage %>" privileagedQueryString="PRIVILEGED_QUOTE_HEADER_ALGORITHM" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>"  queryString="QUOTE_HEADER_ALGORITHM"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
<logic:present name="headerDetail1" scope="request">
 	<bean:define id="htmlPage" name="headerDetail1"	/>	
 	<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0" align="left">
	<tr>
	<%	QuestionHashMap headerMap = (QuestionHashMap)htmlPage;
		ArrayList headingList = (ArrayList)headerMap.get("Object::Header::RowHeadings");
		ArrayList valueList = (ArrayList)headerMap.get("Object::Header::RowValues");
		
	%>
	
		<td align="left" valign="top">
			<div class="frame10border">
			<div class="formhead"><h2 class="left">Quote</h2></div>
			<table>
			<tr>
			<td valign="top">
				<div class="frlabel3 left">
				<%int lastVar1 = 0; %>
				<%for (int i=0;i< headingList.size();i++){%>
				<%String value1 = ""+valueList.get(i);
					if(!value1.equals("")){
					%>
					<%=headingList.get(i)+":"%><br />
					<%} %>
					<%lastVar1 = i +1; %>
					<%if(headingList.size() == lastVar1){ %>
						&nbsp;
					<%} %>
					<%} %>
					&nbsp;<br />
					&nbsp;<br />
				</div>
				</td>
				<td valign="top">
				<div class="frinfo3 left">
				<%int lastVar = 0; %>
				
					<%for (int j=0;j< valueList.size();j++){%>
					<%String rowHead1 = ""+headingList.get(j);
					String val1 = ""+valueList.get(j); 
					  if(!val1.equals("")){
						  if(rowHead1.indexOf("Policy")!=-1){
					%>
					<a href="../GetPolicySummary.do?answer(System::flag::requiredMultiSubmissionCheck)=&TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>&answer(Object::Quote::PaymentPlan)&answer()=<%="" %>" title="<bean:message key='ToolTip.QuoteSummary.PolicyNumber'/>"> <%=valueList.get(j)%></a><br />
					<%}else{ %>
					<%=valueList.get(j)%><br />
					<%}
					} %>
					<%lastVar = j+1; %>
					<%if(valueList.size() == lastVar){ %>
						&nbsp;
					<%} %>
					<%} %>
					&nbsp;<br />
					&nbsp;<br />
				</div>
				</td>
				</tr>
				</table>
			</div>
		</td >
		<td align="left"  valign="top">
			<div class="frame11border">
			<div class="formhead"><h2 class="left">Insured</h2><div align=right style=" margin-right: 5px;"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=cId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>" title="<bean:message key='ToolTip.QuoteSummary.InsuredDetails'/>">Insured Details</a></div></div>
				<table style="border-collapse: collapse;" cellspacing="0" cellpadding="0">
				<tr>
				<td>
				&nbsp;&nbsp;
				</td>				
				</tr>
				<tr>
				<td valign="top" class="frlabel3 left" style="width: 140px;margin: 0px; padding: 0px;">				
					Name:&nbsp;&nbsp;&nbsp;&nbsp;					
				</td>
				<td valign="top" class="frinfo11 left" style="width: 200px;margin: 0px; padding: 0px;">				
					<a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=cId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>" title="<bean:message key='ToolTip.QuoteSummary.InsuredName'/>"><bean:write name="quoteInsuredDetail" property="custname"/></a>					
				</td>
				</tr>
				<tr>	
				<td valign="top" class="frlabel3 left" style="width: 140px;margin: 0px; padding: 0px;">					
					Address:&nbsp;&nbsp;&nbsp;&nbsp;					
				</td>
				<td valign="top" class="frinfo11 left" style="width: 200px;margin: 0px; padding: 0px;">				
					<%=customerDetailMap.getEncodedString("address1")%>					
				</td>
				</tr>
				
				
				
				<tr>	
				<td valign="top" class="frlabel3 left" style="width: 140px;margin: 0px; padding: 0px;">					
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true">
					City State Zip:&nbsp;&nbsp;&nbsp;&nbsp; 									
					</dmshtml:dms_static_with_connector>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">
					City:&nbsp;&nbsp;&nbsp;&nbsp;<br />
					State:&nbsp;&nbsp;&nbsp;&nbsp;<br />
					Zip:&nbsp;&nbsp;&nbsp;&nbsp;<br />
					</dmshtml:dms_static_with_connector>
				</td>
				<td valign="top" class="frinfo11 left" style="width: 200px;margin: 0px; padding: 0px;">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true">
						<%=customerDetailMap.getString("city")%>,<%=customerDetailMap.getString("state")%>&nbsp; <%=customerDetailMap.getString("zip")%>			
					</dmshtml:dms_static_with_connector>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">
						<%=customerDetailMap.getString("city")%><br />
					<%=customerDetailMap.getString("state")%><br />
					<%=customerDetailMap.getString("zip")%><br />
						</dmshtml:dms_static_with_connector>
						</td>
				</tr>
				
					<tr>	
				<td valign="top" class="frlabel3 left" style="width: 140px;margin: 0px; padding: 0px;">				
					Agency Name:	&nbsp;&nbsp;&nbsp;&nbsp;		
				</td>
				<td valign="top" class="frinfo11 left" style="width: 200px;margin: 0px; padding: 0px;">				
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="false">	
					<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" target="Agency" ><%=agencyName%></a><br/>
					</dmshtml:dms_static_with_connector >	
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="true">	
					<a href="../EditAgencies.do?TabPanelName=Insured_Panel&agencyId=<%=customerDetailMap.getString("agencyid")%>&primaryObjectId=<%=customerDetailMap.getString("agencyid")%>&primaryObjectType=AGENCY" title="<bean:message key='ToolTip.QuoteSummary.AgencyName'/>"><%=customerDetailMap.getEncodedString("agencyname")%></a><br/>
					</dmshtml:dms_static_with_connector >	
				</td>
				</tr>	
				
				<tr>	
				<td valign="top" class="frlabel3 left" style="width: 140px;margin: 0px; padding: 0px;">			
					Agent Name:	&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td valign="top" class="frinfo11 left" style="width: 200px;margin: 0px; padding: 0px;">				
						
					<a href="../EditAgent.do?TabPanelName=Insured_Panel&entityId=<%=lngAgentId %>" title="<bean:message key='ToolTip.QuoteSummary.AgentName'/>"><%=customerDetailMap.getEncodedString("agentFirstName")%>&nbsp;<%=customerDetailMap.getEncodedString("agentLastName") %></a>
				</td>
				</tr>		
				<tr>
				<td>
				&nbsp;&nbsp;
				</td>				
				</tr>
							
				</table>
			</div>
		</td>
	</tr>
</table>
</logic:present>


<!--##########################NEW QUOTE HEADER END #########################################-->	

</logic:present>

	</logic:present>
<%}%>
