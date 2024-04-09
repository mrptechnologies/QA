<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>


<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/QuoteSummary.js"> </SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/Common.js">
<script type="text/javascript" src="../Scripts/prototype.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/editor/simpleeditor-min.js"></script>

<SCRIPT type="text/javascript">
function disableButton(frm){
document.getElementById("QuoteProposalSubmit").disabled = true;	
document.getElementById("QuoteProposalCancel").disabled = true;
}
</SCRIPT>
<script type="text/javascript">
var myEditor;
renderEditor();
function renderEditor() {
    var Dom = YAHOO.util.Dom,
        Event = YAHOO.util.Event;
        
    YAHOO.log('Create the Editor..', 'info', 'example');
    myEditor = new YAHOO.widget.SimpleEditor('editor', {
        height: '150px',
        width: '875px',
        dompath: true,
        filterWord: true,
        focusAtStart: true,
        animate: true,                        
        toolbar: {
            titlebar: 'Enter Notes to be included on Binder',
            buttons: [
                      { group: 'fontstyle', label: 'Font Name and Size',
                          buttons: [
                              { type: 'select', label: 'Arial', value: 'fontname', disabled: false,
                                  menu: [
                                      { text: 'Arial', checked: true },
                                      { text: 'Arial Black' },
                                      { text: 'Comic Sans MS' },
                                      { text: 'Courier New' },
                                      { text: 'Garamond' },
                                      { text: 'Lucida Console' },
                                      { text: 'Tahoma' },
                                      { text: 'Times New Roman' },
                                      { text: 'Trebuchet MS' },
                                      { text: 'Verdana' }
                                  ]
                              },
                              { type: 'spin', label: '10', value: 'fontsize', range: [ 9, 75 ], disabled: false }
                          ]
                      },
                      { type: 'separator' },
                      { group: 'textstyle', label: 'Font Style',
                          buttons: [
                              { type: 'push', label: 'Bold CTRL + SHIFT + B', value: 'bold' },
                              { type: 'push', label: 'Italic CTRL + SHIFT + I', value: 'italic' },
                              { type: 'push', label: 'Underline CTRL + SHIFT + U', value: 'underline' },
                              { type: 'push', label: 'Strike Through', value: 'strikethrough' },                              
                              { type: 'separator' },
                              { type: 'color', label: 'Font Color', value: 'forecolor', disabled: false },
                              { type: 'color', label: 'Background Color', value: 'backcolor', disabled: false }
                          ]
                      },
                      { type: 'separator' },
                      { group: 'indentlist', label: 'Lists',
                          buttons: [
                              { type: 'push', label: 'Create an Unordered List', value: 'insertunorderedlist' },
                              { type: 'push', label: 'Create an Ordered List', value: 'insertorderedlist' }
                          ]
                      }                   
                  ]
        }
    });   
    myEditor._defaultToolbar.buttonType = 'advanced'; 
    myEditor.render();

}
</script>
<bean:parameter id="QuoteDesc" name="answer(Object::Quote::QuoteDesc)"/>
<bean:parameter id="QuoteName" name="answer(Object::Quote::QuoteName)"/>
<bean:parameter id="ParentQuoteVerId" name="answer(Object::Quote::ParentQuoteVerId)"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
			<%String strRenewal=""; %>	
			<%String TRIACoverage = ""; %>
			<%String doubleRenewal = "";%> 
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

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}
			
			String riskState="";
			if(request.getParameter("answer(state)")!=null){
				riskState=request.getParameter("answer(state)");
			}
			String teritory="";
			if(request.getParameter("answer(teritory)")!=null)
			{
				teritory=request.getParameter("answer(teritory)");
			}
			
			String territoryName="";
			if(request.getParameter("answer(territoryName)")!=null)
			{
				territoryName=request.getParameter("answer(territoryName)");
			}
			
			String zone="";
			if(request.getParameter("answer(zone)")!=null)
			{
				zone=request.getParameter("answer(zone)");
			}
			
			String tabNo="";
			if(request.getParameter("tabNo")!=null)
			{
				tabNo=request.getParameter("tabNo");
			}
			
			String Navigation="";
			if(request.getParameter("Navigation")!=null)
			{
				Navigation=request.getParameter("Navigation");
			}
			
			String noOfSubQuotes="";
			if(request.getParameter("answer(numberOfSubQuotes)")!=null)
			{
				noOfSubQuotes=request.getParameter("answer(numberOfSubQuotes)");
			}
			
			String isRenewal = "";
			if(request.getParameter("isRenewal") != null) {
				isRenewal = request.getParameter("isRenewal"); 
			}
			
			String policyEffDate = "";
			if(request.getParameter("policyEffDate") != null) {
				policyEffDate = request.getParameter("policyEffDate");
			}
			
			String policyExpDate = "";
			if(request.getParameter("policyExpDate") != null) {
				policyExpDate = request.getParameter("policyExpDate");
			}
			
			String quoteStatus1 = "";
			if(request.getParameter("answer(QuoteStatus1)") != null) {
				quoteStatus1 = request.getParameter("answer(QuoteStatus1)");
			}
		
		%>		
		
