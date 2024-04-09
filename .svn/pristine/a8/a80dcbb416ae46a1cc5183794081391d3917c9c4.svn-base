<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dms.ejb.insurance.quote.common.plan.PlanDetail" %>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/QuoteSummary.js"></script>


<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="EndorsementDetail" property="answer(productVerId)" scope="request"/>
<bean:define id="customerId" name="EndorsementDetail" property="answer(customerId)" scope="request"/>
<bean:define id="CustomerState" name="EndorsementDetail" property="answer(State)" scope="request"/>
<bean:define id="agencyId" name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" scope="request"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="renewalPolicyNumber" name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(policyNumber)" />
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:define id="subQuoteId" name="EndorsementDetail" property="answer(subQuoteId)" />
<logic:empty name="policyNumber">
	<bean:define id="policyNumber" name="EndorsementDetail" property="answer(policyNumber)" />
</logic:empty>
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />
<bean:define id="parentPolicyStatus" name="EndorsementDetail" property="answer(parentPolicyStatus)" />
<%
ArrayList feeDetailsList=new ArrayList();
ArrayList surchargeDetailsList=new ArrayList();
ArrayList taxDetailsList=new ArrayList();
String planState="";

feeDetailsList=(ArrayList)request.getAttribute("QUOTE_PLAN_FEE");
surchargeDetailsList=(ArrayList)request.getAttribute("QUOTE_PLAN_SURCHARGE");
taxDetailsList=(ArrayList)request.getAttribute("QUOTE_PLAN_TAX");
%>
<table width="98%">
	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0" bgcolor="#C6DEEA">
				<tr>
					<td>
						<div id="QuoteInsuerdAgencyAgentHeader">
							<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
							<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
							</jsp:include>
						</div>			
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" colspan=2>
			<table width="100%" align="left" border="0" >
				<tr>
					<td class="NewSectionHead" align="center">ENDORSEMENT DETAIL</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
					</jsp:include>
				</td>
			</tr>		
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<%-- <tr>
				<td>
				<table width="60%" align="Left" border="0">
					<jsp:include page="../common/QuoteHeader.jsp">
						<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="productVerId" value="<%=""+productVerId%>" />
						<jsp:param name="heading" value="<%="ENDORSEMENT DETAIL"%>" />
					</jsp:include>
				</table>
				</td>
			</tr>--%>
		<tr>
			<td align="left">
				<jsp:include page="../common/EndorsementQuoteHeader.jsp">
					<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
				</jsp:include>
			</td>
		</tr>
			
		</table>
		</td>
	</tr>
	<tr>
		<td class="links">
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentPolicyStatus)=<%=parentPolicyStatus.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
		</td>
		<%--<td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td>--%>
	</tr>

	<tr>
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
	<div id="dolphincontainer">
		<div id="dolphinnav">
			<ul>
				<li>
					<a class="" rel="Premium Effect">
					<span>Premium Effect</span></a></li>
				<li>
					<a class="" rel="Reason">
					<span>Reason</span></a></li>
			</ul>
		</div>

		<div style="display:block;" id="Premium Effect" class="innercontent">&nbsp;&nbsp;
			<html:form action="/SaveEndorsementDetailAction.go" onsubmit="return maxLengthTextAreaDesc('Reason')">
				<table class="FormLabelsApplication" cellpadding="2" cellspacing="1" width="50%">
				<logic:present name="QUOTE_POLICY_HISTORY" scope="request">
				<bean:define id="quotePolicyHistoryDetail" name="QUOTE_POLICY_HISTORY" type="com.dms.ejb.insurance.quote.common.quotepolicyhistory.QuotePolicyHistoryDetail" scope="request"/>
				<logic:present name="SUBQUOTE_DETAIL_MAP" scope="request">
				<bean:define id="subQuoteDetailMap" name="SUBQUOTE_DETAIL_MAP" type="com.dms.ejb.data.QuestionHashMap" scope="request"/>
				<tr>
					<td class="FormLabels">Full Term Policy Premium</td>
					<td class="Numeric">
					<%--<bean:write name="quotePolicyHistoryDetail" property="totalBasePremium"/>--%>
					
					<bean:define id="totalBasePremium" name="subQuoteDetailMap" property="Object::Quote::CancelBasePremium" />
					<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremium%>"/>	
					</td>
				</tr>
				<bean:define id="cancelType" name="subQuoteDetailMap" property="Object::Plan::CancelType" />
				<%if ((""+cancelType).equalsIgnoreCase("PRORATA")) {%>
					<tr>
						<td class="FormLabels">Prorata Factor</td>
						<td class="Numeric">
						<%--<bean:write name="subQuoteDetailMap" property="Object::PlanFactor::ProrataFactor"/>--%>
						
						<bean:define id="prorataFactor" name="subQuoteDetailMap" property="Object::PlanFactor::ProrataFactor" />
						<%=""+prorataFactor%>
						
						</td>
					</tr>
					<tr>
						<td class="FormLabels">Pro Rata Premium</td>
						<td class="Numeric">
							<%--<bean:write name="subQuoteDetailMap" property="Object::Plan::TotalBasePremium"/>--%>
							<bean:define id="totalBasePremium" name="subQuoteDetailMap" property="Object::Quote::CancelProrataPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremium%>"/>	
						</td>
					</tr>
				<%} %>
				<dmshtml:LoadFeeTaxDetail nameInSession = "feeTaxList" subQuoteVerId="<%=Long.parseLong(""+subQuoteDetailMap.getString("Object::Quote::QuoteVerId"))%>" subQuoteId = "<%=Long.parseLong(""+subQuoteId)%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId) %>"  />	 	
					<logic:present name="feeTaxList">
						<bean:define id="feetaxList" name="feeTaxList"></bean:define>
						<%int i=0; %>
							<logic:iterate id="detail" name="feetaxList">							
								<logic:iterate id="objDetail" name="detail">
								<%if(i==0) { %>
									<tr>
										<td class="FormLabels"><%=""+((com.dms.ejb.insurance.quote.common.plan.PlanDetail)objDetail).getFeeDescription()%></td>
										<td class="Numeric"><dmshtml:CurrencyFormatTag format='<%=""+((com.dms.ejb.insurance.quote.common.plan.PlanDetail)objDetail).getCancellationFee()%>'/></td>
									</tr>	
									<%}else { %>	
										<tr>
										<td class="FormLabels"><%=""+((com.dms.ejb.insurance.quote.common.plan.PlanDetail)objDetail).getTaxDescription()%></td>
										<td class="Numeric"><dmshtml:CurrencyFormatTag format='<%=""+((com.dms.ejb.insurance.quote.common.plan.PlanDetail)objDetail).getCancellationTax()%>'/></td>
									</tr>									
									<%} %>																																							
								</logic:iterate>
								<%i++; %>
							</logic:iterate>
					</logic:present>
				</logic:present>
				<tr>
					<td class="FormLabels">TRIA Premium</td>
					<td class="Numeric">
					<%--<bean:write name="quotePolicyHistoryDetail" property="totalBasePremium"/>--%>
					
					<bean:define id="triapremium" name="subQuoteDetailMap" property="Object::Quote::CancelTriaPremium" />
					<dmshtml:CurrencyFormatTag format="<%=""+triapremium%>"/>	
					</td>
				</tr>
				<tr>
					<td class="FormLabels">Non Certified Tria Premium</td>
					<td class="Numeric">	
						<%--<bean:write name="quotePolicyHistoryDetail" property="totalBasePremium"/>--%>
						<bean:define id="nonCertifiedTriapremium" name="subQuoteDetailMap" property="Object::Quote::cancelNonCertifiedTriaPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+nonCertifiedTriapremium%>"/>	
					</td>
				</tr>
				<tr>
					<td class="FormLabels">Total Premium</td>
					<td class="Numeric">
					<strong>					
						<%--<bean:write name="subQuoteDetailMap" property="Object::Quote::TotalPremium"/>--%>
						<bean:define id="totalpremium" name="subQuoteDetailMap" property="Object::Quote::CancelTotalPremium"/>
						<dmshtml:CurrencyFormatTag format="<%=""+totalpremium%>"/>
					</strong></td>
				</tr>									
				<bean:define id="isGASurchargeApplicable" name="subQuoteDetailMap" property="Object::Plan::IsGASurchargeApplicable" />					
				<%if(isGASurchargeApplicable.equals("Y")){							
					for(int surchargeCount=0;surchargeCount<surchargeDetailsList.size();surchargeCount++){		
					PlanDetail surchargeDetail=(PlanDetail)surchargeDetailsList.get(surchargeCount);%>
		            <tr>
						<td class="FormLabels"><%="Prorated "+surchargeDetail.getSurchargeName()%></td>
						<td class="Numeric">
						<dmshtml:CurrencyFormatTag format="<%=""+surchargeDetail.getCancellationSurcharge()%>"/>		
						</td>
					</tr>
				<%}}%>
				</logic:present>
				</table>
				<input name="answer(Page::Action)" value="SELECT" type="hidden"/>
				<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
				
				<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(subQuoteId)" />
				<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
				<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</html:form>	
		</div>
			
		<div style="display:none;" id="Reason" class="innercontent">

			<html:form action="/SaveEndorsementDetailAction.go" onsubmit="return validateReason()" styleId="Application1">
				<table class="FormLabelsApplication" width="60%" border="0" cellpadding="2" cellspacing="2" >
				<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels" width="40%" valign="middle">Reinstate Reason </td>

						<td class="FormLabels" width="40%" valign="middle">
							<dmshtml:get_DropDown_Values dbname='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'  lookupType="Reinstate_Reason" nameInSession="dropDownValues" ownerId='<%=""+ownerId %>' />							
								<logic:present name="dropDownValues" scope="request">									
									<bean:define id="dropDownValueList" name="dropDownValues" type="java.util.ArrayList"/>			
										<html:select property="answer(Object::QuoteAdditional::ReinstateReason)" styleClass='txtbox' onchange="showDesc()" styleId="Reinstate_Reason" >
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
					<tr id="Other_Desc_Container" style="display:none">
						<td class="FormLabels" width="40%" valign="middle">Description for Underwriting Reasons</td>
						<td class="FormLabels" width="40%" valign="top">
							<html:textarea property="answer(Object::QuoteAdditional::EndorsementDescription)" styleClass="txtarea" cols="40" rows="8" styleId="EndorsementDescription" onkeyup="maxLengthTextAreaDesc('Reason')"/>
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >
						<tr>
							<td colspan="2" align="center">
								<input name="answer(SubmitType)" value="Save" class="sbttn" type="submit">
							</td>
						</tr>
					</dmshtml:dms_isPresent>

						<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(subQuoteId)" />
						<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
						<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
						<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						<html:hidden property="answer(Object::Activity::ActivityMsg)" value='<%="Saved Reinstatement reason"%>' />
						<html:hidden property="answer(parentPolicyStatus)" value='<%=""+parentPolicyStatus%>' />	
				<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::ActivityType)" value='<%="reinstate"%>' />
				<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			
				</table>
			</html:form>
		</div>
	</div>
	<%-- Endorsement Detail END --%>
	</td></tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<script type="text/javascript">
dolphintabs.init('dolphinnav', 0)
showDesc();
function showDesc(){
	
	if(document.forms[1].Reinstate_Reason.value=='Underwriting Reasons'){
		document.getElementById('Other_Desc_Container').style.display ='table-row';
	}else {
		document.forms[1].EndorsementDescription.value='';
		document.getElementById('Other_Desc_Container').style.display ='none';
	}
}

function validateReason(){
	
	if(document.forms[1].Reinstate_Reason.value==""){
		alert("Please Select the Reinstate Reason ");
		return false;
	}
	if(document.forms[1].Reinstate_Reason.value=='Underwriting Reasons' && document.forms[1].EndorsementDescription.value==''){
		alert("Please Enter the description for Underwriting Reasons");
		return false;
	}
	return true;
}
</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>