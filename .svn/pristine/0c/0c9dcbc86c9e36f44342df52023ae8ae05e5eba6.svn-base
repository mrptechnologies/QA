<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="com.dms.common.ObjectDescriptor"%>

<script type="text/javascript">
<!--
function alertStmt(frm)
{	
	var formElement=document.forms[0];		
	var prodStatus = formElement.prodStatus.value;
	alert("prodStatus-->"+prodStatus);
	return true;
}
	
//-->
</script>
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/Application.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<html:form action="/Rate.do" onsubmit="return validateCoverages(this);">

<bean:define id="stateFormRequest" name="AddParentQuote" property="answer(Object::Risk::ResProperty::State)" />

<bean:define id="stateCode" name="AddParentQuote" property="answer(Object::Plan::StateCode)" />
<%System.out.println("----------------------State Code----"+stateCode);%>	
<logic:present name="SelectRisksList" scope="request">
<% java.util.ArrayList riskList = (java.util.ArrayList)request.getAttribute("SelectRisksList");%>
<% for(int index =0; index < riskList.size(); index++){%>	
	<html:hidden property="answer(Object::Quote::SelectedRiskList)" value="<%=riskList.get(index)+""%>" styleId="risk"/>
<%}%>
</logic:present>

<!--  html:hidden property="answer(SelectRisksList)" name="AddParentQuote"/> -->
<!-- aa<html:text property="answer(Object::Plan::LocationId)" styleId="locationID" /> 	 -->
<bean:define id="qmap" name="AddParentQuote" property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
	
	<%	
		boolean changePlan=false;
		boolean IsChangePlan = false;
		
		String changePlanParentQuoteId="";
		String changePlanSubQuoteId="0";
		String addPlanSubQuoteId ="0";
		if(request.getParameter("changePlan")!=null) {
			changePlan = true;

		}
		
		if(request.getParameter("IsChangePlan")!=null) {
			IsChangePlan = true;
		}

		if(changePlan){
			
			changePlanParentQuoteId = request.getParameter("answer(parentQuoteId)");
			changePlanSubQuoteId = request.getParameter("answer(subQuoteId)");
			%>
			<html:hidden  property="answer(subQuoteId)" value="<%=changePlanSubQuoteId%>" />	
			<input type="hidden" name="changePlan" value="YES" />
			<%
		}%>
		<% %>
		<bean:define id="AddPlan" name="AddParentQuote" property="answer(Plan::AddPlan)" scope="request"/>
		<html:hidden property="answer(Plan::AddPlan)" value="<%=""+AddPlan%>" />
<%
		if (AddPlan=="YES"){
			addPlanSubQuoteId = request.getParameter("answer(subQuoteId)");
			%>
			<html:hidden  property="answer(Object::Quote::SubQuoteId)" value="<%=addPlanSubQuoteId%>" />	
			
			<%
		}
		boolean displayHRA=true;
		boolean displayComposite=true;
	%>
	
	
	<%if(request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)") != null){%>	
		<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)")%>'/>
	<%}%>
	<bean:define id="primaryEntityId" property="answer(Object::Quote::primaryEntityId)" name="AddParentQuote" />
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
	<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
	<bean:define id="PlanNumber" property="answer(Plan::PlanNumber)" name="AddParentQuote" scope="request" />
	<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
	
	<bean:define id="parentQuoteId" name="AddParentQuote" property="answer(Object::Quote::Id)" scope="request" /> 
	<bean:define id="parentQuoteVerId" name="AddParentQuote" property="answer(Object::Quote::QuoteVerId)" scope="request" /> 
	<bean:define id="policyTerm" name="AddParentQuote" property="answer(Object::Plan::TermInMonths)" />

	<bean:define id="submissionId" name="AddParentQuote" property="answer(Object::Quote::SubmissionId)" scope="request" /> 
	<bean:define id="submissionVerId" name="AddParentQuote" property="answer(Object::Quote::SubmissionVerId)" scope="request" /> 
		
	<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)" />
	<bean:define id="CustomerState" name="AddParentQuote" property="answer(Object::Quote::CustomerState)" />
	<bean:define id="CustomerCounty" name="AddParentQuote" property="answer(Object::Quote::County)" />
	<bean:define id="oldCommissionPercentage" name="AddParentQuote" property="answer(Object::QuoteCommission::CommissionPercentage)" type="java.lang.String"/>
	<bean:define id="initCommissionPercentage" name="AddParentQuote" property="answer(Object::QuoteCommission::InitialCommissionPercentage)" type="java.lang.String"/>

	<bean:define id="oldCommissionFactor" name="AddParentQuote" property="answer(Object::PlanFactor::CommissionFactor)" type="java.lang.String"/>

	<bean:define id="AdjForNonStandardBenefitMedical" name="AddParentQuote" property="answer(Object::PlanFactor::AdjForNonStandardBenefitMedical)" type="java.lang.String"/>
	<bean:define id="AdjForNonStandardBenefitDrug" name="AddParentQuote" property="answer(Object::PlanFactor::AdjForNonStandardBenefitDrug)" type="java.lang.String"/>
	<bean:define id="AdjForNonStandardBenefitLife" name="AddParentQuote" property="answer(Object::PlanFactor::AdjForNonStandardBenefitLife)" type="java.lang.String"/>
	<bean:define id="AdjForNonStandardBenefitWdi" name="AddParentQuote" property="answer(Object::PlanFactor::AdjForNonStandardBenefitWdi)" type="java.lang.String"/>
	<bean:define id="AdjForNonStandardBenefitDentel" name="AddParentQuote" property="answer(Object::PlanFactor::AdjForNonStandardBenefitDentel)" type="java.lang.String"/>

	<bean:define id="RateImpacted" name="AddParentQuote" property="answer(Object::QuoteCommission::RateImpacted)" type="java.lang.String"/>
	<bean:define id="productVerId" name="AddParentQuote" property="answer(Object::Quote::ProductVerId)" scope="request" />
	<bean:define id="paretLockStatus" name="AddParentQuote" property="answer(Object::Quote::LockStatus)" />
	<bean:define id="paretQuoteStatus" name="AddParentQuote" property="answer(Object::Quote::QuoteStatus)" />
	
