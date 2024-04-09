<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@page import="com.dms.ejb.common.DMSDetail"%>
<%@ page import="java.text.DecimalFormat" %>
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CreateEndorsementQuote.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/PolicySummaryNonBTA.js"></script>
<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css">
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>


<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<!--bean:parameter name="answer(Object::Quote::QuoteStartDate)" id="EffectiveDate"/-->
<bean:define property="answer(productId)" id="productId" name="QuoteDetail"/>
<bean:define property="answer(productVerId)" id="productVerId" name="QuoteDetail"/>
<bean:define property="answer(quoteType)" id="quoteType" name="QuoteDetail"/>
<bean:parameter name="answer(Object::Customer::CustomerId)" id="customerId"/>
<bean:parameter name="answer(Object::Agency::AgencyId)" id="agencyId"/>
<bean:parameter name="answer(policyId)" id="parentPolicyId"/>
<bean:parameter name="answer(policyVerId)" id="parentPolicyVerId"/>
<bean:define property="answer(policyNumber)" id="policyNumber" name="QuoteDetail"/>
<bean:define property="answer(policyEffDate)" id="policyEffDate" name="QuoteDetail"/>
<bean:define property="answer(policyExpDate)" id="policyExpDate" name="QuoteDetail"/>
<bean:define id="TransactionDate11" property="answer(Object::Policy::TransactionDate)" name="QuoteDetail"/>
<bean:define id="PremiumDueDate11" property="answer(Object::Policy::PremiumDueDate)" name="QuoteDetail"/>
<bean:define property="answer(quoteStatus)" id="parentPolicyStatus" name="QuoteDetail"/>
<bean:define id="paymentPlan" name="QuoteDetail" property="answer(Object::Quote::PaymentPlan)" />
<%String effDate=""+policyEffDate; %>
<% String exprDate = ""+policyExpDate; %>


<bean:define id="PrimaryOrRenewalQuoteId" name ="QuoteDetail" property="answer(PrimaryOrRenewalQuoteId)"/>




	<%String documentType ="ISSUANCE";
	  String parentQuoteId="0";	
	  String parentQuoteVerId="0";
	%>

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">

	<tr><td height="10"></td></tr>
	
	<tr>
		<td width="100%">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td width="25%" class="links"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>" title="Click to go to Master Insured Record" class="button2" style="width:200px" />Go to Insured Master Record</a> </td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr><td class="NewSectionHead" colspan="4" align="center">Endorsement Details</td></tr>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true">										
										
											<tr>
												<td>
										
													<jsp:include page="../common/PolicyHeaderCoverMin.jsp">
														<jsp:param name="policyId" value="<%=parentPolicyId.toString()%>" />
														<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
													    <jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
														<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
										                <jsp:param name="parentQuoteVerId" value="<%=""+parentQuoteVerId%>" />
														<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
													</jsp:include>
												 </td>
										  	</tr>
											
										</dmshtml:dms_static_with_connector>				  
			  </table> 	
		</td>
	</tr> 

	<%if(!policyNumber.toString().equals("")) {%>
	
		<td class="links" align="left" width="100px"  title="<bean:message key='ToolTip.SelectEndorsement.PolicySummary'/>">
			<a href="../GetNonBTAPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>">Policy Summary</a>
		</td>
		
	<%} %>	

</table>



