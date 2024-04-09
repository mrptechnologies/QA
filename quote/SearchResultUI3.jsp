<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%@ page import="java.util.ArrayList"%>
<%response.setHeader("Cache-Control", "no-store");%>

<logic:present name='searchresultQuotesDisplay'>
<% String startIndex = ""+request.getParameter("startIndex");%>
<%
String userName="";%>
<%double  totalPremium = 0.0;%>
 <%java.text.DecimalFormat dFormat = new java.text.DecimalFormat("$####0");%>
<%ArrayList subList = (ArrayList)request.getAttribute("searchresultQuotesDisplay");
long listSize =subList.size();
String results = ""+request.getParameter("results");%>
<bean:define id="SearchQuoteTotalRec" property="answer(SearchQuote::TotalRec)"  name="FindQuote"   scope="request" />
{"recordsReturned":<%=listSize %>,"totalRecords":<%=SearchQuoteTotalRec+"" %>,"startIndex":<%=startIndex %>,"sort":"id","dir":"asc","pageSize":<%=""+results %>,
"records"
:[

<%long sNo=Integer.parseInt(startIndex); %>

<logic:iterate id="quoteMap" name="searchresultQuotesDisplay" >
<bean:define id="customerName" name="quoteMap" property="Object::Quote::customerName" />
<% String insuredName = (""+customerName).replace("\\", "\\\\");
insuredName = insuredName.replaceAll("\"","\\\\\\\"");
insuredName = insuredName.replaceAll("<","&lt;");
insuredName = insuredName.replaceAll(">","&gt;");%>
<%sNo=sNo+1;
String agencyId = "";
%>
	<bean:define id="quoteNum" name="quoteMap" property="Object::Quote::quoteNum"/>
	<bean:define id="quoteSubNum" name="quoteMap" property="Object::Quote::quoteSubNum"/>
		<bean:define id="quoteId" name="quoteMap" property="Object::Quote::quoteId"/>
		<bean:define id="ownerId1" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
		<bean:define name="quoteMap" property="Object::Quote::totalPremium" id="totalPremiumId" />
		<%totalPremium=Double.parseDouble(totalPremiumId+""); %>
		<bean:define id="custId" name="quoteMap" property="Object::Customer::CustomerId"/>
		<bean:define id="policyNumber" name="quoteMap" property="Object::Quote::PolicyNumber"/>
		<bean:define id="primaryPolicyNumber" name="quoteMap" property="Object::Quote::PrimaryPolicyNumber"/>
		<bean:define id="parentPolicyId" name="quoteMap" property="Object::Quote::ParentPolicyId"/>
		<bean:define id="parentPolicyVerId" name="quoteMap" property="Object::Quote::ParentPolicyVerId"/>
		<bean:define id="currentVerId" name="quoteMap" property="Object::Quote::CurrentVerId"/>
		<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
		<% 
		 userName=userId+"";%>
		 <bean:define id="userId1" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
		 <dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=custId+""%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
   <logic:present name="customerDetail1" scope="request">
  
 
    <bean:define id="customerDetailMap" name="customerDetail1" scope="request"  type="com.dms.ejb.data.QuestionHashMap" />
    <%
     agencyId = customerDetailMap.getString("agencyid");
    %>
   </logic:present>					 	
	
<%		
		try{
 			  if(Integer.parseInt(""+quoteSubNum)>=1){
 				quoteNum = quoteNum + "-" + quoteSubNum;			   			  
 			  }
 		  	}catch(NumberFormatException nfe){}
			
%>

{"SNo":<%=sNo%>,"InsuredName":"<a href='../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=custId%>'><%=insuredName%></a>","QuoteNumber":"<a href='../SyncQuoteWithEmployerGroupAndProductAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=custId%>&answer(QuoteId)=<%=quoteId%>&answer(parentQuoteId)=<%=quoteId%>&answer(ownerId)=<%=ownerId1%>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(userId)=<%=userId%>'><%=quoteNum%></a>","QuoteStatus":"<bean:write name="quoteMap" property="Object::Quote::quoteStatus" />","EffectiveDate":"<bean:write name="quoteMap" property="Object::Quote::quoteEffectiveDate" />","LastModifiedDate"
:"<bean:write name="quoteMap" property="Object::Quote::updatedDate" />","LastModifiedBy":"<bean:write name="quoteMap" property="Object::Quote::updatedBy" />","TotalPremium":"<%=dFormat.format(totalPremium)%>","QuoteType":"<bean:write name="quoteMap" property="Object::Quote::quoteType" />","CustomerId":"<bean:write name="quoteMap" property="Object::Customer::CustomerId" />","TotalRecords":"<%=SearchQuoteTotalRec+"" %>",
"quoteId":"<%=quoteId%>",
"ownerId":"<%=ownerId1%>",
"userId1":"<%="" + userId1 %>",
"agencyId":"<%=agencyId%>","PolicyNumber":"<%=policyNumber%>","PrimaryPolicyNumber":"<%=primaryPolicyNumber%>","ParentPolicyId":"<%=parentPolicyId%>","ParentPolicyVerId":"<%=parentPolicyVerId%>","CurrentVerId":"<%=currentVerId%>"}
<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>


</logic:iterate>
]}
</logic:present>

<logic:notPresent name='searchresultQuotesDisplay'>
{"recordsReturned":0,"totalRecords":0,"startIndex":0,"sort":"id","dir":"asc","pageSize":25,
"records"
:[]}
</logic:notPresent>

