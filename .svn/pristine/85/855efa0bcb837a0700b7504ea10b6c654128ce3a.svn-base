<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@page import="com.dms.ejb.common.DMSDetail"%>
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
<bean:parameter name="answer(Object::Product::ProductId)" id="productId"/>
<bean:parameter name="answer(Object::Product::ProductVerId)" id="productVerId"/>
<bean:parameter name="answer(Object::Product::RiskState)" id="riskState"/>
<bean:parameter name="answer(Object::Quote::QuoteType)" id="quoteType"/>
<bean:parameter name="answer(Object::Customer::CustomerId)" id="customerId"/>
<bean:parameter name="answer(Object::Quote::ParentPolicyId)" id="parentPolicyId"/>
<bean:parameter name="answer(Object::Quote::ParentPolicyVerId)" id="parentPolicyVerId"/>
<bean:parameter name="answer(policyNumber)" id="policyNumber" />
<bean:parameter name="policyEffDate" id="policyEffDate"/>
<bean:parameter name="policyExpDate" id="policyExpDate"/>
<bean:parameter name="answer(Object::Quote::QuoteStartDate)" id="startDate"/>
<bean:parameter name="answer(parentPolicyStatus)" id="parentPolicyStatus"/>
<bean:parameter name="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" id="riskId"/>
<bean:parameter name="answer(Object::Risk::Teritory)" id="ratingTerritory"/>
<bean:parameter name="answer(Object::Agency::AgencyId)" id="agencyId"/>
<bean:define property="answer(renewalEffectiveDate)" id="policyNumberz" name="QuoteDetail" />
<bean:define property="answer(originaldate)" id="policyNumbery" name="QuoteDetail" />
<bean:define id="paymentPlan" name="QuoteDetail" property="answer(Object::Quote::PaymentPlan)"  />
<bean:define id="QuoteEffectiveDate" name ="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)"/>
<%String effDate=""+policyEffDate; %>
<% String exprDate = ""+policyExpDate; %>
<% String quotestartdate =""+startDate; %>
<bean:define property="answer(renewalPolicyId)" id="renewalPolicyId" name="QuoteDetail" />
<bean:define property="answer(renewalPolicyVerId)" id="renewalPolicyVerId" name="QuoteDetail" />

<bean:define id="PrimaryOrRenewalQuoteId" name ="QuoteDetail" property="answer(PrimaryOrRenewalQuoteId)"/>

<bean:define id="TransactionDate11" property="answer(Object::Policy::TransactionDate)" name="QuoteDetail"/>
<bean:define id="PremiumDueDate11" property="answer(Object::Policy::PremiumDueDate)" name="QuoteDetail"/>


	<%String documentType ="ISSUANCE";
	  String parentQuoteId="0";	
	  String parentQuoteVerId ="0";
	%>

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">

	<tr><td height="10"></td></tr>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">										
	<tr>
		<td bgcolor="#C6DEEA">
						<div id="QuoteInsuerdAgencyAgentHeader">
							<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
							<jsp:param name="parentQuoteId" value="<%=""+PrimaryOrRenewalQuoteId%>" />
							<jsp:param name="paretQuoteStatus" value="<%=""+parentPolicyStatus%>" />
							</jsp:include>
						</div>
		</td>
	</tr>
	</dmshtml:dms_static_with_connector>
	<tr>
		<td width="25%" class="links"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>" title="Click to go to Master Insured Record" class="button2" style="width:200px" />Go to Insured Master Record</a> </td>
	</tr>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>		
		<td width="100%">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">										
				<tr>
					<td>		
						<jsp:include page="../common/DynamicPolicyHeader.jsp">
							<jsp:param name="policyId" value="<%=parentPolicyId.toString()%>" />
							<jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
							<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
							<jsp:param name="renewalPolicyId" value="<%=""+renewalPolicyId%>" />
							<jsp:param name="renewalPolicyVerId" value="<%=""+renewalPolicyVerId%>" />
							<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
						</jsp:include>
				 </td>
			  	</tr>
			  	</dmshtml:dms_static_with_connector>
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



<html:form action="/UpdateNonBTAEndorsement.do" onsubmit="javascript:return validateNonBTAEndorsementDetails(this)">



