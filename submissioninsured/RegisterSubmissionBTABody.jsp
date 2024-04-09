<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page  import="java.util.HashMap" %>

<script type="text/javascript">
	function QuoteProposalDisable(formElement){
		document.getElementById("ConfirmSubmit").disabled = true;		
	}
	
	function QuoteProposalEnable(formElement){
		document.getElementById("ConfirmSubmit").disabled = false;		
	}
	function checkActionSubmit(frm) {
	
		document.getElementById("ConfirmSubmit").disabled = true;	
	    return newchecksubmitcount();
		if(frm.proposalYES.checked) {
			return true;
		}
		window.history.back();
		return false;
	}
</script>		
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define name="AddCustomer" property="answer(state)" id="state"/>
<%if(state.equals("")){%>
<%if(request.getParameter("answer(state)")!=null){ %>
<bean:parameter id="stateParam" name="answer(state)"/>
<%state=stateParam ; %>
<%}else if(request.getAttribute("answer(state)")!=null){
state = request.getAttribute("answer(state)");
}
}%>

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
					<td class="NewSectionHead" colspan="5" align="center">SUBMIT COMPLETED APPLICATION</td>
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
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
		<td colspan="20" class="links" width="400px">		
			&nbsp;
		</td>	
	</tr>
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				
						<tr>
							<td class="Error">
												
								<logic:present name="MESSAGE_LIST" scope="request">								
								<ol>
									<logic:iterate id="message" name="MESSAGE_LIST">
									<li><bean:write name="message"/></li>
									</logic:iterate>
								</ol>			
								</logic:present>											
							</td>
						</tr>
						
			
				<logic:present name="MESSAGE_LISTS" scope="request">
						<tr>
							<td class="Error">
								
			    	 				<ol>
							        	<logic:iterate id="InnerMessageList" name="MESSAGE_LISTS">
								        	<%int flag=0; %>
									        	<logic:iterate id="message" name="InnerMessageList">
									                <%
									                	if(flag==0){%>
			         										<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write  name="message"/></li>
			        											<%flag=1;}else{ %>
			         												<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write name="message"/></li>
			        								<%} %>
			        							</logic:iterate>
			      						</logic:iterate>
			     					</ol>  
 								
			     				
							</td>
						</tr>
						<tr><td align="left">&nbsp;</td><tr>
							<td align="left">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<html:button value="Back" styleClass="linkButton" property="answer(back)" onclick="javascript:history.go(-2);"/>
							</td>
						</tr>
						
				</logic:present>
			</table>
		</td>
	</tr>	
	
</table>
<!--  action modified by mariraj.m for check clearance-->	
<html:form action="/CheckClearanceForSubmissionAction.do" onsubmit="return checkActionSubmit(this);">

<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<logic:notPresent name="MESSAGE_LISTS" scope="request">
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
									Are you sure you want to Submit a completed application?
								
									<input type="radio" name="answer(Object::QuoteAdditional::Praposal)" value="Yes" id="proposalYES" onclick="QuoteProposalEnable(this.form,this.document)">&nbsp;Yes 
									<input type="radio" name="answer(Object::QuoteAdditional::Praposal)" value="No" checked="checked" id="proposalNO" onclick="QuoteProposalDisable(this.form,this.document)">&nbsp;No 
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
					<!-- Added by N.Senthil 
	  					 To set OwnerId -->
					<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
				
					<html:hidden property="answer(Object::Submission::SubmissionStatus)"  name="AddCustomer"  value="Registered" />
					
					<html:hidden property="answer(Object::Submission::InsuredId)" name="AddCustomer"  />					
					<html:hidden property="answer(Object::Submission::LOBId)" name="AddCustomer" />
					<html:hidden property="answer(Object::Customer::CustomerId)" name="AddCustomer" />
					<html:hidden property="answer(Object::UserDetail::ownerId)" name="AddCustomer" />		
					<html:hidden property="answer(Object::Agency::AgencyId)" name="AddCustomer" />	
					<bean:define id="AgencyId" property="answer(Object::Agency::AgencyId)" name="AddCustomer" />	
					<html:hidden property="answer(Object::Quote::primaryEntityId)" name="AddCustomer" value="1" />	
					<html:hidden property="TabPanelName" value="Quote_Panel" />
					<bean:define id="cId" property="answer(Object::Customer::CustomerId)" name="AddCustomer" />
					<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Submission"%>"/>
					<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Submission Management"%>"/>
					<html:hidden property="answer(Object::Activity::ActivityMsg)" value="<%=" Submission Registered"%>"/>
					<html:hidden property="answer(Entity::Equals::OwnerId)" value="<%=""+ownerId%>" />
					<html:hidden property="answer(createQuoteEffectiveDate)" value="yes" />
					<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
					<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
					<html:hidden property="answer(formName)" value="form::GETCLQUOTEDETAILS" />
					
					<html:hidden property="answer(Object::Quote::ProductStatus)" value="DEVELOPMENT" />
					<html:hidden property="answer(Object::Customer::State)" value="<%=state+"" %>" />
					<html:hidden property="answer(Object::Risk::RiskId)" value="14" />
					<html:hidden property="answer(Object::Quote::NewQuote)" value="YES" />					
					<!--  Added by Senthil.n  -->
					<html:hidden property="answer(Object::Submission::CreatedBy)"  value="<%=userId.toString()%>"  />	
					<html:hidden property="answer(Object::Submission::UpdatedBy)"  value="<%=userId.toString()%>"  />		
					<html:hidden property="answer(Object::Submission::OwnerId)"  value="<%=ownerId.toString()%>"  />
					<!--  Added by mariraj.m -->
				
					<bean:parameter id="submissionId1" name="answer(Object::Submission::SubmissionId)" />
					<bean:parameter id="submissionVerId1" name="answer(Object::Submission::SubmissionVerId)" />	
					<html:hidden property="answer(Object::Submission::SubmissionId)"  value="<%=""+submissionId1 %>"  />
					<html:hidden property="answer(Object::Submission::SubmissionVerId)" value="<%=""+submissionVerId1 %>"/>			
					<html:hidden property="answer(Object::PageType)"  value="SUBMISSION_REGISTRATION"/>
					<html:hidden property="answer(createQuoteEffectiveDate)" value="yes"/>							
					<html:hidden property="formName" value="form::GETCLQUOTEDETAILS" />
					<html:hidden property="answer(State)" value="<%=state+"" %>" />
					<html:hidden property="answer(Object::Rules::ActionForward)" value="<%="N"%>" />
					
				 
				    <%String submissionStatus = ""; 
String clearanceStatus1 = "";%>
<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" submissionId='<%=""+submissionId1%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	

<logic:present name="customerDetail1" scope="request">

							<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
																	type="com.dms.ejb.data.QuestionHashMap" />
		<%submissionStatus = customerDetailMap.getString("custStatus");
		clearanceStatus1 = customerDetailMap.getString("ClearanceStatus");	
		%>
	</logic:present>			
			<html:hidden property="answer(object:Alert::ClearanceStatus)" value='<%=""+clearanceStatus1%>' />
			<html:hidden property="answer(Agency::AgencyId)" value='<%=""+AgencyId%>' />		
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
					<td align="center" class="links" colspan="4">				
							<INPUT TYPE="submit" value="Submit Completed Application" disabled="disabled"  class="submitbutton" id="ConfirmSubmit">					
					</td>
					<td>
						<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>	
</logic:notPresent>
</table>
</html:form>
