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

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="intPageNum" property="answer(Object::Policy::PageNum)" name="SearchPolicy" />

<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.PageNumId.value=nextOrPre;	 	 
     document.forms[0].submit();
	}
</SCRIPT>
<!-- formElement.action="../SearchPolicyAction.do?answer(Object::Policy::PageNum)="+nextOrPre; -->
<%intPageNum = ""+request.getAttribute("pageNum");%>

<html:form action="/SearchPolicyAction.do">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">	
	<tr>
		<td height="5">
		</td>
	</tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">POLICY SEARCH RESULT</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<logic:notPresent name="findArrOfPolicy">
		<tr>
			<td colspan="3">&nbsp;</td>
		</tr> 
		<tr> 
			<td class="Error" colspan="3">
				No Policy Found
	 		</td>
	 	</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>	
	</logic:notPresent>
	<%long numOfPages=0; %>
	<logic:present name='policySize' scope="request">
		<bean:define id="policySize1" name="policySize" />
			<tr>
				<td>
					<html:hidden property="answer(Object::Policy::TotalRec)" value='<%=""+policySize1 %>' />
				</td>
			</tr>
			<tr><td class="FormLabels">No of Policies Found:&nbsp;<%=""+policySize1%></td></tr>
			<tr><td>&nbsp;</td></tr>	
			<%
					
				long searchPolicyCount = Long.parseLong(""+policySize1);
				numOfPages = searchPolicyCount/30;
			%>
			
	</logic:present>
	<logic:present name="findArrOfPolicy">
	<tr>
		<td align="center" class="sectionhead" width="100%">
			Page  <%=(Integer.parseInt(""+intPageNum)+1) %> of <%=numOfPages+1%>
		</td>
	</tr>
	</logic:present>
	
	<tr>
		<td>
			<table WIDTH="95%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
				<logic:present name="findArrOfPolicy">
			
				<tr height="30">
					<td align="Left" class="links" colspan="3">
						<logic:present name="prevPolicy" scope="request" >
							<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >&lt;&lt; Previous</a>
						</logic:present>
					</td>
					<td align="right" class="links" colspan="4">
						<logic:present name="morePolicy"  scope="request" >
						<%-- %><a href="/SearchPolicyAction.do?TabPanelName=Policy_Panel&answer(Object::Policy::OwnerId)='<%=""+ownerId %>'&answer(Object::Policy::PageNum)='<%=((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>--%>
							<a href='javascript:navigate(<%=""+(Integer.parseInt(""+intPageNum)+1)%>)'>Next &gt;&gt;</a>
						</logic:present>
					</td>
				</tr>
				
				<tr>			
					<td class="sectionhead" width="6%" align="left">
						S.No
					</td>
					<td class="sectionhead" width="20%" align="left">
						Insured Name
					</td>
					<td class="sectionhead" width="15%" align="left">
						Policy Number
					</td>
					<td class="sectionhead" width="15%" align="left">
						Policy status
					</td>
					<td class="sectionhead" width="15%" align="left">
						Effective Date
					</td>
					<td class="sectionhead" width="15%" align="left">
						Issued Date
					</td>
					<td class="sectionhead" width="20%" align="left">
						Created By
					</td>
				</tr>
				
				<% int index=0; %>	
				<%
					String pageNum = (String)intPageNum.toString();	%>						
				<%	try{
						index = Integer.parseInt(pageNum);
						index = index*30;
					}catch(NumberFormatException nfe){
						index=0;
					}				
				%>			
								

				<%
					java.util.ArrayList arrListpolicy = (java.util.ArrayList)request.getAttribute("findArrOfPolicy");
					for(int polIndex=0;polIndex<arrListpolicy.size();polIndex++){
						com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrListpolicy.get(polIndex);						
				%>
				<%
					String cId = qmap.getString("Object::Policy::CustomerId");
					String policyNumber = qmap.getString("Object::Policy::PolicyNumber");
				%>
				
				<tr>
					<td class="SearchResult" align="left">
					<% index++; %>								
					<%=index%>
					</td>
					<td class="SearchResult" align="left">
						<a href="../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<%=cId%>" >
						<%=""+qmap.getString("Object::Policy::InsuredName") %>
						<%--<%=""+qmap.getString("Object::Policy::InsuredLName") %> <%=""+qmap.getString("Object::Policy::InsuredFName") %>--%>
						</a>
					</td>
					<td class="SearchResult" align="left">
						<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(TabPanelName)=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>">
						<%=""+qmap.getString("Object::Policy::PolicyNumber") %>
						</a>
					</td>
					<td class="SearchResult" align="left">
						<%=""+qmap.getString("Object::Policy::PolicyStatus") %>
					</td>
					<td class="SearchResult" align="left">
						<%--<%=""+qmap.getString("Object::Policy::PolEfftDate") %>--%>
						<% String effDate = ""+qmap.getString("Object::Policy::PolEfftDate");
						String dispEffDate ="";
							if(!effDate.equals("")){
            			   String arrEffDate[] = effDate.split(" ");                       
                    	   String effDate1 = arrEffDate[0];	
                    	   
                    	   String corEffDate[] = effDate1.split("-");
                    	   String yyyy = corEffDate[0];
                    	   String mm = corEffDate[1];
                    	   String dd = corEffDate[2];
                    	   dispEffDate = mm+"-"+dd+"-"+yyyy;
							}
						%>
						<%=dispEffDate %>
					</td>
					<td class="SearchResult" align="left">
					 	<%--<%=""+qmap.getString("Object::Policy::PolIssuDate") %>--%>
						<% String issuDate = ""+qmap.getString("Object::Policy::PolIssuDate");
						String dispIssuDate="";
							if(!issuDate.equals("")&&!issuDate.equals("0000-00-00 00:00:00")){
            			   String arrIssuDate[] = issuDate.split(" ");                       
                    	   String issuDate1 = arrIssuDate[0];	
                    	   
                    	   String corIssuDate[] = issuDate1.split("-");
                    	   String yyyy1 = corIssuDate[0];
                    	   String mm1 = corIssuDate[1];
                    	   String dd1 = corIssuDate[2];
                    	   dispIssuDate = mm1+"-"+dd1+"-"+yyyy1;
							}
						%>
						<%=dispIssuDate %>
						
					</td>
					<td class="SearchResult" align="left">
						<%=""+qmap.getString("Object::Policy::CreatedBy") %>
					</td>
				</tr>
				
				<%} %>
				
				<tr height="30">
					<td align="Left" class="links" colspan="3">
						<logic:present name="prevPolicy" scope="request" >
							<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >&lt;&lt; Previous</a>
						</logic:present>
					</td>
					<td align="right" class="links" colspan="4">
						<logic:present name="morePolicy"  scope="request" >
						<%-- %><a href="/SearchPolicyAction.do?TabPanelName=Policy_Panel&answer(Object::Policy::OwnerId)='<%=""+ownerId %>'&answer(Object::Policy::PageNum)='<%=((Integer.parseInt(""+intPageNum))+1) %>'">Next&gt;&gt;</a>--%>
							<a href='javascript:navigate(<%=""+(Integer.parseInt(""+intPageNum)+1)%>)'>Next &gt;&gt;</a>
						</logic:present>
					</td>
				</tr>
				
				</logic:present>
				
			</table>
		</td>
	</tr>
	<bean:define id="PolicyNumber" name="SearchPolicy" property="answer(Object::Policy::PolicyNumber)" />
	<bean:define id="InsuredName" name="SearchPolicy" property="answer(Object::Policy::InsuredName)" />
	<bean:define id="InsuredNumber" name="SearchPolicy" property="answer(Object::Policy::InsuredNumber)" />
	<bean:define id="PolicyStatus" name="SearchPolicy" property="answer(Object::Policy::PolicyStatus)" />
	<bean:define id="PolicyType" name="SearchPolicy" property="answer(Object::Policy::PolicyType)" />
	
	
	