<logic:present name="productEndorsementList" scope="request">
	<bean:define id="arrProductName" name="productEndorsementList" type="java.util.ArrayList"/>
	<%for(int i=0;i<arrProductName.size();i++) {
								com.dms.ejb.data.QuestionHashMap productNameMap=(com.dms.ejb.data.QuestionHashMap)arrProductName.get(i);
								
								%>
								<html:hidden value ='<%=productNameMap.getString("Object::ProductVer::ProductVerId")%>' property="answer(Object::ProductVer::ProductVerId)" />
								<html:hidden value ='<%=productNameMap.getString("Object::ProductVer::ProductVerId")%>' property="answer(Object::Product::ProductVerId)" />
								<html:hidden value ='<%=productNameMap.getString("Object::Product::ProductId")%>' property="answer(Object::Product::ProductId)" />
								<html:hidden value ='<%=productNameMap.getString("Object::Product::ProductId")%>' property="answer(Object::Product::ProductId)" />
								<html:hidden property="answer(Object::Quote::ProductId)"  value ='<%=productNameMap.getString("Object::Product::ProductId")%>'/>
								<html:hidden value ='<%=productNameMap.getString("Object::ProductVer::ProductVerId")%>' property="answer(Object::Quote::ProductVerId)" />
								
		<%} %>
