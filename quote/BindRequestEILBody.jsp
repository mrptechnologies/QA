<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

		<%
			
			String agencyIdTemp="";
			if(request.getParameter("answer(Object::Agency::AgencyId)")!=null)
			{
				agencyIdTemp=request.getParameter("answer(Object::Agency::AgencyId)");
			}
		
			String customerId="";
			if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
			{
				customerId=request.getParameter("answer(Object::Customer::CustomerId)");
			}
			
			String strParetQuoteStatus="";
			if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
			{
				strParetQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
			}

			String strParentQuoteId="";
			if(request.getParameter("answer(parentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(parentQuoteId)");
			}
			
			String strParentQuoteVerId="";
			if(request.getParameter("answer(parentQuoteVerId)")!=null)
			{
				strParentQuoteVerId=request.getParameter("answer(parentQuoteVerId)");
			}

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}
			String prevSubQuoteVerId="";
			if(request.getParameter("answer(suQuoteVerId)")!=null)
			{
				prevSubQuoteVerId=request.getParameter("answer(suQuoteVerId)");
			}
			String policyNumber="";
			if(request.getParameter("answer(policyNumber)")!=null)
			{
				policyNumber=request.getParameter("answer(policyNumber)");
			}
			String parentPolicyId="";
			if(request.getParameter("answer(parentPolicyId)")!=null)
			{
				parentPolicyId=request.getParameter("answer(parentPolicyId)");
			}
			String parentPolicyVerId="";
			if(request.getParameter("answer(Object::Policy::ParentPolicyVerId)")!=null)
			{
				parentPolicyVerId=request.getParameter("answer(Object::Policy::ParentPolicyVerId)");
			}
			
		%>
<script type="text/javascript">
function disableButton( ){
document.getElementById("BindRequestSubmit").disabled = true;	
}
</script>		
<%--action modified from "/BindRequest.do"  to "/CheckClearanceForQuoteAction.do" for check clearance by mariraj.m --%>
<html:form action="/CheckClearanceForQuoteAction.do" onsubmit="return disableButton( )">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>



<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)"/>

<%
if(request.getParameter("quoteId")!=null)
			{
		%>
<html:hidden name="AddQuote" property="quoteId" value="<%=request.getParameter("quoteId")%>"/>
<%
			}			
%>
<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
						<table WIDTH="760px" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td>
									<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												<jsp:include page="/common/QuoteHeaderCreateQuoteCoverMin.jsp">
									
													<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+strParentQuoteId%>" />
													<jsp:param name="answer(policyNumber)" value="<%=""+policyNumber%>" />
												</jsp:include>
									
											</td>
										</tr>
										<tr>
											<td align="left">
	
												<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
													<tr>
														<td>

															<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
															<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
															<html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
														</td>
													
		
		
		
														<bean:define id="parentQuoteId" name="AddQuote" property="answer(Object::Quote::Id)"/>
														
															<%
															if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
															{
												             
															%>
															<td>
															<html:hidden name="AddQuote" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>
															</td>
		

																<%
																	}
																%>
															</tr><tr>	
														<td colspan="2" class="links">
															<a id="quoteSummaryPageLink" href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>">Quote Summary</a>
														</td>
													</tr>
													<tr>
														<td  colspan="8" align="center" class="sectionhead"></td>
													</tr>
													<tr>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td class="Error">
															<logic:present name="MESSAGE_LIST"> 
																<ul>
																	<logic:iterate id="message" name="MESSAGE_LIST">
																		<li><bean:write name="message"/></li>
																	</logic:iterate>
															 	</ul>
															 	<%strParetQuoteStatus="Offered"; %>			
															</logic:present>
														</td>
													</tr>
													<tr>
														<td>
															<table width="100%" border="0" align="left">

																<dmshtml:dms_isPresent property='<%=new String[]{"In Progress"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">
																	<tr>
																		<td class="TextMatter" align="right">
																			In order to Request a Binder you need to have received a Quote Proposal 
																		</td>
																	</tr>
																</dmshtml:dms_isPresent>

																<dmshtml:dms_isPresent property='<%=new String[]{"Offered"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">
																	<tr>
																		<td class="TextMatter" align="right">
																			Are you sure you want to request a Binder? 
																		</td>
																	</tr>
																</dmshtml:dms_isPresent>

															</table>
														</td>
													</tr>
													<tr><td>
														<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Bind Request" />
													</td></tr>
												</table>
											</td>
										</tr>
									</table>
									<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<dmshtml:dms_isPresent property='<%=new String[]{"Offered"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">
												<td align="center" class="links" colspan="4">
													<INPUT TYPE="Submit" value="Request Binder" class="covbigbutton1" style="font-size:13px;" id="BindRequestSubmit">
												</td>
											</dmshtml:dms_isPresent>

											<td>
												<dmshtml:dms_button value="Back" property="answer(back)" styleClass="covbigbutton1" style="font-size:13px;" onclick="goToQuoteSummaryPage();"/>
											</td>
											<td>
												&nbsp;
											</td>
										</tr>

										<tr>
											<td colspan="3">
												&nbsp;
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
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>

			<html:hidden name="AddQuote" property="formName" value="form::CREATEQUOTEVERSION"/>
			 <html:hidden name="AddQuote" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			 <html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
			<html:hidden property="page" value="7" />
			
			
			<!-- New hidder variables -->
			
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(QuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />			
			<html:hidden property="answer(Quote::Page)" value="StatusChange" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" /> 
			<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=""+parentPolicyId%>" />
			<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value ="<%=""+parentPolicyVerId%>" />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
			<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value ="<%=""+prevSubQuoteVerId%>" />
				<html:hidden property="answer(isUpdated)" value="Y" />
	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
	<html:hidden property="answer(pagename)" value="<%=""+" Created Bind Request"%>" />
		
			<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+strParentQuoteId%>" /> 
			<html:hidden property="answer(Object::Quote::ParentQuoteVerId)" value="<%=""+strParentQuoteVerId%>" />  
			     
			<html:hidden property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId %>"/>
			<html:hidden property="answer(Object::Alert::OwnerId)" value="<%=""+ownerId %>"/>
			
			<!--  added by mariraj for checkclearance on Bind request -->
			<html:hidden property="answer(Object::PageType)" value="BIND_REQUEST"/>

			
			
		</td>
	</tr>

</table>    



</html:form>


<script type="text/javascript">
function goToQuoteSummaryPage() {
	if(document.getElementById("quoteSummaryPageLink") != null && document.getElementById("quoteSummaryPageLink") != undefined) {
		document.location = document.getElementById("quoteSummaryPageLink").href;
	}
}
</script>