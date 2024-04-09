<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />  
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script> 
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CauseListTable.js"></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/Subjectivity.js" ></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/editor/simpleeditor-min.js"></script>
<script type="text/javascript" src="/Scripts/JScripts/Application.js"></script>	
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/LocationTank/QuoteLocationTank.js"></script>



<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/QuoteSummaryUI3.js"></script>

<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

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
			if(request.getParameter("answer(Object::Quote::ParentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(Object::Quote::ParentQuoteId)");
			}

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}
			String compositeRate="";
			if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
				compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
			}
			String isApplnAvailable="";
			if(request.getParameter("answer(isApplnAvailable)")!=null){
				isApplnAvailable=request.getParameter("answer(isApplnAvailable)");
			}
			
			long parentQuoteVerId=0;
			if(request.getParameter("answer(Object::Quote::ParentQuoteVerId)")!=null){
				parentQuoteVerId=Long.parseLong(""+request.getParameter("answer(Object::Quote::ParentQuoteVerId)"));
			}
			String subQuoteId="";
			if(request.getParameter("answer(Object::Quote::SubQuoteId)")!=null){
				subQuoteId=request.getParameter("answer(Object::Quote::SubQuoteId)");
			}
			long subQuoteVerId=0;
			if(request.getParameter("answer(Object::Quote::SuQuoteVerId)")!=null){
				subQuoteVerId=Long.parseLong(""+request.getParameter("answer(Object::Quote::SuQuoteVerId)"));
			}
			String productId="";
			if(request.getParameter("answer(Object::Quote::ProductId)")!=null){
				productId=request.getParameter("answer(Object::Quote::ProductId)");
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
			String subjectivityReqProcess="Pre Bind";
			if(request.getParameter("answer(SubReqProcess)")!=null){
				subjectivityReqProcess = (""+request.getParameter("answer(SubReqProcess)"));
			}
			
			String quoteSubjectivityId = "";
			if(request.getParameter("answer(Object::Quote::Subjectivity::QuoteSubjectivityId)")!=null){
				quoteSubjectivityId = request.getParameter("answer(Object::Quote::Subjectivity::QuoteSubjectivityId)");
			}
		
		%>	
		
		<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
<tr><td><div id="manuScript"><div id='Manuscript_CONT'></div></div></td></tr>	
<tr><td><div id="subjDetail"><div id="SUB_CONT" style="overflow-x:hidden;overflow-y:scroll;height:40em;"></div><a class="container-close" href="javascript:void(0);" onclick="document.getElementById('SUB_CONT').innerHTML='';YAHOO.example.container.subjDetail.hide();"></a></div></td></tr>
<tr><td><div id="AttachFiles"></div></td></tr>
<tr><td><div id="AddNotespopup" style="display:none"></div></td></tr>
</table>	
<table WIDTH="98%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
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
														<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
													</jsp:include>
												
											</td>
										</tr>
										<tr>
											<td>
												<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
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
												<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyIdTemp%>&answer(QuoteId)=<%=""+strParentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+strParentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												
											</td>
										<tr>
										
										</tr>
										<tr><td>&nbsp;
										<div id='LoaderIndicator' style="display:none">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							Loading....
							</div>
										</td></tr>
										<tr>
											<td class="NewSectionHeadNew" align="center">Subjectivity List</td>
										</tr>	
										<tr><td>&nbsp;</td></tr>	
										<tr><td align="left">
											<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
										<tr><td align="left">
											<div>&nbsp;</div>
											<div style="margin-left:10px">Pre-Bind Subjectivities</div>
											<div>&nbsp;</div>
										</td></tr>																	
										<tr>
											<td>
											<form id="prebindSubjectivityMap">
												<html:hidden property="subjectivityObjectType" value="Subjectivity" styleId="subjectivityObjectType"/>
												<html:hidden property="subjectivityAlertObjectType" value="Quote" styleId="subjectivityAlertObjectType"/>
												<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
													<tr class="locformhead1">
										                 <td class="dataSubjcolhead" width="100%" >
															<table border="0" id="table5" cellspacing="0" cellpadding="0">
																<tr>
																<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
																property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">
																<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
																	<td >																		
																		<select onchange="if(this.value != '') {updateEndorsementSubjectivityStatus(this.form,this,'PreBindSubjctivtyId')}" name="answer(Object::Subjectivity::Status)">
																		<option value='' selected>Change Status</option>
																		<option value="Open">Open</option>
																		<option value="Satisfied">Satisfied </option>
																		<option value="Not Required">Not Required </option>																		
																		<option value="Rejected">Rejected</option>																		
																		</select>
																		</div>
																	</td>
																	</dmshtml:dms_static_with_connector>
																	</dmshtml:isFeatureAvailableForProductRoleStatus>
																	<td>
																		<table border="0" align=right>
																			<tr>
																				<td><a href="javascript:void(0)" onclick="document.getElementById('subjectivityAlertObjectType').value='Quote';document.getElementById('subjectivityObjectType').value='QuotePreBindSubjectivity';showAttach('<%=""+strParentQuoteId %>','0','Subjectivity');document.getElementById('subjectivityObjectType').value='Subjectivity';" class="button2" style="width:100px">Attach Document</a></td>
																				<td><a href="javascript:void(0)" class="button2" onclick="showSubjectivityNotes('<%=""+strParentQuoteId %>','0','Subjectivity');" class="button2" style="width:100px">Enter Diary Note</a></td>
																				<td>&nbsp;&nbsp;&nbsp;</td>
																			</tr>
																		</table>							
																	</td>
																	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
																	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
																property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">
																	<td >
																		<table border="0" align=right>
																			<tr>
																				<td><a href="javascript:void(0);" class="button2" onclick="showEndorsementManuscriptSubjectivity('<%=""+productId%>','<%=""+ProductVerId%>','<%=subQuoteVerId %>','<%=""+subQuoteId%>','<%=parentQuoteVerId %>','<%=""+customerId%>','<%=""+strParetQuoteStatus%>','<%=""+strParentQuoteId%>');" style="width:125px">Create Manuscript</a></td>
																			</tr>
																		</table>							
																	</td>
																	</dmshtml:isFeatureAvailableForProductRoleStatus>
																	</dmshtml:dms_static_with_connector>
																</tr>
															</table>
															</td>														
										                 <td class="dataSubjcolhead" width="7%">&nbsp;</td>
										                 <td class="dataSubjcolhead" width="10%">&nbsp;</td>
										               </tr>
													<tr>
														<td><div id="PRE_BIND_LIST_TABLE" style="word-wrap:break-word;"></div></td>
													</tr>																													
												</table>																																					
											</form>
											</td>
										</tr>
										<tr><td>&nbsp;</td></tr>																			
										</table>					
										</td></tr>
										<tr><td>&nbsp;</td></tr>
										<tr><td>&nbsp;<div id='frame' style="display:none"><iframe onload="hideAttachPopup()" src="../common/MessageFromRule.jsp" id='upload_target_iFrame' name='upload_target_iFrame'   style='width:300px;height:30px;border:1px solid #ccc;'></iframe></div></td></tr>
										<tr>
										<td>
										<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
											<tr><td align="left">												
												<div style="margin-left:10px">Attached Files</div>
												<div>&nbsp;</div>
											</td></tr>
											<tr><td>
											<form name="AttachmentListMainFrm" id="AttachmentListMainFrmId">
											<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
											<tr class="locformhead1">
											 <td class="datadispcolhead" width="100%" >										
												<table border="0" id="table5" cellspacing="0" cellpadding="0">
			               						 	<tr>
			               						 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
				               						 	<td>		               						 
															<select name="answer(Object::Attachment::ApprovalStatus)" onchange="if(this.value != '') {attachmentStatusChangeMain('<%=""+strParentQuoteId %>','<%=Long.parseLong(""+ownerId) %>','Subjectivity',this)}">
																<option value="" Selected>Change Status</option>
																<option value="Accepted">Accept</option>
																<option value="Rejected">Reject</option>
															</select>
														</td>	
														</dmshtml:dms_static_with_connector>
														<td>&nbsp;&nbsp;</td>
														<td><a href="javascript:void(0)" onclick="document.getElementById('subjectivityAlertObjectType').value='Quote';document.getElementById('subjectivityObjectType').value='QuoteSubjectivity';showAttach('<%=""+strParentQuoteId %>','0','Subjectivity');document.getElementById('subjectivityObjectType').value='Subjectivity';" class="button2" style="width:100px">Attach Document</a></td>													
														<td>&nbsp;&nbsp;</td>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
														<td>
															<a href="javascript:void(0)" onclick="deleteMainAttachment('<%=""+strParentQuoteId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a>
														</td>
														</dmshtml:dms_static_with_connector>
													</tr>
												</table>
											</td></tr>
											<tr><td><div id="ATTACHMENT_LIST_MAIN" style="word-wrap:break-word;"></div></td></tr>
											</table>
											</form>
											</td></tr>	
										</table>	
										</td>
										</tr>
										<tr>
										<td>
										<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
											<tr><td align="left">												
												<div style="margin-left:10px">Diary Notes</div>
												<div>&nbsp;</div>
											</td></tr>
											<tr><td>
											<form name="NotesListMainFrm" id="NotesListMainFrm">
											<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
											<tr class="locformhead1">
											 <td class="datadispcolhead" width="100%" >										
												<table border="0" id="table5" cellspacing="0" cellpadding="0">
				               						 	<tr>
				               						 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
					               						 	<td>		               						 
																<select onchange="if(this.value != '') {notesStatusChangeMain('<%=""+strParentQuoteId %>','<%=""+ownerId %>','Subjectivity',this)}" name="answer(Object::Notes::ApprovalStatus)">
																	<option value="" Selected>Change Status</option>
																	<option value="Accepted">Accept</option>
																	<option value="Rejected">Reject</option>																
																</select>
															</td>	
															</dmshtml:dms_static_with_connector>
															<td>&nbsp;&nbsp;</td>			
															<td><a href="javascript:void(0)" class="button2" onclick="showSubjectivityNotes('<%=""+strParentQuoteId %>','0','Subjectivity');" style="width:100px">Enter Diary Note</a></td>											
															<td>&nbsp;&nbsp;</td>
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
															<td align="left">
																<a href="javascript:void(0)" onclick="deleteMainNotes('<%=""+strParentQuoteId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a>
															</td>
															</dmshtml:dms_static_with_connector>
														</tr>
													</table>
											</td></tr>
											<tr><td><div id="NOTES_LIST_MAIN" style="word-wrap:break-word;"></div></td></tr>
											</table>
											</form>
											</td></tr>	
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
			</td>
		</tr>
	</table>
	
	<html:hidden property="answer(Object::Quote::ProductId)" styleId="productId1" value="<%=""+productId%>" />
	<html:hidden property="answer(Object::Quote::ProductVerId)" styleId="productVerId1" value="<%=""+ProductVerId%>" />
	<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+strParentQuoteId%>" styleId="parentQuoteId1" />
	<html:hidden property="answer(Object::Quote::ParentQuoteId1)" value="<%=""+strParentQuoteId%>" styleId="parentQuoteId" />
	
	<html:hidden styleId="parentQuoteVerId" property="answer(parentQuoteVerId)" value="<%=""+parentQuoteVerId %>"/>
	<html:hidden property="answer(Object::Quote::SubQuoteId)" value="<%=""+subQuoteId%>" styleId="subQuoteId1" />
	<html:hidden styleId="subQuoteVerId" property="answer(subQuoteVerId)" value="<%=""+subQuoteVerId %>"/>
	<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId1" value="<%=""+customerId%>" />
	<html:hidden property="answer(Quote::QuoteType)" value="Endorsement" styleId="Quote_Endorsement" />
	<html:hidden styleId="ownerId" property="answer(ownerId)" value="<%=""+ownerId %>"/>
	<html:hidden property="answer(Object::Quote::QuoteStatus)" styleId="paretQuoteStatus1" value="<%=""+strParetQuoteStatus%>" />
	<html:hidden property="answer(Object::Quote::PolicyNumber)" value="<%=""+policyNumber%>" />
	<html:hidden property="answer(Object::Quote::PolicyVerId)" value="<%=""+policyVerId%>" />
	<html:hidden property="answer(Object::Quote::AgencyIdTemp)" styleId="AgencyId_hidden" value="<%=""+agencyIdTemp%>" />
	
	<script>	
		refreshEndorsementSubjectivity();		
		refereshMultiAttachmentList('<%=""+strParentQuoteId %>','<%=""+ownerId %>','Subjectivity');
		refereshMultiNotesList('<%=""+strParentQuoteId %>','<%=""+ownerId %>','Subjectivity');
		
		var quoteSubjectivityId = '<%=""+quoteSubjectivityId%>';		
		if(quoteSubjectivityId != '' && quoteSubjectivityId != '0' ) {
			setTimeout("showSubjDetail('../GetEndorsementSubjectivity.do?answer(Object::Quote::ParentQuoteId)=<%=""+strParentQuoteId %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId %>&answer(Object::Quote::ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(Object::Quote::SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId %>&answer(Object::Quote::ProductId)=<%=""+productId %>&answer(Object::Customer::CustomerId)=<%=""+customerId %>&answer(Object::Quote::QuoteStatus)=<%=""+strParetQuoteStatus %>&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)='+quoteSubjectivityId,quoteSubjectivityId)",10);
			//showSubjDetail('../GetEndorsementSubjectivity.do?answer(Object::Quote::ParentQuoteId)=<%=""+strParentQuoteId %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId %>&answer(Object::Quote::ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(Object::Quote::SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId %>&answer(Object::Quote::ProductId)=<%=""+productId %>&answer(Object::Customer::CustomerId)=<%=""+customerId %>&answer(Object::Quote::QuoteStatus)=<%=""+strParetQuoteStatus %>&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)='+quoteSubjectivityId,quoteSubjectivityId);
		}		
	</script>
					
