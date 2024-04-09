<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>




<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<bean:parameter id="custId" name="answer(Object::Customer::CustomerId)" />
<bean:parameter id="policyId" name="answer(Object::Policy::Cancel::PolicyId)" />
<bean:parameter id="policyVerId" name="answer(Object::Policy::Cancel::PolicyVerId)" />
<bean:define id="policyNumber" property="answer(policyNumber)" name="PolicySummary"/>
<bean:define  id="productId" name="PolicySummary" property="answer(Object::Quote::ProductId)"/>
<bean:define id="policyCancelRequestId" name="PolicySummary" property="answer(Object::Policy::Cancel::PolicyCancelRequestId)"/>

<%-- <bean:define id="custId" name="PolicySummary" property="answer(Object::Customer::CustomerId)"/>
<bean:define id="policyId" name="PolicySummary" property="answer(Object::Policy::Cancel::PolicyId)" />
<bean:define id="policyVerId" name="PolicySummary" property="answer(Object::Policy::Cancel::PolicyVerId)" />
<bean:define id="policyNumber" name="PolicySummary" property="answer(policyNumber)" /> --%>
<bean:define id="cancelStatus" name="PolicySummary" property="answer(Object::Policy::Cancel::Status)"/>
<bean:define id="cancelOption" property="answer(Object::Policy::Cancel::CancelOption)" name="PolicySummary"/>	
<bean:define id="reason" property="answer(Object::Policy::Cancel::Reason)" name="PolicySummary"/>	
<bean:define id="effectiveDate" property="answer(Object::Policy::Cancel::EffectiveDate)" name="PolicySummary" />
<bean:define id="documentURL" property="answer(Object::Policy::Cancel::DocumentURL)" name="PolicySummary" />

<html:form styleId="formSubmit" action="/GenerateNoticeofCancellation.do" >
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr height="10">
		<td>
		</td> 
	</tr>
	<tr>
		<td width="95%" bgcolor="#C6DEEA">
			<jsp:include page="../common/CustomerAgencyLinkspage.jsp">
				<jsp:param name="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
			</jsp:include>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
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
<table WIDTH="95%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td width="100%">	
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">	
				<tr>
					<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td class="NewSectionHead" colspan="5" align="center"> NOTICE OF CANCELLATION REQUEST DETAIL </td>
				</tr>
				<tr>
					<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table WIDTH="80%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">		
	<tr>	
		<td class="links" align="left" >
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyId)=<%= ""+policyId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>">Return to Policy Summary</a>			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyId)=<%= ""+policyId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>&answer(NoticeTabActive)=<%="true"%>">Previous Cancellation Requests</a>						
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>	

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_CANCEL_DETAIL"}%>' connector='or' negated="true">

