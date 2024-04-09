<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

<html>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<% 
	String policyId = "";
	if(request.getParameter("answer(policyId)")!=null){
		 policyId = ""+request.getParameter("answer(policyId)");
	} 
%>

<% 
	String policyVerId = "";
	if(request.getParameter("answer(policyVerId)")!=null){
		policyVerId = ""+request.getParameter("answer(policyVerId)");
	} 
%>

<% 
	String custId = "";
	if(request.getParameter("answer(customerId)")!=null){
		custId = ""+request.getParameter("answer(customerId)");
	} 
%>

<% 
	String policyNumber = "";
	if(request.getParameter("answer(policyNumber)")!=null){
		policyNumber = ""+request.getParameter("answer(policyNumber)"); 
	} 
%>

<% 
	String productId = "";
	if(request.getParameter("answer(productId)")!=null){
		productId = ""+request.getParameter("answer(productId)");
	} 
%>
<% String isActivePolicy = ""; %>
<% String DocumentType = "ISSUANCE"; %>
<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId %>" policyNumber="<%=""+policyNumber%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" documentType='<%=DocumentType%>' />
				
					<% String policyStatus ="";%>
					<% String policyEffdate ="";%>
					<% String policyExpdate ="";%>
					<logic:present name="policyHeaderInfo">
						<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plPolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
						<%policyEffdate =""+plPolicyDetail.getPolicyEffDate();%>
						<%policyExpdate =""+plPolicyDetail.getPolicyExpDate();%>
						<%policyStatus =plPolicyDetail.getPolicyStatus();%>
	<dmshtml:isActivePolicy policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
	      <% isActivePolicy =(String) request.getAttribute("isActivePolicy");  %>
</logic:present>
<table width="95%">
				<tr>
				     <td>
				     	&nbsp;
				     </td>
	     		</tr>
	  
 <dmshtml:GetCancellationDetail nameInSession="cancelNotificationDetail" policyId="<%=Long.parseLong(policyId)%>" policyVerId="<%=Long.parseLong(policyVerId)%>" ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
 
	    <tr>
	    	<logic:present name="cancelNotificationDetail" scope="request">
	    	<%com.dms.ejb.insurance.policy.CancelNotificationDetail cancDetail = (com.dms.ejb.insurance.policy.CancelNotificationDetail)request.getAttribute("cancelNotificationDetail"); %>
 			<%String cancelStatus = ""+cancDetail.getStatus();%>
		     	<td width="90%" align="right">
					<%if(policyStatus.equalsIgnoreCase("Issued") && isActivePolicy.equalsIgnoreCase("Y") && (cancelStatus.equalsIgnoreCase("Requested") )){ %>
						
						<a href="../CancellationStatus.do?TabPanelName=Policy_Panel&answer(Object::Policy::Cancel::PolicyId)=<%=""+policyId %>&answer(Object::Policy::Cancel::PolicyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Rules::ActionForward)=Y&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(Object::Policy::Cancel::OwnerId)=<%=""+ownerId%>&answer(Object::Quote::ProductId)=<%=""+productId%>" id="Cancel_Policy_Request"><html:button  styleClass="linkButtonHeavy" property="answer(CancelPolicyRequest)" value="Generate Request for Cancellation" onclick="window.location=document.getElementById('Cancel_Policy_Request')"/></a>
					<%}else if(policyStatus.equalsIgnoreCase("Issued") && isActivePolicy.equalsIgnoreCase("Y") || cancelStatus.equalsIgnoreCase("Confirmed") || cancelStatus.equalsIgnoreCase("Declined") || cancelStatus.equalsIgnoreCase("Cancelled")) { %>
					<a href="../policy/RequestCancellation.jsp?TabPanelName=Policy_Panel&answer(policyId)=<%=""+policyId %>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Rules::ActionForward)=Y&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(Object::Quote::ProductId)=<%=""+productId%>" id="Cancel_Policy_Request"><html:button styleClass="linkButtonBig" property="answer(CancelPolicyRequest)" value="Request for Cancellation" onclick="window.location=document.getElementById('Cancel_Policy_Request')"/></a>
		
			<%}%>
				</td>
			</logic:present>
			<logic:notPresent  name="cancelNotificationDetail">
			<td width="90%" align="right">
			<% if(policyStatus.equalsIgnoreCase("Issued") && isActivePolicy.equalsIgnoreCase("Y") ) { %>
					<a href="../policy/RequestCancellation.jsp?TabPanelName=Policy_Panel&answer(policyId)=<%=""+policyId %>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Rules::ActionForward)=Y&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(Object::Quote::ProductId)=<%=""+productId%>" id="Cancel_Policy_Request"><html:button styleClass="linkButtonBig" property="answer(CancelPolicyRequest)" value="Request for Cancellation" onclick="window.location=document.getElementById('Cancel_Policy_Request')"/></a>
		
			<%}%>
			</td>
			</logic:notPresent>
     
     
     </tr> 
    
     
   
 </table>
 <table >
		<tr><td class="SectionHead">&nbsp;REQUESTS FOR CANCELLATIONS</td></tr>	
		<tr>
			<td>	
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				<%if(policyStatus.equalsIgnoreCase("Canceled") && isActivePolicy.equalsIgnoreCase("Y")){%> 
					<a href="../policy/RequestCancellation.jsp?TabPanelName=Policy_Panel&answer(policyId)=<%=""+policyId %>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Rules::ActionForward)=Y&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(Object::Quote::ProductId)=<%=""+productId%>" id="Reinstate_Policy_Request"><html:button styleClass="linkButtonBig" property="answer(ReinstatePolicyRequest)" value="Request for Reinstatement" onclick="window.location=document.getElementById('Reinstate_Policy_Request')"/></a>
				<%} %>
			</td>
		</tr>
