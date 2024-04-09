<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page  import="java.util.HashMap" %>
<%@page  import="com.dms.ejb.data.QuestionHashMap" %>

<link rel="stylesheet" type="text/css" href="../ui3.0/i/style.css" />

<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />

<SCRIPT SRC="../Scripts/JScripts/AddInsured.js" type="text/javascript"> </SCRIPT>

<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/Common.js">
</script>

<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>

<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>
<bean:define name="AddCustomer" id="mailingAddressSameAsBusinessAddress" property="answer(Object::Submission::MailingAddressSameAsBusinessAddress)" />

<bean:define name="AddCustomer" id="customerName" property="answer(Object::Customer::CustomerName)" />
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>




<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr height="10">
		<td>
		</td>
	</tr>
	<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
	<tr>
		<td width="100%" bgcolor="#C6DEEA">
			<table width="95%">
				<tr>
					<td colspan="2">
						 <table width="95%" align="center" border="1">
							<tr>
								<td>
									<jsp:include page="../common/SubmissionInsuredAgencyLinksPage.jsp" />
								</td>
							</tr>
						</table>  
					</td>
				</tr>				
				
			</table>
		</td>
	</tr>
	</logic:notEqual>
	
	<tr><td><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+cId%>&answer(Object::Customer::CustomerId)=<%=""+cId%>" title="<bean:message key='ToolTip.SubmissionSummary.InsuredRecord'/>" class="button2" style="width:200px" />Go to Insured Master Record</a> </td></tr>
	<tr>
		<td width="100%">	
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">	
				<tr>
					<td  class="FormLabels" align="center" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td class="NewSectionHead" colspan="5" align="center">SUBMISSION SUMMARY </td>
				</tr>
				<tr>
					<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
				</tr>
			</table>
		</td>
	</tr>
	
	
</table>
<logic:present name="errorMap">
 <% String errorMsg = "";
    com.dms.ejb.data.QuestionHashMap errorMap = (QuestionHashMap)request.getAttribute("errorMap");
    errorMsg = errorMap.getString("errorMsg");
  %>
<table>
<tr>
 <td class="Error" >All the quotes associated with the Submission should be Declined/Lapsed</td>
</tr>
</table>
    
</logic:present>
 
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
<bean:define id="SubmissionId5" property="answer(Object::Submission::SubmissionId)" name="AddCustomer"/>

<%		
	String isAppEnabled="Y";
	long submissionIdNBF =0;
	long submissionVerIdNBF =0;
	long SubmissionId = 0;
	long SubmissionVerId = 0;
	String EmpGrpState = "";
	
	if(request.getAttribute("Object::Submission::SubmissionId")!= null ) {
		submissionIdNBF = Long.parseLong(""+request.getAttribute("Object::Submission::SubmissionId"));
		SubmissionId = Long.parseLong(""+request.getAttribute("Object::Submission::SubmissionId"));
		}else { %>
				<bean:define id="SubmissionId1" property="answer(Object::Submission::SubmissionId)" name="AddCustomer"/>
				<%	
					submissionIdNBF = Long.parseLong(""+SubmissionId1);
					SubmissionId = Long.parseLong(""+SubmissionId1);
			} 
		%>

	<%if(request.getAttribute("Object::Submission::SubmissionVerId")!= null ) {
				submissionVerIdNBF = Long.parseLong(""+request.getAttribute("Object::Submission::SubmissionVerId"));
				SubmissionVerId = Long.parseLong(""+request.getAttribute("Object::Submission::SubmissionVerId"));
				}
    else if(request.getParameter("answer(Object::Submission::SubmissionVerId)") != null){
		
		submissionVerIdNBF = Long.parseLong(""+request.getParameter("answer(Object::Submission::SubmissionVerId)"));
		SubmissionVerId = Long.parseLong(""+request.getParameter("answer(Object::Submission::SubmissionVerId)"));
		
	}
	else if(request.getParameter("answer(Object::Submission::ClearanceCheck::SubmissionVerId)") != null){
		
		submissionVerIdNBF = Long.parseLong(""+request.getParameter("answer(Object::Submission::ClearanceCheck::SubmissionVerId)"));
		SubmissionVerId = Long.parseLong(""+request.getParameter("answer(Object::Submission::ClearanceCheck::SubmissionVerId)"));
		
	}
	else { %>
					<bean:define id="SubmissionVerId1" property="answer(Object::Submission::SubmissionVerId)" name="AddCustomer"/>
					<%	
						submissionVerIdNBF = Long.parseLong(""+SubmissionVerId1);
						SubmissionVerId = Long.parseLong(""+SubmissionVerId1);
					} 
			%>

<logic:present name ='arrObjectDetail1' scope ='session'>
							<logic:iterate id="arrObjectDetail1" name="arrObjectDetail1" scope="session" >
							<bean:define id="custid" name="arrObjectDetail1" property="id"/> 
							<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/> 
							
							</logic:iterate>
							</logic:present>
							<logic:notPresent name ='arrObjectDetail1' scope ='session' >
								<%
									submissionIdNBF = Long.parseLong(""+SubmissionId);
									submissionVerIdNBF = Long.parseLong(""+SubmissionVerId);								
								%>
							
							</logic:notPresent>
<%int dataBaseIdViewPrivillage=0;%>
<%String customerCreatedDate=""; %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>
<%String agencyIdTemp="";%> 
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
String submissionType = "";
String submissionRenewalPolNo = "";
%>
<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" submissionId='<%=""+submissionIdNBF%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
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
			submissionType = customerDetailMap.getString("SubmissionType");
			submissionRenewalPolNo = customerDetailMap.getString("SubmissionRenewingPolNo");
			if(insuredStatus.equalsIgnoreCase("Lapsed") || insuredStatus.equalsIgnoreCase("Declined") || insuredStatus.equalsIgnoreCase("Registered")) {
				isAppEnabled="N";
			}
			if(customerDetailMap.getString("CurrentSubmissionVerId").length()>0){
				submissionVerIdNBF = Long.parseLong(customerDetailMap.getString("CurrentSubmissionVerId"));
			}
			//lobId =Long.parseLong(""+customerDetailMap.getString("LobId"));
			%>
</logic:present>
<bean:define id="agencyIdTemp1" name="AddCustomer" property="answer(Agency::AgencyId)"/>
	 <bean:define id="AgentId1" name="AddCustomer" property="answer(AgentId)"/>	
	<%	if(!agencyIdTemp1.toString().equals("")) {		
			String agencyAgentId ="";	
			if((agencyIdTemp1.toString().indexOf("::"))>0){														
				String ids[]=(""+agencyIdTemp1).split("::");
		     			agencyIdTemp1=ids[0];
		     			agencyAgentId=ids[1];
				}
			agencyIdTemp=agencyIdTemp1.toString();	
			lngAgencyTemp=Long.parseLong(agencyIdTemp);
			 if(lngAgencyTemp>0){%>
			<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
			
			<logic:present name="agencyDetail2" scope="request">
				<bean:define id="agdetail2" name="agencyDetail2" scope="request"
										type="com.dms.ejb.data.QuestionHashMap" />
				<%agencyId2=Long.parseLong(agdetail2.getString("agencyid"));			
				agencyName2=agdetail2.getString("agencyname");	%>	
			</logic:present>
		<%}
			 long lgAgentId1=0;
				try {				
				if(!agencyAgentId.equals("")){
					AgentId1=agencyAgentId;
				}
				lgAgentId1=Long.parseLong(AgentId1.toString());															
			} catch(Exception ex){} %>	 
			
			<%if(lgAgentId1>0){%>
			<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId='<%=""+lgAgentId1%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
			<logic:present name="agentDetail" scope="request">
				<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
				<%lngAgentId1=lgAgentId1;%>		
			</logic:present>
		<%}
			
	}%>
<bean:define id="CustomerState" name="AddCustomer" property="answer(Object::Customer::State)" /> 

