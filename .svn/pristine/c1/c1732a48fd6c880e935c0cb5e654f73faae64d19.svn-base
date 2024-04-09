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

<bean:define id="ownerId" property="answer(Object::Activity::OwnerId)" name="SearchActivityManagerAction9" />
<bean:define id="intPageNum" property="answer(Object::Activity::PageNum)" name="SearchActivityManagerAction9" />
<bean:define id="objId" property="answer(Object::Activity::ObjectId)" name="SearchActivityManagerAction9" />
<bean:define id="customerId" name="SearchActivityManagerAction9" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="paretQuoteStatus" name="SearchActivityManagerAction9" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="productVerId" name="SearchActivityManagerAction9" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="parentQuoteId" name="SearchActivityManagerAction9" property="answer(parentQuoteId)" scope="request" />
<bean:define id="agencyId" name="SearchActivityManagerAction9" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="parentPolicyVerId" name="SearchActivityManagerAction9" property="answer(Object::Policy::ParentPolicyVerId)"/>
<bean:define id="policyNumber" name="SearchActivityManagerAction9" property="answer(policyNumber)"/>
<bean:define id="parentPolicyId" name="SearchActivityManagerAction9" property="answer(parentPolicyId)"/>
<bean:define id="parentPolicyStatus" name="SearchActivityManagerAction9" property="answer(parentPolicyStatus)"/>
<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="/SearchActivityManagerAction9.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus%>&answer(Object::Quote::ProductVerId)=<%=""+productVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(parentPolicyId)=<%=""+parentPolicyId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Activity::PageNum)="+nextOrPre;
	 document.forms[0].submit();
	}
</SCRIPT>
<!-- formElement.action="../SearchActivityManagerAction9.do?answer(Object::Activity::PageNum)="+nextOrPre; -->
<%	String isRenewal = "";
	if(request.getParameter("isRenewal") != null) {
		isRenewal = request.getParameter("isRenewal"); 
	}
	 long productId =0;
	 if(request.getParameter("answer(Object::Quote::ProductId)") != null){
	 	productId = Long.parseLong((request.getParameter("answer(Object::Quote::ProductId)")).toString()); 
	 }
%>

<%
	intPageNum = "" + request.getAttribute("pageNum");
	String subQuoteVerId = "" + request.getParameter("answer(subQuoteVerId)");
	String subQuoteId = "" + request.getParameter("answer(subQuoteId)");
%>