<% long ProductId = Long.parseLong((request.getParameter("answer(Object::Quote::ProductId)")).toString()); %>
<% long QuoteId = Long.parseLong((request.getParameter("answer(parentQuoteId)")).toString()); %>
<% long SubQuoteId = Long.parseLong((request.getParameter("answer(Object::Quote::FirstSubQuoteId)")).toString()); %>
<% long SubQuoteVerId = Long.parseLong((request.getParameter("answer(Object::Quote::QuoteVerId)")).toString()); %>
<% long subQuoteVerId1 = Long.parseLong((request.getParameter("answer(subQuoteVerId)")).toString()); %>
<% String QuoteType = (request.getParameter("answer(Object::Quote::QuoteType)")).toString(); %>
<%String strNotes =""; %>


	<bean:parameter name="answer(parentPolicyId)" id="policyId" />
	<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />
	<bean:parameter name="answer(policyNumber)" id="policyNumber" />
	<bean:parameter name="answer(DocumentType)" id="DocumentType" />
	
	<%String isRenewalEndorsement="";%>
	
	<html:form action="/IssueBinderAddEditLocationEndorsement.do" onsubmit="saveEditor();">
			<% 
					session.removeAttribute("IsPolicyCreationAction");
			%>		
	<div id="refreshDiv">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)"/>

<bean:parameter name="answer(Object::Quote::QuoteStartDate)" id="quoteStartDate" />

<bean:define id="objectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="<%=objectId.toString()%>" />
<bean:define id="objectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="<%=objectType.toString()%>" />
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>

<%
if(request.getParameter("quoteId")!=null)
			{
		%>
<html:hidden name="AddQuote" property="quoteId" value="<%=request.getParameter("quoteId")%>"/>
<%
			}