<div id='loadercontent1' style="display:none">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	Calculating....
	</div>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="5" >
	<tr>
		<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Referred"}%>" value="<%=""+insuredStatus %>" negated="true" >
			<td colspan="20" class="links" width="400px" title="<bean:message key='ToolTip.SubmissionSummary.SubmitApplication'/>">	
				<a href="/RegisterSubmission.do?answer(state)=<%=CustomerState+"" %>&answer(TabPanelName)=Submission_Panel&answer(Object::Clearance::Status)=<%=""+clearanceStatus %>&answer(Object::Submission::LOBId)=<%=""+lobId%>&answer(Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerIdNBF %>&answer(Object::Submission::Type)=<%=""+submissionType%>&answer(Object::Submission::RenewalPolicy)=<%=""+submissionRenewalPolNo%>&answer(Object::Submission::InsuredId)=<%=""+cId%>&answer(Object::Customer::CustomerId)=<%=""+cId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%> " id="Submit_Comp_Application" class="button2" style="width:210px"/>
					Submit Completed Application
				</a> 
			</td>
		</dmshtml:dms_isPresent>
		<td colspan="20" class="links" width="250px">
			<a href="/CopySubmissionPage.do?answer(TabPanelName)=Submission_Panel&answer(Object::Customer::Status)=<%=""+insuredStatus %>&answer(Object::Customer::PageNum)=0&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Submission::InsuredId)=<%=""+cId%>&answer(Object::Customer::CustomerId)=<%=""+cId%>&answer(customerId)=<%=""+cId%>&answer(Agency::AgencyId)=<%=""+agencyId2%>&answer(1*Customer::Equals::SearchObjectType)=<%="AGENCY"%>&answer(1*Customer::Equals::SearchObjectId)=<%=""+agencyId2%>&answer(AgentId)=<%=""+lngAgentId1%>" class="button2" style="width:130px" title="<bean:message key='ToolTip.SubmissionSummary.CopySubmission'/>">Copy Submission</a>
		</td>
		
		<dmshtml:Get_QuoteDetails_ByCustomerId_SubmissionId nameInSession="policyList" submissionId='<%=Long.parseLong(""+SubmissionId) %>' submissionVerId='<%=Long.parseLong(""+SubmissionVerId )%>'  objectId="<%=Customerid.toString()%>" objectType="CUSTOMER" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		
			<dmshtml:dms_isPresent property="<%=new String[]{"Lapsed","Declined"}%>" value="<%=""+insuredStatus %>" negated="false" >
				<td colspan="20" class="links" width="300px">		
					<a href="/ValidateQuoteLapsedStatus.do?answer(TabPanelName)=Submission_Panel&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Clearance::Status)=<%=""+clearanceStatus %>&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Submission::InsuredId)=<%=""+cId%>&answer(Object::Submission::Type)=<%=""+submissionType%>&answer(Object::Submission::RenewalPolicy)=<%=""+submissionRenewalPolNo%>&answer(Object::Customer::CustomerId)=<%=""+cId%>&customerId=<%=""+cId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(objectType)=<%="CUSTOMER"%>&answer(status)=<%="Lapsed"%>" id="Lapse_link" title="<bean:message key='ToolTip.SubmissionSummary.Lapse'/>" class="button2" style="width:170px">Lapse this Submission</a>
				</td>
			</dmshtml:dms_isPresent>
			<dmshtml:dms_isPresent property="<%=new String[]{"Declined","Lapsed"}%>" value="<%=""+insuredStatus %>" negated="false" >
				<td colspan="20" class="links" width="300px">		
					<a href="/ValidateQuoteDeclinedStatus.do?answer(TabPanelName)=Submission_Panel&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Clearance::Status)=<%=""+clearanceStatus %>&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Submission::InsuredId)=<%=""+cId%>&answer(Object::Submission::Type)=<%=""+submissionType%>&answer(Object::Submission::RenewalPolicy)=<%=""+submissionRenewalPolNo%>&answer(Object::Customer::CustomerId)=<%=""+cId%>&customerId=<%=""+cId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(objectType)=<%="CUSTOMER"%>&answer(status)=<%="Declined"%>" id="Decline_link" title="<bean:message key='ToolTip.SubmissionSummary.Decline'/>" class="button2" style="width:170px">Decline this Submission</a>			
				</td>	
			</dmshtml:dms_isPresent>
		
			<dmshtml:dms_isPresent property="<%=new String[]{"Declined","Lapsed"}%>" value="<%=""+insuredStatus %>" negated="true" >
				<td colspan="20" class="links" width="400px" title="<bean:message key='ToolTip.SubmissionSummary.Reactivate'/>">		
					<a href="/submissioninsured/ReactivateSubmission.jsp?answer(TabPanelName)=Submission_Panel&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Clearance::Status)=<%=""+clearanceStatus %>&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Submission::InsuredId)=<%=""+cId%>&answer(Object::Customer::CustomerId)=<%=""+cId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>" id="Reactivate_link" class="button2" style="width:100px">Reactivate</a>			
				</td>	
			</dmshtml:dms_isPresent>
		
		<td colspan="20" class="links" width="400px" title="<bean:message key='ToolTip.SubmissionSummary.ApplicationPdf'/>">
			<a href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=SUBMISSION&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Clearance::Status)=<%=""+clearanceStatus %>&answer(Object::Customer::CustomerId)=<%=""+Customerid%>&answer(Object::Submission::SubmissionId)=<%=""+submissionIdNBF%>&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId%>' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application Pdf</a>
		</td>
	
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' connector='or' negated="true">
			<td class="links"align="left" width="100px" title="<bean:message key='ToolTip.SubmissionSummary.ActivityLog'/>">
			
			<a href="../SearchActivityManagerAction6.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Activity::ObjectId)=<%=""+SubmissionId5%>&answer(Object::Activity::ObjectType)=<%="Submission"%>&answer(Object::Activity::PageNum)=0&answer(Object::Customer::CustomerId)=<%=Customerid.toString()%>">Activity Log </a>
			</td>			
	    </dmshtml:dms_static_with_connector>  
		
		
	</tr>
</table>

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
		<td colspan="20" class="links" width="400px">		
			&nbsp;
		</td>	
	</tr>
</table>
<%
	String headerName ="dolphinnav";
	String bodyDiv = "dolphincontainer1";