<bean:define id="SubQuoteId1" name="AddParentQuote" property="answer(subQuoteId)" scope="request" />
<bean:define id="customerId1" name="AddParentQuote" property="answer(customerId)" scope="request" />
<bean:define id="prdGroupId1" name="AddParentQuote" property="answer(Object::Quote::ProductGroupId)" scope="request" />
<bean:define id="prdGroupVerId1" name="AddParentQuote" property="answer(Object::Quote::ProductGroupVerId)" scope="request" />
<bean:define id="productStatus1" name="AddParentQuote" property="answer(productStatus)" scope="request" />
<bean:define id="ProductId1" name="AddParentQuote" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="productVerId1" name="AddParentQuote" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="memberAssociation" name="AddParentQuote" property="answer(Object::Quote::MemberAssociation)" scope="request" />
<html:hidden name="AddParentQuote" property="answer(Object::Quote::MemberAssociation)" value='<%=""+memberAssociation%>' />

<html:hidden name="AddParentQuote" property="answer(Object::Quote::ProductId)" value='<%=ProductId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(Object::Quote::productVerId)" value='<%=productVerId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(SubQuoteId)" value='<%=""+SubQuoteId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(customerId)" value='<%=""+customerId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(Object::Quote::prdGroupId)" value='<%=""+prdGroupId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(Object::Quote::prdGroupVerId)" value='<%=""+prdGroupVerId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(productStatus)" value='<%=""+productStatus1%>' />
<bean:define id="quoteName" property="answer(Object::Quote::QuoteName)" name="AddParentQuote" />
<bean:define id="quoteDesc" property="answer(Object::Quote::QuoteDesc)" name="AddParentQuote" />
<bean:define id="requestFrom" name="AddParentQuote" property="answer(requestFrom)" />
		<%
		String compositeRate="";
		if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
			compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
		}
		%>


