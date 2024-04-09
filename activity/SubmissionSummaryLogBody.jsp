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

<bean:define id="ownerId" property="answer(Object::Activity::OwnerId)" name="SearchActivityManagerAction6" />
<bean:define id="intPageNum" property="answer(Object::Activity::PageNum)" name="SearchActivityManagerAction6" />
<bean:define id="objId" property="answer(Object::Activity::ObjectId)" name="SearchActivityManagerAction6" />
<bean:define id="customerId" name="SearchActivityManagerAction6" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="paretQuoteStatus" name="SearchActivityManagerAction6" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="productVerId" name="SearchActivityManagerAction6" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="parentQuoteId" name="SearchActivityManagerAction6" property="answer(parentQuoteId)" scope="request" />
<bean:define id="agencyId" name="SearchActivityManagerAction6" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="SubmissionId" property="answer(Object::Submission::SubmissionId)" name="SearchActivityManagerAction6"/> 									
<bean:define id="SubmissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="SearchActivityManagerAction6"/> 
<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="/SearchActivityManagerAction6.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId%>&answer(Object::Agency::AgencyId)=<%= ""+agencyId %>&answer(Object::Quote::ProductVerId)=<%=""+productVerId%>&answer(Object::Submission::SubmissionId)=<%=SubmissionId.toString()%>&answer(Object::Activity::ObjectType)=Submission&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Activity::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>
<!-- formElement.action="../SearchActivityManagerAction6.do?answer(Object::Activity::PageNum)="+nextOrPre; -->
<%intPageNum = ""+request.getAttribute("pageNum");%>

<html:form action="/SearchActivityManagerAction6.do">
<div class="formpage">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<table WIDTH="100%"   BORDER="0" CELLSPACING="0" CELLPADDING="0">	
	<tr>
	 <td>
	  <table WIDTH="100%"  BORDER="0"  CELLSPACING="0" CELLPADDING="0">
		<tr><td>
			&nbsp;&nbsp;&nbsp;
		</td></tr>
        <logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
			<tr><td>
				&nbsp;&nbsp;&nbsp;<jsp:include page="../common/SubmissionInsuredAgencyLinksPage.jsp" />
			</td></tr>
		</logic:notEqual>
	   </table>
     </td>
    </tr>
</table>
<table width="100%">
 <tr>
  <td class="sectionhead" align="center" height="5">SUBMISSION ACTIVITY LIST</td>
 </tr>
</table>
<table WIDTH="100%" ALIGN="center" BORDER="0"  CELLSPACING="0" CELLPADDING="0">
 <tr><td>&nbsp;</td></tr>
 <tr>	
  <td class="links" align="left" width="15%">
    <a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=Long.parseLong(SubmissionVerId.toString())%>&answer(Object::Submission::SubmissionId)=<%=Long.parseLong(SubmissionId.toString())%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=Long.parseLong(customerId.toString())%>&customerId=<%=Long.parseLong(""+customerId)%>&answer(Object::Customer::CustomerId)=<%=Long.parseLong(""+customerId)%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=Long.parseLong(""+customerId)%>" >Submission Summary</a>			
  </td>	
 </tr>
</table>
<logic:notPresent name="SearchArrOfAllTasktype">
 <table WIDTH="100%" ALIGN="center" BORDER="0"  CELLSPACING="0" CELLPADDING="0">
  <tr>
    <td >&nbsp;</td>
  </tr> 
  <tr> 
	<td class="Error">
		No Activity Found
    </td>
  </tr>
  <tr>
	<td>&nbsp;</td>
  </tr>	
 </table>
</logic:notPresent>
	<%long numOfPages=0; %>
<table WIDTH="100%" ALIGN="center" BORDER="0"  CELLSPACING="0" CELLPADDING="0">
	<logic:present name="documentSize" scope="request">
		<bean:define id="documentSize" name="documentSize" />
			<tr><td><html:hidden property="answer(Object::Activity::TotalRec)" value='<%=""+documentSize %>' /></td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td class="FormLabels">No. of Activities Found:<%=""+documentSize%></td></tr>
			<tr><td>&nbsp;</td></tr>
		
			<%
					
				long searchActivityCount = Long.parseLong(""+documentSize);
				numOfPages = searchActivityCount/20;
				if((searchActivityCount % 20)>0){
					  numOfPages++;
					 }
			%>
			
	</logic:present>