</logic:present>

  <table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="4" class="todotab_yellowbox2">
    	       <td colspan="2">&nbsp;</td> 
    	     <tr>			
							<td width="40%" class="FormLabels" align="left" height="25">Salesforce Child Submission Number:</td>
							<td class="links"><html:text property="answer(Object::Policy::SalesforceChildSubmissionNumber)" styleClass="txtbox" size="45" value=""
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
		     						<html:hidden property="answer(Object::Policy::TransactionDate)" styleId="TransactionDateHidden" />
		     					</td>	
			</tr> 
			<tr>			
							<td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Transaction Type:</font></td>
							<td class="links">
							<html:select property="answer(Object::Policy::TransactionType)" styleClass="txtbox" styleId="TransactionType" style="width:290px">
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
		     						<html:hidden property="answer(Object::Policy::Poleffdate)" styleId="Poleffdate" />
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
		     						<html:hidden property="answer(Object::Policy::Polexpdate)" styleId="Polexpdate" />
		     					</td>	
			</tr> 
			 	           	    
	   		<tr>			
							<td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Endorsement Written Premium (including any rider premium):</font></td>
						
							<td class="links"><html:text property="answer(Object::Policy::WrittenPremium)"  styleClass="txtboxrightalign" size="45" 
				            maxlength="25" styleId="WrittenPremium" /></td>
			</tr>   
	        <tr>			
							<td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Commission:</font></td>
							
							<td class="links"><html:text property="answer(Object::Policy::Commission)"  styleClass="txtboxrightalign" size="45" 
				            maxlength="25" styleId="Commission" /></td>
			</tr>
			<tr>			
							<td width="40%" class="FormLabels" align="left" height="25"><font color="red">*&nbsp;Agent/Broker Commission Percent:</font></td>
							
							<td class="links"><html:text property="answer(Object::Policy::AgentCommission)" styleClass="txtboxrightalign" size="45"
				            maxlength="9" styleId="AgentCommission" /></td>
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
		     						<html:hidden property="answer(Object::Policy::PremiumDueDate)" styleId="PremiumDueDateHidden" />
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
				<tr height="20">
					<td valign="top" width="25" colspan="2" align="center"><font style="font-weight:bold">Rider</font></td>
					<td style="padding-left:55px" valign="top" width="75%"><font style="font-weight:bold">Premium</font></td>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="20%">Critical Illness</td>
					<td width="5%" valign="top" align="center"><html:checkbox property="answer(Object::Policy::Rider::CriticalIllness)" styleId="criticalIllness" onclick="showRiderPremium(this.id);" ></html:checkbox></td>
					<td width="75%"><span id="criticalIllnessTD" style="display:none"><html:text property="answer(Object::Policy::Rider::CriticalIllnessPremium)" size="27" styleId="criticalIllnessPremium" maxlength="25" name="QuoteDetail" value="" styleClass="txtboxrightalign"/></span></td>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="20%">War Risk</td>
					<td width="5%" valign="top" align="center"><html:checkbox property="answer(Object::Policy::Rider::WarRisk)" styleId="warRisk" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="75%"><span id="warRiskTD" style="display:none"><html:text property="answer(Object::Policy::Rider::WarRiskPremium)" size="27" styleId="warRiskPremium" maxlength="25" name="QuoteDetail" value="" styleClass="txtboxrightalign"/></span></td>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="20%">AME - Primary</td>
					<td width="5%" valign="top" align="center"><html:checkbox property="answer(Object::Policy::Rider::AMEPrimary)" styleId="AMEPrimary" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="75%"><span id="AMEPrimaryTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMEPrimaryPremium)" size="27" styleId="AMEPrimaryPremium" maxlength="25" name="QuoteDetail" value="" styleClass="txtboxrightalign"/></span></td>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="20%">AME - Excess</td>
					<td width="5%" valign="top" align="center"><html:checkbox property="answer(Object::Policy::Rider::AMEExcess)" styleId="AMEExcess" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="75%"><span id="AMEExcessTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMEExcessPremium)" size="27" styleId="AMEExcessPremium" maxlength="25" name="QuoteDetail" value="" styleClass="txtboxrightalign"/></span></td>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="20%">AME - COB</td>
					<td width="5%" valign="top" align="center"><html:checkbox property="answer(Object::Policy::Rider::AMECOB)" styleId="AMECOB" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="75%"><span id="AMECOBTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMECOBPremium)" size="27" styleId="AMECOBPremium" maxlength="25" name="QuoteDetail" value="" styleClass="txtboxrightalign"/></span></td>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="20%">Aviation</td>
					<td width="5%" valign="top" align="center"><html:checkbox property="answer(Object::Policy::Rider::Aviation)" styleId="aviation" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="75%"><span id="aviationTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AviationPremium)" size="27" styleId="aviationPremium" maxlength="25" name="QuoteDetail" value="" styleClass="txtboxrightalign"/></span></td>
				</tr>
				</table>
							</td>
		    </tr>			
	        <tr>
							<td>&nbsp;
											
								<html:hidden  property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>"/>
								<html:hidden  property="answer(Object::Quote::ParentPolicyId)" value='<%=parentPolicyId%>'/>
								<html:hidden  property="answer(Object::Quote::ParentPolicyVerId)" value='<%=parentPolicyVerId%>'/>
								<html:hidden  property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
								<html:hidden  property="answer(Object::Quote::QuoteType)" value="<%=""+quoteType%>"/>
								<html:hidden  property="answer(Object::Product::UserRole)" value="<%=""+userName%>"/>
							    <html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=""+userName%>" />
							    <html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=""+userName%>" />
								<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
								<html:hidden property="answer(Object::Quote::ProductStatus)" value="RELEASED" />								
					   			<html:hidden  property="answer(Object::Product::RiskState)" value="<%=""+riskState%>"/>
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
								<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" value="<%=""+riskId%>"/>
								<html:hidden property="answer(Object::Risk::Teritory)" value="<%=""+ratingTerritory%>"/>
								<html:hidden property="answer(Option::DefaultValue)" value="<%="No"%>"/>
								<html:hidden property="answer(userId)" value="<%=""+userName%>"/>
								<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId%>"/>
								<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>"/>
								<html:hidden property="answer(Object::Quote::QuoteNumber)" value="1"/>
								
								<!-- For Cancel Endorsement Work Sheet -->
								<html:hidden property="answer(State)" value="<%=""+riskState%>"/>
								<html:hidden property="answer(ownerId)" value="<%=""+ownerId%>"/>
								<html:hidden property="answer(ProductId)" value="<%=""+productId%>"/>
								
								<!-- <html:hidden property="heading" styleId="cancelOption" value=""/> -->
								
								<html:hidden property ="answer(Object::Reference::QuoteStartDate)" styleId="refQuoteStartDate" />
								
								<html:hidden property ="answer(Object::Reference2::QuoteStartDate)"   styleId="refQuoteStartDate2" />
								
								<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
								<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
								<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
								<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
								<html:hidden property="answer(PrimaryOrRenewalQuoteId)" value="<%=PrimaryOrRenewalQuoteId.toString()%>" />
								<html:hidden property="answer(activateTabId)" value="EndorsementTab" />
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