%>
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
								<td width="100%" bgcolor="#C6DEEA">
									<div id="QuoteInsuerdAgencyAgentHeader">
										<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
										<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
										<jsp:param name="paretQuoteStatus" value="<%=""+strParetQuoteStatus%>" />
										</jsp:include>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
		
										<tr>
											<td >
												<table width="100%" align="Left" border="0">
													<tr>
														<td>
														<%if(isRenewal.equals("true")) { %>
															<html:hidden property="isRenewal" value="<%=""+isRenewal %>"/>
															<jsp:include page="../common/DynamicPolicyHeader.jsp">
																<jsp:param name="policyId" value="<%=policyId.toString()%>" />
																<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
																<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
																<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
																<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
															</jsp:include>
														<%} else { %>
															<jsp:include page="../common/DynamicPolicyHeader.jsp">
																<jsp:param name="policyId" value="<%=policyId.toString()%>" />
																<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
																<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
																<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
																<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
															</jsp:include>
														<%} %>
														</td>
													</tr>															
													<tr>
														<td>
															<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
															 	<tr>
																	<td align="left">	
																		<jsp:include page="../common/EndorsementQuoteHeader.jsp">
																			<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
																			<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
																		</jsp:include>	
																	</td>
																</tr>		
															</table>	
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<logic:present name="SubjectivityErrorList">
											<logic:notEmpty name="SubjectivityErrorList">
													<tr>
														<td>
															<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
																<tr>														
																	<td class="Error">
																		Subjectivity Rule Failed. To do Issue Binder, following Pre-Bind Subjectivity's status should be in Satisfied/Not Required.
																	</td>														
																</tr>
															</table>
														</td>
													</tr>	
													<tr><td>&nbsp;</td></tr>
													<tr>
														<td>														
															<table WIDTH="98%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">	
																<tr>
																	<td class="new_sectionhead" width="67%">
																		Subjectivity
																	</td>
																	<td class="new_sectionhead">
																		Location
																	</td>
																	<td class="new_sectionhead" width="10%">
																		Tank
																	</td>
																	<td class="new_sectionhead">
																		Current Status
																	</td>
																</tr>															
																<%int index=1; %>
																<logic:iterate id="SubjectivityErrorList" name="SubjectivityErrorList">	
																<tr>
																	<td class="Error">																																																														
																		&nbsp;&nbsp;<%=""+index+". " %><bean:write name="SubjectivityErrorList" property="Object::Quote::Subjectivity::SubjectivityDesc" />
																		<%index++; %>														
																	</td>
																	<td class="Error">
																		<bean:write name="SubjectivityErrorList" property="Object::Quote::Subjectivity::LocationName" />
																	</td>
																	<td class="Error">
																		<bean:write name="SubjectivityErrorList" property="Object::Quote::Subjectivity::RiskName" />
																	</td>
																	<td class="Error">
																		<bean:write name="SubjectivityErrorList" property="Object::Quote::Subjectivity::Status" />
																	</td>
																</tr>
																</logic:iterate>
															</table>
														</td>
													</tr>		
													</logic:notEmpty>													
													</logic:present>											
													<tr><td>&nbsp;</td></tr>
										
										<tr>
											<td class="links">
											<html:hidden property="answer(QuoteStatus1)" value="<%=""+quoteStatus1.toString()%>"/>											
											<%if(isRenewal.equalsIgnoreCase("true")) { %>
												<a id="renewalQuoteSummaryLink" href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyIdTemp%>&answer(QuoteId)=<%=""+strParentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+strParentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Return to Renewal Quote</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<a href="/getRenewalEndorsementSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+strParentQuoteId%>&answer(ParentQuoteVerId)=<%=ParentQuoteVerId.toString()%>&answer(SubQuoteId)=<%=""+SubQuoteId%>&answer(subQuoteVerId)=<%=""+subQuoteVerId1%>&answer(Object::Quote::ParentQuoteId)=<%=""+strParentQuoteId%>&answer(Object::Quote::ParentQuoteVerId)=<%=ParentQuoteVerId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+ParentQuoteVerId%>&answer(Object::Quote::SubQuoteId)=<%=""+SubQuoteId%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId1%>&answer(Object::Quote::ProductId)=<%=""+ProductId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentPolicyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Quote::QuoteStatus)=<%=""+quoteStatus1.toString()%>&isRenewal=<%=""+isRenewal %> title="<bean:message key='ToolTip.EndorsementQuoteSummary.Subjectivity'/>">Goto Subjectivity List</a>
											<%} else { %>	
												<a id="endorsementQuoteSummaryLink" href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyIdTemp%>&answer(QuoteId)=<%=""+strParentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+strParentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Return to Endorsement Quote</a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<%--Commented for the bug #14400 --%>
												<%-- <a href="/getRenewalEndorsementSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+strParentQuoteId%>&answer(ParentQuoteVerId)=<%=ParentQuoteVerId.toString()%>&answer(SubQuoteId)=<%=""+SubQuoteId%>&answer(subQuoteVerId)=<%=""+subQuoteVerId1%>&answer(Object::Quote::ParentQuoteId)=<%=""+strParentQuoteId%>&answer(Object::Quote::ParentQuoteVerId)=<%=ParentQuoteVerId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+ParentQuoteVerId%>&answer(Object::Quote::SubQuoteId)=<%=""+SubQuoteId%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId1%>&answer(Object::Quote::ProductId)=<%=""+ProductId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentPolicyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Quote::QuoteStatus)=<%=""+quoteStatus1.toString()%>&isRenewal=<%=""+isRenewal %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Subjectivity'/>">Goto Subjectivity List</a>--%>
												<a href="/getEndorsementSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=ParentQuoteVerId.toString()%>&answer(SubQuoteId)=<%=""+SubQuoteId%>&answer(subQuoteVerId)=<%=""+subQuoteVerId1%>&answer(Object::Quote::ParentQuoteId)=<%=""+strParentQuoteId%>&answer(Object::Quote::ParentQuoteVerId)=<%=ParentQuoteVerId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+ParentQuoteVerId%>&answer(Object::Quote::SubQuoteId)=<%=""+SubQuoteId%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId1%>&answer(Object::Quote::ProductId)=<%=""+ProductId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentPolicyId)=<%=""+policyId %>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Quote::QuoteStatus)=<%=quoteStatus1.toString()%>&isRenewal=<%=""+isRenewal %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Subjectivity'/>">Goto Subjectivity List</a>
											<%} %>				
											</td>											
																						
										</tr>
										<tr><td>&nbsp;</td></tr>										
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
							<tr><td>&nbsp;</td></tr>
						</logic:present>
						<tr>
							<td class="Error">
								<logic:present name="MESSAGE_LISTS" scope="request">
									<%if(isRenewal.equals("true")) { %>
										<%doubleRenewal = "Y"; %>
									<%} %>
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
			     				</logic:present>
							</td>
						</tr>
					
											<td align="left">
	
												<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
													<tr>
														<td>

															<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>														 
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
															</tr>
													<tr>
														<td  colspan="8" align="center" class="sectionhead"></td>
													</tr>
													<tr>
														<td>
															&nbsp;
														</td>
													</tr>
													
													<tr><td>
														<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Bound" />
													</td></tr>
												</table>
											</td>
										</tr>
									</table>
