<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dms.ejb.data.QuestionHashMap" %>

<%Object cId=null;%>
<%String customerCreatedBy=""; %>
<%String customerCreatedDate="";
String customerUpdatedDate=""; 
String agentName="";
String policyAgencyName="";
long policyAgencyId=0;
long policyAgentId=0;
String policyInsuredName = "";
String policyInsuredAddress1 = "";
String policyInsuredCity = "";
String policyInsuredState = "";
String policyInsuredZip = "";
%>

<%long lngAgencyId=0;%>
<%long lngAgentId=0;%>
<%String agencyName="";%>
<%String agentFName="";%>
<%String agentLName="";%>
<%String generalAgencyId="";%>
<%long lngGeneralAgencyId=0;%>
<%String generalAgencyName="";%>

<%
	Object custId = request.getAttribute("Object::Customer::CustomerId");	
    if((""+custId).length()>0 && custId !=null && !((""+custId).equals("0"))) {
		cId=custId; 
	}else if(request.getParameter("answer(Object::Customer::CustomerId)")!= null && request.getParameter("answer(Object::Customer::CustomerId)")!="") {%>
	
<%@page import="com.dms.ejb.insurance.policy.PolicyInsuredDetail"%><bean:parameter id="cIdpara" name="answer(Object::Customer::CustomerId)" />
	<%cId=cIdpara;%>
	<%}else if(request.getParameter("answer(customerId)")!= null) {%>
	<bean:parameter id="cIdparam2" name="answer(customerId)" />
	<%cId=cIdparam2;
	} else {%>	
	<bean:define id="customerId" name="PolicySummary" property="answer(customerId)" />
	<%	cId=customerId;%>
	<%}%>
	


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
		


        <bean:parameter id="policyId" name="policyId" />
		<bean:parameter id="policyVerId" name="policyVerId" />
		<bean:parameter id="parentPolicyId" name="parentPolicyId" />
		<bean:parameter id="currentVerId" name="currentVerId" />
		<bean:parameter id="policyNumber" name="policyNumber" />
		<bean:parameter id="title" name="title" />
		<bean:parameter id="isRenewal" name="isRenewal" />		
		<bean:parameter id="renewalPolicyVerId" name="renewalPolicyVerId" />
		<bean:parameter id="renewalPolicyId" name="renewalPolicyId" />
		<bean:parameter id="isRenewalFlag" name="isRenewalFlag" />
		<bean:parameter id="primaryParentQuoteId" name="primaryParentQuoteId" />
		<bean:parameter id="primarySubQuoteId" name="primarySubQuoteId" />
		<bean:parameter id="primaryParentQuoteVerId" name="primaryParentQuoteVerId" />
		<bean:parameter id="primarySubQuoteVerId" name="primarySubQuoteVerId" />
		<bean:parameter id="parentPolicyVerId" name="parentPolicyVerId" />
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
		
		<%	if((""+renewalPolicyId).equals("")) {
			renewalPolicyId = ""+policyId;
			}
			if((""+renewalPolicyVerId).equals("")) {
				renewalPolicyVerId = ""+policyVerId;
			}			
		%>
		
		<%String documentType ="ISSUANCE";%>
		
		<dmshtml:isActivePolicy policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
		<%String isActivePolicy =(String) request.getAttribute("isActivePolicy");  
		  String bcolor ="#C6DEEA";
		  String header ="policyheadernav";
		   if (!(isActivePolicy.equals("Y"))){
			   bcolor ="#CCCCCC";
			   header ="priorpolicyheadernav";
			   
		   }
		
		%>
		
		<script type="text/javascript" src="../Scripts/JScripts/PolicyHeader.js">
		</script>
		
		
		
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<!--##########################NEW QUOTE HEADER START #########################################-->
<%boolean premiumViewPrivilage=false;%>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREMIUM_VIEW"}%>' connector='or' negated="true">  
<%premiumViewPrivilage=true;%>
</dmshtml:dms_static_with_connector>


<dmshtml:Get_Policy_HeaderInfo nameInSession="parentPolicyHeaderInfo" policyId='<%=""+policyId%>' policyVerId='<%=""+policyVerId %>' policyNumber="<%=""+policyNumber%>" documentType='<%=documentType%>' ownerId='<%=""+ownerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />

