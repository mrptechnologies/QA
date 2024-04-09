<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<script type="text/javascript">
 var url1 = "/saveQuoteEILRiskApplicationAction3.0.go?";
 var isSpecificValidationNeeded = false;
</script>

<style type="text/css">
.yui-skin-sam .yui-panel{position:relative;left:0;top:0;border-style:solid;border-width:10px 0;border-color:#808080;z-index:1;*border-width:1px;*zoom:1;_zoom:normal;}
.yui-hidden {display:none;}

</style>
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css"	href="../Scripts/YUI/2.7.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />   
<%--<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/editor/assets/skins/sam/simpleeditor.css" />--%>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script>  
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/tabview/tabview-min.js"></script>
<script type="text/JavaScript" SRC="../Scripts/YUI/2.7.0/build/menu/menu-min.js" ></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/PolicyApplication.js"> </SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/PolicySummaryEIL.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/LocationTank/PolicyLocationTank.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CauseListTable.js"></script>
<script type="text/javascript" src="/Scripts/JScripts/Application.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Common.js">
</script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/Subjectivity.js" ></script>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/editor/simpleeditor-min.js"></script>


<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<bean:define id="policyNumber" name="PolicySummary" property="answer(policyNumber)" />
<bean:define id="policySubNumber" name="PolicySummary" property="answer(Object::Policy::PolicySubNum)" />

<bean:define id="custId" name="PolicySummary" property="answer(customerId)" />
<bean:define id="parentQuoteId" name="PolicySummary" property="answer(parentQuoteId)" />
<bean:define id="productVerId" name="PolicySummary" property="answer(productVerId)" />
<bean:define id="productId" name="PolicySummary" property="answer(productId)" />

<bean:define id="QuoteStatus" name="PolicySummary" property="answer(quoteStatus)" />
<bean:define id="SubQuoteVerId" name="PolicySummary" property="answer(subQuoteVerId)" />
<bean:define id="QuoteType" name="PolicySummary" property="answer(Object::Quote::QuoteType)" />
<bean:define id="SubQuoteId" name="PolicySummary" property="answer(subQuoteId)" />
<bean:define id="parentQuoteVerId" name="PolicySummary" property="answer(parentQuoteVerId)" />

<bean:define id="policyId" name="PolicySummary" property="answer(policyId)" />
<bean:define id="policyVerId" name="PolicySummary" property="answer(policyVerId)"  />
<bean:define id="parentPolicyVerId" name="PolicySummary" property="answer(Object::Policy::ParentPolicyVerId)"  />
<bean:define id="parentProductId" name="PolicySummary" property="answer(Object::Policy::ParentProductId)" />
<bean:define id="parentProductVerId" name="PolicySummary" property="answer(Object::Policy::ParentProductVerId)"  />

<bean:define id="nonRenewal" name="PolicySummary" property="answer(Object::Policy::NonRenewal)" />
<bean:define id="referRenewal" name="PolicySummary" property="answer(Object::Policy::ReferRenewal)" />

<bean:define id="prdid" name="PolicySummary" property="answer(Object::Quote::ProductId1)"  />
<bean:define id="paymentPlan" name="PolicySummary" property="answer(Object::Quote::PaymentPlan)"  />

<logic:empty name="PolicySummary" property="answer(policyId)">
	<% policyId = "" + request.getParameter("answer(policyId)"); %>
</logic:empty>

<logic:empty name="PolicySummary" property="answer(policyId)">
	<% policyVerId = "" + request.getParameter("answer(policyVerId)"); %>
</logic:empty>
<bean:define id="nonRenwal" name="PolicySummary" property="answer(nonRenwal)" />
<html:hidden property="answer(nonRenwal)" name="PolicySummary" styleId="nonRenwal" value="<%=""+nonRenwal %>" />
<html:hidden property="answer(policyId)" name="PolicySummary" styleId="policyId" value="<%=""+policyId %>" />
<html:hidden property="answer(parentQuoteVerId)" name="PolicySummary" styleId="parentQuoteVerId" value="<%=""+parentQuoteVerId %>" />
<html:hidden property="answer(SubjectivityParentObjectType)" value="POLICY" styleId="SubjectivityParentObjectType" />
<html:hidden property="answer(policyVerId)" name="PolicySummary" value="<%=""+policyVerId %>" styleId="policyVerId" />
<html:hidden property="answer(parentPolicyVerId)" name="PolicySummary" value="<%=""+parentPolicyVerId %>" styleId="parentPolicyVerId" />
<html:hidden name="PolicySummary" property="answer(customerId)" styleId="custId"/>
<html:hidden name="PolicySummary" property="answer(productVerId)" styleId="productVerId"/>
<html:hidden property="answer(Object::UserDetail::ownerId)" name="LoginPage"  styleId="ownerId"/>
<html:hidden name="PolicySummary" property="answer(Object::Agency::AgencyId)" styleId="agencyId" />
<html:hidden name="PolicySummary" property="answer(policyNumber)" styleId="policyNumber" />
<html:hidden name="PolicySummary" property="answer(subQuoteId)" styleId="subQuoteId11" />
<html:hidden name="PolicySummary" property="answer(parentQuoteId)" styleId="parentQuoteId" />
<html:hidden name="PolicySummary" property="answer(productId)" styleId="productId" />
<html:hidden property="answer(Object::Policy::ParentProductId)" name="PolicySummary" styleId="parentProductId" value="<%=""+parentProductId %>" />
<html:hidden property="answer(Object::Policy::ParentProductVerId)" name="PolicySummary" styleId="parentProductVerId" value="<%=""+parentProductVerId %>" />
<html:hidden property="answer(Object::Policy::NonRenewal)" name="PolicySummary" styleId="nonRenewal" value="<%=""+nonRenewal %>" />
<html:hidden property="answer(Object::Policy::ReferRenewal)" name="PolicySummary" styleId="referRenewal" value="<%=""+referRenewal %>" />
			 					 			 				 		
<% String cancellationAvailable = ""+nonRenwal;
String policySubNum="";
String defaultTab="";
if(request.getAttribute("DEFAULT_POLICY_TAB")!=null){
	defaultTab = ""+request.getAttribute("DEFAULT_POLICY_TAB");
}else if(request.getAttribute("answer(DEFAULT_POLICY_TAB)")!=null){
	defaultTab = ""+request.getAttribute("answer(DEFAULT_POLICY_TAB)");
}else if(request.getParameter("answer(DEFAULT_POLICY_TAB)")!=null){
	defaultTab = ""+request.getParameter("answer(DEFAULT_POLICY_TAB)");
}
%>
<html:hidden property="answer(DEFAULT_POLICY_TAB)" styleId="dfaultPolicyTab" value="<%=""+defaultTab %>"/>


<%String conditionFlag = "N"; %>
<%String EndoProductName=""; %>
<%if(request.getAttribute("conditionFlag") != null){
	conditionFlag = "Y";
}
	
%>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
			<html:hidden property="answer(deleteAttachment)" value="true" styleId="deleteAttachmentNotes"/>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="false">
			<html:hidden property="answer(deleteAttachment)" value="false" styleId="deleteAttachmentNotes"/>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="true">
			<html:hidden property="answer(EmailViewPrevilegeAvail)" value="true" styleId="EmailViewPrevilegeAvail"/>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="false">
			<html:hidden property="answer(EmailViewPrevilegeAvail)" value="false" styleId="EmailViewPrevilegeAvail"/>
</dmshtml:dms_static_with_connector>


<bean:define id="agencyId" name="PolicySummary" property="answer(Object::Agency::AgencyId)"  />

<bean:define id="applicationType" name="PolicySummary" property="answer(applicationType)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<%
	long submissionId = 0;
	long submissionVerId = 0;
	if(request.getParameter("answer(Object::Quote::SubmissionId)")!=null){
		submissionId = Long.parseLong(""+request.getParameter("answer(Object::Quote::SubmissionId)"));
	} if(request.getParameter("answer(Object::Quote::SubmissionVerId)")!=null){
		submissionVerId = Long.parseLong(""+request.getParameter("answer(Object::Quote::SubmissionVerId)"));
} %>
<!-- <table width="100%"> -->
<% String DocumentType = "ISSUANCE"; %>
<% String policyStatus = ""; %>
<% String ratingTerritory = "0"; %>
<% String ratingTerritoryName = ""; %>
<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >			
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr height="10">
		<td>
		</td>
	</tr>
	<tr>
		<td width="100%" bgcolor="#C6DEEA">
			<jsp:include page="../common/CustomerAgencyLinkspage.jsp">
				<jsp:param name="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
			</jsp:include>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
</logic:notEqual>
<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	<tr>
		<td>

			<jsp:include page="../common/DynamicPolicyHeader.jsp">
				<jsp:param name="policyId" value="<%=policyId.toString()%>" />
				<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
				<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
				<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
			</jsp:include>
		 </td>
  	</tr>
</table> 
</logic:notEqual>
<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
<tr><td><div id="manuScript"><div id='Manuscript_CONT'></div></div></td></tr>
<tr><td><div id="subjDetail"><div id="SUB_CONT"></div></div></td></tr>
<tr><td><div id="AttachFiles"></div></td></tr>
<tr><td><div id="AddNotespopup" style="display:none"></div></td></tr>
</table>
<dmshtml:isActivePolicy policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<%String isActivePolicy =(String) request.getAttribute("isActivePolicy");  
  String bgcolor ="#C6DEEA";
  String headerName ="dolphinnav";
  String bodyDiv = "dolphincontainer1";
  String applicationHeaderName ="dolphinsubnav";
  String policyDetailHeader = "NewSectionHead";
   if (!(isActivePolicy.equals("Y"))){
	   bgcolor ="#CCCCCC";
	   headerName ="priorpolicydolphinnav";
	   bodyDiv = "dolphincontainerActive1";
	   applicationHeaderName ="oldPolicydolphinsubnav";
	   policyDetailHeader ="NewSectionHead1";
   }

%>
<bean:define id="policyverPolicyNumber" name="PolicySummary" property="answer(policyVer::policyNumber)" />	
<html:hidden property="answer(policyVer::policyNumber)" name="PolicySummary" styleId="policyverPolicyNumber" value="<%=""+policyverPolicyNumber %>" />
<%
String isRenewalFlag = "N";
String renewalPolicyVerId = "";
String renewalPolicyId = "";
String primaryParentQuoteId = "";
String primarySubQuoteId = "";
String primaryParentQuoteVerId = "";
String primarySubQuoteVerId = "";		   		
if(!(""+policyverPolicyNumber).equals("")) { %>
<dmshtml:GetParentPolicyInfo nameInSession="currentPolicyVerId" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="<%=""+policyverPolicyNumber%>" />		
<%} %>
<logic:present name="currentPolicyVerId">
<bean:define id="parentPolicyMap" name="currentPolicyVerId" type="com.dms.ejb.data.QuestionHashMap" />
		   		<%
		   		renewalPolicyVerId = parentPolicyMap.getString("Object::Policy::RenewalPolicyVerId");
		   		renewalPolicyId = parentPolicyMap.getString("Object::Policy::RenewalPolicyId");
		   		primaryParentQuoteId = parentPolicyMap.getString("Object::Policy::PrimaryParentQuoteId");
		   		primarySubQuoteId = parentPolicyMap.getString("Object::Policy::PrimarySubQuoteId");
		   		primaryParentQuoteVerId = parentPolicyMap.getString("Object::Policy::PrimaryParentQuoteVerId");
		   		primarySubQuoteVerId = parentPolicyMap.getString("Object::Policy::PrimarySubQuoteVerId");		   		
		   		%>
		   		<%if(!renewalPolicyVerId.equals("") && !renewalPolicyId.equals("")) {
		   			isRenewalFlag = "Y";
		   		}
		   		%>
		   		<html:hidden property="answer(renewalPolicyId)" name="PolicySummary" styleId="renewalPolicyId" value="<%=""+renewalPolicyId %>" />
		   		<html:hidden property="answer(renewalPolicyVerId)" name="PolicySummary" styleId="renewalPolicyVerId" value="<%=""+renewalPolicyVerId %>" />
</logic:present>
<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId %>" policyNumber="<%=""+policyNumber%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" documentType='<%=DocumentType%>' />

										
					<% String riskState="";%>
					<% String dmsRiskId = "";%>
					<% String polRiskId = "";%>
					<% String totalPremium ="";%>
					<% String policyEffdate ="";%>
					<% String policyExpdate ="";%>
					<logic:present name="policyHeaderInfo">
						<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plPolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
						<%totalPremium =""+plPolicyDetail.getMTotalPremium();%>
						<%policyEffdate =""+plPolicyDetail.getPolicyEffDate();%>
						<%policyExpdate =""+plPolicyDetail.getPolicyExpDate();%>
						<%policyStatus =plPolicyDetail.getPolicyStatus();%>
						<%String quoteNum =""+plPolicyDetail.getQuoteNumber();%>
						<%String quoteSubNum =""+plPolicyDetail.getQuoteSubNumber();%>	
						<%policySubNum =""+plPolicyDetail.getPolicySubNumber();%>
<html:hidden property="answer(policyExpdate)" name="PolicySummary" styleId="policyExpdate" value="<%=""+policyExpdate %>" />						
<html:hidden property="answer(quoteNum)" name="PolicySummary" styleId="quoteNum" value="<%=""+quoteNum %>" />
<html:hidden property="answer(quoteSubNum)" name="PolicySummary" styleId="quoteSubNum" value="<%=""+quoteSubNum %>" />
		
										
						<%//if(plPolicyDetail.getPLResPropertyList().size()!=0){ 
									java.util.ArrayList arrPLResPropertyDetail = plPolicyDetail.getPLResPropertyList();
							%>		 
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr><td colspan="4">&nbsp;</td></tr>
	<tr>
	<%String strPolicySubNumber="";
	if (policySubNum.equals("0"))
		strPolicySubNumber="";
	else
		//strPolicySubNumber=" - "+policySubNum;
		 
		 %>
	
	  <td width="30%"><div  style ="font-style:bolditalic;font-size:14pt;">Policy&nbsp;<%=""+policyverPolicyNumber%><%=""+strPolicySubNumber %></div></div></td>
    </tr>
    <tr><td colspan="4">&nbsp;</td></tr>
	  <tr>
		<td  width="25%" class="links" >
		
			
				
			<!--########################## SUBMISSION SUMMARY #########################################-->
     			<dmshtml:GetSubmissionDetailByQuoteId nameInSession="submissionDetailByQuoteId" quoteId="<%=Long.parseLong(parentQuoteId.toString())%>" ownerId='<%=Long.parseLong(ownerId.toString())%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
			<logic:present name="submissionDetailByQuoteId" scope="request">
			<bean:define id="subDetailMap" name="submissionDetailByQuoteId" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
			<bean:define id="subIdByQuoteId" name="subDetailMap" property="Object::Submission::SubmissionId" />
			<bean:define id="subVerIdByQuoteId" name="subDetailMap" property="Object::Submission::SubmissionVerId" />
			<bean:define id="custIdByQuoteId" name="subDetailMap" property="Object::Submission::CustomerId" />
				<logic:greaterThan name="subIdByQuoteId" value="0">
				<logic:greaterThan name="subVerIdByQuoteId" value="0">
					<logic:greaterThan name="custIdByQuoteId" value="0">										
								<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=Long.parseLong(subVerIdByQuoteId.toString())%>&answer(Object::Submission::SubmissionId)=<%=Long.parseLong(subIdByQuoteId.toString())%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=Long.parseLong(custIdByQuoteId.toString())%>&customerId=<%=Long.parseLong(""+custIdByQuoteId)%>&answer(Object::Customer::CustomerId)=<%=Long.parseLong(""+custIdByQuoteId)%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=Long.parseLong(""+custIdByQuoteId)%>" class="button2" style="width:200px" title="<bean:message key='ToolTip.PolicySummary.Submission'/>"> Go to Submission Summary </a>																	
					</logic:greaterThan>
				</logic:greaterThan>
			</logic:greaterThan>
			</logic:present>			
			<!--########################## SUBMISSION SUMMARY #########################################-->
			</td>
			<td width="25%" class="links"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+custId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>" title="<bean:message key='ToolTip.PolicySummary.InsuredRecord'/>" class="button2" style="width:200px" />Go to Insured Master Record</a> </td>
			<td width="20%" class="links"><a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>" title="<bean:message key='ToolTip.PolicySummary.QuoteSummary'/>" class="button2" style="width:150px">Go to Original Quote</a> </td>
			
			
		      <%isActivePolicy =(String) request.getAttribute("isActivePolicy");  %>
	
	
	     <%if(isActivePolicy.equals("N")){ %>
	    	 <% String currentPolicyVerId = (String)request.getAttribute("currentVerId"); %>
	    
			<td  width="15%" class="links"><a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyId)=<%= ""+policyId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>" class="button2" style="width:150px" title="<bean:message key='ToolTip.PolicySummary.ActivePolicy'/>">Go to Active Policy</a></td>
		<%} %>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
        <dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' 			
		connector='or' negated="true">

	<td width="9%" align="right">
	<a href="../SearchActivityManagerAction7.do?TabPanelName=Policy_Panel&answer(policyId)=<%=""+policyId %>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Activity::ObjectId)=<%=""+policyId%>&answer(Object::Activity::PageNum)=0&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(Object::Activity::ObjectType)=<%="Policy "%>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(parentQuoteVerId)=<%=""+parentQuoteVerId%>&isRenewal=<%=""+isRenewalFlag%>" title="<bean:message key='ToolTip.PolicySummary.ActivityLog'/>">Activity Log </a>
	</dmshtml:dms_static_with_connector>
	</td>
	<td  width="20%">	
	<%if(!policyStatus.equalsIgnoreCase("Issued") && !policyStatus.equalsIgnoreCase("Canceled") && isActivePolicy.equalsIgnoreCase("Y") && !policyStatus.equalsIgnoreCase("Expired")){%>
	  <%if(isRenewalFlag.equals("Y")) { %>
	  	<span title="<bean:message key='ToolTip.PolicySummary.IssueRenewal'/>"> <html:button value="Issue Renewal" property="answer(IssuePolicy)" onclick="this.disabled=true;document.IssuePolicyFrm.submit();"  styleId="IssuePolicySubmit" styleClass="covbutton1" /></span>
	  <%} else { %>
	  	<span title="<bean:message key='ToolTip.PolicySummary.IssuePolicy'/>"> <html:button value="Issue Policy" property="answer(IssuePolicy)" onclick="this.disabled=true;document.IssuePolicyFrm.submit();"  styleId="IssuePolicySubmit" styleClass="covbutton" /></span>
	  <%} %>
	<%} %>
	
	</td>			 	
    </tr>
    <tr>
					<td>&nbsp;</td>
				</tr>	
    <tr>
					<td class="NewSectionHead" colspan="5" align="center">POLICY SUMMARY</td>
				</tr>	
		<logic:present name="FailureMessage" scope="request">
			<tr>
				<td class="Error">
					Payment Failure Due to Payment Amount Exceeds
				</td>
			</tr>
		</logic:present>				
		<logic:present name="SuccessMessage" scope="request">
		<tr>
		<td class="Error">
		Payment Successful 
		</td>
		</tr>
		</logic:present>
	<tr>
		<td colspan="4">&nbsp;
		</td>
	</tr>
	</table>


