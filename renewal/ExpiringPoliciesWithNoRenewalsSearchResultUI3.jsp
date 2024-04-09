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
 
	<bean:define id="totRec" property="answer(Object::Policy::TotalRec)"  name="SearchRenewal"   scope="request" />
	

{"recordsReturned":<%=listSize %>,"totalRecords":<%=totRec+"" %>,"startIndex":<%=startIndex %>,"sort":"id","dir":"asc","pageSize":<%=""+results %>,

"records"
:[	
<logic:iterate id="policyMap" name="findArrOfPolicy"> 

<%
sNo=sNo+1;
%>

	<bean:define id="policyNumber" name="policyMap" property="Object::Policy::PolicyNumber"/>
	<bean:define id="policyNumberInVer" name="policyMap" property="Object::Policy::PolicyVer::PolicyNumber"/>
	<bean:define id="policyStatus" name="policyMap" property="Object::Policy::PolicyStatus"/>	
	<bean:define id="polEfftDate" name="policyMap" property="Object::Policy::PolEfftDate"/>
	<bean:define id="polExptDate" name="policyMap" property="Object::Policy::PolExptDate"/>
	<bean:define id="polIssuDate" name="policyMap" property="Object::Policy::PolIssuDate"/>		
	<bean:define id="createdBy" name="policyMap" property="Object::Policy::CreatedBy"/>	
	<bean:define id="totalPremium" name="policyMap" property="Object::Policy::TotalPremium"/>	
	<bean:define id="polIssuedBy" name="policyMap" property="Object::Policy::PolIssuedBy"/>	
	<bean:define id="createdDate" name="policyMap" property="Object::Policy::CreatedDate"/>	
	<bean:define id="customerId" name="policyMap" property="Object::Policy::CustomerId"/>
	<bean:define id="policyId" name="policyMap" property="Object::Policy::PolicyId"/>	
	<bean:define id="policyVerId" name="policyMap" property="Object::Policy::PolVerId"/>	
	<bean:define id="nonRenewal" name="policyMap" property="Object::Policy::NonRenewal"/>
	<bean:define id="referOnRenewal" name="policyMap" property="Object::Policy::ReferOnRenewal"/>
	<bean:define id="insuredState" name="policyMap" property="Object::Policy::Insured::State"/>
	<bean:define id="ownerId1" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 		
	<bean:define id="custId" name="policyMap" property="Object::Policy::CustomerId"/>
	<bean:define id="customerName" name="policyMap" property="Object::Policy::InsuredName"/>
	<%String insuredName = (""+customerName).replace("\\", "\\\\"); 
	insuredName = insuredName.replaceAll("\"","\\\\\\\"");
	insuredName = insuredName.replaceAll("<","&lt;");
	insuredName = insuredName.replaceAll(">","&gt;");%> 
	
	<%--<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=custId+""%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
   	<logic:present name="customerDetail1" scope="request"> 
 
	    <bean:define id="customerDetailMap" name="customerDetail1" scope="request"  type="com.dms.ejb.data.QuestionHashMap" />
    	<%
	     agencyId = customerDetailMap.getString("agencyid");
    	 agencyName = customerDetailMap.getString("agencyname");
    	%>
   	</logic:present>	--%>
	
		<%if(polIssuDate==""){ %>
		{"SNo":"<%=sNo+"" %>","PolicyNumber":"<%=policyNumber+"" %>","PolicyNumberInVer":"<%=(policyNumberInVer+"")%>","PolicyStatus":"<%=policyStatus+"" %>","InsuredName":"<%=""+insuredName %>","EffectiveDate":"<%=(polEfftDate+"").substring(0, 10) %>",
"ExpirationDate":"<%=(polExptDate+"").substring(0, 10) %>","TotalPremium":"<%=(totalPremium+"") %>","ProductName":"<bean:write name="policyMap" property="Object::Policy::ProductName"/>","BoundDate":"<%=(createdDate+"").substring(0, 10)%>","BoundBy":"<%=createdBy+"" %>",
"IssuedDate":"<%=(polIssuDate+"")%>","IssuedBy":"<%=polIssuedBy+"" %>","AgencyName":"<bean:write name="policyMap" property="Object::Policy::AgencyName"/>","PolicyStatus":"<%=policyStatus+"" %>","PolicyId":"<%=policyId+"" %>","PolicyVerId":"<%=policyVerId+"" %>","NonRenewal":"<%=""+nonRenewal %>","ReferOnRenewal":"<%=""+referOnRenewal %>","InsuredState":"<%=""+insuredState %>","CustomerId":"<bean:write name="policyMap" property="Object::Policy::CustomerId" />","totRecords":"<%=policySize+"" %>"}
<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>
<%}else{ %>
{"SNo":"<%=sNo+"" %>","PolicyNumber":"<%=policyNumber+"" %>","PolicyNumberInVer":"<%=(policyNumberInVer+"")%>","PolicyStatus":"<%=policyStatus+"" %>","InsuredName":"<%=""+insuredName %>","EffectiveDate":"<%=(polEfftDate+"").substring(0, 10) %>",
"ExpirationDate":"<%=(polExptDate+"").substring(0, 10) %>","TotalPremium":"<%=(totalPremium+"") %>","ProductName":"<bean:write name="policyMap" property="Object::Policy::ProductName"/>","BoundDate":"<%=(createdDate+"").substring(0, 10)%>","BoundBy":"<%=createdBy+"" %>",
"IssuedDate":"<%=(polIssuDate+"").substring(0, 10)%>","IssuedBy":"<%=polIssuedBy+"" %>","AgencyName":"<bean:write name="policyMap" property="Object::Policy::AgencyName"/>","PolicyStatus":"<%=policyStatus+"" %>","PolicyId":"<%=policyId+"" %>","PolicyVerId":"<%=policyVerId+"" %>","NonRenewal":"<%=""+nonRenewal %>","ReferOnRenewal":"<%=""+referOnRenewal %>","InsuredState":"<%=""+insuredState %>","CustomerId":"<bean:write name="policyMap" property="Object::Policy::CustomerId" />","totRecords":"<%=policySize+"" %>"}
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

