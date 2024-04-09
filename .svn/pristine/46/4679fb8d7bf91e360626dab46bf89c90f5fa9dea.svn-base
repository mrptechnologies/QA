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

<bean:define id="ownerId" property="answer(Object::Activity::OwnerId)" name="SearchActivityManagerAction5" />
<bean:define id="intPageNum" property="answer(Object::Activity::PageNum)" name="SearchActivityManagerAction5" />
<bean:define id="objId" property="answer(Object::Activity::ObjectId)" name="SearchActivityManagerAction5" />
<bean:define id="customerId" name="SearchActivityManagerAction5" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="policyNumber" name="SearchActivityManagerAction5" property="answer(Object::Quote::PolicyNumber)" scope="request" />
<bean:define id="paretQuoteStatus" name="SearchActivityManagerAction5" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="productVerId" name="SearchActivityManagerAction5" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="parentQuoteId" name="SearchActivityManagerAction5" property="answer(parentQuoteId)" scope="request" />
<bean:define id="agencyId" name="SearchActivityManagerAction5" property="answer(Object::Agency::AgencyId)" scope="request" />
<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="/SearchActivityManagerAction5.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus%>&answer(Object::Quote::ProductVerId)=<%=""+productVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+customerId %>&answer(Object::Activity::OwnerId)=<%=""+ownerId %>&answer(Object::Activity::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>

<!-- formElement.action="../SearchActivityManagerAction5.do?answer(Object::Activity::PageNum)="+nextOrPre; -->
<%intPageNum = ""+request.getAttribute("pageNum");%>

<%
if((""+policyNumber).equalsIgnoreCase("") && request.getParameter("policyNumber")!=null){
	policyNumber = ""+request.getParameter("policyNumber");
}
%>


<html:form action="/SearchActivityManagerAction5.do">
<div class="formpage">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<table WIDTH="100%" ALIGN="center"  BORDER="0" CELLSPACING="0" CELLPADDING="0">	
  <logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
	<tr>
	 <td>
		<jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
	 </td>
    </tr>
  </logic:notEqual>
  <logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
  <tr><td>
		<table width="90%" align="left" border="0" CELLSPACING="0" CELLPADDING="0">
		 <tr><td>
			  <jsp:include page="../common/QuoteHeader.jsp">
				<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
				<jsp:param name="productVerId" value="<%=""+productVerId%>" />
				<jsp:param name="heading" value="<%=""%>" />
				<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus %>" />
			  </jsp:include>
	        </td></tr>
	    </table>
  </td></tr>
  </logic:notEqual>
 <tr>
  <td>
	 <jsp:include page="/common/QuoteHeaderCoverMin.jsp">
	   <jsp:param name="ParentQuoteId" value="<%=""+parentQuoteId%>" />
	   <jsp:param name="productVerId" value="<%=""+productVerId%>" />
	   <jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
	   <jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
	   <jsp:param name="customerId" value="<%=""+customerId%>" />
	 </jsp:include>
   </td>
 </tr>
 <tr>
  <td  class="links" height="5">
		<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">Quote Summary</a>
  </td>
 </tr>
 <tr><td>&nbsp;</td></tr>
 <tr><td class="sectionhead" align="center" height="5">QUOTE ACTIVITY LIST</td></tr>
 <logic:notPresent name="SearchArrOfAllTasktype">
	  <tr><td >&nbsp;</td></tr> 	
	  <tr> 
		<td class="Error" colspan="3">
			No Activity Found
	 	</td>
	  </tr>
	  <tr><td>&nbsp;</td></tr>	
  </logic:notPresent>
  <%long numOfPages=0; %>
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
  <logic:present name="SearchArrOfAllTasktype">
		<tr>
			<td align="center" class="sectionhead" >
				Page  <%=(Integer.parseInt(""+intPageNum)+1) %> of <%=numOfPages%>
			</td>
		 </tr>
   </logic:present>