<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	<tr>
		<td>

			<jsp:include page="../common/PolicyHeaderCoverMin.jsp">
				<jsp:param name="policyId" value="<%=policyId.toString()%>" />
				<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
			    <jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
				<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
                <jsp:param name="parentQuoteVerId" value="<%=""+parentQuoteVerId%>" />
                <jsp:param name="renewalPolicyVerId" value="<%=""+renewalPolicyVerId%>" />
                <jsp:param name="renewalPolicyId" value="<%=""+renewalPolicyId%>" />
                <jsp:param name="isRenewalFlag" value="<%=""+isRenewalFlag%>" />
                <jsp:param name="primaryParentQuoteId" value="<%=""+primaryParentQuoteId%>" />
                <jsp:param name="primarySubQuoteId" value="<%=""+primarySubQuoteId%>" />
                <jsp:param name="primaryParentQuoteVerId" value="<%=""+primaryParentQuoteVerId%>" />
                <jsp:param name="primarySubQuoteVerId" value="<%=""+primarySubQuoteVerId%>" />
                <jsp:param name="parentPolicyVerId" value="<%=""+parentPolicyVerId%>" />
				<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
			</jsp:include>
		 </td>
  	</tr>
  	<tr><td>&nbsp;</td></tr>
</table> 
 <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0">
				
				
			</table>
		</td>
	</tr>
	<logic:present name="SUBJECTIVITY_RULE_FAILED">
		<table border="0" cellpadding="0" cellspacing="0" width="97%"  align="center">
		<tr>
			<td class="Error">
				A policy cannot be issued until the following post-bound subjectivity requirement is satisfied or the requirement is waived by an underwriter.
				<html:hidden property="answer(error_subjecticity)" styleId="subjectivityError" value="YES"/>
			</td>			
		</tr></table>	
		</logic:present>
	<tr>
		<td>
			       <form name="IssuePolicyFrm" action="/IssanceSubjectivityVerfication.do" method="post">
			        <dmshtml:GetQuoteDetailsByPolicyId nameInSession="QuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 		 <% String renewalQuote =""+request.getAttribute("Object::Renewal::Quote::QuoteId");
			 		 	String renewalSubQuote  = ""+request.getAttribute("Object::Renewal::Quote::SubQuoteId");
			 		 	String renewalQuoteverId =""+request.getAttribute("Object::Renewal::Quote::QuoteVerId");
			 		 	String isRenewal = ""+request.getAttribute("isRenewal");
			 		 %>
			 		  
			 		<!--  Values for Issue Policy -->
			 		<html:hidden property="answer(DocumentListSource)" value="Policy" />
			 		<html:hidden property="answer(policyId)"  value="<%= ""+policyId%>" />	
			 		
			 		
			 		<html:hidden property="answer(policyVerId)"  value="<%= ""+policyVerId%>" />				 		
			 		<html:hidden property="answer(DocumentType)" value="ISSUANCE" />
			 		
			 		<%if(isRenewal.equals("Y")){ %>
						<html:hidden property="answer(QuoteId)" value="<%=""+renewalQuote%>" /> 	
					<%}else{ %>	 	
						<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 
					<%} %>	
					
			 		<html:hidden property="answer(ownerId)" value='<%=""+ownerId%>' styleId="ownerIdfrmjsp" />
			 		<html:hidden property="answer(ProductVerId)" value="<%= ""+productVerId%>" />
			 		<html:hidden property="answer(Object::Customer::CustomerId)"  value="<%= ""+custId%>" />
			 		<html:hidden property="answer(customerId)" value="<%= ""+custId%>" />	
			 		<html:hidden property="answer(isPreview)" value="false" />
			 		<html:hidden property="answer(Object::Agency::AgencyId)"  value="<%= ""+agencyId%>" />	
			 		<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
			 		<html:hidden property="answer(Object::Policy::ResProperty::Statecode)" value="<%=""+riskState%>"/>
			 		<html:hidden property="answer(DEFAULT_POLICY_TAB)" value ="DOCUMENTS" />
			 		
			 					 		
			 		<!-- Policy Summary -->
			 		
			 		<html:hidden property="answer(polParentQuoteId)" value='<%=""+parentQuoteId %>'/>
			 		<html:hidden property="answer(polProductVerId)" value='<%=""+productVerId%>' />
			 		<html:hidden property="answer(polProductId)" value='<%=""+productId%>' />
			 		<html:hidden property="answer(Object::Quote::QuoteStatus)" value='<%=""+QuoteStatus%>' styleId="paretQuoteStatus"/>
			 		<html:hidden property="answer(polSubVerQuoteId)" value='<%=""+SubQuoteVerId %>' styleId="subQuoteVerId"/>
					<html:hidden property="answer(Object::Quote::QuoteType)" value='<%=""+QuoteType %>'/>
					<html:hidden property="answer(polSubQuoteId)" value='<%=""+SubQuoteId %>'/>
					<html:hidden property="answer(applicationType)" value='<%=""+applicationType %>'/>					
			 		<html:hidden property="answer(Object::UserDetail::userName)" value='<%=""+usernameId%>'/>
			 		<html:hidden property="answer(isUpdated)" value="Y" />
					<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Policy"%>"/>
					<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Policy Management"%>"/>
				
					<html:hidden property="answer(pagename)" value="Quote summary" />
	
			 		<html:hidden property="answer(Quote::Page)" value="StatusChange" />
			 		<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Issued" />

			 		
					<html:hidden property="answer(Object::Policy::TotalPremium)" styleId="TotalPremium" value="<%=""+totalPremium%>" />				 					 		
					<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" styleId="CreatedByfrmjsp" />
					<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" styleId="UpdatedByfrmjsp"  />
					<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
					<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
					<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden  property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=""+SubQuoteVerId%>" />
					<html:hidden property="answer(subquoteVerId)" value="<%=""+SubQuoteVerId%>" />
					
					<%if(isRenewal.equals("Y")){ %>
								<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+renewalQuote %>" />	
								<html:hidden property="answer(subQuoteId)" value="<%=""+renewalSubQuote %>" /> 			
								<html:hidden property="answer(QuoteId)" value="<%=""+renewalQuote %>" /> 
								<html:hidden property ="answer(isRenewalQuoteToIssue)" value ="Y" />
								<html:hidden property="answer(isRenewal)" styleId="isRenewal" value="true" /> 	
						<%}else{ %>	 	
								<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" />	
								<html:hidden property="answer(subQuoteId)" value="<%=""+SubQuoteId%>" /> 			
								<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 	
						<%} %>																								
					<html:hidden property="answer(userId)" value="<%=userId.toString()%>" />
					<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
					<html:hidden property="answer(productId)" value="<%=""+productId%>" />
					<html:hidden property="answer(productVerId)" value="<%=""+productVerId%>" />
					<html:hidden property="answer(parentQuoteType)" value="<%=""+QuoteType%>" />
					<html:hidden property="answer(UnderWriterWorkSheet)" value="No" />
					<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
					<html:hidden property="answer(OwnerId)" value='<%= ""+ownerId%>' />
					<html:hidden property="answer(ownerId)" value='<%= ""+ownerId%>' />
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
					<html:hidden property="answer(email)" value="<%=""+email %>" styleId="email"/>
					<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
				<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>
					<html:hidden property="answer(Object::Quote::isEndorsementQuote)" value="false" styleId="isEndorsementQuote" />
					
					</form>
		</td>
	</tr>
	<tr>
		<td align="left" width="100%">
			<div>						
				
				 <div id="PolicySummary" class="innercontent">  
					<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">	
																		
					<!-- Policy summary tab contents STArt -->	
						<dmshtml:GetDynamicPolicySummary nameInSession="policysummarycontent" policyId="<%=Long.parseLong(""+policyId)%>" policyVerId="<%=Long.parseLong(""+policyVerId)%>" parentQuoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+productId)%>" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="POLICY_SUMMARY_TAB_ALGORITHM"  DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 						
					</table>
			 	</div> 
				
				<dmshtml:GetPolicyInsured nameInSession="policyinsured" parentPolicyId="<%=Long.parseLong(""+policyId)%>" parentPolicyVerId="<%=Long.parseLong(""+policyVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>					
			 	
				<dmshtml:GetPolicyApplicationSummary nameInSession="PolicyApplication" policyId="<%=Long.parseLong(""+policyId) %>" policyVerId="<%=Long.parseLong(""+policyVerId) %>" applicationType="<%=""+applicationType %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />			 				
	 			
	 			
	 			<dmshtml:GetPolicyBillingPaymentInfo nameInSession="PolicyBillingAndPayment" ownerId="<%=Long.parseLong(""+ownerId)%>" policyId="<%=Long.parseLong(""+policyId) %>" policyVerId="<%=Long.parseLong(""+policyVerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> 
	 			<%double totalInstallmentFee = 0; %>
	 			<%double totalInstallmentPayment = 0; %> 		
				</div>	 
					
										
					
				
			 		
			 		

				<dmshtml:GetPolicyDocumentSummary documentType='<%=DocumentType%>' nameInSession="PolicyDocument" ownerId='<%=""+ownerId %>'  policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>								 							 		
				</logic:present>					 				
		</td>
	</tr>
	<tr>
     <td width="100%" colspan="2">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td align="left" valign="top">
				<div id="DocumentPopUp" style="display:none;">
					<div class="hd" id="Documentheading"></div>
					<div class="formhead" align="right"><h2 class="right"></h2>
				
					</div>      
						<div class="Applicationpage2">
					<div class="bd" id="DocumentPopUpBody">
					</div>
					</div>
					<a class="container-close" href="javascript:void(0);" id="closeIcon3"></a>
				</div>
		
				</td>
			</tr>
		</table>

  </td>
</tr>
	
</table>
<%			 	
if (!(isActivePolicy.equals("Y"))){
	   bgcolor ="#CCCCCC";
}else{
	bgcolor="";
}	 %>		 	
		
