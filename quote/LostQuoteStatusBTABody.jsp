<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>



<bean:define id="parentPolicyId" name="AddQuote" property="answer(Object::Policy::ParentPolicyId)" />
<bean:define id="parentPolicyVerId" name="AddQuote" property="answer(Object::Policy::ParentPolicyVerId)" />
<bean:define id="policyNumber" name="AddQuote" property="answer(policyNumber)" />		

<bean:define id="RenewalPolicyNo" name="AddQuote" property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" />
<bean:define id="RenewalPolicyCompany" name="AddQuote" property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" />
<bean:define id="RenewalSubmissionNumber" name="AddQuote" property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" />



<html:form action="/SaveLapseQuoteStatus.do" >

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<html:hidden property="answer(Object::Policy::ParentPolicyId)" value='<%=parentPolicyId.toString()%>'/>
<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value='<%=parentPolicyVerId.toString()%>'/>
<html:hidden name="policyNumber" property="answer(policyNumber)" value="<%=policyNumber.toString()%>" />

<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" value='<%=RenewalPolicyNo.toString()%>'/>
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" value='<%=RenewalPolicyCompany.toString()%>'/>
<html:hidden  property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" value="<%=RenewalSubmissionNumber .toString()%>" />

<table WIDTH="95%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
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
	%>
	
	<%	
		String subQuoteVerIdParam = "";
		if(request.getParameter("answer(subQuoteVerIdParam)") != null) {
			subQuoteVerIdParam = "" + request.getParameter("answer(subQuoteVerIdParam)");
		}
	
		String subQuoteIdParam = "";
		if(request.getParameter("answer(subQuoteIdParam)") != null) {
			subQuoteIdParam = "" + request.getParameter("answer(subQuoteIdParam)");
		}			

		String customerId="";
		if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
		{
			customerId=request.getParameter("answer(Object::Customer::CustomerId)");
		}
		
		String subQuoteVerId="";
		if(request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)")!=null)
		{
			subQuoteVerId=request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)");
		}		
		
		String strParentQuoteId="";
		if(request.getParameter("answer(parentQuoteId)")!=null)
		{
			strParentQuoteId=request.getParameter("answer(parentQuoteId)");
		}
	
		String strParetQuoteStatus="";
		if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
		{
			strParetQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
		}

		String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}

		if(request.getParameter("quoteId")!=null)
				{
	%>
	
	<tr><td><html:hidden name="AddQuote" property="quoteId" value="<%=request.getParameter("quoteId")%>"/></td></tr>
	<%
	 	}			
	%>
	<%String productId="";
	if(request.getParameter("answer(Object::Quote::ProductId)")!=null)
	{
		productId = request.getParameter("answer(Object::Quote::ProductId)");
	
	}%>
		<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)" />
		<%
		String memberAssociation="";
		if(request.getParameter("answer(Object::Quote::MemberAssociation)")!=null){
			memberAssociation=request.getParameter("answer(Object::Quote::MemberAssociation)");
		}
		String compositeRate="";
		if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
			compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
		}		
		%>
	<logic:notEqual parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >
	<tr>
		<td>		
			<jsp:include page="/common/QuoteHeaderCreateQuoteCoverMin.jsp">

				<jsp:param name="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
				<jsp:param name="answer(Object::Quote::ProductVerId)" value="<%=""+ProductVerId%>" />
				
			</jsp:include>

		</td>
	</tr>
	</logic:notEqual>
	<tr>
		<td>
			<table WIDTH="95%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
			
				<tr>
					<td>
						<table WIDTH="95%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
						
							<tr>
								<td>
									
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true">										
											<tr>
												<td>
													<jsp:include page="/common/PolicyQuoteHeaderCoverMin.jsp">											
														<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="ParentQuoteId" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
														<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />	
														<jsp:param name="paretQuoteStatus" value="<%=""+strParetQuoteStatus%>" />	
														<jsp:param name="customerId" value="<%=""+customerId%>" />											
													</jsp:include>		 										
												</td>											
											</tr>	
											<tr>
												<td>
													<jsp:include page="../common/DynamicPolicyHeaderUI3.jsp">
														<jsp:param name="policyId" value="<%=""+parentPolicyId.toString()%>" />
														<jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
														<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
														<jsp:param name="prodId" value="<%=""+productId%>" />
														<jsp:param name="ProductVerId" value="<%=""+ProductVerId%>" />								
														<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
													</jsp:include>
												</td>
											</tr>														
										</dmshtml:dms_static_with_connector>
								
								</td>
							
							</tr>
							<tr>
								<td>
									<jsp:include page="/common/EndorsementQuoteInformation.jsp">
										<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+strParentQuoteId%>" />
										<jsp:param name="ParentQuoteId" value="<%=""+strParentQuoteId%>" />
										<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
										<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />	
										<jsp:param name="paretQuoteStatus" value="<%=""+strParetQuoteStatus%>" />	
										<jsp:param name="customerId" value="<%=""+customerId%>" />	
										<jsp:param name="subQuoteVerId" value="<%=""+subQuoteVerIdParam%>" />
										<jsp:param name="subQuoteId" value="<%=""+subQuoteIdParam%>" />
									</jsp:include>
								</td>
							</tr>
							<tr>
								<td align="left">
									<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
										<tr>
											<td>
												<table width="100%" border="0">
													<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
													<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
													<tr><td><html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
													</td></tr>
													<tr>
														<bean:define id="parentQuoteId" name="AddQuote" property="answer(Object::Quote::Id)"/>
														
														<td colspan="2" class="links">
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(policyNumber)=<%=""+policyNumber%>"  title="<bean:message key='ToolTip.LapseQuote.QuoteSummary'/>">Quote Summary</a>
														</td>
														
													</tr>

													<tr>
													
														<td  colspan="6" align="center" class="sectionhead">
														
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
			</table>
		</td>
	</tr>
