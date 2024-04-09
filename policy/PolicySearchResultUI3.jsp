<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%@ page import="java.util.ArrayList"%>
<%response.setHeader("Cache-Control", "no-store");%>


<logic:present name='findArrOfPolicy'>

<% String startIndex = ""+request.getParameter("startIndex");%>
<%int sNo=Integer.parseInt(startIndex); %>
<%ArrayList subList = (ArrayList)request.getAttribute("findArrOfPolicy");
long listSize =subList.size();

String policySize=""+request.getAttribute("policySize");

String results = ""+request.getParameter("results");%>
 
	<bean:define id="totRec" property="answer(Object::Policy::TotalRec)"  name="SearchPolicy"   scope="request" />
	

{"recordsReturned":<%=listSize %>,"totalRecords":<%=totRec+"" %>,"startIndex":<%=startIndex %>,"sort":"id","dir":"asc","pageSize":<%=""+results %>,

"records"
:[	
<logic:iterate id="policyMap" name="findArrOfPolicy"> 

<%
sNo=sNo+1;
String agencyId = "";
%>

	<bean:define id="policyNumber" name="policyMap" property="Object::Policy::PolicyNumber"/>
	<bean:define id="policyNumberInVer" name="policyMap" property="Object::Policy::PolicyVer::PolicyNumber"/>
	<bean:define id="customerId" name="policyMap" property="Object::Policy::CustomerId"/>	
	<bean:define id="policyStatus" name="policyMap" property="Object::Policy::PolicyStatus"/>
	<bean:define id="policyType" name="policyMap" property="Object::Policy::PolicyType"/>	
	<bean:define id="polPolicyVerPolicyType" name="policyMap" property="Object::Policy::PolPolicyVerPolicyType"/>	
	<bean:define id="polEfftDate" name="policyMap" property="Object::Policy::PolEfftDate"/>
	<bean:define id="polIssuDate" name="policyMap" property="Object::Policy::PolIssuDate"/>		
	<bean:define id="createdBy" name="policyMap" property="Object::Policy::CreatedBy"/>	
	<bean:define id="isRenewal" name="policyMap" property="Object::Policy::IsRenewal"/>	
	<bean:define id="policyId" name="policyMap" property="Object::Policy::PolicyId"/>	
	<bean:define id="policyVerId" name="policyMap" property="Object::Policy::PolVerId"/>	
	<bean:define id="currentVerId" name="policyMap" property="Object::Policy::CurVerId"/>
	<bean:define id="customerName" name="policyMap" property="Object::Policy::InsuredName"/>	
	<bean:define id="BusinessType" name="policyMap" property="Object::Policy::BusinessType"/>
	<%String insuredName = (""+customerName).replace("\\", "\\\\");
	insuredName = insuredName.replaceAll("\"","\\\\\\\"");
	insuredName = insuredName.replaceAll("<","&lt;");
	insuredName = insuredName.replaceAll(">","&gt;");%>


		<bean:define id="ownerId1" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
		
		<bean:define id="custId" name="policyMap" property="Object::Customer::CustomerId"/>
		<%if(polIssuDate==""){ %>
		{"SNo":"<%=sNo+"" %>","InsuredName":"<%=""+insuredName %>","PolicyNumberInVer":"<a href='../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(conditionFlag)=Y &answer(TabPanelName)=Policy_Panel&answer(policyId)=<%=policyId%>&answer(policyVerId)=<%=policyVerId%>&answer(Object::Application::ApplicationType)=POLICY_APPLICATION'><%=policyNumberInVer%></a>","PolicyNumber":"<%=policyNumber+"" %>","PolicyStatus":"<%=policyStatus+"" %>","PolicyType":"<%=policyType+"" %>","PolPolicyVerPolicyType":"<%=polPolicyVerPolicyType+"" %>","EffectiveDate":"<%=(polEfftDate+"").substring(0, 10) %>",
"IssuedDate":"<%=(polIssuDate+"")%>","CreatedBy":"<bean:write name="policyMap" property="Object::Policy::CreatedBy"/>","CustomerId":"<%=customerId+"" %>","IsRenewal":"<%=isRenewal+"" %>","PolicyId":"<%=policyId+"" %>","PolicyVerId":"<%=policyVerId+"" %>","CurrentVerId":"<%=currentVerId+"" %>","totRecords":"<%=policySize+"" %>","BusinessType":"<%=BusinessType+"" %>"}
<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>
<%}else{ %>
{"SNo":"<%=sNo+"" %>","InsuredName":"<%=""+insuredName %>","PolicyNumberInVer":"<a href='../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(conditionFlag)=Y &answer(TabPanelName)=Policy_Panel&answer(policyId)=<%=policyId%>&answer(policyVerId)=<%=policyVerId%>&answer(Object::Application::ApplicationType)=POLICY_APPLICATION'><%=policyNumberInVer%></a>","PolicyNumber":"<%=policyNumber+"" %>","PolicyStatus":"<%=policyStatus+"" %>","PolicyType":"<%=policyType+"" %>","PolPolicyVerPolicyType":"<%=polPolicyVerPolicyType+"" %>","EffectiveDate":"<%=(polEfftDate+"").substring(0, 10) %>",
"IssuedDate":"<%=(polIssuDate+"").substring(0, 10) %>","CreatedBy":"<bean:write name="policyMap" property="Object::Policy::CreatedBy"/>","CustomerId":"<%=customerId+"" %>","IsRenewal":"<%=isRenewal+"" %>","PolicyId":"<%=policyId+"" %>","PolicyVerId":"<%=policyVerId+"" %>","CurrentVerId":"<%=currentVerId+"" %>","totRecords":"<%=policySize+"" %>","BusinessType":"<%=BusinessType+"" %>"}
<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>
<%} %>

</logic:iterate>
]}
</logic:present>
<logic:notPresent name='findArrOfPolicy'>
{"recordsReturned":0,"totalRecords":0,"startIndex":0,"sort":"id","dir":"asc","pageSize":25,
"records"
:[]}
</logic:notPresent>