<html:hidden property="answer(Object::Policy::OwnerId)" value='<%=""+ownerId%>'/>
<html:hidden  property="answer(Object::Policy::PageNum)" styleId="PageNumId" value='<%=""+intPageNum%>' />	
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=""+ownerId%>'/>

<html:hidden  property="answer(Object::Policy::PolicyNumber)" value='<%=""+PolicyNumber%>' />	
<html:hidden  property="answer(Object::Policy::InsuredName)" value='<%=""+InsuredName %>' />	
<html:hidden  property="answer(Object::Policy::InsuredNumber)" value='<%=""+InsuredNumber %>' />	
<html:hidden  property="answer(Object::Policy::PolicyStatus)" value='<%=""+PolicyStatus %>' />	
<html:hidden property="answer(Object::Policy::PolicyType)" value='<%=""+PolicyType %>' />

<html:hidden property="answer(Object::Policy::PolCreatedStartDate)" />
<html:hidden property="answer(Object::Policy::PolCreatedEndDate)" />
<html:hidden property="answer(Object::Policy::PolEffStartDate)" />
<html:hidden property="answer(Object::Policy::PolEffEndDate)" />
<html:hidden property="answer(Object::Policy::InsuredName)" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
<% 
    long AgencyId = 0;
 	try{
 		AgencyId=Long.parseLong(""+AgencyID);
 	}catch(Exception ex){}
 	if(AgencyId > 0){
   %>
      <html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectType)" value="AGENCY"/>
   <html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectId)" value="<%=""+AgencyId%>"/>
   <%}else{ 
   %>
<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>" />	
	<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
	<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
	<%if(objDescType.toString().equals("ENTITY")){%>			
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT"}%>' connector='or' negated="true">
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
				 	<logic:present name="agencyIdent" scope="session">
				 		<bean:define id="agencyID" name="agencyIdent" type="java.lang.Long" scope="session"/>
						<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectType)" value="AGENCY"/>
						<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectId)" value="<%=""+agencyID%>"/>
					</logic:present>
				</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENCY_EMPLOYEE"}%>' connector='or' negated="true">
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
					<logic:present name="agencyIdent" scope="session">
						<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
						<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectId)" value="<%=""+agencyIdid%>"/>
						<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectType)" value="AGENCY"/>
					</logic:present>
			</dmshtml:dms_static_with_connector>
	<%}else if(objDescType.toString().equals("AGENCY")){%>
			<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectType)" value="AGENCY"/>
			<html:hidden property="answer(Object::Policy::PolicySearch::SearchObjectId)" value="<%=""+objDescId%>"/>	
	<%} %>
	<%} %>
	
</table>
</html:form>
