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

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>

<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
 <bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="agencyId2" property="answer(Object::Agency::AgencyId)" name="PolicyList" scope="request"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />

<%String agencyIdTemp="";%>
<%String agencyIdtoLink="";%>
<%String strAgentFName="";%>
<%String strAgentLName="";%>
<%long lngAgentId1=0;%>
<%long lngAgentId=0;%>
<%long lngAgencyTemp=0;%>
<%String agencyName2="";%>
<%long lngagentId=0;
String agencyName="";
String generalAgencyId = "";
long agencyId=0;
long lobId=0;
String clearanceStatus ="";
String insuredStatus ="";
%>
<logic:present name="customerDetail1" scope="request">
	<bean:define id="customerDetailMap" name="customerDetail1"
		scope="request" type="com.dms.ejb.data.QuestionHashMap" />
	<%try{%>
	<%agencyId=Long.parseLong(customerDetailMap.getString("agencyid"));%>
	<%}catch(Exception nfe) {agencyId=0;    }%>
	<%try{
			generalAgencyId = customerDetailMap.getString("generalagencyid");
			lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
			}catch(Exception nfe) {lngAgentId=0;    }																						
			agencyIdTemp=""+agencyId;
			lngAgencyTemp=Long.parseLong(agencyIdTemp);
			agencyId2=Long.parseLong(agencyIdTemp);
			agencyName2=customerDetailMap.getString("agencyname");			
			%>
</logic:present>
<% Date  myDate = Calendar.getInstance().getTime();
		   DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		   String today = formatter.format(myDate);%>
<dmshtml:Get_Customer_HeaderDetail_ByCustomerId
								nameInSession="customerMap" customerId='<%=""+Customerid%>'
								dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
								
							<bean:define id="customerDetailMap" name="customerMap" scope="request" type="com.dms.ejb.data.QuestionHashMap" /> 
							<% String EmpGrpState=customerDetailMap.getString("Object::Customer::State");%>
								
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_POLICY_LINK_NON_BTA"}%>' connector='or' negated="true">
	<table>
		<tr>
			&nbsp;
		</tr>
		<tr>
			<td width="1%"></td>
			<td width="25%" class="links">							
				<a  href="../GetProductGroupsActionNonBTA.do?&customerId=<%=Customerid.toString()%>&answer(Object::Customer::CustomerId)=<%=Customerid.toString()%>
				&answer(Object::Agency::AgencyId)=<%=agencyId2.toString()%>TabPanelName=Quote_Panel&answer(Object::CustomerAdditional::ProgramName)=NON BTA&answer(createQuoteEffectiveDate)=yes
				&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Customer::CustomerId)=<%=Customerid.toString()%>&answer(Object::Quote::QuoteStatus)=In Progress
				&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=userId.toString()%>&formName=form::GETCLQUOTEDETAILS
				&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::Quote::ProductStatus)=DEVELOPMENT&answer(State)=<%=EmpGrpState%>
				&answer(Object::Risk::RiskId)=15&answer(Object::Quote::QuoteStartDate)=<%=""+today %>
				&answer(Object::Quote::NewQuote)=YES&answer(Object::Quote::ProductStatus)=DEVELOPMENT"  class="button2"> Add Policy</a>		
			</td>
		</tr>
	</table>
</dmshtml:dms_static_with_connector>
<table class="loctable" cellpadding="0" cellspacing="0" border="0">
				
				<logic:present name="noPolicy">
					<tr>
						<td class="error">
							No Policies associated to the insured
						</td>
					</tr>
				</logic:present>
				
				<logic:present name="policyList">
					<tr>						
					<th valign="center" align="center">
							Policy Number
						</th>						
					<th valign="center" align="center">
							Created Date
						</th>
					<th valign="center" align="center">
							Effective Date
						</th>
					<th valign="center" align="center">
							Policy Status
						</th>
					<th valign="center" align="center">
							Created By
						</th>
					</tr>					
				<%--
       				java.util.ArrayList arrListpolicy = (java.util.ArrayList)request.getAttribute("policyList");
		     		for(int polIndex=0;polIndex<arrListpolicy.size();polIndex++){
					com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrListpolicy.get(polIndex);							
					String policyNumber = qmap.getString("Object::Policy::PolicyNumber");
				--%>
				<logic:iterate id="policyList" name="policyList">
					<tr>
						<td>
							<bean:define id="policyNumber" property="Object::Policy::PolicyNumber" name="policyList" />	
							<bean:define id="BusinessType" property="Object::Policy::BusinessType" name="policyList" />	
													
						</td>
					</tr>
					<tr>
						<td>
						<% if((""+BusinessType).indexOf("NonBTA")!=-1){%>
							<a href="../GetNonBTAPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>">
								<bean:write name="policyList" property="Object::Policy::PolicyNumber" />
								<%-- =""+qmap.getString("Object::Policy::PolicyNumber") --%>
							</a>
						<%}else{%>
						<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>">
								<bean:write name="policyList" property="Object::Policy::PolicyNumber" />
								<%-- =""+qmap.getString("Object::Policy::PolicyNumber") --%>
							</a>							
							<%} %>
						</td>
						<td>
							<bean:define id="polCreatedDate" name="policyList" property="Object::Policy::PolCreatedDate" />
							<%=(""+polCreatedDate).substring(0,10) %>
							<%-- =""+qmap.getString("Object::Policy::PolCreatedDate") --%>
						</td>
						<td>
							<bean:define id="polEfftDate" name="policyList" property="Object::Policy::PolEfftDate" />
							<%=(""+polEfftDate).substring(0,10) %>
							<%-- =""+qmap.getString("Object::Policy::PolEfftDate") --%>
						</td>
						<td>
							<bean:write name="policyList" property="Object::Policy::PolicyStatus" />
							<%-- =""+qmap.getString("Object::Policy::PolEfftDate") --%>
						</td>
						<td>
							<bean:write name="policyList" property="Object::Policy::CreatedBy" />
							<%-- =""+qmap.getString("Object::Policy::CreatedBy") --%>
						</td>						
					</tr>		
					</logic:iterate>		
				<%-- } --%>			
				</logic:present>							
			</table>
