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
	
if(cId!=null && (!cId.toString().equals(""))){%>
	<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
	<logic:present name="customerDetail1" scope="request">

		<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		
		<%try{
		lngAgencyId=Long.parseLong(customerDetailMap.getString("agencyid"));
		}catch(Exception nfe) {lngAgencyId=0;    }
		try{
		lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
		}catch(Exception nfe) {lngAgentId=0;    }
		agencyName=customerDetailMap.getString("agencyname");
		agentFName=customerDetailMap.getString("agentfirstname");
		agentLName=customerDetailMap.getString("agentlastname");
		customerCreatedBy = customerDetailMap.getString("customerCreatedBy");
		customerCreatedDate = customerDetailMap.getString("customerCreatedDate");
		
		try{
		lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));
		}catch(Exception nfe) {lngGeneralAgencyId=0;    }
		generalAgencyName=customerDetailMap.getString("generalagencyname");%>
		

		<bean:parameter id="parentQuoteId" name="ParentQuoteId" />
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
	<bean:define id="prodVerId" name="parentQuoteDetail" property="productVerId" scope="request"/>
	
	
<!--##########################NEW QUOTE HEADER START #########################################-->
<%boolean premiumViewPrivilage=false;%>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREMIUM_VIEW"}%>' connector='or' negated="true">  
<%premiumViewPrivilage=true;%>
</dmshtml:dms_static_with_connector>

<dmshtml:Get_Quote_Header_Values nameInSession="headerDetail1" quoteId='<%=Long.parseLong(""+parentQuoteId)%>' productId='<%=Long.parseLong(""+prodId)%>' hasPrimiumViewPrivileage='<%=premiumViewPrivilage %>' privileagedQueryString="PRIVILEGED_QUOTE_HEADER_ALGORITHM" productVerId='<%=Long.parseLong(""+prodVerId)%>' ownerId='<%=Long.parseLong(""+ownerId)%>'  queryString="QUOTE_HEADER_ALGORITHM" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
<logic:present name="headerDetail1" scope="request">
 	<bean:define id="htmlPage" name="headerDetail1"	/>	
 	
<div class="formpagenew1">
<table border="0" width="100%" style="border-collapse: collapse;" id="table1" cellspacing="0" cellpadding="0">
		<tr>
		<td align="left"  valign="top">
			<div class="frame12border">
			<div class="formhead"><h2 class="left"><a style='color: #003a76; text-decoration:none' href='javascript:void(0);' id='insuredHeader' onClick='showHideInsuredHeaderUI3();'>+ Insured</a></h2><div align=right style=" margin-right: 5px;"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=cId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>" >Insured Details</a></div></div>
			<table id="insuredContent" style="display:none;">
			<tr>
			<td>
			<table>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
			<td valign="top" class="frlabel6 left" style="width: 180px;margin: 0px; padding: 0px;">
				&nbsp;&nbsp;&nbsp;Name:
			</td>
			
			<td valign="top" class="frinfo6" style="width: 200px;margin: 0px; padding: 0px;">
			<a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=cId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>" ><%=customerDetailMap.getString("custname")%></a>
			</td>
			</tr>
			
			<tr>
			<td valign="top" class="frlabel6 left" style="width: 180px;margin: 0px; padding: 0px;">
				&nbsp;&nbsp;&nbsp;Address:
			</td>
			
			<td valign="top" class="frinfo6" style="width: 200px;margin: 0px; padding: 0px;">
			<%=customerDetailMap.getString("address1")%>
			</td>
			</tr>
			
			<tr>
			<td valign="top" class="frlabel6 left" style="width: 180px;margin: 0px; padding: 0px;">
				&nbsp;&nbsp;&nbsp;City:
			</td>
			
			<td valign="top" class="frinfo6" style="width: 200px;margin: 0px; padding: 0px;">
			<%=customerDetailMap.getString("city")%>
			</td>
			</tr>
			<tr>
			<td valign="top" class="frlabel6 left" style="width: 180px;margin: 0px; padding: 0px;">
				&nbsp;&nbsp;&nbsp;State:
			</td>
			
			<td valign="top" class="frinfo6" style="width: 200px;margin: 0px; padding: 0px;">
			<%=customerDetailMap.getString("state")%>
					
										<html:hidden property="answer(custname)"  value="<%=customerDetailMap.getString("custname")%>" styleId="custname" />
			</td>
			</tr>	
			
			</td>
			
			</tr>
			
			</table>
			
			
				<td valign="top">
					<table>			
					<tr>
				<td>
					&nbsp;
				</td>
			</tr>		
						<tr>
			<td valign="top" class="frlabel6 left" style="width: 180px;margin: 0px; padding: 0px;">
				&nbsp;&nbsp;&nbsp;Zip:
			</td>
			
			<td valign="top" class="frinfo6" style="width: 200px;margin: 0px; padding: 0px;">
				&nbsp;&nbsp;&nbsp;<%=customerDetailMap.getString("zip")%>
			</td>
			</tr>
			
			<tr>
			<td valign="top" class="frlabel6 left" style="width: 200px;margin: 0px; padding: 0px;">
			&nbsp;&nbsp;&nbsp;Agency Name:
			</td>
			
			<td valign="top" class="frinfo6" style="width: 200px;margin: 0px; padding: 0px;">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="true">	
					&nbsp;&nbsp;&nbsp;<a href="../EditAgencies.do?TabPanelName=Insured_Panel&agencyId=<%=customerDetailMap.getString("agencyid")%>&primaryObjectId=<%=customerDetailMap.getString("agencyid")%>&primaryObjectType=AGENCY"><%=customerDetailMap.getString("agencyname")%></a><br/>
					</dmshtml:dms_static_with_connector >
	
			</td>
			</tr>		
			<tr>
			<td valign="top" class="frlabel6 left" style="width: 180px;margin: 0px; padding: 0px;">
			&nbsp;&nbsp;&nbsp;Agent Name:
			</td>
			
			<td valign="top" class="frinfo6" style="width: 200px;margin: 0px; padding: 0px;">
				&nbsp;&nbsp;&nbsp;<a href="../EditAgent.do?TabPanelName=Insured_Panel&entityId=<%=lngAgentId %>"><%=customerDetailMap.getString("agentfirstname")%>&nbsp;<%=customerDetailMap.getString("agentlastname") %></a>
					<html:hidden property="answer(custname)"  value="<%=customerDetailMap.getString("custname")%>" styleId="custname" />
	
			</td>
			</tr>	
			
			<tr>
					</table>				
				</td>
			
			</tr>
			
											
			</table>
			</div>
			</td>
			
			
			
			
			
			
			
	</tr>
			
		
</table>		
</div>
</logic:present>
</logic:present>
</logic:present>
	<%}%>