<bean:define id="parentProdId" name="parentPolicyHeaderInfo" property="productId" scope="request"/>
<bean:define id="parentProdVerId" name="parentPolicyHeaderInfo" property="productVerId" scope="request"/>
<bean:define id="agentInfoMap" name="parentPolicyHeaderInfo" property="agentInfo" scope="request"/>
<bean:define id="policyInsured" name="parentPolicyHeaderInfo" property="policyInsuredList" scope="request"/>
<% if(policyInsured != null) { 
		java.util.ArrayList insuredInformationList = (java.util.ArrayList)policyInsured;
		if(insuredInformationList.size() > 0) {
			PolicyInsuredDetail policyInsuredDetail = (PolicyInsuredDetail)insuredInformationList.get(0);
			policyInsuredName = policyInsuredDetail.getInsuredFullName();
			policyInsuredAddress1 = policyInsuredDetail.getAddress1();
			policyInsuredCity = policyInsuredDetail.getCity();
			policyInsuredState = policyInsuredDetail.getState();
			policyInsuredZip = policyInsuredDetail.getZip();
		} else {
			policyInsuredName = customerDetailMap.getString("custname");
			policyInsuredAddress1 = customerDetailMap.getString("address1"); 
			policyInsuredCity = customerDetailMap.getString("city");
			policyInsuredState = customerDetailMap.getString("state"); 
			policyInsuredZip = customerDetailMap.getString("zip");
		}
	}
	else {
		policyInsuredName = customerDetailMap.getString("custname");
		policyInsuredAddress1 = customerDetailMap.getString("address1"); 
		policyInsuredCity = customerDetailMap.getString("city");
		policyInsuredState = customerDetailMap.getString("state"); 
		policyInsuredZip = customerDetailMap.getString("zip");
	}
%>
<%agentName=((com.dms.ejb.data.QuestionHashMap)agentInfoMap).getString("Object::Entity::FirstName")+" "+((com.dms.ejb.data.QuestionHashMap)agentInfoMap).getString("Object::Entity::MaidenName")+" "+((com.dms.ejb.data.QuestionHashMap)agentInfoMap).getString("Object::Entity::LastName"); %>

<bean:define id="agencyList" name="parentPolicyHeaderInfo" property="policyAgencyList" scope="request"/>
<%com.dms.ejb.insurance.policy.PolicyAgencyDetail policyAgencyDetail=((com.dms.ejb.insurance.policy.PolicyAgencyDetail)((java.util.ArrayList)agencyList).get(0)); %>
<%policyAgencyName = policyAgencyDetail.getMBusinessName(); %>
<%policyAgencyId = policyAgencyDetail.getMAgencyId(); %>
<%policyAgentId = policyAgencyDetail.getMAgentId(); %>

<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId='<%=""+renewalPolicyId%>' policyVerId='<%=""+renewalPolicyVerId %>' policyNumber="<%=""+policyNumber%>" documentType='<%=documentType%>' ownerId='<%=""+ownerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<logic:present name="policyHeaderInfo">
<bean:define id="prodId" name="policyHeaderInfo" property="productId" scope="request"/>
<bean:define id="prodVerId" name="policyHeaderInfo" property="productVerId" scope="request"/>
<bean:parameter id="parentQuoteId" name="parentQuoteId" />
<bean:parameter id="parentQuoteVerId" name="parentQuoteVerId" />

