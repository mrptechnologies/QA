<!--
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
-->
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="pageNumber" property="answer(Object::SearchSubmission::PageNum)" name="Submission" />
<bean:define id="currentPageNum"property="answer(Object::SearchSubmission::CurrentPageNum)" name="Submission"/>
<bean:define id="SearchSubmissionTotalRec" property="answer(Object::SearchSubmission::TotalRec)"  name="Submission" />		
<bean:define id="totpagenum"  property="answer(Object::SearchSubmission::TotalPageNum)"  name="Submission"  />
<bean:define id="createdDateBegin" property="answer(Object::Submission::createdDateBegin)" name="Submission" />
<bean:define id="createdDateEnd" property="answer(Object::Submission::createdDateEnd)" name="Submission" />

<% String sendStatus = request.getParameter("answer(Object::Submission::SendStatus)"); %>
<% String errorType = request.getParameter("answer(Object::Submission::ErrorType)"); %>

<form action="/ConfirmReSubmission.do" >
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td height="20"></td>
	</tr>	<tr>
		<td class="NewSectionHead" align="center" colspan ="10" >Find Submission-Results</td></tr>
	<tr>	

	<tr>
		<td height="5px"></td>
	</tr>
		<%
		java.util.ArrayList xmlList = new java.util.ArrayList();
		String strcnt="";
		int totalCount=0;
		String totalRec="";


		long count=0;
		boolean checked=false;
		int pagenum=0;
		long PageNumber=0;
		int numOfPages=1;
		int intCurrentPageSize=0;

		try {
			PageNumber=Long.parseLong(""+pageNumber);
		}catch (Exception ex){}
		
		int noOfSubmissionsPerPage = Integer.parseInt(com.dms.util.Constants.getVersionedValueOf("noOfQuotesPerPage"));
		if(PageNumber>=0){
			 count=(PageNumber)*noOfSubmissionsPerPage;
			}
		
		%>
		<logic:present name ='searchresultSubmissionDisplay'>

		
		<tr> 
			<td class="sectionhead" colspan="3">
			<%totalRec=SearchSubmissionTotalRec.toString();%>
				Submissions Found: <%=SearchSubmissionTotalRec.toString()%>  
 			</td> 			
 		</tr>
 		
 		<tr>
			<td  class="sectionhead"  height="20px" align="center">Page <%=Integer.parseInt(pageNumber+"")+1%> of <%=totpagenum.toString()%></td>
		</tr>	
 		
 		<tr>
			<td align="Left" class="links" colspan="5" >						
				<logic:present name="prevSubmission"  scope="request" >
					<a href="../FindSubmission.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::SearchSubmission::PageNum)=<%=(Integer.parseInt(""+pageNumber)-1)%>&answer(Object::SearchSubmission::TotalRec)=<%=""+SearchSubmissionTotalRec%>&answer(Object::Submission::createdDateBegin)=<%=""+createdDateBegin%>&answer(Object::Submission::createdDateEnd)=<%=""+createdDateEnd%>&answer(Object::Submission::SendStatus)=<%=""+sendStatus%>&answer(Object::Submission::ErrorType)=<%=""+errorType%>"><bean:message key="Common.Previous"/></a>
				</logic:present>
			</td>
			
			<td align="right" class="links" colspan="5">
				<logic:present name="moreSubmission"  scope="request" >
					<a href="../FindSubmission.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::SearchSubmission::PageNum)=<%=(Integer.parseInt(""+pageNumber))%>&answer(Object::SearchSubmission::TotalRec)=<%=""+SearchSubmissionTotalRec%>&answer(Object::SearchSubmission::NextOrPrev)=<%="1"%>&answer(Object::Submission::createdDateBegin)=<%=""+createdDateBegin%>&answer(Object::Submission::createdDateEnd)=<%=""+createdDateEnd%>&answer(Object::Submission::SendStatus)=<%=""+sendStatus%>&answer(Object::Submission::ErrorType)=<%=""+errorType%>">Next&gt;&gt;</a>
				</logic:present>
			</td>
		</tr>		
				
		<tr>
			<td valign="top">
					<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
						<tr>
								<td class="FormLabels" colspan="6"></td>
						</tr>
					</table>
			</td>
		</tr>
			
		<tr>
			<td height="20px"></td>
		</tr>
			
		<tr align="right">
			<td colspan="5" align="right" >
				<html:submit value="Re Submit" styleClass="sbttn"/>
			</td>
		</tr>
			
			<tr>
				<td>&nbsp; </td>
			</tr>
			
			<tr>
				<td align="center">
					<table border="0" width="100%" cellspacing="2" cellpadding="2" style="{border-width:1px; border-style:solid; border-color: #999999;}">
					<tr>
						<td class="sectionhead" width="5%">S.No</td>
						<td class="sectionhead" width="10%">Quote Id</td>
						<td class="sectionhead" width="10%">Quote Number</td>
						<td class="sectionhead" width="15%">Send Status</td>
						<td class="sectionhead" width="10%">Error Type</td>
						<td class="sectionhead" width="13%">Processed Date</td>
						<td class="sectionhead" width="30%">Send URL</td>
						<td class="sectionhead" width="10%">Submission XML</td>
						<td class="sectionhead" width="10%">Response XML</td>
						<td class="sectionhead" width="10%">Select</td>
					</tr>
	
					
					<%
					long customerId=0;
					long agencyId=0;
					long parentQuoteId=0;
					long infSubmissinLogId=0;
					long quoteVerId=0;
					String quoteSubNumber="";
					%>
	
					<logic:iterate id="searchResultQMap"  name='searchresultSubmissionDisplay' type="com.dms.ejb.data.QuestionHashMap">


						<%  
						if(searchResultQMap.getString("Object::Submission::Quoteid")!=""){
							parentQuoteId=Long.parseLong(""+searchResultQMap.getString("Object::Submission::Quoteid"));							
						}
						
						if(searchResultQMap.getString("Object::Submission::CustomerId")!=""){
							customerId=Long.parseLong(""+searchResultQMap.getString("Object::Submission::CustomerId"));							
						}
						if(searchResultQMap.getString("Object::Submission::AgencyId")!=""){
							agencyId=Long.parseLong(""+searchResultQMap.getString("Object::Submission::AgencyId"));							
						}
						if(searchResultQMap.getString("Object::Submission::SubmissionId")!=""){
							infSubmissinLogId=Long.parseLong(""+searchResultQMap.getString("Object::Submission::SubmissionId"));	
						}
						if(searchResultQMap.getString("Object::Submission::QuoteVerid")!=""){
							quoteVerId=Long.parseLong(""+searchResultQMap.getString("Object::Submission::QuoteVerid"));	
						}
						if(!searchResultQMap.getString("Object::Submission::QuoteSubNum").equals("")){							
							if(Long.parseLong(""+searchResultQMap.getString("Object::Submission::QuoteSubNum"))>0){
								quoteSubNumber="-"+searchResultQMap.getString("Object::Submission::QuoteSubNum");
							}							
						}
						%>
						
						<%
						String styleClass="";
						if(count%2==0){
							styleClass = "altdisply";
						}else{
							styleClass = "SearchResult";	
						}
						%>
						<tr>
						 	<td class="SearchResult">
						 		<%count++;%>   				
						 		<%=count%>   				
						 	</td>			 		
						   	
						   	 <td class="SearchResult" align="left">

						  		  <%String quoteNum = searchResultQMap.getString("Object::Quote::quoteNum"); %>
						   		  <%try{
						   			  if(Integer.parseInt(""+searchResultQMap.getString("Object::Submission::Quoteid"))>=1){
						   				quoteNum = quoteNum + "-" + searchResultQMap.getString("Object::Submission::Quoteid");			   			  
						   			  }
						   		  	}catch(NumberFormatException nfe){}
								  %>
								  <%=""+searchResultQMap.getString("Object::Submission::Quoteid")%>

						    </td>		  	   
						    
						    <td class="SearchResult">
						    <a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId%>&answer(Object::Quote::QuoteVerId)=<%=quoteVerId%>&answer(QuoteId)=<%=parentQuoteId%>&answer(parentQuoteId)=<%=parentQuoteId%>">
						   			<%=searchResultQMap.getString("Object::Submission::QuoteNumber")+quoteSubNumber%>   
						   	</td>
						    
						    <td class="SearchResult">
						   			<%=searchResultQMap.getString("Object::Submission::SendStatus")%>   
						    </td>
						    
						    <td class="SearchResult">
						  		 <%=searchResultQMap.getString("Object::Submission::ErrorType")%>   
						  		 &nbsp;
						   	</td>
						    
						    <td class="SearchResult">
						   		<%=searchResultQMap.getString("Object::Submission::ProcessedStartDate")%>   
						   	</td>
						   	
						   	<td class="SearchResult">
						   		<%=searchResultQMap.getString("Object::Submission::SubmissionURL")%>   
						   	</td>
						   					   		
						   	<td class="SearchResult">
						   	  <a href='../XMLViewAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Submission::SubmissionLogId)=<%=infSubmissinLogId%>&answer(fileType)=<%="SUBMISSION"%>' target="_new">View</a>
						   	</td>
						   	
						   	<td class="SearchResult">
 								<a href='../XMLViewAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Submission::SubmissionLogId)=<%=infSubmissinLogId%>&answer(fileType)=<%="REPLYMESSAGE"%>' target="_new">View</a>
						   	</td>
						   	
						   	<td>
								<input type="radio" name="answer(Object::Submission::QuoteId)" checked="checked" value="<%=""+searchResultQMap.getString("Object::Submission::Quoteid")+"::"+searchResultQMap.getString("Object::Submission::SubmissionId")%>" >
							</td>
						 	
						 </tr>					 
						 
						 	
					</logic:iterate>
					</table>
					<tr align="right">
							<td colspan="5" align="right" >
								<html:submit value="Re Submit" styleClass="sbttn"/>
							</td>
					</tr>
					
					<tr>
						<td align="Left" class="links" colspan="5" >						
							<logic:present name="prevSubmission"  scope="request" >
								<a href="../FindSubmission.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::SearchSubmission::PageNum)=<%=(Integer.parseInt(""+pageNumber)-1)%>&answer(Object::SearchSubmission::TotalRec)=<%=""+SearchSubmissionTotalRec%>&answer(Object::Submission::createdDateBegin)=<%=""+createdDateBegin%>&answer(Object::Submission::createdDateEnd)=<%=""+createdDateEnd%>&answer(Object::Submission::SendStatus)=<%=""+sendStatus%>&answer(Object::Submission::ErrorType)=<%=""+errorType%>"><bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						
						<td align="right" class="links" colspan="5">
							<logic:present name="moreSubmission"  scope="request" >
								<a href="../FindSubmission.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::SearchSubmission::PageNum)=<%=(Integer.parseInt(""+pageNumber)+1)%>&answer(Object::SearchSubmission::TotalRec)=<%=""+SearchSubmissionTotalRec%>&answer(Object::Submission::createdDateBegin)=<%=""+createdDateBegin%>&answer(Object::Submission::createdDateEnd)=<%=""+createdDateEnd%>&answer(Object::Submission::SendStatus)=<%=""+sendStatus%>&answer(Object::Submission::ErrorType)=<%=""+errorType%>">Next&gt;&gt;</a>
							</logic:present>   
						</td>
					</tr>
						
				</logic:present>
						 	
				<logic:notPresent name ='searchresultSubmissionDisplay'>	
					<tr> 
						<td class="Error" colspan="3">
							No Submission Found
 						</td> 						
	 				</tr>	
				</logic:notPresent>
	
	<tr>
		<td height="8px"></td>
	</tr>
	<tr>
		<td>

			
		
		</td>
	</tr>
	
	
</table>
			<html:hidden property="answer(Object::SearchSubmission::CurrentPageNum)" value="<%=""+pageNumber%>"/>
			<html:hidden  property="answer(Object::SearchSubmission::PageNum)" value="<%=""+pageNumber%>" />
			<html:hidden  property="answer(Object::SearchSubmission::TotalRec)" value="<%=""+SearchSubmissionTotalRec%>" />
			<html:hidden property="answer(Object::SearchSubmission::TotalPageNum)" value="<%=""+totpagenum%>"/>
			<html:hidden property="answer(Object::Submission::createdDateBegin)" value="<%=""+createdDateBegin%>"/>
			<html:hidden property="answer(Object::Submission::createdDateEnd)" value="<%=""+createdDateEnd%>"/>
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</form>


