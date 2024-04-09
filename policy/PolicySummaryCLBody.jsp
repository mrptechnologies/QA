<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/PolicyApplication.js"> </SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/PolicySummaryCL.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/PaymentPlan.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CalculatePolicyInstallmentPay.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/prototype.js"></script>


<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<bean:define id="policyNumber" name="PolicySummary" property="answer(policyNumber)" />

<bean:define id="custId" name="PolicySummary" property="answer(customerId)" />
<bean:define id="parentQuoteId" name="PolicySummary" property="answer(parentQuoteId)" />
<bean:define id="productVerId" name="PolicySummary" property="answer(productVerId)" />
<bean:define id="productId" name="PolicySummary" property="answer(productId)" />

<bean:define id="QuoteStatus" name="PolicySummary" property="answer(quoteStatus)" />
<bean:define id="SubQuoteVerId" name="PolicySummary" property="answer(subQuoteVerId)" />
<bean:define id="QuoteType" name="PolicySummary" property="answer(Object::Quote::QuoteType)" />
<bean:define id="SubQuoteId" name="PolicySummary" property="answer(subQuoteId)" />
<bean:define id="parentQuoteVerId" name="PolicySummary" property="answer(parentQuoteVerId)" />

<bean:define id="policyId" name="PolicySummary" property="answer(policyId)" />
<bean:define id="policyVerId" name="PolicySummary" property="answer(policyVerId)"  />

<bean:define id="prdid" name="PolicySummary" property="answer(Object::Quote::ProductId1)"  />
<bean:define id="paymentPlan" name="PolicySummary" property="answer(Object::Quote::PaymentPlan)"  />


<%String conditionFlag = "N"; %>
<%if(request.getAttribute("conditionFlag") != null){
	conditionFlag = "Y";
}
	
%>

<logic:empty name="PolicySummary" property="answer(policyId)">
	<% policyId = "" + request.getParameter("answer(policyId)"); %>
</logic:empty>

<logic:empty name="PolicySummary" property="answer(policyId)">
	<% policyVerId = "" + request.getParameter("answer(policyVerId)"); %>
</logic:empty>



<bean:define id="agencyId" name="PolicySummary" property="answer(Object::Agency::AgencyId)"  />

<bean:define id="applicationType" name="PolicySummary" property="answer(applicationType)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />


<!-- <table width="100%"> -->
<% String DocumentType = "ISSUANCE"; %>
<% String policyStatus = ""; %>
<% String ratingTerritory = "0"; %>
<% String ratingTerritoryName = ""; %>

<table WIDTH="1100px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr height="10">
		<td>
		</td>
	</tr>
	<tr>
		<td width="1200px" bgcolor="#C6DEEA">
			<jsp:include page="../common/CustomerAgencyLinkspage.jsp">
				<jsp:param name="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
			</jsp:include>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	<tr>
		<td>

			<jsp:include page="../common/DynamicPolicyHeader.jsp">
				<jsp:param name="policyId" value="<%=policyId.toString()%>" />
				<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
				<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
				<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
			</jsp:include>
		 </td>
  	</tr>
</table> 

<%String isActivePolicy =(String) request.getAttribute("isActivePolicy");  
  String bgcolor ="#C6DEEA";
  String headerName ="dolphinnav";
  String bodyDiv = "dolphincontainer1";
  String applicationHeaderName ="dolphinsubnav";
  String policyDetailHeader = "NewSectionHead";
   if (!(isActivePolicy.equals("Y"))){
	   bgcolor ="#CCCCCC";
	   headerName ="priorpolicydolphinnav";
	   bodyDiv = "dolphincontainerActive1";
	   applicationHeaderName ="oldPolicydolphinsubnav";
	   policyDetailHeader ="NewSectionHead1";
   }

