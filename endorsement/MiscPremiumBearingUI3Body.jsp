<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/EndorsementQuoteSummaryUI3.js"></SCRIPT>
<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request"/>
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
	<td>
		<jsp:include page="/common/PolicyQuoteHeaderCoverMin.jsp">
			<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+parentQuoteId%>" />
			<jsp:param name="ParentQuoteId" value="<%=""+parentQuoteId%>" />
			<jsp:param name="productVerId" value="<%=""+productVerId%>" />
			<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />	
			<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />	
			<jsp:param name="customerId" value="<%=""+customerId%>" />
		</jsp:include>
	</td>
	</tr>
	<tr>
		<td>	
			<jsp:include page="../common/DynamicPolicyHeaderUI3.jsp">
			<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
			<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
			<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
			<jsp:param name="prodId" value="<%=""+productId%>" />
			<jsp:param name="ProductVerId" value="<%=""+productVerId%>" />								
			<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
			</jsp:include>
		</td>
	</tr>
	<dmshtml:Get_All_Plan_HeaderDetails nameInSession="subQuotes" parentQuoteId='<%=""+parentQuoteId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
	<% 
		String subQuoteVerIdParam = "0";
		String subQuoteIdParam = "0";
	%>
	<logic:present name="subQuotes" scope="request">
		<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"></logic:iterate>
		<bean:define id="subQuoteVerIdTemp" name="aSubQuote" property="quoteVerId" />
		<bean:define id="subQuoteId1" name="aSubQuote" property="quoteId" />
		<% 
			subQuoteVerIdParam = "" + subQuoteVerIdTemp;
			subQuoteIdParam = "" + subQuoteId1;
		%>
	</logic:present>
<tr>
		<td>
			<jsp:include page="/common/EndorsementQuoteInformation.jsp">
				<jsp:param name="ParentQuoteId" value="<%=""+parentQuoteId%>" />
				<jsp:param name="productVerId" value="<%=""+productVerId%>" />
				<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
				<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
				<jsp:param name="customerId" value="<%=""+customerId%>" />
				<jsp:param name="subQuoteVerId" value="<%=""+subQuoteVerIdParam%>" />
				<jsp:param name="subQuoteId" value="<%=""+subQuoteIdParam%>" />
			</jsp:include>
		</td>
	</tr>													
	
</table>
<table width="100%">
	
<%-- <tr>
		<td  colspan="2"><jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
		</td>
	</tr>
	<tr>
		<td height="15px" colspan="2">&nbsp;</td>
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
						<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
					</jsp:include>
				</td>
			</tr>		
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="left">
					<jsp:include page="../common/EndorsementQuoteHeader.jsp">
						<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
					</jsp:include>
				</td>
			</tr>			
			</table>
		</td>
	</tr> --%>


	<tr>
		
			
		
		<td class="links">
			&nbsp;&nbsp;<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
		</td>
		<%-- <td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td> --%>
	</tr>
	</table>
	<table width="98%" align="center" style="border-collapse: collapse;">
	<tr>
			<td height="15px" colspan="2">&nbsp;</td>
	</tr>
	<tr><td align="left" style="padding-bottom: 0px;padding-top: 0px">
		<table border="0" cellpadding="0" cellspacing="0" width="30%" align="left">
		<tr>
         <td align="left" width="20%">
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_active" height=35 id="EndorsementMiscDetail_Row" onclick="javascript:LoadMiscEndorsementDetailTab('EndorsementMiscDetail_Row');">
				<tr>
					<td align="center"  Style="Cursor:hand">Premium Effect</td>
				</tr>
			</table>
         </td>
         <td align="left">
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  id="EndorsementMiscDesc_Row"  onclick="javascript:LoadMiscEndorsementDescriptionTab('EndorsementMiscDesc_Row');">
				<tr>
					<td align="center"  Style="Cursor:hand">Endorsement Description</td>
				</tr>
			</table>
	     </td>
         </tr>
         </table>
         </td>
         </tr>
         <tr ><td style="padding-bottom: 0px;padding-top: 0px">
 		<div style="width:880px;display:block;" id="Premium Effect" >
			<html:form action="/SaveEndorsementDetailAction.go" >
				<table  cellpadding="0" cellspacing="0" class="todotab_yellowbox" width="100%" >
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
					<td class="Numeric">
						<bean:define id="totalBasePremiumPrior" name="quotePolicyHistoryDetail" property="uwTotalPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumPrior%>"/>					
					 </td>
					<td class="Numeric">
						<bean:define id="totalBasePremiumNew" name="EndorsementDetail" property="answer(Object::Quote::UWAdjTotalPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumNew%>"/>					
					</td>
					
					<td class="Numeric">
						<bean:define id="TotalPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::UwAdjTotalPremiumDifference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalPremiumDiference%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="ProrataTotalPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProratedUwAdjTotalPremiumDifference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTotalPremiumDiference%>"/>
					</td>
					
				</tr>
				
				<tr>
					<td class="FormLabels">UW Adj Total Premium</td>
					<td class="Numeric">
						<bean:define id="uwTotalPremium" name="quotePolicyHistoryDetail" property="totalPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+uwTotalPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="TotalPremium" name="EndorsementDetail" property="answer(Object::Plan::TotalPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="totalBasePremiumDiff" name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumDiff%>"/>	
					</td>
					<td class="Numeric">
						<bean:define id="ProrataTotalBasePremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTotalBasePremiumDiference%>"/>
					</td>
				</tr>
				</logic:present>
				</table>
				&nbsp;<br/>
				
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
		<div style="display:none;width: 880px; display: none;" id="Endorsement Description">

			<html:form action="/SaveEndorsementDetailAction.go" styleId="Application1">
				<table  border="0" cellpadding="0" cellspacing="0" align="center" class="todotab_yellowbox" width="100%" >
					
					<tr>
						
						<td class="FormLabels" width="30%" valign="middle">Endorsement Title </td>
						<td class="FormLabels" valign="top">
							<%String endTitle = "MISCELLANEOUS ENDORSEMENT"; %>
							<bean:define id="endorsementTitle" name="EndorsementDetail" property="answer(Object::QuoteAdditional::EndorsementTitle)" />
							<%if(!(""+endorsementTitle).equals("")){endTitle=""+endorsementTitle;} %>
							<html:text name="EndorsementDetail" property="answer(Object::QuoteAdditional::EndorsementTitle)" size="60" maxlength="60" value="<%=""+endTitle %>" styleId="EndorsementTitle" />
						</td>
					</tr>
					<tr>
						<td class="FormLabels" width="30%" valign="middle">Endorsement Content</td>
						<td class="FormLabels" valign="top">
							<html:textarea name="EndorsementDetail" property="answer(Object::QuoteAdditional::EndorsementDescription)" styleClass="txtarea" cols="110" rows="18" styleId="EndorsementDescription"/>
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
						<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Miscellaneous"%>"/>
<html:hidden property="answer(Object::Activity::ActivityMsg)" value="<%=" Saved Miscellaneous PremiumBearing Description "%>"/>

						
   </table>
			</html:form>
		</div>
		</td>
		</tr>
		</table>
	
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
