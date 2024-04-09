<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="com.dms.common.ObjectDescriptor" %>

<SCRIPT type="text/JavaScript">
<!--
function submitForm1(nextOrPre){
    var formElement=document.forms[0];
    formElement.PageNumId.value=nextOrPre;	
    formElement.submit();
 return true;
  }


//-->
</SCRIPT>


<html:form action="/FindQuotes" >
<bean:define id="insuranceType" property="answer(INSURANCE_TYPE)"  name="LoginPage" scope="session" />
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td height="5">
		</td>
	</tr>
	<tr>
 		<td class="NewSectionHead" colspan="3" align="center">
 			QUOTE SEARCH RESULT
 		</td>
	</tr>
	<tr>
	  	<td>
	  		&nbsp;
	  	</td>
	</tr>



	<logic:notPresent name ='searchresultQuotesDisplay' scope ='request'>
	<tr>
		<td colspan="3">
			&nbsp;
		</td>
	</tr> 
	<tr> 
		<td class="Error" colspan="3">
			No Quotes Found
 		</td>
 	</tr>
	<tr>
		<td colspan="3">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<html:button value="BACK" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" onclick="javascript:history.go(-1);" />		
		 </td>
   </tr>
	</logic:notPresent>

	<%
	 long pageNumber=0;
	 int noOfQuotesPerPage = Integer.parseInt(com.dms.util.Constants.getVersionedValueOf("noOfQuotesPerPage"));
	%>
	<logic:present name ='searchresultQuotesDisplay' scope ='request'>
	<bean:define id="SearchQuoteTotalRec" property="answer(SearchQuote::TotalRec)"  name="FindQuote"   scope="request" />
	<bean:define id="pagenum" name='pagenum' scope='request' />
	<bean:define id="currentPageSize" name='currentPageSize' scope='request' />
	
	<%
	
	
	int intCurrentPageSize=0;
	try {
	    pageNumber=Long.parseLong(""+pagenum);
	    intCurrentPageSize=Integer.parseInt(""+currentPageSize);
	}
	catch (Exception ex){ 
	    
	   
	}
	long count =0;
	if(pageNumber>=0){
	 count=(pageNumber)*noOfQuotesPerPage;
	}
	long SearchQuoteTotalRecLng = 0;
	long numOfPages = 0;
	try{
	 SearchQuoteTotalRecLng = Long.parseLong(""+SearchQuoteTotalRec);
	 numOfPages = SearchQuoteTotalRecLng / noOfQuotesPerPage;
	 if((SearchQuoteTotalRecLng % noOfQuotesPerPage)>0){
	  numOfPages++;
	 }
	}catch(Exception ex){}
	%>

	<tr>
 		<td class="FormLabels" colspan="3">
  			Total Number of Quotes:&nbsp;<%=""+SearchQuoteTotalRec%>
 		</td>
 	</tr>
 	<tr>
 		<td height="10px" colspan="3">
 		</td>
 	</tr>
	<tr>
		 <td align="left" >
 			 <%if (pageNumber>0){%>
 			 <html:button value="<<< Previous" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return submitForm1('-1')"/>
 			 <%}%>
 		</td>

		 <td width="100%" align="center" class="sectionhead">
  			Page <%=(pageNumber+1)%> of <%=numOfPages%>
 		</td>
 		<td align="right" colspan="2">
			<%if (intCurrentPageSize==noOfQuotesPerPage){%> 
  			<html:button value="Next >>>" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return submitForm1('1')"/>
  			<%}%>
 		 </td>		
 	</tr> 	
 	
 	<tr>
 		<td height="10px" colspan="3">
 		</td>
 	</tr>
	<tr>
 		<td class="TextMatter" colspan="2" align="left">
 			<a href="../quote/FindQuote.jsp?TabPanelName=Quote_Panel">Find Quote</a>			 			 			
 		</td>
 	</tr> 

	<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
	<bean:define id="ownerId1" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
	<html:hidden  property="answer(OwnerId)" value="<%=""+ownerId1%>" />
	<tr>
		<td height="10px" colspan="3">
 			<table WIDTH="100%" ALIGN="Left" cellspacing="2" cellpadding="2">
 				<tr>
 				 	<td colspan="9" >
 				 		&nbsp;
 				 	</td>
 				</tr>
 				<tr>
			      <td class="sectionhead" width="5%">SNo.</td>
			   
				  <td class="sectionhead" width="15%">Insured Name</td>
				  <td class="sectionhead" width="15%">Quote Number</td>
				  <td class="sectionhead" width="10%">Quote Type</td>
				  <td class="sectionhead" width="15%">Effective Date</td>
				  <td class="sectionhead" width="15%">Last Modified Date</td>
				  <td class="sectionhead" width="10%">Last Modified By</td>
				  <td class="sectionhead" width="15%" align="center">Total Premium</td>
 				</tr>
			    <% int i=0;%>
			     <logic:iterate id="searchResultQMap"  name="searchresultQuotesDisplay" scope="request" type="com.dms.ejb.data.QuestionHashMap">
			 	<%
				  String custId = searchResultQMap.getString("Object::Customer::CustomerId");
				  String quoteId = searchResultQMap.getString("Object::Quote::quoteId");
				  String agencyId = "";
			 	%>
				 <dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=custId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
				   <logic:present name="customerDetail1" scope="request">
				    <bean:define id="customerDetailMap" name="customerDetail1" scope="request"           type="com.dms.ejb.data.QuestionHashMap" />
				    <%
				     agencyId = customerDetailMap.getString("agencyid");
				    %>
				   </logic:present>
				        
			 	<tr>
					<td class="SearchResult">    
			  		  <% count++; %>
			  		  <%=count%>
			  		</td>
			    	
			    	 <td class="SearchResult">
			  		  <a href="../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<%=custId%>" >
			   			  <%=searchResultQMap.getString("Object::Quote::customerName")%>   
			  		  </a> 
			  	   </td>
			  	   <td class="SearchResult" align="left">
			  		  <a href="../SyncQuoteWithEmployerGroupAndProductAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=custId%>&answer(QuoteId)=<%=quoteId%>&answer(parentQuoteId)=<%=quoteId%>&answer(ownerId)=<%=""+ownerId1%>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(userId)=<%=""+userId%>">
			  		  <%String quoteNum = searchResultQMap.getString("Object::Quote::quoteNum"); %>
			   		  <%try{
			   			  if(Integer.parseInt(""+searchResultQMap.getString("Object::Quote::quoteSubNum"))>=1){
			   				quoteNum = quoteNum + "-" + searchResultQMap.getString("Object::Quote::quoteSubNum");			   			  
			   			  }
			   		  	}catch(NumberFormatException nfe){}
					  %>
					  <%=""+quoteNum %>
			    		</a>
			    	</td>
			    	 <td class="SearchResult">
			   		<%=searchResultQMap.getString("Object::Quote::quoteType")%>   
			   		</td>
			    	 <td class="SearchResult">
			   			<%=searchResultQMap.getString("Object::Quote::quoteEffectiveDate")%>   
			   		 </td>
			     	<td class="SearchResult">
			   			<%=searchResultQMap.getString("Object::Quote::updatedDate")%>   
			     	</td>
			     	<td class="SearchResult">
			  			 <%=searchResultQMap.getString("Object::Quote::updatedBy")%>   
			  			 &nbsp;
			   		</td>
			     	<td class="SearchResult" align="center">
			   			$<%=searchResultQMap.getString("Object::Quote::totalPremium")%>   
			   		</td>
			 	</tr>
			 	</logic:iterate>
			</table>
		</td>
	</tr>
	<tr>
 		<td align="left">
  		<%if (pageNumber>0){%>
 			 <html:button value="<<< Previous" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return submitForm1('-1')"/>
		  <%}%>
  		</td>
  		<td align="right" colspan="2">
			<%if (intCurrentPageSize==noOfQuotesPerPage){%> 
  			<html:button value="Next >>>" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return submitForm1('1')"/>
  			<%}%>
 		 </td>
	 </tr>
	 <tr>
		<td>
			<html:hidden property="answer(SearchQuote::TotalRec)" value="<%=""+SearchQuoteTotalRec%>" />
		</td>
	</tr>
	</logic:present >

