<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CauseListTable.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/utilities/utilities.js"></script>

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
		
		%>		
		<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
		<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
		<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
		<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
		<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
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
						<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
							<tr>
								<td>
									<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
								</td>
							</tr>
						 </logic:notEqual>
							<tr>
								<td>								
									<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	                                <logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
										<tr>
											<td >
												<table width="60%" align="Left" border="0">
													<jsp:include page="../common/QuoteHeader.jsp">
														<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
														<jsp:param name="heading" value="" />
													</jsp:include>
												</table>
											</td>
										</tr>
									  </logic:notEqual>
										<td>
											<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">Return to Quote Summary</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="/getSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::ParentQuoteId)=<%=strParentQuoteId.toString()%>&answer(Object::Quote::ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Quote::SubQuoteId)=<%=subQuoteId1.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId1%>&answer(Object::Quote::ProductId)=<%=""+productId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ownerId)=<%=ownerId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=strParetQuoteStatus.toString()%>">Return to Subjectivity</a>
										</td>
										</tr>
										<tr><td>&nbsp;</td></tr>
										<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
										<tr>
											<td class="NewSectionHeadNew" align="center">SUBJECTIVITY SUMMARY</td>
										</tr>	
										</logic:notEqual>
										</table>
										<div class="SubjectivityPage">									
										<div class="content">							
										<div class="Subjectivityformhead"><h2 class="left">Subjectivity Summary</h2></div>						
										<h3>Subjectivity Details</h3>	
										<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																																					
										<tr>
											<td>
											<html:form action="/SaveSubjectivity.do" onsubmit="return validateSubmit(this)">
												<table width="100%" align="right" border="0" cellspacing="" cellpadding="">
												<logic:present name="SubjectivityDetail" >
												<tr>
													<td class="FormLabels" align="right" width="30%">
														Description :
													</td>												
													<td class="TextMatter">
													<bean:define id="desc" name="SubjectivityDetail" property="subjectivityDesc" />
													<%=""+desc %>
													<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityDesc)" value="<%=""+desc%>" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td align="right" class="FormLabels">
														Level :
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
											</table>
										</td>
									</tr>	
									<tr>
										<td>
											<table width="92%" align="right" border="0" cellspacing="" cellpadding="">
												<tr><td class="FormLabels">Cause List:</td></tr>												
												<tr>
													<td> 														
														<div id="CAUSE_LIST_TABLE"></div>
													</td> 
												</tr>
											</table>																																	
										</td>
									</tr>
									<tr>
										<td>
											<table width="92%" align="right" border="0" cellspacing="" cellpadding="">												
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td align="right" class="FormLabels">
														Type :
													</td>												
													<td class="TextMatter">
													<bean:define id="subjectivityType" name="SubjectivityDetail" property="subjectivityType" />
													<%=""+subjectivityType %>
													<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityType)" value="<%=""+subjectivityType%>" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td align="right" class="FormLabels">
														Required Before :
													</td>		
													<bean:define id="subjectivityRequiredProcess" name="SubjectivityDetail" property="subjectivityRequiredProcess" />													
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">										
													<td class="links">													
													<html:select value="<%=""+subjectivityRequiredProcess %>" styleId="subjectivityRequiredProcess" styleClass="txtbox" property="answer(Object::Quote::Subjectivity::SubjectivityRequiredProcess)">
														<html:option value="Post Bind">Post Bind</html:option>
														<html:option value="Pre Bind">Pre Bind</html:option>
													</html:select>													
													</td>
													</dmshtml:dms_static_with_connector>
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="false">
													<td class="TextMatter">	
													<%=""+subjectivityRequiredProcess %>			
													<html:hidden value="<%=""+subjectivityRequiredProcess %>" property="answer(Object::Quote::Subjectivity::SubjectivityRequiredProcess)" />																											
													</td>
													</dmshtml:dms_static_with_connector>
												</tr>
												<tr><td>&nbsp;</td></tr>	
												<tr>
													<td align="right" class="FormLabels">
														Status
													</td>												
													<td class="link">
													<bean:define id="status" name="SubjectivityDetail" property="status" />	
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">												
													<html:select value="<%=""+status %>" styleClass="txtbox" styleId="SubjectivityStatus" property="answer(Object::Quote::Subjectivity::Status)">
														<html:option value="Open">Open</html:option>
														<html:option value="Satisfied">Satisfied</html:option>
														<html:option value="Overridden">Overridden</html:option>
														<html:option value="Not Required">Not Required</html:option>
														<html:option value="Rejected">Rejected</html:option>
													</html:select>						
													</dmshtml:dms_static_with_connector>	
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="false">						
														<%=""+status %>
														<html:hidden value="<%=""+status %>" styleId="SubjectivityStatus" property="answer(Object::Quote::Subjectivity::Status)" />
													</dmshtml:dms_static_with_connector>
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td align="right" class="FormLabels">
														Last Modified :
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
													<td align="right" class="FormLabels">
														Modified By :
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
														<html:hidden styleId="quoteSubjectivityIdHidden" property="answer(Object::Quote::Subjectivity::QuoteSubjectivityId)" value="<%=""+quoteSubjectivityId%>" />
														
														<bean:define id="quoteId" name="SubjectivityDetail" property="quoteId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::QuoteId)" value="<%=""+quoteId%>" />
														
														<bean:define id="quoteVerId" name="SubjectivityDetail" property="quoteVerId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::QuoteVerId)" value="<%=""+quoteVerId%>" />
														
														<bean:define id="subQuoteId" name="SubjectivityDetail" property="subQuoteId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::SubQuoteId)" value="<%=""+subQuoteId%>" />
														
														<bean:define id="subQuoteVerId" name="SubjectivityDetail" property="subQuoteVerId" />
														<html:hidden property="answer(Object::Quote::Subjectivity::SubQuoteVerId)" value="<%=""+subQuoteVerId%>" />
														
														<bean:define id="subjectivityId" name="SubjectivityDetail" property="subjectivityId" />
														<html:hidden styleId="subjectivityIdHidd" property="answer(Object::Quote::Subjectivity::SubjectivityId)" value="<%=""+subjectivityId%>" />
														
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
														<html:hidden property="answer(Object::Quote::Subjectivity::OwnerId)" value="<%=""+ownerId%>" />
														<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>" />
														<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+strParetQuoteStatus%>" />
														<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+strParentQuoteId%>" />
														<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=""+ProductVerId%>" />
														<html:hidden property="answer(Object::Quote::ParentQuoteVerId)" value="<%=""+parentQuoteVerId%>" />
														<html:hidden property="answer(Object::Quote::SubQuoteId)" value="<%=""+subQuoteId1%>" />
														<html:hidden property="answer(Object::Quote::SuQuoteVerId)" value="<%=""+subQuoteVerId1%>" />
														<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>" />
														<html:hidden property="answer(Object::Activity::OwnerId)"  value="<%=""+ownerId%>" />
														<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>" />
														<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=""+usernameId%>" />
														<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>" />
														<html:hidden property="answer(Object::Activity::ActivityMsg)" value="<%="Added Location through Endorsement"%>" />
														<html:hidden property="answer(pagename)" value="<%="Quote Subjectivity"%>" />
														<html:hidden property="answer(SubmitTest)"  value="<%=""+subjectivityRequiredProcess %>" styleId="subjReqProcess" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>			
												<tr>
													<td align="center">	
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">												
															<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
																property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">
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
									</table> </div></div>									
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<script type="text/javascript">
			refereshCauseList(document.getElementById('quoteSubjectivityIdHidden').value);
			function validateSubmit(frm){
				if(frm.subjectivityRequiredProcess.value=='Post Bind' && frm.subjReqProcess.value =='Pre Bind' ){
					frm.SubjectivityStatus.value ='Overridden';
				}
				
				if(frm.SubjectivityStatus.value =='Overridden' && frm.subjectivityRequiredProcess.value=='Pre Bind' && frm.subjReqProcess.value =='Pre Bind'){
					frm.subjectivityRequiredProcess.value = 'Post Bind';
				}
				
				if(frm.subjectivityRequiredProcess.value =='Pre Bind' && frm.subjReqProcess.value =='Post Bind' ){
					frm.SubjectivityStatus.value ='Open';
				}
								
				return true;
			}
			
			</script>
		</td>
	</tr>
</table> 