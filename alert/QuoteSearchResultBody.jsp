<%if(request.getAttribute("listOfQuote")!=null){	
	java.util.ArrayList quoteList = (java.util.ArrayList)request.getAttribute("listOfQuote");%>
<%for(int i=0;i<quoteList.size();i++){	
	com.dms.ejb.data.QuestionHashMap quoteQMap = (com.dms.ejb.data.QuestionHashMap)quoteList.get(i);
java.lang.String updatedDate = quoteQMap.getString("Object::Alert::UpdatedDate");
java.lang.String assignedUser = quoteQMap.getString("Object::Alert::AssignedUser");
java.lang.String ownerId = quoteQMap.getString("Object::Alert::OwnerId");
java.lang.String quoteNo = quoteQMap.getString("Object::QuoteHeader::QuoteNum");
java.lang.String insuredName = quoteQMap.getString("Object::QuoteHeader::InsuredName");
java.lang.String state = quoteQMap.getString("Object::QuoteHeader::State");
java.lang.String custId = quoteQMap.getString("Object::QuoteHeader::CustomerId");
java.lang.String quoteId = quoteQMap.getString("Object::QuoteHeader::QuoteId");
java.lang.String broker = quoteQMap.getString("Object::QuoteHeader::AgencyName");
java.lang.String agencyId = quoteQMap.getString("Object::QuoteHeader::AgencyId");
if(i==0){%>
<%="Assignee"+"|"+"Date"+"|"+"Quote #"+"|"+"Insured Name"+"|"+"State"+"|"+"Broker"+"|"+"Priority"+"|"+"Delete"+"|"+"Quote Url"+"|"+"Insured Url"+"|"+"CustomerId"+"|"+"QuoteId"+"|"+"AgencyId"+"|"+"UserId"+"|"+"Quote PanelName"+"|"+"Insured PanelName"+"|"+"OwnerId"+"\n"%><br>
<%}%>
<%=assignedUser+"|"+updatedDate+"|"+quoteNo+"|"+insuredName+"|"+state+"|"+broker+"|"+""+"|"+"Y"+"|"+"../SyncQuoteWithEmployerGroupAndProductAction.do"+"|"+"../GetInsuredAction.do"+"|"+custId+"|"+quoteId+"|"+agencyId+"|"+assignedUser+"|"+"Quote_Panel"+"|"+"Insured_Panel"+"|"+ownerId+"\n"%><br>
<%}%>
<%}%>