<bean:define id="quoteNum" property="answer(Object::Quote::quoteNum)" name="FindQuote" scope="request" />
<bean:define id="customerName" property="answer(Object::Quote::customerName)" name="FindQuote" scope="request" />
<bean:define id="customerNum" property="answer(Object::Quote::customerNum)" name="FindQuote" scope="request" />
<bean:define id="quoteType" property="answer(Object::Quote::quoteType)" name="FindQuote" scope="request" />
<bean:define id="quoteStatus" property="answer(Object::Quote::quoteStatus)" name="FindQuote" scope="request" />
<bean:define id="createdDateBegin" property="answer(Object::Quote::createdDateBegin)" name="FindQuote" scope="request" />
<bean:define id="createdDateEnd" property="answer(Object::Quote::createdDateEnd)" name="FindQuote" scope="request" />
<bean:define id="updatedDateBegin" property="answer(Object::Quote::updatedDateBegin)" name="FindQuote" scope="request" />
<bean:define id="updatedDateEnd" property="answer(Object::Quote::updatedDateEnd)" name="FindQuote" scope="request" />
<bean:define id="quoteName" property="answer(Object::Quote::QuoteName)" name="FindQuote" scope="request" />

<bean:define id="effDateBegin" property="answer(Object::Quote::effectiveDateBegin)" name="FindQuote" scope="request" />
<bean:define id="effDateEnd" property="answer(Object::Quote::effectiveDateEnd)" name="FindQuote" scope="request" />