<div align="left" id="Doc" style="display:block">
<div class="formpagenew1">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">	 
   
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">	 
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="105px" cellspacing="0" cellpadding="0" class="todotab_active" height=35 id="DocumentationTab" onclick="javascript:loadDocumentationTab(this.id,'../attachment/QuoteAttachmentResult.jsp','../notes/NotesResult.jsp','../email/SentEMailListUI3.jsp');">
				<tr>
					<td align="center"  Style="Cursor:hand">Documentation</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4" ></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="130px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  id="CoveragesLimitsTab"  onclick="javascript:loadPolicySummaryTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Coverages and Limits</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="125px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="GeneralQuestionTab" onclick="javascript:loadGeneralQuestionsTab(this.id);">
				<tr>
					<td align="center" Style="Cursor:hand">General Questions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="125px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="LocationTankTab" onclick="javascript:loadPolicyLocationList(this.id);" >
				<tr>
					<td align="center"  Style="Cursor:hand">Locations and Tanks</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
		 	<table border="0" width="95px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="SubjectivityTab" onclick="javascript:loadSubjectivityTab(this.id);refreshPolicyPostBind();refreshPolicyPreBind();refereshMultiAttachmentList('<%if(!primaryParentQuoteId.equals("")){%><%=""+primaryParentQuoteId%><%}else{%><%=""+parentQuoteId%><%}%>','<%=""+ownerId %>','Subjectivity');refereshMultiNotesList('<%if(!primaryParentQuoteId.equals("")){%><%=""+primaryParentQuoteId%><%}else{%><%=""+parentQuoteId%><%}%>','<%=""+ownerId %>','Subjectivity');">
				<tr>
					<td align="center"  Style="Cursor:hand">Subjectivities</td>
				</tr>
			</table>
         </td>
         <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_RATING_DETAIL"}%>' connector='or' negated="true">
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="125px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="RatingDetailTab" onclick="javascript:loadRatingDetailTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Rating/UW Worksheet</td>
				</tr>
			</table>
         </td>
         </dmshtml:dms_static_with_connector>
         <td valign="top" class="todotab_space" ><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom >
    		 <table border="0" width="95px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="EndorsementTab" onclick="javascript:loadEndorsementTab(this.id);" >
				<tr>
					<td align="center"  Style="Cursor:hand">Endorsements</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space" ><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom >
    		 <table border="0" width="85px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="RenewalTab" onclick="javascript:loadRenewalTab(this.id);" >
				<tr>
					<td align="center"  Style="Cursor:hand">Renewal</td>
				</tr>
			</table>
         </td>
       </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>




	


  <tr>
    <td width="950px" colspan="2">
  		 <table border="0" width="950px" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
  		 <tr>
				<td align="left" valign="top"><br>
	<div id="PolicyDiv" style="background-color:<%=bgcolor%>;">
	
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
			 		
			 			<tr height="30">
			 				<td class="FormLabels" colspan="3">
			 					Generated Documents<% %>
			 				</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels" width="15%">
			 					S.No
			 				</td>
			 				<td class="FormLabels" width="25%">
			 					Documents
			 				</td>
			 				<td class="FormLabels" width="20%">
			 					Generated By 
			 				</td>
			 				<td class="FormLabels" width="40%">
			 					Generated Date 
			 				</td>
			 			</tr>
			 			<tr>
			 				<td class="TextMatter1" width="15%">
					 			1
				 			</td>
					 			
				 			<td class="TextMatter1" width="25%">
				 			<%if(primaryParentQuoteId.equals("")) { %>
				 			<a href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= parentQuoteId.toString()%>&answer(subQuoteId)=<%=SubQuoteId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteStatus)=<%=QuoteStatus.toString()%>' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
				 			<%} else { %>
				 			<a href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= primaryParentQuoteId.toString()%>&answer(subQuoteId)=<%=primarySubQuoteId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteStatus)=<%=QuoteStatus.toString()%>' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
				 			<%} %>
				 			</td>
				 			<td  class="TextMatter1" width="20%">
				 			</td>
				 			<td class="TextMatter1" width="40%">
				 			</td>
				 		</tr>
			 			<%int indx1=1; %>
			 			<%if(!policyStatus.equalsIgnoreCase("ISSUED") && !policyStatus.equalsIgnoreCase("CANCELED") && !policyStatus.equalsIgnoreCase("EXPIRED")){%>
			 			<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance","CERTIFICATE OF INSURANCE","CORRESPONDENCE","CANCELLATION NOTICE","NON RENEWAL NOTICE"}%>' nameInSession="PolDocLoc1" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 			<logic:present name="PolDocLoc1">			 				
			 				<%
			 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc1");
								for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
									com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
								%>			 				
	 			
					 			<%indx1++; %>
					 			<tr>
					 				<td class="TextMatter1" width="15%">
					 				<%=indx1 %>
					 				</td>
					 				<td class="TextMatter1" width="25%">		
	
					 				<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getDocumentUrl()%>')">
		   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
					 					<%=""+polDocDetail.getPolicyDocName() %>
					 					</a>
					 				</td>
					 				<td class="TextMatter1" width="20%" >
					 					<%=""+polDocDetail.getCreatedBy().replaceAll("<","&lt;").replaceAll(">","&gt;") %>
					 				</td>
					 				<td class="TextMatter1" width="40%">
					 					<%=""+polDocDetail.getCreatedDate() %>
					 				</td>
					 			</tr>
					 			
					 			<%						
								}					 			
					 			%>
			 			</logic:present>
			 			
			 			
			 			
			 			<%}else{%>
			 				<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance","CERTIFICATE OF INSURANCE","CORRESPONDENCE","CANCELLATION NOTICE","NON RENEWAL NOTICE"}%>' nameInSession="PolDocLoc" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 			<%int indx2=1; %>
							 			<logic:present name="PolDocLoc">			 				
							 				<%	
							 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc");
												for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
													com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
												%>			 				
					 						 			
									 			<%indx2++; %>
									 			<tr>
									 				<td class="TextMatter1" width="15%">
									 				<%=indx2 %>									 				
									 				</td>
									 				<td class="TextMatter1" width="25%">					 				
									 				<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getDocumentUrl()%>')">
						   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
									 					<%=""+polDocDetail.getPolicyDocName() %>
									 					</a>
									 				</td>
									 				<td class="TextMatter1" width="20%" >
									 					<%=""+polDocDetail.getCreatedBy().replaceAll("<","&lt;").replaceAll(">","&gt;") %>
									 				</td>
									 				<td class="TextMatter1" width="40%">
									 					<%=""+polDocDetail.getCreatedDate() %>
									 				</td>
									 			</tr>
									 			
									 			<%						
												}					 			
									 			%>
							 				
							 			</logic:present>				
				 									 						
				 						
			 			<%} %>
			 			<tr height="30">
			 			<td>&nbsp;</td>
			 			</tr>
			 			</table>
			 			
			 			<table WIDTH="100%" ALIGN="center"  BORDER="0" CELLSPACING="0" CELLPADDING="0">
			 					 			
			 			<%if(!policyStatus.equalsIgnoreCase("Issued")&& !policyStatus.equalsIgnoreCase("CANCELED") && !policyStatus.equalsIgnoreCase("EXPIRED")){%>

			 			<dmshtml:dms_isPresent property="<%=new String[]{"BOUND"}%>" value="<%=QuoteStatus.toString()%>" negated="true" >
			 			<tr height="30">
			 				<td class="FormLabels" colspan="3">Selected Policy Forms</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels" width="10%">S.No
			 				</td>
			 				<td class="FormLabels" width="20%">Document Identifier
			 				</td>
			 				<td class="FormLabels" width="60%" >Document Title
			 				</td>
							<td width="10%"> </td>
			 			</tr>
			 			<%int index=0; %>
			 			<%int count=0; %>
			 		
			 			<logic:present name="PolicyDocument">
			 			<%String docName="DOC_NAME_"; int docIndex=0;  %>
			 			<% java.util.ArrayList PolicyDocumentDet= (java.util.ArrayList)request.getAttribute("PolicyDocument"); %>
			 			<%if(PolicyDocumentDet.size()>0){%>
			 			<logic:iterate id="PolDocument" name="PolicyDocument">	
			 			<% ++docIndex; %>	 
			 			<bean:define property="polPolicyDocId" name = "PolDocument" id="polPolicyDocId"/>
			 			<bean:define property="dmsDocsId" name = "PolDocument" id="dmsDocsId"/>
			 			<bean:define property="dmsDocVerId" name = "PolDocument" id="dmsDocVerId"/>
			 			<bean:define property="applicationVerId" name = "PolDocument" id="applicationVerId"/>
			 			<bean:define property="applicationId" name ="PolDocument" id="applicationId"/>
			 			<%long appId = 0;
			 			long appVerId = 0;
			 			String strAppId = ""+applicationId;
			 			String strAppVerId = ""+applicationVerId;
			 			 if(!strAppId.equals("")){
			 				 
			 				appId = Long.parseLong(strAppId);
			 				
			 			 }
			 			 if(!strAppVerId.equals("")){
			 				 
			 				appVerId = Long.parseLong(strAppVerId);
			 			 }
			 			%>
			 			<%com.dms.ejb.insurance.policy.PolicyDocumentDetail policyDocDetail = (com.dms.ejb.insurance.policy.PolicyDocumentDetail)PolicyDocumentDet.get(index); %>			 			
			 			<%index++; %>
			 			<%if(policyDocDetail.getGenerateDocument()== null) {%>		
			 				<tr height="20">
					 				<td class="TextMatter1" width="10%">		
					 				<%count++; %>			 				
					 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="20%">
					 				<bean:write name="PolDocument" property="documentNum"/>
					 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" id="<%=docName+docIndex %>" >
					 				<bean:write name="PolDocument" property="policyDocName"/>
					 				</td>			 					
					 		</tr>	 						 			
			 			<%} else if(policyDocDetail.getGenerateDocument().equals("Y") || policyDocDetail.getGenerateDocument().equals("")) {%>
				 			<tr height="20">
					 				<td class="TextMatter1" width="10%">
						 				<%count++; %>
						 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="20%">
						 				<bean:write name="PolDocument" property="documentNum"/>
						 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="60%">
						 				<bean:write name="PolDocument" property="policyDocName"/></td>
									<td class="TextMatter1" width="10%">
						 				<%if(appId >0){%>
											<% boolean richEditorNeeded = true;
												if(appId == 193){
													richEditorNeeded = false;
												}%>
						 				<bean:define id="polDocName" name="PolDocument" property="policyDocName"/>
		     				  			<%String documentName = "" + polDocName;
		     				  				documentName = documentName.replaceAll("\\\\", "\\\\\\\\");
			     				  			documentName = documentName.replaceAll("'", "\\\\'");
			     				  			documentName = documentName.replaceAll("\"", "&#34;");%>
						 					<%if(richEditorNeeded){%>
												<a href="javascript:void(0);" onclick="showFillInFormPopUp('<%=""+appId%>','<%=""+appVerId %>','<%=""+polPolicyDocId %>','<%=""+dmsDocsId %>','<%=""+dmsDocVerId %>','<%=""+ documentName%>','<bean:write name="PolDocument" property="documentNum"/>-<bean:write name="PolDocument" property="documentSubNum"/>','<%=docName+docIndex %>' )"> Application </a>
											<%} else {%>
												<a href="javascript:void(0);" onclick="showFillinWithoutRichEditor('<%=""+appId%>','<%=""+appVerId %>','<%=""+polPolicyDocId %>','<%=""+dmsDocsId %>','<%=""+dmsDocVerId %>','<%=""+ documentName%>','<bean:write name="PolDocument" property="documentNum"/>-<bean:write name="PolDocument" property="documentSubNum"/>','<%=docName+docIndex %>' )"> Application </a>
										<%	}
						 				} %>	
					 				</td>			 					
					 				
					 		</tr>
					 	<%} %>
			 			</logic:iterate>
			 			<%}%>
			 			</logic:present>
			 		</dmshtml:dms_isPresent> 
			 			
		 			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>' connector='or' negated="true">
		 			
		 			<tr height="20">
		 			<td class="links" colspan="3">
		 				<a href="/PreviewIssuancePdf.go?TabPanelName=Policy_Panel&answer(DocumentListSource)=Policy&answer(policyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId%>&answer(DocumentType)=ISSUANCE&answer(QuoteId)=<%=""+parentQuoteId%>&answer(ownerId)=<%=""+ownerId%>&answer(ProductVerId)=<%=""+productVerId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(customerId)=<%=""+custId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(isPreview)=<%=true%>"  target="_new">Preview Issuance Document</a>		 					
		 			</td>
		 			</tr>
		 			</dmshtml:dms_static_with_connector>
		 			<%} %>
		 			<tr height="13">
			 			<td>&nbsp;</td>
			 			</tr>
			 			</table>
			 		<table WIDTH="100%" ALIGN="center"  BORDER="0" CELLSPACING="0" CELLPADDING="0">
			 		<%
			 		java.text.DateFormat formatter ; 
			 	    java.util.Date expdate;
			 	    formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
			 	    expdate = (java.util.Date)formatter.parse(policyExpdate);
			 	              
			 	              
			 	    java.util.Date now = new java.util.Date();  
			 	    java.util.Calendar cal = java.util.Calendar.getInstance();
			 	    cal.setTime(now);
			 	   java.util.Calendar expcal = java.util.Calendar.getInstance();
			 	   expcal.setTime(expdate);
			 	    
			 	    if(expcal.after(cal) && (isActivePolicy.equals("Y"))){
			 		%>
			 		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ENABLE_NOTICE_OF_CANCELLATION"}%>' connector='or' negated="true">	
			 		<%if(policyStatus.equalsIgnoreCase("Issued")|| policyStatus.equalsIgnoreCase("BOUND")) {%>
			 		<%if(cancellationAvailable.equalsIgnoreCase("Yes")){ %>
			 		<tr height="30">
			 				<td class="FormLabels" colspan="3" >
			 					Generate Notice of Cancellation<% %>
			 				</td>
			 		</tr>
			 		
			 		<tr height="30" >
			 			<td colspan="3" >
			 			
			 			<span title="<bean:message key='ToolTip.PolicySummary.NoticeOfCancellation'/>"> <html:button value="Create Notice of Cancellation" style="width:200px" property="answer(Cancellation)" onclick="confirmNoticeOfCancellation();"  styleId="CancellationSubmit" styleClass="covbutton" /></span>
			 			
			 			</td>
			 		</tr>
			 		<tr height="20">
			 			<td>&nbsp;</td>
			 		</tr>
			 		<%}
			 		} %>
			 		</dmshtml:dms_static_with_connector>
			 		<%} %>
			 		</table>
			 		<table>
			 	<tr>
			 	<td>
			 	<form id="NoticeOfCancellation" action="/CreateNoticeOfNonRenewal.do" method="post">
			        <dmshtml:GetQuoteDetailsByPolicyId nameInSession="QuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 		 <% String renewalQuote =""+request.getAttribute("Object::Renewal::Quote::QuoteId");
			 		 	String renewalSubQuote  = ""+request.getAttribute("Object::Renewal::Quote::SubQuoteId");
			 		 	String renewalQuoteverId =""+request.getAttribute("Object::Renewal::Quote::QuoteVerId");
			 		 	String isRenewal = ""+request.getAttribute("isRenewal");
			 		 %>
			 		 <html:hidden property="answer(DocumentListSource)" value="Policy" />
			 		<html:hidden property="answer(policyId)" name="CancellationNonrenewal" styleId="policyId" value="<%= ""+policyId%>" />	
			 		<html:hidden property="answer(Object::Policy::Document::Policyid)" styleId="policyId" value="<%= ""+policyId%>" />
			 		
			 		
			 		<html:hidden property="answer(policyVerId)"  value="<%= ""+policyVerId%>" />
			 		<html:hidden property="answer(Object::Policy::Document::Policyverid)"  value="<%= ""+policyVerId%>" />	
			 					 		
			 		<html:hidden property="answer(DocumentType)" value="CANCELLATION NOTICE" />
			 		<html:hidden property="answer(Object::Policy::Document::Documenttype)" value="CANCELLATION NOTICE" />
			 		<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 
										
			 		<html:hidden property="answer(ownerId)" value='<%=""+ownerId%>' styleId="ownerIdfrmjsp" />
			 		<html:hidden property="answer(ProductVerId)" value="<%= ""+productVerId%>" />
			 		<html:hidden property="answer(Object::Customer::CustomerId)"  value="<%= ""+custId%>" />
			 		<html:hidden property="answer(customerId)" value="<%= ""+custId%>" />	
			 		<html:hidden property="answer(isPreview)" value="false" />
			 		<html:hidden property="answer(Object::Agency::AgencyId)"  value="<%= ""+agencyId%>" />	
			 		<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
			 		<html:hidden property="answer(Object::Policy::ResProperty::Statecode)" value="<%=""+riskState%>"/>
			 		<html:hidden property="answer(DEFAULT_POLICY_TAB)" value ="DOCUMENTS" />
			 		
			 		<html:hidden property="answer(Object::Quote::QuoteType)" value="Cancellation"/>
			 		
			 		<html:hidden property="answer(polParentQuoteId)" value='<%=""+parentQuoteId %>'/>
			 		<html:hidden property="answer(polProductVerId)" value='<%=""+productVerId%>' />
			 		<html:hidden property="answer(polProductId)" value='<%=""+productId%>' />
			 		<html:hidden property="answer(polSubVerQuoteId)" value='<%=""+SubQuoteVerId %>' styleId="subQuoteVerId"/>
					
					<html:hidden property="answer(polSubQuoteId)" value='<%=""+SubQuoteId %>'/>
									
			 		<html:hidden property="answer(Object::UserDetail::userName)" value='<%=""+usernameId%>'/>
			 		<html:hidden property="answer(isUpdated)" value="Y" />
					<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Policy"%>"/>
					<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Notice of Cancellation"%>"/>
				
					<html:hidden property="answer(pagename)" value="Policy summary" />
	
			 		<html:hidden property="answer(Quote::Page)" value="StatusChange" />
			 		

			 		
								 					 		
					<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden  property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=""+SubQuoteVerId%>" />
					<html:hidden property="answer(subquoteVerId)" value="<%=""+SubQuoteVerId%>" />
					
						
								<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" />	
								<html:hidden property="answer(subQuoteId)" value="<%=""+SubQuoteId%>" /> 			
								<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 	
																													
					<html:hidden property="answer(userId)" value="<%=usernameId.toString()%>" />
					<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
					<html:hidden property="answer(productId)" value="<%=""+productId%>" />
					<html:hidden property="answer(productVerId)" value="<%=""+productVerId%>" />
					<html:hidden property="answer(UnderWriterWorkSheet)" value="No" />
					<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
					<html:hidden property="answer(OwnerId)" value='<%= ""+ownerId%>' />
					<html:hidden property="answer(ownerId)" value='<%= ""+ownerId%>' />
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
					<html:hidden property="answer(email)" value="<%=""+email %>" styleId="email"/>
					<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
				<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>
					<html:hidden property="answer(Object::Quote::isEndorsementQuote)" value="false" styleId="isEndorsementQuote" />
			 							
					</form>
			 	</td></tr></table>	