%>
<div class="formpagenew1">
<%/* Insured Div Open */%>
<div align="center" id="Insured" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35    >
				<tr>
					<td align="center" onClick="document.getElementById('Locations').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Locations</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Schedule of Tanks</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('GeneralQuestions').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">General Questions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
       
       </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
    <tr> 
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
			<tr>
				<td width="100%" align="center"> 
					
					<html:form action="/SavedSubmissionInsured"  styleId="insuredTab" onsubmit="return validateFields()">
					 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox">
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_INSURED_AGENCY"}%>' connector='or' negated="true" >	
							<tr>
								<td align="left" colspan="3">
								  <h3>Agency Information</h3>
			      				</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr><td colspan="3">
							    <table width="100%" border="0">
								     <tr>
								     	<td class="field" align="right" width="38%">Agency *</td>	
								     	<td >&nbsp;&nbsp;&nbsp;</td>
										<td class="links" width="30%"><html:text  name="AddCustomer" property ="answer(AgencyName)" value='<%=agencyName2%>' size="60" maxlength="60" styleClass="txtbox" readonly="true" styleId="Agenname" /></td>
										<td width="30%">	
											<IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOSubmissionAgencyFind()">												
										</td>											
								     </tr>
								 	 <tr><td colspan="4">&nbsp;</td></tr>									 	
								</table>
			    			</td></tr>
					   </dmshtml:dms_static_with_connector>
												
						<tr>
							<td colspan="3" align="left"><h3>Submission Insured Information</h3></td>							
				        </tr>
			    		<tr><td colspan="3">&nbsp;</td></tr>
        				<tr>
				          <td class="field" align="right" width="34%">Insured Name Type:</td>
				          <td width="2%">&nbsp;</td>
						  <td class="links" style="Class:txtbox" align="left" width="64%">
						      <html:select name="AddCustomer" property="answer(Object::Customer::NameType)" styleClass="txtbox" styleId="NameType" onchange="showCompanyInformation(this.form)">
									 <html:option value ="Person" styleClass="txtbox">Person</html:option>
								     <html:option value ="Company" styleClass="txtbox" >Company</html:option>
							  </html:select>
						  </td>
						</tr> 
					  <%if(dataBaseIdViewPrivillage==1) {%>
						<tr>
							<td class="field" align="right" width="34%">Insured Id</td>
							<td width="2%">&nbsp;</td>
							<td class="TextMatter" align="left" width="64%"><bean:write name='AddCustomer' property='answer(Object::Customer::CustomerId)'/></td>
						</tr> 
				     <%}%>
				     <!--  to pass to the script -->
					<html:hidden name="AddCustomer" property ="answer(Object::Customer::CustomerId)" styleId="CustomerID" />
					<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="CUSTOMER_NAME_LENGTH" />
					<%
					  String nameFieldLength =(String) request.getAttribute("paramValue");
					if (nameFieldLength.length() <= 0 && nameFieldLength == null){
						 nameFieldLength = "60";								   
					  }
					
					%>
					 <tr>
						<td width="34%" align="right" class="field" id="insuredNameBlock"><span id="InsName1"><font color="red">* Legal Name 1:</font></span></td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName)"  size="50" maxlength="125" styleClass="txtbox" styleId="InsuredName" /></td>
				    </tr>
				    <tr>
						<td width="34%" align="right" class="field" id="insuredNameBlock"><span id="InsName2">Legal Name 2:</span></td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName2)"  size="50" maxlength="50" styleClass="txtbox" styleId="InsuredName2" /></td>
				    </tr>
				 	<tr>
						<td width="34%" class="field" align="right">Name Code:</td>
						<td width="2%">&nbsp;</td>
						<td align="left" width="64%">
						 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UNDERWRITER_PRIVILEGE"}%>' connector='or' negated="true">
							<bean:write name="AddCustomer" property ="answer(Object::Customer::CustomerNumber)"/>
						 </dmshtml:dms_static_with_connector>
						 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UNDERWRITER_PRIVILEGE"}%>' connector='or' negated="false">
						    <bean:write name="AddCustomer" property ="answer(Object::Customer::CustomerNumber)"/>
						 </dmshtml:dms_static_with_connector>	
						</td>
						 
					</tr> 
				    <tr id="DBABlock">
						<td width="34%" align="right" class="field">Insured DBA:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::DBA)"  size="65" maxlength="125" styleClass="txtbox" styleId="DBA" /></td>
			       </tr>
			       <tr>
				         <td colspan="3">&nbsp;</td>
				   </tr>
				   <tr>
				         <td  colspan="3" align="left"><h3>Primary Business Address</h3></td>
				   </tr>
				   <tr>
						<td width="34%" align="right" class="field"><font color="red">* Address Line 1:</font></td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::StreetName)" size="60" maxlength="50" styleClass="txtbox" styleId="Address1"/></td>
				   </tr>
				   <tr>
						<td width="34%" align="right" class="field">Address Line 2:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::Address2)" size="60" maxlength="50" styleClass="txtbox" styleId="Address2"/></td>
				   </tr>
				   <tr>
						<td width="34%" align="right" class="field"><font color="red">* City:</font></td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:text name="AddCustomer" property="answer(Object::Customer::City)"  maxlength="40" styleClass="txtbox" styleId="City" /></td>
				   </tr>
				   <tr>
						<td width="34%" align="right" class="field"><font color="red">* State/Province:</font></td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left">
						   <html:select name="AddCustomer" property="answer(Object::Customer::State)" styleClass="txtbox" styleId="State">
								<html:option value="" styleClass="txtbox">Select A State</html:option>
								<html:option value="AL">Alabama</html:option>
								<html:option value="AK">Alaska</html:option>
								<html:option value="AS">American Samoa</html:option>
								<html:option value="AZ">Arizona</html:option>
								<html:option value="AR">Arkansas</html:option>
								<html:option value="CA">California</html:option> 
								<html:option value="CO">Colorado</html:option>
								<html:option value="CT">Connecticut</html:option>
								<html:option value="DE">Delaware</html:option>
								<html:option value="DC">District of Columbia</html:option>
								<html:option value="FM">Federated States of Micronesia</html:option>
								<html:option value="FL">Florida</html:option>
								<html:option value="GA">Georgia</html:option>
								<html:option value="GU">Guam</html:option>
								<html:option value="HI">Hawaii</html:option>
								<html:option value="ID">Idaho</html:option>
								<html:option value="IL">Illinois</html:option>
								<html:option value="IN">Indiana</html:option>
								<html:option value="IA">Iowa</html:option>
								<html:option value="KS">Kansas</html:option>
								<html:option value="KY">Kentucky</html:option>
								<html:option value="LA">Louisiana</html:option>
								<html:option value="ME">Maine</html:option>
								<html:option value="MH">Marshall Islands</html:option>
								<html:option value="MD">Maryland</html:option>
								<html:option value="MA">Massachusetts</html:option>
								<html:option value="MI">Michigan</html:option>
								<html:option value="MN">Minnesota</html:option>
								<html:option value="MS">Mississippi</html:option>
								<html:option value="MO">Missouri</html:option>
								<html:option value="MT">Montana</html:option>
								<html:option value="NE">Nebraska</html:option>
								<html:option value="NV">Nevada</html:option>
								<html:option value="NH">New Hampshire</html:option>
								<html:option value="NJ">New Jersey</html:option>
								<html:option value="NM">New Mexico</html:option>
								<html:option value="NY">New York</html:option>
								<html:option value="NC">North Carolina</html:option>
								<html:option value="ND">North Dakota</html:option>
								<html:option value="MP">Northern Mariana Islands</html:option>
								<html:option value="OH">Ohio</html:option>
								<html:option value="OK">Oklahoma</html:option>
								<html:option value="OR">Oregon</html:option>
								<html:option value="PW">Palau</html:option>
								<html:option value="PA">Pennsylvania</html:option>
								<html:option value="PR">Puerto Rico</html:option>
								<html:option value="RI">Rhode Island</html:option>
								<html:option value="SC">South Carolina</html:option>
								<html:option value="SD">South Dakota</html:option>
								<html:option value="TN">Tennessee</html:option>
								<html:option value="TX">Texas</html:option>
								<html:option value="UT">Utah</html:option>
								<html:option value="VT">Vermont</html:option>
								<html:option value="VI">Virgin Islands</html:option>
								<html:option value="VA">Virginia</html:option>
								<html:option value="WA">Washington</html:option>
								<html:option value="WV">West Virginia</html:option>
								<html:option value="WI">Wisconsin</html:option>
								<html:option value="WY">Wyoming</html:option>
			              </html:select>
						</td>
				      </tr>
				      <tr>
							<td width="34%" align="right" class="field"><font color="red">* Zip Code:</font></td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left">
							 <html:text name="AddCustomer" property="answer(Object::Customer::Zip)" maxlength="10" style="width:150px;" styleClass="txtbox" styleId="Zip" />
			            	   <a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/FindZipCode.jpg" BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>		
			            	</td>
					  </tr>
					  <tr>
							<td width="34%" align="right" class="field">Country:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left">
							    <html:select name="AddCustomer" property="answer(Object::Customer::Address::Country)" styleClass="txtbox" styleId="Country">
				                  <html:option value="USA" styleClass="txtbox">United States</html:option>
				                </html:select>
							</td>
					  </tr>	
					  <%boolean displayGeniusFields = false;%>
					  <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LIBERTY_GENIUSADDRESS"}%>' connector='or' negated="false">
					  <%displayGeniusFields=true;%>
					  </dmshtml:dms_static_with_connector>
					  <%if(displayGeniusFields){%>
					  <tr>
					       <td  align="left" colspan="3"><h3>Genius Address </h3> </td>
					  </tr>
					  <tr><td colspan="3">&nbsp;</td></tr>
					  <tr>
							<td class="field" align="right" width="34%">
								Is Genius Address same as Business Address?
							</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left">
						      <input type="radio" name="answer(Object::Submission::MailingAddressSameAsBusinessAddress)" value="Y" id="MailingAddressSameAsBusinessAddress_Y"  onclick="disableMailingAddressBlock()" />Yes
							  <input type="radio" name="answer(Object::Submission::MailingAddressSameAsBusinessAddress)" value="N" id="MailingAddressSameAsBusinessAddress_N" onclick="enableMailingAddressBlock()"  />No&nbsp;&nbsp;
							</td>
					  </tr>
					  <tr><td colspan="3">
					   <div id="MailingAddressBlock" >
                         <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
                           <tr>
                             <td class="field" align="right" width="34%">
								Genius Address 1
							 </td>
							 <td width="2%">&nbsp;</td>
							 <td width="64%" align="left">
				     		   <html:text  property="answer(Object::Submission::MailingAddress1)" styleId="MailingAddress1" size="60" maxlength="50" styleClass="txtbox"  />
							 </td>
						   </tr>
						   <tr>
								<td class="field" align="right" width="34%">
									Genius Address 2
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
							    	<html:text  property="answer(Object::Submission::MailingAddress2)" styleId="MailingAddress2" size="60" maxlength="50" styleClass="txtbox"/>
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="34%">
									Genius Address 3
								</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left">
							      <html:text  property="answer(Object::Submission::MailingAddress3)" styleId="MailingAddress3" size="60" maxlength="50" styleClass="txtbox"  />
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="34%">
									Genius Address 4
								</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left">
						    		<html:text  property="answer(Object::Submission::MailingAddress4)" styleId="MailingAddress4" size="60" maxlength="50" styleClass="txtbox" />
								</td>
							</tr><tr>
								<td class="field" align="right" width="34%">
									Genius Address 5
								</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left">
									<html:text  property="answer(Object::Submission::MailingAddress5)" styleId="MailingAddress5" size="60" maxlength="50" styleClass="txtbox"  />
								</td>
							</tr>
						  </table>
						 </div>
						
						</td>
					  </tr>
					  <%}else{%>
					  <tr style="display:none;">
							<td class="field" align="right" width="34%">
								Is Genius Address same as Business Address?
							</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left">
						      <input type="radio" name="answer(Object::Submission::MailingAddressSameAsBusinessAddress)" value="Y" id="MailingAddressSameAsBusinessAddress_Y"  onclick="disableMailingAddressBlock()" />Yes
							  <input type="radio" name="answer(Object::Submission::MailingAddressSameAsBusinessAddress)" value="N" id="MailingAddressSameAsBusinessAddress_N" onclick="enableMailingAddressBlock()"  />No&nbsp;&nbsp;
							</td>
					  </tr>
					  <tr style="display:none;"><td colspan="3">
					   <div id="MailingAddressBlock" >
                         <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
                           <tr>
                             <td class="field" align="right" width="34%">
								Genius Address 1
							 </td>
							 <td width="2%">&nbsp;</td>
							 <td width="64%" align="left">
				     		   <html:text  property="answer(Object::Submission::MailingAddress1)" styleId="MailingAddress1" size="60" maxlength="50" styleClass="txtbox"  />
							 </td>
						   </tr>
						   <tr>
								<td class="field" align="right" width="34%">
									Genius Address 2
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
							    	<html:text  property="answer(Object::Submission::MailingAddress2)" styleId="MailingAddress2" size="60" maxlength="50" styleClass="txtbox"/>
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="34%">
									Genius Address 3
								</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left">
							      <html:text  property="answer(Object::Submission::MailingAddress3)" styleId="MailingAddress3" size="60" maxlength="50" styleClass="txtbox"  />
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="34%">
									Genius Address 4
								</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left">
						    		<html:text  property="answer(Object::Submission::MailingAddress4)" styleId="MailingAddress4" size="60" maxlength="50" styleClass="txtbox" />
								</td>
							</tr><tr>
								<td class="field" align="right" width="34%">
									Genius Address 5
								</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left">
									<html:text  property="answer(Object::Submission::MailingAddress5)" styleId="MailingAddress5" size="60" maxlength="50" styleClass="txtbox"  />
								</td>
							</tr>
						  </table>
						 </div>
						
						</td>
					  </tr>
					  <%}%>
					  <tr>
			               <td colspan="3">&nbsp;</td>
			          </tr>
			          <tr>
			               <td  colspan="3" align="left"><h3>Contact Information</h3></td>
			          </tr>
					  <tr>
							<td width="34%" align="right" class="field">Email Address:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::EMailAddress)" onblur="checkEmailAddress(this.form)" size="30"  styleClass="txtbox" styleId="emailID" />
							</td>
					</tr>
					
					 <tr>
						<td width="34%" align="right" class="field">Phone Number:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhoneAreaCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber1"  onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].PhoneNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhoneExchangeCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber2" onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].PhoneNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhone)"  size="4" maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" /></td>
					</tr>	
					<tr>
						<td width="34%" align="right" class="field">Fax Number:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::FaxAreaCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber1" onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].FaxNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::FaxExchangeCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber2" onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].FaxNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::Fax)"  size="4" maxlength="4" styleClass="txtbox" styleId="FaxNumber3"/></td>
					</tr>	
					<tr>
						<td width="34%" align="right" class="field">Contact First Name:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactFName)"  size="65" maxlength="<%=nameFieldLength%>"  styleClass="txtbox" styleId="ContactFirstName" />
						</td>
					</tr>
					<tr>
						<td width="34%" align="right" class="field">Contact Last Name:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactLName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="ContactLastName" />
						</td>
					</tr>
					<tr>
						<td width="34%" align="right" class="field">Contact Title:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactTitle)"  size="4" styleClass="txtbox" styleId="ContactTitle" />
						</td>
					</tr>
					<tr id="CompanyInfmnBlock">
			          <td  colspan="3" align="left"><h3>Company Information</h3></td>
			        </tr>
					<tr id="CompanywebsiteBlock">
						<td width="34%" align="right" class="field">Website:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactURL)"  size="30" styleClass="txtbox" styleId="CompanyWebSite" />
						</td>
					</tr>
					<tr id="FOBBlock">
						<td width="34%" align="right" class="field">Form of Business:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:select name="AddCustomer" property="answer(Object::Customer::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.form)">
								<html:option value="">Select</html:option>	 
							    <html:option value="Corporation">Corporation</html:option>		    
							    <html:option value="Sole Proprietor">Sole Proprietor</html:option>		    
							    <html:option value="Partnership">Partnership</html:option>		    
							    <html:option value="Joint Venture">Joint Venture</html:option>
							    <html:option value="Other">Other</html:option>
						</html:select>
						</td>
					</tr> 
					<tr id="otherFOBBlock">
						<td width="34%" align="right" class="field">If Other,please Specify</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><html:textarea name="AddCustomer" property ="answer(Object::Customer::OtherBusiness)" rows="4" cols="60" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
						</td>
					</tr>
					<tr>
			               <td colspan="3">&nbsp;</td>
			          </tr>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' connector='or' negated="true">	
					<tr>
						<td width="34%" align="right" class="field">Active:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left">
						    <html:select name="AddCustomer" property="answer(Object::Customer::active)" styleClass="txtbox">
								<html:option value ="Y">Yes</html:option>
								<html:option value ='D'>No</html:option>
							</html:select>
						</td>
					</tr>
					</dmshtml:dms_static_with_connector>
					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Referred"}%>" value="<%=""+insuredStatus %>" negated="true" >
						<tr>							
							 <td width="34%" align="right">
								  <html:submit value="Save" property="answer(button)" styleClass="covbutton"/>
							  </td>
							  <td width="2%">&nbsp;</td>
							   <td width="64%" align="left">
								   <html:reset value="Reset" styleClass="covbutton"/>
							  </td>
							  
				     	</tr> 
				     	<tr>
			               <td colspan="3">&nbsp;</td>
			            </tr>
				    </dmshtml:dms_isPresent>
		</table>
		
	<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
	<%if(!Customerid.toString().equals("")) {%>
	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
	<%}%>
	<html:hidden property="answer(Object::Submission::SubmissionId)" value='<%=""+submissionIdNBF %>' />
	<html:hidden property="answer(Object::Submission::SubmissionVerId)" value='<%=""+submissionVerIdNBF %>' />	
	<html:hidden property="answer(Object::Submission::Status)" value='<%=""+insuredStatus %>' />
	<html:hidden property="answer(Object::Submission::ClearanceStatus)" value='<%=""+clearanceStatus %>' />			
	<html:hidden property="answer(duplicateAllowed)" value="no"  />
	<html:hidden styleId="pageName" property="answer(Object::Page::Name)" value="SubmissionSummary"  />
	<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" styleId="ownerId" />
	<html:hidden property="answer(Object::Submission::OwnerId)" value="<%=ownerId.toString()%>" styleId="ownerId" />			
	<html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
	<html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />					
	<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
  	<html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
    <html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />
	<html:hidden property="answer(requestForm)" value="Submission" />
	<html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />
   	<html:hidden property="answer(Object::Customer::User)" value="<%=userName.toString()%>" />
  	<html:hidden property="answer(Object::Submission::CreatedBy)" value="<%=userName.toString()%>" />				   
   	<html:hidden property="answer(Object::Submission::UpdatedBy)" value="<%=userName.toString()%>" />
	<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
	<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />
	<html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />
	<html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
	<html:hidden name="DataForm" property="answer(versionid)" value="3"/>
	<html:hidden name="DataForm" property="answer(RootTemplate)" value="yes"/>
	
	<html:hidden property="answer(Object::Submission::InsuredId)" value="<%=Customerid.toString()%>" />				   
	<html:hidden property="answer(AgentId)" value="<%=""+lngAgentId1%>" />
	<%if(agencyId2>0){%>
		<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
	<%}%>					
	
	<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>
	<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>					
	<%if(agencyId2>0){%>
		<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
	<%}%>					
	<%if(agencyId2>0){%>
		<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId2%>" />
	<%}%>					
	
	<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
	<%	if(!Customerid.equals("")){%>
	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
	<%}	
	%>
	<html:hidden property="TabPanelName" value="<%="Submission_Panel"%>" />
	<%
		if(""+submissionIdNBF!=null && ""+submissionVerIdNBF!=null){
			if((""+submissionIdNBF).length()>0 && (""+submissionVerIdNBF).length()>0){
				com.dms.ejb.data.QuestionHashMap applicationMap= new com.dms.ejb.data.QuestionHashMap();		
				applicationMap.put("Object::Submission::SubmissionId",""+submissionIdNBF);
				applicationMap.put("Object::Submission::SubmissionVerId",""+submissionVerIdNBF);
				applicationMap.put("Object::Application::ApplicationType","SUBMISSION_APPLICATION");
				applicationMap.put("Object::Customer::CustomerId",""+Customerid);
				applicationMap.put("TabPanelName","Submission_Panel");
				request.setAttribute("ApplicationMap",applicationMap);
			}
		}
		%>
 </html:form>	
					
				</td>
			</tr>
		</table>
     </td>
   </tr>
 </table>
			
					
				
