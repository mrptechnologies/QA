<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>


<html:form action="/ModifySubmission"  styleId="ModifySubmission" >
	<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
	<bean:parameter id="SubmissionId" name="answer(Object::Submission::SubmissionId)" /> 									
	<bean:parameter id="SubmissionVerId" name="answer(Object::Submission::SubmissionVerId)" /> 
	<bean:parameter id="submissionInsuredId" name="answer(Object::Submission::InsuredId)" />
	
	<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
		<%	
		String agencyIdTemp="";
			if(request.getParameter("answer(Object::Agency::AgencyId)")!=null)
			{
				agencyIdTemp=request.getParameter("answer(Object::Agency::AgencyId)");
		%>
		<tr><td><html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
		</td></tr>
		<%
			}
		%><%
			String customerId="";
			if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
			{
				customerId=request.getParameter("answer(Object::Customer::CustomerId)");
			}		
			String strSubmissionStatus="";
			if(request.getParameter("answer(Object::Submission::SubmissionStatus)")!=null)
			{
				strSubmissionStatus=request.getParameter("answer(Object::Submission::SubmissionStatus)");
			}
		%>
		
<%String agencyIdtoLink="";%>
<%String strAgentFName="";%>
<%String strAgentLName="";%>
<%long lngAgentId1=0;%>
<%long lngAgentId=0;%>
<%long lngAgencyTemp=0;%>
<%long agencyId2=0;%>
<%String agencyName2="";%>
<%long lngagentId=0;
String agencyName="";
String generalAgencyId = "";
long agencyId=0;
long lobId=0;
String clearanceStatus ="";
String insuredStatus ="";
%>
		<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" submissionId='<%=""+SubmissionId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
<logic:present name="customerDetail1" scope="request">
	<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		<%try{%>
			<%agencyId=Long.parseLong(customerDetailMap.getString("agencyid"));%>
			<%}catch(Exception nfe) {agencyId=0;    }%>
			<%try{
				generalAgencyId = customerDetailMap.getString("generalagencyid");
			lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
			}catch(Exception nfe) {lngAgentId=0;    }																						
			agencyIdTemp=""+agencyId;
			lngAgencyTemp=Long.parseLong(agencyIdTemp);
			agencyId2=Long.parseLong(agencyIdTemp);
			agencyName2=customerDetailMap.getString("agencyname");
			clearanceStatus = customerDetailMap.getString("ClearanceStatus");
			insuredStatus = customerDetailMap.getString("custStatus");
			//lobId =Long.parseLong(""+customerDetailMap.getString("LobId"));
			%>
</logic:present>
		<tr>
			<td>
				&nbsp;
			</td>
		</tr>	
		<tr>
			<td class="sectionhead" colspan="5" align="center">REACTIVATE SUBMISSION </td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
		</tr>	
		<tr>
	     <td>		
			<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
			<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
			<tr><td><html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
		 </td>
	    </tr>
		<tr>
		 <td class="links">
			<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=""+customerId%>&customerId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+customerId %>" title="<bean:message key='ToolTip.ReactivateSubmission.SubmissionSummary'/>">Submission Summary</a>
		 </td>											
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
		</tr>	
		<tr>
		<td>
		<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">	
		<tr>
         <td class="TextMatter1" align="right">					
			Reason for Reactivation &nbsp;&nbsp;
		</td>
		<td class="TextMatter1" align="left">
			<input type = text name="answer(Object::Submission::Reason)" id="notesDesc" size="50" maxlength="54" />
		 </td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
		</tr>													
		<tr>
		  <td class="TextMatter1" align="right">
			Notes&nbsp;&nbsp;
		  </td>
		  <td class="TextMatter1" align="left">
           <dmshtml:dms_textarea styleClass="txtarea" name="AddCustomer" value=""  property="answer(Object::Submission::Notes)" rows="6" cols="80"/>
          </td>
        </tr>
		<tr>
			<td>
				<html:hidden property="answer(Object::Submission::SubmissionStatus)" value="In Progress" />
			</td>
		</tr>
		</table>
	  </td>
	</tr>
		<tr>
			<td>
				&nbsp;
			</td>
		</tr>										
		<tr>
			<td align="center" class="links" >
				<dmshtml:dms_isPresent property="<%=new String[]{"Declined","Lapsed"}%>" value="<%=""+strSubmissionStatus%>" negated="true" >
					<INPUT TYPE="submit" value="Save" class="covbutton"  title="<bean:message key='ToolTip.ReactivateSubmission.Save'/>">
				</dmshtml:dms_isPresent>
			</td>
		</tr>
	</table>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("answer(TabPanelName)")%>" />
	<html:hidden property="answer(TabPanelName)" value="<%=""+request.getParameter("answer(TabPanelName)")%>" />
	<html:hidden property="answer(requestForm)" value="Submission" />
	<html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />
	<html:hidden property="answer(Object::Submission::CreatedBy)" value='<%=""+usernameId%>'/>	
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>	
	<html:hidden property="answer(Object::Submission::InsuredId)" value='<%=""+submissionInsuredId%>'  />
	<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+submissionInsuredId%>'  />
	<html:hidden property="answer(customerId)" value='<%=""+submissionInsuredId%>'  />
	<html:hidden property="answer(Agency::AgencyId)" value='<%=""+agencyId2%>'  />
	<html:hidden property="&answer(AgentId)" value='<%=""+lngAgentId%>'  />
	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ActivityMsg)" value="<%="Submission Reactivated"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Submission Management"%>"/>
	
	<html:hidden property="answer(Object::Submission::SubmissionId)" value='<%=SubmissionId+""%>' styleId="submissionId" />		
	<html:hidden property="answer(Object::Submission::SubmissionVerId)" value='<%=SubmissionVerId+""%>' styleId="submissionVerId" />		
</html:form>