Attached Files
<div id="QUOTE_ATTACHMENT_LIST" style="word-wrap:break-word;"></div>
<%if(!primaryParentQuoteId.equals("")){ %>	
	<a href="javascript:void(0)" onclick="showAttach('<%=""+primaryParentQuoteId %>','0','QUOTE');" class="button2" style="width:100px">Add File</a>
<%} else { %>
	<a href="javascript:void(0)" onclick="showAttach('<%=""+parentQuoteId %>','0','QUOTE');" class="button2" style="width:100px">Add File</a>
<%} %>


<div id="AttachFiles"></div>
<div id="AddNotespopup" style="display:none"></div>

<br>
Diary Notes
<br>
		<div id="QUOTE_NOTES_LIST" style="word-wrap:break-word;"></div>
<%if(!primaryParentQuoteId.equals("")){ %>	
	<a href="javascript:void(0)" onclick="showNotes('<%=""+primaryParentQuoteId %>','0','Quote');" class="button2" style="width:100px">Add Notes</a>
<%} else { %>
	<a href="javascript:void(0)" onclick="showNotes('<%=""+parentQuoteId %>','0','Quote');" class="button2" style="width:100px">Add Notes</a>
<%} %>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="true">
<br>
Email
<br>
		<div id="QUOTE_EMAIL_LIST" style="word-wrap:break-word;"></div>

<a href="javascript:void(0)" onclick="sendEmailDetails();" class="button2" style="width:100px">Compose Email</a>
</div>
</dmshtml:dms_static_with_connector>
<script>
YAHOO.namespace("example.container");
//Wrap our initialization code in an anonymous function
//to keep out of the global namespace:
var myEditor;
var flag=0;

(function(){
var init = function() {
  //create the TreeView instance:
  var tree = new YAHOO.widget.TreeView("Emailtreediv");
  //get a reusable reference to the root node:
  var root = tree.getRoot();
  //First, create a parent node
  var SentEmails = new YAHOO.widget.HTMLNode('<html><head></head><body><table><tr><td>&nbsp;&nbsp;</td><td><a href="javascript:void(0);" onclick=showSentEmailSubNodes("sentEmailSuccess"); ><img src="/Images/emailIcon.jpg" border="0" height="18" width="18"> <font color="blue"> Emails Sent</font></a></td><td><div id="sentEmailCount"> </div></td></tr></table>', root, false);
  //EmailList.labelStyle = "icon-prv";
  var composeEmail = new YAHOO.widget.HTMLNode('<div id="composeEmail" style="display: none; return: false;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:void(0);" onclick="sendEmailDetails();" title="Email" > Compose Email</a></div>', root , false);
  var ViewSentEmail = new YAHOO.widget.HTMLNode('<div id="sentEmailSuccess" style="display: none; return: false;"> </div>', root , false);
  tree.draw();
  var ObjectId = document.getElementById("objId").value;
	 var OwnerId = document.getElementById("ownerId").value;
	 var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
	 var ajax = new Ajax.Updater({success: 'sentEmailCount'},'../email/GetSentEmailCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("sentEmailCount").innerHTML);}}); 
	   
  } 
 //Add an onDOMReady handler to build the tree when the document is ready
    YAHOO.util.Event.onDOMReady(init);

})();




</script>			 
			 	
			 	
			 	 					 	

	
	
<script type="text/javascript">
//to intitally load the documentation tab
	var quoteId=document.getElementById("parentQuoteId").value;
    var ownerId = document.getElementById("ownerId").value; 
	var quoteVerId="<%=parentQuoteVerId+""%>";
	refereshQuoteAttachmentList('<%if(!primaryParentQuoteId.equals("")){%><%=""+primaryParentQuoteId%><%}else{%><%=""+parentQuoteId%><%}%>',quoteVerId,ownerId,"QUOTE","../attachment/QuoteAttachmentResult.jsp");
	refereshQuoteNotesList('<%if(!primaryParentQuoteId.equals("")){%><%=""+primaryParentQuoteId%><%}else{%><%=""+parentQuoteId%><%}%>',ownerId,"QUOTE","../notes/NotesResult.jsp");
	refereshQuoteEmailList(quoteId,ownerId,"QUOTE","../email/SentEMailListUI3.jsp");
</script>		 		
				
				</td>
			  </tr>


		</table>
     </td>
   </tr>




 </table>
</div>
</div>

</div>
<div style="display:none" id="SubjectivityDiv">
<div id='LoaderIndicator' style="display:none">
<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
Loading....
</div>
<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
	<tr><td align="left">
		<div>&nbsp;</div>
		<div style="margin-left:10px">Post-Bind Subjectivities</div>
		<div>&nbsp;</div>
	</td></tr>																	
	<tr>
		<td>
		<form id="postbindSubjectivityMap">
		<html:hidden property="subjectivityObjectType" value="Subjectivity" styleId="subjectivityObjectType"/>
		<html:hidden property="subjectivityAlertObjectType" value="Quote" styleId="subjectivityAlertObjectType"/>
		<html:hidden property="RenewalQuoteId" value="<%=""+renewalQuote %>" styleId="RenewalQuoteId"/>
		<html:hidden property="RenewalQuoteverId" value="<%=""+renewalQuoteverId %>" styleId="RenewalQuoteverId"/>
			<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
				<tr class="locformhead1">
	                 <td class="dataSubjcolhead" width="100%" >
						<table border="0" id="table5" cellspacing="0" cellpadding="0">
							<tr>
							<%if(policyStatus.equalsIgnoreCase("BOUND")){%>							
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
								<td >
									
									<select onchange="if(this.value != '') {updatePoliySubjectivityStatus(this.form,this,'PostBindSubjctivtyId')}" name="answer(Object::Subjectivity::Status)">
									<option selected value=''>Change Status</option>
									<option value="Open">Open</option>
									<option value="Not Required">Not Required </option>
									<option value="Satisfied" value="Satisfied">Satisfied </option>
									<option value="Rejected">Rejected</option>	
									<option value="Post Issuance">Post Issuance</option>								
									</select>
									</div>
								</td>
								</dmshtml:dms_static_with_connector>
								<%} %>
								<td>
									<table border="0" align=right>
										<tr>
										<%if(!primaryParentQuoteId.equals("")){ %>
											<td><a href="javascript:void(0)" onclick="document.getElementById('subjectivityAlertObjectType').value='RenewalQuote';document.getElementById('subjectivityObjectType').value='RenewalQuotePostBindSubjectivity';document.getElementById('RenewalQuoteId').value='<%=""+renewalQuote %>';document.getElementById('RenewalQuoteverId').value='<%=""+renewalQuoteverId %>';showAttach('<%=""+primaryParentQuoteId %>','0','Subjectivity');" class="button2" style="width:100px">Attach Document</a></td>
											<td><a href="javascript:void(0)" onclick="showSubjectivityNotes('<%=""+primaryParentQuoteId %>','0','Subjectivity');" class="button2" style="width:100px">Enter Diary Note</a></td>
											<td>&nbsp;&nbsp;&nbsp;</td>
										<%} else { %>
											<td><a href="javascript:void(0)" onclick="document.getElementById('subjectivityAlertObjectType').value='Quote';document.getElementById('subjectivityObjectType').value='QuotePostBindSubjectivity';showAttach('<%=""+parentQuoteId %>','0','Subjectivity');document.getElementById('subjectivityObjectType').value='Subjectivity';" class="button2" style="width:100px">Attach Document</a></td>
											<td><a href="javascript:void(0)" onclick="showSubjectivityNotes('<%=""+parentQuoteId %>','0','Subjectivity');" class="button2" style="width:100px">Enter Diary Note</a></td>
											<td>&nbsp;&nbsp;&nbsp;</td>
										<%} %>
										</tr>
									</table>							
								</td>
								<%if(policyStatus.equalsIgnoreCase("BOUND")){%>
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
								<td >
									<table border="0" align=right>
										<tr>
											<td><a href="javascript:void(0);" class="button2" onclick="showPolicyManuscriptSubjectivity();" style="width:125px">Create Manuscript</a></td>
										</tr>
									</table>							
								</td>
								</dmshtml:dms_static_with_connector>
								<%} %>
							</tr>
						</table>
						</td>														
	                 <td class="dataSubjcolhead" width="7%">&nbsp;</td>
	                 <td class="dataSubjcolhead" width="10%">&nbsp;</td>
	            </tr>
				<tr>
					<td><div id="POST_BIND_LIST_TABLE" style="word-wrap:break-word;"></div></td>
				</tr>																													
			</table>																																					
		</form>
		</td>
	</tr>																		
	<tr><td align="left">
		<div style="margin-left:10px">Pre-Bind Subjectivities</div>
		<div>&nbsp;</div>
	</td></tr>																	
	<tr>
		<td>
		<form id="prebindSubjectivityMap">
			<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
				
				<tr>
					<td><div id="PRE_BIND_LIST_TABLE" style="word-wrap:break-word;"></div></td>
				</tr>																													
			</table>																																					
		</form>
		</td>
	</tr>		
	<tr><td>&nbsp;<div id='frame' style="display:none"><iframe onload="hideAttachPopup()" id='upload_target_iFrame' src="../common/MessageFromRule.jsp" name='upload_target_iFrame'   style='width:300px;height:30px;border:1px solid #ccc;'></iframe></div></td></tr>																	
	</table>
	<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
		<tr><td align="left">												
			<div style="margin-left:10px">Attached Files</div>
			<div>&nbsp;</div>
		</td></tr>
		<tr><td>
		<form name="AttachmentListMainFrm" id="AttachmentListMainFrmId">
		<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
		<tr class="locformhead1">
		 <td class="datadispcolhead" width="100%" >										
			<table border="0" id="table5" cellspacing="0" cellpadding="0">
         						 	<tr>
         						 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
          						 	<td>          						 			               						 
						<select name="answer(Object::Attachment::ApprovalStatus)" onchange="if(this.value != '') {attachmentStatusChangeMain('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity',this)}">
							<option value="" Selected>Change Status</option>
							<option value="Accepted">Accept</option>
							<option value="Rejected">Reject</option>
						</select>
					</td>	
					</dmshtml:dms_static_with_connector>
					<td>&nbsp;&nbsp;</td>
					<%if(!primaryParentQuoteId.equals("")){ %>
						<td><a href="javascript:void(0)" onclick="document.getElementById('subjectivityAlertObjectType').value='RenewalQuote';document.getElementById('subjectivityObjectType').value='RenewalQuoteSubjectivity';document.getElementById('RenewalQuoteId').value='<%=""+renewalQuote %>';document.getElementById('RenewalQuoteverId').value='<%=""+renewalQuoteverId %>';showAttach('<%=""+primaryParentQuoteId %>','0','Subjectivity');" class="button2" style="width:100px">Attach Document</a></td>													
					<%} else { %>
						<td><a href="javascript:void(0)" onclick="document.getElementById('subjectivityAlertObjectType').value='Quote';document.getElementById('subjectivityObjectType').value='QuoteSubjectivity';showAttach('<%=""+parentQuoteId %>','0','Subjectivity');document.getElementById('subjectivityObjectType').value='Subjectivity';" class="button2" style="width:100px">Attach Document</a></td>
					<%} %>
					<td>&nbsp;&nbsp;</td>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
					<%if(!primaryParentQuoteId.equals("")){ %>
						<td><a href="javascript:void(0)" onclick="deleteMainAttachment('<%=""+primaryParentQuoteId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a></td>
					<%} else { %>
						<td><a href="javascript:void(0)" onclick="deleteMainAttachment('<%=""+parentQuoteId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a></td>
					<%} %>
					</dmshtml:dms_static_with_connector>
				</tr>
			</table>
		</td></tr>
		<tr><td><div id="ATTACHMENT_LIST_MAIN" style="word-wrap:break-word;"></div></td></tr>
		</table>
		</form>
		</td></tr>	
	</table>	
	<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
		<tr><td align="left">												
			<div style="margin-left:10px">Diary Notes</div>
			<div>&nbsp;</div>
		</td></tr>
		<tr><td>
		<form name="NotesListMainFrm" id="NotesListMainFrm">
		<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
		<tr class="locformhead1">
		 <td class="datadispcolhead" width="100%" >										
			<table border="0" id="table5" cellspacing="0" cellpadding="0">
          						 	<tr>
          						 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
           						 	<td>		               						 
							<select onchange="if(this.value != '') {notesStatusChangeMain('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity',this)}" name="answer(Object::Notes::ApprovalStatus)">
								<option value="" Selected>Change Status</option>
								<option value="Accepted">Accept</option>
								<option value="Rejected">Reject</option>																
							</select>
						</td>	
						</dmshtml:dms_static_with_connector>
						<td>&nbsp;&nbsp;</td>
						<%if(!primaryParentQuoteId.equals("")){ %>
							<td><a href="javascript:void(0)" class="button2" onclick="showSubjectivityNotes('<%=""+primaryParentQuoteId %>','0','Subjectivity');" style="width:100px">Enter Diary Note</a></td>											
						<%} else { %>
							<td><a href="javascript:void(0)" class="button2" onclick="showSubjectivityNotes('<%=""+parentQuoteId %>','0','Subjectivity');" style="width:100px">Enter Diary Note</a></td>
						<%} %>
						<td>&nbsp;&nbsp;</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
						<td align="left">
							<%if(!primaryParentQuoteId.equals("")){ %>
								<a href="javascript:void(0)" onclick="deleteMainNotes('<%=""+primaryParentQuoteId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a>
							<%} else { %>
								<a href="javascript:void(0)" onclick="deleteMainNotes('<%=""+parentQuoteId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a>
							<%} %>
						</td>
						</dmshtml:dms_static_with_connector>
					</tr>
				</table>
		</td></tr>
		<tr><td><div id="NOTES_LIST_MAIN" style="word-wrap:break-word;"></div></td></tr>
		</table>
		</form>
		</td></tr>	
	</table>
</div>

<div id="renewalDiv"></div>

	<!-- Div for edit location and tank pop-up -->
<%
String subjectivityIdFromAlert = "";
if(request.getParameter("answer(QuoteSubjectivityIdFromAlert)") != null){
	subjectivityIdFromAlert = ""+request.getParameter("answer(QuoteSubjectivityIdFromAlert)");
}
%>
<script type="text/javascript">
	
	initDocumentPopUp();
var subjectivyEnable='';
if(document.getElementById('SubjectivityError')!=null && document.getElementById('SubjectivityError')!=undefined){
	subjectivyEnable = document.getElementById('SubjectivityError').value;
}
if(subjectivyEnable == 'YES') {
	loadSubjectivityTab('SubjectivityTab');refreshPolicyPreBind();refreshPolicyPostBind();refereshMultiAttachmentList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');refereshMultiNotesList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');
}

