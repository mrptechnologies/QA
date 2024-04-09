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
			}else if(request.getAttribute("answer(Object::Agency::AgencyId)")!=null){
				agencyIdTemp = ""+request.getAttribute("answer(Object::Agency::AgencyId)");
			}
			String quoteSubjId="";
			String customerId="";
			if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
			{
				customerId=request.getParameter("answer(Object::Customer::CustomerId)");
				
			}else if(request.getAttribute("answer(Object::Customer::CustomerId)")!=null){
				customerId = ""+request.getAttribute("answer(Object::Customer::CustomerId)");
			}
			
			String strParetQuoteStatus="";
			if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
			{
				strParetQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
			}else if(request.getAttribute("answer(Object::Quote::QuoteStatus)")!=null){
				strParetQuoteStatus = ""+request.getAttribute("answer(Object::Quote::QuoteStatus)");
			}

			String strParentQuoteId="";
			if(request.getParameter("answer(Object::Quote::ParentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(Object::Quote::ParentQuoteId)");
			}else if(request.getAttribute("answer(Object::Quote::ParentQuoteId)")!=null){
				strParentQuoteId = ""+request.getAttribute("answer(Object::Quote::ParentQuoteId)");
			}

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}else if(request.getAttribute("answer(Object::Quote::ProductVerId)")!=null){
				ProductVerId = ""+request.getAttribute("answer(Object::Quote::ProductVerId)");
			}			
			
			String compositeRate="";
			if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
				compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
			}else if(request.getAttribute("answer(Object::Plan::CompositeRateFlag)")!=null){
				compositeRate = ""+request.getAttribute("answer(Object::Plan::CompositeRateFlag)");
			}
			
			String isApplnAvailable="";
			if(request.getParameter("answer(isApplnAvailable)")!=null){
				isApplnAvailable=request.getParameter("answer(isApplnAvailable)");
			}else if(request.getAttribute("answer(isApplnAvailable)")!=null){
				isApplnAvailable = ""+request.getAttribute("answer(isApplnAvailable)");
			}
			
			String parentQuoteVerId="";
			if(request.getParameter("answer(Object::Quote::ParentQuoteVerId)")!=null){
				parentQuoteVerId=request.getParameter("answer(Object::Quote::ParentQuoteVerId)");
			}else if(request.getAttribute("answer(Object::Quote::ParentQuoteVerId)")!=null){
				parentQuoteVerId = ""+request.getAttribute("answer(Object::Quote::ParentQuoteVerId)");
			}
			
			String subQuoteId1="";
			if(request.getParameter("answer(Object::Quote::SubQuoteId)")!=null){
				subQuoteId1=request.getParameter("answer(Object::Quote::SubQuoteId)");
			}else if(request.getAttribute("answer(Object::Quote::SubQuoteId)")!=null){
				subQuoteId1 = ""+request.getAttribute("answer(Object::Quote::SubQuoteId)");
			}
			
			
			String subQuoteVerId1="";
			if(request.getParameter("answer(Object::Quote::SuQuoteVerId)")!=null){
				subQuoteVerId1=request.getParameter("answer(Object::Quote::SuQuoteVerId)");
			}else if(request.getAttribute("answer(Object::Quote::SuQuoteVerId)")!=null){
				subQuoteVerId1 = ""+request.getAttribute("answer(Object::Quote::SuQuoteVerId)");
			}
			
			String productId="";
			if(request.getParameter("answer(Object::Quote::ProductId)")!=null){
				productId=request.getParameter("answer(Object::Quote::ProductId)");
			}else if(request.getAttribute("answer(Object::Quote::ProductId)")!=null){
				productId = ""+request.getAttribute("answer(Object::Quote::ProductId)");
			}
			String parentPolicyId="";
			if(request.getParameter("answer(parentPolicyId)")!=null){
				parentPolicyId=request.getParameter("answer(parentPolicyId)");
			}
			String policyVerId="";
			if(request.getParameter("answer(policyVerId)")!=null){
				policyVerId=request.getParameter("answer(policyVerId)");
			}
			String policyNumber="";
			if(request.getParameter("answer(policyNumber)")!=null){
				policyNumber=request.getParameter("answer(policyNumber)");
			}
		
		%>		
		<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
		<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
		<table>
<tr><td>
<div id="dialog1" style='display: none;'>