<dmshtml:GetQuoteDetailByQuoteId nameInSession="GetQuoteDetailByQuoteId" quoteId='<%=""+QuoteId%>' ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
	<% String quoteName = ""; %>
	<% String quoteDesc = ""; %>
		
	<logic:present name="GetQuoteDetailByQuoteId" scope="request">
		<bean:define id="quoteNameTemp" name="GetQuoteDetailByQuoteId" property="quoteName" />
		<bean:define id="quoteDescTemp" name="GetQuoteDetailByQuoteId" property="quoteDesc" />
			<bean:define id="notesId" name="GetQuoteDetailByQuoteId" property="notes" />
		<%strNotes = ""+notesId;%>
		<% quoteName = ""+quoteNameTemp;  %>
		<% quoteDesc = ""+quoteDescTemp;  %>
	</logic:present>
	<html:hidden property="answer(Object::Quote::QuoteName)" value='<%=""+quoteName%>' />
	<html:hidden property="answer(Object::Quote::QuoteDesc)" value='<%=""+quoteDesc%>' />	
	
<dmshtml:Get_All_Plan_HeaderDetails nameInSession="subQuotes" parentQuoteId='<%=""+QuoteId%>'dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
	<logic:present name="subQuotes" scope="request">
		<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
		<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
			<% com.dms.ejb.insurance.quote.common.plan.PlanDetail planDetail = (com.dms.ejb.insurance.quote.common.plan.PlanDetail)aSubQuote.getHealthInsPlanDetail();%>
			<%TRIACoverage = planDetail.getTRIACoverage(); %>
			<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		
		</logic:iterate>											
	</logic:present>					
									<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+ProductId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="TRIA_COVERAGE_AVAILABLE" property='<%=new String[]{"Bind Request"}%>' value="Bind Request" negated="true">
										<table WIDTH="75%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
											<tr>
												<td align="left" class="TextMatter" width="44%">
												TRIA Coverage Required 
												</td>
												<td>
												<input type="hidden" name="oldTriaValue" id="triaValue" value="<%=TRIACoverage %>"/>
												<html:select property="answer(Object::Plan::TRIACoverage)" styleId="TRIA" styleClass="txtbox" value="<%=TRIACoverage%>" onchange="savePreviewBinder()">
												     <html:option value="N">No</html:option>
												     <html:option value="Y">Yes</html:option>
	                           		         	</html:select>																		
												</td>																		
											</tr>
										</table>
									</dmshtml:isFeatureAvailableForProductRoleStatus>
									<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+ProductId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="TRIA_COVERAGE_AVAILABLE" property='<%=new String[]{"Bind Request"}%>' value="Bind Request" negated="true">									
										<table WIDTH="75%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
											<tr>
												<td>
													&nbsp;
												</td>
											</tr>
											<tr>
												<td class="TextMatter1" align="left" colspan="2">
													<div id="editorDiv">
														<dmshtml:dms_textarea styleClass="txtarea" styleId="editor" name="AddQuote"  property="answer(Object::Quote::Notes)" value = "<%=strNotes%>" rows="3" cols="60"/>
													</div>
												</td>
											</tr>
											<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_BINDER_NOTES"}%>' connector='or' negated="true">
												<tr>
													<td>
														&nbsp;
													</td>
												</tr>
											</dmshtml:dms_static_with_connector>
										</table>	
									</dmshtml:isFeatureAvailableForProductRoleStatus>											
									<table WIDTH="75%" BORDER="0" CELLSPACING="0" CELLPADDING="0">		
										<tr>
										<td class="TextMatter" align="right" width="44%">
												Are you sure you want to proceed?</td><td>
												<%if(doubleRenewal.equalsIgnoreCase("Y")) { %>
													<input type="radio" name="issue" value="Yes" id="proposalYES">&nbsp;Yes
												<%} else { %>
													<input type="radio" name="issue" value="Yes" id="proposalYES" onclick="QuoteProposalEnable(this.form,this.document)">&nbsp;Yes
												<%} %>												 
												<input type="radio" name="issue" value="No" checked="checked" id="proposalNO" onclick="QuoteProposalDisable(this.form,this.document)">&nbsp;No 
										</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
									    	<td>&nbsp;
									    	</td>
									    </tr>	
										</table>
										<%
											 boolean isPreview = false;
										%>
										<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
											<tr>											
											<td align="center" class="links" width="25%">
											
							<dmshtml:IsRenewalEndorsement productId='<%=""+ProductId%>'dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId)%>" ></dmshtml:IsRenewalEndorsement>
				             <% isRenewalEndorsement = (String) request.getAttribute("isRenewalEndorsement"); 
				 		         if(isRenewalEndorsement.equals("Y")){ 
				 		        	 strRenewal="YES";
				              %>	
				            		 <html:hidden property="answer(isRenewalEndorsement)" value="YES" />				            		
				             <%}else{ %>
				  					<html:hidden property="answer(isRenewalEndorsement)" value="NO" />
				 			 <%} %>											
											
											<html:hidden property="answer(numberOfSubQuotes)" value="<%=""+noOfSubQuotes%>" />
										
											<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="PreviewBinder" />
											
											<logic:present name="paramValue">
										   		<logic:equal value="CLBinder" name="paramValue">
													<a id="hiddenPreviewEndorsement" href='../CLPreviewBinderPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(isRenewalEndorsement)=<%= ""+strRenewal%>&answer(DocumentType)=BINDER&answer(QuoteId)=<%= ""+strParentQuoteId%>&answer(subQuoteId)=<%= ""+SubQuoteId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(isPreview)=<%=true%>&answer(isRenewalBinder)=Y&answer(Object::UserDetail::PrimaryObjectId)=<%=""+objectId%>&answer(Object::UserDetail::PrimaryObjectType)=<%=""+objectType%>&answer(Object::UserDetail::roleName)=<%=""+roleName%>&answer(Object::Quote::CreatedBy)=<%=""+userId%>' style="{visibility: hidden}"></a>
										   		</logic:equal>
									   		</logic:present>	
									   		<logic:present name="paramValue">
										   		<logic:equal value="PCBinder" name="paramValue">
													<a id="hiddenPreviewEndorsement" href='../PreviewBinderPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=BINDER&answer(QuoteId)=<%= ""+strParentQuoteId%>&answer(subQuoteId)=<%= ""+SubQuoteId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%> &answer(isPreview)=<%=true%>&answer(Object::UserDetail::PrimaryObjectId)=<%=""+objectId%>&answer(Object::UserDetail::PrimaryObjectType)=<%=""+objectType%>&answer(Object::UserDetail::roleName)=<%=""+roleName%>&answer(Object::Quote::CreatedBy)=<%=""+userId%>' style="{visibility: hidden}"></a>
												</logic:equal>
											</logic:present>
											
										<% isRenewalEndorsement = (String) request.getAttribute("isRenewalEndorsement"); 
 		        							 if(isRenewalEndorsement.equals("Y")){ 
								            %>
								            	<div class="sbttn1" style=" display:table-cell; vertical-align:middle;">
								            	<a href="#" id="previewBinderLink" style="color:#000000;text-decoration:none;" target="_new" onfocus="savePreviewBinder()">Preview Renewal Binder</a>
												</div>
													</td>					
												<td align="left" class="links" width="25%">
													<INPUT TYPE="Submit" value="Issue Renewal Binder" class="sbttn1" disabled="disabled"  id="QuoteProposalSubmit">
												</td>
									        <%}else{ %>																																
											
												<div class="sbttn1" style=" display:table-cell; vertical-align:middle;">
													<a id="previewBinderLink" href="javascript:void(-1)" style="color:#000000;text-decoration:none;" target="_new"  onclick="savePreviewBinder();">Preview Endorsement<a/>
												</div>
											</td>					
												<td align="center" class="links" width="25%">
													<INPUT TYPE="Submit" value="Issue Endorsement" class="sbttn1" disabled="disabled"  id="QuoteProposalSubmit">
												</td>
												<%} %>
											<% if(!isRenewalEndorsement.equals("Y")){ %>
												<td align="left" width="25%">
													<dmshtml:dms_button value="Cancel" property="answer(back)" styleId="QuoteProposalCancel" styleClass="sbttn" onclick="goToEndorsmentQuoteSummaryPage();"/>
												</td>
											<%}%>
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
			<html:hidden property="answer(Quote::Page)" value="QUOTE SUMMURY" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" styleId="usrIdfrmjsp" />
			<html:hidden property="answer(userId)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%= ""+ProductId %>" />
			<html:hidden property="answer(Object::Quote::ProductId1)" value="<%= ""+ProductId %>" />
			<html:hidden property="answer(parentQuoteId)" value="<%= ""+QuoteId %>" />
			<html:hidden property="answer(Object::Quote::FirstSubQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(SubQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(subQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%= ""+SubQuoteVerId %>" />
			<html:hidden property="answer(Object::Quote::QuoteType)" value="<%= QuoteType %>" />
			<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%= ""+ProductVerId %>" />			
			<html:hidden property="answer(DocType)" value="ISSUANCE" />
			<html:hidden property="answer(DocumentType)" value="BINDER" />
			<html:hidden property="answer(OwnerId)" value="<%= ownerId.toString()%>" />
			<html:hidden property="answer(isPreview)" value="<%= ""+false%>" />		
			
			<html:hidden property="answer(Object::Quote::QuoteName)" value="<%=""+QuoteName%>" />
			<html:hidden property="answer(Object::Quote::QuoteDesc)" value="<%=""+QuoteDesc%>" />
			
			<bean:parameter id="riskId" name="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)"/>
			<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" value="<%= ""+riskId%>" />
			<html:hidden property="answer(Object::Quote::ResProperty::State)" value="<%=""+riskState%>" />
			<html:hidden property="answer(state)" value="<%=""+riskState%>" />
			<html:hidden property="answer(teritory)" value="<%=""+teritory%>" />
			<html:hidden property="answer(territoryName)" value="<%=""+territoryName%>" />
			<html:hidden property="answer(zone)" value="<%=""+zone%>" />
			<html:hidden property="tabNo" value="<%=""+tabNo%>" />
			<html:hidden property="Navigation" value="<%=""+Navigation%>" />			
			
			<html:hidden property="answer(QuoteVerId)" value="<%=""+SubQuoteVerId%>" />
			<html:hidden property="answer(ownerId)" value="<%= ownerId.toString()%>" />
			<html:hidden property="answer(createdBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(updatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(subQuoteVerId)" value="<%=""+subQuoteVerId1%>" />
			<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(ParentQuoteVerId)" value="<%= ""+ParentQuoteVerId%>" />
			<html:hidden property="answer(SubQuoteId)" value="<%=""+SubQuoteId%>" />
			<html:hidden property="answer(Object::Quote::ParentQuoteVerId)" value="<%=""+ParentQuoteVerId%>" />
			
			
			<html:hidden property="answer(displayVal)" value="Y" styleId="check"/>		
			
			<html:hidden property="answer(parentPolicyId)" value="<%=""+policyId%>" />
			<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=""+policyId%>" />
			<html:hidden property="answer(PARENT_POLICY_NUMBER)" value="<%=""+policyNumber%>" />
			<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />			
			<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%= ""+quoteStartDate %>" />
			<html:hidden property="answer(Object::Quote::PolicyEffDate)" value="<%=""+policyEffDate%>"/>
			<html:hidden property="answer(Object::Quote::PolicyExpDate)" value="<%=""+policyExpDate%>"/>
			<html:hidden property="policyEffDate" value="<%=""+policyEffDate%>"/>
			<html:hidden property="policyExpDate" value="<%=""+policyExpDate%>"/>
			<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />			
			<html:hidden property="answer(IsIssueBinderAction)" value="YES" />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			<html:hidden property="answer(isUpdated)" value="Y" />
			<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(pagename)" value="Endorsement Issue Summary" />
			<html:hidden property="answer(SUCCESS_F)" value="success" />
			<html:hidden property="answer(FAILURE_F)" value="failure" />

			
			
		</td>
	</tr>

