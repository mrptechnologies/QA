<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>
<script type="text/javascript" src="../Scripts/JScripts/CreateQuoteCL.js"></SCRIPT>
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/prototype.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css">
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>

<script type="text/javascript">
function checksubmitandvalidatedate(){
	if(document.getElementById("PolicyNumPreFix").value == ""){
		alert("Please select Policy Number Prefix");
		return false;
	}
	var dateResult=validateDateBinderBTA('submit');	
	if ( dateResult ) {	
		document.getElementById("IssueBinderSubmit").disabled = true;	
		return true;	
	} else {
	return false;
	}	
}

function validateEffectiveDate(){
   
   var  parentQuoteId = document.getElementById("ParentQuoteId").value ;
   alert(parentQuoteId)
   
   var SubQuoteId =   document.getElementById("SubQuoteId").value ;
   alert(SubQuoteId)
   var OwnerId = document.getElementById("OwnerId").value ;
   alert(OwnerId)
   var productVerId = document.getElementById("productVerId").value ;
   alert(productVerId)
   
  // var pars='ObjectId='+ObjectId+'&ObjectVerId='+ObjectVerId+'&ObjectType='+ObjectType+'&OwnerId='+OwnerId;
   var pars='answer(RULE_OBJECT_ID)='+520+'&answer(RULE_OBJECT_VER_ID)='+637+'&answer(RULE_OBJECT_TYPE)='+"PRODUCT"+'&answer(RULE_OBJECT_NAME)='+"ISSUE_ELIGIBILITY_PRODUCT"+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(SubQuoteId)='+SubQuoteId+'&answer(OwnerId)='+OwnerId+'&answer(ProductVerId)='+productVerId+'&answer(ProductId)='+520+'&answer(RULE_CRITERIA_1)='+159;
   var ajax = new Ajax.Updater({success: 'IssueBinder'},'../IssueBinderExcecuteRulesAction.do',{method: 'post', parameters:pars});		

}
function showHidePOlicyNumberPrefix(value){	
	if(value=="Y"){		
		document.getElementById("PolicyNumPreFixTr").style.display='';
	}else{
		document.getElementById("PolicyNumPreFixTr").style.display='none';
	}
}

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
			String renewalPolicyNo = "";
			if(request.getParameter("answer(Object::QuoteAdditional::RenewalPolicyNumber)")!=null && request.getParameter("answer(Object::QuoteAdditional::RenewalPolicyNumber)")!=""){
				renewalPolicyNo = ""+request.getParameter("answer(Object::QuoteAdditional::RenewalPolicyNumber)");
			}
		%>
		
<% long ProductId = Long.parseLong((request.getParameter("answer(Object::Quote::ProductId)")).toString()); %>
<% long QuoteId = Long.parseLong((request.getParameter("answer(parentQuoteId)")).toString()); %>
<% long SubQuoteId = Long.parseLong((request.getParameter("answer(Object::Quote::FirstSubQuoteId)")).toString()); %>
<% long SubQuoteVerId = Long.parseLong((request.getParameter("answer(Object::Quote::QuoteVerId)")).toString()); %>
<% long subQuoteVerId = Long.parseLong((request.getParameter("answer(subQuoteVerId)")).toString()); %>
<% String QuoteType = (request.getParameter("answer(Object::Quote::QuoteType)")).toString(); %>
<% String planeState = (request.getParameter("answer(state)")).toString(); %>
<%String TRIACoverage = ""; %>
<%String strNotes =""; %>
	<bean:parameter name="answer(DocumentType)" id="DocumentType" />
	
	<html:form action="/CheckClearanceForQuoteAction.do" onsubmit="return checksubmitandvalidatedate();"  >	
