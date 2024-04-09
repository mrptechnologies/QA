<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<script type="text/javascript" src="../Scripts/JScripts/CreateQuoteCL.js"></SCRIPT>
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" /> 
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/menu/menu-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>
<script type="text/javascript">
var myEditor;
(function() {
    var Dom = YAHOO.util.Dom,
        Event = YAHOO.util.Event;
    
    var myConfig = {
        height: '150px',
        width: '650px',
        dompath: true,
        focusAtStart: true
    };

    YAHOO.log('Create the Editor..', 'info', 'example');
    myEditor = new YAHOO.widget.SimpleEditor('editor', myConfig); 
    myEditor._defaultToolbar.buttonType = 'advanced'; 
    myEditor.render();

})();   
</script>
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
			
			String noOfSubQuotes="";
			if(request.getParameter("answer(numberOfSubQuotes)")!=null)
			{
				noOfSubQuotes=request.getParameter("answer(numberOfSubQuotes)");
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
			String prevSubQuoteVerId="";
			if(request.getParameter("answer(subQuoteVerId)")!=null)
			{
				prevSubQuoteVerId=request.getParameter("answer(subQuoteVerId)");
			} 
			String policyNumber = "";
			if(request.getParameter("answer(policyNumber)")!=null && request.getParameter("answer(policyNumber)") !=""){
				
				policyNumber = ""+request.getParameter("answer(policyNumber)");
				
			}
		%>		
		
	
			
<% long ProductId = Long.parseLong((request.getParameter("answer(Object::Quote::ProductId)")).toString()); %>
<% long QuoteId = Long.parseLong((request.getParameter("answer(parentQuoteId)")).toString()); %>
<% long SubQuoteId = Long.parseLong((request.getParameter("answer(Object::Quote::FirstSubQuoteId)")).toString()); %>
<% long SubQuoteVerId = Long.parseLong((request.getParameter("answer(Object::Quote::QuoteVerId)")).toString()); %>
<% long subQuoteVerId1 = Long.parseLong((request.getParameter("answer(subQuoteVerId)")).toString()); %>
<% String QuoteType = (request.getParameter("answer(Object::Quote::QuoteType)")).toString(); %>
<% String planeState = (request.getParameter("answer(state)")).toString(); %>
<% String subQuoteVerId="0"; %>
<%String TRIACoverage = ""; %>
<%String strNotes =""; %>
	<bean:parameter name="answer(DocumentType)" id="DocumentType" />
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)"/>

<bean:parameter name="answer(Object::Quote::QuoteStartDate)" id="quoteStartDate" />

<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="ObjectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/> 
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>
															
<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="<%=ObjectType.toString()%>" />
<bean:define id="objectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="<%=objectId.toString()%>" />
<%
if(request.getParameter("quoteId")!=null)
			{
		%>
<html:hidden name="AddQuote" property="quoteId" value="<%=request.getParameter("quoteId")%>"/>
<%
			}
%>
	<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
	
	<dmshtml:GetQuoteDetailByQuoteId nameInSession="GetQuoteDetailByQuoteId" quoteId='<%=""+QuoteId%>' ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
	<% String quoteName = ""; %>
	<% String quoteDesc = ""; %>
		
	<logic:present name="GetQuoteDetailByQuoteId" scope="request">
		<bean:define id="quoteNameTemp" name="GetQuoteDetailByQuoteId" property="quoteName" />
		<bean:define id="quoteDescTemp" name="GetQuoteDetailByQuoteId" property="quoteDesc" />
		<bean:define id="ParentQuoteVerId1" name="GetQuoteDetailByQuoteId" property="verId" />		
		<bean:define id="notesId" name="GetQuoteDetailByQuoteId" property="notes" />
		<%strNotes = ""+notesId;%>
		<%strParentQuoteVerId = ""+ParentQuoteVerId1; %>
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
		<bean:define id="SubQuoteVerId1" name="aSubQuote" 	property="quoteVerId" />
		<%subQuoteVerId= ""+ SubQuoteVerId1;%>
</logic:iterate>											
</logic:present>

