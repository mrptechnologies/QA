<%if(request.getAttribute("listOfQuote")!=null){	
	java.util.ArrayList quoteList = (java.util.ArrayList)request.getAttribute("listOfQuote");%>
<%for(int i=0;i<quoteList.size();i++){	
	com.dms.ejb.data.QuestionHashMap quoteQMap = (com.dms.ejb.data.QuestionHashMap)quoteList.get(i);
java.lang.String updatedDate = quoteQMap.getString("Object::Alert::UpdatedDate");
java.lang.String alertId = quoteQMap.getString("Object::Alert::AlertId");
java.lang.String assignedUser = quoteQMap.getString("Object::Alert::AssignedUser");
java.lang.String ownerId = quoteQMap.getString("Object::Alert::OwnerId");
java.lang.String quoteNo = quoteQMap.getString("Object::QuoteHeader::QuoteNum");
java.lang.String insuredName = quoteQMap.getEncodedString("Object::QuoteHeader::InsuredName");
java.lang.String state = quoteQMap.getString("Object::QuoteHeader::State");
java.lang.String custId = quoteQMap.getString("Object::QuoteHeader::CustomerId");
java.lang.String quoteId = quoteQMap.getString("Object::QuoteHeader::QuoteId");
java.lang.String broker = quoteQMap.getString("Object::QuoteHeader::AgencyName");
java.lang.String agencyId = quoteQMap.getString("Object::QuoteHeader::AgencyId");
java.lang.String status = quoteQMap.getString("Object::Alert::ObjectStatus");
java.lang.String policyId = quoteQMap.getString("Object::Alert::PolicyId");
java.lang.String policyVerId = quoteQMap.getString("Object::Alert::CurrentVerId");
java.lang.String policyNumber = quoteQMap.getString("Object::Alert::PolicyNumber");
java.lang.String quoteSubNum = quoteQMap.getString("Object::QuoteHeader::QuoteSubNum");
java.lang.String assignee =""; 
if(Integer.parseInt(quoteSubNum)>0){quoteSubNum='-'+quoteSubNum; }else{quoteSubNum=""; }
String quoteURL = "<a id='' rel='' target=''  href='../SyncQuoteWithEmployerGroupAndProductAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)="+custId+"&answer(QuoteId)="+quoteId+"&answer(parentQuoteId)="+quoteId+"&answer(ownerId)="+ownerId+"&answer(policyNumber)="+policyNumber+"&answer(Object::Policy::ParentPolicyId)="+policyId+"&answer(Object::Policy::ParentPolicyVerId)="+policyVerId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(userId)="+assignedUser+"'>"+quoteNo+quoteSubNum+"</a>";
String insuredURL = "<a id='' rel='' target=''  href='../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId="+custId+"'>"+insuredName+"</a>";
if(i==0){%>
<%="Date"+"____~____*"+"Quote #"+"____~____*"+"Insured Name"+"____~____*"+"State"+"____~____*"+"Status"+"____~____*"+"Priority"+"____~____*"+"Delete"+"____~____*"+"Quote Url"+"____~____*"+"Insured Url"+"____~____*"+"CustomerId"+"____~____*"+"QuoteId"+"____~____*"+"AgencyId"+"____~____*"+"UserId"+"____~____*"+"Quote PanelName"+"____~____*"+"Insured PanelName"+"____~____*"+"OwnerId"+"____~____*"+"AlertId"+"____~____*"+"PolicyId"+"____~____*"+"PolicyVerId"+"____~____*"+"PolicyNumber"+"____~____*"+"QuoteSubNum"+"\n"%>
<%}%>
<%=updatedDate+"____~____*"+quoteNo+"____~____*"+insuredName+"____~____*"+state+"____~____*"+status+"____~____*"+""+"____~____*"+""+"____~____*"+quoteURL+"____~____*"+insuredURL+"____~____*"+custId+"____~____*"+quoteId+"____~____*"+agencyId+"____~____*"+assignedUser+"____~____*"+"Quote_Panel"+"____~____*"+"Insured_Panel"+"____~____*"+ownerId+"____~____*"+alertId+"____~____*"+policyId+"____~____*"+policyVerId+"____~____*"+policyNumber+"____~____*"+quoteSubNum+"\n"%>
<%}%>
<%}%>