<html:form action="/SearchActivityManagerAction9.do">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<table WIDTH="100%" ALIGN="center"  BORDER="0" CELLSPACING="0" CELLPADDING="0">	
	
	
	<tr><td>
	
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">
		<tr>		
			<td>
					<div id="QuoteInsuerdAgencyAgentHeader">
						<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
						<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
						</jsp:include>
					</div>
		</td>
		</tr>
		</dmshtml:dms_static_with_connector>
		</table><tr><td><table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
				 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">
	
				 	<tr>
						<td align="left">	
						<%if(isRenewal.equals("true")) { %>			
							<jsp:include page="../common/DynamicPolicyHeader.jsp">
								<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
								<jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
								<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
								<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />								
								<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
							</jsp:include>
						<%} else { %>
							<jsp:include page="../common/DynamicPolicyHeader.jsp">
								<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
								<jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
								<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
								<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
								<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
							</jsp:include>
						<%} %>
						 </td>
				  	</tr>
			  	
					<tr>
						<td>
							<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
							 	<tr>
									<td align="left">	
										<jsp:include page="../common/EndorsementQuoteHeader.jsp">
											<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
											<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
										</jsp:include>	
									</td>
								</tr>		
							</table>	
						</td>
					</tr>				  	
				  	
				  	</dmshtml:dms_static_with_connector>
				  	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true">
					<tr>		
						<td>&nbsp;</td>
				 	</tr>
					<tr>
						<td>
							<jsp:include page="/common/PolicyQuoteHeaderCoverMin.jsp">											
								<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+parentQuoteId%>" />
								<jsp:param name="ParentQuoteId" value="<%=""+parentQuoteId%>" />
								<jsp:param name="productVerId" value="<%=""+productVerId%>" />
								<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />	
								<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />	
								<jsp:param name="customerId" value="<%=""+customerId%>" />
							</jsp:include>		 										
						</td>											
					</tr>						
					<tr>
						<td>
							<jsp:include page="../common/DynamicPolicyHeaderUI3.jsp">
								<jsp:param name="policyId" value="<%=""+parentPolicyId.toString()%>" />
								<jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
								<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
								<jsp:param name="prodId" value="<%=""+productId%>" />
								<jsp:param name="ProductVerId" value="<%=""+productVerId%>" />								
								<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
							</jsp:include>
						</td>
					</tr>
					<tr>
						<td>
							<jsp:include page="/common/EndorsementQuoteInformation.jsp">
								<jsp:param name="ParentQuoteId" value="<%=""+parentQuoteId%>" />
								<jsp:param name="productVerId" value="<%=""+productVerId%>" />
								<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
								<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
								<jsp:param name="customerId" value="<%=""+customerId%>" />
								<jsp:param name="subQuoteVerId" value="<%=""+subQuoteVerId%>" />
								<jsp:param name="subQuoteId" value="<%=""+subQuoteId%>" />
							</jsp:include>
						</td>
					</tr>
				</dmshtml:dms_static_with_connector>	
				</table>
    	 </td>
    	</tr><tr><td>&nbsp;&nbsp;</td></tr><tr>
		<tr>    	
    	 <td colspan="2" class="links" height="5">
    	 <a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(parentPolicyStatus)=<%=""+parentPolicyStatus %>">Quote Summary</a>	
		</td>
		</tr><tr><td>
		</td></tr>
		<tr><td></td></tr></table>
		<table width="100%">
		<tr><td>&nbsp;&nbsp;</td></tr>
		<%if(isRenewal.equals("true")) { %>
			<tr>
				<td class="NewSectionHeadNew" align="center" height="5">RENEWAL ACTIVITY LIST</td>
			</tr>
		<%} else { %>
			<tr>
				<td class="NewSectionHeadNew" align="center" height="5">ENDORSEMENT ACTIVITY LIST</td>
			</tr>
		<%} %>
		</table>
	<logic:notPresent name="SearchArrOfAllTasktype">
		<tr>
			<td colspan="3">&nbsp;</td>
					
		</tr> 
		<tr> 
			<td class="Error" colspan="3">
				No Activity Found
	 		</td>
	 	</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>	
	</logic:notPresent>
	<%long numOfPages=0; %>
	<logic:present name="documentSize" scope="request">
		<bean:define id="documentSize" name="documentSize" />
			<tr>
				<td>
					<html:hidden property="answer(Object::Activity::TotalRec)" value='<%=""+documentSize %>' />
				</td>
			</tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<tr><td class="FormLabels">No. of Activities Found:<%=""+documentSize%></td></tr>
			<tr><td>&nbsp;</td>
			</tr>
			<tr>
							</tr>	
			<%
					
				long searchActivityCount = Long.parseLong(""+documentSize);
				numOfPages = searchActivityCount/20;
				if((searchActivityCount % 20)>0){
					  numOfPages++;
					 }
			%>
			
	</logic:present>
	
	<tr><td>&nbsp;&nbsp;</td></tr><tr>
	<logic:present name="SearchArrOfAllTasktype">
	<table width="100%"><tr>
	<td width="45%" class="sectionhead" ></td>	<td align="center" class="sectionhead" colspan="4" width="14%">
			Page  <%=(Integer.parseInt(""+intPageNum)+1) %> of <%=numOfPages%>
		</td><td width="40%" class="sectionhead"></td><td width="14%"></td>
	</tr></table>
	</logic:present>
	
	<table width="100%" align="left" border="0" CELLSPACING="0" CELLPADDING="0">
												
	<tr>
		<td>
				<table WIDTH="100%" ALIGN="center" BORDER="0">
			<logic:present name="SearchArrOfAllTasktype">
			
				<tr height="30">
					<td align="Left" class="links" colspan="2">
						<logic:present name="prevDocument" scope="request" >
							<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >&lt;&lt; Previous</a>
						</logic:present>
					</td>
					<td align="right" class="links" colspan="11">
						<logic:present name="moreDocument"  scope="request" >
						<%-- %><a href="/SearchActivityManagerAction9.do?TabPanelName=Activity_Panel&answer(Object::Activity::OwnerId)='<%=""+ownerId %>'&answer(Object::Activity::PageNum)='<%=((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>--%>
							<a href='javascript:navigate(<%=""+(Integer.parseInt(""+intPageNum)+1)%>)'>Next &gt;&gt;</a>
						</logic:present>
					</td>
				</tr>
				
				<tr>			
					<td class="sectionhead" width="3%" align="left">
						S.No
					</td>
					
					
						<td class="sectionhead" width="12%" align="left">
						  Performed Date
					
				  </td>
					
					<td class="sectionhead" width="12%" align="left">
						 Performed By
					
				  </td>
				
				<td class="sectionhead" width="14%" align="left">
						 Description
					
				  </td>
				  
						<td class="sectionhead" width="12%" align="left">
						Performed  Server 
					
				  </td>
					
					<td class="sectionhead" width="12%" align="left">
						Performed Client 
					
				  </td>
				
				  
					<td class="sectionhead" width="10%" align="left">
						QuoteStatus
					
				  </td>
							
				</tr>
				<tr><td>&nbsp;</td></tr>
				<% int index=0; %>	
				<%
					String pageNum = (String)intPageNum.toString();	%>						
				<%	try{
						index = Integer.parseInt(pageNum);
						index = index*20;
					}catch(NumberFormatException nfe){
						index=0;
					}				
				%>			
							
				<%
					java.util.ArrayList arrListactivity = (java.util.ArrayList)request.getAttribute("SearchArrOfAllTasktype");
					for(int actIndex=0;actIndex<arrListactivity.size();actIndex++){
						com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrListactivity.get(actIndex);						
				%>
				<%
					String cId = qmap.getString("Object::Activity::ActivityId");
							%>
				
				<tr>
					<td class="SearchResult" align="left">
					<% index++; %>								
					<%=index%>
					</td>
					
											
						<td class="SearchResult" align="left" >
						
						<%= ""+qmap.getString("Object::Activity::CreatedBeginDate")%>
					</td>				
					
					<td class="SearchResult" align="left">
						
						<%=""+qmap.getEncodedString("Object::Activity::CreatedBy") %>
											
					</td>
				
				
				<td class="SearchResult" align="left">
					
					<%=""+qmap.getString("Object::Activity::ActivityMsg") %>
					
				   </td>	
				
					<td class="SearchResult" align="left">
					
					<%=""+qmap.getString("Object::Activity::ServerName") %>
					
				   </td>	
				   
				   <td class="SearchResult" align="left">
					
					<%=""+qmap.getString("Object::Activity::ClientName") %>
					
				   </td>	
				
					<td class="SearchResult" align="left">
					
					<%=""+qmap.getString("Object::Activity::ObjectStatus") %>
					
				   </td>	   	
						
				</tr>
				<%} %>
				<tr height="30">
					<td align="Left" class="links" colspan="2">
						<logic:present name="prevDocument" scope="request" >
							<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >&lt;&lt; Previous</a>
						</logic:present>
					</td>
					<td align="right" class="links" colspan="10">
						<logic:present name="moreDocument"  scope="request" >
						<%-- %><a href="/SearchActivityManagerAction9.do?TabPanelName=Activity_Panel&answer(Object::Activity::OwnerId)='<%=""+ownerId %>'&answer(Object::Activity::PageNum)='<%=((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>--%>
							<a href='javascript:navigate(<%=""+(Integer.parseInt(""+intPageNum)+1)%>)'>Next &gt;&gt;</a>
						</logic:present>
					</td>
				</tr>
				 
				</logic:present>
				
			
		</td>
	</tr>
	</table>
		
	
	<bean:define id="ActivityId" name="SearchActivityManagerAction9" property="answer(Object::Activity::ActivityId)" />
	<bean:define id="ObjectStatus" name="SearchActivityManagerAction9" property="answer(Object::Activity::ObjectStatus)" />
	<bean:define id="ActivityType" name="SearchActivityManagerAction9" property="answer(Object::Activity::ActivityType)" />
	<bean:define id="ObjectId" name="SearchActivityManagerAction9" property="answer(Object::Activity::ObjectId)" />
	<bean:define id="ObjectVerId" name="SearchActivityManagerAction9" property="answer(Object::Activity::ObjectVerId)" />
	<bean:define id="CreatedBy" name="SearchActivityManagerAction9" property="answer(Object::Activity::CreatedBy)" />
	<bean:define id="UpdatedBy" name="SearchActivityManagerAction9" property="answer(Object::Activity::CreatedBy)" />
	<bean:define id="CreatedBeginDate" name="SearchActivityManagerAction9" property="answer(Object::Activity::CreatedBeginDate)" />
	<bean:define id="CreatedEndDate" name="SearchActivityManagerAction9" property="answer(Object::Activity::CreatedEndDate)" />
	<bean:define id="UpdatedBeginDate" name="SearchActivityManagerAction9" property="answer(Object::Activity::UpdatedBeginDate)" />
	<bean:define id="UpdatedEndDate" name="SearchActivityManagerAction9" property="answer(Object::Activity::UpdatedEndDate)" />
		