<tr><td>
<html:hidden name="AddQuote" property="formName" value="form::CREATEQUOTEVERSION"/>
<html:hidden property="page" value="7" />
<!--html:hidden name="AddQuote" property="answer(Object::Product::ProductState)" value="RELEASED"/-->
<!-- new changes for workflow -->

<html:hidden property="answer(object::workflow::processdata::offered)" value="no" />
<html:hidden property="answer(object::workflow::processdata::pName)" value="no" />
<html:hidden property="answer(object::workflow::processdata::modify)" value="no" />
<html:hidden property="answer(object::workflow::processdata::reapply)" value="no" />
<html:hidden property="answer(object::workflow::processdata::changeType)" value="" />
<html:hidden property="answer(object::workflow::processdata::rejected)" value="no" />
<html:hidden property="answer(object::workflow::processdata::lost)" value="yes" />
<input type="hidden" name="action" value="complete">
<!-- new changes for workflow -->

<!-- New hidden variables -->

<!--html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/-->
<html:hidden property="answer(Object::Notes::Active)" value="Y" />
<html:hidden property="answer(Object::Notes::UserName)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Notes::UserRole)" value="<%=userId.toString()%>" />
<html:hidden property="answer(QuoteId)" value="<%=""+strParentQuoteId%>" />
<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
<html:hidden property="answer(Quote::Page)" value="StatusChange" />
<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+customerId%>' />
<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
<html:hidden property="answer(Object::Quote::MemberAssociation)" value='<%=""+memberAssociation %>' />
<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value='<%=""+compositeRate %>' />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<html:hidden property ="answer(pagename)" value="Lapse Quote page" />
<html:hidden property="answer(isUpdated)" value="Y" />
	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
<html:hidden  property="answer(Object::Quote::PrevSubQuoteVerId)" value="<%=subQuoteVerId .toString()%>" />
<html:hidden property="answer(Object::Notes::Description)" value="Lapse Notes"/>

	

</td></tr>
</table>
</td>
</tr>
</table>	
										
					<table  ALIGN="left" border="0"  CELLPADDING="0" class="SubjectivityPage">						
						<div class="Subjectivityformhead"><h2 class="left">Lapse QUOTE</h2><br/></div>						
						
						
							<tr class="content">
											<td>
												<table WIDTH="75%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">													
													<tr>
											<td>
												<h3>Lapse Details</h3>
											</td>
										</tr>		
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
													<tr>
														<td class="TextMatter1" align="left">					
															Reason for Lapse 
														</td>
														<td class="TextMatter1" align="left">
															<dmshtml:get_DropDown_Values dbname='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'  lookupType="Lapse_Reason" nameInSession="dropDownValues" ownerId='<%=""+ownerId %>' />							
																<logic:present name="dropDownValues" scope="request">									
																	<bean:define id="dropDownValueList" name="dropDownValues" type="java.util.ArrayList"/>			
																		<html:select property="answer(Object::QuoteAdditional::LapseReason)" styleClass='txtbox' styleId="Lapse_Reason" value="">
																			<%for(int i=0;i<dropDownValueList.size();i++) {
																				com.dms.ejb.data.QuestionHashMap dropDownMap=(com.dms.ejb.data.QuestionHashMap)dropDownValueList.get(i);	
																			%>											
																			<html:option value ='<%=dropDownMap.getString("DropDownValue")%>'>
																				<%=dropDownMap.getString("DropDownDescription")%>
																			</html:option>										
																			<%}%>
																		</html:select>
																</logic:present>
														</td>
													</tr>
													<tr>
														<td>
															&nbsp;
														</td>
													</tr>													
													<tr>
														<td class="TextMatter1" align="left">
					
															Notes
														</td>
														<td class="TextMatter1" align="left">
															<dmshtml:dms_textarea styleClass="txtarea" name="AddQuote"  property="answer(Object::QuoteAdditional::LapseNotes)" rows="6" cols="80" value=""/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										
										<tr><td><html:hidden property="answer(Object::Quote::QuoteStatus)" value="Lapsed" />
										</td></tr>
									
								</td>
							</tr>
							<tr>
								<td>
									<table WIDTH="75%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										
										<tr>
											<td align="center" class="links" colspan="4">
												<dmshtml:dms_isPresent property="<%=new String[]{"Sold", "Lapsed", "Rejected"}%>" value="<%=strParetQuoteStatus.toString()%>" >
													<span title="<bean:message key='ToolTip.LapseQuote.Save'/>"><INPUT TYPE="submit" value="Save" class="sbttn"></span>
												</dmshtml:dms_isPresent>
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
						
					
</html:form>


<script type="text/javascript">
document.getElementById("quoteHeaderLink").onclick = function(){

	showHideHeader();
	var a = document.getElementById('Quote:TxtChange');
	var b = a.innerHTML;
	if(b == "Click here to hide detail") {
		document.getElementById('quoteheader_inner').style.height = "10em";
	}
	else {
		document.getElementById('quoteheader_inner').style.height = "1em";
	}
}
</script>
