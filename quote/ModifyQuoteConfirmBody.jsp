<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<script type="text/javascript">
function disableButton(frm){
document.getElementById("ModifyQuoteSubmit").disabled = true;
}
</script>
<%
session.removeAttribute("isQuoteModified"); 
session.removeAttribute("ModifyQuote::parentQuoteId"); 
session.removeAttribute("ModifyQuote::QuoteId"); 
session.removeAttribute("ModifyQuote::modQuoteNumber"); 
%>
<html:form action="/ModifyQuote.do" onsubmit="disableButton(this)">

<bean:define id="agencyId" name="DataForm" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="customerId" name="DataForm" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="modQuoteId" name="DataForm" property="answer(modQuoteId)" scope="request" />

<bean:define id="policyNumber" name="DataForm" property="answer(policyNumber)" scope="request" />
<bean:define id="parentPolicyId" name="DataForm" property="answer(Object::Policy::ParentPolicyId)" scope="request" />
<bean:define id="parentPolicyVerId" name="DataForm" property="answer(Object::Quote::ParentPolicyVerId)" scope="request" />


<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td >
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="MH">
			MODIFY CONFIRMATION - Quote
		</td>
	</tr>
	<tr>
		<td>
			<hr size="1" noshade >
		</td>
	</tr>
	
	<tr>
		<td valign="top">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td  align="left" class="TableColorStyle3">
						<bean:define id="delAll" value="NO"/>
						<bean:parameter id="delAll" name="deleteAll" value="NO"/>
						<logic:equal name="delAll" value="YES">
							<span style="color:#ff0000">This will modify ALL the selected Quotes.</span><br/>
							Do you want to modify the Quotes?
						</logic:equal>
						<logic:notEqual name="delAll" value="YES">
						&nbsp;&nbsp;&nbsp;<IMG SRC="../Images/ConfirmModify.jpg" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">
							Do you wish to modify the selected Quote?
						</logic:notEqual>
					</td>
				</tr>
				<tr>
					<td >
						&nbsp;
					</td>
				</tr>
		
				<tr>
			 		 <td align="center">
						<input type="hidden" name="deleteAll" value="<%=delAll%>"/>
						<html:submit value="Yes" styleClass="linkButton" styleId="ModifyQuoteSubmit"/>&nbsp;&nbsp;
		     		    <a id="cancelButton" href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(policyNumber)=<%=policyNumber.toString()%>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId.toString()%>&answer(Object::Quote::ParentPolicyVerId)=<%=parentPolicyVerId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=parentPolicyVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=modQuoteId.toString()%>&answer(parentQuoteId)=<%=modQuoteId.toString()%>" class="linkButton" style="width:100px"><html:button styleClass="linkButton" property="answer(CopySubmission)" value="Cancel" onclick="window.location=document.getElementById('cancelButton');this.disabled=true;"/></a> 
			 		</td>
				</tr>
			</table>
		</td>
	</tr>

</table>

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId%>" />


<html:hidden property="answer(modQuoteId)" value="<%=""+modQuoteId%>" />

<bean:define id="modQuoteNumber" name="DataForm" property="answer(modQuoteNumber)" scope="request" />
<html:hidden property="answer(modQuoteNumber)" value="<%=""+modQuoteNumber%>" />

<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />
<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=""+parentPolicyId%>" />
<html:hidden property="answer(Object::Quote::ParentPolicyVerId)" value="<%=""+parentPolicyVerId%>" />
<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=""+parentPolicyVerId%>" />

<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<html:hidden property ="answer(pagename)" value="Modify Quote" />
				<html:hidden property="answer(isUpdated)" value="Y" />
				<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(userId)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
				<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>

</html:form>