<div id="refreshDiv">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)"/>
<bean:parameter name="answer(Object::Quote::QuoteStartDate)" id="quoteStartDate" />
<bean:parameter name="answer(Object::Quote::QuoteEndDate)" id="quoteEndDate" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
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
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">Quote Summary</a>
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
																<tr><td>&nbsp;</td></tr>													
															</table>
														</td>
													</tr>	
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
													<tr><td>&nbsp;</td></tr>
													</logic:present>											
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
															<table width="70%" border="0" align="left">

																<dmshtml:dms_isPresent property='<%=new String[]{"Bind Request"}%>' value="<%="Bind Request"%>" negated="true">
																	<dmshtml:isPolicyNumberGeneratedAvailableForProduct productId='<%=Long.parseLong(""+ProductId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' negated="true">
																	    
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
															<td align="center" class="TextMatter" style="text-align: ce">Policy Effective Date &nbsp;</td>
															<td class="sectionhead1" align="left">
															<div id="policyAnniversaryDate1"></div>
															<jsp:include page="../common/ExtDateField.jsp">
																<jsp:param name="inputDateField" value="policyAnniversaryDate" />
																<jsp:param name="panelDiv" value="policyAnniversaryDate1" />
																<jsp:param name="minimumDate" value="" />
																<jsp:param name="maximumDate" value="" />
																<jsp:param name="allowBlank" value="false" />
																<jsp:param name="setDefaultToday" value="false" />
																<jsp:param name="TodayDate" value="" />
															</jsp:include>
															</div>
																<html:hidden property="answer(Object::Quote::QuoteStartDate)" styleId="txtDate" value='<%=""+quoteStartDate%>' />
															</td>															
														</tr>														

														<tr>
															<td align="left" class="TextMatter">Policy Expiration Date &nbsp;</td>
															<td class="sectionhead1" align="left">
															<div id="policyExpirationDate1"></div>
															<jsp:include page="../common/ExtDateField.jsp">
																<jsp:param name="inputDateField" value="policyExpirationDate" />
																<jsp:param name="panelDiv" value="policyExpirationDate1" />
																<jsp:param name="minimumDate" value="" />
																<jsp:param name="maximumDate" value="" />
																<jsp:param name="allowBlank" value="false" />
																<jsp:param name="setDefaultToday" value="false" />
																<jsp:param name="TodayDate" value="" />
															</jsp:include>
															</div>
															<html:hidden property="answer(Object::Quote::QuoteEndDate)" styleId="ExpDate" value='<%=""+quoteEndDate%>' />
															</td>
														</tr>
														<tr id="PolicyNumPreFixTr">
															<td align="left" class="TextMatter">
																Policy Number Prefix
															</td>
															<td>
																<html:select name="AddProduct" property="answer(Object::Product::PolicyNumPreFix)" styleClass="txtbox" styleId="PolicyNumPreFix" value="BTA" >
																	<logic:present name='PolicyNumberList' scope="request">
																		<html:option value="">Select</html:option>
																       	<logic:iterate id="PolicyNumberList" name="PolicyNumberList" scope="request">
																	         <bean:define id="PolicyNumPreFix" name="PolicyNumberList" property="Object::Product::PolicyNumPreFix"/>																	         
																	         <html:option value='<%=PolicyNumPreFix.toString()%>'><%=PolicyNumPreFix.toString() %></html:option>
																       </logic:iterate>
															    	</logic:present>		
															    </html:select>
															</td>
														</tr>
														<dmshtml:dms_isPresent property='<%=new String[]{"RENEWAL"}%>' value="<%=QuoteType.toString()%>" negated="true" >
															<tr id="RenewalPolicyNo" >
																<td class="TextMatter" align="left"> Do you want the system to generate the policy number? </td>
																<td align="left"> 
																	<input type="radio" value="Y" name="answer(Object::Quote::GeneratePolicyNumber)" checked="true" onclick="showHidePOlicyNumberPrefix(this.value);">Yes
																	<input type="radio" value="N" name="answer(Object::Quote::GeneratePolicyNumber)" onclick="showHidePOlicyNumberPrefix(this.value);">No
																</td>
															</tr>															
															<tr id="RenewalPolicyNo" >
																<td class="TextMatter" align="left"> Renewing Policy Number: </td>
																<td align="left"><html:text property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" styleId="RenewalPolicyNumber" value='<%=""+renewalPolicyNo%>' /> </td>
															</tr>
														</dmshtml:dms_isPresent>
														<dmshtml:dms_isPresent property='<%=new String[]{"RENEWAL"}%>' value="<%=QuoteType.toString()%>" negated="false" >
															<tr id="RenewalPolicyNo" >
																<td>
																	<html:hidden property="answer(Object::Quote::GeneratePolicyNumber)" value="Y" />
																</td>
															</tr>															
														</dmshtml:dms_isPresent>														
														<tr>
															<td>&nbsp;</td>
														</tr>
														
														<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+ProductId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="TRIA_COVERAGE_AVAILABLE" property='<%=new String[]{"Bind Request"}%>' value="Bind Request" negated="true">
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
																		<html:select property="answer(Object::Plan::TRIACoverage)" styleId="TRIA" styleClass="txtbox" value="<%=TRIACoverage%>" >
																		     <html:option value="N">No</html:option>
																		     <html:option value="Y">Yes</html:option>
                                  		         					       </html:select>																		
																		</td>																		
																	</tr>																
																	</dmshtml:isFeatureAvailableForProductRoleStatus>
																	<tr>
																		<td>
																			&nbsp;
																		</td>
																	</tr>
																    
															</dmshtml:isFeatureAvailableForProductRoleStatus>
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
									<table WIDTH="25%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
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
											
											
											
											<% } %>
											</dmshtml:dms_isPresent>

											<dmshtml:dms_isPresent property='<%=new String[]{"Bind Request"}%>' value="<%="Bind Request"%>" negated="true">
											
											<div id = "IssueBinder">
											
											<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BIND_VIEW"}%>' connector='or' negated="true">
											
											<td align="center" class="links" colspan="4">										
									   		<INPUT TYPE="Button" style="font-size:13px; width:200px;" value="Preview Invoice Document" class="covbigbutton1" onclick ='savePreviewBinder()'/>											
											</td>
											
											</dmshtml:dms_static_with_connector>
											
												<td align="center" class="links" colspan="4">
													<INPUT TYPE="Submit" value="Issue Binder" class="covbigbutton1" style="font-size:13px; width:100px;" id="IssueBinderSubmit">
												</td>
											</div>	
											</dmshtml:dms_isPresent>

											<td>
												<dmshtml:dms_button value="Back" property="answer(back)" styleClass="covbigbutton1" style="font-size:13px;width:100px;" onclick="javascript:history.go(-1);"/>
											</td>
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
			<html:hidden property="answer(parentQuoteVerId)" value="<%=""+strParentQuoteVerId%>" />
			<html:hidden property="answer(QuoteVerId)" value="<%=""+strParentQuoteVerId%>" />
			<html:hidden property="answer(Quote::Page)" value="QUOTE SUMMURY" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" styleId="usrIdfrmjsp"/>
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			
			
			<html:hidden property="answer(Object::Product::ProductId)" value="<%= ""+ProductId %>" />
			<html:hidden property="answer(Object::ProductVer::ProductVerId)" value="<%= ""+ProductVerId %>"/>
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%= ""+ProductId %>" />
			<html:hidden property="answer(ParentQuoteId)" value="<%= ""+QuoteId %>" styleId="ParentQuoteId" />
			<html:hidden property="answer(ParentQuoteVerId)" value="<%= ""+strParentQuoteVerId %>" styleId="ParentQuoteVerId" />
			<html:hidden property="answer(parentQuoteId)" value="<%= ""+QuoteId %>" />
			<html:hidden property="answer(Object::Quote::FirstSubQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(SubQuoteId)" value="<%= ""+SubQuoteId %>" styleId="SubQuoteId" />
			<html:hidden property="answer(subQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%= ""+SubQuoteVerId %>" />
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
			<html:hidden property="answer(QuoteVerId)" value="<%=""+SubQuoteVerId%>" />
			<html:hidden property="answer(ownerId)" value="<%= ownerId.toString()%>" />
			<html:hidden property="answer(OwnerId)" value="<%= ownerId.toString()%>" />
			<html:hidden property="answer(createdBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(updatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(IsIssueBinderAction)" value="YES" styleId="IsIssueBinderAction"/>
			<html:hidden property="TabPanelName" value="Policy_Panel" />
			<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value ="<%=""+prevSubQuoteVerId%>" />
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
			<html:hidden property="answer(Object::PageType)" value="BTA_ISSUE_BINDER_CLC"/>
			
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
	<a id="gotch" href='../CLPreviewBinderPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=BINDER&answer(QuoteId)=<%= ""+strParentQuoteId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(subQuoteId)=<%= ""+SubQuoteId%>&answer(subQuoteVerId)=<%= ""+subQuoteVerId%>&answer(isPreview)=<%=true%>&answer(Object::Quote::ProductId)=<%= ""+ProductId %>&answer(Object::Quote::QuoteType)=<%= ""+QuoteType %>' style="{visibility: hidden}" ></a>
   </logic:equal>
 </logic:present>	