/*
var dfaultPolicyTab ='';
if(document.getElementById("dfaultPolicyTab")!=null && document.getElementById("dfaultPolicyTab")!=undefined){
	dfaultPolicyTab=document.getElementById("dfaultPolicyTab").value;
}
if(subjectivyEnable == 'YES') {
	dolphintabs.init('<%=headerName%>',5);
}else if(dfaultPolicyTab == "DOCUMENTS"){
	dolphintabs.init('<%=headerName%>',2);
}else if(dfaultPolicyTab == "SUBJECTIVITY"){
	dolphintabs.init('<%=headerName%>',5);
}else if(issueEndo.dolTabDisplay.value=='N'){
	dolphintabs.init('<%=headerName%>',0);
}else if(issueEndo.dolTabDisplay.value=='Y'){
	dolphintabs.init('<%=headerName%>',6);
}else{
	dolphintabs.init('<%=headerName%>',0);
}*/
function disableEndorseAdd(){
document.getElementById("EndorseAddSubmit").disabled = true;	
}


 function activateQuoteTabs(activateId){
 document.body.style.cursor = "wait";
 activeTabName1 = "";
    if(document.getElementById("DocumentationTab") != undefined){
    	document.getElementById("DocumentationTab").disabled = true;
    }
   
 	if(document.getElementById("CoveragesLimitsTab") != undefined){
 		document.getElementById("CoveragesLimitsTab").disabled = true;
 	}
 	if(document.getElementById("GeneralQuestionTab") != undefined){
 		document.getElementById("GeneralQuestionTab").disabled = true;
 	}
 	if(document.getElementById("LocationTankTab") != undefined){
 		document.getElementById("LocationTankTab").disabled = true;
 	}
 	if(document.getElementById("SubjectivityTab") != undefined){
 		document.getElementById("SubjectivityTab").disabled = true;
 	}
 	if(document.getElementById("RatingDetailTab") != undefined){
 		document.getElementById("RatingDetailTab").disabled = true;
 	}
 	
 	document.getElementById("DocumentationTab").className = "todotab_inactive";
 	document.getElementById("CoveragesLimitsTab").className = "todotab_inactive";
 	document.getElementById("GeneralQuestionTab").className = "todotab_inactive";
 	document.getElementById("LocationTankTab").className = "todotab_inactive";
 	document.getElementById("SubjectivityTab").className = "todotab_inactive";
 	if(document.getElementById("RatingDetailTab") != undefined){
 	document.getElementById("RatingDetailTab").className = "todotab_inactive";
 	}
 	document.getElementById("EndorsementTab").className = "todotab_inactive";
 	document.getElementById("RenewalTab").className = "todotab_inactive";
 	
 	document.getElementById(activateId).className = "todotab_active";		
 }	

function loadDocumentationTab(documentTabId,attachementDataSourceURL,notesDataSourceURL,emailDataSourceURL){	

	var quoteId=document.getElementById("parentQuoteId").value;
    var ownerId = document.getElementById("ownerId").value; 
	var quoteVerId="<%=parentQuoteVerId+""%>";//document.getElementById("parentQuoteVerId").value;

	 activateQuoteTabs(documentTabId);	

	
	document.getElementById("PolicyDiv").innerHTML = document.getElementById("Document11").innerHTML;
	// document.getElementById("Document11").innerHTML="";
		 refereshQuoteAttachmentList('<%if(!primaryParentQuoteId.equals("")){%><%=""+primaryParentQuoteId%><%}else{%><%=""+parentQuoteId%><%}%>',quoteVerId,ownerId,"QUOTE",attachementDataSourceURL);
	 
	 refereshQuoteNotesList('<%if(!primaryParentQuoteId.equals("")){%><%=""+primaryParentQuoteId%><%}else{%><%=""+parentQuoteId%><%}%>',ownerId,"QUOTE",notesDataSourceURL);
	 refereshQuoteEmailList(quoteId,ownerId,"QUOTE",emailDataSourceURL);
	 document.getElementById("PolicyDiv").style.display = "block";	
	 enableTabs();

	}
	
	function loadSubjectivityTab(subjectivityIdTab){
		activateQuoteTabs(subjectivityIdTab);		
		document.getElementById("PolicyDiv").innerHTML = document.getElementById("SubjectivityDiv").innerHTML;		
		enableTabs();
	}
	
	function loadPolicySummaryTab(policySummaryTab){
		
		activateQuoteTabs(policySummaryTab);
		var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
		var productVerId  = document.getElementById("productVerId").value;
		var productId  = document.getElementById("productId").value;
		
		var pars = 'answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+'&answer(productId)='+productId+'&answer(productVerId)='+productVerId+
					'&answer(parentQuoteId)='+parentQuoteId+'&answer(riskState)=&answer(queryString)=POLICY_SUMMARY_TAB_ALGORITHM';
		
		var url = '../getDynamicPolicySummaryContent.do?';
					
		new Ajax.Request(url, 
	 	{method: 'post',parameters:pars,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				forwardToLoginPageIfInvalidSession(transport.responseText);
		 		enableTabs();
		 	},onSuccess: function(transport){	
		 	document.getElementById("PolicyDiv").innerHTML= transport.responseText;
		 	}
		}
	);
	}
	
		
	function loadEndorsementTab(EndorsementTab){

		activateQuoteTabs(EndorsementTab);

		var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
		var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
		var parentProductId = document.getElementById("parentProductId").value;
		var parentProductVerId = document.getElementById("parentProductVerId").value;
		var renewalPolicyId = "";
		var renewalPolicyVerId = "";
		if(document.getElementById("renewalPolicyId") != null && document.getElementById("renewalPolicyId") != undefined) {
			renewalPolicyId = document.getElementById("renewalPolicyId").value;
		}
		if(document.getElementById("renewalPolicyVerId") != null && document.getElementById("renewalPolicyVerId") != undefined) {
			renewalPolicyVerId = document.getElementById("renewalPolicyVerId").value;
		}				
		
		//for prior policy versions
		<logic:empty name="PolicySummary" property="answer(policyId)">
		
			<% policyId = "" + request.getParameter("answer(policyId)"); %>
			policyId="<%=policyId+""%>"
		</logic:empty>
		
		<logic:empty name="PolicySummary" property="answer(policyId)">
			<% policyVerId = "" + request.getParameter("answer(policyVerId)"); %>
				policyVerId="<%=policyVerId+""%>"
		</logic:empty>
		
		
		var ownerId  = document.getElementById("ownerId").value;
		
		var conditionFlag="<%=conditionFlag+""%>";
 		var policyNumber = document.getElementById("policyNumber").value;
		var policyStatus="<%=policyStatus+""%>";
		var custId = document.getElementById("custId").value;
		var agencyId = document.getElementById("agencyId").value;
		var isActivePolicy="<%=isActivePolicy+""%>";
		var paymentPlan="<%=paymentPlan+""%>";
		var productVerId  = document.getElementById("productVerId").value;
		var productId  = document.getElementById("productId").value;		
		var pars = 'answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+'&answer(ownerId)='+ownerId;
		var pars2='&answer(conditionFlag)='+conditionFlag+'&answer(policyNumber)='+policyNumber+'&answer(policyStatus)='+policyStatus+
			'&answer(custId)='+custId+'&answer(agencyId)='+agencyId+'&answer(isActivePolicy)='+isActivePolicy+'&answer(renewalPolicyId)='+renewalPolicyId+'&answer(renewalPolicyVerId)='+renewalPolicyVerId+
			'&answer(paymentPlan)='+paymentPlan+'&answer(productVerId)='+parentProductVerId+'&answer(productId)='+parentProductId+'&answer(parentPolicyVerId)='+parentPolicyVerId;

		pars=pars+pars2
		

		var url = '../policy/EndorsementTabResult.jsp?';
					
		new Ajax.Request(url, 
	 	{method: 'post',parameters:pars,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				forwardToLoginPageIfInvalidSession(transport.responseText);
		 		enableTabs();
		 	},onSuccess: function(transport){	
		 	document.getElementById("PolicyDiv").innerHTML= transport.responseText;
		 	}
		}
	);
	}

	function loadRenewalTab(renewalTabId) {

		activateQuoteTabs(renewalTabId);

		var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
		var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var subQuoteVerId = document.getElementById("subQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId11").value;
		var ownerId  = document.getElementById("ownerId").value;		
		var conditionFlag="<%=conditionFlag+""%>";
 		var policyNumber = document.getElementById("policyNumber").value;
		var policyStatus="<%=policyStatus+""%>";
		var custId = document.getElementById("custId").value;
		var agencyId = document.getElementById("agencyId").value;
		var isActivePolicy="<%=isActivePolicy+""%>";
		var paymentPlan="<%=paymentPlan+""%>";
		var productVerId  = document.getElementById("productVerId").value;
		var productId  = document.getElementById("productId").value;		
		var nonRenwal = document.getElementById("nonRenwal").value;
		var nonRenewal = document.getElementById("nonRenewal").value;
		var referRenewal = document.getElementById("referRenewal").value;
		var policyExpDate = "<%=""+policyExpdate%>";
		var pars = 'answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+'&answer(ownerId)='+ownerId;
		var pars2='&answer(conditionFlag)='+conditionFlag+'&answer(policyNumber)='+policyNumber+'&answer(policyStatus)='+policyStatus+'&answer(custId)='+custId
		+'&answer(agencyId)='+agencyId+'&answer(isActivePolicy)='+isActivePolicy+'&answer(paymentPlan)='+paymentPlan+'&answer(productVerId)='+productVerId
		+'&answer(productId)='+productId+'&answer(ReferRenewal)='+referRenewal+'&answer(NonRenewal)='+nonRenewal+'&answer(parentQuoteId)='+parentQuoteId+'&answer(nonRenwal)='+nonRenwal
		+ '&answer(policyExpDate)=' +policyExpDate+'&answer(subQuoteVerId)='+subQuoteVerId+'&answer(subQuoteId)='+subQuoteId
		+'&answer(QuoteStartDate)='+'<%=""+policyEffdate%>'+'&answer(primaryParentQuoteId)='+'<%if(!primaryParentQuoteId.equals("")){%><%=""+primaryParentQuoteId%><%}else{%><%=""+parentQuoteId%><%}%>';

		pars=pars+pars2

		var url = '../renewal/RenewalTabResult.jsp?';

		new Ajax.Request(url, 
	 	{method: 'post',parameters:pars,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				forwardToLoginPageIfInvalidSession(transport.responseText);
		 		enableTabs();
		 	},onSuccess: function(transport){	
		 	document.getElementById("PolicyDiv").innerHTML= transport.responseText;
		 	document.getElementById("PolicyDiv").style.display = "block";	
		 	}
		}
	);		
	}
	
