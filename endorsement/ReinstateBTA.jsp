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
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<logic:empty name="policyNumber">
	<bean:define id="policyNumber" name="EndorsementDetail" property="answer(policyNumber)" />
</logic:empty>
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />
<bean:define id="parentPolicyStatus" name="EndorsementDetail" property="answer(parentPolicyStatus)" />

<table width="98%" style="border-collapse: collapse;">
	

	<tr>
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
	<table border="0" cellpadding="0" cellspacing="0" width="30%"  align="left" >
		<tr>   
          <td align="left" valign=bottom width="20%">
    		 <table border="0" width="125" cellspacing="0" cellpadding="0" id="EndorsementCancelDetail_Row" class="todotab_active" height=35>
    		 	<tr><td align="center" onClick="LoadCancelEndorsementDetailTab('EndorsementCancelDetail_Row');"  Style="Cursor:hand">Premium Effect</td></tr>				
		 </table>
         </td>   
          <td align="left" valign=bottom >
    		 <table border="0" width="125" cellspacing="0" cellpadding="0" id="EndorsementCancelDesc_Row" class="todotab_inactive" height=35>
    		 	<tr><td align="center" onClick="LoadCancelEndorsementDescriptionTab('EndorsementCancelDesc_Row');"  Style="Cursor:hand">Endorsement Description</td></tr>				
		 </table>
         </td>
         </tr>
         </table>
			</td>
			</tr>
			<tr>
			<td class="todotab_yellowbox">
			<div style="display:block;" id="Premium Effect">&nbsp;&nbsp;
			<html:form action="/SaveEndorsementDetailAction.go" onsubmit="return maxLengthTextAreaDesc('Reason')">
				<table width="100%">
				<logic:present name="QUOTE_POLICY_HISTORY" scope="request">
				<bean:define id="quotePolicyHistoryDetail" name="QUOTE_POLICY_HISTORY" type="com.dms.ejb.insurance.quote.common.quotepolicyhistory.QuotePolicyHistoryDetail" scope="request"/>
				<logic:present name="SUBQUOTE_DETAIL_MAP" scope="request">
				<bean:define id="subQuoteDetailMap" name="SUBQUOTE_DETAIL_MAP" type="com.dms.ejb.data.QuestionHashMap" scope="request"/>
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">&nbsp;</td>
				</tr>  
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">Full Term Policy Premium</td>
					<td class="Numeric">
					<%--<bean:write name="quotePolicyHistoryDetail" property="totalBasePremium"/>--%>
					
					<bean:define id="totalBasePremium" name="subQuoteDetailMap" property="Object::Quote::CurrentTermPremium" />
					<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremium%>"/>	
					</td>
				</tr>
				<bean:define id="cancelType" name="subQuoteDetailMap" property="Object::Quote::CancelType" />
				<%if ((""+cancelType).equalsIgnoreCase("PRORATA")) {%>
					<tr>
						<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">Prorata Factor</td>
						<td class="Numeric">
						
						
						<bean:define id="prorataFactor" name="subQuoteDetailMap" property="Object::Quote::CancelProrataFactor" />
						<%=""+prorataFactor%>
						</td>
					</tr>
					<tr>
						<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">Pro Rata Premium</td>
						<td class="Numeric">
							<%--<bean:write name="subQuoteDetailMap" property="Object::Plan::TotalBasePremium"/>--%>
							<bean:define id="totalBasePremium" name="subQuoteDetailMap" property="Object::Quote::CancelProrataPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremium%>"/>	
						</td>
					</tr>
				<%} %>
				
				
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">&nbsp;</td>
				</tr>
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">&nbsp;</td>
				</tr>  
				
				</logic:present>
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
			
		<div style="display:none;" id="Reason">

			<html:form action="/SaveEndorsementDetailAction.go" styleId="Application1">
				<table  width="100%" align="left" >
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td  width="40%" valign="middle">Reinstate Reason </td>

						<td  width="40%" valign="middle">
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
						<td class="" width="40%" valign="middle">Reason For Reinstatement</td>
						<td width="40%" valign="top">
							<html:textarea property="answer(Object::QuoteAdditional::EndorsementDescription)" styleClass="txtarea" cols="40" rows="8" styleId="EndorsementDescription" onkeyup="maxLengthTextAreaDesc('Reason')"/>
						</td>
					</tr>

					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >
						<tr>
							<td colspan="2" align="center">
								<input name="answer(SubmitType)" value="Save" class="covsmallbutton" style="border:0px;" type="submit">
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
						<html:hidden property="answer(openTabAPolicyInfo)" value="openTabEndorsementDetailY"/>
						<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" />
						<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
						<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Reinstate"%>"/>
						<html:hidden property="answer(Object::Activity::ActivityMsg)" value="<%=" Saved Reinstate Endorsement Description "%>"/>
				</table>
			</html:form>
			</div>			
		</td>
	</tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<script type="text/javascript">dolphintabs.init('dolphinnav', 0)</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
