<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>



<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<logic:empty name="parentQuoteId">
	<!-- <bean:define id="parentQuoteId" name="QuoteDetail" property="answer(parentQuoteId)" scope="request"/> -->
	<% parentQuoteId = (String)request.getAttribute("QuoteId"); %>
</logic:empty>
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

<table width="98%" style="border-collapse: collapse;">
	
	
	
	<tr  vAlign="top">
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
		
	<table border="0" cellpadding="0" cellspacing="0" width="30%"  align="left" >
	<tr>	   
          <td align="left" valign=bottom width="20%">
    		 <table border="0" width="125" cellspacing="0" cellpadding="0" id="EndorsementCancelDetail_Row" class="todotab_active" height=35>
    		 	<tr><td align="center" onClick="LoadCancelEndorsementDetailTab('EndorsementCancelDetail_Row');"  Style="Cursor:hand">Premium Effect</td></tr>				
		 </table>
         </td>   
          <td align="left" valign=bottom width="20%">
    		 <table border="0" width="125" cellspacing="0" cellpadding="0" id="EndorsementCancelDesc_Row" class="todotab_inactive" height=35>
    		 	<tr><td align="center" onClick="LoadCancelEndorsementDescriptionTab('EndorsementCancelDesc_Row');"  Style="Cursor:hand">Endorsement Description</td></tr>				
		 </table>
         </td>
         </tr>
        </table>
        </td>
        </tr>
        <tr>
        <td>
		<div style="display:block;border:1px #f0aa39 solid;" align="left" id="Premium Effect">
			<html:form action="/SaveEndorsementDetailAction.go" onsubmit="return maxLengthTextAreaDesc('Reason')">
				<table width="100%">
				<logic:present name="SUBQUOTE_DETAIL_MAP" scope="request">
				<bean:define id="subQuoteDetailMap" name="SUBQUOTE_DETAIL_MAP" type="com.dms.ejb.data.QuestionHashMap" scope="request"/>
				
					<%if(subQuoteDetailMap.getString("Object::Plan::CancelType").equals("")){%>
						<tr><td class="Error"> Please save the Cancel Option </td></tr>
					<%}%>
					
				<tr>
					<td class="sectionhead" width="100%" colspan="2">Amount to be Returned</td>
				</tr>
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">Base Premium</td>
					<td class=Numeric>
						<%--<bean:write name="subQuoteDetailMap" property="Object::Plan::TotalBasePremium"/>--%>
						<bean:define id="currentTermPremium" name="subQuoteDetailMap" property="Object::Quote::CurrentTermPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+currentTermPremium%>"/>							
					</td>
				</tr>
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">Cancellation Type</td>
					<td class="TextMatter" style="text-align: right;">
					<bean:write name="subQuoteDetailMap" property="Object::Plan::CancelType"/></td>
				</tr>
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">Prorata Factor</td>
					<td class="Numeric">
					<bean:write name="subQuoteDetailMap" property="Object::PlanFactor::ProrataFactor"/></td>
				</tr>
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">Prorata Premium</td>
					<td class="Numeric">
						<bean:define id="proratapremium" name="subQuoteDetailMap" property="Object::Quote::CancelProrataPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+proratapremium%>"/>							
					</td>
				</tr>
				
				<tr>
					<td style="font-weight: bold;font-size: 9pt;color: #595a5f;font-family: Arial;text-align: left;">Total Cancellation Premium</td>
					<td class="Numeric">
					<strong>					
						<%--<bean:write name="subQuoteDetailMap" property="Object::Quote::TotalPremium"/>--%>
						<bean:define id="totalpremium" name="subQuoteDetailMap" property="Object::Quote::CancelTotalPremium"/>
						<dmshtml:CurrencyFormatTag format="<%=""+totalpremium%>"/>
					</strong></td>
				</tr>
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
		<div style="display:none;border:1px #f0aa39 solid;" class="todotab_yellowbox2" align="left" id="Reason">

			<html:form action="/SaveEndorsementDetailAction.go" styleId="Application1">
				<table width="100%">
					<tr>
						<td  width="40%" valign="middle">Cancel Reason</td>

						<td  width="40%" valign="middle">
							<dmshtml:get_DropDown_Values dbname='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'  lookupType="Cancel_Reason" nameInSession="dropDownValues" ownerId='<%=""+ownerId %>' />							
								<logic:present name="dropDownValues" scope="request">									
									<bean:define id="dropDownValueList" name="dropDownValues" type="java.util.ArrayList"/>			
										<html:select property="answer(Object::QuoteAdditional::CancelReason)" styleClass='txtbox' onchange="showDesc();" styleId="Cancel_Reason" >
										<html:option value="">Select</html:option>
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
					
					<tr style="display:none" id="Other_Desc_Container">
						<td  width="40%">Reason For Cancellation</td>
						<td  width="40%">
							<html:textarea property="answer(Object::QuoteAdditional::EndorsementDescription)" styleClass="txtarea" cols="40" rows="8" styleId="EndorsementDescription" onkeyup="maxLengthTextAreaDesc('Reason')" />
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
						<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Cancel"%>"/>
						<html:hidden property="answer(Object::Activity::ActivityMsg)" value="<%=" Saved Cancel Endorsement Description "%>"/>
				</table>
			</html:form>
		</div>
	<%-- Endorsement Detail END --%>
	</td>
	</tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>


<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