</table>
<table width="100%" align="center" class="loctable" border="0" CELLSPACING="0" CELLPADDING="0">
  	<logic:present name="SearchArrOfAllTasktype">
	  <tr height="20">
			<td align="Left" class="links" colspan="4">
				<logic:present name="prevDocument" scope="request" >
					<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >&lt;&lt; Previous</a>
				</logic:present>
			</td>
			<td align="right" class="links" colspan="3">
				<logic:present name="moreDocument"  scope="request" >
				<%-- %><a href="/SearchActivityManagerAction5.do?TabPanelName=Activity_Panel&answer(Object::Activity::OwnerId)='<%=""+ownerId %>'&answer(Object::Activity::PageNum)='<%=((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>--%>
					<a href='javascript:navigate(<%=""+(Integer.parseInt(""+intPageNum)+1)%>)'>Next &gt;&gt;</a>
				</logic:present>
			</td>
	   </tr>
	   <tr>			
			<td  width="5%" align="left">
				S.No
			</td>
			<td  width="12%" align="left">
				  Performed Date
		     </td>
	    	<td  width="12%" align="left">
				 Performed By
			</td>
			<td  width="10%" align="left">
				 Description
			</td>
			<td  width="12%" align="left">
				Performed  Server 
		    </td>
			<td  width="15%" align="left">
				Performed Client 
	        </td>
			<td  width="10%" align="left">
				Quote Status
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
			<td align="left">
				<%=""+qmap.getEncodedString("Object::Activity::CreatedBy") %>
			</td>
			<td  align="left">
				<%=""+qmap.getString("Object::Activity::ActivityMsg") %>
	        </td>	
			<td align="left">
				<%=""+qmap.getString("Object::Activity::ServerName") %>
            </td>	
		    <td  align="left">
				<%=""+qmap.getString("Object::Activity::ClientName") %>
	        </td>	
			<td  align="left">
				<%=""+qmap.getString("Object::Activity::ObjectStatus") %>
	        </td>	   	
		</tr>
		<%} %>
		<tr height="30">
			<td align="Left" class="links" colspan="4">
				<logic:present name="prevDocument" scope="request" >
					<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >&lt;&lt; Previous</a>
				</logic:present>
			</td>
			
				
			<td align="right" class="links" colspan="3">
				<logic:present name="moreDocument"  scope="request" >
				<!--  <a href="/SearchActivityManagerAction5.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Activity::OwnerId)='<%=""+ownerId %>'&answer(Object::Activity::PageNum)='<%=""+((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>
				-->	<a href='javascript:navigate(<%=""+(Integer.parseInt(""+intPageNum)+1)%>)'>Next &gt;&gt;</a>
				</logic:present>
			</td>
		</tr>
	</logic:present>
	
	<bean:define id="ActivityId" name="SearchActivityManagerAction5" property="answer(Object::Activity::ActivityId)" />
	<bean:define id="ObjectStatus" name="SearchActivityManagerAction5" property="answer(Object::Activity::ObjectStatus)" />
	<bean:define id="ActivityType" name="SearchActivityManagerAction5" property="answer(Object::Activity::ActivityType)" />
	<bean:define id="ObjectId" name="SearchActivityManagerAction5" property="answer(Object::Activity::ObjectId)" />
	<bean:define id="ObjectVerId" name="SearchActivityManagerAction5" property="answer(Object::Activity::ObjectVerId)" />
	<bean:define id="CreatedBy" name="SearchActivityManagerAction5" property="answer(Object::Activity::CreatedBy)" />
	<bean:define id="UpdatedBy" name="SearchActivityManagerAction5" property="answer(Object::Activity::CreatedBy)" />
	<bean:define id="CreatedBeginDate" name="SearchActivityManagerAction5" property="answer(Object::Activity::CreatedBeginDate)" />
	<bean:define id="CreatedEndDate" name="SearchActivityManagerAction5" property="answer(Object::Activity::CreatedEndDate)" />
	<bean:define id="UpdatedBeginDate" name="SearchActivityManagerAction5" property="answer(Object::Activity::UpdatedBeginDate)" />
	<bean:define id="UpdatedEndDate" name="SearchActivityManagerAction5" property="answer(Object::Activity::UpdatedEndDate)" />
		
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
</table>
</div>
</html:form>
