<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

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
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />

	<%String subQuoteId = "";%>
	<% 
		if(request.getAttribute("subQuoteId") != null ) {
			subQuoteId = ""+request.getAttribute("subQuoteId");
		}
	%>
	
	<%if(subQuoteId.equals("")){%>
		<bean:parameter name="answer(subQuoteId)" id="subQuoteIdTemp" />
		<% subQuoteId = subQuoteIdTemp; %>
	<%}%>
	
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(policyNumber)" />

<table width="100%">
	
	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0" bgcolor="#C6DEEA">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
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
					<jsp:param name="policyVerId" value="<%=""+policyVerId%>" />
					<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
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
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
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
					<a class="" rel="Endorsement Description">
					<span>Endorsement Description</span></a></li>
			</ul>
		</div>

		<div style="display:block;" id="Premium Effect" class="innercontent">&nbsp;&nbsp;
			<html:form action="/SaveEndorsementDetailAction.go" onsubmit="return maxLengthTextAreaDesc('Reason')">
				<table class="FormLabelsApplication" align="center" cellpadding="2" cellspacing="1" width="95%" class="boxed" style="{border-width:1px; border-style:solid;  border-color: #999999; border-collapse:saparate;}">
				<logic:present name="QUOTE_POLICY_HISTORY" scope="request">
				<bean:define id="quotePolicyHistoryDetail" name="QUOTE_POLICY_HISTORY" type="com.dms.ejb.insurance.quote.common.quotepolicyhistory.QuotePolicyHistoryDetail" scope="request"/>
				<tr>
					<td class="sectionhead" width="25%">Premium & Taxes</td>
					<td class="sectionhead" width="19%" align="right">Prior</td>
					<td class="sectionhead" width="19%" align="right">New</td>
					<td class="sectionhead" width="19%" align="right">Difference</td>
					<td class="sectionhead" width="19%" align="right">Prorata Difference</td>
				</tr>
				<tr>
					<td class="FormLabels">Prorata Factor</td>
					<td colspan="4" class="Numeric">
					<bean:write name="EndorsementDetail" property="answer(Object::PlanFactor::ProrataFactor)"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Policy Premium</td>
					<td class="Numeric"><%--<bean:write name="quotePolicyHistoryDetail" property="totalBasePremium"/>--%>
						<bean:define id="totalBasePremiumPrior" name="quotePolicyHistoryDetail" property="totalBasePremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumPrior%>"/>					
					 </td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::Plan::TotalBasePremium)"/>--%>
						<bean:define id="totalBasePremiumNew" name="EndorsementDetail" property="answer(Object::Plan::TotalBasePremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumNew%>"/>					
					</td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalBasePremiumDiference)"/>--%>
						<bean:define id="totalBasePremiumDiff" name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalBasePremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumDiff%>"/>	
					</td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalBasePremiumDiference)"/>--%>
						<bean:define id="ProrataTotalBasePremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalBasePremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTotalBasePremiumDiference%>"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels">Tax</td>
					<td class="Numeric"><%--<bean:write name="quotePolicyHistoryDetail" property="totalTax"/>--%>
						<bean:define id="totalTax" name="quotePolicyHistoryDetail" property="totalTax" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalTax%>"/>
					 </td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::Quote::TotalTax)"/>--%>
						<bean:define id="TotalTax" name="EndorsementDetail" property="answer(Object::Quote::TotalTax)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalTax%>"/>
					</td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalTaxDiference)"/>--%>
						<bean:define id="TotalTaxDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalTaxDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalTaxDiference%>"/>					
					</td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalTaxDiference)"/>--%>
						<bean:define id="ProrataTotalTaxDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalTaxDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTotalTaxDiference%>"/>		
					</td>
				</tr>
				<tr>
					<td class="FormLabels">Fees</td>
					<td class="Numeric"><%--<bean:write name="quotePolicyHistoryDetail" property="totalFee"/>--%> 
						<bean:define id="totalFee" name="quotePolicyHistoryDetail" property="totalFee" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalFee%>"/>
					</td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::Quote::TotalFees)"/>--%>
						<bean:define id="TotalFees" name="EndorsementDetail" property="answer(Object::Quote::TotalFees)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalFees%>"/>	
					</td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalFeeDiference)"/>--%>
						<bean:define id="TotalFeeDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalFeeDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalFeeDiference%>"/>	
					</td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalFeeDiference)"/>--%>
						<bean:define id="ProrataTotalFeeDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalFeeDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTotalFeeDiference%>"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels">Total</td>
					<td class="Numeric"><%--<bean:write name="quotePolicyHistoryDetail" property="totalPremium"/>--%> 
						<bean:define id="totalPremium" name="quotePolicyHistoryDetail" property="totalPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalPremium%>"/>
					</td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::Quote::TotalPremium)"/>--%>
						<bean:define id="TotalPremium" name="EndorsementDetail" property="answer(Object::Quote::TotalPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalPremium%>"/>
					</td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalPremiumDiference)"/>--%>
						<bean:define id="TotalPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalPremiumDiference%>"/>
					</td>
					<td class="Numeric"><%--<bean:write name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalPremiumDiference)"/>--%>
						<bean:define id="ProrataTotalPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTotalPremiumDiference%>"/>
					</td>
				</tr>
				</logic:present>
				</table>

				<input name="answer(Page::Action)" value="SELECT" type="hidden"/>
				<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
				
				<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
				<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
				<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
				<html:hidden property="answer(subQuoteId)" value="<%=subQuoteId.toString()%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</html:form>	
		</div>
			
		<div style="display:none;" id="Endorsement Description" class="innercontent">

			<html:form action="/SaveEndorsementDetailAction.go" styleId="Application1">
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2" >
					<tr>
						<td class="FormLabels" width="40%" valign="middle">Endorsement Description </td>
						<td class="FormLabels" width="40%" valign="top">
							<html:textarea name="EndorsementDetail" property="answer(Object::QuoteAdditional::EndorsementDescription)" styleClass="txtarea" cols="40" rows="8" styleId="EndorsementDescription" onkeyup="maxLengthTextAreaDesc('Endorsement Description')"/>
						</td>
					</tr>

					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >
						<tr>
							<td colspan="2" align="center">
								<input name="answer(SubmitType)" value="Save" class="sbttn" type="submit">
							</td>
						</tr>
					</dmshtml:dms_isPresent>

						<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
						<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />						
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
						<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
						<html:hidden property="answer(subQuoteId)" value="<%=subQuoteId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />	
						<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
						<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>					
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
				</table>
			</html:form>
		</div>
	</div>
	<%-- Endorsement Detail END --%>
	</td></tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<script type="text/javascript">dolphintabs.init('dolphinnav', 0)</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
