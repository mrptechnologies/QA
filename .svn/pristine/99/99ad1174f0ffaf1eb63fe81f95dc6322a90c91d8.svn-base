<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

<%
String renewpolicyNumber="";
String policyId="";
String policyVerId="";
String isRenewalEndorsement = "";
boolean isRenewal = false;
	if(request.getParameter("answer(policyNumber)")!=null)
	{
		renewpolicyNumber=request.getParameter("answer(policyNumber)");
	}
	if(request.getParameter("answer(Object::Policy::ParentPolicyId)")!=null)
	{
		policyId=request.getParameter("answer(Object::Policy::ParentPolicyId)");
	}
	if(request.getParameter("answer(Object::Policy::ParentPolicyVerId)")!=null)
	{
		policyVerId=request.getParameter("answer(Object::Policy::ParentPolicyVerId)");
	}
	if(request.getParameter("answer(isRenewalEndorsement)")!=null)
	{
		isRenewalEndorsement=request.getParameter("answer(isRenewalEndorsement)");
		if(isRenewalEndorsement.equalsIgnoreCase("true")) {
			isRenewal = true;
		}
	}	
%>
<bean:define id="parentQuoteId" name="ReactivateQuote" property="answer(parentQuoteId)" scope="request" />
<bean:define id="modQuoteNumber" name="ReactivateQuote" property="answer(modQuoteNumber)" scope="request" />
<bean:define id="ProductId" name="ReactivateQuote" property="answer(productId)" scope="request" />
<bean:define id="productVerId" name="ReactivateQuote" property="answer(productVerId)" scope="request" />
<bean:define id="productStatus" name="ReactivateQuote" property="answer(Object::Quote::ProductStatus)" scope="request" />
<bean:define id="groupId" name="ReactivateQuote" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="groupVerId" name="ReactivateQuote" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="paretQuoteStatus" name="ReactivateQuote" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="customerId" name="ReactivateQuote" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="ReactivateQuote" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="prevSubQuoteVerId" name="ReactivateQuote" property="answer(prevSubQuoteVerId)" /> 
<bean:define id="policyNumber" name="ReactivateQuote" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="customerId" name="ReactivateQuote" property="answer(Object::Customer::CustomerId)" scope="request" />
<html:form action="/SaveReactivateQuoteStatus.do" onsubmit="disableButton(this)">
<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
<logic:notEqual parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >		
   <tr>
   	 <td>
    	<jsp:include page="/common/QuoteHeaderCoverMin.jsp">
		  <jsp:param name="ParentQuoteId" value="<%=""+parentQuoteId%>" />
		  <jsp:param name="productVerId" value="<%=""+productVerId%>" />
	      <jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus %>" />
	      <jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
          <jsp:param name="customerId" value="<%=""+customerId%>" />
    	</jsp:include>
	 </td>
   </tr>	
 	</logic:notEqual>	
 	<logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >		
				<tr>
					<td>	
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>		
			 </logic:equal>

			<logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >		
				<tr>
					<td align="left" colspan=2>
						<table width="950px" align="left" border="0" >
							<tr>
							<td class="NewSectionHead" align="center">REACTIVATE QUOTE</td>
							</tr>
						</table>
					</td>
				</tr>
			</logic:equal>
						
					<logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >		
						 	<tr>
								<td align="left">			
								<%if(isRenewal) { %>
									<jsp:include page="../common/DynamicPolicyHeader.jsp">
										<jsp:param name="policyId" value="<%=""+policyId%>" />
										<jsp:param name="policyVerId" value="<%=""+policyVerId.toString()%>" />
										<jsp:param name="policyNumber" value="<%=""+renewpolicyNumber%>" />
										<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
										<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
										<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
									</jsp:include>	
								<%} else { %>
									<jsp:include page="../common/DynamicPolicyHeader.jsp">
										<jsp:param name="policyId" value="<%=""+policyId%>" />
										<jsp:param name="policyVerId" value="<%=""+policyVerId.toString()%>" />
										<jsp:param name="policyNumber" value="<%=""+renewpolicyNumber%>" />
										<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
										<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
									</jsp:include>	
								<%} %>
								 </td>
						  	</tr>										
						 	<tr>
								<td align="left">	
									<jsp:include page="../common/EndorsementQuoteHeader.jsp">
										<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
										<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
									</jsp:include>	
								</td>
							</tr>
					</logic:equal>
														
	<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
	<tr><td><html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" /></td></tr>
	<tr>
		<td class="links">
			<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(policyNumber)=<%=renewpolicyNumber.toString()%>&answer(Object::Policy::ParentPolicyId)=<%=policyId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=policyVerId.toString()%>" title="<bean:message key='ToolTip.ReactivateQuote.QuoteSummary'/>">Quote Summary</a>
		</td>														
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	 <td>
		<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">	
			<tr>
				<td class="TextMatter1" align="right">		
					Reason for Reactivation&nbsp;&nbsp;
				</td>
				<td class="TextMatter1" align="left">		
				<input type = text name="answer(Object::QuoteAdditional::ReactivationReason)" id="notesDesc" size="50" maxlength="54" />
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class="TextMatter1" align="right">		
					Reactivation Notes&nbsp;&nbsp;
				</td>
				<td class="TextMatter1" align="left">
					<dmshtml:dms_textarea styleClass="txtarea" name="ReactivateQuote"  property="answer(Object::QuoteAdditional::ReactivationNotes)" rows="6" cols="80"/>
				</td>
			</tr>
		</table>
	  </td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
     <td align="center" title="<bean:message key='ToolTip.ReactivateQuote.ConfirmReactive'/>">
		<INPUT TYPE="submit"  value="Confirm Reactive" class="covbutton1">												
	 </td>
    </tr>
 </table>
<html:hidden property="TabPanelName" value="Quote_Panel" />
<html:hidden property="answer(Object::Notes::Active)" value="Y" />
<html:hidden property="answer(Object::Notes::Private)" value="Y" />
<html:hidden property="answer(Object::Notes::UserName)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Notes::UserRole)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+customerId%>' />
<html:hidden property="answer(Object::Quote::LockStatus)" value="Unlocked" />
<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
<html:hidden property="answer(isUpdated)" value="Y" />
			<html:hidden property="answer(pagename)" value="Reactivate page"/>
			<html:hidden property="answer(policyNumber)" value="<%=renewpolicyNumber.toString()%>"/>
			<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=policyId.toString()%>"/>
			<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>"/>
			<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
			<html:hidden property="answer(Object::Notes::Description)" value="Reactivation Notes"/>
<html:hidden name="ReactivateQuote" property="answer(parentQuoteId)" value='<%=""+parentQuoteId %>' />
<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value="<%=""+prevSubQuoteVerId %>" />

<script type="text/javascript">
document.getElementById("Quote:TxtChange").onclick = function(){
	var a = document.getElementById('Quote:TxtChange');
	var b = a.innerHTML;
	if(b == "Click here to show detail") {
		document.getElementById('quoteheader_inner').style.height = "10em";
	}
	else {
		document.getElementById('quoteheader_inner').style.height = "1em";
	}
}
document.getElementsByName("quoteHeaderImg")[0].onclick = function(){
	var a = document.getElementById('Quote:TxtChange');
	var b = a.innerHTML;
	if(b == "Click here to show detail") {
		document.getElementById('quoteheader_inner').style.height = "10em";
	}
	else {
		document.getElementById('quoteheader_inner').style.height = "1em";
	}
}
</script>
</html:form>