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

	<bean:define id="custId" name="policyMap" property="Object::Policy::CustomerId"/>
	<bean:define id="renewalPolicy" name="policyMap" property="Object::Policy::PolicyNumber"/>
	<bean:define id="renewalPremium" name="policyMap" property="Object::Quote::RenewalQuotePremium"/>
	<bean:define id="parentPolicyId" name="policyMap" property="Object::Policy::ParentPolicyId"/>
	<bean:define id="parentPolicyVerId" name="policyMap" property="Object::Policy::ParentPolVerId"/>
	<bean:define id="policyNumberInVer" name="policyMap" property="Object::Policy::PolicyVer::PolicyNumber"/>
	<bean:define id="policyVerId" name="policyMap" property="Object::Policy::PolVerId"/>
	<bean:define id="parentPolicyCurrentVerId" name="policyMap" property="Object::Policy::ParentPolicyCurrVerId"/>
	<bean:define id="policyId" name="policyMap" property="Object::Policy::PolicyId"/>
	<bean:define id="curVerId" name="policyMap" property="Object::Policy::CurVerId"/>
	<bean:define id="policyStatus" name="policyMap" property="Object::Policy::PolicyStatus"/>	
	<bean:define id="polIssuDate" name="policyMap" property="Object::Policy::PolIssuDate"/>		
	<bean:define id="createdBy" name="policyMap" property="Object::Policy::CreatedBy"/>	
	<bean:define id="polIssuedBy" name="policyMap" property="Object::Policy::PolIssuedBy"/>	
	<bean:define id="createdDate" name="policyMap" property="Object::Policy::CreatedDate"/>	
	<bean:define id="customerId" name="policyMap" property="Object::Policy::CustomerId"/>
	<bean:define id="renewalQuote" name="policyMap" property="Object::Quote::quoteId"/> 
	<bean:define id="renewalQuoteNum" name="policyMap" property="Object::Quote::quoteNum"/> 
	<bean:define id="renewalQuoteSubNum" name="policyMap" property="Object::Quote::quoteSubNum"/> 
	<bean:define id="renewalquoteStatus" name="policyMap" property="Object::Quote::RenewalQuoteStatus"/> 
	<bean:define id="renewalTerm" name="policyMap" property="Object::Quote::RenewalTerm"/> 
	<bean:define id="renewalQuoteEffectiveDate" name="policyMap" property="Object::Quote::RenewalQuoteEffDate"/> 
	<bean:define id="renewalQuoteCreatedDate" name="policyMap" property="Object::Quote::RenewalQuoteCreatedDate"/>
	<bean:define id="renewalQuoteCreatedBy" name="policyMap" property="Object::Quote::RenewalQuoteCreatedBy"/>
	<bean:define id="renewalQuoteBoundDate" name="policyMap" property="Object::Quote::BoundDate"/>
	<bean:define id="renewalQuoteBoundBy" name="policyMap" property="Object::Quote::BoundBy"/>
	<bean:define id="renewalQuoteIssuedDate" name="policyMap" property="Object::Quote::IssuedDate"/>
	<bean:define id="renewalQuoteIssuedBy" name="policyMap" property="Object::Quote::IssuedBy"/>
	<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 			
	<bean:define id="ownerId1" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
	<bean:define id="renewalPolicyEffectiveDate" name="policyMap" property="Object::Policy::PolEfftDate"/> 
	<bean:define id="renewalPolicyExpirationDate" name="policyMap" property="Object::Policy::PolExptDate"/> 
	<bean:define id="customerName" name="policyMap" property="Object::Policy::InsuredName"/>
	<%String insuredName = (""+customerName).replace("\\", "\\\\");
	insuredName = insuredName.replaceAll("\"","\\\\\\\"");
	insuredName = insuredName.replaceAll("<","&lt;");
	insuredName = insuredName.replaceAll(">","&gt;");%> 
	
	<%	String renewalQuoteNumber = "" + renewalQuoteNum;
		try{
			if(!(""+renewalQuoteSubNum).equals("")) {
			  if(Integer.parseInt(""+renewalQuoteSubNum)>=1){
				  renewalQuoteNumber = renewalQuoteNumber + "-" + renewalQuoteSubNum;			   			  
			  }
			}
	  	}catch(NumberFormatException nfe){}
	%>
	
	<%--<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=custId+""%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
   	<logic:present name="customerDetail1" scope="request"> 
 
	    <bean:define id="customerDetailMap" name="customerDetail1" scope="request"  type="com.dms.ejb.data.QuestionHashMap" />
    	<%
	     agencyId = customerDetailMap.getString("agencyid");
	   	 agencyName = customerDetailMap.getString("agencyname");
    	%>
   	</logic:present>	--%>
		<%if(renewalQuoteIssuedDate==""){ %>
			<%if(renewalQuoteBoundDate==""){ %>
				{"SNo":"<%=sNo+"" %>","RenewalQuote":"<%=renewalQuote+"" %>","RenewalQuoteNumber":"<%=renewalQuoteNumber+"" %>","InsuredName":"<%=""+insuredName %>","AgencyName":"<bean:write name="policyMap" property="Object::Policy::AgencyName"/>","RenewalQuoteStatus":"<%=renewalquoteStatus+"" %>","RenewalPremium":"<%=(renewalPremium+"")%>",
				"RenewalTerm":"<%=(renewalTerm+"")%>","RenewalQuoteEffectiveDate":"<%=(renewalQuoteEffectiveDate+"").substring(0, 10) %>","RenewalQuoteCreatedDate":"<%=(renewalQuoteCreatedDate+"").substring(0, 10) %>","RenewalQuoteCreatedBy":"<%=renewalQuoteCreatedBy+"" %>","RenewalPolicy":"<%=renewalPolicy+"" %>","RenewalBoundDate":"<%=(renewalQuoteBoundDate+"") %>",
				"RenewalBoundBy":"<%=renewalQuoteBoundBy+"" %>","RenewalIssuedDate":"<%=(renewalQuoteIssuedDate+"") %>","RenewalIssuedBy":"<%=renewalQuoteIssuedBy+"" %>","ParentPolicyId":"<%=(parentPolicyId+"")%>","ParentPolicyVerId":"<%=(parentPolicyVerId+"")%>","PolicyNumberInVer":"<%=(policyNumberInVer+"")%>","PolicyStatus":"<%=(policyStatus+"")%>","RenewalPolicyEffectiveDate":"<%=(renewalPolicyEffectiveDate+"")%>",
				"RenewalPolicyExpirationDate":"<%=(renewalPolicyExpirationDate+"")%>","ownerId":"<%=ownerId1+"" %>","userId1":"<%=(userId+"")%>","agencyId":"<bean:write name="policyMap" property="Object::Policy::AgencyId"/>","PolicyId":"<%=policyId+"" %>","PolicyVerId":"<%=policyVerId+"" %>","ParentPolicyCurrentVerId":"<%=parentPolicyCurrentVerId+"" %>","CustomerId":"<bean:write name="policyMap" property="Object::Policy::CustomerId" />","totRecords":"<%=policySize+"" %>"}
				<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>
			<%}else { %>
				{"SNo":"<%=sNo+"" %>","RenewalQuote":"<%=renewalQuote+"" %>","RenewalQuoteNumber":"<%=renewalQuoteNumber+"" %>","InsuredName":"<%=""+insuredName %>","AgencyName":"<bean:write name="policyMap" property="Object::Policy::AgencyName"/>","RenewalQuoteStatus":"<%=renewalquoteStatus+"" %>","RenewalPremium":"<%=(renewalPremium+"")%>",
				"RenewalTerm":"<%=(renewalTerm+"")%>","RenewalQuoteEffectiveDate":"<%=(renewalQuoteEffectiveDate+"").substring(0, 10) %>","RenewalQuoteCreatedDate":"<%=(renewalQuoteCreatedDate+"").substring(0, 10) %>","RenewalQuoteCreatedBy":"<%=renewalQuoteCreatedBy+"" %>","RenewalPolicy":"<%=renewalPolicy+"" %>","RenewalBoundDate":"<%=(renewalQuoteBoundDate+"").substring(0, 10) %>",
				"RenewalBoundBy":"<%=renewalQuoteBoundBy+"" %>","RenewalIssuedDate":"<%=(renewalQuoteIssuedDate+"") %>","RenewalIssuedBy":"<%=renewalQuoteIssuedBy+"" %>","ParentPolicyId":"<%=(parentPolicyId+"")%>","ParentPolicyVerId":"<%=(parentPolicyVerId+"")%>","PolicyNumberInVer":"<%=(policyNumberInVer+"")%>","PolicyStatus":"<%=(policyStatus+"")%>","RenewalPolicyEffectiveDate":"<%=(renewalPolicyEffectiveDate+"")%>",
				"RenewalPolicyExpirationDate":"<%=(renewalPolicyExpirationDate+"")%>","ownerId":"<%=ownerId1+"" %>","userId1":"<%=(userId+"")%>","agencyId":"<bean:write name="policyMap" property="Object::Policy::AgencyId"/>","PolicyId":"<%=policyId+"" %>","PolicyVerId":"<%=policyVerId+"" %>","ParentPolicyCurrentVerId":"<%=parentPolicyCurrentVerId+"" %>","CustomerId":"<bean:write name="policyMap" property="Object::Policy::CustomerId" />","totRecords":"<%=policySize+"" %>"}
				<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>
			<%} %>
<%}else if(renewalQuoteBoundDate==""){ %>
		{"SNo":"<%=sNo+"" %>","RenewalQuote":"<%=renewalQuote+"" %>","RenewalQuoteNumber":"<%=renewalQuoteNumber+"" %>","InsuredName":"<%=""+insuredName %>","AgencyName":"<bean:write name="policyMap" property="Object::Policy::AgencyName"/>","RenewalQuoteStatus":"<%=renewalquoteStatus+"" %>","RenewalPremium":"<%=(renewalPremium+"")%>",
		"RenewalTerm":"<%=(renewalTerm+"")%>","RenewalQuoteEffectiveDate":"<%=(renewalQuoteEffectiveDate+"").substring(0, 10) %>","RenewalQuoteCreatedDate":"<%=(renewalQuoteCreatedDate+"").substring(0, 10) %>","RenewalQuoteCreatedBy":"<%=renewalQuoteCreatedBy+"" %>","RenewalPolicy":"<%=renewalPolicy+"" %>","RenewalBoundDate":"<%=(renewalQuoteBoundDate+"") %>",
		"RenewalBoundBy":"<%=renewalQuoteBoundBy+"" %>","RenewalIssuedDate":"<%=(renewalQuoteIssuedDate+"").substring(0, 10) %>","RenewalIssuedBy":"<%=renewalQuoteIssuedBy+"" %>","ParentPolicyId":"<%=(parentPolicyId+"")%>","ParentPolicyVerId":"<%=(parentPolicyVerId+"")%>","PolicyNumberInVer":"<%=(policyNumberInVer+"")%>","PolicyStatus":"<%=(policyStatus+"")%>","RenewalPolicyEffectiveDate":"<%=(renewalPolicyEffectiveDate+"")%>",
		"RenewalPolicyExpirationDate":"<%=(renewalPolicyExpirationDate+"")%>","ownerId":"<%=ownerId1+"" %>","userId1":"<%=(userId+"")%>","agencyId":"<bean:write name="policyMap" property="Object::Policy::AgencyId"/>","PolicyId":"<%=policyId+"" %>","PolicyVerId":"<%=policyVerId+"" %>","ParentPolicyCurrentVerId":"<%=parentPolicyCurrentVerId+"" %>","CustomerId":"<bean:write name="policyMap" property="Object::Policy::CustomerId" />","totRecords":"<%=policySize+"" %>"}
		<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>
<%}else { %>
		{"SNo":"<%=sNo+"" %>","RenewalQuote":"<%=renewalQuote+"" %>","RenewalQuoteNumber":"<%=renewalQuoteNumber+"" %>","InsuredName":"<%=""+insuredName %>","AgencyName":"<bean:write name="policyMap" property="Object::Policy::AgencyName"/>","RenewalQuoteStatus":"<%=renewalquoteStatus+"" %>","RenewalPremium":"<%=(renewalPremium+"")%>",
		"RenewalTerm":"<%=(renewalTerm+"")%>","RenewalQuoteEffectiveDate":"<%=(renewalQuoteEffectiveDate+"").substring(0, 10) %>","RenewalQuoteCreatedDate":"<%=(renewalQuoteCreatedDate+"").substring(0, 10) %>","RenewalQuoteCreatedBy":"<%=renewalQuoteCreatedBy+"" %>","RenewalPolicy":"<%=renewalPolicy+"" %>","RenewalBoundDate":"<%=(renewalQuoteBoundDate+"").substring(0, 10) %>",
		"RenewalBoundBy":"<%=renewalQuoteBoundBy+"" %>","RenewalIssuedDate":"<%=(renewalQuoteIssuedDate+"").substring(0, 10) %>","RenewalIssuedBy":"<%=renewalQuoteIssuedBy+"" %>","ParentPolicyId":"<%=(parentPolicyId+"")%>","ParentPolicyVerId":"<%=(parentPolicyVerId+"")%>","PolicyNumberInVer":"<%=(policyNumberInVer+"")%>","PolicyStatus":"<%=(policyStatus+"")%>","RenewalPolicyEffectiveDate":"<%=(renewalPolicyEffectiveDate+"")%>",
		"RenewalPolicyExpirationDate":"<%=(renewalPolicyExpirationDate+"")%>","ownerId":"<%=ownerId1+"" %>","userId1":"<%=(userId+"")%>","agencyId":"<bean:write name="policyMap" property="Object::Policy::AgencyId"/>","PolicyId":"<%=policyId+"" %>","PolicyVerId":"<%=policyVerId+"" %>","ParentPolicyCurrentVerId":"<%=parentPolicyCurrentVerId+"" %>","CustomerId":"<bean:write name="policyMap" property="Object::Policy::CustomerId" />","totRecords":"<%=policySize+"" %>"}
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