<html:hidden property="answer(Object::Activity::OwnerId)" value='<%=""+ownerId%>'/>
<html:hidden  property="answer(Object::Activity::PageNum)" styleId="PageNumId" value='<%=""+intPageNum%>' />	
<html:hidden  property="answer(Object::Activity::ActivityId)" value='<%=""+ActivityId%>' />	
<html:hidden  property="answer(Object::Activity::ObjectVerId)" value='<%=""+ObjectVerId %>' />	
<html:hidden  property="answer(Object::Activity::ObjectId)" value='<%=""+ObjectId %>' />	
<html:hidden  property="answer(Object::Activity::ObjectStatus)" value='<%=""+ObjectStatus %>' />	
<html:hidden property="answer(Object::Activity::ActivityType)" value='<%=""+ActivityType %>' />
<html:hidden property="answer(Object::Activity::CreatedBy)" value='<%=""+CreatedBy %>' />
<html:hidden property="answer(Object::Activity::UpdatedBy)" value='<%=""+UpdatedBy %>' />

<html:hidden property="answer(Object::Activity::CreatedStartDate)" value='<%=""+CreatedBeginDate %>'/>
<html:hidden property="answer(Object::Activity::CreatedEndDate)" value='<%=""+CreatedEndDate%>'/>
<html:hidden property="answer(Object::Activity::UpdatedStartDate)" value='<%=""+UpdatedBeginDate %>'/>
<html:hidden property="answer(Object::Activity::UpdatedEndDate)" value='<%=""+UpdatedEndDate %>' />

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<% 
    long ActivityId1 = 0;
 	try{
 		ActivityId1=Long.parseLong(""+ActivityId);
 	}catch(Exception ex){}
 	if(ActivityId1 > 0){
   %>
  		
      <html:hidden property="answer(Object::Activity::ActivityType)" value="ActivityType"/>
   <html:hidden property="answer(Object::Activity::ActivityId)" value="<%=""+ActivityId1%>"/>
   <%}else{ 
   %>

	<%} %>
	<tr><td>
	</td></tr>
</table>
</html:form>

<script type="text/javascript">
	var a = document.getElementById('priorpolicyheadernav');
	if((a != null) && (a != undefined))
		a.id = 'policyheadernav';
</script>