<html:form action="/EditNonBTAEndorsermentSummary.do" onsubmit="javascript:return validateNonBTAEndorsementDetails(this)">





  <table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="4" class="todotab_yellowbox2">
    	       <td colspan="2">&nbsp;</td> 
    	     <tr>			
							<td width="40%" class="FormLabels" align="left" height="25">Salesforce Child Submission Number:</td>
							<td class="links"><html:text property="answer(Object::Policy::SalesforceChildSubmissionNumber)" styleClass="txtbox" size="45" name="QuoteDetail"
				            maxlength="40" styleId="SalesforceNumber" /></td>
			</tr>
			<tr>			
							 <td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Transaction Date (date endorsement was issued):</font></td>
								<td class="sectionhead1" align="left" >
			          				<div id="TransactionDate1" ></div>
		           					<jsp:include page="../common/ExtDateField.jsp">
		          						<jsp:param name="inputDateField" value="TransactionDate"/>
		           						<jsp:param name="panelDiv" value="TransactionDate1" />
		           						<jsp:param name="minimumDate" value="" />
		           						<jsp:param name="maximumDate" value="" />
		           						<jsp:param name="allowBlank" value="false"/>           
		       	  						<jsp:param name="setDefaultToday" value="true"/>
		       	   						<jsp:param name="TodayDate" value=""/>
		           					</jsp:include>
		     						</div>
		     						<html:hidden property="answer(Object::Policy::TransactionDate)" styleId="TransactionDateHidden" name="QuoteDetail"/>
		     					</td>	
			</tr> 
			<tr>			
							<td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Transaction Type:</font></td>
							<td class="links">
							<html:select property="answer(Object::Policy::TransactionType)" styleClass="txtbox" styleId="TransactionType" name="QuoteDetail">
								<html:option value="" styleClass="txtbox">Select</html:option>
								<html:option value="Cancellation">Cancellation</html:option>
								<html:option value="Commission Change">Commission Change</html:option>
								<html:option value="Extension">Extension</html:option>		
							    <html:option value="Limits Change">Limits Change</html:option>
								<html:option value="Other Change - Premium Bearing">Other Change - Premium Bearing</html:option>
								<html:option value="Premium Audit">Premium Audit</html:option>
						  </html:select></td>
			</tr> 
			<tr>			
							 <td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Transaction Effective Date:</font></td>
								<td class="sectionhead1" align="left">
			          				<div id="TransactionEffectiveDate1" ></div>
		           					<jsp:include page="../common/ExtDateField.jsp">
		          						<jsp:param name="inputDateField" value="TransactionEffectiveDate"/>
		           						<jsp:param name="panelDiv" value="TransactionEffectiveDate1" />
		           						<jsp:param name="minimumDate" value="" />
		           						<jsp:param name="maximumDate" value="" />
		           						<jsp:param name="allowBlank" value="false"/>           
		       	  						<jsp:param name="setDefaultToday" value="true"/>
		       	   						<jsp:param name="TodayDate" value=""/>
		           					</jsp:include>
		     						</div>
		     						<html:hidden property="answer(Object::Policy::Poleffdate)" styleId="Poleffdate" name="QuoteDetail"/>
		     					</td>	
			</tr> 
			<tr>			
							 <td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Transaction Expiration Date:</font></td>
								<td class="sectionhead1" align="left" >
			          				<div id="TransactionExpirationDate1" ></div>
		           					<jsp:include page="../common/ExtDateField.jsp">
		          						<jsp:param name="inputDateField" value="TransactionExpirationDate"/>
		           						<jsp:param name="panelDiv" value="TransactionExpirationDate1" />
		           						<jsp:param name="minimumDate" value="" />
		           						<jsp:param name="maximumDate" value="" />
		           						<jsp:param name="allowBlank" value="false"/>           
		       	  						<jsp:param name="setDefaultToday" value="true"/>
		       	   						<jsp:param name="TodayDate" value=""/>
		           					</jsp:include>
		     						</div>
		     						<html:hidden property="answer(Object::Policy::Polexpdate)" styleId="Polexpdate" name="QuoteDetail"/>
		     					</td>	
			</tr> 
			 	           	    
	   		<tr>			
							<td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Endorsement Written Premium (including any rider premium):</font></td>
							<%DMSDetail dmsDetail = new DMSDetail(); %>
							<bean:define id="strWrittenPremium" property="answer(Object::Policy::WrittenPremium)" name="QuoteDetail"/>
							<%double writtenPremium = Double.parseDouble(""+strWrittenPremium);
							DecimalFormat formatter = new DecimalFormat("$##,###.00"); 
							String resultPremium ="";
							if(writtenPremium<0.0){								
								resultPremium =formatter.format(writtenPremium);
							}else{
								resultPremium = dmsDetail.currencyFormat(Double.parseDouble(strWrittenPremium.toString())); 
							}
							%>
							<td class="links"><html:text property="answer(Object::Policy::WrittenPremium)"  styleClass="txtboxrightalign" size="45"  value="<%=resultPremium+""%>"
				            maxlength="25" styleId="WrittenPremium" name="QuoteDetail"/></td>
			</tr>   
	        <tr>			
							<td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Commission:</font></td>
							<bean:define id="Commission" property="answer(Object::Policy::Commission)" name="QuoteDetail"/>
							<%String strCommission = dmsDetail.currencyFormat(Double.parseDouble(Commission.toString())); %>
							<td class="links"><html:text property="answer(Object::Policy::Commission)"  styleClass="txtboxrightalign" size="45"  value="<%=strCommission+""%>"
				            maxlength="25" styleId="Commission" name="QuoteDetail"/></td>
			</tr>
			<tr>			
							<td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Agent/Broker Commission Percent:<font color="red">*&nbsp;</td>
							<bean:define id="AgentCommission" property="answer(Object::Policy::AgentCommission)" name="QuoteDetail"/>
							<%DecimalFormat decimalFormat = new DecimalFormat("##,###.00"); %>
							<td class="links"><html:text property="answer(Object::Policy::AgentCommission)" styleClass="txtboxrightalign" size="45" 
				            maxlength="9" styleId="AgentCommission" name="QuoteDetail" value="<%=""+decimalFormat.format(Double.parseDouble(AgentCommission.toString()))+"%" %>" /></td>
			</tr>
			<tr>			
							<td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Premium Due Date:</font></td>
								<td class="sectionhead1" align="left" >
			          				<div id="premiumDueDate1" ></div>
		           					<jsp:include page="../common/ExtDateField.jsp">
		          						<jsp:param name="inputDateField" value="PremiumDueDate"/>
		           						<jsp:param name="panelDiv" value="premiumDueDate1" />
		           						<jsp:param name="minimumDate" value="" />
		           						<jsp:param name="maximumDate" value="" />
		           						<jsp:param name="allowBlank" value="false"/>           
		       	  						<jsp:param name="setDefaultToday" value="true"/>
		       	   						<jsp:param name="TodayDate" value=""/>
		           					</jsp:include>
		     						</div>
		     						<html:hidden property="answer(Object::Policy::PremiumDueDate)" styleId="PremiumDueDateHidden" name="QuoteDetail"/>
		     					</td>	
			</tr> 
			<tr>
							<td class="FormLabels" align="left" height="25"><div id="ridersDiv"><a href="javascript:showRider();" style="color:black;">+Riders</a> </div></td>
							<td>&nbsp;</td>
		    </tr>
			<tr id="riderTR" style="display:none">
							<td class="FormLabels" align="left" height="25">Rider:</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0" align="center" width="100%">
				<bean:define id="criticalRider" property="answer(Object::Policy::Rider::CriticalIllness)" name="QuoteDetail" scope="request"/>
				<bean:define id="warRiskRider" property="answer(Object::Policy::Rider::WarRisk)" name="QuoteDetail" scope="request"/>
				<bean:define id="AMEPrimaryRider" property="answer(Object::Policy::Rider::AMEPrimary)" name="QuoteDetail" scope="request"/>
				<bean:define id="AMEExcessRider" property="answer(Object::Policy::Rider::AMEExcess)" name="QuoteDetail" scope="request"/>
				<bean:define id="AMECOBRider" property="answer(Object::Policy::Rider::AMECOB)" name="QuoteDetail" scope="request"/>
				<bean:define id="aviationRider" property="answer(Object::Policy::Rider::Aviation)" name="QuoteDetail" scope="request"/>
				<tr height="20">
					<td valign="top" width="20%" colspan="2" align="center"><font style="font-weight:bold">Rider</font></td>
					<td style="padding-left:70px" valign="top" width="80%"><font style="font-weight:bold">Premium</font></td>
				</tr>
				
				<tr>
					<td style="padding-left:17px" valign="top" width="20%">Critical Illness</td>
					<%if(criticalRider.equals("Y")){%>
						<bean:define id="criticalPremium" property="answer(Object::Policy::Rider::CriticalIllnessPremium)" name="QuoteDetail"/>
						<%String strCriticalPremium = dmsDetail.currencyFormat(Double.parseDouble(criticalPremium.toString())); %>						
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::CriticalIllness)" id="criticalIllness" onclick="showRiderPremium(this.id);" value="Y" checked/></td>
						<td width="65%"><span id="criticalIllnessTD"><html:text property="answer(Object::Policy::Rider::CriticalIllnessPremium)" size="27" styleId="criticalIllnessPremium" maxlength="25" value="<%=strCriticalPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::CriticalIllness)" id="criticalIllness" onclick="showRiderPremium(this.id);"/></td>																		 
						<td width="65%"><span id="criticalIllnessTD" style="display:none"><html:text property="answer(Object::Policy::Rider::CriticalIllnessPremium)" styleClass="txtboxrightalign" size="27" styleId="criticalIllnessPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>					
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="25%">War Risk</td>
					<%if(warRiskRider.equals("Y")){%>
						<bean:define id="warRiskPremium" property="answer(Object::Policy::Rider::WarRiskPremium)" name="QuoteDetail"/>
						<%String strWarRiskPremium = dmsDetail.currencyFormat(Double.parseDouble(warRiskPremium.toString())); %>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::WarRisk)" id="warRisk" onclick="showRiderPremium(this.id);" value="Y" checked /></td>
						<td width="60%"><span id="warRiskTD"><html:text property="answer(Object::Policy::Rider::WarRiskPremium)" size="27" styleId="warRiskPremium" maxlength="25" value="<%=strWarRiskPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::WarRisk)" id="warRisk" onclick="showRiderPremium(this.id);" /></td>
						<td width="60%"><span id="warRiskTD" style="display:none"><html:text property="answer(Object::Policy::Rider::WarRiskPremium)" size="27" styleId="warRiskPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="25%">AME - Primary</td>
					<%if(AMEPrimaryRider.equals("Y")){%>
						<bean:define id="AMEPrimaryPremium" property="answer(Object::Policy::Rider::AMEPrimaryPremium)" name="QuoteDetail"/>
						<%String strAMEPrimaryPremium = dmsDetail.currencyFormat(Double.parseDouble(AMEPrimaryPremium.toString())); %>					
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMEPrimary)" id="AMEPrimary" onclick="showRiderPremium(this.id);" value="Y" checked /></td>
						<td width="60%"><span id="AMEPrimaryTD"><html:text property="answer(Object::Policy::Rider::AMEPrimaryPremium)" size="27" styleId="AMEPrimaryPremium" maxlength="25" value="<%=strAMEPrimaryPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMEPrimary)" id="AMEPrimary" onclick="showRiderPremium(this.id);" /></td>
						<td width="60%"><span id="AMEPrimaryTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMEPrimaryPremium)" size="27" styleId="AMEPrimaryPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="25%">AME - Excess</td>
					<%if(AMEExcessRider.equals("Y")){%>
						<bean:define id="AMEExcessPremium" property="answer(Object::Policy::Rider::AMEExcessPremium)" name="QuoteDetail"/>
						<%String strAMEExcessPremium = dmsDetail.currencyFormat(Double.parseDouble(AMEExcessPremium.toString())); %>										
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMEExcess)" id="AMEExcess" onclick="showRiderPremium(this.id);" value="Y" checked /></td>
						<td width="60%"><span id="AMEExcessTD"><html:text property="answer(Object::Policy::Rider::AMEExcessPremium)" size="27" styleId="AMEExcessPremium" maxlength="25" value="<%=strAMEExcessPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMEExcess)" id="AMEExcess" onclick="showRiderPremium(this.id);" /></td>
						<td width="60%"><span id="AMEExcessTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMEExcessPremium)" size="27" styleId="AMEExcessPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="25%">AME - COB</td>
					<%if(AMECOBRider.equals("Y")){%>
						<bean:define id="AMECOBPremium" property="answer(Object::Policy::Rider::AMECOBPremium)" name="QuoteDetail"/>
						<%String strAMECOBPremium = dmsDetail.currencyFormat(Double.parseDouble(AMECOBPremium.toString())); %>										
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMECOB)" id="AMECOB" onclick="showRiderPremium(this.id);" value="Y" checked /></td>
						<td width="60%"><span id="AMECOBTD"><html:text property="answer(Object::Policy::Rider::AMECOBPremium)" size="27" styleId="AMECOBPremium" maxlength="25" value="<%=strAMECOBPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMECOB)" id="AMECOB" onclick="showRiderPremium(this.id);" /></td>
						<td width="60%"><span id="AMECOBTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMECOBPremium)" size="27" styleId="AMECOBPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="25%">Aviation</td>
					<%if(aviationRider.equals("Y")){%>
						<bean:define id="aviationPremium" property="answer(Object::Policy::Rider::AviationPremium)" name="QuoteDetail"/>
						<%String strAviationPremium = dmsDetail.currencyFormat(Double.parseDouble(aviationPremium.toString())); %>			
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::Aviation)" id="aviation" onclick="showRiderPremium(this.id);" value="Y" checked /></td>
						<td width="60%"><span id="aviationTD"><html:text property="answer(Object::Policy::Rider::AviationPremium)" size="27" styleId="aviationPremium" maxlength="25" value="<%=strAviationPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::Aviation)" id="aviation" onclick="showRiderPremium(this.id);" /></td>
						<td width="60%"><span id="aviationTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AviationPremium)" size="27" styleId="aviationPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>
				</tr>
				</table>	
			</td>
		    </tr>			
	        <tr>
							<td>&nbsp;
											
								<html:hidden  property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>"/>
								<html:hidden  property="answer(Object::Quote::ParentPolicyId)" value='<%=parentPolicyId%>'/>
								<html:hidden  property="answer(Object::Quote::ParentPolicyVerId)" value='<%=parentPolicyVerId%>'/>
								<html:hidden  property="answer(policyId)" value='<%=parentPolicyId%>'/>
								<html:hidden  property="answer(policyVerId)" value='<%=parentPolicyVerId%>'/>
								<html:hidden  property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
								<html:hidden  property="answer(Object::Policy::PolicyType)" value="<%=""+quoteType%>"/>
								<html:hidden  property="answer(Object::Product::UserRole)" value="<%=""+userName%>"/>
							    <html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=""+userName%>" />
							    <html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=""+userName%>" />
								<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
								<html:hidden property="answer(Object::Quote::ProductStatus)" value="RELEASED" />			
					   			<html:hidden  property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>"/>
					   			<html:hidden  property="answer(customerId)" value="<%=""+customerId%>"/>	   			
								<html:hidden property="answer(Object::Quote::LockStatus)" value="Unlocked"/>
								<html:hidden name="AddQuote" property="answer(Object::Quote::GroupOutOfSync)" value="N"/>
								<html:hidden property="answer(Object::Quote::PaymentPlan)" value='<%=""+paymentPlan%>' />
								<html:hidden property="answer(Object::Quote::CensusOutOfSync)" value="N"/>
								<html:hidden property="answer(Object::Quote::ProductOutOfSync)" value="N"/>				
								<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
								<html:hidden property="answer(Object::Quote::PolicyNumber)" value="<%=""+policyNumber%>"/>
								<html:hidden property="policyEffDate" value='<%=""+policyEffDate%>'/>
								<html:hidden property="policyExpDate" value='<%=""+policyExpDate%>'/>
								<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=""+parentPolicyId%>"/>
				    			<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=""+parentPolicyVerId%>"/>
				    			<html:hidden property="answer(parentPolicyStatus)" value="<%=""+parentPolicyStatus%>" styleId="parentPolicyStatus"/>
								<!-- For C/L Endorsement -->
								<html:hidden property="answer(IsOptionDisabled)" value="<%="N"%>"/>
								<html:hidden property="changePlan" value="<%="yes"%>"/>
								<html:hidden property="answer(Option::DefaultValue)" value="<%="No"%>"/>
								<html:hidden property="answer(userId)" value="<%=""+userName%>"/>
								<html:hidden property="answer(productId)" value="<%=""+productId%>"/>
								<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>"/>
								<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=""+productVerId%>"/>
								<html:hidden property="answer(Object::Quote::QuoteNumber)" value="1"/>
								<html:hidden property="answer(productVerId)" styleId="productVerId" value="<%=""+productVerId%>"/>
								<!-- For Cancel Endorsement Work Sheet -->
								<html:hidden property="answer(ownerId)" value="<%=""+ownerId%>"/>
								<html:hidden property="answer(ProductId)" value="<%=""+productId%>"/>
								<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId%>" />
								<!-- <html:hidden property="heading" styleId="cancelOption" value=""/> -->
								
								<html:hidden property ="answer(Object::Reference::QuoteStartDate)" styleId="refQuoteStartDate" />
								
								<html:hidden property ="answer(Object::Reference2::QuoteStartDate)"   styleId="refQuoteStartDate2" />
								<html:hidden property="answer(activateTabId)" value="EndorsementTab" />
								<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
								<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
								<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
								<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
								<html:hidden property="answer(PrimaryOrRenewalQuoteId)" value="<%=PrimaryOrRenewalQuoteId.toString()%>" />
								
							</td>
		</tr>
		<tr>
		  <td>&nbsp;</td>
	    </tr>
	    <tr>
		  <td align="left"><html:submit value="Save" styleClass="covbutton" property="answer(submit)" style="width:80px" /></td>
	    </tr>
	    <tr>
		  <td>&nbsp;</td>
	    </tr>
	</table>

	  <script type="text/javascript">
   			Ext.onReady(function(){ 
   			document.getElementById('ext-gen28').className="";
   			document.getElementById('ext-gen21').className="";
   			document.getElementById('ext-gen14').className="";  
   			document.getElementById('ext-gen6').className="";  
   			document.getElementById('TransactionDate').value = document.forms[0].TransactionDateHidden.value; 
   			var TransactionDate = document.getElementById('TransactionDate').value;
  			var dyear = parseInt(TransactionDate.substring(0, 4), 10);
			var dmonth = parseInt(TransactionDate.substring(5, 7), 10);
			var dday = parseInt(TransactionDate.substring(8, 10), 10);			
			Ext.getCmp('TransactionDate').setValue('<%=""+TransactionDate11%>');
			
   			document.getElementById('PremiumDueDate').value = document.forms[0].PremiumDueDateHidden.value;	
   			var PremiumDueDate = document.getElementById('PremiumDueDate').value;
  			var dyear1 = parseInt(PremiumDueDate.substring(0, 4), 10);
			var dmonth1 = parseInt(PremiumDueDate.substring(5, 7), 10);
			var dday1 = parseInt(PremiumDueDate.substring(8, 10), 10);			
			Ext.getCmp('PremiumDueDate').setValue('<%=""+PremiumDueDate11%>');
					 		
					 		
   			Ext.getCmp('TransactionEffectiveDate').setValue('<%=""+effDate%>');
   			var effDate = '<%=""+effDate%>';
  			var dyear2 = parseInt(effDate.substring(0, 4), 10);
			var dmonth2 = parseInt(effDate.substring(5, 7), 10);
			var dday2 = parseInt(effDate.substring(8, 10), 10);			
			Ext.getCmp('TransactionEffectiveDate').setValue(dmonth2+'/'+dday2+'/'+dyear2);
   			document.forms[0].Poleffdate.value = dmonth2+'/'+dday2+'/'+dyear2;
			
			Ext.getCmp('TransactionExpirationDate').setValue('<%=""+exprDate%>');
			var exprDate = '<%=""+exprDate%>';
  			var dyear3 = parseInt(exprDate.substring(0, 4), 10);
			var dmonth3 = parseInt(exprDate.substring(5, 7), 10);
			var dday3 = parseInt(exprDate.substring(8, 10), 10);			
			Ext.getCmp('TransactionExpirationDate').setValue(dmonth3+'/'+dday3+'/'+dyear3);
   			document.forms[0].Polexpdate.value = dmonth3+'/'+dday3+'/'+dyear3;
   			
  			var blurHandlerEffectiveDate = function() {  
	  			var strDate = document.getElementById('TransactionEffectiveDate').value;  			
	  			var dmonth = parseInt(strDate.substring(0, 2), 10);
				var dday = parseInt(strDate.substring(3, 5), 10);
				var dyear = parseInt(strDate.substring(6, 10), 10);
	
				if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
				{
			    if(document.getElementById('TransactionEffectiveDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
				}else{
					var effDate1 = Ext.getCmp('TransactionEffectiveDate').getValue(); 
					var MM1 = effDate1.getMonth()+1;
					var DD1 = effDate1.getDate();
					var YY1 = effDate1.getFullYear();
					var YY2 = effDate1.getFullYear() + 1;
					if(MM1<10){ MM1 = "0"+(MM1);}
					if(DD1<10){ DD1 = "0"+DD1;}
					Ext.getCmp('TransactionEffectiveDate').setValue(MM1+'/'+DD1+'/'+YY1);
					document.forms[0].Poleffdate.value =MM1+'/'+DD1+'/'+YY1; 					   									
	   			}
   			}; 
   			var blurHandlerExpirationDate = function() {  
  			 
  			var strDate = document.getElementById('TransactionExpirationDate').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{
			    if(document.getElementById('TransactionExpirationDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
			}else{
				var expDate1 = Ext.getCmp('TransactionExpirationDate').getValue(); 
				var MM2 = expDate1.getMonth()+1;
				var DD2 = expDate1.getDate();
				var YY2 = expDate1.getFullYear();
				var effDate1 = document.getElementById('TransactionEffectiveDate').value;
  				var dmonth1 = parseInt(effDate1.substring(0, 2), 10);
				var dday1 = parseInt(effDate1.substring(3, 5), 10);
				var dyear1 = parseInt(effDate1.substring(6, 10), 10);
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
				Ext.getCmp('TransactionExpirationDate').setValue(MM2+'/'+DD2+'/'+YY2);
   				document.forms[0].Polexpdate.value =MM2+'/'+DD2+'/'+YY2;
   				
				if(YY2 < dyear1){
					alert("Please enter the valid Expiration date");									
				}
				if((MM2 < dmonth1) && (YY2==dyear1)){
					alert("Please enter the valid Expiration date");					
				}
				if((MM2 == dmonth1) && (DD2<=dday1) && (YY2==dyear1)){
					alert("Please enter the valid Expiration date");					
				}
   			}
   			}; 
   			
   			var blurHandlerTransactionDate = function() {  
  			 
  			var strDate = document.getElementById('TransactionDate').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{
			    if(document.getElementById('TransactionDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
			}else{

				var expDate1 = Ext.getCmp('TransactionDate').getValue(); 
				var MM2 = expDate1.getMonth()+1;
				var DD2 = expDate1.getDate();
				var YY2 = expDate1.getFullYear();				
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
				Ext.getCmp('TransactionDate').setValue(MM2+'/'+DD2+'/'+YY2);
   				document.forms[0].TransactionDateHidden.value =MM2+'/'+DD2+'/'+YY2;
   				alert(document.forms[0].TransactionDateHidden.value)

				var expDate1 = Ext.getCmp('TransactionDate').getValue(); 
				var MM2 = expDate1.getMonth()+1;
				var DD2 = expDate1.getDate();
				var YY2 = expDate1.getFullYear();				
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
				Ext.getCmp('TransactionDate').setValue(MM2+'/'+DD2+'/'+YY2);
   				document.forms[0].TransactionDateHidden.value =MM2+'/'+DD2+'/'+YY2;
   			}
   			}; 
   			
   			var blurHandlerPremiumDueDate = function() {  
  			 
  			var strDate = document.getElementById('PremiumDueDate').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{
			    if(document.getElementById('PremiumDueDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
			}else{
				var expDate1 = Ext.getCmp('PremiumDueDate').getValue(); 
				var MM2 = expDate1.getMonth()+1;
				var DD2 = expDate1.getDate();
				var YY2 = expDate1.getFullYear();
				var effDate1 = document.getElementById('PremiumDueDate').value;
  				var dmonth1 = parseInt(effDate1.substring(0, 2), 10);
				var dday1 = parseInt(effDate1.substring(3, 5), 10);
				var dyear1 = parseInt(effDate1.substring(6, 10), 10);
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
				Ext.getCmp('PremiumDueDate').setValue(MM2+'/'+DD2+'/'+YY2);
   				document.forms[0].PremiumDueDateHidden.value =MM2+'/'+DD2+'/'+YY2;
   			}
   			}; 
   			
   			Ext.EventManager.on('PremiumDueDate', 'blur', blurHandlerPremiumDueDate); 
   			Ext.EventManager.on('TransactionDate', 'blur', blurHandlerTransactionDate); 
			Ext.EventManager.on('TransactionEffectiveDate', 'blur', blurHandlerEffectiveDate); 
			Ext.EventManager.on('TransactionExpirationDate', 'blur', blurHandlerExpirationDate); 
 			});
 			
 			function showRider(){
			document.getElementById('ridersDiv').innerHTML = "<a href='javascript:hideRider();' style='color:black;'>- Riders</a>";
			document.getElementById('riderTR').style.display="";			
		}
		
		function hideRider(){
			document.getElementById('ridersDiv').innerHTML = "<a href='javascript:showRider();' style='color:black;'>+Riders</a>";
			document.getElementById('riderTR').style.display="none";
		}
	</script>	  
	
</html:form>