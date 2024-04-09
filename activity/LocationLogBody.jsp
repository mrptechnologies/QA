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

<bean:define id="ownerId" property="answer(Object::Activity::OwnerId)" name="SearchActivityManagerAction8" />
<bean:define id="intPageNum" property="answer(Object::Activity::PageNum)" name="SearchActivityManagerAction8" />
<bean:define id="objId" property="answer(Object::Activity::ObjectId)" name="SearchActivityManagerAction8" />
<bean:define id="customerId" name="SearchActivityManagerAction8" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="paretQuoteStatus" name="SearchActivityManagerAction8" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="productVerId" name="SearchActivityManagerAction8" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="parentQuoteId" name="SearchActivityManagerAction8" property="answer(parentQuoteId)" scope="request" />
<bean:define id="agencyId" name="SearchActivityManagerAction8" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="SubmissionId" property="answer(Object::Submission::SubmissionId)" name="SearchActivityManagerAction8"/> 									
<bean:define id="SubmissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="SearchActivityManagerAction8"/> 


<!-- formElement.action="../SearchActivityManagerAction8.do?answer(Object::Activity::PageNum)="+nextOrPre; -->
<%intPageNum = ""+request.getAttribute("pageNum");%>

<html:form action="/SearchActivityManagerAction8.do">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<table WIDTH="100%" ALIGN="center"  BORDER="0" CELLSPACING="0" CELLPADDING="0">	
	
	
	<tr><td>
	<table WIDTH="100%" ALIGN="center" BORDER="0"  CELLSPACING="0" CELLPADDING="0">
		
					
		<tr><td>
			&nbsp;&nbsp;&nbsp;
		</td></tr>

		<tr>
		
	<td>
			&nbsp;&nbsp;&nbsp;<jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
		</td></tr>
	   </table>
    	 </td>
    	</tr><tr><td>&nbsp;&nbsp;</td></tr><tr>
    	<td align="center"><dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
    	 <td colspan="2" class="links" height="5">
								</td>
		</tr>
	  <tr>
	  <td class="links" align="left" width="150px">
						<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=Long.parseLong(SubmissionVerId.toString())%>&answer(Object::Submission::SubmissionId)=<%=Long.parseLong(SubmissionId.toString())%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=Long.parseLong(customerId.toString())%>&customerId=<%=Long.parseLong(""+customerId)%>&answer(Object::Customer::CustomerId)=<%=Long.parseLong(""+customerId)%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=Long.parseLong(""+customerId)%>" >Submission Summary</a>			
									
	  </td>	<td>
		</td></tr>
		<tr><td></td></tr></table>
		<table width="90%">
	<tr><td>&nbsp;&nbsp;</td></tr><tr>
			<td class="NewSectionHeadNew" align="center" height="5">SUBMISSION ACTIVITY LIST</td>
										</tr></table>
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
	<td width="2.5%"></td><td width="33.5%" class="sectionhead" ></td>	<td align="center" class="sectionhead" colspan="4" width="14%">
			Page  <%=(Integer.parseInt(""+intPageNum)+1) %> of <%=numOfPages+1%>
		</td><td width="38%" class="sectionhead"></td><td width="12%"></td>
	</tr></table>
	</logic:present>
	
	<table width="90%" align="left" border="0" CELLSPACING="0" CELLPADDING="0">
												
	<tr>
		<td>
				<table WIDTH="95%" ALIGN="center" BORDER="0">
			<logic:present name="SearchArrOfAllTasktype">
			
				<tr height="30">
					<td align="Left" class="links" colspan="2">
						<logic:present name="prevDocument" scope="request" >
							<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >&lt;&lt; Previous</a>
						</logic:present>
					</td>
					<td align="right" class="links" colspan="11">
						<logic:present name="moreDocument"  scope="request" >
						<%-- %><a href="/SearchActivityManagerAction8.do?TabPanelName=Activity_Panel&answer(Object::Activity::OwnerId)='<%=""+ownerId %>'&answer(Object::Activity::PageNum)='<%=((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>--%>
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
						Submission Data
					
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
					
					<%=""+qmap.getEncodedString("Object::Activity::ActivityData") %>
					
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
						<%-- %><a href="/SearchActivityManagerAction8.do?TabPanelName=Activity_Panel&answer(Object::Activity::OwnerId)='<%=""+ownerId %>'&answer(Object::Activity::PageNum)='<%=((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>--%>
							<a href='javascript:navigate(<%=""+(Integer.parseInt(""+intPageNum)+1)%>)'>Next &gt;&gt;</a>
						</logic:present>
					</td>
				</tr>
				 
				</logic:present>
				
			
		</td>
	</tr>
	</table>
		
	
	<bean:define id="ActivityId" name="SearchActivityManagerAction8" property="answer(Object::Activity::ActivityId)" />
	<bean:define id="ObjectStatus" name="SearchActivityManagerAction8" property="answer(Object::Activity::ObjectStatus)" />
	<bean:define id="ActivityType" name="SearchActivityManagerAction8" property="answer(Object::Activity::ActivityType)" />
	<bean:define id="ObjectId" name="SearchActivityManagerAction8" property="answer(Object::Activity::ObjectId)" />
	<bean:define id="ObjectVerId" name="SearchActivityManagerAction8" property="answer(Object::Activity::ObjectVerId)" />
	<bean:define id="CreatedBy" name="SearchActivityManagerAction8" property="answer(Object::Activity::CreatedBy)" />
	<bean:define id="UpdatedBy" name="SearchActivityManagerAction8" property="answer(Object::Activity::CreatedBy)" />
	<bean:define id="CreatedBeginDate" name="SearchActivityManagerAction8" property="answer(Object::Activity::CreatedBeginDate)" />
	<bean:define id="CreatedEndDate" name="SearchActivityManagerAction8" property="answer(Object::Activity::CreatedEndDate)" />
	<bean:define id="UpdatedBeginDate" name="SearchActivityManagerAction8" property="answer(Object::Activity::UpdatedBeginDate)" />
	<bean:define id="UpdatedEndDate" name="SearchActivityManagerAction8" property="answer(Object::Activity::UpdatedEndDate)" />
		
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