</table>

  <dmshtml:GetCancellationHistoryDetail nameInSession="cancelHistoryMap" policyId="<%=Long.parseLong(policyId)%>" policyVerId="<%=Long.parseLong(policyVerId)%>" ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
  <logic:present name="cancelHistoryMap" scope="request">
   <table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td class="new_sectionhead" width="5%" align="left">
					S.No
				</td>
				<td class="new_sectionhead" width="15%" align="left">
					Date Requested
				</td>
				<td class="new_sectionhead" width="15%" align="left">
					Requested By
				</td>
				<td class="new_sectionhead" width="10%" align="center">
					Cancel Option
				</td>
				<td class="new_sectionhead" width="27%" align="center">
					Reason 
				</td>
				<td class="new_sectionhead" width="10%" align="center">
					Request Status
				</td>
				<td class="new_sectionhead" width="18%" align="center">
					Notice 
				</td>
			</tr>
			<%int index=1; %>
			<%
				com.dms.ejb.data.QuestionHashMap cancelHistoryMap= (com.dms.ejb.data.QuestionHashMap)request.getAttribute("cancelHistoryMap");
				for(int reqIndex = 0;reqIndex < cancelHistoryMap.size();reqIndex++){		
					com.dms.ejb.insurance.policy.CancelNotificationDetail cancelDetail = (com.dms.ejb.insurance.policy.CancelNotificationDetail)cancelHistoryMap.get(""+reqIndex);							
			%>			 				

			<tr height="20">
				<td class="TextMatter1" width="5%" align="left">
					<%=""+index++ %>
				</td>
				<td class="TextMatter1" width="15%" align="left">
					<%=""+cancelDetail.getCreatedDate()%>
				</td>
				<td class="TextMatter1" width="15%" align="left">
					<%=""+cancelDetail.getCreatedBy()%>
				</td>
				<td class="TextMatter1" width="10%" align="left">
					<%=""+cancelDetail.getCancelOption()%>
				</td>
				
				<td class="TextMatter1" width="27%" align="left">
					<%=""+cancelDetail.getReason()%>
				</td>
				<td class="TextMatter1" width="10%" align="left">
					<%=""+cancelDetail.getStatus()%>
				</td>
				<td class="TextMatter1" width="18%" align="left">
					<%if(cancelDetail.getDocumentURL()!=null){ %>
						<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+cancelDetail.getDocumentURL()%>')">
		   				<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> Correspondence PDF
					 					
					<%} %>
				</td>
			</tr>
			<%} %>
			<tr>
				<td>	
					&nbsp;
				</td>
			</tr>
	</table>
	
	
	</logic:present>
	<table >
		<tr><td class="SectionHead">&nbsp;REQUESTS FOR REINSTATEMENTS</td></tr>	
		<tr>
			<td>	
				&nbsp;
			</td>
		</tr>
	</table>
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td class="new_sectionhead" width="5%" align="left">
					S.No
				</td>
				<td class="new_sectionhead" width="15%" align="left">
					Date Requested
				</td>
				<td class="new_sectionhead" width="15%" align="left">
					Requested By
				</td>
				<td class="new_sectionhead" width="10%" align="center">
					Reinstatement Option
				</td>
				<td class="new_sectionhead" width="27%" align="center">
					Reason 
				</td>
				<td class="new_sectionhead" width="10%" align="center">
					Request Status
				</td>
				<td class="new_sectionhead" width="18%" align="center">
					Notice 
				</td>
			</tr>
			<tr>
				<td>	
					&nbsp;
				</td>
			</tr>
		</table>
</html>