<bean:define id="RenewalPolicyNo" name="AddParentQuote" property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" />
<bean:define id="RenewalPolicyCompany" name="AddParentQuote" property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" />
<bean:define id="RenewalSubmissionNumber" name="AddParentQuote" property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" />
<bean:define id="QuoteType" name="AddParentQuote" property="answer(Object::Quote::QuoteType)" />


	

	<%System.out.println("Created Parent Quote Id/Parent Quote VerId is--> "+ parentQuoteId+"/"+parentQuoteVerId);
		String isHealthIns = ""+session.getAttribute("InsType");
	
	%>
	

	<table WIDTH="95%" ALIGN="center" border="0" cellspacing="1" cellpadding="1">
		<tr>
			<td colspan="2">
				<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td>
							&nbsp;
						</td>
					</tr> 
					
					<%
					if(!requestFrom.equals("QuickQuote")) {
					%>
					<tr>
						<td>
							<jsp:include page="../common/CustomerAgencyLinkspage.jsp" flush="" />
						</td>
					</tr>
					<%}%>			
					
					<%if(changePlan==true){ %>
					<tr>
						<td>
							<table width="60%" align="Left" border="0">
								<jsp:include page="../common/QuoteHeader.jsp">
									<jsp:param name="parentQuoteId" value="<%=""+changePlanParentQuoteId%>" />
									<jsp:param name="productVerId" value="<%=""+productVerId%>" />
									<jsp:param name="heading" value="<%="COVERAGES & LIMIT"%>" />
								</jsp:include>
							</table>
						</td>
					</tr>

					<%
					
						parentQuoteId=changePlanParentQuoteId;
				
					}else if(isHealthIns.equalsIgnoreCase("Health")) { %>
						<tr>
							<td>
								<table width="60%" align="Left" border="0">
									<jsp:include page="../common/QuoteHeaderHealth.jsp">
										<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
										<jsp:param name="productVerId" value="<%=""+productVerId%>" />
										<jsp:param name="heading" value="<%="COVERAGES & LIMIT"%>" />
									</jsp:include>
								</table>
							</td>
						</tr>
					<%}else { %>
					<tr>
						<td>
							<table width="60%" align="Left" border="0">
								<jsp:include page="../common/QuoteHeader.jsp">
									<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
									<jsp:param name="productVerId" value="<%=""+productVerId%>" />
									<jsp:param name="heading" value="<%="COVERAGES & LIMIT"%>" />
								</jsp:include>
							</table>
						</td>
					</tr>
					<%}%>		
			<%long subquoteid=0; 
			if((""+SubQuoteId1).length()>0 && ""+SubQuoteId1 != null ){
				subquoteid= Long.parseLong(""+SubQuoteId1); 
			}
			if(subquoteid !=0 && subquoteid!=-1){ %>
					<tr>
						<td colspan="2">
							<table width="100%" align="center" border="0">		
								<jsp:include page="../common/QuotePlanInfoHeader.jsp" >
									<jsp:param name="subQuoteId" value="<%=""+SubQuoteId1%>" />	
									<jsp:param name="customerId" value="<%=""+customerId1%>" />	
									<jsp:param name="productId" value="<%=""+ProductId1%>" />	
									<jsp:param name="productVerId" value="<%=""+productVerId1%>" />
									<jsp:param name="prdGroupId" value="<%=""+prdGroupId1%>" />	
									<jsp:param name="prdGroupVerId" value="<%=""+prdGroupVerId1%>" />
									<jsp:param name="productStatus" value="<%=""+productStatus1%>" />
									<jsp:param name="stateCode" value="<%=""+stateCode%>"/>
								</jsp:include>
							</table>
						</td>
					</tr> 
				<%} %>
				<%System.out.println("--------------------------"+SubQuoteId1);%>	
					
					<tr>
						<td colspan="4">
							<table width="60%" align="left" border="0">
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								<%
									boolean errorOccured=false;
								%>
								<bean:define id="ansmap" name="AddParentQuote"
								property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
								<logic:iterate id="element" name="ansmap">
								<bean:define id="errorListkey" name="element" property="key" />
								<logic:equal name="errorListkey" value="Object::error::list">
								<bean:define id="errorListvalue" name="element" property="value" />
								<logic:iterate id="errmsg" name="errorListvalue">
								<tr>
									<td class="Error"><bean:write name="errmsg"
										property="errorMessage" /> <%
        								errorOccured	=true;
				
										%>
									</td>
								</tr>
								</logic:iterate>
								</logic:equal>
								</logic:iterate>

								<% if(errorOccured)
								{
									((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
								}
								%>
								<tr>
								 	<td class="Error">
										<logic:present name="MESSAGE_LIST" scope="request">
											<ul>
												<logic:iterate id="message" name="MESSAGE_LIST">
													<li><bean:write name="message"/></li>
													<%errorOccured	=true;%>
												</logic:iterate>
											</ul>			
										</logic:present>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<%long subquoteIdForDisplay=0; 
					if((""+SubQuoteId1).length()>0 && ""+SubQuoteId1 != null ){
						subquoteIdForDisplay= Long.parseLong(""+SubQuoteId1); 
					}
					if(!IsChangePlan) { 
						if(subquoteIdForDisplay !=0 && subquoteIdForDisplay!=-1){ %>
						
							<tr>
		
								<td colspan="2" class="links">
									<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">Quote Summary</a>
								</td>
							</tr>
						<% } %>					
					<% } %>
					<tr>
						<td  colspan="6" align="center" class="sectionhead">
							Select Coverages and Limits 
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
					</tr>
	
					<tr>
						<td colspan="4">
							<table WIDTH="85%" ALIGN="center" cellspacing="6" cellpadding="0" border="0">
								<bean:define id="ProductGroupName" name="PRODUCT_GROUP_NAME" type="java.lang.String" />
			
								<tr>
									<td class="sectionhead" ALIGN="center">
										Plan Name&nbsp;&nbsp;&nbsp;&nbsp;<%=ProductGroupName%>
										<input type="hidden" name="answer(PRODUCT_GROUP_NAME)" value="<%=ProductGroupName%>"/>
									</td>
									
								</tr>
				
								<bean:define id="ProductGroupVerId" name="AddParentQuote" property="answer(Object::Quote::ProductGroupVerId)" />
								<bean:define id="prodId" name="AddParentQuote" property="answer(Object::Quote::ProductId)" />
								
								<%
									long productId = 0;
									try{
										productId = Long.parseLong(""+prodId);
									}catch(Exception ex){}
								%>

									
												
								<tr>

									
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
		<tr><td class="Error"><html:text style="display:none;border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;#ff0000;COLOR:ff0000" styleId="ErrorContainer" disabled="disabled" property="answer(Object::Risk::ResProperty::RuleQuestion)" styleClass="txtbox" size="35" maxlength="35" readonly="true"/>	</td></tr>
	</table>
	<bean:parameter id="IsOptionDisabled" name="answer(IsOptionDisabled)" value="N"/>
	<html:hidden property="dirty" styleId="dirty" value="N" />
	<logic:notEqual name="IsOptionDisabled" value="Y">
	<div id='content' >
	<html:hidden property="answer(form::ForwordControl)" styleId="fc"/>
	<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'><div class='nav'><INPUT TYPE='submit' value='Rate' class='sbttn' id="RateTop" onclick="return goSubmit(document.AddParentQuote.RateTop,'Rate')" name='answer(form::ForwordControl1)'></div></div>
	<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'><div class='nav'><INPUT TYPE='submit' value='Save' class='sbttn' id="SaveTop" onclick="return goSubmit(document.AddParentQuote.SaveTop,'Save')" name='answer(form::ForwordControl1)' style='color: FF0000'></div></div>
	</div>
	<div id='loadercontent1' style="display:none">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	Loading....
	</div>
	</logic:notEqual>
<logic:present name="OPTIONS_HTML" scope="request">
<bean:define id="htmlPage" name="OPTIONS_HTML"	type="java.lang.StringBuffer" />
<div id="OPTIONS_DIV">
<%out.println(htmlPage.toString());%>
</div>
<html:hidden  property="answer(AJAX_Rating)" value="N" styleId="AJAX_Rating"/>
<html:hidden  property="answer(CovA_AOP)" value="N" styleId="CovA_AOP"/>
<html:hidden property="answer(Object::Plan::TermInMonths)" />
</logic:present>
	<logic:notEqual name="IsOptionDisabled" value="Y">
	<div id='content' >
	<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'><div class='nav'><INPUT TYPE='submit' value='Rate' class='sbttn' id="RateBottom" onclick="return goSubmit(document.AddParentQuote.RateBottom,'Rate')" name='answer(form::ForwordControl1)'></div></div>
	<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'><div class='nav'><INPUT TYPE='submit' value='Save' class='sbttn' id="SaveBottom" onclick="return goSubmit(document.AddParentQuote.SaveBottom,'Save')" name='answer(form::ForwordControl1)' style='color: FF0000'></div></div>
	</div>
	<div id='loadercontent2' style="display:none">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	Loading....
	</div>
	</logic:notEqual>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>					
												

				<TABLE>
<TR>
		<TD>

		
			<!--/logic:present--> 
			<!--html:hidden name="AddParentQuote" property="answer(Object::Product::ProductState)" value="RELEASED" /-->

<%String pquoteId="";%>
<%if (request.getAttribute("Object::Quote::ParentQuoteId")!= null) { %>
<%pquoteId= request.getAttribute("Object::Quote::ParentQuoteId").toString();%>
<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=pquoteId%>" />
	<html:hidden  property="answer(parentQuoteId)" value="<%=pquoteId%>" />
	<html:hidden property="answer(QuoteId)" value="<%=pquoteId%>" />

<%}%>


			<html:hidden property="TabPanelName" value="Quote_Panel"/>
			<html:hidden property="answer(IsOptionDisabled)"  value="<%=IsOptionDisabled.toString()%>" /> 
			<html:hidden property="IsOptionDisabled" value="<%=IsOptionDisabled.toString()%>" /> 
			<bean:parameter id="userId" name="answer(userId)" /> 
			<html:hidden property="answer(userId)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(user)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>" /> 
			<%if(changePlan==true){%> 
				<html:hidden  property="answer(parentQuoteId)" value="<%=changePlanParentQuoteId%>" />				
			<%}%>
			<html:hidden  property="answer(Object::Quote::QuoteVerId)" value="<%=parentQuoteVerId.toString()%>" />
			<html:hidden  property="quoteId" value="<%=parentQuoteId.toString()%>" />
			
			
			<html:hidden property="answer(dbname)"				value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
							
			<html:hidden  property="answer(SearchAvailableplans::PageNum)" value="0" />

			<bean:define id="AreaNetWorkKey" name="AddParentQuote" property="answer(Object::Quote::AreaNetWorkKey)" scope="request"/>
			
			<html:hidden property="answer(Object::Quote::AreaNetWorkKey)" value="<%=AreaNetWorkKey.toString()%>" />
			
			<html:hidden  property="answer(Object::Quote::QuoteNumber)" value="<%=""+PlanNumber%>" />
	
			<bean:define id="AddPlan" name="AddParentQuote" property="answer(Plan::AddPlan)" scope="request"/>
			<html:hidden property="answer(Plan::AddPlan)" value="<%=""+AddPlan%>" />
			<html:hidden property="answer(Object::UserDetail::roleName)" name="LoginPage" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::PlanFactor::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::PlanFactor::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(AreaNetWorkKey)" value="<%=AreaNetWorkKey.toString()%>" />
			<html:hidden property="answer(parentQuoteIdtoAssociate)" value="<%=parentQuoteId.toString()%>" />
			<html:hidden  property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
			<bean:define id="quoteStartDate" name="AddParentQuote" property="answer(Object::Quote::QuoteStartDate)" scope="request" />
			<bean:define id="quoteEndDate" name="AddParentQuote" property="answer(Object::Quote::QuoteEndDate)" scope="request" />
			<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />
			<bean:define id="CompositeRate" name="AddParentQuote" property="answer(Object::Quote::CompositeRate)" />
			<html:hidden property="answer(Object::Quote::CompositeRate)" value="<%=CompositeRate.toString()%>" />
			<bean:define id="HelthHra" name="AddParentQuote" property="answer(Object::Quote::HelthHra)" />
			<html:hidden property="answer(Object::Quote::HelthHra)" value="<%=HelthHra.toString()%>" />
			<html:hidden property="answer(Object::Quote::Id)" value="<%=changePlanSubQuoteId.toString()%>" />

			<html:hidden  property="answer(Object::Quote::SubmissionId)" value='<%=""+submissionId%>' />
			<html:hidden  property="answer(Object::Quote::SubmissionVerId)" value='<%=""+submissionVerId%>' />

			<bean:define id="NoOfMedicalEmployees" name="AddParentQuote" property="answer(Object::Quote::NoOfMedicalEmployees)" scope="request"/>
			<html:hidden property="answer(Object::Quote::NoOfMedicalEmployees)" value="<%=NoOfMedicalEmployees.toString()%>" />
		
					
			<html:hidden property="answer(Object::QuoteCommission::CommissionPercentage)" value="<%=""+oldCommissionPercentage%>" />
			<html:hidden property="answer(Object::QuoteCommission::InitialCommissionPercentage)" value="<%=""+initCommissionPercentage%>" />
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>" />
			<html:hidden property="answer(Object::Quote::ProductGroupVerId)" value="<%=ProductGroupVerId.toString()%>" />
			<html:hidden property="answer(Object::Quote::ProductGroupName)" value="<%=ProductGroupName.toString()%>" />
			<html:hidden property="answer(Object::Quote::ProductStatus)" name="AddParentQuote" style="Id: prodStatus" />
			
			<html:hidden property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>" />


			<html:hidden property="answer(PlanNameDisPly)" value="<%=""+ProductGroupName%>" />
			<html:hidden  property="answer(Object::Plan::PlanNameDisply)" value="<%=""+ProductGroupName%>" />
						
			<bean:define id="CompanyId" name="AddParentQuote" property="answer(Object::InsuranceType::CompanyId)" />
			<bean:define id="InsuranceTypeId" name="AddParentQuote" property="answer(Object::Risk::InsuranceTypeId)" />
			<html:hidden property="answer(Object::InsuranceType::CompanyId)" value="<%=""+CompanyId%>" />
			<html:hidden property="answer(Object::Risk::InsuranceTypeId)" value="<%=""+InsuranceTypeId%>" />
			
			
				<html:hidden property="answer(Object::PlanFactor::CommissionFactor)" value="<%=""+oldCommissionFactor%>" />
				<html:hidden property="answer(Object::PlanFactor::AdjForNonStandardBenefitMedical)" value="<%=""+AdjForNonStandardBenefitMedical%>" />
			<html:hidden property="answer(Object::PlanFactor::AdjForNonStandardBenefitDrug)" value="<%=""+AdjForNonStandardBenefitDrug%>" />
			<html:hidden property="answer(Object::PlanFactor::AdjForNonStandardBenefitLife)" value="<%=""+AdjForNonStandardBenefitLife%>" />
			<html:hidden property="answer(Object::PlanFactor::AdjForNonStandardBenefitWdi)" value="<%=""+AdjForNonStandardBenefitWdi%>" />
			<html:hidden property="answer(Object::PlanFactor::AdjForNonStandardBenefitDentel)" value="<%=""+AdjForNonStandardBenefitDentel%>" />
	
				<html:hidden property="answer(Object::QuoteCommission::RateImpacted)" value="<%=""+RateImpacted%>" />
				<bean:define id="QuoteStatus" name="AddParentQuote"  property="answer(Object::Quote::QuoteStatus)"/>
				<input type="hidden" name="answer(Object::Quote::QuoteStatus)" value="<%=""+QuoteStatus%>"/>
				<html:hidden property="answer(System::flag::removeArrObjectDetail)" value="yes" />	
			
	
	
	<bean:define id="PLResRiskPropertyId" name="AddParentQuote" property="answer(Object::Plan::PLResRiskPropertyId)" />
	<html:hidden property="answer(Object::Plan::PLResRiskPropertyId)" value="<%=""+PLResRiskPropertyId%>" />
	
	
	<bean:define id="DiscrLossSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::DiscretionaryLossSurcharge_Factor)" />
	<bean:define id="DiscMiscSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::DiscretionaryMiscSurcharge_Factor)" />
	
	
	<bean:define id="LossSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::LossSurcharge_Factor)" />
	<bean:define id="MiscSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::MiscSurcharge_Factor)" />
	
	<html:hidden property="answer(Object::PlanFactor::LossSurcharge_Factor)" value="<%=""+LossSurchargeFactor %>" />	
	<html:hidden property="answer(Object::PlanFactor::MiscSurcharge_Factor)" value="<%=""+MiscSurchargeFactor %>" />
	
	
	<bean:define id="DefaultPolicyFee" name="AddParentQuote" property="answer(Object::Plan::DefaultPolicyFee)" />
	<bean:define id="StampFee" name="AddParentQuote" property="answer(Object::Plan::StampFee)" />
	<bean:define id="SurplusLinesTax" name="AddParentQuote" property="answer(Object::Plan::SurplusLinesTax)" />
	<bean:define id="FilingFee" name="AddParentQuote" property="answer(Object::Plan::FilingFee)" />
	<bean:define id="InspectionFee" name="AddParentQuote" property="answer(Object::Plan::InspectionFee)" />
	<bean:define id="Deductible_CreditOverride_Factor" name="AddParentQuote" property="answer(Object::PlanFactor::Deductible_CreditOverride_Factor)" />
	
	<bean:define id="UnderwriterAdjustmentModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::UnderwriterAdjustmentModifiedFlag)" />
	<bean:define id="underwriterAdjustmentFactor" name="AddParentQuote" property="answer(Object::PlanFactor::underwriterAdjustmentFactor)" />
	
	<bean:define id="LosssurchargeUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::LosssurchargeUWModifiedFlag)" />
	<bean:define id="Deductible_CreditOverrideUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::Deductible_CreditOverrideUWModifiedFlag)" />
	
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryLossSurcharge_Factor)" value="<%=""+DiscrLossSurchargeFactor %>" />	
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryMiscSurcharge_Factor)" value="<%=""+DiscMiscSurchargeFactor %>" />
	<html:hidden property="answer(Object::PlanFactor::Deductible_CreditOverride_Factor)" value="<%=""+Deductible_CreditOverride_Factor %>" />
	
	<html:hidden property="answer(Object::PlanFactor::UnderwriterAdjustmentModifiedFlag)" value="<%=""+UnderwriterAdjustmentModifiedFlag %>" />
	<html:hidden property="answer(Object::PlanFactor::underwriterAdjustmentFactor)" value="<%=""+underwriterAdjustmentFactor %>" />
		
	<html:hidden property="answer(Object::PlanFactor::LosssurchargeUWModifiedFlag)" value="<%=""+LosssurchargeUWModifiedFlag %>" />
	<html:hidden property="answer(Object::PlanFactor::Deductible_CreditOverrideUWModifiedFlag)" value="<%=""+Deductible_CreditOverrideUWModifiedFlag %>" />
	
	
	
	<html:hidden  property="answer(Object::Plan::DefaultPolicyFee)" value="<%=""+DefaultPolicyFee %>" />
	<html:hidden  property="answer(Object::Plan::StampFee)" value="<%=""+StampFee %>" />
	<html:hidden  property="answer(Object::Plan::SurplusLinesTax)" value="<%=""+SurplusLinesTax %>" />
	<html:hidden  property="answer(Object::Plan::InspectionFee)" value="<%=""+InspectionFee %>" />				
	<html:hidden  property="answer(Object::Quote::ProductVerId)" value="<%=""+productVerId %>" />	
	<html:hidden  property="answer(PageFrom)" styleId="pagefrom" value="CovLimit" />