</table>
<table  border="0" class="loctable" CELLSPACING="0" CELLPADDING="0">
   	<logic:present name="SearchArrOfAllTasktype">
   	
   	<tr>
		 <td  class="sectionhead" align="center" colspan="7">
				Page  <%=(Integer.parseInt(""+intPageNum)+1) %> of <%=numOfPages%>
		 </td>
		</tr>
			<tr height="20">
					<td align="Left" class="links" colspan="7">
						<logic:present name="prevDocument" scope="request" >
							<a href="javascript:navigate(<
							
							
							%=(Integer.parseInt(""+intPageNum)-1)%>)" >&lt;&lt; Previous</a>
						</logic:present>
					</td>
					
						
					<td align="right" class="links" colspan="7">
						<logic:present name="moreDocument"  scope="request" >
						<!--  <a href="/SearchActivityManagerAction5.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Activity::OwnerId)='<%=""+ownerId %>'&answer(Object::Activity::PageNum)='<%=""+((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>
						-->	<a href='javascript:navigate(<%=""+(Integer.parseInt(""+intPageNum)+1)%>)'>Next &gt;&gt;</a>
						</logic:present>
					</td>
				</tr>
				<tr>			
					<td  width="3%" align="left">
						S.No
					</td>
					
					
						<td  width="12%" align="left">
						  Performed Date
					
				  </td>
					
					<td  width="12%" align="left">
						 Performed By
					
				  </td>
				
				<td  width="14%" align="left">
						 Description
					
				  </td>
				  
						<td  width="12%" align="left">
						Performed  Server 
					
				  </td>
					
					<td  width="12%" align="left">
						Performed Client 
					
				  </td>
				
				  
					<td width="45%" align="left">
						Submission Data
					
				  </td>
							
				</tr>
				<tr><td colspan="7">&nbsp;</td></tr>
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
					<td  align="left">
					<% index++; %>								
					<%=index%>
					</td>
					
											
						<td  align="left" >
						
						<%= ""+qmap.getString("Object::Activity::CreatedBeginDate")%>
					</td>				
					
					<td  align="left">
						
						<%=""+qmap.getEncodedString("Object::Activity::CreatedBy") %>
											
					</td>
				
				
				<td  align="left">
					
					<%=""+qmap.getString("Object::Activity::ActivityMsg") %>
					
				   </td>	
				
					<td  align="left">
					
					<%=""+qmap.getString("Object::Activity::ServerName") %>
					
				   </td>	
				   
				   <td  align="left">
					
					<%=""+qmap.getString("Object::Activity::ClientName") %>
					
				   </td>	
				
					<td align="left">
					
					<%=""+qmap.getEncodedString("Object::Activity::ActivityData") %>
					
				   </td>	   	
						
				</tr>
				<%} %>
				<tr height="30">
					<td align="Left" class="links" colspan="3">
						<logic:present name="prevDocument" scope="request" >
							<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >&lt;&lt; Previous</a>
						</logic:present>
					</td>
					
						
					<td align="right" class="links" colspan="4">
						<logic:present name="moreDocument"  scope="request" >
						<!--  <a href="/SearchActivityManagerAction5.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Activity::OwnerId)='<%=""+ownerId %>'&answer(Object::Activity::PageNum)='<%=""+((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>
						-->	<a href='javascript:navigate(<%=""+(Integer.parseInt(""+intPageNum)+1)%>)'>Next &gt;&gt;</a>
						</logic:present>
					</td>
				</tr>
				 
				</logic:present>
				
			
		

		
	
	<bean:define id="ActivityId" name="SearchActivityManagerAction6" property="answer(Object::Activity::ActivityId)" />
	<bean:define id="ObjectStatus" name="SearchActivityManagerAction6" property="answer(Object::Activity::ObjectStatus)" />
	<bean:define id="ActivityType" name="SearchActivityManagerAction6" property="answer(Object::Activity::ActivityType)" />
	<bean:define id="ObjectId" name="SearchActivityManagerAction6" property="answer(Object::Activity::ObjectId)" />
	<bean:define id="ObjectVerId" name="SearchActivityManagerAction6" property="answer(Object::Activity::ObjectVerId)" />
	<bean:define id="CreatedBy" name="SearchActivityManagerAction6" property="answer(Object::Activity::CreatedBy)" />
	<bean:define id="UpdatedBy" name="SearchActivityManagerAction6" property="answer(Object::Activity::CreatedBy)" />
	<bean:define id="CreatedBeginDate" name="SearchActivityManagerAction6" property="answer(Object::Activity::CreatedBeginDate)" />
	<bean:define id="CreatedEndDate" name="SearchActivityManagerAction6" property="answer(Object::Activity::CreatedEndDate)" />
	<bean:define id="UpdatedBeginDate" name="SearchActivityManagerAction6" property="answer(Object::Activity::UpdatedBeginDate)" />
	<bean:define id="UpdatedEndDate" name="SearchActivityManagerAction6" property="answer(Object::Activity::UpdatedEndDate)" />
		
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
  		
     <%}else{ 
   %>

	<%} %>
</table>
</div>
</html:form>