%>
	 
	
<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
		<td colspan="20" class="links" width="400px">
		
			<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">Quote Summary</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<dmshtml:isActivePolicy policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
		      <%isActivePolicy =(String) request.getAttribute("isActivePolicy");  %>
	
	
	     <%if(isActivePolicy.equals("N")){ %>
	    	 <% String currentPolicyVerId = (String)request.getAttribute("currentVerId"); %>
	    
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+currentPolicyVerId%>&answer(policyId)=<%=""+policyId%>&answer("conditionFlag") = "N">Active Policy</a>
		<%} %>
		
		</td>	
	</tr>
		<logic:present name="FailureMessage" scope="request">
			<tr>
				<td class="Error">
					Payment Failure Due to Payment Amount Exceeds
				</td>
			</tr>
		</logic:present>
		
		<logic:present name="SuccessMessage" scope="request">
		<tr>
		<td class="Error">
		Payment Successful 
		</td>
		</tr>
		</logic:present>
	<tr>
		<td width="50%">&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="1200px" ALIGN="center" border="0" CELLSPACING="0" >
				<tr>
					<td class="<%=policyDetailHeader%>" colspan="8" align="center">
						POLICY DETAILS						
					</td>
				</tr>	
				<tr height="2" >
						<td></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" width="1200px" bgcolor="<%=bgcolor%>">
			<div id="<%=bodyDiv%>">
				<div id="<%=headerName%>">
					<ul>
						<%int dolphinIndex = 0; %>
						<li>
							<a rel="PolicySummary" onclick="showTabs('<%=headerName%>','<%=dolphinIndex%>');" ><span>Summary</span></a>
						</li>
						<li>
							<% dolphinIndex++; %>
							<a rel="Insured1" onclick="showTabs('<%=headerName%>','<%=dolphinIndex%>');" ><span>Insured</span></a>
						</li>
						<li>
							<% dolphinIndex++; %>
							<a rel="Document" onclick="showTabs('<%=headerName%>','<%=dolphinIndex%>');" > <span>Document</span></a>
						</li>
						<li>
							<% dolphinIndex++; %>
							<a rel="Application" onclick="showTabs('<%=headerName%>','<%=dolphinIndex%>');" ><span>Risk List</span></a>
						</li>
						<li>
							<% dolphinIndex++; %>
							<a rel="Payment" onclick="showTabs('<%=headerName%>','<%=dolphinIndex%>');" ><span>Billing and Payment</span></a>
						</li>				
	
						<li>
							<% dolphinIndex++; %>
							<a rel="PostBoundCheckList" onclick="showTabs('<%=headerName%>','<%=dolphinIndex%>');">
								<span>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>' connector='or' negated="true">
										Post Bound Check List
									</dmshtml:dms_static_with_connector>
								</span>
							</a>
						</li>

						<li>
							<% dolphinIndex++; %>
							<a rel="Reinsurance" onclick="showTabs('<%=headerName%>','<%=dolphinIndex%>');" ><span>Reinsurance</span></a>
						</li>
						<li>
							<% dolphinIndex++; %>
							<a rel="Endorsements" onclick="showTabs('<%=headerName%>','<%=dolphinIndex%>');"><span>Endorsements</span></a>
						</li>	
					</ul>	
				</div>	
				
				 <div id="PolicySummary" class="innercontent">  
					<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	
																		
					<!-- Policy summary tab contents STArt -->	
						<dmshtml:GetDynamicPolicySummary nameInSession="policysummarycontent" policyId="<%=Long.parseLong(""+policyId)%>" policyVerId="<%=Long.parseLong(""+policyVerId)%>" parentQuoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+productId)%>" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="POLICY_SUMMARY_TAB_ALGORITHM"  DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 							
						<logic:present name="policysummarycontent" scope="request">
						 	<bean:define id="htmlPage" name="policysummarycontent"	type="java.lang.StringBuffer" />
						 	<tr>
						 		<td width="100%">
						 			<table width="70%" border="0">	
						 				<tr height="50">
											<td class="sectionhead1" width="56%">
												COVERAGES
											</td>
											<td class="sectionhead1" width="25%" align="left">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LIMIT
											</td>
											<td width="4%">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
											<td class="sectionhead1" width="15%" align="right">
												PREMIUM
											</td>
										</tr>	
										<tr>
											<td width="40%"></td>
											<td width="25%"></td>
											
							    			<td width="25%"></td>
										</tr>			 											
											<%out.println(htmlPage.toString());%>
									</table>
								</td>
							</tr>
						</logic:present>
													
					<!-- Policy summary tab contents end -->	
					</table>
			 	</div> 
				
				<dmshtml:GetPolicyInsured nameInSession="policyinsured" parentPolicyId="<%=Long.parseLong(""+policyId)%>" parentPolicyVerId="<%=Long.parseLong(""+policyVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>			 	
			 	<div id="Insured1" class="innercontent">
			 		<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 			<tr>
			 				<td td width="100%">
			 					<table width="99%" border="0">	
			 						<tr height="30">
			 							<td class="FormLabels" width="3%">			 						
			 								S.No
				 						</td>
				 						<td class="FormLabels" width="12%">
				 							Insured Type
				 						</td>
				 						<td class="FormLabels" width="18%">
				 							Insured Name
				 						</td>
				 						<td class="FormLabels" width="15%">
				 							Address 1
				 						</td>
				 						<td class="FormLabels" width="15%">
				 							Address 2
				 						</td>
				 						<td class="FormLabels" width="13%">
				 							City
				 						</td>
				 						<td class="FormLabels" width="5%">
				 							State
				 						</td>
				 						<td class="FormLabels" width="5%">
				 							Zip
				 						</td>
				 						<td class="FormLabels" width="14%">
				 							Phone Number
				 						</td>			 						
				 					</tr>
				 					<logic:present name="policyinsured" scope="request">			 								 					
			 						<%int indx=1; %>
				 						<logic:iterate id="policyinsured" name="policyinsured">
						 					<tr height="20">
						 						<td class="TextMatter1">
						 							<%=indx++ %>
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Polinsuredtype" />
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::InsuredFullName" />
						 							<!-- bean:write name="policyinsured" property="Object::Policy::Insured::Insuredmname" / -->
						 							<!--  bean:write name="policyinsured" property="Object::Policy::Insured::Insuredfname" / -->
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Address1" />
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Address2" />
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::City" />
						 						</td>
						 						<td class="TextMatter1" align="center">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::State" />
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Zip" />
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Workphoneareacode" />-
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Workphoneexchgcode" />-
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Workphone" />
						 						</td>					 						
						 					</tr>
					 					</logic:iterate>
				 					</logic:present>
			 					</table>
				 			</td>
			 			</tr>
			 		</table>
			 	</div>
			 	
				<dmshtml:GetPolicyApplicationSummary nameInSession="PolicyApplication" policyId="<%=Long.parseLong(""+policyId) %>" policyVerId="<%=Long.parseLong(""+policyVerId) %>" applicationType="<%=""+applicationType %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
			 	
			 	<div id="Application" class="innercontent">
			 	
			 		 	
			 	
			 			 	
			 	
			 	<dmshtml:GetQuoteDetailByQuoteId nameInSession="quoteDetail" quoteId="<%=parentQuoteId.toString()%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 	<bean:define id="productGroupId" name="quoteDetail" property="productGroupId" />
			 	<bean:define id="productGroupVerId" name="quoteDetail" property="productGroupVerId" />			 			 				 	
			 				 	
			 	<dmshtml:GetPolicyRiskList nameInSession="riskList" policyId="<%=Long.parseLong(""+policyId)%>" policyVerId="<%=Long.parseLong(""+policyVerId)%>" policyNumber="<%=""+policyNumber%>" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 		<table WIDTH="1100px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 			<tr>
			 				<td td width="100%">
								<logic:present name="riskList" scope="request">
									<table width="99%" border="0" >	
					 					<tr height="30">
					 						<td class="FormLabels" width="3%" align="center">			 						
					 							No.
					 						</td>
					 						<td class="FormLabels" width="8%" align="center">
					 							Risk Number
					 						</td>
					 						<td class="FormLabels" width="18%" align="center">
					 							Risk Name
					 						</td>
					 						<td class="FormLabels" width="14%" align="center">
					 							Risk Type
					 						</td>
					 						<td class="FormLabels" width="10%" align="center">
					 							Policy Number 
					 						</td>
					 						<td class="FormLabels" width="15%" align="center">
					 							Policy Effective Date
					 						</td>
					 						<td class="FormLabels" width="15%" align="center">
					 							Policy Expiration Date
					 						</td>		 						
					 					</tr>
					 					<%int indx=1; %>
										<logic:iterate id="riskListMap" name="riskList">
										
											<tr height="20">
												<td class="TextMatter1" align="center">
													<%=indx++ %>
												</td>									
												<td class="TextMatter1" align="right">
													<bean:write name="riskListMap" property="Object::Plan::RiskNumber" />
												</td>										
												<td class="TextMatter1" align="left">
													<bean:define id="riskId" name="riskListMap" property="Object::Plan::PLResRiskPropertyId" />
													<bean:define id="riskName" name="riskListMap" property="Object::Plan::RiskName" />
													<bean:define id="riskType" name="riskListMap" property="Object::Plan::RiskType"  />		
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href='../DisplyPolicyApplication.do?TabPanelName=Quote_Panel&answer(TabPanelName)=Quote_Panel&answer(showOneTabAtTime)=N&answer(IsSubApplicationCoveredByForm)=Yes&answer(IsApplicationDisabled)=Y&answer(Object::Customer::CustomerId)=<%= custId.toString()%>&answer(ProductId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(CustomerId)=<%= custId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(RiskId)=<%=""+riskId %>&answer(policyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId%>&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&ParentQuoteId=<%=parentQuoteId.toString()%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=SubQuoteId.toString()%>&answer(objectId)=<%=""+productId%>&answer(objectVerId)=<%=""+productVerId%>&answer(prdGroupId)=<%=""+productGroupId%>&answer(prdGroupVerId)=<%=""+productGroupVerId%>&answer(productStatus)=<%=""%>&answer(FamilyId)=<%=""%>&answer(objectName)=<%=riskType%>&answer(applicationType)=POLICY&answer(applicationSubType)=<%="" %>&answer(teritory)=<%=""%>&answer(riskTerritory)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""%>&answer(policyNumber)=<%=""+policyNumber%>'><%=""+riskName%></a>
												</td>
												<td class="TextMatter1">
													<%=""+riskType %>
												</td>
												<td class="TextMatter1" align="right">
													<bean:write name="riskListMap" property="Object::Plan::PolicyNumber" />
												</td>
												<td class="TextMatter1" align="center">
													<bean:write name="riskListMap" property="Object::Plan::PolEffectiveDate" />
												</td>
												<td class="TextMatter1" align="center">
													<bean:write name="riskListMap" property="Object::Plan::PolExpDate" />
												</td>					
											</tr>								
										</logic:iterate>
									</table>
								</logic:present>
							</td>
						</tr>			 		
			 		</table>			
					
	 			</div>
	 			
	 			<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId %>" policyNumber="<%=""+policyNumber%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" documentType='<%=DocumentType%>' />
										
					<% String riskState="";%>
					<% String dmsRiskId = "";%>
					<% String polRiskId = "";%>
					<% String totalPremium ="";%>
					<% String policyEffdate ="";%>
					<% String policyExpdate ="";%>
					<logic:present name="policyHeaderInfo">
						<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plPolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
						<%totalPremium =""+plPolicyDetail.getMTotalPremium();%>
						<%policyEffdate =""+plPolicyDetail.getPolicyEffDate();%>
						<%policyExpdate =""+plPolicyDetail.getPolicyExpDate();%>
						<%if(plPolicyDetail.getPLResPropertyList().size()!=0){
									java.util.ArrayList arrPLResPropertyDetail = plPolicyDetail.getPLResPropertyList();
							%>	
							<% for(int arrIndex=0;arrIndex<arrPLResPropertyDetail.size();arrIndex++){
								com.dms.ejb.insurance.policy.pl.PLResPropertyDetail polResPropertyDetail=(com.dms.ejb.insurance.policy.pl.PLResPropertyDetail)arrPLResPropertyDetail.get(arrIndex);
							%>
							<%riskState = polResPropertyDetail.getStateCode();%>
							<%polRiskId = "" + polResPropertyDetail.getPolRiskResPropertyId();%>							
							<%dmsRiskId = "" + polResPropertyDetail.getDmsRiskResPropertyId();%>
							<%=""+riskState %>
			 		
			 		<%policyStatus =plPolicyDetail.getPolicyStatus();%>	
	 			
	 			
	 			<dmshtml:GetPolicyBillingPaymentInfo nameInSession="PolicyBillingAndPayment" ownerId="<%=Long.parseLong(""+ownerId)%>" policyId="<%=Long.parseLong(""+policyId) %>" policyVerId="<%=Long.parseLong(""+policyVerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> 
	 			<%double totalInstallmentFee = 0; %>
	 			<%double totalInstallmentPayment = 0; %>
	 			<div id="Payment" class="innercontent">			 	
					<div id="dolphinsubcontainer">						
						<div id="<%=applicationHeaderName%>">							
							<ul>
								<li><a rel="PaymentPlan" onclick="showProperty(this.form,'<%=applicationHeaderName%>');"><span>Payment Plan</span></a></li>
								<li><a rel="BillingPDF" onclick="showLossHistory('<%=applicationHeaderName%>');"><span>Bills</span></a></li>
								<li><a rel="PaymentPlanTrans" onclick="showAddlInformation('<%=applicationHeaderName%>');"><span>Payment Transaction</span></a></li>
							</ul>	
						</div>														
						
						<div id="PaymentPlan" class="innersubcontent">
							<html:form action="/UpdatePolicyBillingAction.do" onsubmit="return validateSubmit()"  >
						 	<logic:present name="PolicyBillingAndPayment">
						 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
						 		
						 			<tr height="40">
						 				<td class='FormLabels' width='50%'>Quote Bill Number	&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;
										    <bean:define  id="quoteBillNumber" name="PolicyBillingAndPayment" property="BILL_NUMBER" />
											<%=""+quoteBillNumber%>
										</td>
									</tr>	
									
									<dmshtml:get_Installment_Types	nameInSession="arrInstallmentTypes"	 parentQuoteVerId="<%=""+parentQuoteVerId %>" productVerId="<%=""+637 %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
									<logic:present name="arrInstallmentTypes">
									<%com.dms.ejb.data.QuestionHashMap qMap = null; %>
									<tr>
										<td width="35%" class="FormLabels" align="left">Select Installment Type : 
										
										<select name="answer(Object::PolicyBilling::InstallmentDetail)" id="InstallmentType" class="txtbox"  onchange="return calculate('submit');" >
										<%
										java.util.ArrayList InstallmentType = (java.util.ArrayList)request.getAttribute("arrInstallmentTypes");
										for(int InstallmentTypeIndex = 0 ; InstallmentTypeIndex < InstallmentType.size() ; InstallmentTypeIndex++) {
										qMap = (com.dms.ejb.data.QuestionHashMap) InstallmentType.get(InstallmentTypeIndex);
										%>
										<option value="<%=qMap.getString("Object::QuoteBilling::NumberOfInstallments")+"::"+qMap.getString("Object::QuoteBilling::InitialPaymentPercentage")+"::"+qMap.getString("Object::QuoteBilling::InstallmentFee")+"::"+qMap.getString("Object::QuoteBilling::InstallmentTypeDesc")%>">
												<%=""+qMap.getString("Object::QuoteBilling::InstallmentTypeDesc")%>
										</option>
										<% } %>
										</select>
										</td>
									</tr>
									</logic:present>
									</table>
									
										<!-- ###############################################    Installment Type  #################################################### -->
										
										<dmshtml:get_Installment_Types	nameInSession="arrInstallmentTypes"	 parentQuoteVerId="<%=""+parentQuoteVerId %>" productVerId="<%=""+637 %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										
										<dmshtml:get_Installment_Premiums 	nameInSession="ArrInstallmentPremiumDetail"	 quoteBillNumber='<%=""+quoteBillNumber%>' policyId='<%=""+policyId%>' policyVerId='<%=""+policyVerId%>' dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<div id="InstallmentListPanel">							
										<%int count = 0; 
 										String InstallmentDescKey = "answer(Object::PolicyBilling::InstallmentDesc_" ;
  										String DueDateKey = "answer(Object::PolicyBilling::DueDate_";
  										String InstallmentPremiumKey = "answer(Object::PolicyBilling::InstallmentPremium_";
  										String PaymentStatusKey = "answer(Object::PolicyBilling::PaymentStatus_";
  										String InstallmentFeeKey = "answer(Object::PolicyBilling::InstallmentFee_";
  										String TotalInstallmentPremiumKey = "answer(Object::PolicyBilling::TotalInstallmentPremium_" ;%>
											
										<logic:present name="ArrInstallmentPremiumDetail" scope="request">
												
										<table bgcolor="<%=bgcolor%>">
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td class="FormLabels" align="center" width="3%">SL No</td>
							   			 	<td class="FormLabels" align="center" width="15%">Installment Description</td>
											<td class="FormLabels" align="center" width="15%">Due Date (MM/DD/YYYY)</td>
											<td class="FormLabels" align="center" width="15%">Payment Status </td>
											<td class="FormLabels" align="center" width="15%">Installment
											Premium Amount</td>
											<td class="FormLabels" align="center" width="15%">Installment
											Fee</td>
											<td class="FormLabels" align="center" width="15%">Total
											Installment Amount</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
																				
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="true">							
										
										<logic:iterate id="arrInstallmentPremiumDetail"	name="ArrInstallmentPremiumDetail">
										<% count++; 
										String InstallmentDesc = InstallmentDescKey+count+")";
										String DueDate = DueDateKey+count+")";
										String InstallmentPremium = InstallmentPremiumKey+count+")";
  										String PaymentStatus = PaymentStatusKey+count+")";
										String InstallmentFee = InstallmentFeeKey+count+")";
										String TotalInstallmentPremium = TotalInstallmentPremiumKey+count+")";%>
										<% 		
										String styleClass="TextMatter1";
										
										%>
                              
										<tr>
											<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>
											
											<bean:define id="paymentStatus" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::PaymentStatus" />
											<% boolean readonly=false;
											   String paymentStatus1=""+paymentStatus;
												if(paymentStatus1.equalsIgnoreCase("Paid")){
													readonly =true;
												}else{
													readonly =false;
												}
											%>
											
											
											<td width="15%" align="center"  class=<%= styleClass %>>
											<bean:define id="installmentDesc" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentDesc" />
											<html:text readonly="<%=readonly%>"  property='<%= ""+InstallmentDesc%>' value='<%= ""+installmentDesc%>' styleId="InstallmentDesc" size="15" maxlength="40" styleClass="txtbox" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:define id="dueDate" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::DueDate" />
											<html:text readonly="<%=readonly%>" onblur="return validateFields();"  property='<%=""+DueDate%>'  value='<%=""+dueDate%>' styleId="DueDate" size="15" maxlength="15" styleClass="txtbox" />
											</td>
											
											<td width="15%" align="center" class=<%= styleClass %>>
											<html:text  readonly="true" property='<%=""+PaymentStatus%>'  value='<%=""+paymentStatus%>' styleId="PaymentStatus" size="15" maxlength="15" styleClass="txtbox" />
											</td>
											
											<td width="15%" align="center"  class=<%= styleClass %>>
											<bean:define id="installmentPremium" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentPremium" />
											$<html:text readonly="<%=readonly%>" style="text-align: right" property='<%=""+InstallmentPremium %>' value='<%=""+installmentPremium %>' styleId="InstallmentPremium" size="15" maxlength="15" styleClass="txtbox" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:define id="installmentFee" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentFee" />
											$<html:text readonly="<%=readonly%>" onblur="return validate();"  style="text-align: right"	property='<%=""+InstallmentFee%>' value='<%=""+installmentFee%>'  styleId="InstallmentFee" size="15" maxlength="15" styleClass="txtbox" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:define id="totalInstallmentPremium" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentPremium" />
											$<html:text disabled="true" style="text-align: right" property='<%=""+TotalInstallmentPremium %>' value='<%=""+totalInstallmentPremium %>' styleId="TotalInstallmentPremium" size="15" maxlength="15" styleClass="txtbox" />
											</td>
										</tr>
						   				</logic:iterate>
						   				
						   				</dmshtml:dms_static_with_connector>
						    
						  				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="false">							
											
										<logic:iterate id="arrInstallmentPremiumDetail"	name="ArrInstallmentPremiumDetail">
										<% count++; 
										String InstallmentDesc = InstallmentDescKey+count+")";
										String DueDate = DueDateKey+count+")";
										String InstallmentPremium = InstallmentPremiumKey+count+")";
										String InstallmentFee = InstallmentFeeKey+count+")";
										String TotalInstallmentPremium = TotalInstallmentPremiumKey+count+")";%>
										<% 		
										String styleClass="TextMatter1";
										
										%>
                              
										<tr>
											<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>
									
											<td width="15%" align="center"  class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentDesc" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::DueDate" />
											</td>
											
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::PaymentStatus" />
											</td>
											
											<td width="15%" align="center"  class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentPremium" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentFee" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentPremium" />
											</td>
										</tr>
						   			 </logic:iterate>
						    		</dmshtml:dms_static_with_connector>
		
						  
						    		<tr>
										<td>&nbsp;</td>
									</tr>
						   
						    		<tr>
						    
						   				<td width="3%" align="center" ></td>
						    			<td width="15%" align="center" class="FormLabels"></td>
						    			<td width="15%" align="center" class="FormLabels"></td>
						   				<td width="15%" align="center" class="FormLabels">Total</td>
						   				<td width="15%" align="center" class="TextMatter" >
										<bean:define id="TotalInstallmentPayment" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentPayment" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										$<html:text disabled="true" style="text-align: right" property="Object::PolicyBilling::TotalInstallmentPayment" value='<%=""+TotalInstallmentPayment %>' styleId="TotalInstallmentPayment" size="15" maxlength="15" styleClass="txtbox" />
										<%totalInstallmentPayment=Double.parseDouble(""+TotalInstallmentPayment);%>
										<!-- <dmshtml:CurrencyFormatTag  format="<%=""+TotalInstallmentPayment%>"/> -->
										</td>

										<html:hidden property="answer(Object::Policy::TotalPremium)" styleId="TotalPremium1" value="<%=""+TotalInstallmentPayment%>" />					
										
                            			<td width="15%" align="center" class="TextMatter" >
                            			<bean:define  id="TotalInstallmentFee" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentFee" />
   										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            			$<html:text disabled="true" style="text-align: right" property="Object::PolicyBilling::TotalInstallmentFee" value='<%=""+TotalInstallmentFee %>' styleId="TotalInstallmentFee" size="15" maxlength="15" styleClass="txtbox" />
                            			<%totalInstallmentFee=Double.parseDouble(""+TotalInstallmentFee);%>
                            			<!-- <dmshtml:CurrencyFormatTag  format="<%=""+TotalInstallmentFee%>"/> -->
										</td>
							
							
										<td width="15%" align="center" class="TextMatter" >
										<bean:define  id="TotalInstallmentAmount" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentAmount" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										$<html:text disabled="true" style="text-align: right" property="Object::PolicyBilling::TotalInstallmentAmount" value='<%=""+TotalInstallmentAmount %>' styleId="TotalInstallmentAmount" size="15" maxlength="15" styleClass="txtbox" />
										<!-- <dmshtml:CurrencyFormatTag   format="<%=""+TotalInstallmentAmount%>"/> -->
										</td>
							
									</tr>
							 									
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="true">													  
									
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center" ><html:submit value="Save" styleClass="sbttn"
								    		onmouseover="this.style.color='#FF0D25';"
											onmouseout="this.style.color='#0042B0';" 
											styleId="BillingSubmit" />
										</td>
										<td align="left">	
								   		    <html:reset value="Reset" styleClass="sbttn"
											onmouseover="this.style.color='#FF0D25';"
											onmouseout="this.style.color='#0042B0';" />
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
							 		</table>
							 		</dmshtml:dms_static_with_connector>
							 		<html:hidden property="answer(Object::Quote::InstallmentCount)" styleId="Count" value="<%=""+count%>" />
									</logic:present>
									</div >
									<!-- ###############################################    Installment Type  #################################################### -->
						 	</logic:present>
						 	
						 	<html:hidden property="answer(policyId)" value="<%=""+policyId%>" />
						 	<html:hidden property="answer(policyVerId)" value="<%=""+policyVerId%>" />
						 	<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />
						 	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
							<html:hidden property="answer(productId)" value="<%=""+productId%>" />
							<html:hidden property="answer(productVerId)" value="<%=""+productVerId%>" />
							<html:hidden property="answer(parentQuoteType)" value="<%=""+QuoteType%>" />
							<html:hidden property="answer(UnderWriterWorkSheet)" value="No" />
							<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
							<html:hidden property="answer(OwnerId)" value='<%= ""+ownerId%>' />
							<html:hidden property="answer(ownerId)" value='<%= ""+ownerId%>' />
						 	<html:hidden property="answer(Object::Policy::Poleffdate)" styleId="QuoteEffDate" value='<%=""+policyEffdate%>' />
							<html:hidden property="answer(Object::Policy::Polexpdate)" styleId="QuoteExpDate" value='<%=""+policyExpdate%>' />
							<html:hidden property="answer(Object::Policy::TotalPremiumAmount)" styleId="TotalPremium" value="<%=""+totalPremium%>" />					
							<html:hidden property="answer(Object::Policy::Policyverid)" styleId="PolicyVerId" value="<%=""+policyVerId%>" />
							<html:hidden property="answer(Object::PolicyBilling::CreatedBy)" styleId="CreatedBy" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::UpdatedBy)" styleId="UpdatedBy" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::Createdby)" styleId="Createdby" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyGroup::Updatedby)" styleId="Updatedby" value="<%=""+usernameId%>" />
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						</html:form> 	
					 	</div>	
					 	
					 	<div id="BillingPDF" class="innersubcontent">
						 	<logic:present name="PolicyBillingAndPayment">
						 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
						 		
						 			<tr height="40">
						 				<td class='FormLabels' width='50%'> Invoice
										</td>
										<td class='TextMatter1'>
											Invoice PDF
										</td>
						 			</tr>	
						 		</table>				 				
						 	</logic:present>					 		
					 	</div>	
					 	
					 	<div id="PaymentPlanTrans" class="innersubcontent">
						 	<html:form action="/BillingPaymentTransactionAction.go" onsubmit="return paymentTransactionSubmit()"  >
						 	<logic:present name="PolicyBillingAndPayment">
						 		<table bgcolor="<%=bgcolor%>">
						 			<tr>
										<td>&nbsp;</td>
									</tr>
									<%double totalAmountPaid=0; %>
									<%double balanceAmount=0; %>
									<%String amount=""; %>
									<dmshtml:get_Payment_Transaction_History nameInSession="arrPaymentHistory" policyVerId="<%=""+policyVerId %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
											<logic:present name="arrPaymentHistory">
											<%  
												java.util.ArrayList PaymentType = (java.util.ArrayList)request.getAttribute("arrPaymentHistory");
												for(int paymentTypeIndex = 0 ; paymentTypeIndex < PaymentType.size() ; paymentTypeIndex++) {
												com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) PaymentType.get(paymentTypeIndex);
												amount=qMap.getString("Object::PolicyBilling::PaymentAmount");
												totalAmountPaid=totalAmountPaid+Double.parseDouble(amount);
												} %>
											</logic:present>
									<%double totalAmount=totalInstallmentPayment;
										balanceAmount=totalAmount-totalAmountPaid; 
										
									%>		
									<tr>
										<td class="FormLabels" width="15%" >Policy Premium Amount</td>
										<td class="FormLabels">$<%=""+totalPremium%></td>
									</tr>
									<tr>
										<td class="FormLabels" width="15%" >Installment Fee Amount</td>
										<td class="FormLabels">$<%=""+totalInstallmentFee%></td>
									</tr>
									<tr>
										<td class="FormLabels" width="15%" >Amount Paid</td>
										<td class="FormLabels">$<%=""+totalAmountPaid%></td>
									</tr>
									<tr>
										<td class="FormLabels" width="15%" >Balance Amount</td>
										<td class="FormLabels">$<%=""+balanceAmount%></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
						 			<tr>
										<td class="FormLabels" width="15%" >Payment History</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class="FormLabels" align="center" width="3%">SL No</td>
							   		 	<td class="FormLabels" align="center" width="15%">Payment Method</td>
										<td class="FormLabels" align="center" width="15%">Payment Description</td>
										<td class="FormLabels" align="center" width="15%">Payment Date(MM/DD/YYYY) </td>
										<td class="FormLabels" align="center" width="15%">Amount</td>
										<td class="FormLabels" align="center" width="15%">Paid By</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<!-- ###############################################    Payment History  #################################################### -->

										<dmshtml:get_Payment_Transaction_History nameInSession="arrPaymentHistory" policyVerId="<%=""+policyVerId %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
											<logic:present name="arrPaymentHistory">
																							
												
												<%
												java.util.ArrayList PaymentType = (java.util.ArrayList)request.getAttribute("arrPaymentHistory");
												int paymentTypeIndex1 =0;
												for(int paymentTypeIndex = 0 ; paymentTypeIndex < PaymentType.size() ; paymentTypeIndex++) {
												com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) PaymentType.get(paymentTypeIndex);
												%>
												<%double pay = Double.parseDouble(qMap.getString("Object::PolicyBilling::PaymentAmount"));
												if(pay!=0){%>
												<tr>
												<td class="FormLabels" align="center" width="3%">
												<%=paymentTypeIndex1+1%>
												</td>
												<td class="FormLabels" align="center" width="15%">
												<%=qMap.getString("Object::PolicyBilling::PaymentMethod")%>
												</td>
												<td class="FormLabels" align="center" width="15%">
												<%=qMap.getString("Object::PolicyBilling::PaymentDesc")%>
												</td>
												<td class="FormLabels" align="center" width="15%">
												<%=qMap.getString("Object::PolicyBilling::PaymentDate")%>
												</td>
												<td class="FormLabels" align="center" width="15%">
												$<%=qMap.getString("Object::PolicyBilling::PaymentAmount")%>
												</td>
												<td class="FormLabels" align="center" width="15%">
												<%=qMap.getString("Object::PolicyBilling::PaidBy")%>
												</td>
												</tr>
												<% } %>
												<% } %>
												
											</logic:present>
									<!-- ###############################################    Payment History  #################################################### -->
						 				
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
								</table>
						 		
						 			
						 		<table bgcolor="<%=bgcolor%>">	
						 			<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class="FormLabels">Payment Transaction</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td class="FormLabels" align="center" width="15%">&nbsp;&nbsp;Payment Method</td>
										<td class="FormLabels" align="center" width="15%">Payment Description</td>
										<td class="FormLabels" align="center" width="15%">Payment Date(MM/DD/YYYY) </td>
										<td class="FormLabels" align="center" width="15%">Amount</td>
										<td class="FormLabels" align="center" width="15%">Paid By</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										
						 				<!-- ###############################################    Payment Type  #################################################### -->

										<dmshtml:get_Payment_Types nameInSession="arrPaymentTypes" productVerId="<%=""+637 %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
											<logic:present name="arrPaymentTypes">
																				
												<td class="FormLabels" align="center" width="15%">
												<html:select property="answer(Object::PolicyBilling::PaymentTypeDetail)" styleId="PaymentType" styleClass="txtbox">
												<%
												java.util.ArrayList PaymentType = (java.util.ArrayList)request.getAttribute("arrPaymentTypes");
												for(int paymentTypeIndex = 0 ; paymentTypeIndex < PaymentType.size() ; paymentTypeIndex++) {
												com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) PaymentType.get(paymentTypeIndex);
												%>
												<html:option  value="<%=qMap.getString("Object::QuoteBilling::PrdPaymentTypeId")+"::"+qMap.getString("Object::QuoteBilling::PaymentTypeDesc")%>">
													<%=qMap.getString("Object::QuoteBilling::PaymentTypeDesc")%>
												</html:option>
												<% } %>
												</html:select></td>
											</logic:present>
										<!-- ###############################################    Payment Type  #################################################### -->
						 				
							   		 	<td class="FormLabels" align="center" width="15%">
							   		 		<html:textarea  style="text-align: left" property="answer(Object::PolicyBilling::PaymentDesc)" value="" styleId="paymentDesc"   styleClass="txtarea"  />	
							   		 	</td>
										<td class="FormLabels" align="center" width="15%">
											<html:text  style="text-align: left" property="answer(Object::PolicyBilling::Paymentdate)" value=""  styleId="paymentDate" size="15" maxlength="15" styleClass="txtbox" />	
										</td>
										<td class="FormLabels" align="center" width="15%">
											$<html:text  style="text-align: right" property="answer(Object::PolicyBilling::PaymentAmount)" value="" styleId="paymentAmount"  size="15" maxlength="15" styleClass="txtbox" />	
										 </td>
										<td class="FormLabels" align="center" width="15%">
											<html:text  style="text-align: left" property="answer(Object::PolicyBilling::PaidBy)" value=""  styleId="paidBy" size="15" maxlength="15" styleClass="txtbox" />	
										</td>
									</tr>			 			
						 						
						 			<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td align="center" width="15%" >
										<html:submit property="answer(Object::PolicyBilling::TransactionType)" value="Pay" styleId="BillingSubmit" /> 
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
								</table>
						 	</logic:present>
						 	<html:hidden property="answer(policyId)" value="<%=""+policyId%>" />
						 	<html:hidden property="answer(policyVerId)" value="<%=""+policyVerId%>" />
						 	<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />
						 	<html:hidden property="answer(Object::Policy::TotalPremium)" styleId="TotalPremium" value="<%=""+totalPremium%>" />	
							<html:hidden property="answer(Object::Policy::Policyverid)" styleId="PolicyVerId" value="<%=""+policyVerId%>" />
							<html:hidden property="answer(Object::Policy::PolicyId)" styleId="policyId" value="<%=""+policyId%>" />
							<html:hidden property="answer(Object::PolicyBilling::CreatedBy)" styleId="CreatedBy" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::UpdatedBy)" styleId="UpdatedBy" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::Createdby)" styleId="Createdby" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyGroup::Updatedby)" styleId="Updatedby" value="<%=""+usernameId%>" />
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						 	</html:form>
					 	</div>	
					</div>
				</div>		
												
					
				
			 		
			 		

				<dmshtml:GetPolicyDocumentSummary documentType='<%=DocumentType%>' nameInSession="PolicyDocument" ownerId='<%=""+ownerId %>'  policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>				
	
			 	<div id="Document" class="innercontent">   
			 		<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 		
			 			<tr height="30">
			 				<td class="FormLabels" colspan="3">
			 					Generated Documents<% %>
			 				</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels" width="15%">
			 					S.No
			 				</td>
			 				<td class="FormLabels" width="25%">
			 					Documents
			 				</td>
			 				<td class="FormLabels" width="20%">
			 					Generated By 
			 				</td>
			 				<td class="FormLabels" width="40%">
			 					Generated Date 
			 				</td>
			 			</tr>
			 			<%int indx=0; %>
			 			<%if(!policyStatus.equalsIgnoreCase("ISSUED") && !policyStatus.equalsIgnoreCase("CANCELED")){%>
			 			<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance"}%>' nameInSession="PolDocLoc1" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 			<logic:present name="PolDocLoc1">			 				
			 				<%
			 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc1");
								for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
									com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
								%>			 				
	 			
					 			<%indx++; %>
					 			<tr>
					 				<td class="TextMatter1" width="15%">
					 				<%=indx %>
					 				</td>
					 				<td class="TextMatter1" width="25%">					 				
					 				<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+polDocDetail.getDocumentUrl()%>')">
		   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
					 					<%=""+polDocDetail.getPolicyDocName() %>
					 					</a>
					 				</td>
					 				<td class="TextMatter1" width="20%" >
					 					<%=""+polDocDetail.getCreatedBy() %>
					 				</td>			 				
					 				<td class="TextMatter1" width="40%">
					 					<%=""+polDocDetail.getCreatedDate() %>
					 				</td>
					 			</tr>
					 			
					 			<%						
								}					 			
					 			%>
			 			</logic:present>
			 			
			 			
			 			
			 			<%}else{%>
			 				<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance"}%>' nameInSession="PolDocLoc" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 			<logic:present name="PolDocLoc">			 				
							 				<%
							 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc");
												for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
													com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
												%>			 				
					 			
									 			<%indx++; %>
									 			<tr>
									 				<td class="TextMatter1" width="15%">
									 				<%=indx %>
									 				</td>
									 				<td class="TextMatter1" width="25%">					 				
									 				<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+polDocDetail.getDocumentUrl()%>')">
						   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
									 					<%=""+polDocDetail.getPolicyDocName() %>
									 					</a>
									 				</td>
									 				<td class="TextMatter1" width="20%" >
									 					<%=""+polDocDetail.getCreatedBy() %>
									 				</td>			 				
									 				<td class="TextMatter1" width="40%" colspan="2">
									 					<%=""+polDocDetail.getCreatedDate() %>
									 				</td>
									 			</tr>
									 			
									 			<%						
												}					 			
									 			%>
							 				
							 			</logic:present>				
				 									 						
				 						
			 			<%} %>
			 			<tr height="30">
			 			<td>&nbsp;</td>
			 			</tr>
			 			</table>
			 			<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 					 			
			 			<%if(!policyStatus.equalsIgnoreCase("Issued")) {%>

			 			<dmshtml:dms_isPresent property="<%=new String[]{"BOUND","CANCELED"}%>" value="<%=QuoteStatus.toString()%>" negated="true" >
			 			<tr height="30">
			 				<td class="FormLabels" colspan="3">Selected Policy Forms</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels" width="15%">S.No
			 				</td>
			 				<td class="FormLabels" width="25%">Document Identifier
			 				</td>
			 				<td class="FormLabels" width="60%" >Document Title
			 				</td>
			 			</tr>
			 			<%int index=0; %>
			 			<%int count=0; %>
			 		
			 			<logic:present name="PolicyDocument">
			 			<% java.util.ArrayList PolicyDocumentDet= (java.util.ArrayList)request.getAttribute("PolicyDocument"); %>
			 			<%if(PolicyDocumentDet.size()>0){%>
			 			<logic:iterate id="PolDocument" name="PolicyDocument">		 
			 			<%com.dms.ejb.insurance.policy.PolicyDocumentDetail policyDocDetail = (com.dms.ejb.insurance.policy.PolicyDocumentDetail)PolicyDocumentDet.get(index); %>			 			
			 			<%index++; %>
			 			<%if(policyDocDetail.getGenerateDocument()== null) {%>		
			 				<tr height="20">
					 				<td class="TextMatter1" width="5%">		
					 				<%count++; %>			 				
					 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="15%">
					 				<bean:write name="PolDocument" property="documentNum"/>
					 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="80%">
					 				<bean:write name="PolDocument" property="policyDocName"/>
					 				</td>			 					
					 		</tr>	 						 			
			 			<%} else if(policyDocDetail.getGenerateDocument().equals("Y") || policyDocDetail.getGenerateDocument().equals("")) {%>
				 			<tr height="20">
					 				<td class="TextMatter1" width="5%">
						 				<%count++; %>
						 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="15%">
						 				<bean:write name="PolDocument" property="documentNum"/>
						 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="80%">
						 				<bean:write name="PolDocument" property="policyDocName"/>
					 				</td>			 					
					 		</tr>
					 	<%} %>
			 			</logic:iterate>
			 			<%}%>
			 			</logic:present>
			 		</dmshtml:dms_isPresent> 
			 			
		 			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>' connector='or' negated="true">
		 			
		 			<tr height="20">
		 			<td class="links" colspan="3">
		 				<a href="/PreviewIssuancePdf.go?TabPanelName=Policy_Panel&answer(DocumentListSource)=Policy&answer(policyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId%>&answer(DocumentType)=ISSUANCE&answer(QuoteId)=<%=""+parentQuoteId%>&answer(ownerId)=<%=""+ownerId%>&answer(ProductVerId)=<%=""+productVerId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(customerId)=<%=""+custId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(isPreview)=<%=true%>"  target="_new">Preview Issuance Document </a>		 					
		 			</td>
		 			</tr>
		 			</dmshtml:dms_static_with_connector>
		 			<%} %>
			 		</table>
			 		
			 		
			 	</div>						
			 	
		<div id="PostBoundCheckList" class="innercontent">
			 		<table WIDTH="1100px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 		<tr><td>
			 		<html:form action="/IssanceApplicationVerfication.do" scope="request" onsubmit="return newchecksubmitcount1();">
			 		
			 			 	
			 		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>' connector='or' negated="true">	
			 		<%if(!policyStatus.equalsIgnoreCase("Issued")&& !policyStatus.equalsIgnoreCase("Canceled")){ %>
			 		
			 			<tr>
							<td class="Error">
								<logic:present name="MESSAGE_LIST"> 
				 					<ul>
				 						<logic:iterate id="message" name="MESSAGE_LIST">
						 					<li><bean:write name="message"/></li>
						 				</logic:iterate>
								 	</ul>		 			
					 			</logic:present>
							</td>
						</tr>
						
						 <%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
					     <% java.util.ArrayList policyIssuanceApplicationList = plpolicyDetail.getPolicyIssuanceApplicationList();%>
					     <%  int policyIssuanceApplicationListSize = 0;
					     	try {
						        policyIssuanceApplicationListSize =  policyIssuanceApplicationList.size();
					        } catch(Exception exc){ }
						 %>
						<%
						        String signedValue = "N";
						        String bindingEvidence = "N";
						        String applicatValue = "N";
					    %>
						<%if(policyIssuanceApplicationListSize > 0){ %>
						<% 
							for(int index=(policyIssuanceApplicationListSize-2); index < policyIssuanceApplicationListSize; index++){
								com.dms.ejb.insurance.policy.PolicyIssuanceDetail policyIssuanceDetail = (com.dms.ejb.insurance.policy.PolicyIssuanceDetail)policyIssuanceApplicationList.get(index);
								if(policyIssuanceDetail.getAttributeName().equals("Object::Policy::Issuance::Application::Signed")) {
									signedValue = policyIssuanceDetail.getValue();
								}
								if(policyIssuanceDetail.getAttributeName().equals("Object::Policy::Issuance::Application::Evidence")) {
									bindingEvidence = policyIssuanceDetail.getValue();
								}
								
							}
						%>

						<%}%>       
						<tr height="30">
							<td class="TextMatter1" width="45%">Signed Application Received</td>
							<td width="45%" class="TextMatter1" >
								<%if(signedValue.equals("N")){ %>
									<input type="radio" value="Y" name="answer(Object::Policy::Issuance::Application::Signed)" >Yes
									<input type="radio" value="N" name="answer(Object::Policy::Issuance::Application::Signed)" checked="true">No
								<%} else { %>
									<input type="radio" value="Y" name="answer(Object::Policy::Issuance::Application::Signed)" checked="true">Yes								
									<input type="radio" value="N" name="answer(Object::Policy::Issuance::Application::Signed)" >No
								<%} %>
								<html:hidden property='answer(Object::Policy::Issuance::AttributeId)' value="281"/>
							</td> 
						</tr>
						<tr height="20">
							<td class="TextMatter1">Evidence of Binding</td>     
							<td width="45%" class="TextMatter1" >
								<%if(bindingEvidence.equals("N")){ %>
									<input type="radio" value="Y" name="answer(Object::Policy::Issuance::Application::Evidence)" >Yes
									<input type="radio" value="N" name="answer(Object::Policy::Issuance::Application::Evidence)" checked="true">No
								<%} else { %>
									<input type="radio" value="Y" name="answer(Object::Policy::Issuance::Application::Evidence)" checked="true">Yes
									<input type="radio" value="N" name="answer(Object::Policy::Issuance::Application::Evidence)" >No        
								<%} %>
								<html:hidden property='answer(Object::Policy::Issuance::AttributeId)' value="282"/>        
							</td> 
						</tr>
						<!--

			 			<tr height="30">
				 			<td class="TextMatter1" width="45%">
				 				Signed Application Received
				 			</td>
				 			<td width="45%" class="TextMatter1" >
				 					<html:radio value="Y" property="answer(Object::Policy::Issuance::Application::Signed)" styleId="signedYes">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Policy::Issuance::Application::Signed)" styleId="signedNo">No</html:radio>
				 			</td>	
			 			</tr>
			 			<tr height="20">
			 				<td class="TextMatter1">
			 					Proof of Denial Received
			 				</td>			 	
			 				<td width="45%" class="TextMatter1" >
			 					<html:radio value="Y" property="answer(Object::Policy::Issuance::Application::Proof)" styleId="proofYes">Yes</html:radio>
								<html:radio value="N" property="answer(Object::Policy::Issuance::Application::Proof)" styleId="proofNo">No</html:radio>
			 				</td>	
			 			</tr>
			 			<tr height="20">
			 				<td class="TextMatter1"> 
			 					Application Data Entry completed
			 				</td>
			 				<td width="45%" class="TextMatter1" >
			 					<html:radio value="Y" property="answer(Object::Policy::Issuance::Application::Applicat)" styleId="applicatYes">Yes</html:radio>
								<html:radio value="N" property="answer(Object::Policy::Issuance::Application::Applicat)" styleId="applicatNo">No</html:radio>
			 				</td>			
			 			</tr><tr><td>&nbsp;</td></tr>
			 			-->
			 			
			 			
			 			<%if (isActivePolicy.equals("Y")){ %>
			 			<tr height="40">
			 				<td class="links" colspan="2">
			 					<html:submit property="answer(IssuePolicy)" value="Issue Policy" styleId="IssuePolicySubmit"/>
			 				</td>
			 			</tr>
			 			<%} %>
			 			
			 		<%}else if(policyStatus.equalsIgnoreCase("Issued")||policyStatus.equalsIgnoreCase("Canceled")){%>
			 		
			 		<tr>
			 			<td class="FormLabels" width="35%">
			 				Check List
			 			</td>
			 			<td class="FormLabels" width="10%" >
			 				Status
			 			</td>
			 			<td class="FormLabels" width="25%">
			 				Updated By
			 			</td>
			 			<td class="FormLabels" width="35%">
			 				Updated Date
			 			</td>
			 		</tr>
			 		
			 		
			 		
				 		<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
				 		<% java.util.ArrayList arrPolicyIssuanceApplicationList = plpolicyDetail.getPolicyIssuanceApplicationList();%>
				 		
				 		<%  int policyIssuanceApplicationListSize = 0;
					 		com.dms.ejb.data.QuestionHashMap carrierIssuanceDetailMap = new com.dms.ejb.data.QuestionHashMap();
				 			try {
				 				policyIssuanceApplicationListSize =  arrPolicyIssuanceApplicationList.size();
				 			} catch(Exception exc){ }
				 		%>
				 		<%if(policyIssuanceApplicationListSize > 0){ %>
				 		
					 		<% 
					 			for(int index=0; index < policyIssuanceApplicationListSize; index++){
					 				com.dms.ejb.insurance.policy.PolicyIssuanceDetail policyIssuanceDetail = (com.dms.ejb.insurance.policy.PolicyIssuanceDetail)arrPolicyIssuanceApplicationList.get(index);					 			
					 		%> 
					 			<%if(index==0) { %>
						 			<tr height="30"> 
							 			<td class="TextMatter1" width="35%">Signed Application Received</td>
										<td width="10%" class="TextMatter1" ><%=policyIssuanceDetail.getValue()%></td>
										<td class="TextMatter1" width="25%"><%=policyIssuanceDetail.getCreatedBy()%></td>	
										<td width="35%" class="TextMatter1" ><%=policyIssuanceDetail.getCreatedDate()%></td>
									</tr>
					 			<%} %>
					 			<%if(index==1) { %>
						 			<tr height="30">					 			
							 			<td class="TextMatter1" width="35%">Evidence Of Binding</td>
										<td width="10%" class="TextMatter1" ><%=policyIssuanceDetail.getValue()%></td>
										<td class="TextMatter1" width="25%"><%=policyIssuanceDetail.getCreatedBy()%></td>	
										<td width="35%" class="TextMatter1" ><%=policyIssuanceDetail.getCreatedDate()%></td>					 			
									</tr>
					 			<%} %>
					 			
					 		<%}%>
						<%}%>
			 			
						
						
						
			 		<%} %>
			 		
			</dmshtml:dms_static_with_connector>
			 	
			 		<dmshtml:GetQuoteDetailsByPolicyId nameInSession="QuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 		 <% String renewalQuote =""+request.getAttribute("Object::Renewal::Quote::QuoteId");
			 		 	String renewalSubQuote  = ""+request.getAttribute("Object::Renewal::Quote::SubQuoteId");
			 		 	String isRenewal = ""+request.getAttribute("isRenewal");
			 		 %>
			 		  
			 		<!--  Values for Issue Policy -->
			 		<html:hidden property="answer(DocumentListSource)" value="Policy" />
			 		<html:hidden property="answer(policyId)"  value="<%= ""+policyId%>" />	
			 		
			 		
			 		<html:hidden property="answer(policyVerId)"  value="<%= ""+policyVerId%>" />				 		
			 		<html:hidden property="answer(DocumentType)" value="ISSUANCE" />
			 		
			 		<%if(isRenewal.equals("Y")){ %>
						<html:hidden property="answer(QuoteId)" value="<%=""+renewalQuote%>" /> 	
					<%}else{ %>	 	
						<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 
					<%} %>	
					
			 		<html:hidden property="answer(ownerId)" value='<%=""+ownerId%>' styleId="ownerIdfrmjsp" />
			 		<html:hidden property="answer(ProductVerId)" value="<%= ""+productVerId%>" />
			 		<html:hidden property="answer(Object::Customer::CustomerId)"  value="<%= ""+custId%>" />
			 		<html:hidden property="answer(customerId)" value="<%= ""+custId%>" />	
			 		<html:hidden property="answer(isPreview)" value="false" />
			 		<html:hidden property="answer(Object::Agency::AgencyId)"  value="<%= ""+agencyId%>" />	
			 		<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
			 		<html:hidden property="answer(Object::Policy::ResProperty::Statecode)" value="<%=""+riskState%>"/>
			 		
			 					 		
			 		<!-- Policy Summary -->
			 		
			 		<html:hidden property="answer(polParentQuoteId)" value='<%=""+parentQuoteId %>'/>
			 		<html:hidden property="answer(polProductVerId)" value='<%=""+productVerId%>' />
			 		<html:hidden property="answer(polProductId)" value='<%=""+productId%>' />
			 		<html:hidden property="answer(Object::Quote::QuoteStatus)" value='<%=""+QuoteStatus%>'/>
			 		<html:hidden property="answer(polSubVerQuoteId)" value='<%=""+SubQuoteVerId %>'/>
					<html:hidden property="answer(Object::Quote::QuoteType)" value='<%=""+QuoteType %>'/>
					<html:hidden property="answer(polSubQuoteId)" value='<%=""+SubQuoteId %>'/>
					<html:hidden property="answer(applicationType)" value='<%=""+applicationType %>'/>					
			 		<html:hidden property="answer(Object::UserDetail::userName)" value='<%=""+usernameId%>'/>
			 		
			 		<html:hidden property="answer(Quote::Page)" value="StatusChange" />
			 		<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Issued" />

			 		