<html:hidden  property="answer(Object::Plan::BaseRateId)" value="1" />	

 
 <bean:define id="FamilyId" name="AddParentQuote" property="answer(Object::Quote::ProductFamilyId)" />
 <html:hidden property="answer(Object::Quote::ProductFamilyId)" value="<%=""+FamilyId%>"/> 
  <html:hidden property="answer(Option::DefaultValue)" value="No"/> 
  <html:hidden property="answer(Object::Quote::PolicyPeriod)"/>
  <html:hidden property="answer(Object::Quote::PolicyPeriodType)" value="months"/>
  <html:hidden property="answer(Object::Quote::PolicyMinEarned)"/>
  <html:hidden property="answer(Object::Quote::PolicyMinEarnedType)"/>
  <html:hidden property="answer(Plan::PlanNumber)"/>
  <html:hidden property="answer(Object::Quote::ProductGroupId)"/>
  <html:hidden property="answer(ruleName)" styleId="ruleName" />
  <html:hidden property="answer(ruleGroupId)" styleId="ruleGroupId" />
<html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" value="no" />
<html:hidden property="answer(Object::Quote::QuoteName)" value="<%=""+quoteName %>" />
<html:hidden property="answer(Object::Quote::QuoteDesc)" value="<%=""+quoteDesc %>" />
<html:hidden property="answer(Object::Quote::Zip)" />
<html:hidden property="answer(Object::Quote::NetWorkCode)" />
<html:hidden property="answer(Object::Quote::CustomerZip)" />
<html:hidden property="answer(Object::Plan::CompositeRateFlag)" />
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" name="AddParentQuote"/>
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" value="<%=""+RenewalPolicyCompany%>" />
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" value="<%=""+RenewalSubmissionNumber%>" />
<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
<html:hidden property="answer(Object::PlanFactor::MedicalUWFactorPrefer)" value="1.0"/>