</div>
<% /* Insured div Close */ %>

<%/*Additional Insured div open*/ %>
<div align="center" id="AdditionalInsured" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Locations').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Locations</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Schedule of Tanks</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('GeneralQuestions').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">General Questions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
	  </tr>
     </table>
     </td>
   </tr>
 	<tr> 
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
			<tr>
				<td width="100%" align="center"> 
					<html:form action="/DeleteSubmissionAdditionalInsured" styleId="DeleteInsuredForm" onsubmit="return deleteInsured()">
						<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
						<tr><td colspan="12">&nbsp;</td></tr>
						 <tr>
						 <td>&nbsp;</td>
						 <td colspan="11" align="left">
						  <dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=""+insuredStatus %>" negated="true" >
							 <a href="../GetSubmissionAdditionalInsuredDetailAction.do?TabPanelName=Insured_Panel&answer(submissionId)=<%=""+submissionIdNBF%>&answer(submissionVerId)=<%=""+submissionVerIdNBF%>&answer(Object::AdditionalInsured::AdditionalyNamedInsured)=N" class="button2" style="width:150px"  title="<bean:message key='ToolTip.SubmissionSummary.AddAdditionalInsured'/>"/>Add Additional Insured</a>
						  </dmshtml:dms_isPresent>
						 </td>
						 </tr>
						 <tr><td colspan="12">&nbsp;</td></tr>
			 		  <dmshtml:getSubmission_AdditionalInsured nameInSession="additionalInsuredList"   submissionId = '<%=Long.parseLong(""+submissionIdNBF) %>' submissionVerId ='<%=Long.parseLong(""+submissionVerIdNBF)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
					   <logic:present name="additionalInsuredList" scope="request">
						 <tr>
							<td class="sectionhead" align="center" colspan="12">Additional Insured List</td>
						</tr>
						 <tr><td colspan="12">&nbsp;</td></tr>
						<tr>		
				           	 <td class="sectionhead" width="4%" align="left">S.No</td>
				             <td class="sectionhead" width="8%" align="left">Addl. Insured Type</td>  
				             <td class="sectionhead" width="7%" align="left">Insured  Type</td>  
							 <td class="sectionhead" width="14%" align="left">Insured Name</td>
							 <td class="sectionhead" width="9%" align="left">DBA</td>
						 	 <td class="sectionhead" width="10%" align="left">Name Code</td>
							 <td class="sectionhead" width="11%" align="left" >Address1</td>
							 <td class="sectionhead" width="11%" align="left" >Address2</td>
							 <td class="sectionhead" width="8%" align="left" >City</td>
							 <td class="sectionhead" width="6%" align="left" >State</td>
							 <td class="sectionhead" width="7%" align="left" >ZipCode</td>
							 <dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Referred"}%>" value="<%=""+insuredStatus %>" negated="true" >
			    			 	<td class="sectionhead" width="5%" align="left" >Select</td>	
			    			 </dmshtml:dms_isPresent>
						 </tr>
						  <tr><td colspan="12">&nbsp;</td></tr>
						</logic:present>
						
						
						 <logic:present name="additionalInsuredList" scope="request">
							<% int i=0; %>
							<% int count=0; %>
						 <logic:iterate id="additionalInsuredList" name="additionalInsuredList" scope="request">
								<% count++; %>
								<% 		
									String styleClass="";
									if(count%2==0){
										styleClass = "altdisply";
									}
									else{
										styleClass = "SearchResult";	
									}
								%>
						<tr>
							<td class=<%= styleClass %> align="left"><%=++i%></td>
							<td class=<%=styleClass %>>
								<bean:define id="additionalyNamedInsured" name="additionalInsuredList" property="Object::AdditionalInsured::AdditionalyNamedInsured" />
								<%if(additionalyNamedInsured.toString().equals("N")) { %>Insured								   
								<%}else{%>Named Insured<%}%> 
							</td>  
							<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::InsuranceType" />&nbsp;</td>
								<bean:define id="additionalInsuredID" name="additionalInsuredList" property="Object::AdditionalInsured::AdditionalInsuredID" /> 
							<td class=<%=styleClass %> align="left"><a href="../GetSubmissionAdditionalInsuredDetailAction.do?TabPanelName=Insured_Panel&answer(Object::AdditionalInsured::OwnerId)=<%=ownerId.toString()%>&answer(submissionId)=<%=""+submissionIdNBF%>&answer(submissionVerId)=<%=""+submissionVerIdNBF%>&answer(Object::AdditionalInsured::CustomerID)=<%=Customerid.toString()%>&answer(Object::AdditionalInsured::AdditionalInsuredID)=<%=additionalInsuredID.toString()%>&answer(Object::AdditionalInsured::AdditionalyNamedInsured)=<%=additionalyNamedInsured.toString()%>"  title="<bean:message key='ToolTip.SubmissionSummary.InsuredName'/>"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::InsuredName" /></a>&nbsp;</td>
							<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::DBA" />&nbsp;</td>
							<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::InsuredNumber" />&nbsp;</td>
							<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::Address1" />&nbsp;</td>
							<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::Address2" />&nbsp;</td>			
							<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::City" />&nbsp;</td>								
							<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::State" />&nbsp;</td>													
							<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::Zip" />&nbsp;</td>													
							<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
							<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Referred"}%>" value="<%=""+insuredStatus %>" negated="true" >
							<td class=<%=styleClass %> align="center">
								<input type="checkbox" name="answer(Object::AdditionalInsured::SelectedAdditionalInsured)" value='<%=""+additionalInsuredID%>' id="additionalInsuredSelect" 	>
							</td>	
							</dmshtml:dms_isPresent>
					    </tr>
						</logic:iterate>			
							<tr><td colspan="12">&nbsp;</td></tr>
							<tr><td colspan="12">&nbsp;</td></tr>
							<tr><td colspan="12">&nbsp;</td></tr>											
						<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Referred"}%>" value="<%=""+insuredStatus %>" negated="true" >
						<tr>
							<td align="right" colspan="12" title="<bean:message key='ToolTip.SubmissionSummary.Delete'/>"><html:submit property="answer(formName)" value="Delete" styleClass="sbttn" />&nbsp;&nbsp;</td>
						</tr>
						</dmshtml:dms_isPresent>
						</logic:present>
						<logic:notPresent name="additionalInsuredList" scope="request">
						<tr>
							<td colspan="12">
							<span class="Error">Currently no Additional Insured are listed</span></td>
						</tr>
					   </logic:notPresent>
						<tr><td colspan="12">&nbsp;</td></tr>
					   </table>	
						<html:hidden property="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" value="N" />
						<html:hidden property="answer(Object::AdditionalInsured::CustomerID)" value="<%=cId.toString()%>" />
			  			<html:hidden property="answer(Object::AdditionalInsured::OwnerId)" value="<%=ownerId.toString()%>" />
			        	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
				        <html:hidden property="answer(submissionId)" value='<%=""+submissionIdNBF%>' />
				        <html:hidden property="answer(submissionVerId)" value='<%=""+submissionVerIdNBF%>' />
				        <html:hidden property="answer(Object::Customer::CustomerId)" value="<%=cId.toString()%>" />
			            <html:hidden property="answer(Object::Submission::SubmissionVerId)"  value="<%=""+submissionVerIdNBF %>"/>  
					    <html:hidden property="answer(Object::Submission::SubmissionId)" value="<%=""+submissionIdNBF %>"/>   
					    <html:hidden property="answer(customerId)" value="<%=cId.toString()%>" />
					    <html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />
					    <html:hidden property="answer(Object::Submission::InsuredId)" value="<%=cId.toString()%>" />
						<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=cId.toString()%>" />	
						<html:hidden property="answer(InsuredSummaryActiveTab)" value="AdditionalInsured" />	
						<html:hidden property="InsuredSummaryActiveTab" value="AdditionalInsured" />
					</html:form>	
 		     </td>
 			</tr>
 		</table>
 	  </td>
 	 </tr>
   </table>
 </div>