<div class="formpagenew1">
 	<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0">
	<tr>
	
	
		<td align="left" valign="top">
		    <dmshtml:Get_Policy_Header_Values nameInSession="headerDetail1" policyId="<%=Long.parseLong(""+policyId)%>"  policyVerId='<%=Long.parseLong(""+policyVerId)%>' productId="<%=Long.parseLong(""+parentProdId)%>" productVerId="<%=Long.parseLong(""+parentProdVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="POLICY_HEADER"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 

         	<bean:define id="htmlPage" name="headerDetail1"	/>	

	<div class="frame4border">
		    <dmshtml:Get_Policy_Header_Values nameInSession="currentHeaderDetail1" policyId="<%=Long.parseLong(""+renewalPolicyId)%>"  policyVerId='<%=Long.parseLong(""+renewalPolicyVerId)%>' productId="<%=Long.parseLong(""+prodId)%>" productVerId="<%=Long.parseLong(""+prodVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="POLICY_HEADER"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
		    <logic:present name="currentHeaderDetail1" scope="request">
         	<bean:define id="currentHtmlPage" name="currentHeaderDetail1"	/>	
	<div class="formhead"><h2 class="left">Policy</h2></div>											
	<%
		QuestionHashMap headerMap = (QuestionHashMap)htmlPage;
		ArrayList headingList = (ArrayList)headerMap.get("Object::Header::RowHeadings");
		ArrayList valueList = (ArrayList)headerMap.get("Object::Header::RowValues");
		QuestionHashMap currentHeaderMap = (QuestionHashMap)currentHtmlPage;
		ArrayList currentHeadingList = (ArrayList)currentHeaderMap.get("Object::Header::RowHeadings");
		ArrayList currentValueList = (ArrayList)currentHeaderMap.get("Object::Header::RowValues");
		int counter = 0;
		for(counter=0;counter<headingList.size();counter++) {
			if(currentHeadingList.get(counter).equals("Policy Number")){				
				headingList.remove(counter);
				valueList.remove(counter);
				currentHeadingList.remove(counter);
				currentValueList.remove(counter);
			} else if(currentHeadingList.get(counter).equals("Plan") || currentHeadingList.get(counter).equals("Type") || currentHeadingList.get(counter).equals("Quote") || currentHeadingList.get(counter).equals("Issued")) {				
				headingList.remove(counter);
				valueList.remove(counter);
				headingList.add(counter,currentHeadingList.get(counter));
				valueList.add(counter,currentValueList.get(counter));
			} else {				
				
			}
		}	
		int headerSize = headingList.size();
		int rowNos = headerSize/2;
		int extraNos = headerSize%2;
		int firstColumnSize = rowNos;
		%>
		<table>
		<tr>
		<td valign="top">
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">
		<div class="frlabel4 ">
				<%for (int i=0;i< firstColumnSize;i++){%>
				  <%String value1 = ""+valueList.get(i);%>
				  <%if(!value1.equals("")){%>
				 	  <%=headingList.get(i)+":"%><br />
				  <%}%>
				<%}%>
				&nbsp;
		</div>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true">
		<div class="frlabel4 " style="width:85px;">
				<%for (int i=0;i< firstColumnSize;i++){%>
				  <%String value1 = ""+valueList.get(i);%>
				  <%if(!value1.equals("")){%>
				 	  <%=headingList.get(i)+":"%><br />
				  <%}%>
				<%}%>
				&nbsp;
		</div>
		</dmshtml:dms_static_with_connector>
		</td>
		<td valign="top">
		<div class="frinfo4policyheader ">
				<%for (int j=0;j< firstColumnSize;j++){%>
					<%String rowHead1 = ""+headingList.get(j);
				      String val1 = ""+valueList.get(j);%> 
			  	   <%if(!val1.equals("")){%>
						 <%if(rowHead1.indexOf("Quote")!=-1){%>
						 	<%if((""+isRenewalFlag).equals("Y")){ %>
								<a href="/GetEndorsementQuoteDetail.do?TabPanelName=Quote_Panel&answer(parentPolicyStatus)=<%=""%>&answer(Object::Customer::CustomerId)=<%=""+cId.toString()%>&answer(QuoteId)=<%=""+primaryParentQuoteId%>&answer(parentQuoteId)=<%=""+primaryParentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>&answer(policyEffDate)=<%=""%>&answer(policyExpDate)=<%=""%> "  title="<bean:message key='ToolTip.PolicySummary.QuoteNumber'/>"><%=valueList.get(j)%></a><br />						 	   
						 	 <%} else { %>
						 	 	<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>"  title="<bean:message key='ToolTip.PolicySummary.QuoteNumber'/>"><%=valueList.get(j)%></a><br />
						 	 <%} %>
						 <%}else{%>
						       <%=valueList.get(j)%><br />
						 <%}%>
			   	   <%}%>
       			<%}%>
				&nbsp;
		<%if((""+primaryParentQuoteId).equals("") || (""+primaryParentQuoteId).equals("0")) { %>		
	    <html:hidden property="answer(PrimaryOrRenewalQuoteId)"  value="<%=""+parentQuoteId%>" styleId="PrimaryOrRenewalQuoteId" />	
	    <%} else {%>
	    <html:hidden property="answer(PrimaryOrRenewalQuoteId)"  value="<%=""+primaryParentQuoteId%>" styleId="PrimaryOrRenewalQuoteId" />	
	    <%} %>			 
		</div>	
		</td>
		<td valign="top">						
		<div class="frlabel4 ">
	        	<%for (int i=firstColumnSize;i< headingList.size();i++){%>
			       <%String value1 = ""+valueList.get(i);%>
				  <%if(!value1.equals("")){%>
				 	  <%=headingList.get(i)+":"%><br />
				  <%}%>
				<%}%>
		</div>
		</td>
		<td valign="top">
	    <div class="frinfo4policyheader ">
	           
				<%for (int j=firstColumnSize;j< valueList.size();j++){%>
		          <%String rowHead1 = ""+headingList.get(j);
				    String val1 = ""+valueList.get(j);%> 
			  	   <%if(!val1.equals("")){%>
						 <%if(rowHead1.indexOf("Quote")!=-1){%>
						 	<%if((""+isRenewalFlag).equals("Y")){ %>
								<a href="/GetEndorsementQuoteDetail.do?TabPanelName=Quote_Panel&answer(parentPolicyStatus)=<%=""%>&answer(Object::Customer::CustomerId)=<%=""+cId.toString()%>&answer(QuoteId)=<%=""+primaryParentQuoteId%>&answer(parentQuoteId)=<%=""+primaryParentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>&answer(policyEffDate)=<%=""%>&answer(policyExpDate)=<%=""%> "  title="<bean:message key='ToolTip.PolicySummary.QuoteNumber'/>"><%=valueList.get(j)%></a><br />						 	   
						 	<%} else { %>
						 	   <a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>"  title="<bean:message key='ToolTip.PolicySummary.QuoteNumber'/>"><%=valueList.get(j)%></a><br />	
						 	<%} %>
						 <%}else{%>
						       <%=valueList.get(j)%><br />
						 <%}%>
			   	   <%}%>
				<%}%>
				&nbsp;
		</div>
		</td>	
		</tr>
	</table>
	</div>
   </logic:present>
		</td >
		<td align="left"  valign="top">
			<div class="frame11border">
			<div class="formhead"><h2 class="left">Insured</h2><div align=right style=" margin-right: 5px;"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=cId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>" title="<bean:message key='ToolTip.PolicySummary.InsuredDetails'/>">Insured Details</a></div></div>
			<table style="border-collapse: collapse;" cellspacing="0" cellpadding="0">
			<tr>
			<td>
			&nbsp;&nbsp;
			</td>
			</tr>
			<tr>
			
			<td class="frlabel5 left" valign="top" style="margin: 0px; padding: 0px;">
				Name:&nbsp;&nbsp;&nbsp;
			</td>
			<td class="frinfo5" style="margin: 0px; padding: 0px;">
				<a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=cId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>" title="<bean:message key='ToolTip.PolicySummary.InsuredName'/>"><%=policyInsuredName.replaceAll("<","&lt;").replaceAll(">","&gt;") %></a>
			</td>
			</tr>
			<tr>
			
			<td class="frlabel5 left" valign="top" style="margin: 0px; padding: 0px;">
				Address:&nbsp;&nbsp;&nbsp;
			</td>
			<td class="frinfo5" style="margin: 0px; padding: 0px;">
				<%=policyInsuredAddress1.replaceAll("<","&lt;").replaceAll(">","&gt;")%>
			</td>
			</tr>
			<tr>
			
			<td class="frlabel5 left" valign="top" style="margin: 0px; padding: 0px;">
				City:&nbsp;&nbsp;&nbsp;
			</td>
			<td class="frinfo5" style="margin: 0px; padding: 0px;">
				<%=policyInsuredCity%>
			</td>
			</tr>
			<tr>
		
			<td class="frlabel5 left" valign="top" style="margin: 0px; padding: 0px;">
				State:&nbsp;&nbsp;&nbsp;
			</td>
			<td class="frinfo5" style="margin: 0px; padding: 0px;">
				<%=policyInsuredState%>
			</td>
			</tr>
			<tr>
			
			<td class="frlabel5 left" valign="top" style="margin: 0px; padding: 0px;">
				Zip:&nbsp;&nbsp;&nbsp;
			</td>
			<td class="frinfo5" style="margin: 0px; padding: 0px;">
				<%=policyInsuredZip%>
			</td>
			</tr>
			
			<tr>
		
			<td class="frlabel5 left" valign="top" style="margin: 0px; padding: 0px;">
				Agency Name:&nbsp;&nbsp;&nbsp;
			</td>
			<td class="frinfo5" style="margin: 0px; padding: 0px;">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="false">	
					<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" target="Agency" ><%=agencyName.replaceAll("<","&lt;").replaceAll(">","&gt;")%></a>
					</dmshtml:dms_static_with_connector >
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="true">	
					<a href="../EditAgencies.do?TabPanelName=Insured_Panel&agencyId=<%=policyAgencyId%>&primaryObjectId=<%=policyAgencyId%>&primaryObjectType=AGENCY" title="<bean:message key='ToolTip.PolicySummary.AgencyName'/>"><%=policyAgencyName.replaceAll("<","&lt;").replaceAll(">","&gt;")%></a>
					</dmshtml:dms_static_with_connector >

			</td>
			</tr>
			
			<tr>
			
			<td class="frlabel5 left" valign="top" style="margin: 0px; padding: 0px;">
				Agent Name:&nbsp;&nbsp;&nbsp;
			</td>
			<td class="frinfo5" style="margin: 0px; padding: 0px;">
			
					<a href="../EditAgent.do?TabPanelName=Insured_Panel&entityId=<%=policyAgentId %>" title="<bean:message key='ToolTip.PolicySummary.AgentName'/>"><%=agentName.replaceAll("<","&lt;").replaceAll(">","&gt;")%></a>
					<html:hidden property="answer(custname)"  value="<%=customerDetailMap.getString("custname")%>" styleId="custname" />
			</td>
			</tr>									
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
</div>

</logic:present>
	</logic:present>
<%}%>

