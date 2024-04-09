<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

		<%						
			String quoteSubjId="";
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
			if(request.getParameter("answer(Object::Quote::ParentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(Object::Quote::ParentQuoteId)");
			}
			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}														
			String parentQuoteVerId="";
			if(request.getParameter("answer(Object::Quote::ParentQuoteVerId)")!=null){
				parentQuoteVerId=request.getParameter("answer(Object::Quote::ParentQuoteVerId)");
			}			
			String subQuoteId1="";
			if(request.getParameter("answer(Object::Quote::SubQuoteId)")!=null){
				subQuoteId1=request.getParameter("answer(Object::Quote::SubQuoteId)");
			}						
			String subQuoteVerId1="";
			if(request.getParameter("answer(Object::Quote::SuQuoteVerId)")!=null){
				subQuoteVerId1=request.getParameter("answer(Object::Quote::SuQuoteVerId)");
			}			
			String productId="";
			if(request.getParameter("answer(Object::Quote::ProductId)")!=null){
				productId=request.getParameter("answer(Object::Quote::ProductId)");
			}		
		%>			
		<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />	
		<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
		<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />		
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
					<div class="SubjectivityPage">									
					<div class="content">							
					<div class="Subjectivityformhead"><h2 class="left">Subjectivity Summary</h2></div>						
					<h4>Subjectivity Details</h4>
						<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">						
							<tr>
								<td width="100%">																											
									<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																																															
										<html:form styleId="Subjectivity_Detail" action="/SaveSubjectivity.do" onsubmit="return validateSubmit(this)">
											
											<logic:present name="SubjectivityDetail" >
											<tr>
												<td class="field1" align="right" valign="top" width="25%">
													Description :&nbsp;
												</td>												
												<td class="TextMatter" align="top">
												<bean:define id="desc" name="SubjectivityDetail" property="subjectivityDesc" />
												<%
												String subjDescription = "" + desc;
												subjDescription = subjDescription.replaceAll("\n", "<br>");
												subjDescription = subjDescription.replaceAll("\r", "");%>
												<%=""+subjDescription %>
												<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityDesc)" value="<%=""+desc%>" />
												</td>
											</tr>															
											<tr>
												<td align="right" class="field1">
													Level :&nbsp;
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
									<tr>
										<td align="right" class="field1">
											Type :&nbsp;
										</td>												
										<td class="TextMatter">
										<bean:define id="subjectivityType" name="SubjectivityDetail" property="subjectivityType" />
										<%=""+subjectivityType %>
										<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityType)" value="<%=""+subjectivityType%>" />
										</td>
									</tr>						
									<tr>
										<td align="right" class="field1">
											Required Before :&nbsp;
										</td>		
										<bean:define id="subjectivityRequiredProcess" name="SubjectivityDetail" property="subjectivityRequiredProcess" />													
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">										
										<td class="links">													
										<html:select value="<%=""+subjectivityRequiredProcess %>" styleId="subjectivityRequiredProcess" styleClass="txtbox" property="answer(Object::Quote::Subjectivity::SubjectivityRequiredProcess)" onchange="updatePostIssuanceStatus('subjReqProcess','subjectivityRequiredProcess')">
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
									<%String locationNo="";String locationName="";String riskNo="";String riskName="";boolean loadValue=false;long count=1;%>
									<tr>
										<td align="right" class="field1" valign="top">
											Cause :&nbsp;
										</td>
										<td class="TextMatter" valign="top">										
											<logic:iterate id="causeDetail" name="SubjectivityDetail" property="causeList">
												<%if(!loadValue){%>
													<bean:define id="locationNumber1" name="causeDetail" property="locationNumber" />
													<bean:define id="locationName1" name="causeDetail" property="locationName" />														
													<bean:define id="riskNumber1" name="causeDetail" property="riskNumber" />	
													<bean:define id="riskName1" name="causeDetail" property="riskName" />
													<%
													locationNo=""+locationNumber1;
													locationName=""+locationName1;
													riskNo=""+riskNumber1;
													riskName=""+riskName1;
													loadValue=true;
													%>	
												<%}%>
												<bean:define id="cause" property="cause" name="causeDetail"/>
												<%
												String causeDesc = "" + cause;
												causeDesc = causeDesc.replaceAll("\n", "<br>");
												causeDesc = causeDesc.replaceAll("\r", "");%>
																								
												<%=count+". "%><%=""+causeDesc %><br>
												<%count++;%>
											</logic:iterate>
										</td>
									</tr>																		
									<%if((""+subjectivityLevel).equalsIgnoreCase("Location") || (""+subjectivityLevel).equalsIgnoreCase("Risk")){%>
									<tr>
										<td align="right" class="field1">
											Location No :&nbsp;
										</td>
										<td class="TextMatter">
											<%= locationNo%>
										</td>										
									</tr>
									<tr>
										<td align="right" class="field1">
											Location Name :&nbsp;
										</td>
										<td class="TextMatter">
											<%= locationName%>
										</td>										
									</tr>
									<%} %>	
									<%if((""+subjectivityLevel).equalsIgnoreCase("Risk")){%>
									<tr>
										<td align="right" class="field1">
											Tank No :&nbsp;
										</td>
										<td class="TextMatter">
											<%= riskNo%>
										</td>										
									</tr>
									<tr>
										<td align="right" class="field1">
											Tank Name :&nbsp;
										</td>
										<td class="TextMatter">
											<%= riskName%>
										</td>										
									</tr>																		
									<%} %>																							
									<tr>
										<td align="right" class="field1">
											Status :&nbsp;
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
											<%if((""+subjectivityRequiredProcess).equalsIgnoreCase("Pre Bind")){ %><html:option value="Post Issuance" styleId="PreBindPostIssuance" style="display:none">Post Issuance</html:option><% } %>
											<%if((""+subjectivityRequiredProcess).equalsIgnoreCase("Post Bind")){ %><html:option value="Post Issuance" styleId="PostBindPostIssuance" style="display:block">Post Issuance</html:option><% } %>
										</html:select>						
										</dmshtml:dms_static_with_connector>	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="false">						
											<%=""+status %>
											<html:hidden value="<%=""+status %>" styleId="SubjectivityStatus" property="answer(Object::Quote::Subjectivity::Status)" />
										</dmshtml:dms_static_with_connector>
										</td>
									</tr>
									<tr>
										<td align="right" class="field1">
											Last Modified :&nbsp;
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
									<tr>
										<td align="right" class="field1">
											Modified By :&nbsp;
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
											<html:hidden styleId="ownerId" property="answer(Object::Quote::Subjectivity::OwnerId)" value="<%=""+ownerId%>" />
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
									<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
																property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
									<tr>
										<td colspan="2">
										<table width="90%"><tr><td width="70%" align="right">
										<html:button property="answer(Submit)" onclick="updateSubjectivityDetail(this.form)" value="Save" styleClass="subbutton" />
										</td>
										<td width="20%" align="left"><html:button property="answer(Cancel)" onclick="document.getElementById('SUB_CONT').innerHTML='';YAHOO.example.container.subjDetail.hide();" value="Cancel" styleClass="subbutton" /></td>
										</tr></table>
										</td>
									</tr>
									</dmshtml:dms_static_with_connector>
									</dmshtml:isFeatureAvailableForProductRoleStatus>																																														
									</logic:present>																								
									</html:form>																																																	 							
									</table> 								
								</td>
							</tr>
							<tr>
								<td>
									<h4>Attached Files</h4>	
									<form name="AttachmentListFrm">
									<table WIDTH=100%" ALIGN="center" class="datadispborder"  border="5" CELLSPACING="0" CELLPADDING="0">
										<tr class="locformhead1">
		               						 <td class="datadispcolhead" width="100%" >
		               						 	<table border="0" id="table5" cellspacing="0" cellpadding="0">
			               						 	<tr>
			               						 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
				               						 	<td>		               						 
															<select name="answer(Object::Attachment::ApprovalStatus)" onchange="if(this.value != '') {attachmentStatusChange('<%=""+quoteSubjId %>','<%=""+ownerId %>','Subjectivity')}">
																<option value="" Selected>Change Status</option>
																<option value="Accepted">Accept</option>
																<option value="Rejected">Reject</option>
															</select>
														</td>
														</dmshtml:dms_static_with_connector>
														<td>&nbsp;&nbsp;&nbsp;</td>
														<td>
															<a href="javascript:void(0)" onclick="setQuoteSubjectivityDetails(<%=""+quoteSubjId %>);" class="button2" style="width:100px">Add File</a>
														</td>
														<td>&nbsp;&nbsp;&nbsp;</td>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
														<td>
															<a href="javascript:void(0)" onclick="deleteAttachment('<%=""+quoteSubjId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a>
														</td>
														</dmshtml:dms_static_with_connector>
													</tr>
												</table>
		               					 	 </td>		               					 	 
			               				</tr>
										<tr>
											<td align="left" width="100%">
												<div id="ATTACHMENT_LIST" style="word-wrap:break-word;"></div>
											</td>
										</tr>										
									</table>
									</form>
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>	
							<tr>
								<td>
									<h4>Diary Notes</h4>
									<form name="NotesListFrm">	
									<table WIDTH="100%" class="datadispborder" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr class="locformhead1">
		               						 <td class="datadispcolhead" width="100%" >
		               						 	<table border="0" id="table5" cellspacing="0" cellpadding="0">
			               						 	<tr>
			               						 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
				               						 	<td>		               						 
															<select onchange="if(this.value != '') {notesStatusChange('<%=""+quoteSubjId %>','<%=""+ownerId %>','Subjectivity')}" name="answer(Object::Notes::ApprovalStatus)">
																<option value="" Selected>Change Status</option>
																<option value="Accepted">Accept</option>
																<option value="Rejected">Reject</option>																
															</select>
														</td>
														</dmshtml:dms_static_with_connector>
														<td>&nbsp;&nbsp;&nbsp;</td>
														<td align="left">
															<a href="javascript:void(0)" onclick="showNotes('<%=""+quoteSubjId %>','0','Subjectivity');" class="button2" style="width:100px">Add Notes</a>
														</td>
														<td>&nbsp;&nbsp;&nbsp;</td>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
														<td align="left">
															<a href="javascript:void(0)" onclick="deleteNotes('<%=""+quoteSubjId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a>
														</td>
														</dmshtml:dms_static_with_connector>
													</tr>
												</table>
		               					 	 </td>		               					 	 
			               				</tr>
										<tr>		
											<td align="left" width="100%">
												<div id="NOTES_LIST" style="word-wrap:break-word;"></div>
											</td>
										</tr>
									</table>
									</form>
								</td>
							</tr>	
						</table></div></div>	
					</td>
				</tr>				
			</table>			
		