<%/*Additional Insured div close*/ %>


<% /* Locations div Open */ %>
<div align="center" id="Locations" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">  
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr> 
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
        <td align="center" valign=bottom>
    		 <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35    >
				<tr>
					<td align="center" onClick="document.getElementById('Locations').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Locations</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Schedule of Tanks</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('GeneralQuestions').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">General Questions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
       </tr>
     </table>
         </td>

       </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
  <tr> 
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height=100 >
			<tr>
				<td width="100%" align="center"> 
					
					<dmshtml:Get_Submission_Location_Details nameInSession="locationListArray1"  submissionInsuredId='<%=cId.toString()%>' submissionId = '<%=""+submissionIdNBF %>' submissionVerId = '<%=""+submissionVerIdNBF %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
					<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="2">
					<logic:notPresent name='locationListArray1'>
						<logic:notPresent name='ArrOfInCompRiskQmap'>						
							<tr>
								<td valign="top">
									<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td height="20px" colspan="9" class="MH" style="{color:red;}">
												
													No Locations Found
												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</logic:notPresent>
					</logic:notPresent>
					
					<% int commonCount = 0; %>
					
					<dmshtml:dms_isPresent property="<%=new String[]{"Declined","Lapsed"}%>" value="<%=""+insuredStatus %>" negated="false" >	
					<tr>
						<td>
						 <dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=""+insuredStatus %>" negated="true" >
							&nbsp;<a href="../GetSubmissionLocationList3.0.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+Customerid %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(AddLocationLink)=YES&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerIdNBF %>&answer(Object::Submission::InsuredId)=<%=""+Customerid %>&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(PrimaryKey_Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(OwnerId)=<%=ownerId+"" %>" id="AddLocation_link" title="<bean:message key='ToolTip.SubmissionSummary.AddLocation'/>" class="button2" style="width:100px">Add Locations</a>	&nbsp;				
						 </dmshtml:dms_isPresent>
						</td>					
					</tr>
					</dmshtml:dms_isPresent>
					<logic:present name="locationListArray1">
							<tr>
							<td class="sectionhead" width="3%" align="center">
								Edit
							</td>
							<td class="sectionhead" width="8%" align="center">
								Location Number
							</td>
							<td class="sectionhead" width="7%" align="center">
								Location Name
							</td>	
							
							<td class="sectionhead" width="5%">
								Address1
							</td>    
							<td class="sectionhead" width="5%">
								Address2
							</td>    	
						
							<td class="sectionhead" width="5%">
								City
							</td>
							
							<td class="sectionhead" width="5%">
								State
							</td>
							
							<td class="sectionhead" width="5%">
								Country
							</td>
							
						</tr>
					
						<% int i=0; %>
		  				<%int count=0;%>   
					
						<logic:iterate id="locationListArray1" name="locationListArray1" >
							<%++count;%>
							<%++commonCount;%>
							
						
							
							<tr>
								<td>
								
								</td>
							</tr>								
							<tr>
								<td class="SearchResult" align="center" title="<bean:message key='ToolTip.SubmissionSummary.EditLocation'/>">								
									<a href="../GetSubmissionLocationList3.0.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+Customerid %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(requestForm)=Submission&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(Object::Submission::SubmissionId)=<bean:write name="locationListArray1" property="Object::Location::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="locationListArray1" property="Object::Location::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="locationListArray1" property="Object::Location::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray1" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray1" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="locationListArray1" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="locationListArray1" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(OwnerId)=<%=ownerId+"" %>" /><IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT=""></a>
								</td>
								<td class="SearchResult" align="center" title="<bean:message key='ToolTip.SubmissionSummary.LocationNumber'/>">
										<a href="../GetSubmissionLocationList3.0.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+Customerid %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(requestForm)=Submission&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(Object::Submission::SubmissionId)=<bean:write name="locationListArray1" property="Object::Location::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="locationListArray1" property="Object::Location::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="locationListArray1" property="Object::Location::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray1" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray1" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="locationListArray1" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="locationListArray1" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="locationListArray1" property="Object::Location::LocationNumber" /></a>
									<%++i;%>
								</td>
								<td class="SearchResult" align="center" title="<bean:message key='ToolTip.SubmissionSummary.LocationNumber'/>">
									<a href="../GetSubmissionLocationList3.0.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+Customerid %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(requestForm)=Submission&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(Object::Submission::SubmissionId)=<bean:write name="locationListArray1" property="Object::Location::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="locationListArray1" property="Object::Location::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="locationListArray1" property="Object::Location::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray1" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray1" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="locationListArray1" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="locationListArray1" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(OwnerId)=<%=ownerId+"" %>&answer(Object::Location::LocationId)=<bean:write name="locationListArray1" property="Object::Location::LocationId" />&answer(Object::Location::LocationName)=<bean:write name="locationListArray1" property="Object::Location::LocationName" />" /><bean:write name="locationListArray1" property="Object::Location::LocationName" /></a>
									&nbsp;
									
								</td>
								
								
								<td class="SearchResult">
									<bean:write name="locationListArray1" property="Object::Location::LocationAddress1" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray1" property="Object::Location::LocationAddress2" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray1" property="Object::Location::LocationCity" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray1" property="Object::Location::LocationState" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray1" property="Object::Location::Country" />&nbsp;
								</td>
										 
							</tr>
						</logic:iterate>
					</logic:present>					
				</table>
				</td>
			</tr>
		</table>
 
				</td>
			</tr>
		</table>
    
					
</div>

<% /* Locations div Close */ %>




<% /* Schedule of Tanks div Open */ %>

