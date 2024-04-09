<%if(request.getAttribute("listOfRecord")!=null){	
	java.util.ArrayList recordList = (java.util.ArrayList)request.getAttribute("listOfRecord");%>
<%for(int i=0;i<recordList.size();i++){	
	com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap)recordList.get(i);
java.lang.String updatedDate = qMap.getString("Object::Alert::UpdatedDate");
java.lang.String alertId = qMap.getString("Object::Alert::AlertId");
java.lang.String assignedUser = qMap.getString("Object::Alert::AssignedUser");
java.lang.String ownerId = qMap.getString("Object::Alert::OwnerId");
java.lang.String alertMessage = qMap.getString("Object::Alert::AlertMessage");
java.lang.String objectType = qMap.getString("Object::Alert::ObjectType");

java.lang.String insuredId = "";
java.lang.String insuredName = "";
java.lang.String state = "";
java.lang.String agencyId = "";
java.lang.String broker = "";
java.lang.String objectId = "";
java.lang.String objectNo = "";
java.lang.String objectVerId = "";
java.lang.String custId = "";
java.lang.String policyId = "";
java.lang.String policyVerId = "";
java.lang.String policyNumber = "";
java.lang.String quoteSubNum = "";
String objectURL="";

if(objectType.equalsIgnoreCase("Quote")) {
		objectNo = qMap.getString("Object::QuoteHeader::QuoteNum");
		insuredName = qMap.getEncodedString("Object::QuoteHeader::InsuredName");
		state = qMap.getString("Object::QuoteHeader::State");
		custId = qMap.getString("Object::QuoteHeader::CustomerId");
		objectId = qMap.getString("Object::QuoteHeader::QuoteId");
		objectVerId = qMap.getString("Object::QuoteHeader::QuoteVerId");
		broker = qMap.getEncodedString("Object::QuoteHeader::AgencyName");
		agencyId = qMap.getString("Object::QuoteHeader::AgencyId");
		policyId = qMap.getString("Object::QuoteHeader::PolicyId");
		policyVerId = qMap.getString("Object::QuoteHeader::PolicyVerId");
		policyNumber = qMap.getString("Object::QuoteHeader::PolicyNum");
		quoteSubNum = qMap.getString("Object::QuoteHeader::QuoteSubNum");
		objectURL="<a id='' rel='' target=''  href='../SyncQuoteWithEmployerGroupAndProductAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)="+custId+"&answer(QuoteId)="+objectId+"&answer(parentQuoteId)="+objectId+"&answer(ownerId)="+ownerId+"&answer(policyNumber)="+policyNumber+"&answer(Object::Policy::ParentPolicyId)="+policyId+"&answer(Object::Policy::ParentPolicyVerId)="+policyVerId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(userId)="+assignedUser+"'>"+objectNo+quoteSubNum+"</a>";
}

if(objectType.equalsIgnoreCase("Submission")) {
	insuredId = qMap.getString("Object::Submission::InsuredId");
	insuredName = qMap.getEncodedString("Object::Submission::InsuredName");
	state = qMap.getString("Object::Submission::InsuredState");
	agencyId = qMap.getString("Object::Subm	ission::AgencyId");
	broker = qMap.getEncodedString("Object::Submission::AgencyName");
	objectId = qMap.getString("Object::Submission::SubmissionId");
	objectNo = qMap.getString("Object::Submission::SubmissionNum");
	objectVerId = qMap.getString("Object::Submission::SubmissionVerId");
	custId = qMap.getString("Object::Submission::InsuredId");
	objectURL="<a id='' rel='' target=''  href='../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)="+objectVerId+"&answer(Object::Submission::SubmissionId)="+objectId+"&answer(TabPanelName)=Submission_Panel&answer(customerId)="+custId+"&customerId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(requestForm)=Submission"+"&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION"+"&answer(Object::Submission::InsuredId)="+custId+"'>"+objectNo+"</a>";

}

java.lang.String assignee =""; 
if(i==0){%>
<%="Assignee"+"____~____*"+"Date"+"____~____*"+"Quote/Submission #"+"____~____*"+"Message"+"____~____*"+"Insured Name"+"____~____*"+"Broker"+"____~____*"+"Priority"+"____~____*"+"Delete"+"____~____*"+"Object Url"+"____~____*"+"CustomerId"+"____~____*"+"ObjectId"+"____~____*"+"AgencyId"+"____~____*"+"UserId"+"____~____*"+"Quote PanelName"+"____~____*"+"Submission PanelName"+"____~____*"+"OwnerId"+"____~____*"+"AlertId"+"____~____*"+"ObjectType"+"____~____*"+"ObjectVerId"+"____~____*"+"PolicyId"+"____~____*"+"PolicyVerId"+"____~____*"+"PolicyNumber"+"____~____*"+"QuoteSubNum"+"\n"%>
<%}%>
<%=assignee+"____~____*"+updatedDate+"____~____*"+objectNo+"____~____*"+alertMessage+"____~____*"+insuredName+"____~____*"+broker+"____~____*"+""+"____~____*"+""+"____~____*"+objectURL+"____~____*"+custId+"____~____*"+objectId+"____~____*"+agencyId+"____~____*"+assignedUser+"____~____*"+"Quote_Panel"+"____~____*"+"Submission_Panel"+"____~____*"+ownerId+"____~____*"+alertId+"____~____*"+objectType+"____~____*"+objectVerId+"____~____*"+policyId+"____~____*"+policyVerId+"____~____*"+policyNumber+"____~____*"+quoteSubNum+"\n"%>
<%}%>
<%}%>