<html:hidden property="answer(Object::Policy::TotalPremium)" styleId="TotalPremium" value="<%=""+totalPremium%>" />				 					 		
<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" styleId="CreatedByfrmjsp" />
<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" styleId="UpdatedByfrmjsp"  />
<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden  property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=""+SubQuoteVerId%>" />
<html:hidden property="answer(subquoteVerId)" value="<%=""+SubQuoteVerId%>" />

<%if(isRenewal.equals("Y")){ %>
			<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+renewalQuote %>" />	
			<html:hidden property="answer(subQuoteId)" value="<%=""+renewalSubQuote %>" /> 			
			<html:hidden property="answer(QuoteId)" value="<%=""+renewalQuote %>" /> 
			<html:hidden property ="answer(isRenewalQuoteToIssue)" value ="Y" /> 	
	<%}else{ %>	 	
			<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" />	
			<html:hidden property="answer(subQuoteId)" value="<%=""+SubQuoteId%>" /> 			
			<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 	
	<%} %>

		
			
			
			




<html:hidden property="answer(userId)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
<html:hidden property="answer(productId)" value="<%=""+productId%>" />
<html:hidden property="answer(productVerId)" value="<%=""+productVerId%>" />
<html:hidden property="answer(parentQuoteType)" value="<%=""+QuoteType%>" />
<html:hidden property="answer(UnderWriterWorkSheet)" value="No" />
<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
<html:hidden property="answer(OwnerId)" value='<%= ""+ownerId%>' />
<html:hidden property="answer(ownerId)" value='<%= ""+ownerId%>' />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<%-- %>