<div align="center" id="ScheduleofTanks" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35    >
				<tr>
					<td align="center" onClick="document.getElementById('Locations').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Locations</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Schedule of Tanks</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('GeneralQuestions').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">General Questions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
	  </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
  <tr> 
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height=100 >
			<tr>
				<td width="100%" align="center"> 
					
					<dmshtml:Get_Submission_Tanks_Details nameInSession="TanksListArray"  submissionInsuredId='<%=cId.toString()%>' submissionId = '<%=""+submissionIdNBF %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
					<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="2">
				<!-- 	<a href="../locationrisk/LocationRisk.jsp?answer(TabPanelName)=Submission_Panel&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Submisssion::SubmisssionId)=<%=""+submissionIdNBF%>&answer(Object::Submisssion::SubmisssionVerId)=<%=""+submissionVerIdNBF %>" >Risk</a>
					<tr>
					<td>&nbsp;
					</td>
					</tr>
					<a href="../locationrisk/LocationListView.jsp?answer(TabPanelName)=Submission_Panel&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Submisssion::SubmisssionId)=<%=""+submissionIdNBF%>&answer(Object::Submisssion::SubmisssionVerId)=<%=""+submissionVerIdNBF %>" >Locations</a>
					<a href="../locationrisk/LocationTree.jsp?answer(TabPanelName)=Submission_Panel&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Submisssion::SubmisssionId)=<%=""+submissionIdNBF%>" >Location Tree List</a>
					 -->
					<logic:notPresent name='TanksListArray'>
						<logic:notPresent name='ArrOfInCompRiskQmap'>						
							<tr>
								<td valign="top">
									<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td height="20px" colspan="9" class="MH" style="{color:red;}">
												
													No Tanks Found
												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</logic:notPresent>
					</logic:notPresent>
					
					<% int tankCount = 0; %>
					
					<logic:present name="TanksListArray">

						<tr><td colspan="10">&nbsp;</td></tr>				
						
						<tr>
							<td class="sectionhead" width="3%" align="center">
								Edit
							</td>
							
							<td class="sectionhead" width="7%" align="center">
								Tank Name
							</td>	
							<td class="sectionhead" width="7%" align="center">
								Tank Num
							</td>
							<td class="sectionhead" width="8%" align="center">
								Location Number
							</td>
							<td class="sectionhead" width="8%" align="center">
								Location Name
							</td>
							<td class="sectionhead" width="5%">
								Address1
							</td>    
							<td class="sectionhead" width="5%">
								Address2
							</td>    	
						
							<td class="sectionhead" width="5%">
								City
							</td>
							
							<td class="sectionhead" width="5%">
								State
							</td>
							
							<td class="sectionhead" width="5%">
								Country
							</td>
							
						</tr>
					
						<% int j=0; %>
		  				<%int count1=0;%>   
					
						<logic:iterate id="TanksListArray" name="TanksListArray" >
							<%++count1;%>
							<%++tankCount;%>
						<tr>
								<td>
								
								</td>
							</tr>								
							<tr>
								<td class="SearchResult" align="center" title="<bean:message key='ToolTip.SubmissionSummary.EditTank'/>">								
									<a href="../GetSubmissionLocationList3.0.do?answer(selectedRiskId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::StorageTankId" />&answer(selectedrisk)=<bean:write name="TanksListArray" property="Object::Location::Tanks::RiskType" />&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+Customerid %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(requestForm)=Submission&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(PrimaryKey_Object::Location::Tanks::TankId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::StorageTankId" />&answer(Object::Submission::SubmissionId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="TanksListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="TanksListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(TabPanelName)=Submission_Panel&answer(Object::Location::LocationName)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT=""></a>
								</td>
								
								<td class="SearchResult" align="center" title="<bean:message key='ToolTip.SubmissionSummary.TankName'/>">
									<a href="../GetSubmissionLocationList3.0.do?answer(selectedRiskId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::StorageTankId" />&answer(selectedrisk)=<bean:write name="TanksListArray" property="Object::Location::Tanks::RiskType" />&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+Customerid %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(requestForm)=Submission&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(PrimaryKey_Object::Location::Tanks::TankId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::StorageTankId" />&answer(Object::Submission::SubmissionId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="TanksListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="TanksListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(TabPanelName)=Submission_Panel&answer(Object::Location::LocationName)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="TanksListArray" property="Object::Location::Tanks::RiskName" /></a>
									&nbsp;
									
								</td>
								<td class="SearchResult" align="center" title="<bean:message key='ToolTip.SubmissionSummary.TankNumber'/>">
									<a href="../GetSubmissionLocationList3.0.do?answer(selectedRiskId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::StorageTankId" />&answer(selectedrisk)=<bean:write name="TanksListArray" property="Object::Location::Tanks::RiskType" />&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+Customerid %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(requestForm)=Submission&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(PrimaryKey_Object::Location::Tanks::TankId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::StorageTankId" />&answer(Object::Submission::SubmissionId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="TanksListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="TanksListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(TabPanelName)=Submission_Panel&answer(Object::Location::LocationName)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="TanksListArray" property="Object::Location::Tanks::RiskNumber" /></a>
									&nbsp;
									
								</td>
								<td class="SearchResult" align="center" title="<bean:message key='ToolTip.SubmissionSummary.LocationNumber'/>">
										<a href="../GetSubmissionLocationList3.0.do?answer(TabPanelName)=Submission_Panel&answer(Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+Customerid %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(requestForm)=Submission&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(Object::Submission::SubmissionId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="TanksListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="TanksListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Location::LocationName)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="TanksListArray" property="Object::Location::Tanks::LocationNumber" /></a>
									<%++j;%>
								</td>
								<td class="SearchResult" align="center" title="<bean:message key='ToolTip.SubmissionSummary.LocationName'/>">
										<a href="../GetSubmissionLocationList3.0.do?answer(TabPanelName)=Submission_Panel&answer(Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(Object::Submission::SubmissionStatus)=<%=insuredStatus%>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+Customerid %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(Object::Submission::SubmissionId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="TanksListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="TanksListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= Customerid.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Location::LocationName)=<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="TanksListArray" property="Object::Location::Tanks::LocationName" /></a>
									<%++j;%>
								</td>
								<td class="SearchResult">
									<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationAddress1" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationAddress2" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationCity" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="TanksListArray" property="Object::Location::Tanks::LocationState" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="TanksListArray" property="Object::Location::Tanks::Country" />&nbsp;
								</td>
										 
							</tr>
						</logic:iterate>
					</logic:present>					
				</table>
				</td>
			</tr>
		</table>
				</td>
			</tr>
		</table>
</div>

<% /* Schedule of Tanks div Close */ %>

<% /* Requested Coverages div Open */ %>

<div align="center" id="RequestedCoverages" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35    >
				<tr>
					<td align="center" onClick="document.getElementById('Locations').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Locations</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Schedule of Tanks</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('GeneralQuestions').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">General Questions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
	  </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
   <tr> 
     <td width="100%" colspan="2" >
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height=250 >
  		 <tr>
			  		 <td >
			  		 <table width="50%" align="center">
			  		 <tr>
			  		 <td>		
			  		 
						<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
						objectVerId="0" objectName='<%="SUBMISSION_REQUESTED_COVERAGES"%>' constructFormAlone='<%=true%>' applicationType="SUBMISSION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveSubmissionGeneralQuestionAppSummary.go" isApplicationEnabled='<%=""+isAppEnabled %>'  showOneTabAtTime="N"/>
						<logic:present name="Application" scope="request">
						<bean:define id="htmlPage" name="Application"
						type="java.lang.StringBuffer" />
						<%out.println(htmlPage.toString());%>
						</logic:present>
						<logic:notPresent name="Application" scope="request">
						<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		
						</logic:notPresent>	
						<span id="messageHoldernew" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
					</td>
					</tr>
					</table>
					</td>
		</tr>
			
		</table>
     </td>
   </tr>
 </table>
</div>
<% /* Requested Coverages div Close */ %>


<% /* General Questions div Open */ %>

<div align="center" id="GeneralQuestions" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35    >
				<tr>
					<td align="center" onClick="document.getElementById('Locations').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Locations</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Schedule of Tanks</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('GeneralQuestions').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">General Questions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
	  </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
   <tr> 
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height=250 >
			<tr>
				<td width="100%" align="center"> 
					
					<body>
					<table>
								<tr>
									<td align="left">
											&nbsp;
									</td>
								</tr>
					</table>
					<table width="100%" align="center">
			  		 <tr>
			  		 <td align="left">	
					<dmshtml:DisplayApplication nameInSession="Application" constructFormAlone='<%=true%>'   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
					objectVerId="0" objectName='<%="GENERAL QUESTION SUBMISSION"%>' applicationType="SUBMISSION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveSubmissionGeneralQuestionAppSummary.go" isApplicationEnabled='<%=""+isAppEnabled %>'  showOneTabAtTime="N"/>
					<logic:present name="Application" scope="request">

					<bean:define id="htmlPage" name="Application"
					type="java.lang.StringBuffer" />
					<%out.println(htmlPage.toString());%>
					</logic:present>
					<logic:notPresent name="Application" scope="request">
					<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

					</logic:notPresent>
					<span id="messageHoldernew" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
					
					</td>
					</tr>
					</table>

					</body>
				
				</td>
			</tr>
		</table>
     </td>
   </tr>
 </table>
</div>
<% /* General Questions div Close */%>



<% /* Quotes div Open */ %>

<div align="center" id="Quotes" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35    >
				<tr>
					<td align="center" onClick="document.getElementById('Locations').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Locations</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Schedule of Tanks</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('GeneralQuestions').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">General Questions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
	 </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
   <tr> 
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
			<tr>
				<td width="100%" align="left"> 
					
					<html:form action="/DeleteEILQuoteConfirmAction" onsubmit="return validateDelete(this)">
					<bean:define id="customerId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
					<bean:define id="ownerId1" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
					<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
					<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/>
					<bean:define id="ObjectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/>
					
					<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="2">
						<tr>
					      <td colspan="6" align="left">
					       <dmshtml:Get_Customer_HeaderDetail_ByCustomerId nameInSession="customerMap" customerId='<%=""+customerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
					         <bean:define id="customerDetailMap" name="customerMap" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
					         <% EmpGrpState=customerDetailMap.getString("Object::Customer::State");%>
					        <html:hidden property="answer(Object::Risk::RiskId)" value="1"/>
    				           <html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId1.toString()%>" /> 
								<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
							<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
					        
					        <dmshtml:dms_isPresent property="<%=new String[]{"Declined","Lapsed","In Progress"}%>" value="<%=""+insuredStatus %>" negated="false" >
					        	<a href="../NewEILQuote.do?TabPanelName=Quote_Panel&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::QuoteType)=<%=""+submissionType%>&answer(Object::QuoteAdditional::RenewalPolicyNumber)=<%=""+submissionRenewalPolNo%>&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=userId.toString()%>&formName=form::GETCLQUOTEDETAILS&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::Quote::ProductStatus)=RELEASED&answer(State)=<%=EmpGrpState%>&answer(Object::Quote::SubmissionId)=<%=""+SubmissionId%>&answer(Object::Quote::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Risk::RiskId)=11&answer(Object::Quote::NewQuote)=YES&answer(Object::Quote::ProductStatus)=RELEASED" title="Click to go to create a New Quote" id="Create_Quote_link" title="<bean:message key='ToolTip.SubmissionSummary.CreateProposal'/>" ><html:button styleClass="linkButtonBig" property="answer(CreateQuote)" value="Create New Quote" onclick="window.location=document.getElementById('Create_Quote_link')"/></a>
					        </dmshtml:dms_isPresent>
					      </td>    
					    </tr>
					 
					
					<dmshtml:Get_AllQuoteDetails_ByCustomerId_SubmissionId nameInSession="policyList" submissionId='<%=Long.parseLong(""+SubmissionId) %>' submissionVerId='<%=Long.parseLong(""+SubmissionVerId )%>'  customerId="<%=customerId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId1)%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
					
					<% boolean deletePrivilege = false; %>
					<dmshtml:dms_static_with_connector ruleName='privilage'  property='<%=new String[]{"DELETE_QUOTE"}%>' connector='or' negated="true">
							<% deletePrivilege = true; %>
					</dmshtml:dms_static_with_connector>
					
					<logic:present name="policyList" scope="request">
					<tr>
						<td colspan=9 align="left" style="font-size:10pt;">Click on the
						Quote No. to goto Quote Summary</td>
					</tr>
					<TR >
						<td> &nbsp; </td>
						<td class="sectionhead" align="left" >Quote No.</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_NAME_VIEW"}%>' connector='or' negated="true">  		
							<td class="sectionhead" align="center">Quote Name</td>
						</dmshtml:dms_static_with_connector>
						<td class="sectionhead" align="left" >Effective Date</td>
						<td class="sectionhead" align="left" >Status</td>		
						<td class="sectionhead" align="left" >Quote Type</td>
						<td class="sectionhead" align="left" >Quote Created Date</td>
						<td class="sectionhead" align="left" >Last Saved Date</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_TOTAL_PREMIUM"}%>' connector='or' negated="true">  		
							<td class="sectionhead" align="left" >Total Premium</td>		
					    </dmshtml:dms_static_with_connector>
						<td class="sectionhead" align="left" >&nbsp;</td>
						<% if(deletePrivilege){%>
						<td class="sectionhead" align="left" >Select</td>
						<%}%>
					</TR>
					<%int count=0;
					  String renewalFlag = "N";
					  String quoteType1 = "";%>
					<logic:iterate id="aQuote" name="policyList" scope="request">
					
						<%count++;%>
						<% 		
							String styleClass="";
							if(count%2==0){
								styleClass = "altdisply";
							}
							else{
								styleClass = "SearchResult";	
							}
						%>
						<%System.out.println("Firset lrektrefv cvcxvxfc dcgvdfgf dfgdfg dfgdfgfgd"); %>
					<bean:define id="parentQuoteVerId" name="aQuote" property="verId"/>
					<bean:define id="quoteId" name="aQuote" property="quoteId" />
					<bean:define id="quoteName" name="aQuote" property="quoteName" />
					<bean:define id="product" name="aQuote" property="quoteId" />					
					<bean:define id="totalPremium" name="aQuote" property="totalPremium" />
					<bean:define id="fee1" name="aQuote" property="fee1" />
					<bean:define id="fee2" name="aQuote" property="fee2" />
					<bean:define id="quoteType" name="aQuote" property="quoteType" />
					
					<%if((""+quoteType).equals("ENDORSEMENT")) {
							renewalFlag = "Y";
							quoteType1 = "RENEWAL";
					} else {
							renewalFlag = "N";
							quoteType1 = ""+quoteType;						
					}
					%>
					<%
					double grandTotal = 0;
					double dbTotalPremium = 0;
					double dbFee1 = 0;
					double dbFee2 = 0;
					try{
						dbTotalPremium = Double.parseDouble(""+totalPremium);
					}catch(Exception ex){}
					try{
						dbFee1 = Double.parseDouble(""+fee1);
					}catch(Exception ex){}
					try{
						dbFee2 = Double.parseDouble(""+fee2);
					}catch(Exception ex){}
					grandTotal = dbTotalPremium + dbFee1 + dbFee2;
					%>
					
						<TR height="25px">
						<td> &nbsp; </td>
						<TD class="SearchResult"  align="left">
						<logic:present name="LoginPage" scope="session">
						<%if(renewalFlag.equals("N")){ %>
						<a href="../SyncQuoteWithEmployerGroupAndProductAction.do?TabPanelName=Quote_Panel&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteId)=<%=""+quoteId%>&answer(parentQuoteId)=<bean:write name='aQuote' property='quoteId' />&answer(ownerId)=<%=ownerId1.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(userId)=<%=""+userId%>&answer(Object::Customer::State)=<bean:write name='aQuote' property='customerState' />" title="<bean:message key='ToolTip.SubmissionSummary.QuoteNumber'/>">						
<!-- Added to show subnumber along with quote number start -->
						<%} else if(renewalFlag.equals("Y")){ %>
						<a href="/GetEndorsementQuoteDetail.do?TabPanelName=Quote_Panel&answer(parentPolicyStatus)=<%=""%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=""+quoteId %>&answer(parentQuoteId)=<bean:write name='aQuote' property='quoteId' />&answer(policyNumber)=<bean:write name='aQuote' property='policyNumber' />&answer(Object::Policy::ParentPolicyId)=<bean:write name='aQuote' property='parentPolicyId' />&answer(Object::Policy::ParentPolicyVerId)=<bean:write name='aQuote' property='currentPolicyVerId' />&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(policyEffDate)=<%=""%>&answer(policyExpDate)=<%=""%> " title="<bean:message key='ToolTip.SubmissionSummary.QuoteNumber'/>">
						<%} %>
						<bean:define id="quoteSubNum" name="aQuote" property="quoteSubNumber"/>
						<bean:write name="aQuote" property="quoteNumber"/><%try{if(Integer.parseInt(""+quoteSubNum.toString())>=1){%>-<%=""+quoteSubNum%><%}
							}
							catch(NumberFormatException nfe)
							{}
						%>
<!-- Added to show subnumber along with quote number end -->
						<BR></a>
						</logic:present></TD>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_NAME_VIEW"}%>' connector='or' negated="true">  		
							<td class=<%= styleClass %>  align="center"><bean:write name="aQuote" property="quoteName" /></td>
						</dmshtml:dms_static_with_connector>
						<td class="SearchResult" align="left"><bean:write name="aQuote" property="quoteStartDate" /></td>
						<td class="SearchResult" align="left"><bean:write name="aQuote" property="quoteStatus" /></td>
						<td class="SearchResult" align="left"><%=quoteType1 %></td>
						<td class="SearchResult" align="left"><bean:write name="aQuote" property="createdDate" /></td>
						<td class="SearchResult" align="left"><bean:write name="aQuote" property="updatedDate" /></td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_TOTAL_PREMIUM"}%>' connector='or' negated="true">  		
							<td class="SearchResult" align="left"><dmshtml:CurrencyFormatTag digits="2" format='<%=""+grandTotal%>' /></td>	
						</dmshtml:dms_static_with_connector>
						<dmshtml:dms_isPresent property="<%=new String[]{"Declined","Lapsed","In Progress"}%>" value="<%=""+insuredStatus %>" negated="false" >
							<%String copyQuoteID = "window.location=document.getElementById('Copy_Quote_"+count+"');"; %>
<!--  							<td class=<%= styleClass %>>&nbsp;&nbsp;<a href="../CopyQuoteCL.do?TabPanelName=Quote_Panel&answer(Object::Submission::SubmissionId)=<%=""+submissionIdNBF %>&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerIdNBF %>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&forwardKey=SubmissionCopyQuote&PageType=SUBMISSION_SUMMARY&quoteId=<%=""+quoteId%>&answer(Entity::Equals::OwnerId)=<%=ownerId1.toString()%>&parentQuoteVerId=<%=""+parentQuoteVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::Customer::State)=<bean:write name='aQuote' property='customerState' />" id='<%="Copy_Quote_"+count %>' /><html:button styleClass="linkButton" property="answer(CopyQuote)" value="Copy Quote" onclick='<%=""+copyQuoteID %>'/><BR></a>					        	-->
							</td>
					    </dmshtml:dms_isPresent>						
						
						<% if(deletePrivilege){%>
							<td class="SearchResult">							
								 <dmshtml:dms_multibox property="answer(Object::Quote::QuoteId)" value="<%=""+quoteId%>" styleId="<%="quoteDelCheckbox"+count%>" >
								</dmshtml:dms_multibox> 
							</td>	
						<%}%>

					</TR>
					</logic:iterate>
					</logic:present>
					<logic:notPresent name="policyList" scope="request">
					<tr>
						<td colspan="3">
						<span class="Error">Currently no Quotes are listed</span></td>
					</tr>
					</logic:notPresent>

				<tr><td>&nbsp;</td></tr>

				<logic:present name="AddParentQuote" >
					<%
					boolean errorOccured=false;
					%>
					<bean:define id="ansmap" name="AddParentQuote" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
					<logic:iterate id="element" name="ansmap">
					<bean:define id="errorListkey" name="element" property="key" />
					<logic:equal name="errorListkey" value="Object::error::list">
					<bean:define id="errorListvalue" name="element" property="value" />
					<logic:iterate id="errmsg" name="errorListvalue">
					<tr>
						<td class="Error" >
						<bean:write name="errmsg" property="errorMessage" />
						<%
						errorOccured	=true;				
						%>
						</td>
					</tr>
					</logic:iterate>
					</logic:equal>
					</logic:iterate> 
					<%
					if(errorOccured)
					{((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
					((com.dms.ejb.data.QuestionHashMap)ansmap).remove("Object::error::list");
					}
					%>
					</logic:present>



			<tr>
				<% if(deletePrivilege){%>
				<td colspan="6">
				<%}else{%>
				<td colspan="5">
				<%}%>
				<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">


				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<% if(deletePrivilege){%>
					<td>&nbsp;</td>
					<%}%>
				</tr>
				<tr>
	
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>				
				<% if(deletePrivilege){%>
					<td align="right" >
						<html:submit value="Delete" styleClass="sbttn" /> 
					</td>
				<%}%>
				</tr>
				</table></td>
				
				</tr>
		
	</table>
			<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyIdTemp%>" />
			<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>" />
			<html:hidden property="answer(Entity::Equals::OwnerId)" value="<%=""+ownerId%>" />
			<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId%>" />
			<html:hidden property="answer(Object::Customer::State)" value="<%=""+EmpGrpState%>" />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
			<html:hidden property="answer(Object::Submission::SubmissionId)" value='<%=""+submissionIdNBF %>' />
			<html:hidden property="answer(Object::Submission::SubmissionVerId)" value='<%=""+SubmissionVerId %>' />
			<html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />	
			<html:hidden property="answer(Object::Clearance::RetroDateFlag)" value="" styleId="RetroDateModifiedFlag"/>
</html:form>
				</td>
			</tr>
		</table>
     </td>
   </tr>
 </table>
</div>

<% /* Quotes Div Close */ %>


<% /* Policy div Open */ %>

<div align="center" id="Policy" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
	<tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
    <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35    >
				<tr>
					<td align="center" onClick="document.getElementById('Locations').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Locations</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Schedule of Tanks</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('GeneralQuestions').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">General Questions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
		
       </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
   <tr> 
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height=100 >
			<tr>
				<td width="100%" align="left"> 
					
					<dmshtml:GetPolicyListByCustomerAndSubmissionId nameInSession="policyListBYCustAndSubmId" ownerId="<%=Long.parseLong(""+ownerId)%>" customerId="<%=Long.parseLong(Customerid.toString())%>" submissionId="<%=SubmissionId%>" submissionVerId="<%=SubmissionVerId%>" policyType="POLICY" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 <table WIDTH="100%" ALIGN="left" cellspacing=1 cellpadding="1" border="0">
							
							<logic:present  name="policyListBYCustAndSubmId" scope="request">			
								<tr><td colspan="9">&nbsp;</td></tr>
								<tr>
									<td colspan=9 align="left" style ="font-size:10pt;">Click on the Policy Number to goto Policy Summary</td>
								</tr>				
								<TR >
									<td class="sectionhead" align="left">S.No.</td>
									<td class="sectionhead" align="left" >Policy Number</td>
									<td class="sectionhead" align="left" >Effective Date</td>
									<td class="sectionhead" align="left" >Expiration Date</td>
									<td class="sectionhead" align="left" >Policy Status</td>		
									<td class="sectionhead" align="left" >Policy Type</td>
									<td class="sectionhead" align="left" >Bound By</td>
									<td class="sectionhead" align="left" >Bound Date</td>
									<td class="sectionhead" align="left" >Issued Date</td>
								</TR>
								<%int count=0;%>
								<logic:iterate id="arrOfPolicyMap" name="policyListBYCustAndSubmId" scope="request">							
								<tr>
									<%
										count++;									
										com.dms.ejb.data.QuestionHashMap policyListMap = (com.dms.ejb.data.QuestionHashMap)arrOfPolicyMap;
										String policyNumber = ""+policyListMap.get("Object::Policy::PolicyNumber");
										String policyNumberInVer = "" + policyListMap.get("Object::Policy::PolicyNumberInVer");
										String policyId = "" + policyListMap.get("Object::Policy::PolicyId");
										String policyVerId = "" + policyListMap.get("Object::Policy::PolVerId");
										String parentPolicyId = "" + policyListMap.get("Object::Policy::ParentPolicyId");
										String parentPolicyVerId = "" + policyListMap.get("Object::Policy::ParentPolicyVerId");
									%>
									<TD class="SearchResult"  align="left"><%=count%></TD>
									<TD class="SearchResult"  align="left">
										<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+policyVerId%>&answer(policyId)=<%=""+policyId%>&answer(conditionFlag)=Y " title="<bean:message key='ToolTip.SubmissionSummary.PolicyNumber'/>">
										<%= policyNumberInVer%>
										</a>
									</TD>
									<TD class="SearchResult" align="left">
										<%
											String polEffDate ="";
											String polEffDate1 = "";
											polEffDate =""+policyListMap.get("Object::Policy::PolEffDate");																							
											String arrPolEffDate[] = polEffDate.split(" ");
											polEffDate1 = arrPolEffDate[0];											
											String arrPolEffDate1[] = polEffDate1.split("-"); 										    
											String YYYY1 = arrPolEffDate1[0];
											String MM1 = arrPolEffDate1[1];
											String DD1 = arrPolEffDate1[2];
											
											polEffDate = MM1+"-"+DD1+"-"+YYYY1;
										%>												
				 						<%=polEffDate %>	
									</TD>
									<TD class="SearchResult" align="left">
										<%
											String polExpDate ="";
											String polExpDate1 = "";
											polExpDate =""+policyListMap.get("Object::Policy::PolExpDate");
															
											String arrPolExpDate[] = polExpDate.split(" ");
											polExpDate1 = arrPolExpDate[0];
											String arrPolExpDate1[] = polExpDate1.split("-");      
											String YYYY2 = arrPolExpDate1[0];
											String MM2 = arrPolExpDate1[1];
											String DD2 = arrPolExpDate1[2];
											
											polExpDate = MM2+"-"+DD2+"-"+YYYY2;
										%>												
				 						<%=polExpDate %>	
									</TD>
									<TD class="SearchResult" align="left"><%=""+policyListMap.get("Object::Policy::PolicyStatus") %></TD>
									<td class="SearchResult" align="left">
										<%	String isRenewal = ""+policyListMap.get("Object::Policy::IsRenewal");
											if(isRenewal.equalsIgnoreCase("Y")) { %>
												RENEWAL
											<%}else {%>
												<%=""+policyListMap.get("Object::Policy::PolicyType") %>
											<%} %>
									</td>	
									<TD class="SearchResult" align="left"><%=""+policyListMap.getEncodedString("Object::Policy::CreatedBy") %></TD>
									<TD class="SearchResult" align="left">
										<%
											String createdDate ="";
											String createdDate1 = "";
											if((""+isRenewal).equalsIgnoreCase("Y")) {		
												createdDate =""+policyListMap.get("Object::Policy::PolVerCreatedDate");
											} else {
												createdDate =""+policyListMap.get("Object::Policy::PolCreatedDate");
											}
																	
											String arrCreatedDate[] = createdDate.split(" ");
											createdDate1 = arrCreatedDate[0];
											String arrCreatedDate1[] = createdDate1.split("-");      
											String YYYY = arrCreatedDate1[0];
											String MM = arrCreatedDate1[1];
											String DD = arrCreatedDate1[2];
											
											createdDate = MM+"-"+DD+"-"+YYYY;
										%>												
				 						<%=createdDate %>	
									</TD>
									<TD class="SearchResult" align="left">
										<%
											String issuedDate ="";
											String issuedDate1 = "";
											issuedDate =""+policyListMap.get("Object::Policy::IssuedDate");
											if(!issuedDate.equals("null"))	{						
												String arrIssuedDate[] = issuedDate.split(" ");
												issuedDate1 = arrIssuedDate[0];
												String arrIssuedDate1[] = issuedDate1.split("-");      
												String YYYY3 = arrIssuedDate1[0];
												String MM3 = arrIssuedDate1[1];
												String DD3 = arrIssuedDate1[2];
												
												issuedDate = MM3+"-"+DD3+"-"+YYYY3;
											}else {
												issuedDate = "";
											}
										%>												
				 						<%=issuedDate %>	
									
									</TD>
								</tr>
								</logic:iterate>
							</logic:present>
					
							<logic:notPresent name="policyListBYCustAndSubmId">
					
								<tr>
									<td class="error">
										No Policies associated to the insured
									</td>
								</tr>
							</logic:notPresent>
						</table>

				</td>
			</tr>
		</table>
     </td>
   </tr>
 </table>
</div>
</div>
<% /* Policy Div Close */ %>

<SCRIPT type="text/javascript">
   	isSpecificValidationNeeded = true;

	 function doSpecificValidation(frm){
	 	if(frm.name !="RequestedCoverages"){
	 	   
	 	   if(validateGeneralQuestions(frm)){
					return true;
				}else{
					return false;
				}	    
	 	}
	 	return true;
 	}
    tooltipYOffset2 = '+60';
    tooltipXOffset2 = '+50';
	var formElement=document.getElementById("insuredTab");
	
	showCompanyInformation(formElement);
	

	function validateDelete(form)
	{
		var formElement=form;		
		var found_it = false;
		for (var i=0; i < formElement.elements.length; ++i) {
			// Get the current field
			form_field = formElement.elements[i];			
			// Get the field's id			
			form_element_id = formElement.elements[i].id;			
			// Is it a check box field?
			if (form_element_id.indexOf("quoteDelCheckbox")!=-1) {	
				if (form_field.checked)
				{					
					found_it = true;
				    break;
				}
			}
		}			
		if(!found_it)
		{
			alert("Please select the quote to delete.");			
			return false;
		}	
		return true;
	} 
	if((document.getElementsByName('answer(SubmitType)')[0] != null) && (document.getElementsByName('answer(SubmitType)')[0] != undefined))
		document.getElementsByName('answer(SubmitType)')[0].value='Save';
	if((document.getElementsByName('answer(SubmitType)')[1] != null) && (document.getElementsByName('answer(SubmitType)')[1] != undefined))
		document.getElementsByName('answer(SubmitType)')[1].value='Save';


	
</SCRIPT>	
<script type="text/javascript">

<%if(request.getParameter("InsuredSummaryActiveTab") !=null){ 

	if(request.getParameter("InsuredSummaryActiveTab").equals("AdditionalInsured")){ %>
		
		document.getElementById("AdditionalInsured").style.display = "block";
	<%}else{ %>
		
		document.getElementById("Insured").style.display = "block";
	<%}
}else{ %>
	document.getElementById("Insured").style.display = "block";
	
	<%
}%>
function deleteInsured(){
	
			var frm = document.getElementById("DeleteInsuredForm");
			var count = 0;
			for(var i=0; frm.elements[i]!=null; i++) {
			
				if(frm.elements[i].name == "answer(Object::AdditionalInsured::SelectedAdditionalInsured)" && frm.elements[i].checked == true) {
					count++;
					break;
				}
			}
			if(count>0) {
				var ans = window.confirm('Are you sure that you want to delete the selected records?');
				if (ans)
					return true;
				else
					return false;
			} else {
				alert("Please Select any Additional Insured to Delete.");
				return false;
			}			
	}
	

var check='<%=""+mailingAddressSameAsBusinessAddress%>';
if (check=='Y'){
	 document.getElementById("MailingAddressSameAsBusinessAddress_Y").checked="checked";
	 document.forms[0].MailingAddress1.readOnly = true;
	 document.forms[0].MailingAddress2.readOnly = true;
	 document.forms[0].MailingAddress3.readOnly = true;
	 document.forms[0].MailingAddress4.readOnly = true;
	 document.forms[0].MailingAddress5.readOnly = true;
}

if(check=='N') {
	 document.getElementById("MailingAddressSameAsBusinessAddress_N").checked="checked";
	 document.forms[0].MailingAddress1.readOnly = false;
	 document.forms[0].MailingAddress2.readOnly = false;
	 document.forms[0].MailingAddress3.readOnly = false;
	 document.forms[0].MailingAddress4.readOnly = false;
	 document.forms[0].MailingAddress5.readOnly = false;
}
function disableMailingAddressBlock() {
     document.forms[0].MailingAddress1.readOnly = true;
     document.forms[0].MailingAddress2.readOnly = true;
     document.forms[0].MailingAddress3.readOnly = true;
     document.forms[0].MailingAddress4.readOnly = true;
     document.forms[0].MailingAddress5.readOnly = true;
}

function enableMailingAddressBlock() {
     document.forms[0].MailingAddress1.readOnly = false;
     document.forms[0].MailingAddress2.readOnly = false;
     document.forms[0].MailingAddress3.readOnly = false;
     document.forms[0].MailingAddress4.readOnly = false;
     document.forms[0].MailingAddress5.readOnly = false;
}


</script>
<script type="text/javascript"> 
	if((document.getElementById("InsuredName") != null) && (document.getElementById("InsuredName") != undefined))
		document.getElementById("InsuredName").focus()
</script>
<script type="text/javascript" src="../Scripts/JScripts/AddTank.js"></script>



