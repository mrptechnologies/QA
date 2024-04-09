<%
response.setHeader("Cache-Control", "no-store");
if(request.getAttribute("listOfQuote")!=null){	
	java.util.ArrayList quoteList = (java.util.ArrayList)request.getAttribute("listOfQuote");%>
<%for(int i=0;i<quoteList.size();i++){	
	com.dms.ejb.data.QuestionHashMap quoteQMap = (com.dms.ejb.data.QuestionHashMap)quoteList.get(i);
java.lang.String updatedDate = quoteQMap.getString("Object::Alert::UpdatedDate");
java.lang.String alertId = quoteQMap.getString("Object::Alert::AlertId");
java.lang.String assignedUser = quoteQMap.getString("Object::Alert::AssignedUser");
java.lang.String ownerId = quoteQMap.getString("Object::Alert::OwnerId");
java.lang.String quoteNo = quoteQMap.getString("Object::QuoteHeader::QuoteNum");
java.lang.String quoteStatus = quoteQMap.getString("Object::QuoteHeader::QuoteStatus");
java.lang.String quoteType = quoteQMap.getString("Object::QuoteHeader::QuoteType");
java.lang.String insuredName = quoteQMap.getEncodedString("Object::QuoteHeader::InsuredName");
java.lang.String state = quoteQMap.getString("Object::QuoteHeader::State");
java.lang.String custId = quoteQMap.getString("Object::QuoteHeader::CustomerId");
java.lang.String quoteId = quoteQMap.getString("Object::QuoteHeader::QuoteId");
java.lang.String quoteVerId = quoteQMap.getString("Object::QuoteHeader::QuoteVerId");
java.lang.String policyId = quoteQMap.getString("Object::QuoteHeader::PolicyId");
java.lang.String policyVerId = quoteQMap.getString("Object::QuoteHeader::PolicyVerId");
java.lang.String policyNum = quoteQMap.getString("Object::QuoteHeader::PolicyNum");
java.lang.String broker = quoteQMap.getString("Object::QuoteHeader::AgencyName");
java.lang.String agencyId = quoteQMap.getString("Object::QuoteHeader::AgencyId");
java.lang.String alertMessage = quoteQMap.getString("Object::Alert::AlertMessage");
java.lang.String alertStatus = quoteQMap.getString("Object::Alert::ObjectStatus");

java.lang.String subjId = ""+0;
java.lang.String quoteId1 = quoteQMap.getString("Object::Quote::ParentQuoteId");
java.lang.String quoteVerId1 = quoteQMap.getString("Object::Quote::ParentQuoteVerId");					
java.lang.String subQuoteId = quoteQMap.getString("Object::Quote::SubQuoteId");
java.lang.String subQuoteVerId = quoteQMap.getString("Object::Quote::SuQuoteVerId");
java.lang.String productId = quoteQMap.getString("Object::Quote::ProductId");
java.lang.String productVerId = quoteQMap.getString("Object::Quote::ProductVerId");
java.lang.String custId1 = quoteQMap.getString("Object::Customer::CustomerId");
java.lang.String quoteSubNum = quoteQMap.getString("Object::QuoteHeader::QuoteSubNum");
java.lang.String assignee =""; 
java.lang.String subjAction ="../getSubjectivity.go";
String subjURL="";
String quoteURL="";
if(Integer.parseInt(quoteSubNum)>0){quoteSubNum='-'+quoteSubNum; }else{quoteSubNum=""; }

if(quoteType.equalsIgnoreCase("NEW_BUSINESS")) {
	subjAction = "../GetUWQuoteSummaryAction.go";
} 
if(quoteType.equalsIgnoreCase("ENDORSEMENT")) {
	subjAction = "../getEndorsementSubjectivity.go";
}
String quoteAction ="../GetUWQuoteSummaryAction.do";
if(request.getParameter("answer(alertType)")!=null){
	String alertName = ""+request.getParameter("answer(alertType)");
	if(alertName.equalsIgnoreCase("POST_BIND_BROKER_ALERT_NAME")){
		if(!policyNum.equals("")){
			quoteNo = ""+policyNum;
			quoteAction = "../GetPolicySummary.do";
			subjAction = "../GetPolicySummary.do";
			quoteSubNum="0";
		}
	}
}
quoteURL="<a id='' rel='' target=''  href='"+quoteAction+"?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)="+custId+"&answer(QuoteId)="+quoteId+"&answer(parentQuoteId)="+quoteId+"&answer(Object::Quote::QuoteVerId)="+quoteVerId+"&answer(policyNumber)="+policyNum+"&answer(Object::Policy::ParentPolicyId)="+policyId+"&answer(APP_TAB_TYPE)=YUI&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(Object::Policy::ParentPolicyVerId)="+policyVerId+"'>"+quoteNo+quoteSubNum+"</a>";;
subjURL="<a id='' rel='' target=''  href='" +subjAction+"?TabPanelName=Quote_Panel"+"&answer(activeTabName)=SubjectivityTab"+"&answer(QuoteId)="+quoteId+"&answer(parentQuoteId)="+quoteId+"&answer(Object::Quote::QuoteVerId)="+quoteVerId+"&answer(Object::Quote::ParentQuoteId)="+quoteId+"&answer(DEFAULT_POLICY_TAB)=SubjectivityTab&answer(Object::Quote::ProductVerId)="+productVerId+"&answer(Object::Quote::ParentQuoteVerId)="+quoteVerId+"&answer(Object::Quote::SubQuoteId)="+subQuoteId+"&answer(policyNumber)="+policyNum+"&answer(APP_TAB_TYPE)=YUI&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(DEFAULT_POLICY_TAB)=SUBJECTIVITY&answer(Object::Quote::SuQuoteVerId)="+subQuoteVerId+"&answer(Object::Quote::ProductId)="+productId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Quote::QuoteStatus)="+quoteStatus+"'>"+alertMessage+"</a>";
if(i==0){%>
<%="Date"+"____~____*"+"Quote #"+"____~____*"+"Subjectivity"+"____~____*"+"Insured Name"+"____~____*"+"Status"+"____~____*"+"Priority"+"____~____*"+"Delete"+"____~____*"+"Quote Url"+"____~____*"+"Subj Url"+"____~____*"+"SubjId"+"____~____*"+"productId"+"____~____*"+"productVerId"+"____~____*"+"QuoteId"+"____~____*"+"QuoteVerId"+"____~____*"+"SubQuoteId"+"____~____*"+"SubQuoteVerId"+"____~____*"+"QuoteStatus"+"____~____*"+"QuoteType"+"____~____*"+"PolicyId"+"____~____*"+"PolicyVerId"+"____~____*"+"PolicyNum"+"____~____*"+"CustomerId"+"____~____*"+"AgencyId"+"____~____*"+"UserId"+"____~____*"+"Quote PanelName"+"____~____*"+"OwnerId"+"____~____*"+"AlertId"+"____~____*"+"QuoteSubNum"+"\n"%>
<%}%>
<%=updatedDate+"____~____*"+quoteNo+"____~____*"+alertMessage+"____~____*"+insuredName+"____~____*"+alertStatus+"____~____*"+""+"____~____*"+""+"____~____*"+quoteURL+"____~____*"+subjURL+"____~____*"+subjId+"____~____*"+productId+"____~____*"+productVerId+"____~____*"+quoteId+"____~____*"+quoteVerId+"____~____*"+subQuoteId+"____~____*"+subQuoteVerId+"____~____*"+quoteStatus+"____~____*"+quoteType+"____~____*"+policyId+"____~____*"+policyVerId+"____~____*"+policyNum+"____~____*"+custId1+"____~____*"+agencyId+"____~____*"+assignedUser+"____~____*"+"Quote_Panel"+"____~____*"+ownerId+"____~____*"+alertId+"____~____*"+quoteSubNum+"\n"%>
<%}%>
<%}%>
