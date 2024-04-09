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
<bean:define id="pageNumber" property="answer(Object::SearchBilling::PageNum)" name="Billing" />
<bean:define id="currentPageNum"property="answer(Object::SearchBilling::CurrentPageNum)" name="Billing"/>
<bean:define id="SearchBillingTotalRec" property="answer(Object::SearchBilling::TotalRec)"  name="Billing" />		
<bean:define id="totpagenum"  property="answer(Object::SearchBilling::TotalPageNum)"  name="Billing"  />
<bean:define id="createdDateBegin"  property="answer(Object::Billing::createdDateBegin)"  name="Billing"  />
<bean:define id="createdDateEnd"  property="answer(Object::Billing::createdDateEnd)"  name="Billing"  />

<% String sendStatus = request.getParameter("answer(Object::Billing::SendStatus)"); %>
<% String errorType = request.getParameter("answer(Object::Billing::ErrorType)"); %>

<form action="/ConfirmReBilling.do" >
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td class="NewSectionHead" align="center" colspan ="10" >Find Billing-Results</td></tr>
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
		<logic:present name ='searchresultBillingDisplay'>

		
		<tr> 
			<td class="sectionhead" colspan="3">
			<%totalRec=SearchBillingTotalRec.toString();%>
				Billings Found: <%=SearchBillingTotalRec.toString()%>  
 			</td> 			
 		</tr>
 		
 		<tr>
			<td  class="sectionhead"  height="20px" align="center">Page <%=Integer.parseInt(pageNumber+"")+1%>  of <%=totpagenum.toString()%></td>
		</tr>	
 		
 		<tr>
			<td align="Left" class="links" colspan="5" >						
				<logic:present name="prevBilling"  scope="request" >
					<a href="../FindBilling.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::SearchBilling::PageNum)=<%=(Integer.parseInt(""+pageNumber)-1)%>&answer(Object::SearchBilling::TotalRec)=<%=""+SearchBillingTotalRec%>&answer(Object::Billing::createdDateBegin)=<%=""+createdDateBegin%>&answer(Object::Billing::createdDateEnd)=<%=""+createdDateEnd%>&answer(Object::Billing::SendStatus)=<%=""+sendStatus%>&answer(Object::Billing::ErrorType)=<%=""+errorType%>"><bean:message key="Common.Previous"/></a>
				</logic:present>
			</td>
			
			<td align="right" class="links" colspan="5">
				<%if (Integer.parseInt("0"+totpagenum)>=1){%>
					<a href="../FindBilling.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::SearchBilling::PageNum)=<%=(Integer.parseInt(""+pageNumber))%>&answer(Object::SearchBilling::TotalRec)=<%=""+SearchBillingTotalRec%>&answer(Object::SearchBilling::NextOrPrev)=<%="1"%>&answer(Object::Billing::createdDateBegin)=<%=""+createdDateBegin%>&answer(Object::Billing::createdDateEnd)=<%=""+createdDateEnd%>&answer(Object::Billing::SendStatus)=<%=""+sendStatus%>&answer(Object::Billing::ErrorType)=<%=""+errorType%>">Next&gt;&gt;</a>
				<%}%>		
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
				<html:submit value="Re Billing" styleClass="sbttn"/>
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
						<td class="sectionhead" width="8">Quote Number</td>
						<td class="sectionhead" width="18%">Policy Number</td>
						<td class="sectionhead" width="12%">Send Status</td>
						<td class="sectionhead" width="10%">Error Type</td>
						<td class="sectionhead" width="13%">Processed Date</td>
						<td class="sectionhead" width="30%">Send URL</td>
						<td class="sectionhead" width="8%">Billing XML</td>
						<td class="sectionhead" width="10%">Response XML</td>
						<td class="sectionhead" width="10%">Select</td>
					</tr>
	
					
					<%
					long agencyId=0;
					long parentQuoteid=0;
					long infBillingLogId=0;
					String policyNumber="";
					String quoteNumber="";
					String quoteSubNumber="";
					String policySubNumber="";
					%>
	
					<logic:iterate id="searchResultQMap"  name='searchresultBillingDisplay' type="com.dms.ejb.data.QuestionHashMap">


						<% count++; 
						if(searchResultQMap.getString("Object::Billing::Quoteid")!=""){
							parentQuoteid=Long.parseLong(""+searchResultQMap.getString("Object::Billing::Quoteid"));							
						}
											
						if(searchResultQMap.getString("Object::Billing::AgencyId")!=""){
							agencyId=Long.parseLong(""+searchResultQMap.getString("Object::Billing::AgencyId"));							
						}
						if(searchResultQMap.getString("Object::Billing::BillingLogId")!=""){
							infBillingLogId=Long.parseLong(""+searchResultQMap.getString("Object::Billing::BillingLogId"));	
						}
						if(searchResultQMap.getString("Object::Billing::PolicyNumber")!=""){
							policyNumber=searchResultQMap.getString("Object::Billing::PolicyNumber");	
						}
						quoteNumber="";
						quoteSubNumber="";
						policySubNumber="";
						
						if(searchResultQMap.getString("Object::Billing::PolicySubNumber")!=""){
							if(Long.parseLong(""+searchResultQMap.getString("Object::Billing::PolicySubNumber"))>0){
								policySubNumber="-"+searchResultQMap.getString("Object::Billing::PolicySubNumber");																
							}
						}
						if(searchResultQMap.getString("Object::Billing::QuoteNum")!=""){
							if(Long.parseLong(""+searchResultQMap.getString("Object::Billing::QuoteNum"))>0){
								quoteNumber="-"+searchResultQMap.getString("Object::Billing::QuoteNum");
							}
						}
						if(searchResultQMap.getString("Object::Billing::QuoteSubNum")!=""){
							if(Long.parseLong(""+searchResultQMap.getString("Object::Billing::QuoteSubNum"))>0){
								quoteSubNumber="-"+searchResultQMap.getString("Object::Billing::QuoteSubNum");
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
						 		<%=count%>   				
						 	</td>			 		
						   	
						   	 <td class="SearchResult" align="left">						  		  
								  <%=""+searchResultQMap.getString("Object::Billing::QuoteNum")+quoteSubNumber%>
						    </td>		  	   
						    
						    <td class="SearchResult">
						     <a href='../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=policyNumber %>'><%=policyNumber+policySubNumber%></a>
						   			  
						   	</td>
						    
						    <td class="SearchResult">
						   			<%=searchResultQMap.getString("Object::Billing::SendStatus")%>   
						    </td>
						    
						    <td class="SearchResult">
						  		 <%=searchResultQMap.getString("Object::Billing::ErrorType")%>   
						  		 &nbsp;
						   	</td>
						    
						    <td class="SearchResult">
						   		<%=searchResultQMap.getString("Object::Billing::ProcessedStartDate")%>   
						   	</td>
						   	
						   	<td class="SearchResult">
						   		<%=searchResultQMap.getString("Object::Billing::BillingURL")%>   
						   	</td>
						   					   		
						   	<td class="SearchResult">	
						   	  <a href='../GetBillingXml.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Billing::BillingLogId)=<%=infBillingLogId%>&answer(fileType)=<%="BILLING"%>' target="_new">View</a>
						   	</td>
						   	
						   	<td class="SearchResult">
 								<a href='../GetBillingXml.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Billing::BillingLogId)=<%=infBillingLogId%>&answer(fileType)=<%="REPLYMESSAGE"%>' target="_new">View</a>
						   	</td>
						   	<td>
								<input type="radio" name="answer(Object::Billing::Quoteid)" checked="checked" value="<%=""+searchResultQMap.getString("Object::Billing::Quoteid")+"::"+searchResultQMap.getString("Object::Billing::PolicyNumber")+"::"+searchResultQMap.getString("Object::Billing::Edsno")+"::"+searchResultQMap.getString("Object::Billing::Policyid")+"::"+searchResultQMap.getString("Object::Billing::PolicyVerid")+"::"+searchResultQMap.getString("Object::Billing::Endrscd")+"::"+searchResultQMap.getString("Object::Billing::PolicySubNumber")+"::"+searchResultQMap.getString("Object::Billing::BillingLogId")%>" >
							</td>							
						 </tr>					 
						 
						 	
					</logic:iterate>
					</table>
					<tr align="right">
							<td colspan="5" align="right" >
								<html:submit value="Re Billing" styleClass="sbttn"/>
							</td>
					</tr>
					
					<tr>
						<td align="Left" class="links" colspan="5" >						
							<logic:present name="prevBilling"  scope="request" >
								<a href="../FindBilling.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::SearchBilling::PageNum)=<%=(Integer.parseInt(""+pageNumber)-1)%>&answer(Object::SearchBilling::TotalRec)=<%=""+SearchBillingTotalRec%>&answer(Object::Billing::createdDateBegin)=<%=""+createdDateBegin%>&answer(Object::Billing::createdDateEnd)=<%=""+createdDateEnd%>&answer(Object::Billing::SendStatus)=<%=""+sendStatus%>&answer(Object::Billing::ErrorType)=<%=""+errorType%>"><bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						
						<td align="right" class="links" colspan="5">
				<%if (Integer.parseInt("0"+totpagenum)>=1){%>
					<a href="../FindBilling.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::SearchBilling::PageNum)=<%=(Integer.parseInt(""+pageNumber))%>&answer(Object::SearchBilling::TotalRec)=<%=""+SearchBillingTotalRec%>&answer(Object::SearchBilling::NextOrPrev)=<%="1"%>&answer(Object::Billing::createdDateBegin)=<%=""+createdDateBegin%>&answer(Object::Billing::createdDateEnd)=<%=""+createdDateEnd%>&answer(Object::Billing::SendStatus)=<%=""+sendStatus%>&answer(Object::Billing::ErrorType)=<%=""+errorType%>">Next&gt;&gt;</a>
				<%}%>		
			</td>
					</tr>
						
				</logic:present>
						 	
				<logic:notPresent name ='searchresultBillingDisplay'>	
					<tr> 
						<td class="Error" colspan="3">
							No Billing(s) Found
 						</td> 						
	 				</tr>	
				</logic:notPresent>
	
	<tr>
		<td height="8px"></td>
	</tr>
	<tr>
		<td>

			<html:hidden property="answer(Object::SearchBilling::CurrentPageNum)" value="<%=""+pageNumber%>"/>
			<html:hidden  property="answer(Object::SearchBilling::PageNum)" value="<%=""+pageNumber%>" />
			<html:hidden  property="answer(Object::SearchBilling::TotalRec)" value="<%=""+SearchBillingTotalRec%>" />
			<html:hidden property="answer(Object::SearchBilling::TotalPageNum)" value="<%=""+totpagenum%>"/>
			<html:hidden property="answer(Object::Billing::createdDateBegin)" value="<%=""+createdDateBegin%>"/>
			<html:hidden property="answer(Object::Billing::createdDateEnd)" value="<%=""+createdDateEnd%>"/>
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
		</td>
	</tr>
	
	
</table>
</form>