</table>    

			<dmshtml:get_ProductDetail_ByProductVerId nameInSession="aProductDetail" productId="<%=""+Long.parseLong(""+ProductId)%>" productVerId="<%=""+Long.parseLong(""+ProductVerId)%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
				<logic:present name="aProductDetail" scope="request">
					<bean:define id="MProductVerName" property="MProductVerName" name="aProductDetail" scope="request" />					
					<html:hidden property="answer(Object::Product::ProductName)" value="<%=MProductVerName+"" %>" />
				</logic:present>
</div>
</html:form>

<% if(isRenewalEndorsement.equals("Y")){ %>
<bean:define id="ownerid" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
<dmshtml:DisplyApplication nameInSession="Application"   ownerId='<%=ownerid.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName="BINDER" applicationType="BINDER" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveBinderApplicationActionForRenewal.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>

<%} %>

<script type="text/javascript">

function savePreviewBinder () {

var triaValue = "";
var saveBinder = "Y";
var notes = "";
var isRenewal = '<%="" + isRenewal%>';
if((document.getElementById("triaValue") != null) && (document.getElementById("triaValue") != undefined)) {

	triaValue = document.getElementById("triaValue").value;
}
var currentTriaValue = "";
if((document.getElementById("TRIA") != null) && (document.getElementById("TRIA") != undefined)) {

	currentTriaValue = document.getElementById("TRIA").value;
}
if( (myEditor != null) && (myEditor != undefined) && (isRenewal == "true")) {
	myEditor.saveHTML();
	if(document.getElementById("editor") != null && document.getElementById("editor") != undefined) {
		document.getElementById("editor").value = convertSpecialCharactersToAsciiValue(document.getElementById("editor").value);
	}
	notes = myEditor.get('textarea').value;
}
if(document.getElementById("editorDiv") != null && document.getElementById("editorDiv") != undefined) {
	if(document.getElementById("editorDiv").style.display == "none") {
		saveBinder = "N";
	}
}
if((saveBinder == "Y" || (triaValue != currentTriaValue)) && (isRenewal == "true")) {
	
previewBinder();
	if(document.getElementById("QuoteProposalSubmit") != null && document.getElementById("QuoteProposalSubmit") != undefined) {
		document.getElementById("QuoteProposalSubmit").disabled = true;	
	}
	if(document.getElementById("previewBinderButton") != null && document.getElementById("previewBinderButton") != undefined) {
		document.getElementById("previewBinderButton").disabled = true;
	}
	if(document.getElementById("editor") != null && document.getElementById("editor") != undefined) {	
	 	document.getElementById("editor").value=notes;
	}
	document.getElementsByName("answer(Object::Quote::QuoteStatus)")[0].value="Bind Request";
	url="/SaveEndorsementPreviewBinderPdf.do";	
	 panel="refreshDiv";
	  new Ajax.Request(url, {method: 'post',parameters:$(document.forms[0]).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess:
	   function(transport){   	
	        document.getElementById("refreshDiv").innerHTML =transport.responseText;    
	        if(document.getElementById("editor") != null && document.getElementById("editor") != undefined) {
	        	renderEditor();
	        }
	        if(saveBinder == "N") {
	        	if(document.getElementById("editorDiv") != null && document.getElementById("editorDiv") != undefined) {
	        		document.getElementById("editorDiv").style.display = "none";
	        	}
	        }
		  	
	  }
	 });
}
else {

	previewBinder();
}
}

