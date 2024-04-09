<%if(request.getAttribute("listOfSubmission")!=null){	
	java.util.ArrayList subList = (java.util.ArrayList)request.getAttribute("listOfSubmission");%>
<%for(int i=0;i<subList.size();i++){	
	com.dms.ejb.data.QuestionHashMap subQMap = (com.dms.ejb.data.QuestionHashMap)subList.get(i);
java.lang.String updatedDate = subQMap.getString("Object::Alert::UpdatedDate");
java.lang.String assignedUser = subQMap.getString("Object::Alert::AssignedUser");
java.lang.String ownerId = subQMap.getString("Object::Alert::OwnerId");
java.lang.String insuredId = subQMap.getString("Object::Submission::InsuredId");
java.lang.String insuredName = subQMap.getString("Object::Submission::InsuredName");
java.lang.String state = subQMap.getString("Object::Submission::InsuredState");
java.lang.String zipCode = subQMap.getString("Object::Submission::InsuredZipCode");
java.lang.String agencyId = subQMap.getString("Object::Submission::AgencyId");
java.lang.String broker = subQMap.getString("Object::Submission::AgencyName");
if(i==0){%>
<%="Assignee"+"|"+"Date"+"|"+"Insured #"+"|"+"Insured Name"+"|"+"State"+"|"+"Broker"+"|"+"Priority"+"|"+"Delete"+"|"+"Url"+"|"+"CustomerId"+"|"+"PanelName"+"\n"%><br>
<%}%>
<%=assignedUser+"|"+updatedDate+"|"+insuredId+"|"+insuredName+"|"+state+"|"+broker+"|"+ "" +"|"+"Y"+"|"+"../GetInsuredAction.do"+"|"+insuredId+"|"+"Insured_Panel"+"\n"%><br>
<%}%>
<%}%>


