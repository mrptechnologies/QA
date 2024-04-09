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
	java.lang.String objectId = qMap.getString("Object::Alert::ObjectId");
	java.lang.String objectVerId = qMap.getString("Object::Alert::ObjectVerId");
	java.lang.String objectNo = "";
	java.lang.String subNum = "";
	java.lang.String quoteStatus = "";
	java.lang.String quoteType = "";
	java.lang.String insuredName = "";
	java.lang.String effDate = "";
	java.lang.String expDate = "";
	java.lang.String state = "";
	java.lang.String custId = "";
	java.lang.String quoteId = "";
	java.lang.String quoteVerId = "";
	java.lang.String policyId = "";
	java.lang.String policyVerId = "";
	java.lang.String policyNum = "";
	java.lang.String parentPolicyNum = "";
	java.lang.String broker = "";
	java.lang.String agencyId = "";
	java.lang.String insuredId = "";
	java.lang.String assignee ="";
	java.lang.String renewingPolicyId = "";
	java.lang.String renewingPolicyVerId ="";
	java.lang.String renewingPolicyNum ="";
	java.lang.String policyURL = "";
	java.lang.String quoteURL = "";
		
	if(objectType.equalsIgnoreCase("RenewalQuote") || objectType.equalsIgnoreCase("RenewalSubjectivity")) {
		objectNo = qMap.getString("Object::Alert::Quote::QuoteNumber");
		insuredName = qMap.getEncodedString("Object::Alert::Quote::Insured::InsuredName");
		state = qMap.getString("Object::Alert::Quote::Insured::State");
		custId = qMap.getString("Object::Alert::Quote::Insured::CustomerId");
		broker = qMap.getEncodedString("Object::Alert::Quote::AgentName");
		agencyId = qMap.getString("Object::Alert::Quote::AgencyId");
		subNum = qMap.getString("Object::Alert::Quote::QuoteSubNumber");
		quoteStatus = qMap.getString("Object::Alert::Quote::QuoteStatus");
		quoteType = qMap.getString("Object::Alert::Quote::QuoteType");
		effDate = qMap.getString("Object::Alert::Quote::QuoteStartDate");
		expDate = qMap.getString("Object::Alert::Quote::QuoteEndDate"); 	
		quoteId = qMap.getString("Object::Alert::Quote::QuoteId");
		quoteVerId = qMap.getString("Object::Alert::Quote::QuoteVerId"); 
		policyId = qMap.getString("Object::Alert::Policy::PolicyId");	
		policyVerId = qMap.getString("Object::Alert::Policy::PolicyVerId");
		parentPolicyNum = qMap.getString("Object::Alert::Policy::PolPolicy::PolicyNumber");
		policyNum = qMap.getString("Object::Alert::Policy::PolPolicyVer::PolicyNumber");
		
		if(policyId.equalsIgnoreCase("") || policyId.equalsIgnoreCase("null")) {
			policyId = qMap.getString("Object::Alert::Quote::ParentPolicyId");
			policyVerId = qMap.getString("Object::Alert::Quote::ParentPolicyVerId");
		}
		if(parentPolicyNum.equalsIgnoreCase("") || parentPolicyNum.equalsIgnoreCase("null")) {
			policyNum = qMap.getString("Object::Alert::Quote::PolicyNumber");
			parentPolicyNum = qMap.getString("Object::Alert::Quote::PolicyNumber");
		}
		policyURL = "<a id='' rel='' target=''  href='../GetPolicySummary.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)="+custId+"&answer(QuoteId)="+quoteId+"&answer(parentQuoteId)="+quoteId+"&answer(ownerId)="+ownerId+"&answer(policyId)="+policyId+"&answer(policyVerId)="+policyVerId+"&answer(Object::Policy::ParentPolicyId)="+policyId+"&answer(Object::Policy::ParentPolicyVerId)="+policyVerId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(userId)="+assignedUser+"'>"+policyNum+"</a>";		
		try{
		  if(Integer.parseInt(""+subNum)>=1){
			 objectNo = objectNo + "-" + subNum;			   			  
		  }
		} catch(NumberFormatException nfe){}
		quoteURL = "<a id='' rel='' target=''  href='../SyncQuoteWithEmployerGroupAndProductAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)="+custId+"&answer(QuoteId)="+quoteId+"&answer(parentQuoteId)="+quoteId+"&answer(ownerId)="+ownerId+"&answer(policyNumber)="+policyNum+"&answer(Object::Policy::ParentPolicyId)="+policyId+"&answer(Object::Policy::ParentPolicyVerId)="+policyVerId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(userId)="+assignedUser+"'>"+objectNo+"</a>";
	} else if(objectType.equalsIgnoreCase("RenewalPolicy")) {
		
		objectNo = qMap.getString("Object::Alert::Quote::QuoteNumber");
		subNum = qMap.getString("Object::Alert::Quote::QuoteSubNumber");
		insuredName = qMap.getEncodedString("Object::Alert::Policy::Insured::InsuredName");
		state = qMap.getString("Object::Alert::Policy::Insured::State");
		custId = qMap.getString("Object::Alert::Policy::Insured::CustomerId");
		broker = qMap.getEncodedString("Object::Alert::Policy::AgentName");
		agencyId = qMap.getString("Object::Alert::Policy::AgencyId");
		quoteStatus = qMap.getString("Object::Alert::Quote::QuoteStatus");
		quoteType = qMap.getString("Object::Alert::Quote::QuoteType");
		effDate = qMap.getString("Object::Alert::Quote::QuoteStartDate");
		expDate = qMap.getString("Object::Alert::Quote::QuoteEndDate"); 	
		quoteId = qMap.getString("Object::Alert::Quote::QuoteId");
		quoteVerId = qMap.getString("Object::Alert::Quote::QuoteVerId"); 
		policyId = qMap.getString("Object::Alert::Policy::PolicyId");	
		policyVerId = qMap.getString("Object::Alert::Policy::PolicyVerId");
		parentPolicyNum = qMap.getString("Object::Alert::Policy::PolPolicy::PolicyNumber");
		policyNum = qMap.getString("Object::Alert::Policy::PolPolicyVer::PolicyNumber");
		renewingPolicyId = qMap.getString("Object::Alert::Quote::ParentPolicyId");	
		renewingPolicyVerId = qMap.getString("Object::Alert::Quote::ParentPolicyVerId");
		renewingPolicyNum = qMap.getString("Object::Alert::Policy::PolPolicyVer::RenewingPolicyNumber");
		try{
			  if(Integer.parseInt(""+subNum)>=1){
				 objectNo = objectNo + "-" + subNum;			   			  
			  }
		} catch(NumberFormatException nfe){}
		policyNum = renewingPolicyNum;
		quoteURL = "<a id='' rel='' target=''  href='../SyncQuoteWithEmployerGroupAndProductAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)="+custId+"&answer(QuoteId)="+quoteId+"&answer(parentQuoteId)="+quoteId+"&answer(ownerId)="+ownerId+"&answer(policyNumber)="+policyNum+"&answer(Object::Policy::ParentPolicyId)="+renewingPolicyId+"&answer(Object::Policy::ParentPolicyVerId)="+renewingPolicyVerId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(userId)="+assignedUser+"'>"+objectNo+"</a>";
		policyURL = "<a id='' rel='' target=''  href='../GetPolicySummary.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)="+custId+"&answer(QuoteId)="+quoteId+"&answer(parentQuoteId)="+quoteId+"&answer(ownerId)="+ownerId+"&answer(policyId)="+renewingPolicyId+"&answer(policyVerId)="+renewingPolicyVerId+"&answer(Object::Policy::ParentPolicyId)="+renewingPolicyId+"&answer(Object::Policy::ParentPolicyVerId)="+renewingPolicyVerId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(userId)="+assignedUser+"'>"+policyNum+"</a>";
		
	}