<table WIDTH="50%" ALIGN="center"  CELLSPACING="0" CELLPADDING="0">														
	<tr>
		<td class="FormLabels" align="left" >					
			Cancellation Option 
		</td>
		<td class="TextMatter1" align="left">
			<bean:write property="answer(Object::Policy::Cancel::CancelOption)" name="PolicySummary"/>		
		</td>
	</tr>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>		
			<tr>
				<td class="FormLabels" align="left">					
					Cancellation Reason 
				</td>
				<td class="TextMatter1" align="left">
						<bean:write property="answer(Object::Policy::Cancel::Reason)" name="PolicySummary"/>		
						
				</td>
			</tr>	
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>	
			<tr>
				<td class="FormLabels" align="left">					
					Cancellation Effective Date 
				</td>
				<td align="left">
						<html:text property="answer(Object::Policy::Cancel::EffectiveDate)" name="PolicySummary" styleClass="textbox" styleId="effectiveDate" />

				</td>
			</tr>
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>	
			<tr>
				<td class="FormLabels" align="left">					
					Cancellation Requested By 
				</td>
				<td align="left">
						<bean:write property="answer(Object::Policy::Cancel::CreatedBy)" name="PolicySummary" />

				</td>
			</tr>	
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>
			<tr>
				<td class="FormLabels" align="left">					
					Cancellation Requested Date 
				</td>
				<td align="left">
						<bean:write property="answer(Object::Policy::Cancel::CreatedDate)" name="PolicySummary" />

				</td>
			</tr>	
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>	
			<%String cancelStatus1 = ""+cancelStatus ;%>
			<%if(!cancelStatus1.equals("Cancelled")){ %>
			<tr>
				<td class="FormLabels" align="left" >					
					Cancellation Request Status 
				</td>
				<td class="TextMatter1" align="left">
			
				<%-- 		<%if(cancelStatus.toString().equals("Requested")){ %>
						<dmshtml:dms_isPresent property="<%=new String[]{"Confirmed","Cancelled","Declined"}%>" value="<%=cancelStatus.toString()%>" > --%>
							<dmshtml:dms_select property="answer(Object::Policy::Cancel::Status)"  name="PolicySummary" value="<%=cancelStatus.toString()%>"  styleId="Object$Quote$QuoteStatus" >											
								<dmshtml:dms_option value ='<%=cancelStatus.toString()%>'><%=cancelStatus.toString()%></dmshtml:dms_option>
								<dmshtml:dms_option value ='Confirmed'>Confirmed</dmshtml:dms_option>
								<dmshtml:dms_option value ='Cancelled'>Cancelled</dmshtml:dms_option>
								<dmshtml:dms_option value ='Declined'>Declined</dmshtml:dms_option>
	
							</dmshtml:dms_select>		
					<%-- 	</dmshtml:dms_isPresent> 
						<%} %> --%>
						
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>
			<%} %>
			
			<dmshtml:GetDocumentLocation documentType='<%=new String[]{"CORRESPONDENCE"}%>' nameInSession="PolDocLoc1" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			<tr>	
				<td class="links" >
						<html:button property="answer(submit)"  value="Save" styleId="save" onclick="submitSave()"/>				
				</td>

				<%if(documentURL.equals("null") && (cancelStatus.equals("Requested"))){ %>
					<td align="left" class="links" >
							<html:submit value="Generate Notice of Cancellation" />				
					</td>
				
				<%}else if(!documentURL.equals("null")){ %>	
					<td class="TextMatter1">
						 			 				
	 				<% 
	 					java.util.ArrayList arrPolDocDetail = (java.util.ArrayList)request.getAttribute("PolDocLoc1");
	 					for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
					   com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
					%>			 				
			
	 				<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+polDocDetail.getDocumentUrl()%>')">
								<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
	 					<%=""+polDocDetail.getPolicyDocName() %>
	 				</a>
		 				
			 		<%}%>
			 	</td>
					
			 	<%} %>
			 	
			</tr>
							
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>											
		
</table>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_CANCEL_DETAIL"}%>' connector='or' negated="false">

<table WIDTH="75%" ALIGN="center"  CELLSPACING="0" CELLPADDING="0">														
	<tr>
		<td class="FormLabels" align="left" >					
			Cancellation Option 
		</td>
		<td class="TextMatter1" align="left">
			<bean:write property="answer(Object::Policy::Cancel::CancelOption)" name="PolicySummary"/>		
		</td>
	</tr>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>		
			<tr>
				<td class="FormLabels" align="left">					
					Cancellation Reason 
				</td>
				<td class="TextMatter1" align="left">
						<dmshtml:dms_textarea styleClass="textarea" styleId="Cancel_Reason" property="answer(Object::Policy::Cancel::Reason)" cols="80" rows="5" />
				</td>
			</tr>	
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>	
			<%String cancelStatus2 = ""+cancelStatus ;%>
			<%if(!cancelStatus2.equals("Cancelled")){ %>
			<tr>
				<td class="FormLabels" align="left" >					
					Cancellation Request Status 
				</td>
				<td class="TextMatter1" align="left">
			
				<%-- 		<%if(cancelStatus.toString().equals("Requested")){ %>
						<dmshtml:dms_isPresent property="<%=new String[]{"Confirmed","Cancelled","Declined"}%>" value="<%=cancelStatus.toString()%>" > --%>
							<dmshtml:dms_select property="answer(Object::Policy::Cancel::Status)"  name="PolicySummary" value="<%=cancelStatus.toString()%>"  styleId="Object$Quote$QuoteStatus" >											
								<dmshtml:dms_option value ='<%=cancelStatus.toString()%>'><%=cancelStatus.toString()%></dmshtml:dms_option>
								<dmshtml:dms_option value ='Confirmed'>Confirmed</dmshtml:dms_option>
								<dmshtml:dms_option value ='Cancelled'>Cancelled</dmshtml:dms_option>
								
	
							</dmshtml:dms_select>		
					<%-- 	</dmshtml:dms_isPresent> 
						<%} %> --%>
						
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>
			<%} %>
			
			<tr>
				<td class="FormLabels" align="left">					
					Cancellation Effective Date 
				</td>
				<td align="left">
						<bean:write property="answer(Object::Policy::Cancel::EffectiveDate)" name="PolicySummary" />

				</td>
			</tr>	
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>	
			<dmshtml:GetDocumentLocation documentType='<%=new String[]{"CORRESPONDENCE"}%>' nameInSession="PolDocLoc1" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />

			<%if(!documentURL.equals("null")){ %>
			<tr>
				<td>
					<%if(cancelStatus.toString().equals("Requested")){ %>
					<html:button property="answer(submit)"  value="Confirm Cancel Request" styleId="confirm" onclick="changeStatus()"/>	
					<html:hidden property="answer(Object::Policy::Cancel::Status)" styleId="hiddenStatus" name="PolicySummary" />
					<%} %>
				</td>
			</tr>
			
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>
			
			<tr>
				<td>
					<%		java.util.ArrayList arrDocDetail = (java.util.ArrayList)request.getAttribute("PolDocLoc1");	
					 		for(int docIndex=0;docIndex<arrDocDetail.size();docIndex++){		
						   com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrDocDetail.get(docIndex);							
					%>			 				
				
		 				<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+polDocDetail.getDocumentUrl()%>')">
									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 					<%=""+polDocDetail.getPolicyDocName() %>
		 				</a>
			 				
				 	<%}%>
				</td>
			</tr>
			<%} %>
								
		