<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
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
														<jsp:param name="heading" value="<%="ISSUE BINDER"%>" />
													</jsp:include>
												</table>
											</td>
										</tr>
									</logic:notEqual>
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
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">Quote Summary</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>&answer(activeTabName)=SubjectivityTab">Goto Subjectivity List</a>
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
													<logic:present name="QuoteTransactionStatus" scope="request">
													<tr>
														<td class="Error"><%= request.getAttribute("QuoteTransactionStatus") %>
														</td>
													</tr>
													</logic:present>
													
													<logic:present name="SubjectivityErrorList">
													<tr>
														<td>
															<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
																<tr>														
																	<td class="Error">
																		A binder cannot be issued until the following pre-bind subjectivity requirement is satisfied or the requirement is waived by an underwriter
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
													</logic:present>											
													<tr><td>&nbsp;</td></tr>
																							
													<tr>
														<td class="Error">
															<logic:present name="MESSAGE_LIST"> 
																<ul>
																	<logic:iterate id="message" name="MESSAGE_LIST">
																		<li><bean:write name="message"/></li>
																	</logic:iterate>
															 	</ul>		 
															 	<%strParetQuoteStatus="Bind Request"; %>			
															</logic:present>
														</td>
													</tr>
													<tr>
														<td>
															<table width="100%" border="0" align="left">

																<dmshtml:dms_isPresent property='<%=new String[]{"Bind Request"}%>' value="<%="Bind Request"%>" negated="true">
																	<dmshtml:isPolicyNumberGeneratedAvailableForProduct productId='<%=Long.parseLong(""+ProductId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' negated="true">
																	    <tr>
																	    	<td align="left" class="TextMatter">
																	    		Policy Number <td class="sectionhead1"><html:text value="" property="answer(PolicyNumber)" size="30" maxlength="30" styleId="txtPolicyNumber" styleClass='txtbox'  /></td>																		
																	    	</td>
																	    </tr>
																	    <tr>
																	    	<td>&nbsp;
																	    	</td>
																	    </tr>
																	    <tr>
																	    	<td>&nbsp;
																	    	</td>
																	    </tr>
																	    	<html:hidden property="answer(PolicyNumber)"  />
																	   </dmshtml:isPolicyNumberGeneratedAvailableForProduct> 																		   	
																	<logic:notPresent name="QuoteTransactionStatus" scope="request">
																	<tr>
																		<td align="left" class="TextMatter">
																		Effective Date
																		&nbsp;</td>
																		<td class="sectionhead1"><html:text value='<%=""+quoteStartDate%>' onchange="setEffectiveDateModified()" property="answer(Object::Quote::QuoteStartDate)" size="30" maxlength="30" styleId="txtDate" styleClass='txtbox' /></td>
																		<input type="hidden" id="isEffectiveDateModified" value="N"/>																		
																	</tr>	
																	<tr>
																		<td>
																			&nbsp;
																		</td>
																	</tr>															
																	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+ProductId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="TRIA_COVERAGE_AVAILABLE" property='<%=new String[]{"Bind Request"}%>' value="Bind Request" negated="true">
																	<tr>
																		<td align="left" class="TextMatter">
																		TRIA Coverage Required 
																		&nbsp;</td>
																		<td class="sectionhead1">
																		
																		<html:select property="answer(Object::Plan::TRIACoverage)" styleId="TRIA" styleClass="txtbox" value="<%=TRIACoverage%>" onchange="savePreviewBinder()">
																		     <html:option value="N">No</html:option>
																		     <html:option value="Y">Yes</html:option>
                                  		         					       </html:select>
                                  		         					       <input type="hidden" name="oldTriaValue" id="triaValue" value="<%=TRIACoverage %>"/>																		
																		</td>																		
																	</tr>																
																	</dmshtml:isFeatureAvailableForProductRoleStatus>
																	<tr>
																		<td>
																			&nbsp;
																		</td>
																	</tr>																     	
																	<tr>																		
																		<td class="TextMatter1" align="left" colspan="2">
																			<div id="editorDiv">
																				<html:textarea property="answer(Object::Quote::Notes)" value="<%=""+strNotes%>" styleId="editor" rows="5" cols="60" />
																			</div>
																		</td>
																	</tr>
																	</logic:notPresent>
																</dmshtml:dms_isPresent>

															</table>
														</td>
													</tr>
													<tr><td>
														<html:hidden property="answer(Object::Quote::QuoteStatus)" styleId="quoteStatusId" value="Bound" />
													</td></tr>
												</table>
											</td>
										</tr>
									</table>
									<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
									<logic:notPresent name="QuoteTransactionStatus" scope="request">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<%
											 boolean isPreview = false;
										%>
											
											
											
											<dmshtml:dms_isPresent property='<%=new String[]{"Bind Request"}%>' value="<%="Bind Request"%>" negated="true">
											<bean:parameter id="numberOfSubQuotes" name="answer(numberOfSubQuotes)" /> 
												
											<% long numberOfSubQuote = Long.parseLong(""+numberOfSubQuotes);
												if(numberOfSubQuote < 2 ) {%>						
											
											<td align="center" class="links" colspan="4">
											<% %>
										
												<div class="sbttn1" style=" display:table-cell; vertical-align:middle;">
												<a href="#" id="previewBinderLink" style="color:#000000;text-decoration:none;" target="_new" onfocus="savePreviewBinder()">Preview Binder Document</a>
												</div>
											</td>
											
											
											<% } %>
											</dmshtml:dms_isPresent>

											<dmshtml:dms_isPresent property='<%=new String[]{"Bind Request"}%>' value="<%="Bind Request"%>" negated="true">
											<div id = "IssueBinder">
												<td align="left" class="links" colspan="4">
													<INPUT TYPE="Submit" value="Issue Binder" class="sbttn" id="IssueBinderSubmit">
												</td>
											</div>	
											</dmshtml:dms_isPresent>

											<td>
												&nbsp;
											</td>

										<tr>
											<td colspan="3">
												&nbsp;
											</td>
										</tr>
										</logic:notPresent>
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
	<%String parentQuoteVerId ="0"; %>
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+strParentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />
				<logic:present name="parentQuoteDetail" scope="request">
						<bean:define id="paretQuoteVerId" name="parentQuoteDetail" property="quoteVerId"/>											
						<%parentQuoteVerId = ""+paretQuoteVerId; %>						
				</logic:present>
	<tr>
		<td>

			<html:hidden name="AddQuote" property="formName" value="form::CREATEQUOTEVERSION"/>
			 <html:hidden name="AddQuote" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			 <html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
			<html:hidden property="page" value="7" />
			
			
			<!-- New hidder variables -->
		
			
			<html:hidden property="answer(QuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(parentQuoteVerId)" value="<%=""+parentQuoteVerId%>" />
			<html:hidden property="answer(QuoteVerId)" value="<%=""+strParentQuoteVerId%>" />
			<html:hidden property="answer(Quote::Page)" value="QUOTE SUMMURY" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" styleId="usrIdfrmjsp"/>
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			
						
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%= ""+ProductId %>" />
			<html:hidden property="answer(ParentQuoteId)" value="<%= ""+QuoteId %>" styleId="ParentQuoteId" />
			<html:hidden property="answer(ParentQuoteVerId)" value="<%= ""+strParentQuoteVerId %>" styleId="ParentQuoteVerId" />
			<html:hidden property="answer(parentQuoteId)" value="<%= ""+QuoteId %>" />
			<html:hidden property="answer(Object::Quote::FirstSubQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(SubQuoteId)" value="<%= ""+SubQuoteId %>" styleId="SubQuoteId" />
			<html:hidden property="answer(subQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%= ""+subQuoteVerId %>" />
			<html:hidden property="answer(Object::Quote::QuoteType)" value="<%= QuoteType %>" />
			<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%= ""+ProductVerId %>"  styleId = "productVerId" />			
			<html:hidden property="answer(DocType)" value="ISSUANCE" />
			<html:hidden property="answer(DocumentType)" value="BINDER" />
			<html:hidden property="answer(OwnerId)" value="<%= ownerId.toString()%>" styleId="OwnerId" />
			<html:hidden property="answer(isPreview)" value="<%= ""+false%>" />	
			<html:hidden property="answer(PlaneState)" value="<%=""+planeState%>" />
			<html:hidden property="answer(Object::Quote::ResProperty::State)" value="<%=""+planeState%>" />
			<html:hidden property="answer(state)" value="<%=""+planeState%>" />
			<html:hidden property="answer(teritory)" value="<%=""+teritory%>" />
			<html:hidden property="answer(territoryName)" value="<%=""+territoryName%>" />
			<html:hidden property="answer(zone)" value="<%=""+zone%>" />
			<html:hidden property="tabNo" value="<%=""+tabNo%>" />
			<html:hidden property="Navigation" value="<%=""+Navigation%>" />			
			<html:hidden property="answer(numberOfSubQuotes)" value="<%=""+noOfSubQuotes%>" />
			<html:hidden property="answer(subQuoteVerId)" value="<%=""+subQuoteVerId%>" />
			
			<html:hidden property="answer(QuoteVerId)" value="<%=""+subQuoteVerId%>" />
			<html:hidden property="answer(ownerId)" value="<%= ownerId.toString()%>" />
			<html:hidden property="answer(OwnerId)" value="<%= ownerId.toString()%>" />
			<html:hidden property="answer(createdBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(updatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(IsIssueBinderAction)" value="YES" />
			<html:hidden property="TabPanelName" value="Policy_Panel" />
			<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value ="<%=""+subQuoteVerId%>" />
			<html:hidden property="answer(isUpdated)" value="Y" />
			<html:hidden property="answer(pagename)" value=" Issue Binder page"/>
			<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
					

			<html:hidden property="answer(RULE_OBJECT_ID)" value ='<%=ProductId+"" %>' />
			<html:hidden property="answer(RULE_OBJECT_VER_ID)" value ='<%=ProductVerId+"" %>' />
			<html:hidden property="answer(RULE_OBJECT_TYPE)" value ="PRODUCT" />
			<html:hidden property="answer(RULE_OBJECT_NAME)" value ="ISSUE_ELIGIBILITY_PRODUCT" />
			<html:hidden property="answer(ProductVerId)" value ='<%=ProductVerId+"" %>' />
			<html:hidden property="answer(ProductId)" value ='<%=ProductId+"" %>' />
			<html:hidden property="answer(RULE_CRITERIA_1)" value ="159" />
			<html:hidden property="answer(MERGE_BEFORE)" value ="YES" />
			<html:hidden property="answer(ASSERT_MAP_ENTRIES)" value ="YES" />
			<html:hidden property="answer(MERGE_AFTER)" value ="NO" />
			<html:hidden property="answer(MODIFIED_FACT_MAP)" value ="YES" />
			<html:hidden property="answer(DEFAULT_POLICY_TAB)" value ="DOCUMENTS" />
			<!--  added by mariraj for checkclearance on Issue Binder -->
			<html:hidden property="answer(Object::PageType)" value="ISSUE_BINDER_CLC"/>
			
			<input type="hidden" name="answer(MERGE_BEFORE)" value="YES"/>
			<input type="hidden" name="answer(MERGE_AFTER)" value="NO"/>
			<input type="hidden" name="answer(ASSERT_MAP_ENTRIES)" value="YES" />
			<input type="hidden" name="answer(MODIFIED_FACT_MAP)" value="YES" />
			<html:hidden property="answer(SUCCESS_F)" value="EIL_SUCCESS" />
			<html:hidden property="answer(FAILURE_F)" value="EIL_FAILURE" />
			<html:hidden property="answer(QUOTE_TRANSACTION_FAILURE_F)" value="QuoteTransactionFailure" />
			
			
			
			
			
			<% 
					session.removeAttribute("IsPolicyCreationAction");
			%>			
		</td>
	</tr>

</table>    
<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="PreviewBinder" />
 <logic:present name="paramValue">
   <logic:equal value="CLBinder" name="paramValue">
	<a id="gotch" href='../CLPreviewBinderPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=BINDER&answer(QuoteId)=<%= ""+strParentQuoteId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(subQuoteId)=<%= ""+SubQuoteId%>&answer(subQuoteVerId)=<%= ""+subQuoteVerId%>&answer(isPreview)=<%=true%>&answer(Object::Quote::ProductId)=<%= ""+ProductId %>&answer(Object::Quote::QuoteType)=<%= ""+QuoteType %>&answer(Object::UserDetail::PrimaryObjectType)=<%=""+ObjectType%>&answer(Object::UserDetail::PrimaryObjectId)=<%=""+objectId%>&answer(Object::UserDetail::roleName)=<%=""+roleName%>&answer(Object::Quote::CreatedBy)=<%=""+userId%>' style="{visibility: hidden}" ></a>
   </logic:equal>
 </logic:present>	
	