function previewBinder() {

	 var link=document.getElementById("previewBinderLink");
	 link.href=document.getElementById("hiddenPreviewEndorsement");

}
function setDefault(frm){

  	/**
     * To set the User ID
     */
    if(document.getElementById("usrIdfrmjsp") !=null && document.getElementById("usrIdfrmjsp") !=undefined) {
 	var usrIdfrmjsp=document.getElementById("usrIdfrmjsp").value;
 	var createdByElements = frm.CreatedBy;
	 	if(createdByElements!=null && createdByElements!= undefined) {
	 		for(index=0;index<(createdByElements.length);index++) {
	 			createdByElements[index].value=usrIdfrmjsp;
	 		}		 	
			 
		}
 	}
 	
 	/**
     * To set the Created Date
     */
     var CreatedDateElement=frm.CreatedDate;
 	 if(CreatedDateElement!=null && CreatedDateElement!= undefined) {
	 	 var currentTime = new Date();
		 var month = currentTime.getMonth() + 1;
		 var day = currentTime.getDate();
		 var year = currentTime.getFullYear();
		 
		 for(index=0;index<(CreatedDateElement.length);index++) {
		 		CreatedDateElement[index].value=year+'/'+month+'/'+day;
		 }
	}
	return true;
 }
function saveEditor() {
	document.getElementById("QuoteProposalSubmit").disabled = true;
	var isRenewal = '<%="" + isRenewal%>';
	if(isRenewal == "true" && myEditor != null && myEditor != undefined) {
		
		myEditor.saveHTML();
		if(document.getElementById("editor") != null && document.getElementById("editor") != undefined) {
			document.getElementById("editor").value = convertSpecialCharactersToAsciiValue(document.getElementById("editor").value);
		}
	}
}

function goToEndorsmentQuoteSummaryPage() {

	if(document.getElementById("endorsementQuoteSummaryLink") != null && document.getElementById("endorsementQuoteSummaryLink") != undefined) {
		document.location = document.getElementById("endorsementQuoteSummaryLink").href;
	}
}
</script>
<script type="text/javascript">
	var a = document.getElementById('priorpolicyheadernav');
	if((a != null) && (a != undefined))
		a.id = 'policyheadernav';
</script>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_BINDER_NOTES"}%>' connector='or' negated="false">
	<script type="text/javascript">
		if(document.getElementById("editorDiv") != null && document.getElementById("editorDiv") != undefined) { 
			document.getElementById("editorDiv").style.display = "none";
		}
	</script>
</dmshtml:dms_static_with_connector>
