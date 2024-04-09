<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page  import="java.util.HashMap" %>

<script type="text/javascript">
	function CopyDisable(formElement){
		document.getElementById("ConfirmCopy").disabled = true;		
	}
	
	function CopyEnable(formElement){
		document.getElementById("ConfirmCopy").disabled = false;		
	}
	function checkActionSubmit(frm) {
	
		document.getElementById("ConfirmCopy").disabled = true;	
	    return newchecksubmitcount();
		if(frm.copyYES.checked) {
			return true;
		}
		window.history.back();
		return false;
	}
</script>		
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define name="AddCustomer" property="answer(state)" id="state"/>
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
						<table width="95%" align="center" border="0">
						
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
	
	<tr>
		<td width="100%">	
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">	
				<tr>
					<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td class="NewSectionHead" colspan="5" align="center">COPY SUBMISSION</td>
				</tr>
				<tr>
					<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
				</tr>
			</table>
		</td>
	</tr>	
</table>
<!-- <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
		
		<td colspan="20" class="links" width="400px">	
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href=""/>			
				Quotes
			</a>
		</td>	
	</tr>
</table>
-->

<html:form action="/CopySubmission.do" onsubmit="return checkActionSubmit(this);">

<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">				
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" align="left">
							<tr>
								<td class="TextMatter" colspan="2" align="right">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									Do you want to Copy this Submission?
								
									<input type="radio" name="answer(Object::Submission::Copy)" value="Yes" id="copyYES" onclick="CopyEnable(this.form,this.document)">&nbsp;Yes 
									<input type="radio" name="answer(Object::Submission::Copy)" value="No" checked="checked" id="copyNO" onclick="CopyDisable(this.form,this.document)">&nbsp;No 
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" align="left">
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr><td>
					<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
					
					<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
					
					<bean:parameter id="insuredStatus" name="answer(Object::Customer::Status)" />			
				
					<html:hidden property="answer(Object::Customer::Status)"  value="<%=""+insuredStatus %>" />
					<html:hidden property="answer(requestForm)" value="Submission" />
					<html:hidden property="TabPanelName" value="Submission_Panel" />
					<html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />
					<bean:parameter id="SubmissionId" name="answer(Object::Submission::SubmissionId)" />
					<html:hidden property="answer(Object::Submission::SubmissionId)" value="<%=""+SubmissionId %>"  />
					<bean:parameter id="SubmissionVerId" name="answer(Object::Submission::SubmissionVerId)" />
					<html:hidden property="answer(Object::Submission::SubmissionVerId)" value="<%=""+SubmissionVerId %>"  />
					<bean:parameter id="cId" name="answer(Object::Customer::CustomerId)" />
					<html:hidden property="answer(Object::Submission::InsuredId)" value="<%=""+cId%>"  />
					<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+cId%>"  />					
					<html:hidden property="answer(customerId)" value="<%=""+cId%>"  />					
					<bean:parameter id="agencyId2" name="answer(Agency::AgencyId)" />
					<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>"  />
					<html:hidden property="answer(1*Customer::Equals::SearchObjectId)" value="<%=""+agencyId2%>"  />
					<bean:parameter id="agentId2" name="answer(AgentId)" />
					<html:hidden property="answer(AgentId)" value="<%=""+agentId2%>"  />
					<html:hidden property="answer(1*Customer::Equals::SearchObjectType)" value="AGENCY"  />
					
							
				</td></tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td>
			<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td align="center" class="links" colspan="4" title="<bean:message key='ToolTip.CopySubmission.CopySubmission'/>">				
							<INPUT TYPE="submit" align="center" value="Copy Submission" style="width:150px" disabled="disabled"  class="submitbutton" id="ConfirmCopy">					
					</td>
					<td title="<bean:message key='ToolTip.CopySubmission.Back'/>">
						<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="goToSubmissionSummaryPage();"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>	
</table>
</html:form>

<script type="text/javascript">
function goToSubmissionSummaryPage() {
	if(document.getElementById("submissionSummaryPageLink") != null && document.getElementById("submissionSummaryPageLink") != undefined) {
		document.location = document.getElementById("submissionSummaryPageLink").href;
	}
}
</script>