</div>

<script type="text/javascript">
   			Ext.onReady(function(){
   				 var txtDate = document.getElementById('txtDate').value;		
   				 Ext.getCmp('policyAnniversaryDate').setValue(txtDate);
   				 var expDate = document.getElementById('ExpDate').value;		
   				 Ext.getCmp('policyExpirationDate').setValue(expDate);
				   				
   				var blurHandlerAnniversaryDate = function() {        				
   					 var effDate1 = Ext.getCmp('policyAnniversaryDate').getValue(); 
   					 var effDate2 = Ext.getCmp('policyAnniversaryDate').getValue();
   					 
   					 var MM1 = effDate1.getMonth()+1;
					 var DD1 = effDate1.getDate();
					 var YY1 = effDate1.getFullYear();
					 if(MM1<10){ MM1 = "0"+(MM1);}
					 if(DD1<10){ DD1 = "0"+DD1;}
					 Ext.getCmp('policyExpirationDate').setValue(MM1+'/'+DD1+'/'+YY1);		
					 document.getElementById("txtDate").value = MM1+'/'+DD1+'/'+YY1;
					 
					 var MM2 = effDate2.getMonth()+1;
					 var DD2 = effDate2.getDate();
					 var YY2 = effDate2.getFullYear()+1;
					 if(MM2<10){ MM2 = "0"+(MM2);}
					 if(DD2<10){ DD2 = "0"+DD2;}
					 Ext.getCmp('policyExpirationDate').setValue(MM2+'/'+DD2+'/'+YY2);
					 document.getElementById("ExpDate").value = MM2+'/'+DD2+'/'+YY2;					 		 
   				};      				
   				
   				var blurHandlerExpirationDate = function() { 					 
   					 var effDate2 = Ext.getCmp('policyAnniversaryDate').getValue();
   					 var expDate1 = Ext.getCmp('policyExpirationDate').getValue();  
   					 
   					 var MM1 = expDate1.getMonth()+1;
					 var DD1 = expDate1.getDate();
					 var YY1 = expDate1.getFullYear();
					 
   					 var MM2 = effDate2.getMonth()+1;
					 var DD2 = effDate2.getDate();
					 var YY2 = effDate2.getFullYear();				 
					 
					 if(MM1<10){ MM1 = "0"+(MM1);}
					 if(DD1<10){ DD1 = "0"+DD1;}
					 Ext.getCmp('policyExpirationDate').setValue(MM1+'/'+DD1+'/'+YY1);
					 document.getElementById("ExpDate").value = MM1+'/'+DD1+'/'+YY1;					 
					 
					 if(MM2<10){ MM2 = "0"+(MM2);}
					 if(DD2<10){ DD2 = "0"+DD2;}
					 Ext.getCmp('policyAnniversaryDate').setValue(MM2+'/'+DD2+'/'+YY2);
					 document.getElementById("txtDate").value = MM2+'/'+DD2+'/'+YY2;
   				}; 
   										   							
   				Ext.EventManager.on('policyAnniversaryDate', 'blur', blurHandlerAnniversaryDate);   				  				
  				Ext.EventManager.on('policyExpirationDate', 'blur', blurHandlerExpirationDate);
  			});
	</script>

</html:form>

<script type="text/javascript">
function savePreviewBinder () {
document.getElementById("quoteStatusId").value="Bind Request";
document.getElementById("IsIssueBinderAction").value="No";

url="/SavePreviewBinderBTAPdf.do";	
 panel="refreshDiv";
  new Ajax.Request(url, {method: 'post',parameters:$(document.forms[0]).serialize(this),onComplete:function(transport){	previewBinder();},onSuccess:
   function(transport){
	   
        document.getElementById("refreshDiv").innerHTML =transport.responseText;
        
	  	previewBinder();
	  	document.getElementById("IsIssueBinderAction").value="YES";
  }
 });
}
function previewBinder() {
	
window.open(document.getElementById('gotch'));

}

</script>