<bean:define id="orderBy" property="answer(SearchQuote::orderBy)" name="FindQuote" scope="request" />

	<tr>
		<td>
			<html:hidden property="answer(Object::Quote::quoteNum)" value="<%=""+quoteNum%>"/>
			<html:hidden property="answer(Object::Quote::customerName)" value="<%=""+customerName%>"/>
			<html:hidden property="answer(Object::Quote::customerNum)" value="<%=""+customerNum%>"/>
			<html:hidden property="answer(Object::Quote::quoteType)" value="<%=""+quoteType%>"/>
			<html:hidden property="answer(Object::Quote::quoteStatus)" value="<%=""+quoteStatus%>"/>
			<html:hidden property="answer(Object::Quote::createdDateBegin)" value="<%=""+createdDateBegin%>"/>
			<html:hidden property="answer(Object::Quote::createdDateEnd)" value="<%=""+createdDateEnd%>"/>
			<html:hidden property="answer(Object::Quote::updatedDateBegin)" value="<%=""+updatedDateBegin%>"/>
			<html:hidden property="answer(Object::Quote::updatedDateEnd)" value="<%=""+updatedDateEnd%>"/>
			<html:hidden property="answer(Object::Quote::QuoteName)" value="<%=""+quoteName%>"/>
			
			<html:hidden property="answer(Object::Quote::effectiveDateBegin)" value="<%=""+effDateBegin %>" />
			<html:hidden property="answer(Object::Quote::effectiveDateEnd)" value="<%=""+effDateEnd %>" />
			
			
			<html:hidden property="answer(SearchQuote::PageNum)" value="<%=""+pageNumber%>" />
			<html:hidden property="answer(SearchQuote::nextOrPrevious)" styleId="PageNumId" value="<%=""+pageNumber%>" />
			<!--html:hidden  property="answer(SearchQuote::CurrentPageNum)" value="<%=""+(pageNumber+1)%>" /-->
			<html:hidden styleId="orderby" property="answer(SearchQuote::orderBy)" value="<%=""+orderBy%>"/>
			<html:hidden property="answer(INSURANCE_TYPE)" value="<%=""+insuranceType%>" />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
			<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
			<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
				<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
				<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />	
				<bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
				<% 
				    long AgencyId = 0;
				 	try{
				 		AgencyId=Long.parseLong(""+AgencyID);
				 	}catch(Exception ex){}
				 	if(AgencyId > 0){
			    %>
			       <html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectType)" value="AGENCY"/>
				   <html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectId)" value="<%=""+AgencyId%>"/>
			    <%}else{ 
			    %>
				
				<%if(objDescType.toString().equals("ENTITY")){%>			
						<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT"}%>' connector='or' negated="true">
							<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
								<logic:present name="agencyIdent" scope="session">
									<bean:define id="agencyID" name="agencyIdent" type="java.lang.Long" scope="session"/>
									<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectType)" value="AGENCY"/>
									<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectId)" value="<%=""+agencyID%>"/>
								</logic:present>
						</dmshtml:dms_static_with_connector>
						<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENCY_EMPLOYEE"}%>' connector='or' negated="true">
							<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
								<logic:present name="agencyIdent" scope="session">
									<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
									<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectId)" value="<%=""+agencyIdid%>"/>
									<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectType)" value="AGENCY"/>
								</logic:present>
						</dmshtml:dms_static_with_connector>
				<%}else if(objDescType.toString().equals("AGENCY")){%>
						<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectType)" value="AGENCY"/>
						<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectId)" value="<%=""+objDescId%>"/>	
				<%} %>
				<%} %>

		</td>
	</tr>
</table>


</html:form>