var activeTabName1 = "";	

 function loadGeneralQuestionsTab(GeneralQuestionId){
 	if(activeTabName1 != 'GeneralQuestionsTab'){		
 		
 	activateQuoteTabs(GeneralQuestionId);
 	activeTabName1 = 'GeneralQuestionsTab';		
 	var locationListArraySize = 0;	 	
 	var policyId    = document.getElementById("policyId").value;
	var policyVerId = document.getElementById("policyVerId").value;
	var productVerId  = document.getElementById("productVerId").value;
	var IsApplicationDisabled = 'N';
	var agencyId = document.getElementById("agencyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("custId").value;
 	var policyNumber = document.getElementById("policyNumber").value;																															  	
 	
 	var pars = 'answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=GENERAL QUESTION&answer(applicationType)=QUOTE&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(isApplicationEnabled)='+IsApplicationDisabled+
 				'&answer(policyNumber)='+policyNumber+'&answer(riskTerritory)=0&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+custId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+'&answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';		
 				var url = '../DisplayGeneralQuestionApplication3.0.do?answer(actionName)=/savePolicyGeneralQuestionApp3.0.go?';	
    
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				forwardToLoginPageIfInvalidSession(transport.responseText);
		 		enableTabs();
		 	},onSuccess: function(transport){	initGeneralQuestionsTab();	
		 	document.getElementById("PolicyDiv").innerHTML= transport.responseText;
		 	}
		}
	);

 }
 
 }
 
 function loadPolicyLocationList(LocationTabId){
 						
 	activateQuoteTabs(LocationTabId);	
 	
 		var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
		var productVerId  = document.getElementById("productVerId").value;
		var IsApplicationDisabled = 'N';
		var agencyId = document.getElementById("agencyId").value;
		var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("custId").value;
	 	var policyNumber = document.getElementById("policyNumber").value;			
 	
 	var pars2 = "answer(applicationType)=QUOTE&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(isApplicationEnabled)="+IsApplicationDisabled+
 				"&answer(policyNumber)="+policyNumber+"&answer(riskTerritory)=0&answer(Object::Agency::AgencyId)="+agencyId+"&answer(CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(customerId)="+custId+"&answer(policyId)="+policyId+"&answer(policyVerId)="+policyVerId;
 	
	 new Ajax.Request("../getPolicyLocationListSize.do?", 
	 	{method: 'post',
			asynchronous:true,parameters:pars2,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				forwardToLoginPageIfInvalidSession(transport.responseText);
		 		loadPolicyLocationList1();enableTabs();
		 	},onSuccess: function(transport){		 	
		 	document.getElementById("PolicyDiv").innerHTML= transport.responseText;
		 	}
		}
	);

 
 
 }
 
  function loadRatingDetailTab(ratingDetailId){
 activateQuoteTabs(ratingDetailId);	
 	
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	
	var subQuoteId    = document.getElementById("subQuoteId11").value;
	


	 var url = '../getPolicyTankList.do?TabPanelName=Policy_Panel&answer(policyId)=<%=""+policyId %>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Rules::ActionForward)=Y&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(productId)=<%=""+productId%>'; 				
 	
 				
 	 var pars2 = 'answer(activeTabName)=Rating_Detail_Tab';
	 new Ajax.Request(url, 
	 	{method: 'post',
			asynchronous:true,parameters:pars2,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				forwardToLoginPageIfInvalidSession(transport.responseText);
		 		enableTabs();
		 	},onSuccess: function(transport){	
		 	var data1 = '<table width="100%" align="left" cellspacing="4" cellpadding="4" border="0" bgcolor ="<%=bgcolor%>";><tr><td>'+transport.responseText+'</td></tr> <input type="hidden" name="answer(QuoteId)" value='+subQuoteId+' />  <input type="hidden" name="answer(parentQuoteId)" value='+parentQuoteId+' />  <input type="hidden" name="answer(Object::Customer::CustomerId)" value='+custId+' /> <input type="hidden" name="answer(subQuoteId)" value='+subQuoteId+' /> <input type="hidden" name="requestType" value="EmployeeElection" /> <input type="hidden" name="answer(activeTabName)" value="Rating_Detail_Tab" />   </table>'
		
		 	document.getElementById("PolicyDiv").innerHTML= data1;
		 	}
		}
	);
 	
 }
 
  function loadPolicyLocationList1(){

 	    YAHOO.example.XHR_Text = function() {
    
	 var formatUrl = function(elCell, oRecord, oColumn, sData) {        
	 			var locName = "'"+oRecord.getData("LocationName")+"'";
	 			var locString = new String(locName);
	 			locString = locString.replace(/ /g,"%20");
	 			locString = locString.replace(/&#39;/g,"___");
	 			var onclickscript = "getPolicyTanksWithLocation("+oRecord.getData("LocationId")+","+locString+")";
             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";             
             
        };
        
	   var moreColumnDefs = [
            {key:"Number", resizable:"true",width:40,sortable:true},
            {key:"Location Name", resizable:"true", formatter:formatUrl,width:120,sortable:true},
            {key:"Address Line 1",  resizable:"true",width:100},
            {key:"Address Line 2", resizable:"true",width:100},
            {key:"City", resizable:"true",width:100},
            {key:"State",  resizable:"true",width:80},
            {key:"Zip",  resizable:"true",width:80},
            {key:"UST",  resizable:"true",width:40,sortable:true},
            {key:"AST",  resizable:"true",width:40,sortable:true}
        ];
        
       	var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
		var productVerId  = document.getElementById("productVerId").value;
		var IsApplicationDisabled = 'N';
		var agencyId = document.getElementById("agencyId").value;
		var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("custId").value;
	 	var policyNumber = document.getElementById("policyNumber").value;			
     autologout(); 	       
     var parameters ="answer(applicationType)=QUOTE&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(isApplicationEnabled)="+IsApplicationDisabled+
			"&answer(policyNumber)="+policyNumber+"&answer(riskTerritory)=0&answer(Object::Agency::AgencyId)="+agencyId+"&answer(CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(customerId)="+custId+"&answer(policyId)="+policyId+"&answer(policyVerId)="+policyVerId;
     var anotherDataSource = new YAHOO.util.DataSource("../getPolicyLocationListUI3.do");
 			
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
		anotherDataSource.connMethodPost =true;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Number","Location Name","Address Line 1","Address Line 2","City","State","Zip","UST","AST","LocationId","LocationName"]
        };

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });

        
        // Configuration for Pagination
        var myConfigs = {
                initialRequest: parameters,
                generateRequest: parameters,   
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  	
        
        var myDataTableY = new YAHOO.widget.DataTable("LocationList1", moreColumnDefs,anotherDataSource,myConfigs);  
	
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
 
 
 }
 
 
 function initGeneralQuestionsTab(){
 
var SubTabApplication2 = new YAHOO.widget.TabView('SubTabApplication2');
var tabView = new YAHOO.widget.TabView('Application');
  }

 var myEditor;
 function renderEditor() {
     var Dom = YAHOO.util.Dom,
         Event = YAHOO.util.Event;
         
     YAHOO.log('Create the Editor..', 'info', 'example');
     myEditor = new YAHOO.widget.SimpleEditor('Content', {
         height: '150px',
         width: '875px',
         dompath: true,
         filterWord: true,
         focusAtStart: true,
         animate: true,                        
         toolbar: {
             titlebar: 'Enter Content',
             buttons: [
                       { group: 'fontstyle', label: 'Font Name and Size',
                           buttons: [
                               { type: 'select', label: 'Arial', value: 'fontname', disabled: false,
                                   menu: [
                                       { text: 'Arial', checked: true },
                                       { text: 'Arial Black' },
                                       { text: 'Comic Sans MS' },
                                       { text: 'Courier New' },
                                       { text: 'Garamond' },
                                       { text: 'Lucida Console' },
                                       { text: 'Tahoma' },
                                       { text: 'Times New Roman' },
                                       { text: 'Trebuchet MS' },
                                       { text: 'Verdana' }
                                   ]
                               },
                               { type: 'spin', label: '10', value: 'fontsize', range: [ 9, 75 ], disabled: false }
                           ]
                       },
                       { type: 'separator' },
                       { group: 'textstyle', label: 'Font Style',
                           buttons: [
                               { type: 'push', label: 'Bold CTRL + SHIFT + B', value: 'bold' },
                               { type: 'push', label: 'Italic CTRL + SHIFT + I', value: 'italic' },
                               { type: 'push', label: 'Underline CTRL + SHIFT + U', value: 'underline' },
                               { type: 'push', label: 'Strike Through', value: 'strikethrough' },                              
                               { type: 'separator' },
                               { type: 'color', label: 'Font Color', value: 'forecolor', disabled: false },
                               { type: 'color', label: 'Background Color', value: 'backcolor', disabled: false }
                           ]
                       },
                       { type: 'separator' },
                       { group: 'indentlist', label: 'Lists',
                           buttons: [
                               { type: 'push', label: 'Create an Unordered List', value: 'insertunorderedlist' },
                               { type: 'push', label: 'Create an Ordered List', value: 'insertorderedlist' }
                           ]
                       }                   
                   ]
         }
     });   
     myEditor._defaultToolbar.buttonType = 'advanced'; 
     myEditor.render();

 }
 function Ajaxsubmit(frm,submitBttn,actionName){
	 if(myEditor!=undefined){
		myEditor.saveHTML();
	 }
	 if(document.getElementById("Content") != null && document.getElementById("Content") != undefined) {
		 document.getElementById("Content").value = convertSpecialCharactersToAsciiValue(document.getElementById("Content").value);
	 }
	 var remove =  removeObject;

	 var validate = eval(validateDynamicForm1(frm));
	 if(validate){
	 if(submitBttn !=null && submitBttn != undefined && submitBttn!='Remove' ){
	 	submitBttn.disabled = true;
	 }
	 if(frm.RemoveButtonForPopUp != null && frm.RemoveButtonForPopUp!=undefined && remove == false){
	 	//frm.RemoveButtonForPopUp.value="";
	 	frm.RemoveButtonForPopUp.disabled = true;
	 	
	 	}
	 	 if(frm.RemoveButton != null && frm.RemoveButton!=undefined &&  remove == false ){
	 			 	frm.RemoveButton.value="";
	 	
	 	}

	 	var isSubmit = newCheckSubmit1();
	 	if(isSubmit){
	 	var url1="";
	 	if(url1 == undefined){
	 		 url1 = "/saveSubmissionRisk1.do?";
	 	}else{}
	 		autologout();
	 		url1 = actionName;
		 	new Ajax.Request(url1, {method: 'post',parameters:$(frm).serialize(this),
		 	onLoading: function() {
			document.getElementById("loadercontent1").style.display ="block";document.getElementById("loadercontent2").style.display ="block";
			},onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);checkcount = false;doSpecificCompleteAction(transport);},onSuccess: function(transport){doSpecificSuccessAction(transport);}});
		}
	 }

	}
 function showFillInFormPopUp(appId,appVerId,polDocId,docId,docVerId,title,editionDate,docTdId){
 	
 	isSpecificValidationNeeded = true;
    var customerId1 = document.getElementById("custId").value;
    var agencyId1 = document.getElementById("agencyId").value;
    var prodId1 = document.getElementById("productId").value;
    var productVerId1 = document.getElementById("productVerId").value;
    var ownerId1 = document.getElementById("ownerId").value;
   	var policyId = document.getElementById("policyId").value;
   	var policyVerId = document.getElementById("policyVerId").value;
   	
 	var clearnceStatus = "";
 	if(document.getElementById("clearnceStatus1") != undefined){
 		clearnceStatus = document.getElementById("clearnceStatus1").value;
 	}
	var actionName =  escape("/policyManuscriptFOConversionAction.go?");
	title = encodeURIComponent(title);
	editionDate = editionDate+" "+title

 	var pars = 'answer(productId)='+prodId1+'&answer(productVerId)='+productVerId1+'&answer(applicationId)='+appId+'&answer(applicationVerId)='+appVerId+
 				'&answer(Object::Customer::CustomerId)='+customerId1+'&answer(ownerId)='+ownerId1+'&answer(Object::Document::Manuscript::Endorsement::PolicyDocId)='+polDocId+
 				'&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(Object::Agency::AgencyId)='+agencyId1+'&answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+
 				'&answer(actionName)='+actionName+'&answer(documentType)=QUOTE_DOCUMENT&answer(Object::Document::Manuscript::Endorsement::DocumentId)='+docId+'&answer(Object::Document::Manuscript::Endorsement::DocumentVerId)='+docVerId+
 				'&answer(DisplayValue_Object::Document::DocumentHeading)='+editionDate+'&answer(DisplayValue_Object::Document::EditionDate)='+editionDate+'&answer(DisplayValue_Object::Document::Title)='+title+'&answer(Object::Doc::NewDocNameId)='+docTdId;
 	var url = "../GetDocumentApplication.do?";
		new Ajax.Request(url, 
			{method: 'post',
				asynchronous:true,parameters:pars,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
					forwardToLoginPageIfInvalidSession(transport.responseText);
					renderEditor();
				},onSuccess: function(transport){	
				YAHOO.example.container.dialog4.show();
				document.getElementById("Documentheading").innerHTML = ""+decodeURIComponent(title);
				document.getElementById("DocumentPopUp").style.display = "block";	
				document.getElementById("DocumentPopUpBody").innerHTML = transport.responseText;
				YAHOO.util.Event.on('closeIcon3', 'click', function(e) {
		 
				YAHOO.example.container.dialog4.cancel();
				document.getElementById("DocumentPopUpBody").innerHTML = " ";
				document.getElementById("DocumentPopUp").style.display = "none";
				
			 })
			 
			  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {
			 
				YAHOO.example.container.dialog4.cancel();
				document.getElementById("DocumentPopUpBody").innerHTML = " ";
				document.getElementById("DocumentPopUp").style.display = "none";	
				
			 })
			 
				}
			}
		);
	
 	}
	
	function showFillinWithoutRichEditor(appId,appVerId,polDocId,docId,docVerId,title,editionDate,docTdId){
 	
 	isSpecificValidationNeeded = true;
    var customerId1 = document.getElementById("custId").value;
    var agencyId1 = document.getElementById("agencyId").value;
    var prodId1 = document.getElementById("productId").value;
    var productVerId1 = document.getElementById("productVerId").value;
    var ownerId1 = document.getElementById("ownerId").value;
   	var policyId = document.getElementById("policyId").value;
   	var policyVerId = document.getElementById("policyVerId").value;
   	
 	var clearnceStatus = "";
 	if(document.getElementById("clearnceStatus1") != undefined){
 		clearnceStatus = document.getElementById("clearnceStatus1").value;
 	}
	var actionName =  escape("/policyManuscriptFOConversionActionV2.go?");
	title = encodeURIComponent(title);
	editionDate = editionDate+" "+title

 	var pars = 'answer(productId)='+prodId1+'&answer(productVerId)='+productVerId1+'&answer(applicationId)='+appId+'&answer(applicationVerId)='+appVerId+
 				'&answer(Object::Customer::CustomerId)='+customerId1+'&answer(ownerId)='+ownerId1+'&answer(Object::Document::Manuscript::Endorsement::PolicyDocId)='+polDocId+
 				'&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(Object::Agency::AgencyId)='+agencyId1+'&answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+
 				'&answer(actionName)='+actionName+'&answer(documentType)=QUOTE_DOCUMENT&answer(Object::Document::Manuscript::Endorsement::DocumentId)='+docId+'&answer(Object::Document::Manuscript::Endorsement::DocumentVerId)='+docVerId+
 				'&answer(DisplayValue_Object::Document::DocumentHeading)='+editionDate+'&answer(DisplayValue_Object::Document::EditionDate)='+editionDate+'&answer(DisplayValue_Object::Document::Title)='+title+'&answer(Object::Doc::NewDocNameId)='+docTdId;
 	var url = "../GetDocumentApplication.do?";
		new Ajax.Request(url, 
			{method: 'post',
				asynchronous:true,parameters:pars,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
					forwardToLoginPageIfInvalidSession(transport.responseText);
				},onSuccess: function(transport){	
				YAHOO.example.container.dialog4.show();
				document.getElementById("Documentheading").innerHTML = ""+decodeURIComponent(title);
				document.getElementById("DocumentPopUp").style.display = "block";	
				document.getElementById("DocumentPopUpBody").innerHTML = transport.responseText;
				YAHOO.util.Event.on('closeIcon3', 'click', function(e) {
		 
				YAHOO.example.container.dialog4.cancel();
				document.getElementById("DocumentPopUpBody").innerHTML = " ";
				document.getElementById("DocumentPopUp").style.display = "none";
				
			 })
			 
			  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {
			 
				YAHOO.example.container.dialog4.cancel();
				document.getElementById("DocumentPopUpBody").innerHTML = " ";
				document.getElementById("DocumentPopUp").style.display = "none";	
				
			 })
			 
				}
			}
		);
	
 	}
	

	function doSpecificValidation(frm){
			if(frm.name == "ManuscriptEndorsementSubApplication") {
	
		if((document.getElementById("Description") != null) && (document.getElementById("Description") != undefined)) {
			if(document.getElementById("Description").value == "") { 
				alert("Enter the Description"); 
				return false; 
			}
		}
		if((document.getElementById("Content") != null) && (document.getElementById("Content") != undefined)) {
			if(document.getElementById("Content").value == "") { 
				alert("Enter the Content"); 
				return false; 
			} 
		}
	}

		if(frm.NewDocNameId!=null && frm.NewDocNameId!=null){
		var tdId = frm.NewDocNameId.value;		
		if(document.getElementById(tdId)!=null && document.getElementById(tdId)!=null){

			document.getElementById('PolicyDiv').innerHTML="";
			document.getElementById(tdId).innerHTML = frm.Title[0].value;
		    loadDocumentationTab("DocumentationTab","../attachment/QuoteAttachmentResult.jsp","../notes/NotesResult.jsp","../email/SentEMailListUI3.jsp");					
			return true;
		 }
		}
		return true;
	}

   function enableTabs(){
   
   	 if(document.getElementById("DocumentationTab") != undefined){
    	document.getElementById("DocumentationTab").disabled = false;
    }
 	if(document.getElementById("CoveragesLimitsTab") != undefined){
 		document.getElementById("CoveragesLimitsTab").disabled = false;
 	}
 	if(document.getElementById("GeneralQuestionTab") != undefined){
 		document.getElementById("GeneralQuestionTab").disabled = false;
 	}
 	if(document.getElementById("LocationTankTab") != undefined){
 		document.getElementById("LocationTankTab").disabled = false;
 	}
 	if(document.getElementById("SubjectivityTab") != undefined){
 		document.getElementById("SubjectivityTab").disabled = false;
 	}
 	if(document.getElementById("RatingDetailTab") != undefined){
 		document.getElementById("RatingDetailTab").disabled = false;
 	}
   document.body.style.cursor = "default";
   
   }
   
