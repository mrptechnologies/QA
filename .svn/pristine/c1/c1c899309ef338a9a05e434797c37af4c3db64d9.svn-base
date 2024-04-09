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
java.lang.String alertMessage = quoteQMap.getString("Object::Alert::AlertMessage");


java.lang.String subjId = quoteQMap.getString("Object::Quote::Subjectivity::QuoteSubjectivityId"); 
java.lang.String quoteId1 = quoteQMap.getString("Object::Quote::ParentQuoteId");
java.lang.String quoteVerId = quoteQMap.getString("Object::Quote::ParentQuoteVerId");					
java.lang.String subQuoteId = quoteQMap.getString("Object::Quote::SubQuoteId");
java.lang.String subQuoteVerId = quoteQMap.getString("Object::Quote::SuQuoteVerId");
java.lang.String productId = quoteQMap.getString("Object::Quote::ProductId");
java.lang.String productVerId = quoteQMap.getString("Object::Quote::ProductVerId");
java.lang.String custId1 = quoteQMap.getString("Object::Customer::CustomerId");

if(i==0){%>
<%="Assignee"+"|"+"Date"+"|"+"Quote #"+"|"+"Subjectivity"+"|"+"Insured Name"+"|"+"Broker"+"|"+"Priority"+"|"+"Delete"+"|"+"Quote Url"+"|"+"Subj Url"+"|"+"SubjId"+"|"+"productId"+"|"+"productVerId"+"|"+"QuoteId"+"|"+"QuoteVerId"+"|"+"SubQuoteId"+"|"+"SubQuoteVerId"+"|"+"CustomerId"+"|"+"AgencyId"+"|"+"UserId"+"|"+"PanelName"+"|"+"OwnerId"+"|"+"AlertId"+"\n"%>
<%}%>
<%=assignedUser+"|"+updatedDate+"|"+quoteNo+"|"+alertMessage+"|"+insuredName+"|"+broker+"|"+""+"|"+""+"|"+"../SyncQuoteWithEmployerGroupAndProductAction.do"+"|"+"../getSubjectivity.go"+"|"+subjId+"|"+productId+"|"+productVerId+"|"+quoteId+"|"+quoteVerId+"|"+subQuoteId+"|"+subQuoteVerId+"|"+custId1+"|"+agencyId+"|"+assignedUser+"|"+"Quote_Panel"+"|"+ownerId+"|"+alertId+"\n"%>
<%}%>
<%}%>


