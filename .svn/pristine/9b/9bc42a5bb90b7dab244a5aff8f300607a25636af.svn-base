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

<bean:define id="ownerId" property="answer(Object::Activity::OwnerId)" name="SearchActivityManagerAction4" />
<bean:define id="intPageNum" property="answer(Object::Activity::PageNum)" name="SearchActivityManagerAction4" />
<bean:define id="objId" property="answer(Object::Activity::ObjectId)" name="SearchActivityManagerAction4" />

<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.PageNumId.value=nextOrPre;	 	 
     document.forms[0].submit();
	}
</SCRIPT>
<!-- formElement.action="../SearchActivityManagerAction4.do?answer(Object::Activity::PageNum)="+nextOrPre; -->
<%intPageNum = ""+request.getAttribute("pageNum");%>

<html:form action="/SearchActivityManagerAction4.do">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		
					
		<tr><td>
			&nbsp;&nbsp;&nbsp;
		</td></tr>
<tr><td>
		<table WIDTH="100%" ALIGN="center" colspan="4" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td>
		</td>
			</tr>
			
    	</table>
    		</td></tr>
    	<tr><td>	
<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">	
	<tr>
		<td height="5">
		
		</td></tr><tr><td>
		<table WIDTH="100%" ALIGN="center" colspan="4" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td>
		</td>
			</tr>
			
    	</table>
	</td></tr>
	
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">USER ACCOUNT ACTIVITY LIST</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>
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
	</td></tr>
	<%long numOfPages=0; %>
	<logic:present name="documentSize" scope="request">
		<bean:define id="documentSize" name="documentSize" />
			<tr>
				<td>
					<html:hidden property="answer(Object::Activity::TotalRec)" value='<%=""+documentSize %>' />
				</td>
			</tr>
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
			Page  <%=(Integer.parseInt(""+intPageNum)+1) %> of <%=numOfPages+1%>
		</td>
	</tr>
	</logic:present>
	
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
				<logic:present name="SearchArrOfAllTasktype">
			
				<tr height="30">
					<td align="Left" class="links" colspan="2">
						<logic:present name="prevDocument" scope="request" >
							<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >&lt;&lt; Previous</a>
						</logic:present>
					</td>
					<td align="right" class="links" colspan="11">
						<logic:present name="moreDocument"  scope="request" >
						<%-- %><a href="/SearchActivityManagerAction4.do?TabPanelName=Activity_Panel&answer(Object::Activity::OwnerId)='<%=""+ownerId %>'&answer(Object::Activity::PageNum)='<%=((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>--%>
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
					
					<td class="sectionhead" width="9%" align="left">
						 Performed By
					
				  </td>
				
				<td class="sectionhead" width="10%" align="left">
						 Description
					
				  </td>
				
					<td class="sectionhead" width="7%" align="left">
						 Performed Server
					
				  </td>		
				  <td class="sectionhead" width="7%" align="left">
						 Performed Client
					
				  </td>	
				  	<td class="sectionhead" width="52%" align="center">
						 Data
					
				  </td>	
				</tr>
				
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
						<%-- %><a href="/SearchActivityManagerAction4.do?TabPanelName=Activity_Panel&answer(Object::Activity::OwnerId)='<%=""+ownerId %>'&answer(Object::Activity::PageNum)='<%=((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>--%>
							<a href='javascript:navigate(<%=""+(Integer.parseInt(""+intPageNum)+1)%>)'>Next &gt;&gt;</a>
						</logic:present>
					</td>
				</tr>
				 <html:reset value="Back" onclick="javascript:history.back();" styleClass="sbttn"/>
	
				</logic:present>
				
			</table>
		</td>
	</tr>
	<bean:define id="ActivityId" name="SearchActivityManagerAction4" property="answer(Object::Activity::ActivityId)" />
	<bean:define id="ObjectStatus" name="SearchActivityManagerAction4" property="answer(Object::Activity::ObjectStatus)" />
	<bean:define id="ActivityType" name="SearchActivityManagerAction4" property="answer(Object::Activity::ActivityType)" />
	<bean:define id="ObjectId" name="SearchActivityManagerAction4" property="answer(Object::Activity::ObjectId)" />
	<bean:define id="ObjectVerId" name="SearchActivityManagerAction4" property="answer(Object::Activity::ObjectVerId)" />
	<bean:define id="CreatedBy" name="SearchActivityManagerAction4" property="answer(Object::Activity::CreatedBy)" />
	<bean:define id="UpdatedBy" name="SearchActivityManagerAction4" property="answer(Object::Activity::CreatedBy)" />
	<bean:define id="CreatedBeginDate" name="SearchActivityManagerAction4" property="answer(Object::Activity::CreatedBeginDate)" />
	<bean:define id="CreatedEndDate" name="SearchActivityManagerAction4" property="answer(Object::Activity::CreatedEndDate)" />
	<bean:define id="UpdatedBeginDate" name="SearchActivityManagerAction4" property="answer(Object::Activity::UpdatedBeginDate)" />
	<bean:define id="UpdatedEndDate" name="SearchActivityManagerAction4" property="answer(Object::Activity::UpdatedEndDate)" />
		
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
	</td></tr>
	
</table>
</html:form>