<bean:define id="UWFactorUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::UWFactorUWModifiedFlag)" />
<bean:define id="DiscretionaryFactorUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::DiscretionaryFactorUWModifiedFlag)" />
<bean:define id="CompositeEEFactorUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::CompositeEEFactorUWModifiedFlag)" />
<bean:define id="CompositeESFactorUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::CompositeESFactorUWModifiedFlag)" />
<bean:define id="CompositeECFactorUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::CompositeECFactorUWModifiedFlag)" />
<bean:define id="CompositeFamilyFactorUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::CompositeFamilyFactorUWModifiedFlag)" />

<bean:define id="LifeCommissionUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::LifeCommissionUWModifiedFlag)" />
<bean:define id="DiscountUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::DiscountUWModifiedFlag)" />
<bean:define id="YearLoadFactorUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::YearLoadFactorUWModifiedFlag)" />


<html:hidden property="answer(Object::PlanFactor::UWFactorUWModifiedFlag)"  value='<%=""+UWFactorUWModifiedFlag %>'/>
<html:hidden property="answer(Object::PlanFactor::DiscretionaryFactorUWModifiedFlag)" value='<%=""+DiscretionaryFactorUWModifiedFlag %>' />
<html:hidden property="answer(Object::PlanFactor::CompositeEEFactorUWModifiedFlag)" value='<%=""+CompositeEEFactorUWModifiedFlag %>' />
<html:hidden property="answer(Object::PlanFactor::CompositeESFactorUWModifiedFlag)" value='<%=""+CompositeESFactorUWModifiedFlag %>' />
<html:hidden property="answer(Object::PlanFactor::CompositeECFactorUWModifiedFlag)" value='<%=""+CompositeECFactorUWModifiedFlag %>' />
<html:hidden property="answer(Object::PlanFactor::CompositeFamilyFactorUWModifiedFlag)" value='<%=""+CompositeFamilyFactorUWModifiedFlag %>' />

