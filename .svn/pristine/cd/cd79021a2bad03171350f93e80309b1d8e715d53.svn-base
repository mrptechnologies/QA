<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%
String subjId="";
if(request.getParameter("answer(Object::Policy::Subjectivity::PolicySubjectivityId)")!=null)
{
	subjId=""+request.getParameter("answer(Object::Policy::Subjectivity::PolicySubjectivityId)");				
}
String customerId="";
if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
{
	customerId=""+request.getParameter("answer(Object::Customer::CustomerId)");				
}
String polStatus="";
if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
{
	polStatus=""+request.getParameter("answer(Object::Quote::QuoteStatus)");				
}
String isRenewal = "";
if(request.getParameter("answer(isRenewal)")!=null){	 
	 isRenewal = request.getParameter("answer(isRenewal)");
}
String agencyId = "";
if(request.getParameter("answer(agencyId)")!=null){	 
	 agencyId = request.getParameter("answer(agencyId)");
}
String subjectivityObjectType = "";
if(request.getParameter("answer(subjectivityObjectType)")!=null){	 
	 subjectivityObjectType = request.getParameter("answer(subjectivityObjectType)");
}
%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
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
							<form name="PolicySubjectivityDetail" id="PolicySubjectivityDetail">
							<logic:present name="SubjectivityDetail">																																			
								<table WIDTH="85%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
									<tr>
										<td class="field1" align="right" valign="top" width="25%">
											Description :&nbsp;
										</td>												
										<td class="TextMatter">
										<bean:define id="desc" name="SubjectivityDetail" property="subjectivityDesc" />
										<%
										String subjDescription = "" + desc;
										subjDescription = subjDescription.replaceAll("\n", "<br>");
										subjDescription = subjDescription.replaceAll("\r", "");%>
										<%=""+subjDescription %>
										<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityDesc)" value="<%=""+desc%>" />
										</td>
									</tr>
									<tr>
										<td class="field1" align="right">
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
										<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityLevel)" value="<%=""+subjectivityLevel%>" />
										</td>
									</tr>
									<tr>
										<td class="field1" align="right">
											Type :&nbsp;
										</td>												
										<td class="TextMatter">
										<bean:define id="subjectivityType" name="SubjectivityDetail" property="subjectivityType" />
										<%=""+subjectivityType %>
										<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityType)" value="<%=""+subjectivityType%>" />
										</td>
									</tr>
									<tr>
										<td class="field1" align="right">
											Required Before :&nbsp;
										</td>		
										<bean:define id="subjectivityRequiredProcess" name="SubjectivityDetail" property="subjectivityRequiredProcess" />						
										<td class="TextMatter">	
										<%=""+subjectivityRequiredProcess %>			
										<html:hidden value="<%=""+subjectivityRequiredProcess %>" property="answer(Object::Policy::Subjectivity::SubjectivityRequiredProcess)" />																											
										</td>						
									</tr>
									<%String locationNo="";String locationName="";String riskNo="";String riskName="";boolean loadValue=false;long count=1;%>
									<tr>
										<td align="right" class="field1" valign="top">
											Cause :&nbsp;
										</td>
										<td class="TextMatter" valign="top">										
											<logic:iterate id="cause" name="SubjectivityDetail" property="cause">
												<%if(!loadValue){%>
													<bean:define id="locationNumber1" name="cause" property="locationNumber" />
													<bean:define id="locationName1" name="cause" property="locationName" />														
													<bean:define id="riskNumber1" name="cause" property="riskNumber" />	
													<bean:define id="riskName1" name="cause" property="riskName" />
													<%
													locationNo=""+locationNumber1;
													locationName=""+locationName1;
													riskNo=""+riskNumber1;
													riskName=""+riskName1;
													loadValue=true;
													%>	
												<%}%>
												<bean:define id="cause" name="cause" property="cause"/>
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
										<html:select value="<%=""+status %>" styleId="subjStatus" styleClass="txtbox" property="answer(Object::Policy::Subjectivity::Status)">
											<html:option value="Open">Open</html:option>
											<html:option value="Satisfied">Satisfied</html:option>
											<html:option value="Not Required">Not Required</html:option>
											<html:option value="Rejected">Rejected</html:option>
											<%if((""+subjectivityRequiredProcess).equalsIgnoreCase("Post Bind")){%><html:option value="Post Issuance">Post Issuance</html:option><% } %>
										</html:select>						
										</dmshtml:dms_static_with_connector>	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="false">						
											<%=""+status %>
											<html:hidden value="<%=""+status %>" property="answer(Object::Policy::Subjectivity::Status)" />
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
										<html:hidden property="answer(Object::Policy::Subjectivity::UpdatedDate)" value="<%=""+updatedDate%>" />					
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
									<tr><td>
									<html:hidden property="answer(SubjectivityId)" styleId="policySubjectivityId" value="<%=""+subjId %>" />
									<html:hidden property="answer(Object::Customer::CustomerId)" styleId="policySubjectivityId" value="<%=""+customerId %>" />									
									</td></tr>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
										<tr>
											<td align="right">&nbsp;</td>
											<%if((""+subjectivityRequiredProcess).equalsIgnoreCase("Post Bind")){%> 
											<td align="right">
												<table>
													<tr>
													<%if((!polStatus.equalsIgnoreCase("Issued")) && (!polStatus.equalsIgnoreCase("Expired")) &&(!polStatus.equalsIgnoreCase("CANCELED"))){%> 
														<td>
															<html:button property="answer(Submit)" onclick="updatePoliySubjectivityDetail(this.form)" value="Save" styleClass="subbutton" />
														</td>
														<%} %>													
														<td >
															<html:button property="answer(Cancel)" onclick="document.getElementById('SUB_CONT').innerHTML='';YAHOO.example.container.subjDetail.hide();" value="Cancel" styleClass="subbutton" />				
														</td>
													</tr>
												</table>	
											</td>
											<%} %>	
										</tr>
									</dmshtml:dms_static_with_connector>
								</table>
							</td>
							</logic:present>
							</form>
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
														<select name="answer(Object::Attachment::ApprovalStatus)" onchange="if(this.value != '') {attachmentStatusChange('<%=""+subjId %>','<%=""+ownerId %>','Subjectivity')}">
															<option Selected>Change Status</option>
															<option value="Accepted">Accept</option>
															<option value="Rejected">Reject</option>
														</select>
													</td>
													</dmshtml:dms_static_with_connector>
													<td>&nbsp;&nbsp;&nbsp;</td>
													<td>
														<a href="javascript:void(0)" onclick="setPolicySubjectivityDetails(<%=""+subjId %>);" class="button2" style="width:100px">Add File</a>
													</td>
													<td>&nbsp;&nbsp;&nbsp;</td>
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
													<td>
														<a href="javascript:void(0)" onclick="deleteAttachment('<%=""+subjId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a>
													</td>
													</dmshtml:dms_static_with_connector>
												</tr>
											</table>
		           					 	 </td>		               					 	 
			               			</tr>
									<tr>
										<td align="left" width="98%">
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
														<select onchange="if(this.value != '') {notesStatusChange('<%=""+subjId %>','<%=""+ownerId %>','Subjectivity')}" name="answer(Object::Notes::ApprovalStatus)">
															<option Selected>Change Status</option>
															<option value="Accepted">Accept</option>
															<option value="Rejected">Reject</option>																
														</select>
													</td>
													</dmshtml:dms_static_with_connector>
													<td>&nbsp;&nbsp;&nbsp;</td>
													<td align="left">
														<a href="javascript:void(0)" onclick="showNotes('<%=""+subjId %>','0','Subjectivity');" class="button2" style="width:100px">Add Notes</a>
													</td>
													<td>&nbsp;&nbsp;&nbsp;</td>
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
													<td align="left">
														<a href="javascript:void(0)" onclick="deleteNotes('<%=""+subjId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a>
													</td>
													</dmshtml:dms_static_with_connector>
												</tr>
											</table>
	               					 	 </td>		               					 	 
		               				</tr>
									<tr>		
										<td align="left" width="98%">
											<div id="NOTES_LIST" style="word-wrap:break-word;"></div>
										</td>
									</tr>
								</table>
								</form>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</td>
	</tr>	
</table>
							