if(i==0){%>
<%="Assignee"+"____~____*"+"Date"+"____~____*"+"Renewing Policy #"+"____~____*"+"Renewal Quote #"+"____~____*"+"Quote Status"+"____~____*"+"Effective Date"+"____~____*"+"Expiration Date"+"____~____*"+"Message"+"____~____*"+"Insured Name"+"____~____*"+"State"+"____~____*"+"Broker"+"____~____*"+"Priority"+"____~____*"+"Delete"+"____~____*"+"Policy Url"+"____~____*"+"Quote Url"+"____~____*"+"CustomerId"+"____~____*"+"ObjectId"+"____~____*"+"AgencyId"+"____~____*"+"UserId"+"____~____*"+"Policy PanelName"+"____~____*"+"Quote PanelName"+"____~____*"+"OwnerId"+"____~____*"+"AlertId"+"____~____*"+"ObjectType"+"____~____*"+"ObjectVerId"+"____~____*"+"PolicyId"+"____~____*"+"PolicyVerId"+"____~____*"+"PolicyNumber"+"____~____*"+"QuoteId"+"\n"%>
<%}%>
<%=assignee+"____~____*"+updatedDate+"____~____*"+policyNum+"____~____*"+objectNo+"____~____*"+quoteStatus+"____~____*"+effDate+"____~____*"+expDate+"____~____*"+alertMessage+"____~____*"+insuredName+"____~____*"+state+"____~____*"+broker+"____~____*"+""+"____~____*"+""+"____~____*"+policyURL+"____~____*"+quoteURL+"____~____*"+custId+"____~____*"+objectId+"____~____*"+agencyId+"____~____*"+assignedUser+"____~____*"+"Policy_Panel"+"____~____*"+"Quote_Panel"+"____~____*"+ownerId+"____~____*"+alertId+"____~____*"+objectType+"____~____*"+objectVerId+"____~____*"+policyId+"____~____*"+policyVerId+"____~____*"+parentPolicyNum+"____~____*"+quoteId+"\n"%>
<%}%>
<%}%>