<html:hidden property="answer(Object::PlanFactor::LifeCommissionUWModifiedFlag)" value='<%=""+LifeCommissionUWModifiedFlag %>' />
<html:hidden property="answer(Object::PlanFactor::DiscountUWModifiedFlag)" value='<%=""+DiscountUWModifiedFlag %>' />
<html:hidden property="answer(Object::PlanFactor::YearLoadFactorUWModifiedFlag)" value='<%=""+YearLoadFactorUWModifiedFlag %>' />

<html:hidden property="answer(Object::PlanFactor::DiscretionaryAdjDefaultFactor)" />
<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" />
<html:hidden property="answer(Object::PlanFactor::CompositeEmployeeFactor)" />
<html:hidden property="answer(Object::PlanFactor::CompositeEmpSpouseFactor)" />
<html:hidden property="answer(Object::PlanFactor::CompositeEmpChildFactor)" />
<html:hidden property="answer(Object::PlanFactor::CompositeFamilyFactor)" />

<html:hidden property="answer(Object::PlanFactor::CommissionLifeFactor)" />
<html:hidden property="answer(Object::PlanFactor::Discount)" />
<html:hidden property="answer(Object::PlanFactor::YearLoad)" />
<html:hidden property="answer(Object::Risk::ResProperty::State)" value="<%=stateFormRequest.toString()%>" />
<%if(stateFormRequest.toString().equals("")) {%>
<html:hidden property="answer(Object::Plan::StateCode)" value="<%=stateCode.toString()%>" />
<%}else{ %>
<html:hidden property="answer(Object::Plan::StateCode)" value="<%=stateFormRequest.toString()%>" />
<%} %>
<html:hidden property="answer(Object::Quote::QuoteEndDate)" value='<%=quoteEndDate.toString()%>' />
<html:hidden property="answer(Object::Quote::County)" value='<%=CustomerCounty.toString()%>' styleId="county"/>
	
