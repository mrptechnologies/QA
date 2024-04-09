<%response.setHeader("Cache-Control", "no-store");%>
<%if(request.getAttribute("listOfSubmission")!=null){	
	java.util.ArrayList subList = (java.util.ArrayList)request.getAttribute("listOfSubmission");%>
<%for(int i=0;i<subList.size();i++){	
	com.dms.ejb.data.QuestionHashMap subQMap = (com.dms.ejb.data.QuestionHashMap)subList.get(i);
java.lang.String updatedDate = subQMap.getString("Object::Alert::UpdatedDate");
java.lang.String alertId = subQMap.getString("Object::Alert::AlertId");
java.lang.String assignedUser = subQMap.getString("Object::Alert::AssignedUser");
java.lang.String ownerId = subQMap.getString("Object::Alert::OwnerId");
java.lang.String insuredId = subQMap.getString("Object::Submission::InsuredId");
java.lang.String insuredName = subQMap.getEncodedString("Object::Submission::InsuredName");
java.lang.String state = subQMap.getString("Object::Submission::InsuredState");
java.lang.String agencyId = subQMap.getString("Object::Submission::AgencyId");
java.lang.String broker = subQMap.getString("Object::Submission::AgencyName");
java.lang.String submissionId = subQMap.getString("Object::Submission::SubmissionId");
java.lang.String submissionNum = subQMap.getString("Object::Submission::SubmissionNum");
java.lang.String submissionVerId = subQMap.getString("Object::Submission::SubmissionVerId");
java.lang.String custId = subQMap.getString("Object::Submission::InsuredId");
java.lang.String status = subQMap.getString("Object::Alert::ObjectStatus");
java.lang.String assignee ="";
String submissionLink="<a id='' rel='' target=''  href='../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(TabPanelName)=Submission_Panel&answer(customerId)="+custId+"&customerId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)="+custId+"&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionVerId)="+submissionVerId+"'/>"+submissionNum+"</a>";
if(i==0){%>
<%="Date"+"____~____*"+"Submission #"+"____~____*"+"Insured Name"+"____~____*"+"State"+"____~____*"+"SubmissionId"+"____~____*"+"SubmissionVerId"+"____~____*"+"Status"+"____~____*"+"Broker"+"____~____*"+"Priority"+"____~____*"+"Delete"+"____~____*"+"Url"+"____~____*"+"CustomerId"+"____~____*"+"PanelName"+"____~____*"+"AlertId"+"\n"%>
<%}%>
 <%=updatedDate+"____~____*"+submissionNum+"____~____*"+insuredName+"____~____*"+state+"____~____*"+submissionId+"____~____*"+submissionVerId+"____~____*"+status+"____~____*"+broker+"____~____*"+ "" +"____~____*"+""+"____~____*"+submissionLink+"____~____*"+custId+"____~____*"+"Submission_Panel"+"____~____*"+alertId+"\n"%>
<%}%>
<%}%>
