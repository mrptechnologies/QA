<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/QuoteSummary.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/EndorsementQuoteSummaryUI3.js"></script>


<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request"/>
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

<table width="98%" >
	
<%-- <tr>
		<td  colspan="2"><jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
		</td>
	</tr> --%>
	<tr>
		<td height="15px" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<%--   <tr>
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
			</tr>--%>	
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
							<jsp:param name="policyId" value="<%=""+parentPolicyId.toString()%>" />
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
						<bean:define id="subQuoteIdTemp" name="aSubQuote" property="quoteId" />
						<% 
							subQuoteVerIdParam = "" + subQuoteVerIdTemp;
							subQuoteIdParam = "" + subQuoteIdTemp;
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
		</td>
	</tr>
	<tr>
		<td class="links">
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
		</td>
		<%-- <td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td> --%>
	</tr>
	</table>
	<table width="98%" align="left" style="border-collapse: collapse;">
	<tr>
			<td height="15px" colspan="2">&nbsp;</td>
	</tr>
	<tr>
	<td align="left" style="padding-bottom: 0px;padding-top: 0px">
	
	<%-- Endorsement Detail START --%>
	<table border="0" cellpadding="0" cellspacing="0" width="30%"  align="left">
		<tr> 
          <td align="left" width="20%">
    		 <table border="0" width="125px" cellspacing="0" cellpadding="0" id="EndorsementCancelDetail_Row" class="todotab_active" height=35>
    		 	<tr><td align="center" onClick="LoadCancelEndorsementDetailTab('EndorsementCancelDetail_Row');"  Style="Cursor:hand">Premium Effect</td></tr>				
		 </table>
         </td>
           
          <td align="left" valign=bottom>
    		 <table border="0" width="125px" cellspacing="0" cellpadding="0" id="EndorsementCancelDesc_Row" class="todotab_inactive" height=35>
    		 	<tr><td align="center" onClick="LoadCancelEndorsementDescriptionTab('EndorsementCancelDesc_Row');"  Style="Cursor:hand">Endorsement Description</td></tr>				
		 </table>
         </td>
         </tr>
         </table>
        </td>
        </tr>
			<tr>
			<td style="padding-bottom: 0px;padding-top: 0px">
			<div style="display:block;"id="Premium Effect">
			<html:form action="/SaveEndorsementDetailAction.go" onsubmit="return maxLengthTextAreaDesc('Reason')">
				<table  cellpadding="0" cellspacing="0" class="todotab_yellowbox" width="100%" >
				<logic:present name="QUOTE_POLICY_HISTORY" scope="request">
				<bean:define id="quotePolicyHistoryDetail" name="QUOTE_POLICY_HISTORY" type="com.dms.ejb.insurance.quote.common.quotepolicyhistory.QuotePolicyHistoryDetail" scope="request"/>
				<logic:present name="SUBQUOTE_DETAIL_MAP" scope="request">
				<bean:define id="subQuoteDetailMap" name="SUBQUOTE_DETAIL_MAP" type="com.dms.ejb.data.QuestionHashMap" scope="request"/>
				<tr>
					<td>&nbsp;</td>
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
						<%--<bean:write name="subQuoteDetailMap" property="Object::PlanFactor::ProrataFactor"/>--%>
						
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
				<!-- <tr>
					<td class="FormLabels">Tax</td>
					<td class="Numeric">
					<%--<bean:write name="subQuoteDetailMap" property="Object::Quote::TotalTax"/>--%>
					<bean:define id="totalTax" name="subQuoteDetailMap" property="Object::Quote::CancelSurplusLinesTax" />
					<dmshtml:CurrencyFormatTag format="<%=""+totalTax%>"/>	
					</td>
				</tr>
				
				<tr>
					<td class="FormLabels">Inspection Fee</td>
					<td class="Numeric">
						<%--<bean:write name="subQuoteDetailMap" property="Object::Plan::InspectionFee"/>--%>
						<bean:define id="inspectionfee" name="subQuoteDetailMap" property="Object::Quote::CancelInspectionFee"/>
						<dmshtml:CurrencyFormatTag format="<%=""+inspectionfee%>"/>	
					</td>
				</tr>
				
				<tr>
					<td class="FormLabels">Policy Fee</td>
					<td class="Numeric">
						<%--<bean:write name="subQuoteDetailMap" property="Object::Plan::DefaultPolicyFee"/>--%>
						<bean:define id="defaultpolicyfee" name="subQuoteDetailMap" property="Object::Quote::CancelPolicyFee"/>
						<dmshtml:CurrencyFormatTag format="<%=""+defaultpolicyfee%>"/>	
					</td>
				</tr>
				
				<tr>
					<td class="FormLabels">Stamp Fee</td>
					<td class="Numeric">
						<%--<bean:write name="subQuoteDetailMap" property="Object::Plan::DefaultPolicyFee"/>--%>
						<bean:define id="stampfee" name="subQuoteDetailMap" property="Object::Quote::CancelStampFee"/>
						<dmshtml:CurrencyFormatTag format="<%=""+stampfee%>"/>	
					</td>
				</tr>
				<%if (!CustomerState.equals("FL")){ %>
				<tr>
					<td class="FormLabels">Filing Fee</td>
					<td class="Numeric">
						<%--<bean:write name="subQuoteDetailMap" property="Object::Plan::DefaultPolicyFee"/>--%>
						<bean:define id="filingfee" name="subQuoteDetailMap" property="Object::Quote::CancelFilingFee"/>
						<dmshtml:CurrencyFormatTag format="<%=""+filingfee%>"/>	
					</td>
				</tr>
				<% } %>
				<%if (CustomerState.equals("FL")){ %>
				<tr>
					<td class="FormLabels">Hurricane Catastrophe Fund</td>
					<td class="Numeric">
						<%--<bean:write name="subQuoteDetailMap" property="Object::Plan::DefaultPolicyFee"/>--%>
						<bean:define id="HurricaneCatastropheFund" name="subQuoteDetailMap" property="Object::Quote::CancelHurricaneCatastropheFund"/>
						<dmshtml:CurrencyFormatTag format="<%=""+HurricaneCatastropheFund%>"/>	
					</td>
				</tr>
				<tr>
					<td class="FormLabels">DCAEMPAResidential</td>
					<td class="Numeric">
						<%--<bean:write name="subQuoteDetailMap" property="Object::Plan::DefaultPolicyFee"/>--%>
						<bean:define id="DCAEMPAResidential" name="subQuoteDetailMap" property="Object::Quote::CancelDCAEMPAResidential"/>
						<dmshtml:CurrencyFormatTag format="<%=""+DCAEMPAResidential%>"/>	
					</td>
				</tr>
				<% } %> -->
				
				<tr>
					<td>&nbsp;</td>
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
			
		<div style="display:none;"  id="Reason">

			<html:form action="/SaveEndorsementDetailAction.go" styleId="Application1">
				<table  cellpadding="0" cellspacing="0" class="todotab_yellowbox" width="100%" align="left">
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
						<td class="FormLabels2" width="40%" valign="middle">Reason For Reinstatement</td>
						<td class="FormLabels2" width="40%" valign="top">
							<html:textarea property="answer(Object::QuoteAdditional::EndorsementDescription)" styleClass="txtarea" cols="40" rows="8" styleId="EndorsementDescription" onkeyup="maxLengthTextAreaDesc('Reason')"/>
						</td>
					</tr>

					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >
						<tr>
							<td colspan="2" align="center">
								<input name="answer(SubmitType)" value="Save" class="covsmallbutton" type="submit">
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
						<html:hidden property="answer(Object::Notes::Description)" value="Reactivation Notes"/>
				</table>
			</html:form>
		</div>			
		</td>
	</tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