var activeTab=document.getElementById("dfaultPolicyTab").value;   
   if(activeTab=='EndorsmentTab'){
   loadEndorsementTab('EndorsementTab');
   }
   if(activeTab=='SubjectivityTab'){
   	loadSubjectivityTab('SubjectivityTab');refreshPolicyPreBind();refreshPolicyPostBind();refereshMultiAttachmentList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');refereshMultiNotesList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');
   	<%if(subjectivityIdFromAlert.length()>0){%>
	 initSubjectivityDetailDialog();
		getPolicySubjectivityDetailpopup('<%=""+subjectivityIdFromAlert%>');
	<%}%>
   }
</script>


<%--  Commented for CVS CheckIn

	 <script type="text/javascript">
		
	var url = '../policy/NoticeHistory.jsp?TabPanelName=Policy_Panel&answer(policyId)=<%=""+policyId %>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Rules::ActionForward)=Y&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(productId)=<%=""+productId%>'; 
    new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){addNoticeTab(transport);}});
	
	function addNoticeTab(data){
		tabView.addTab( new YAHOO.widget.Tab({ label: "Notices", content:data.responseText,cacheData: false}) );
	}
</script>

--%>
<div id="Document11"  style="display:none">
			<table WIDTH="100%" ALIGN="center"  BORDER="0" CELLSPACING="0" CELLPADDING="0" >
			 		
			 			<tr height="30">
			 				<td class="FormLabels" colspan="3">
			 					Generated Documents<% %>
			 				</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels" width="15%">
			 					S.No
			 				</td>
			 				<td class="FormLabels" width="25%">
			 					Documents
			 				</td>
			 				<td class="FormLabels" width="20%">
			 					Generated By 
			 				</td>
			 				<td class="FormLabels" width="40%">
			 					Generated Date 
			 				</td>
			 			</tr>
			 			<tr>
			 				<td class="TextMatter1" width="15%">
					 			1
				 			</td>
					 			
				 			<td class="TextMatter1" width="25%">
				 			<%if(primaryParentQuoteId.equals("")) { %>
				 			<a href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= parentQuoteId.toString()%>&answer(subQuoteId)=<%=SubQuoteId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteStatus)=<%=QuoteStatus.toString()%>' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
				 			<%} else { %>
				 			<a href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= primaryParentQuoteId.toString()%>&answer(subQuoteId)=<%=SubQuoteId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteStatus)=<%=QuoteStatus.toString()%>' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
				 			<%} %>
				 			</td>
				 			<td  class="TextMatter1" width="20%">
				 			</td>
				 			<td class="TextMatter1" width="40%">
				 			</td>
				 		</tr>
			 			<%int indx3=1; %>
			 			<%if(!policyStatus.equalsIgnoreCase("ISSUED") && !policyStatus.equalsIgnoreCase("CANCELED") && !policyStatus.equalsIgnoreCase("EXPIRED")){%>
			 			<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance","CERTIFICATE OF INSURANCE","CORRESPONDENCE","CANCELLATION NOTICE","NON RENEWAL NOTICE"}%>' nameInSession="PolDocLoc1" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 			<logic:present name="PolDocLoc1">			 				
			 				<%
			 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc1");
								for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
									com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
								%>			 				
	 			
					 			<%indx3++; %>
					 			<tr>
					 				<td class="TextMatter1" width="15%">
					 				<%=indx3 %>
					 				</td>
					 				<td class="TextMatter1" width="25%">		
	
					 				<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getDocumentUrl()%>')">
		   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
					 					<%=""+polDocDetail.getPolicyDocName() %>
					 					</a>
					 				</td>
					 				<td class="TextMatter1" width="20%" >
					 					<%=""+polDocDetail.getCreatedBy().replaceAll("<","&lt;").replaceAll(">","&gt;") %>
					 				</td>
					 				<td class="TextMatter1" width="40%">
					 					<%=""+polDocDetail.getCreatedDate() %>
					 				</td>
					 			</tr>
					 			
					 			<%						
								}					 			
					 			%>
			 			</logic:present>
			 			
			 			
			 			
			 			<%}else{%>
			 				<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance","CERTIFICATE OF INSURANCE","CORRESPONDENCE","CANCELLATION NOTICE","NON RENEWAL NOTICE"}%>' nameInSession="PolDocLoc" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 			<%int indx2=1; %>
							 			<logic:present name="PolDocLoc">			 				
							 				<%
							 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc");
												for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
													com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
												%>			 				
					 						 			
									 			<%indx2++; %>
									 			<tr>
									 				<td class="TextMatter1" width="15%">
									 				<%=indx2 %>
									 				</td>
									 				<td class="TextMatter1" width="25%">					 				
									 				<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getDocumentUrl()%>')">
						   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
									 					<%=""+polDocDetail.getPolicyDocName() %>
									 					</a>
									 				</td>
									 				<td class="TextMatter1" width="20%" >
									 					<%=""+polDocDetail.getCreatedBy().replaceAll("<","&lt;").replaceAll(">","&gt;") %>
									 				</td>
									 				<td class="TextMatter1" width="40%">
									 					<%=""+polDocDetail.getCreatedDate() %>
									 				</td>
									 			</tr>
									 			
									 			<%						
												}					 			
									 			%>
							 				
							 			</logic:present>				
				 									 						
				 						
			 			<%} %>
			 			<tr height="30">
			 			<td>&nbsp;</td>
			 			</tr>
			 			
			 			</table>
			 			
			 			<table WIDTH="100%" ALIGN="center"  BORDER="0" CELLSPACING="0" CELLPADDING="0">
			 					 			
			 			<%if(!policyStatus.equalsIgnoreCase("Issued")&& !policyStatus.equalsIgnoreCase("CANCELED") && !policyStatus.equalsIgnoreCase("EXPIRED")) {%>

			 			<dmshtml:dms_isPresent property="<%=new String[]{"BOUND"}%>" value="<%=QuoteStatus.toString()%>" negated="true" >
			 			<tr height="30">
			 				<td class="FormLabels" colspan="3">Selected Policy Forms</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels" width="15%">S.No
			 				</td>
			 				<td class="FormLabels" width="25%">Document Identifier
			 				</td>
			 				<td class="FormLabels" width="60%" >Document Title
			 				</td>
			 			</tr>
			 			<%int index=0; %>
			 			<%int count=0; %>
			 		
			 			<logic:present name="PolicyDocument">
			 			<%String docName="DOC_NAME_"; int docIndex=0;  %>
			 			<% java.util.ArrayList PolicyDocumentDet= (java.util.ArrayList)request.getAttribute("PolicyDocument"); %>
			 			<%if(PolicyDocumentDet.size()>0){%>
			 			<logic:iterate id="PolDocument" name="PolicyDocument">	
			 			<% ++docIndex; %>	 
			 			<bean:define property="polPolicyDocId" name = "PolDocument" id="polPolicyDocId"/>
			 			<bean:define property="dmsDocsId" name = "PolDocument" id="dmsDocsId"/>
			 			<bean:define property="dmsDocVerId" name = "PolDocument" id="dmsDocVerId"/>
			 			<bean:define property="applicationVerId" name = "PolDocument" id="applicationVerId"/>
			 			<bean:define property="applicationId" name ="PolDocument" id="applicationId"/>
			 			<%long appId = 0;
			 			long appVerId = 0;
			 			String strAppId = ""+applicationId;
			 			String strAppVerId = ""+applicationVerId;
			 			 if(!strAppId.equals("")){
			 				 
			 				appId = Long.parseLong(strAppId);
			 				
			 			 }
			 			 if(!strAppVerId.equals("")){
			 				 
			 				appVerId = Long.parseLong(strAppVerId);
			 			 }
			 			%>
			 			<%com.dms.ejb.insurance.policy.PolicyDocumentDetail policyDocDetail = (com.dms.ejb.insurance.policy.PolicyDocumentDetail)PolicyDocumentDet.get(index); %>			 			
			 			<%index++; %>
			 			<%if(policyDocDetail.getGenerateDocument()== null) {%>		
			 				<tr height="20">
					 				<td class="TextMatter1" width="5%">		
					 				<%count++; %>			 				
					 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="15%">
					 				<bean:write name="PolDocument" property="documentNum"/>
					 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="80%">
					 				<bean:write name="PolDocument" property="policyDocName"/>
					 				</td>			 					
					 		</tr>	 						 			
			 			<%} else if(policyDocDetail.getGenerateDocument().equals("Y") || policyDocDetail.getGenerateDocument().equals("")) {%>
				 			<tr height="20">
					 				<td class="TextMatter1" width="10%">
						 				<%count++; %>
						 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="20%">
						 				<bean:write name="PolDocument" property="documentNum"/>
						 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="60%">
										<div id="<%=docName+docIndex %>"><bean:write name="PolDocument" property="policyDocName"/></div></td>
						 				<td width="10%"><%if(appId >0){%>
										
											<% boolean richEditorNeeded = true;
											if(appId == 193 || appId == 195){
												richEditorNeeded = false;
											}%>
						 					<bean:define id="polDocName1" name="PolDocument" property="policyDocName"/>
		     				  				<%String documentName = "" + polDocName1;
		     				  					documentName = documentName.replaceAll("\\\\", "\\\\\\\\");
				     				  			documentName = documentName.replaceAll("'", "\\\\'");
				     				  			documentName = documentName.replaceAll("\"", "&#34;");%>
											<%if(richEditorNeeded){%>
												<a href="javascript:void(0);" onclick="showFillInFormPopUp('<%=""+appId%>','<%=""+appVerId %>','<%=""+polPolicyDocId %>','<%=""+dmsDocsId %>','<%=""+dmsDocVerId %>','<%=""+ documentName%>','<bean:write name="PolDocument" property="documentNum"/>-<bean:write name="PolDocument" property="documentSubNum"/>','<%=docName+docIndex %>' )"> Application </a>
											<%}
											else {%>
												<a href="javascript:void(0);" onclick="showFillinWithoutRichEditor('<%=""+appId%>','<%=""+appVerId %>','<%=""+polPolicyDocId %>','<%=""+dmsDocsId %>','<%=""+dmsDocVerId %>','<%=""+ documentName%>','<bean:write name="PolDocument" property="documentNum"/>-<bean:write name="PolDocument" property="documentSubNum"/>','<%=docName+docIndex %>' )"> Application </a>
										<%	}
						 				} %>	
					 				</td>			 					
					 				
					 		</tr>
					 	<%} %>
			 			</logic:iterate>
			 			<%}%>
			 			</logic:present>
			 		</dmshtml:dms_isPresent> 
			 			
		 			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>' connector='or' negated="true">
		 			
		 			<tr height="20">
		 			<td class="links" colspan="3">
<a onClick="window.location.href="/PreviewIssuancePdf.go?TabPanelName=Policy_Panel&answer(DocumentListSource)=Policy&answer(policyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId%>&answer(DocumentType)=ISSUANCE&answer(QuoteId)=<%=""+parentQuoteId%>&answer(ownerId)=<%=""+ownerId%>&answer(ProductVerId)=<%=""+productVerId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(customerId)=<%=""+custId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(isPreview)=<%=true%>"  target="_new">Preview Issuance Document</a>		 					
		 			</td>
		 			</tr>
		 			</dmshtml:dms_static_with_connector>
		 			<%} %>
		 			<tr height="13">
			 			<td>&nbsp;</td>
			 			</tr>
			 		</table>
			 		<table WIDTH="100%" ALIGN="center"  BORDER="0" CELLSPACING="0" CELLPADDING="0">
			 		<%
			 					 	    
			 	    if(expcal.after(cal) && (isActivePolicy.equals("Y"))){
			 		%>
			 		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ENABLE_NOTICE_OF_CANCELLATION"}%>' connector='or' negated="true">	
			 		<%if(policyStatus.equalsIgnoreCase("Issued")|| policyStatus.equalsIgnoreCase("BOUND")) {%>
			 		<%if(cancellationAvailable.equalsIgnoreCase("Yes")){ %>
			 		<tr height="30">
			 				<td class="FormLabels" colspan="3" >
			 					Generate Notice of Cancellation<% %>
			 				</td>
			 		</tr>
			 		
			 		<tr height="30" >
			 			<td colspan="3" >
			 			
			 			<span title="<bean:message key='ToolTip.PolicySummary.NoticeOfCancellation'/>"> <html:button value="Create Notice of Cancellation" style="width:200px" property="answer(Cancellation)" onclick="confirmNoticeOfCancellation();"  styleId="CancellationSubmit" styleClass="covbutton" /></span>
			 			
			 			</td>
			 		</tr>
			 		<tr height="20">
			 			<td>&nbsp;</td>
			 		</tr>
			 		<%}
					}%>
			 		</dmshtml:dms_static_with_connector>
    				<%} %>
			 		</table>
			 		
			 	<table>
			 	<tr>
			 	<td>
			 	<form id="NoticeOfCancellation" action="/CreateNoticeOfNonRenewal.do" method="post">
			        <dmshtml:GetQuoteDetailsByPolicyId nameInSession="QuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 		 
			 		  
			 		 <html:hidden property="answer(DocumentListSource)" value="Policy" />
			 		<html:hidden property="answer(policyId)" name="CancellationNonrenewal" styleId="policyId" value="<%= ""+policyId%>" />	
			 		<html:hidden property="answer(Object::Policy::Document::Policyid)" styleId="policyId" value="<%= ""+policyId%>" />
			 		
			 		
			 		<html:hidden property="answer(policyVerId)"  value="<%= ""+policyVerId%>" />
			 		<html:hidden property="answer(Object::Policy::Document::Policyverid)"  value="<%= ""+policyVerId%>" />	
			 					 		
			 		<html:hidden property="answer(DocumentType)" value="CANCELLATION NOTICE" />
			 		<html:hidden property="answer(Object::Policy::Document::Documenttype)" value="CANCELLATION NOTICE" />
			 		
			 		<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 
										
			 		<html:hidden property="answer(ownerId)" value='<%=""+ownerId%>' styleId="ownerIdfrmjsp" />
			 		<html:hidden property="answer(ProductVerId)" value="<%= ""+productVerId%>" />
			 		<html:hidden property="answer(Object::Customer::CustomerId)"  value="<%= ""+custId%>" />
			 		<html:hidden property="answer(customerId)" value="<%= ""+custId%>" />	
			 		<html:hidden property="answer(isPreview)" value="false" />
			 		<html:hidden property="answer(Object::Agency::AgencyId)"  value="<%= ""+agencyId%>" />	
			 		<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
			 		<html:hidden property="answer(Object::Policy::ResProperty::Statecode)" value="<%=""+riskState%>"/>
			 		<html:hidden property="answer(DEFAULT_POLICY_TAB)" value ="DOCUMENTS" />
			 		
			 		<html:hidden property="answer(Object::Quote::QuoteType)" value="Cancellation"/>
			 		
			 		<html:hidden property="answer(polParentQuoteId)" value='<%=""+parentQuoteId %>'/>
			 		<html:hidden property="answer(polProductVerId)" value='<%=""+productVerId%>' />
			 		<html:hidden property="answer(polProductId)" value='<%=""+productId%>' />
			 		<html:hidden property="answer(polSubVerQuoteId)" value='<%=""+SubQuoteVerId %>' styleId="subQuoteVerId"/>
					
					<html:hidden property="answer(polSubQuoteId)" value='<%=""+SubQuoteId %>'/>
									
			 		<html:hidden property="answer(Object::UserDetail::userName)" value='<%=""+usernameId%>'/>
			 		<html:hidden property="answer(isUpdated)" value="Y" />
					<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Policy"%>"/>
					<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Notice of Cancellation"%>"/>
				
					<html:hidden property="answer(pagename)" value="Policy summary" />
	
			 		<html:hidden property="answer(Quote::Page)" value="StatusChange" />
			 		

			 		
								 					 		
					<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=""+SubQuoteVerId%>" />
					<html:hidden property="answer(subquoteVerId)" value="<%=""+SubQuoteVerId%>" />
					
						
								<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" />	
								<html:hidden property="answer(subQuoteId)" value="<%=""+SubQuoteId%>" /> 			
								<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 	
																													
					<html:hidden property="answer(userId)" value="<%=usernameId.toString()%>" />
					<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
					<html:hidden property="answer(productId)" value="<%=""+productId%>" />
					<html:hidden property="answer(productVerId)" value="<%=""+productVerId%>" />
					<html:hidden property="answer(UnderWriterWorkSheet)" value="No" />
					<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
					<html:hidden property="answer(OwnerId)" value='<%= ""+ownerId%>' />
					<html:hidden property="answer(ownerId)" value='<%= ""+ownerId%>' />
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
					<html:hidden property="answer(email)" value="<%=""+email %>" styleId="email"/>
					<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
				<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>
					<html:hidden property="answer(Object::Quote::isEndorsementQuote)" value="false" styleId="isEndorsementQuote" />
			 							
					
					</form>
			 	</td></tr></table>	
			 		

Attached Files
<div id="QUOTE_ATTACHMENT_LIST" style="word-wrap:break-word;"></div>
<%if(!primaryParentQuoteId.equals("")){ %>	
	<a href="javascript:void(0)" onclick="showAttach('<%=""+primaryParentQuoteId %>','0','QUOTE');" class="button2" style="width:100px">Add File</a>
<%} else { %>
	<a href="javascript:void(0)" onclick="showAttach('<%=""+parentQuoteId %>','0','QUOTE');" class="button2" style="width:100px">Add File</a>
<%} %>


<div id="AttachFiles"></div>
<div id="AddNotespopup" style="display:none"></div>

<br>
Diary Notes
<br>
		<div id="QUOTE_NOTES_LIST" style="word-wrap:break-word;"></div>
<%if(!primaryParentQuoteId.equals("")){ %>
	<a href="javascript:void(0)" onclick="showNotes('<%=""+primaryParentQuoteId %>','0','Quote');" class="button2" style="width:100px">Add Notes</a>
<%} else { %>
	<a href="javascript:void(0)" onclick="showNotes('<%=""+parentQuoteId %>','0','Quote');" class="button2" style="width:100px">Add Notes</a>
<%} %>

 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="true">
<br>
Email
<br>
		<div id="QUOTE_EMAIL_LIST" style="word-wrap:break-word;"></div>

<a href="javascript:void(0)" onclick="sendEmailDetails();" class="button2" style="width:100px">Compose Email</a>
</dmshtml:dms_static_with_connector>
<script>
YAHOO.namespace("example.container");
//Wrap our initialization code in an anonymous function
//to keep out of the global namespace:
var myEditor;
var flag=0;

(function(){
var init = function() {
  //create the TreeView instance:
  var tree = new YAHOO.widget.TreeView("Emailtreediv");
  //get a reusable reference to the root node:
  var root = tree.getRoot();
  //First, create a parent node
  var SentEmails = new YAHOO.widget.HTMLNode('<html><head></head><body><table><tr><td>&nbsp;&nbsp;</td><td><a href="javascript:void(0);" onclick=showSentEmailSubNodes("sentEmailSuccess"); ><img src="/Images/emailIcon.jpg" border="0" height="18" width="18"> <font color="blue"> Emails Sent</font></a></td><td><div id="sentEmailCount"> </div></td></tr></table>', root, false);
  //EmailList.labelStyle = "icon-prv";
  var composeEmail = new YAHOO.widget.HTMLNode('<div id="composeEmail" style="display: none; return: false;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:void(0);" onclick="sendEmailDetails();" title="Email" > Compose Email</a></div>', root , false);
  var ViewSentEmail = new YAHOO.widget.HTMLNode('<div id="sentEmailSuccess" style="display: none; return: false;"> </div>', root , false);
  tree.draw();
  var ObjectId = document.getElementById("objId").value;
	 var OwnerId = document.getElementById("ownerId").value;
	 var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
	 var ajax = new Ajax.Updater({success: 'sentEmailCount'},'../email/GetSentEmailCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("sentEmailCount").innerHTML);}}); 
	   
  } 
 //Add an onDOMReady handler to build the tree when the document is ready
    YAHOO.util.Event.onDOMReady(init);

})();




</script>
		 		
			 				 					 		
			 	</div>	
			 	<div id="confirmNoticeOfCancellation">
	<div id="CONFIRM_NOTICE_OF_CANCELLATION" style="display:none">
		<table WIDTH='100%' ALIGN='center' BORDER='0' CELLSPACING='0' CELLPADDING='0'>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2' width='100%' align='center'><div style="font-size:small;font-weight:bold;">Do you want to Generate Notice of Cancellation for this Policy?</div></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2' width='100%' align='center'><input style="display:inline;font-weight:normal;" type='button' class='subbutton' value='Yes' onclick='{document.getElementById("NoticeOfCancellation").submit();document.getElementById("CONFIRM_NOTICE_OF_CANCELLATION").style.display ="none";YAHOO.example.container.confirmNoticeOfCancellation.hide();}'/>&nbsp;
				<input type='button' style="display:inline;font-weight:normal;" class='subbutton' value='No' onclick='document.getElementById("CONFIRM_NOTICE_OF_CANCELLATION").style.display ="none";YAHOO.example.container.confirmNoticeOfCancellation.hide();'/></td>
			</tr>
		</table>
	</div>
</div>	

<div id="confirmCreateRenewalQuote">
	<div id="CONFIRM_CREATE_RENEWAL_QUOTE" style="display:none">
		<table WIDTH='100%' ALIGN='center' BORDER='0' CELLSPACING='0' CELLPADDING='0'>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2' width='100%' align='center'><div style="font-size:small;font-weight:bold;">Do you want to create a new Renewal Quote for this Policy?</div></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2' width='100%' align='center'><input style="display:inline;font-weight:normal;" type='button' class='subbutton' value='Yes' onclick="javascript:eval('createNewRenewalQuote()')"/>&nbsp;
				<input type='button' style="display:inline;font-weight:normal;" class='subbutton' value='No' onclick='document.getElementById("CONFIRM_CREATE_RENEWAL_QUOTE").style.display ="none";YAHOO.example.container.confirmCreateRenewalQuote.hide();'/></td>
			</tr>
		</table>
	</div>
</div>

<div id="confirmNoticeOfNonRenewal">
	<div id="CONFIRM_NOTICE_OF_NON_RENEWAL" style="display:none">
		<table WIDTH='100%' ALIGN='center' BORDER='0' CELLSPACING='0' CELLPADDING='0'>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2' width='100%' align='center'><div style="font-size:small;font-weight:bold;">Do you want to Generate Notice of Non Renewal for this Policy?</div></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2' width='100%' align='center'><input style="display:inline;font-weight:normal;" type='button' class='subbutton' value='Yes' onclick='{document.getElementById("NoticeOfNonRenewal").submit();document.getElementById("CONFIRM_NOTICE_OF_NON_RENEWAL").style.display ="none";YAHOO.example.container.confirmNoticeOfNonRenewal.hide();}'/>&nbsp;
				<input type='button' style="display:inline;font-weight:normal;" class='subbutton' value='No' onclick='document.getElementById("CONFIRM_NOTICE_OF_NON_RENEWAL").style.display ="none";YAHOO.example.container.confirmNoticeOfNonRenewal.hide();'/></td>
			</tr>
		</table>
	</div>
</div>			 		

<%
String activeTabName = "";
if(request.getParameter("answer(activeTabName)") != null){
 	activeTabName = ""+request.getParameter("answer(activeTabName)");
}
%>
<script type="text/javascript">
<% if(activeTabName.equalsIgnoreCase("Renewal_Tab")) {%>
	loadRenewalTab("RenewalTab");
<%}%>
</script>