<bean:define id="strParentQuoteType" name="parentQuoteDetail" property="quoteType" scope="request"/>

<html:hidden property="answer(Object::Quote::QuoteNumber)" value="<%=subQuoteNum.toString()%>" />
<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=quoteStartDate.toString()%>" />
<html:hidden property="answer(customerNumber)" value="<%=customerNumber.toString()%>" />

<html:hidden property="answer(parentQuoteVerId)" value="<%=strParetQuoteVerId.toString()%>" />

<html:hidden property="answer(Object::Quote::CompositeRate)" value="<%=CompositeRate.toString()%>" />

<html:hidden property="noOfEmployeesInPlan" name="UWWorkSheet" styleId="SIDnoOfEmployeesInPlan" value="<%=""+noOfEmployeesInPlan%>"/>
<html:hidden styleId="LockStatus" property="answer(Object::Quote::LockStatus)" value="<%=""+paretLockStatus%>" />
<html:hidden property="answer(modQuoteNumber)" value="<%=""+modQuoteNumber%>" />
--%>
			 		
			 		
			 		</html:form>

			 		</td></tr>
			 		</table>
			 	</div>	 		
			 	
						<%} 
					}
				%>
				</logic:present>	
			 	<%if(!policyStatus.equalsIgnoreCase("CANCELED")){%>				
					<dmshtml:DisplyApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="<%=""+productId %>"
						objectVerId="<%=""+productVerId %>" objectName="PRODUCT" applicationType="POLICY" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveReinsuranceAction.go" isApplicationEnabled="Y"  showOneTabAtTime="N" />
				<% }else if(policyStatus.equalsIgnoreCase("CANCELED")){%>
					<dmshtml:DisplyApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="<%=""+productId %>"
						objectVerId="<%=""+productVerId %>" objectName="PRODUCT" applicationType="POLICY" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveReinsuranceAction.go" isApplicationEnabled="N"  showOneTabAtTime="N" />
				<%} %>
				<logic:present name="Application" scope="request">
					<bean:define id="htmlPage" name="Application" type="java.lang.StringBuffer" />
						<%out.println(htmlPage.toString());%>
				</logic:present>
				<logic:notPresent name="Application" scope="request">
					<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="No ReInsurance Record." styleClass="txtbox" readonly="true" size="70" maxlength="70" />		
				</logic:notPresent>
			 	
			 	<div id="Endorsements" class="innercontent">
			 		<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	 
			 		<tr height="30">
			 				<td class="FormLabels" colspan="7" color="red">Policy History - Prior Policy Versions
			 					
			 				</td>
			 			</tr>
			 		
			 			<tr height="30">
								
								<td class="FormLabels" width="8%" align="left"> Policy Version
								</td>
								<td class="FormLabels" width="12%" align="left">Policy Number
								</td>										
								<td class="FormLabels" width="25%" align="left"> Endorsement Type
								</td>
								<td class="FormLabels" width="15%" align="left"> Effective Date
								</td>
								
								<td class="FormLabels" width="15%" align="left"> Bound By
								</td>
								<td class="FormLabels" width="21%" align="left"> Date Bound
								</td>
								<td class="FormLabels" width="12%" align="left"> Status
								</td>
							
						</tr>	
						
						
						
						<dmshtml:GetPolicyVersionList nameInSession="PolicyVersionList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							
							<logic:present name="PolicyVersionList">
							<% int polVerNo = 0; %>
							 	<logic:iterate id="PolicyVersionListDetail" name="PolicyVersionList" scope="request" type="com.dms.ejb.insurance.policy.PolicyDetail"> 
							 	    <% polVerNo = polVerNo + 1; %>
							 		<tr height="30">
							 		
							 			<td class="FormLabels" width="4%" align="center">
							 				<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y "> <%= ""+polVerNo %></a>
							 					
							 			</td>
							 			
							 			<td class="FormLabels" width="18%" align="left">
							 			 <%if (Integer.parseInt(PolicyVersionListDetail.getPolicyVerSubNumber())>0){ %>
											<%=""+PolicyVersionListDetail.getPolicyNumber()%><%="-"+PolicyVersionListDetail.getPolicyVerSubNumber()%>
										<%} else { %>
											<%=""+PolicyVersionListDetail.getPolicyNumber()%>
										<%} %> 
										</td>
									
							 			<td class="FormLabels" width="25%" align="left">
							 			
							 			  
							 			  <%String isoriginalPolicy = "Y"; %>
							 			  <dmshtml:GetPolicyVersionEndorsementType nameInSession = "EndorsementType" policyId="<%=""+PolicyVersionListDetail.getPolPolicyId()%>" policyVerId = "<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 			   	 <logic:present name="EndorsementType">
							 			   	  
							 			   	  <logic:iterate id="PolicyVerEndorsementType" name="EndorsementType" scope="request" type="com.dms.ejb.insurance.policy.PolicyDetail"> 
							 			   	  <dmshtml:getProductHeaderDetail nameInSession="EndorsementProductDetail" productId='<%=""+PolicyVerEndorsementType.getProductId()%>' productVerId='<%=""+PolicyVerEndorsementType.getProductVerId()%>' ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<logic:present name="EndorsementProductDetail">
													<%String EndoProductName = ((com.dms.ejb.product.PRDProductDetail)request.getAttribute("EndorsementProductDetail")).getMProductVerName();%>
													<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y ">  <%=""+EndoProductName%></a>
												</logic:present>
							 				
							 				</logic:iterate>
							 			</logic:present>
							 			<logic:empty name="EndorsementType">
							 			   <a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y "> Original Policy </a>
							 			</logic:empty>
							 			
										</td>
											
										<td class="FormLabels" width="12%" align="center">
							 				<bean:write property="policyVerEffDate" name="PolicyVersionListDetail" />
							 				
							 			</td>
							 			
							 			<td class="FormLabels" width="15%" align="left">
							 				<bean:write property="createdBy" name="PolicyVersionListDetail" />
							 			</td>                                                                                                                                                                                    
							 			<td class="FormLabels" width="21%" align="left">
							 				<bean:write property="createdDate" name="PolicyVersionListDetail" />
							 			</td> 
							 			<td class="FormLabels" width="12%" align="left">
							 				<bean:write property="policyStatus" name="PolicyVersionListDetail" />
							 			</td>
							 		</tr>	
							 	</logic:iterate>
							 </logic:present>		
					</table>	
					<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
					<tr><td height="3%">
					&nbsp;
					</td></tr>
					</table>
					
			 					
			 		<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	
			 		     <tr height="30">
			 				<td class="FormLabels" colspan="7">
			 					Endorsement Quotes 
			 					
			 					
			 				</td>
			 			 </tr> 			
			 			<html:form action="/BrowseEndorsement.do" styleId="issueEndo" scope="request">
				 			
				 			<tr height="30">
								<td class="FormLabels" width="4%" align="center"> S.NO 
								</td>											
								<td class="FormLabels" width="10%" align="left"> Quote No
								</td>
								<td class="FormLabels" width="22%" align="left"> Endorsement Type
								</td>
								<td class="FormLabels" width="20%" align="left"> Endorsement PDF
								</td>
								<td class="FormLabels" width="15%" align="left"> Effective Date
								</td>
								<td class="FormLabels" width="15%" align="left"> Last Saved By 
								</td>
								<td class="FormLabels" width="21%" align="left"> Last Saved Date 
								</td>
								<td class="FormLabels" width="12%" align="left"> Status 
								</td>
							</tr>
						
							<dmshtml:GetEndorsementQuoteListById nameInSession="EndorsementQuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" conditionFlag ="<%=conditionFlag%>"  objectType="POLICY" quoteType="ENDORSEMENT" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />



							<logic:present name="EndorsementQuoteList">
							
							<%int slNo = 0; %>
										
								<logic:iterate id="EndorsementQuoteList" name="EndorsementQuoteList" scope="request" >
							
									<tr height="30">										
							
										<% slNo++; %>
										
										<td class="FormLabels" width="4%" align="center"> <%= ""+slNo%> </td>
										<logic:present name="policyHeaderInfo">
										<bean:define id="policyEffDate" name="policyHeaderInfo" property="policyEffDate" />	
									 	 <bean:define id="policyExpDate" name="policyHeaderInfo" property="policyExpDate" />	
							
										<td class="FormLabels" width="10%" align="left"><a href="/GetEndorsementQuoteDetail.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(parentPolicyStatus)=<%=""+policyStatus%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteId)=<bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/>&answer(parentQuoteId)=<bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(policyEffDate)=<%=""+policyEffDate%>&answer(policyExpDate)=<%=""+policyExpDate%> "><bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/></a></td>
										</logic:present>
										<bean:define id="endoProductId" name="EndorsementQuoteList" property="Object::Endorsement::Quote::ProductId" />
										<bean:define id="endoProductVerId" name="EndorsementQuoteList" property="Object::Endorsement::Quote::ProductVerId" />										

										<td class="FormLabels" width="20%" align="left">
											<dmshtml:getProductHeaderDetail nameInSession="EndorsementProductDetail" productId='<%=""+endoProductId%>' productVerId='<%=""+endoProductVerId%>' ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<logic:present name="EndorsementProductDetail">
													<%String EndoProductName = ((com.dms.ejb.product.PRDProductDetail)request.getAttribute("EndorsementProductDetail")).getMProductVerName();%>
													<%=""+EndoProductName%>
												</logic:present>
										</td>
										
										<bean:define id="QuoteID" name="EndorsementQuoteList" property="Object::Endorsement::Quote::QuoteId" />
										
										<td class="FormLabels" width="20%" align="left">
																				
										<dmshtml:GetEndorseDocumentLocation documentType="BINDER" nameInSession="EndorseDocLoc" ownerId='<%=""+ownerId %>' quoteId='<%=Long.parseLong(""+QuoteID)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
											
										<logic:present name="EndorseDocLoc">	
																						 				
						 				<%
											Object objDocList = request.getAttribute("EndorseDocLoc");				 				
	
							 				if((objDocList != null) && (objDocList instanceof java.util.ArrayList)){
							 					
							 					java.util.ArrayList arrEndorseDocDetail = (java.util.ArrayList)objDocList;
												for(int docIndex=0; docIndex<arrEndorseDocDetail.size(); docIndex++){		
													com.dms.ejb.data.QuestionHashMap quoteDocLocMap=(com.dms.ejb.data.QuestionHashMap)arrEndorseDocDetail.get(docIndex);							
											
											
										%>			 				
		 									<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+quoteDocLocMap.getString("Quote::Document::DocumentUrl")%>')">
			   									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
						 						<%=""+quoteDocLocMap.getString("Quote::Document::DocumentName") %> 
						 					</a>
						 											 					
						 					<%} 
							 				}else{
												System.out.println("No Document Found");
											} %>
					 					
					 					</logic:present>			
										</td>
										<td class="FormLabels" width="10%" align="left">
										
										<bean:define id="EndorsementQuoteStartDate" name="EndorsementQuoteList" property="Object::Endorsement::Quote::QuoteStartDate" />	
										<%
										    
										   
										    String StartDate = ""+EndorsementQuoteStartDate;
	                                        String arrayStartDate[] = StartDate.split("-");
	                                        
	                                        String YYYY = arrayStartDate[0];
											String MM = arrayStartDate[1];
											String DD = arrayStartDate[2];
											
											StartDate = MM+"/"+DD+"/"+YYYY;
										%>
										<%=StartDate%>
										
										</td>
										<td class="FormLabels" width="15%" align="center"><bean:write property="Object::Endorsement::Quote::UpdatedBy" name="EndorsementQuoteList" /></td>
										
										<td class="FormLabels" width="21%" align="center">
										
										<bean:define id="EndorsementUpdatedDate" name="EndorsementQuoteList" property="Object::Endorsement::Quote::UpdatedDate" />	
										<%
										    
										   
										    String Updateddate = ""+EndorsementUpdatedDate;
	                                        String arrayUpdatedDate[] = Updateddate.split("-");
	                                        
	                                        String year = arrayUpdatedDate[0];
											String month = arrayUpdatedDate[1];
											String date = arrayUpdatedDate[2];
											
											Updateddate = month+"/"+date+"/"+year;
										%>
										<%=Updateddate%>
										
										
										</td>
										
										<td class="FormLabels" width="12%" align="left"><bean:write property="Object::Endorsement::Quote::QuoteStatus" name="EndorsementQuoteList" /></td>
										
									</tr>
							
								</logic:iterate>					
							
							</logic:present>
						 <%if (isActivePolicy.equals("Y")){ %>
							<tr height="30">
								<td class="links">
				 					<html:submit property="answer(ADD)" value="ADD" styleId="EndorseAddSubmit"/>
				 				</td>
							</tr>	
						<%} %>						
							<tr>
								<td>
									<html:hidden property="answer(Object::Quote::OwnerId)" value='<%=""+ownerId%>' />
									<html:hidden property="answer(Object::Quote::PaymentPlan)" value='<%=""+paymentPlan%>' />
									
									<logic:present name="AddQuote" scope="request">
										<html:hidden property="answer(displayVal)" name="AddQuote" styleId="dolTabDisplay"/>
									</logic:present>
									<logic:notPresent name="AddQuote" scope="request">
										<html:hidden property="answer(temp)" styleId="dolTabDisplay" value='N'/>
									</logic:notPresent>
									<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
									<html:hidden property="answer(Object::Quote::ProductStatus)" value="RELEASED" />
									<html:hidden property="answer(Object::Product::RiskState)" value='<%=riskState%>'/>
									<html:hidden property="answer(Object::Product::ProductVerId)" value='<%=""+productVerId%>'/>
									<html:hidden property="answer(Object::Product::ProductId)" value='<%=""+productId%>' />
									<html:hidden property="answer(Object::Quote::QuoteType)" value='ENDORSEMENT'/>
									<html:hidden property="answer(Object::Product::UserRole)" value='<%=""+usernameId%>' />
									<html:hidden property="answer(Object::Quote::ParentPolicyId)" value='<%=""+policyId %>'/>
									<html:hidden property="answer(Object::Quote::ParentPolicyVerId)" value='<%=""+policyVerId%>'/>
									<html:hidden property="answer(policyNumber)" value='<%=""+policyNumber%>'/>
									<html:hidden property="answer(parentPolicyStatus)" value='<%=""+policyStatus%>'/>
									<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" value='<%=""+dmsRiskId%>'/>
									<html:hidden property="answer(Object::Risk::Teritory)" value='<%=ratingTerritory%>'/>
									<html:hidden property="answer(Object::Risk::TeritoryName)" value='<%=ratingTerritoryName%>'/>
									<html:hidden property="answer(Object::Agency::AgencyId)" value='<%=""+agencyId%>'/>
									<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
									<logic:present name="policyHeaderInfo">
									<bean:define id="policyEffDate" name="policyHeaderInfo" property="policyEffDate" />	
									  <bean:define id="policyExpDate" name="policyHeaderInfo" property="policyExpDate" />	
										<%
										    com.dms.ejb.common.DMSDetail dmsDetail = new com.dms.ejb.common.DMSDetail();
										    java.sql.Date policyStartDate = (java.sql.Date)dmsDetail.stringToDate(""+policyEffDate);
										   
										    String strStartDate = ""+policyStartDate;
	                                        String arrStartDate[] = strStartDate.split("-");
	                                        
	                                        String YYYY = arrStartDate[0];
											String MM = arrStartDate[1];
											String DD = arrStartDate[2];
											
											strStartDate = MM+"/"+DD+"/"+YYYY;
										%>
										<html:hidden property="answer(Object::Quote::QuoteStartDate)" value='<%=""+strStartDate%>'/>
										<html:hidden property="policyEffDate" value='<%=""+policyEffDate%>'/>
        								<html:hidden property="policyExpDate" value='<%=""+policyExpDate%>'/>
									</logic:present>
									
								</td>
							</tr>
						</html:form>													
			 		</table>	 	
			 	</div>	
			 </div>
		</td>
	</tr>
</table>

<script type="text/javascript">

if(issueEndo.dolTabDisplay.value=='N'){
	dolphintabs.init('<%=headerName%>',0);
}else if(issueEndo.dolTabDisplay.value=='Y'){
	dolphintabs.init('<%=headerName%>',7);
}else{
	dolphintabs.init('<%=headerName%>',0);
}

function disableEndorseAdd(){
document.getElementById("EndorseAddSubmit").disabled = true;	
}

</script>