<html:hidden property="answer(Object::PlanFactor::AdministrativeFee)" />
<html:hidden property="answer(Object::Risk::RiskId)" value="1"/>
<html:hidden property="answer(Object::Quote::SupplementalAccidentCoverage)" />
<html:hidden property="answer(Object::Quote::CompositeRate)" value="N"/>
<html:hidden property="answer(Object::Quote::SicMin)" />
<html:hidden property="answer(Object::Quote::Sic)" />
<html:hidden property="answer(Object::Plan::TerrorismZone)" value="1" />
<html:hidden property="answer(Object::Quote::NewQuote)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Quote::PaymentPlan)" name="AddParentQuote"/>

<bean:define id="territoryFromRequest" name="AddParentQuote" property="answer(Object::Risk::ResProperty::RatingTerritory)" />
<bean:define id="zoneFromRequest" name="AddParentQuote" property="answer(Object::Risk::ResProperty::Zone)" />
<bean:define id="territoryNameFromRequest" name="AddParentQuote" property="answer(Object::Risk::ResProperty::RatingTerritoryName)" />
<html:hidden property="answer(Object::Risk::ResProperty::CountyName)" name="AddParentQuote"/>
<%
if(requestFrom.equals("QuickQuote")) {
%>
<html:hidden property="answer(Object::Risk::Teritory)" value="<%=""+territoryFromRequest%>" />
<html:hidden property="answer(Object::Quote::CustomerState)" value="<%=stateFormRequest.toString()%>" styleId="state"/>
<html:hidden property="answer(requestFrom)" value="QuickQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::RatingTerritory)" value="<%=""+territoryFromRequest%>" />
<html:hidden property="answer(Object::Risk::ResProperty::State)" value="<%=stateFormRequest.toString()%>" />
<html:hidden property="answer(Object::Risk::ResProperty::RatingTerritoryName)" value="<%=""+territoryNameFromRequest%>" />
<html:hidden property="answer(Object::Risk::ResProperty::Zone)" value="<%=zoneFromRequest.toString()%>" />
<html:hidden property="answer(Object::Plan::TerritoryName)" value="<%=""+territoryNameFromRequest%>" />
<html:hidden property="answer(Object::Plan::Zone)" value="<%=zoneFromRequest.toString()%>" />
<html:hidden property="answer(Object::Risk::ResProperty::RiskType)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::RiskName)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::City)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::CountyName)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::Zip)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::DateBuilt)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::ConstructionType)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::ProtectionClass)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::HeatSource)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::FireHydrantDistance)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::NumberOfClaims)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::ClaimGTAmount)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::CostalWaterDistance)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Risk::ResProperty::NumberOfFamilies)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Customer::CustomerName)" name="AddParentQuote"/>
<html:hidden property="answer(Agency::AgencyId)" name="AddParentQuote"/>
<html:hidden property="answer(GeneralAgency::AgencyId)" name="AddParentQuote"/>
<html:hidden property="answer(AgentId)" name="AddParentQuote"/>
<html:hidden property="answer(Object::Customer::CreatedBy)" value="<%=""+userId%>" />
<html:hidden property="answer(Object::Customer::UpdatedBy)" value="<%=""+userId%>" />
<html:hidden property="answer(Object::Risk::ResProperty::CreatedBy)" value="<%=""+userId%>" />
<html:hidden property="answer(Object::Risk::ResProperty::UpdatedBy)" value="<%=""+userId%>" />
<html:hidden property="answer(Object::Risk::ResProperty::Active)" value="Y" />
<bean:define id="CompanyId" name="AddParentQuote" property="answer(Object::InsuranceType::CompanyId)" />
<bean:define id="InsuranceTypeId" name="AddParentQuote" property="answer(Object::Risk::InsuranceTypeId)" />
<html:hidden property="answer(Object::InsuranceType::CompanyId)" value="<%=""+CompanyId%>" />
<html:hidden property="answer(Object::Risk::InsuranceTypeId)" value="<%=""+InsuranceTypeId%>" />
<html:hidden property="answer(Object::Quote::primaryEntityId)" value="<%=""+primaryEntityId%>"/>
<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />

<html:hidden property="answer(Object::Risk::ResProperty::ResType)" name="AddParentQuote" />
<html:hidden property="answer(Object::Plan::SeasonalSurcharge)" name="AddParentQuote" />
<html:hidden property="answer(Object::Plan::Lossinpast3years)" name="AddParentQuote" />
<html:hidden property="answer(Object::Plan::FireAlarm)" name="AddParentQuote" />
<html:hidden property="answer(Object::Plan::BurglaryAlarm)" name="AddParentQuote" />
<html:hidden property="answer(Object::Plan::Bankruptcy)" name="AddParentQuote" />
<html:hidden property="answer(Object::Plan::Foreclosure)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::Occupancy)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::SwimmingPoolAnfFenceType)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::ElectricSerciveType)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::IsWiringUpdated)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::IsRoofUpdated)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::WiringUpdated)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::HeatingUpdated)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::PlumbingUpdated)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::RoofUpdated)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::StreetNumber)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::StreetName)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::Address1)" name="AddParentQuote" />
<html:hidden property="answer(claimcount)" name="AddParentQuote" />
<html:hidden property="answer(effDate)" name="AddParentQuote" />
<html:hidden property="answer(Object::Risk::ResProperty::RatingTerritoryName)" name="AddParentQuote" value="<%=""+territoryNameFromRequest%>"/>
<html:hidden property="answer(Object::Risk::ResProperty::Zone)" name="AddParentQuote" value="<%=""+zoneFromRequest%>"/>
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" name="AddParentQuote"/>
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" value="<%=""+RenewalPolicyCompany%>" />
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" value="<%=""+RenewalSubmissionNumber%>" />
<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
<html:hidden property="answer(NewClaimWithoutAdd)" name="AddParentQuote" />

<bean:define id="effDate" name="AddParentQuote" property="answer(effDate)" />
<html:hidden property="answer(Object::Quote::QuoteStartDate)" value='<%=effDate.toString()%>' />
<html:hidden property="answer(Object::Quote::QuoteEndDate)" value='<%=quoteEndDate.toString()%>' />
<!-- ## TO SET THE CLAIM DEAILS -->
<bean:define id="claimCount" name="AddParentQuote" property="answer(claimcount)" />
<bean:define id="newClaimWithoutAdd" name="AddParentQuote" property="answer(NewClaimWithoutAdd)" />
<%if((""+newClaimWithoutAdd).equalsIgnoreCase("Yes")){%>
		<html:hidden property="answer(Object::Risk::ResProperty::LossDate)" name="AddParentQuote" />
		<html:hidden property="answer(Object::Risk::ResProperty::LossType)" name="AddParentQuote" />
		<html:hidden property="answer(Object::Risk::ResProperty::LossCause)" name="AddParentQuote" />
		<html:hidden property="answer(Object::Risk::ResProperty::LossCompany)" name="AddParentQuote" />
		<html:hidden property="answer(Object::Risk::ResProperty::LossAmount)" name="AddParentQuote" />
<%} %>
<%if(!(""+claimCount).equals("")) { 
	long lngClaimCount = Long.parseLong(""+claimCount);
	for(int count=0;count<lngClaimCount;count++) {
		String date="answer(Object::Risk::ResProperty::LossHistory::LossDate"+(count+1)+")";
		String type="answer(Object::Risk::ResProperty::LossHistory::LossType"+(count+1)+")";
		String cause="answer(Object::Risk::ResProperty::LossHistory::LossCause"+(count+1)+")";
		String company="answer(Object::Risk::ResProperty::LossHistory::LossCompany"+(count+1)+")";
		String amount="answer(Object::Risk::ResProperty::LossHistory::LossAmount"+(count+1)+")";
	%>
		<html:hidden property="<%=date%>" name="AddParentQuote" />
		<html:hidden property="<%=type%>" name="AddParentQuote" />
		<html:hidden property="<%=cause%>" name="AddParentQuote" />
		<html:hidden property="<%=company%>" name="AddParentQuote" />
		<html:hidden property="<%=amount%>" name="AddParentQuote" />
		
	<%} } %>
<%}else { %>
<html:hidden property="answer(Object::Risk::Teritory)"  />
<html:hidden property="answer(Object::Quote::primaryEntityId)" value="<%=""+primaryEntityId%>"/>
<%if(!CustomerState.equals("") ){ %>
<html:hidden property="answer(Object::Quote::CustomerState)" value='<%=CustomerState.toString()%>' styleId="state"/>
<%}else{ %>
<html:hidden property="answer(Object::Quote::CustomerState)" value="<%=stateFormRequest.toString()%>" styleId="state"/>
<%} %>
<html:hidden property="answer(Object::Quote::QuoteStartDate)" value='<%=quoteStartDate.toString()%>' />

<%}%>

 <html:hidden property="answer(Object::Quote::LockStatus)" value="Unlocked"/>
</TD>
</TR>
</TABLE>


			
</html:form>
