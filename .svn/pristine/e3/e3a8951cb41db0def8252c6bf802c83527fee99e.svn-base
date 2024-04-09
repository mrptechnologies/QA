<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>

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

<table width="100%" style="border-collapse: collapse;">
	<tr>
	<td>

	
		
		<table border="0" cellpadding="0" cellspacing="0" width="30%"  align="left">
		<tr>   
          <td align="left" valign=bottom width="20%">
    		 <table border="0" width="125" cellspacing="0" cellpadding="0" id="EndorsementMiscDetail_Row" class="todotab_active" height=35>
    		 	<tr><td align="center" onClick="LoadMiscEndorsementDetailTab('EndorsementMiscDetail_Row');"  Style="Cursor:hand">Premium Effect</td></tr>				
		 </table>
         </td>
          <td align="left" valign=bottom>
    		 <table border="0" width="125" cellspacing="0" cellpadding="0" id="EndorsementMiscDesc_Row" class="todotab_inactive" height=35>
    		 	<tr><td align="center" onClick="LoadMiscEndorsementDescriptionTab('EndorsementMiscDesc_Row');"  Style="Cursor:hand">Endorsement Description</td></tr>				
		 </table>
         </td>
         </tr>
         </table>
         </td>
		</tr>
		
		<tr>
		<td>
		<div style="display:block;border:1px #f0aa39 solid;" id="Premium Effect" >
			<html:form action="/SaveEndorsementDetailAction.go" >

				<table  width="100%">
				
				<logic:present name="QUOTE_POLICY_HISTORY" scope="request">
				<bean:define id="quotePolicyHistoryDetail" name="QUOTE_POLICY_HISTORY" type="com.dms.ejb.insurance.quote.common.quotepolicyhistory.QuotePolicyHistoryDetail" scope="request"/>		
				<tr>
					<td class="sectionhead" align="left">Premium & Taxes</td>
					<td class="sectionhead" align="right">Prior</td>
					<td class="sectionhead" align="right">New</td>
					<td class="sectionhead" align="right">Difference</td>
					<td class="sectionhead" align="right">Prorata Difference</td>
				</tr>
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">Prorata Factor</td>
					<td colspan="4" class="Numeric">
					<bean:write name="EndorsementDetail" property="answer(Object::PlanFactor::ProrataFactor)"/></td>
				</tr>
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">Policy Premium</td>
					<td class="Numeric">
						<bean:define id="uwTotalPremium" name="quotePolicyHistoryDetail" property="uwTotalPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+uwTotalPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="TotalPremium" name="EndorsementDetail" property="answer(Object::Quote::UWAdjTotalPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalPremium%>"/>
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
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">UW Adj Total Premium</td>
					<td class="Numeric">
						<bean:define id="totalBasePremiumPrior" name="quotePolicyHistoryDetail" property="totalPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumPrior%>"/>					
					 </td>
					<td class="Numeric">
						<bean:define id="totalBasePremiumNew" name="EndorsementDetail" property="answer(Object::Plan::TotalPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumNew%>"/>					
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
		</td>
		</tr>
		
		<tr>
		<td>
			
		<div style="display:none;border:1px #f0aa39 solid;" id="Endorsement Description">

			<html:form action="/SaveEndorsementDetailAction.go" styleId="Application1">
				<table width="100%">
					
					<tr>
						
						<td class="FormLabels" width="30%" valign="middle">Endorsement Title </td>
						<td class="FormLabels2" valign="top">
							<%String endTitle = "MISCELLANEOUS ENDORSEMENT"; %>
							<bean:define id="endorsementTitle" name="EndorsementDetail" property="answer(Object::QuoteAdditional::EndorsementTitle)" />
							<%if(!(""+endorsementTitle).equals("")){endTitle=""+endorsementTitle;} %>
							<html:text name="EndorsementDetail" property="answer(Object::QuoteAdditional::EndorsementTitle)" size="60" maxlength="60" value="<%=""+endTitle %>" styleId="EndorsementTitle" />
						</td>
					</tr>
					<tr>
						<td class="FormLabels" width="30%" valign="middle">Endorsement Content</td>
						<td class="" valign="top">
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
<html:hidden property="answer(openTabAPolicyInfo)" value="openTabEndorsementDetailY"/>
						
   </table>
			</html:form>
		</div>
	</td></tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