</table>
<html:hidden property="answer(Object::Policy::Cancel::EffectiveDate)" name="PolicySummary" value="<%="" + effectiveDate%>"/>

</dmshtml:dms_static_with_connector>

<html:hidden property="answer(Object::Policy::Cancel::DocumentURL)" name="PolicySummary" value="<%=""+ documentURL%>"/>
<html:hidden property="answer(Object::Policy::Cancel::PolicyCancelRequestId)" name="PolicySummary" value="<%=""+ policyCancelRequestId%>"/>
<html:hidden property="answer(Object::Policy::Cancel::NoticeType)" name="PolicySummary" value="<%="CANCEL"%>"/>
<html:hidden property="answer(Object::Policy::Cancel::CancelOption)" name="PolicySummary" value="<%="" + cancelOption%>"/>
<html:hidden property="answer(Object::Policy::Cancel::Reason)" name="PolicySummary" value="<%="" + reason%>"/>
<html:hidden property="answer(Object::Policy::Cancel::OwnerId)" value="<%=""+ownerId%>" name="PolicySummary"/>	
<html:hidden property="answer(Object::Policy::Cancel::UpdatedBy)" value="<%=""+usernameId%>" name="PolicySummary"/>	
<html:hidden property="answer(Object::Policy::Cancel::CreatedBy)" value='<%=""+usernameId%>' name="PolicySummary"/>	
<html:hidden property="answer(Object::UserDetail::userName)" value='<%=""+usernameId %>' name="PolicySummary"/>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+custId %>" name="PolicySummary"/>
<html:hidden property="answer(Object::Policy::Cancel::PolicyId)" value='<%=""+policyId%>' name="PolicySummary"/>	
<html:hidden property="answer(Object::Policy::Cancel::PolicyVerId)" value='<%=""+policyVerId%>' name="PolicySummary"/>
<html:hidden property="answer(Object::Quote::ProductId)" value='<%=""+productId %>' name="PolicySummary"/>
<html:hidden property="answer(policyNumber)" value='<%=""+policyNumber %>' name="PolicySummary"/>
<html:hidden property="answer(TabPanelName)" value='<%="Policy_Panel"%>' name="PolicySummary"/>
<html:hidden property="answer(policyId)" value='<%=""+policyId%>' name="PolicySummary"/>	
<html:hidden property="answer(APP_TAB_TYPE)" value='<%="YUI"%>' name="PolicySummary"/>	
<html:hidden property="answer(Object::Application::ApplicationType)" value='<%="POLICY_APPLICATION"%>' name="PolicySummary"/>	


</html:form>
<script type="text/javascript">
<!--
	function submitSave(){
		var formElement=document.forms[0];
		formElement.action="../SaveRequestCancellation.do";
		formElement.submit();
		
	}
	function changeStatus(){
		document.getElementById("hiddenStatus").value = "Confirmed";
		submitSave();
	}
	
//-->
</script>