<div class="hd">Enter Your Notes Here</div>
<div class="bd">
<table cellpadding="1" cellspacing="0">
  	 <tr>
  	   <td> 
  	     <h6>Notes Description:</h6>
  	   </td>
       <td> 
         <input type = text name="answer(Object::Notes::Description)" id="notesDesc" size="50" maxlength="54" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal View Only 
        <input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/> </td>
     </tr>
  	 <tr>
  	 <td>
  	   <h6>Notes:</h6>
  	 </td>
  	<td>
  	<div id="text">
  	 <textarea  name="answer(Object::Notes::Notes)" id="editor" rows="6" cols="80"> </textarea> 
  	</div> 
  	</td>
  </tr>
   <tr>
             <td width=50>&nbsp;</td>
             <td align=center>
              <html:button property="Save" value=" Save " styleClass="uibutton"  styleId="save" onmouseover="" />
              <html:button property="Cancel" value="Cancel" styleClass="uibutton" styleId="cancel" />
               </td>
              </tr>
</table>
</div>
</div>

</td>
</tr>


</table>
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
					<td >
						<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td>
									<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
								</td>
							</tr>
							<tr>
								<td>
									<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
		
										<tr>
											<td >
												
													<jsp:include page="../common/DynamicPolicyHeader.jsp">
														<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
														<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
														<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
														<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
													</jsp:include>
												
											</td>
										</tr>
										<tr>
											<td>
												<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
												 	<tr>
														<td align="left">	
															<jsp:include page="../common/EndorsementQuoteHeader.jsp">
																<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
															</jsp:include>	
														</td>
													</tr>		
												</table>	
											</td>
										</tr>
										<td>
											<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyIdTemp%>&answer(QuoteId)=<%=""+strParentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+strParentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Return to Quote Summary</a>			
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="/getEndorsementSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::ParentQuoteId)=<%=strParentQuoteId.toString()%>&answer(Object::Quote::ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::SubQuoteId)=<%=subQuoteId1.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId1%>&answer(Object::Quote::ProductId)=<%=""+productId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Quote::QuoteStatus)=<%=strParetQuoteStatus.toString()%>">Return to Subjectivity</a>	
										</td>
										</tr>
										<tr><td>&nbsp;</td></tr>
										<tr>
											<td class="NewSectionHeadNew" align="center">SUBJECTIVITY SUMMARY</td>
										</tr>	
										<tr><td>&nbsp;</td></tr>
										<tr>										
										<tr>
											<td>
											<html:form action="/SaveEndorsementSubjectivity.do">
												<table width="92%" align="right" border="0" cellspacing="" cellpadding="">
												<logic:present name="SubjectivityDetail" >
												<tr>
													<td class="FormLabels" width="30%">
														Description
													</td>												
													<td class="TextMatter">
													<bean:define id="desc" name="SubjectivityDetail" property="subjectivityDesc" />
													<%=""+desc %>
													<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityDesc)" value="<%=""+desc%>" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Level
													</td>												
													<td class="TextMatter">
													<bean:define id="subjectivityLevel" name="SubjectivityDetail" property="subjectivityLevel" />
													<%
													String level="";
													if((""+subjectivityLevel).equalsIgnoreCase("Risk")){
														level = "Tank";
													}else{
														level = ""+subjectivityLevel;
													}
													%>
													<%=""+level %>
													<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityLevel)" value="<%=""+subjectivityLevel%>" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Type
													</td>												
													<td class="TextMatter">
													<bean:define id="subjectivityType" name="SubjectivityDetail" property="subjectivityType" />
													<%=""+subjectivityType %>
													<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityType)" value="<%=""+subjectivityType%>" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Required Before
													</td>		
													<bean:define id="subjectivityRequiredProcess" name="SubjectivityDetail" property="subjectivityRequiredProcess" />													
													<td class="TextMatter">	
													<%=""+subjectivityRequiredProcess %>			
													<html:hidden value="<%=""+subjectivityRequiredProcess %>" property="answer(Object::Quote::Subjectivity::SubjectivityRequiredProcess)" />																											
													</td>
													
												</tr>
												<tr><td>&nbsp;</td></tr>	
												<tr>
													<td class="FormLabels">
														Cause
													</td>												
													<td class="TextMatter">
													<bean:define id="cause" name="SubjectivityDetail" property="cause" />
													<%=""+cause %>
													<html:hidden property="answer(Object::Quote::Subjectivity::Cause)" value="<%=""+cause%>" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Location
													</td>												
													<td class="TextMatter">
													<bean:define id="locationNumber" name="SubjectivityDetail" property="locationNumber" />
													<%=""+locationNumber %>
													<html:hidden property="answer(Object::Quote::Subjectivity::LocationNumber)" value="<%=""+locationNumber%>" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Location Name
													</td>												
													<td class="TextMatter">
													<bean:define id="locationName" name="SubjectivityDetail" property="locationName" />
													<%=""+locationName %>
													<html:hidden property="answer(Object::Quote::Subjectivity::LocationName)" value="<%=""+locationName%>" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Tank
													</td>												
													<td class="TextMatter">
													<bean:define id="riskNumer" name="SubjectivityDetail" property="riskNumer" />
													<%=""+riskNumer %>
													<html:hidden property="answer(Object::Quote::Subjectivity::RiskNumer)" value="<%=""+riskNumer%>" />
													</td>
												</tr>	
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Tank Name
													</td>												
													<td class="TextMatter">
													<bean:define id="riskName" name="SubjectivityDetail" property="riskName" />
													<%=""+riskName %>
													<html:hidden property="answer(Object::Quote::Subjectivity::RiskName)" value="<%=""+riskName%>" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Status
													</td>												
													<td class="link">
													<bean:define id="status" name="SubjectivityDetail" property="status" />	
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">												
													<html:select value="<%=""+status %>" styleClass="txtbox" property="answer(Object::Quote::Subjectivity::Status)">
														<html:option value="Open">Open</html:option>
														<html:option value="Satisfied">Satisfied</html:option>
														<html:option value="Not Required">Not Required</html:option>
														<html:option value="Rejected">Rejected</html:option>
													</html:select>						
													</dmshtml:dms_static_with_connector>	
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="false">						
														<%=""+status %>
														<html:hidden value="<%=""+status %>" property="answer(Object::Quote::Subjectivity::Status)" />
													</dmshtml:dms_static_with_connector>
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Last Modified
													</td>												
													<td class="TextMatter">
													<bean:define id="updatedDate" name="SubjectivityDetail" property="updatedDate" />
													<%														
														String arrOfUpdatedDate[] = (""+updatedDate).split("-");
														String Month = arrOfUpdatedDate[1];
														String DateObj = arrOfUpdatedDate[2];
														String Year = arrOfUpdatedDate[0];
													%>
													<%=""+Month+"/"+DateObj+"/"+Year %>
													<html:hidden property="answer(Object::Quote::Subjectivity::UpdatedDate)" value="<%=""+updatedDate%>" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Modified By
													</td>												
													<td class="TextMatter">
													<bean:define id="updatedBy" name="SubjectivityDetail" property="updatedBy" />
													<%=""+updatedBy %>													
													</td>
												</tr>			
												<tr>
													<td>
														<bean:define id="quoteSubjectivityId" name="SubjectivityDetail" property="quoteSubjectivityId" />
														<% quoteSubjId = ""+quoteSubjectivityId;  %>
														<html:hidden property="answer(Object::Quote::Subjectivity::QuoteSubjectivityId)" value="<%=""+quoteSubjectivityId%>" />
														
														<bean:define id="quoteId" name="SubjectivityDetail" property="quoteId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::QuoteId)" value="<%=""+quoteId%>" />
														
														<bean:define id="quoteVerId" name="SubjectivityDetail" property="quoteVerId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::QuoteVerId)" value="<%=""+quoteVerId%>" />
														
														<bean:define id="subQuoteId" name="SubjectivityDetail" property="subQuoteId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::SubQuoteId)" value="<%=""+subQuoteId%>" />
														
														<bean:define id="subQuoteVerId" name="SubjectivityDetail" property="subQuoteVerId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::SubQuoteVerId)" value="<%=""+subQuoteVerId%>" />
														
														<bean:define id="subjectivityId" name="SubjectivityDetail" property="subjectivityId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityId)" value="<%=""+subjectivityId%>" />
														
														<bean:define id="subjectivityVerId" name="SubjectivityDetail" property="subjectivityVerId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityVerId)" value="<%=""+subjectivityVerId%>" />
														
														<bean:define id="subjectivityName" name="SubjectivityDetail" property="subjectivityName" />
														<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityName)" value="<%=""+subjectivityName%>" />
																								
														<bean:define id="locationId" name="SubjectivityDetail" property="locationId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::LocationId)" value="<%=""+locationId%>" />

														<bean:define id="riskId" name="SubjectivityDetail" property="riskId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::RiskId)" value="<%=""+riskId%>" />
														
														<bean:define id="active" name="SubjectivityDetail" property="active" />
														<html:hidden property="answer(Object::Quote::Subjectivity::Active)" value="<%=""+active%>" />
														
														<bean:define id="createdBy" name="SubjectivityDetail" property="createdBy" />
														<html:hidden property="answer(Object::Quote::Subjectivity::CreatedBy)" value="<%=""+createdBy%>" />
														
														<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
														<html:hidden property="answer(Object::Quote::Subjectivity::UpdatedBy)" value="<%=""+usernameId%>" />
														<html:hidden property="answer(TabPanelName)" value="Quote_Panel" />
														<html:hidden property="TabPanelName" value="Quote_Panel" />
														<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=""+ownerId%>" />
														<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>" />
														<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=""+usernameId%>" />
														<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>" />
														<html:hidden property="answer(pagename)" value="<%="Quote Subjectivity"%>" />
							
														<html:hidden property="answer(Object::Quote::Subjectivity::OwnerId)" value="<%=""+ownerId%>" />
														<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>" />
														<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+strParetQuoteStatus%>" />
														<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+strParentQuoteId%>" />
														<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=""+ProductVerId%>" />
														<html:hidden property="answer(Object::Quote::ParentQuoteVerId)" value="<%=""+parentQuoteVerId%>" />
														<html:hidden property="answer(Object::Quote::SubQuoteId)" value="<%=""+subQuoteId1%>" />
														<html:hidden property="answer(Object::Quote::SuQuoteVerId)" value="<%=""+subQuoteVerId1%>" />
														<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>" />
														<html:hidden property="answer(parentPolicyId)" value="<%=""+parentPolicyId%>" />
														<html:hidden property="answer(policyVerId)" value="<%=""+policyVerId%>" />
														<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />
														
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>			
												<tr>
													<td align="center">	
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">												
															<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
																property='<%=new String[]{"In Progress","Bind Request"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<html:submit property="answer(Submit)" value="Save" styleClass="sbttn" />
															</dmshtml:isFeatureAvailableForProductRoleStatus>
													</dmshtml:dms_static_with_connector>
													</td>													
												</tr>																																								
												</logic:present>												
												</table>
												</html:form>
											</td>
										</tr>	
										<tr style="display:none">
											<td width="40%" rowspan="1">
											<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SENT_EMAIL"}%>' connector='or' negated="true">
										
													<jsp:include page="../email/DisplayEmailList.jsp">
														<jsp:param name="answer(Object::Notification::Email::ObjectId)" value="<%=""+quoteSubjId%>" />
														<jsp:param name="answer(Object::Notification::Email::ObjectVerId)" value="<%=""+0%>" />
														<jsp:param name="answer(Object::Notification::Email::UserName)" value="<%=""+userId%>" />
														<jsp:param name="answer(Object::Notification::Email::SubQuoteVerId)" value="<%=""+0%>" />
														<jsp:param name="answer(Object::Notification::Email::QuoteStatus)" value="<%="" %>" />
														<jsp:param name="answer(Object::Notification::Email::EndorsementStatusFlag)" value="NO" />
														<jsp:param name="answer(Object::Notification::UserDetail::Email)" value="<%=""+""%>" />
										  				<jsp:param name="answer(Object::Notification::UserDetail::RoleName)" value="<%=""%>" />
										  				<jsp:param name="answer(Object::Notification::Email::QuoteNumber)" value="<%=0%>" />
														<jsp:param name="answer(Object::Notification::Email::QuoteSubNumber)" value="<%=0%>" />
										  				<jsp:param name="answer(Object::Notification::Email::PolicyNumber)" value="<%=""+0%>" />
										   				<jsp:param name="answer(Object::Notification::Email::ObjectType)" value="QUOTE" />
										  				<jsp:param name="answer(Object::Notification::Email::InsuredName)" value="<%=""+0 %>" />
												    </jsp:include>
												</dmshtml:dms_static_with_connector>
												</td>
												 
											</tr>
										<tr>
											<td>											
										
									
												<jsp:include page="../notes/DairyNotes.jsp">
													<jsp:param name="answer(Object::Notes::ObjectId)" value="<%=""+quoteSubjId%>" />
													<jsp:param name="answer(Object::Notes::ObjectVerId)" value="<%=""+0%>" />
													<jsp:param name="answer(Object::Notes::ObjectType)" value="Subjectivity" />
													<jsp:param name="answer(Object::Notes::UserName)" value="<%=""+userId%>" />
													<jsp:param name="answer(Object::Notes::UserRole)" value="<%=""+customerId%>" />
													<jsp:param name="answer(APPROVAL_STATUS_NEEDED)" value="YES" />
													
												</jsp:include>
											
											</td>
										</tr>
										<tr>
											<td>
											&nbsp;
											</td>
										</tr>
									    <tr>
										    <td>
										    	
									
												  <jsp:include page="../attachment/Attachment.jsp">
												  <jsp:param name="answer(Object::Attachment::ObjectId)" value="<%=""+quoteSubjId%>" />
													<jsp:param name="answer(Object::Attachment::ObjectVerId)" value="<%=""+0%>" />
													<jsp:param name="answer(Object::AttachmentObjectLink::ObjectType)" value="Subjectivity" />
													<jsp:param name="answer(APPROVAL_STATUS_NEEDED)" value="YES" />
												  </jsp:include>
											
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
</table>