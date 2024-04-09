<%@ page import="org.apache.struts.action.Action"%>
<%@ page import="org.apache.struts.taglib.html.Constants"%> 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="com.dms.common.ObjectDescriptor"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.dms.ejb.common.DMSDetail"%>

<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="paretLockStatus" name="UWWorkSheet" property="answer(Object::Quote::LockStatus)" />
<bean:define id="commissionAdjValue" name="UWWorkSheet" property="answer(Object::QuoteCommission::CommissionAdjustmentValue)" />
<bean:define id="localTotalBasePremium" name="UWWorkSheet" property="answer(Object::Plan::TotalPremium)" scope="request" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<%String lockStatus =""+paretLockStatus; %>
<style>
.caseInformation .field{float:left;padding:0 0 0 50px;margin:5px 0 5px 10px;font-size:12px;text-align:left;}
	.caseInformation{
		float:left;width:880px;padding:20px 0 0 20px;margin:0;
	}
	.caseInformation h3{
		float:left;margin:0 0 20px 0;padding:0;text-align:left;clear:both;width:700px;
	}
	.caseInformation h2{
		font-size:13px;margin:0;padding:0;float:left;text-align:left;color:#5B595C;
	}
	.fieldsLeft{
		float:left;
		width:400px;
		margin:0 40px 0 0;
		padding:0;
	}
	
	
	.caseInformation .subfield{float:left;padding:0 0 0 50px;margin:5px 0 5px 30px;font-size:12px;text-align:left;}	
.txtboxrightalign
{
    BORDER-RIGHT: #cccccc 1px solid;
    BORDER-TOP: #999999 1px solid;
    FONT-WEIGHT: 400;
    FONT-SIZE: 11px;
    BORDER-LEFT: #999999 1px solid;
    COLOR: #000000;
    BORDER-BOTTOM: #cccccc 1px solid;
    FONT-FAMILY: Verdana,Arial;
    HEIGHT: 18px;lc
    BACKGROUND-COLOR: #ffffff;
    TEXT-ALIGN: right;
    PADDING-RIGHT:2px;
    TEXT-DECORATION: none
}
</style>

<bean:define id="policyNumber" name="UWWorkSheet" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="customerId" name="UWWorkSheet" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="UWWorkSheet" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="QuoteType" name="UWWorkSheet" property="answer(Object::Quote::QuoteType)" />

<bean:define id="strParentQuoteType" name="UWWorkSheet" property="answer(Object::Quote::QuoteType)" />

<bean:define id="paretQuoteStatus" name="UWWorkSheet" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="ProductVerId" name="UWWorkSheet" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="parentQuoteId" name="UWWorkSheet" property="answer(parentQuoteId)" scope="request" />
<bean:define id="prodId" name="UWWorkSheet" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="ProductId" name="UWWorkSheet" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="EndorsementModified" name="UWWorkSheet" property="answer(Object::Quote::EndorsementModified)" scope="request" />

<bean:define id="ProductFamilyId" name="UWWorkSheet" property="answer(Object::Quote::ProductFamilyId)" />
<%String parentQuoteVerId = ""; 
String strParetQuoteVerId="";
String quoteNum1 = "";%>
<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />
	<logic:present name="parentQuoteDetail" scope="request">
			<bean:define id="paretQuoteVerId" name="parentQuoteDetail" property="quoteVerId"/>
			<%strParetQuoteVerId=""+paretQuoteVerId; %>
			<bean:define id="quoteNumber1" name="parentQuoteDetail" property="quoteNumber"/>
			<bean:define id="QuoteSubNumber" name="UWWorkSheet" property="answer(Object::Quote::QuoteSubNumber)" />
			<%parentQuoteVerId = ""+paretQuoteVerId; 
			quoteNum1 =""+quoteNumber1; %>
	</logic:present>
	
<bean:define id="RenewalPolicyNo" name="UWWorkSheet" property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" />
<bean:define id="RenewalPolicyCompany" name="UWWorkSheet" property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" />
<bean:define id="RenewalSubmissionNumber" name="UWWorkSheet" property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" />

<bean:define id="policyNumber" name="UWWorkSheet" property="answer(policyNumber)" />



<bean:define id="endorsementPolicyNumber" name="UWWorkSheet" property="answer(Object::Quote::PolicyNumber)" />

<bean:define id="parentPolicyId" name="UWWorkSheet" property="answer(Object::Policy::ParentPolicyId)" />
<bean:define id="parentPolicyVerId" name="UWWorkSheet" property="answer(Object::Policy::ParentPolicyVerId)" />
<%String isRenewal1="no"; %>
<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bind","Lapsed"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<%isRenewal1="YES"; %>
</dmshtml:isFeatureAvailableForProductRoleStatus>

<dmshtml:Get_All_Plan_HeaderDetails nameInSession="subQuotes" parentQuoteId='<%=""+parentQuoteId%>'dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
<logic:present name="subQuotes" scope="request">
<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />

</logic:iterate>											
</logic:present>

<html:form action="/SaveQuoteUnderwriterStatusActionBTA.do" styleId="SaveQuoteUnderwriterStatusAction" onsubmit="return validateForm(this);">
	<table width="100%">
		<tr>
			<td colspan="3"> &nbsp; </td>  
		</tr>
		<tr>
			<logic:present name="subQuotes" scope="request">
				<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail" />
				
				<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
				<bean:define id="subQuoteVerId" name="aSubQuote" 	property="quoteVerId" />
				<bean:define id="subQuoteProductId" name="aSubQuote" 	property="productId" />
				<bean:define id="subQuoteProductVerId" name="aSubQuote" 	property="productVerId" />
				<bean:define id="productVerId" name="aSubQuote" 	property="productVerId" />
				
				<%String quoteStatus = ""+paretQuoteStatus; %>
				<%! String subQuoteVerId1="";%>
				<%String subQuoteVerId1=""+ subQuoteVerId;%>
				<%!String productVerId1 =""; %>
				<% productVerId1 = ""+productVerId;%>
				<%if(quoteStatus.equals("Offered")){ %>
				<td colspan="0" align="right">
		       			<a href="../CLQuoteProposalPdf.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(isRenewalEndorsement)=<%=""+isRenewal1 %>&answer(Object::Quote::QuoteType)=<%=""+QuoteType %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(productId)=<%=""+ProductId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(activeTabName)=UW_WORKSHEET_Tab&answer(Object::PageType)=CREATE_QUOTE_PRAPOSAL_UW_WORKSHEET&answer(DocumentType)=PROPOSAL&answer(QuoteId)=<%= ""+parentQuoteId%>&answer(Object::Quote::QuoteType)=<%=strParentQuoteType.toString()%>&answer(Object::Quote::ProductId)=<%= ProductId.toString() %>&answer(OwnerId)=<%=ownerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(DocumentType)='PROPOSAL'&answer(parentQuoteId)=<%= ""+parentQuoteId%>&answer(Object::Quote::QuoteVerId)=<%= ""+strParetQuoteVerId%>&answer(Object::Quote::ProductVerId)=<%= productVerId.toString() %>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&answer(subQuoteVerId)=<%=subQuoteVerId.toString()%>&answer(ParentQuoteVerId)=<%= ""+strParetQuoteVerId%>&answer(activeTabNameProposal)=DocumentationTab&answer(Object::Quote::SubQuoteId)=<%=subQuoteId.toString()%>&answer(System::flag::requiredMultiSubmissionCheck)=No&<%="org.apache.struts.taglib.html.TOKEN"%>=<%= session.getAttribute(Action.TRANSACTION_TOKEN_KEY) %>&<%= Constants.TOKEN_KEY %>=<%= session.getAttribute(Action.TRANSACTION_TOKEN_KEY) %>" id="Create_Quote_Proposal">
		       				<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">
		       			</a>	

		        					
				</td>
				<td colspan="2" align="left">
		       		<a href="../CLQuoteProposalPdf.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(isRenewalEndorsement)=<%=""+isRenewal1 %>&answer(Object::Quote::QuoteType)=<%=""+QuoteType %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(productId)=<%=""+ProductId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(activeTabName)=UW_WORKSHEET_Tab&answer(Object::PageType)=CREATE_QUOTE_PRAPOSAL_UW_WORKSHEET&answer(DocumentType)=PROPOSAL&answer(QuoteId)=<%= ""+parentQuoteId%>&answer(Object::Quote::QuoteType)=<%=strParentQuoteType.toString()%>&answer(Object::Quote::ProductId)=<%= ProductId.toString() %>&answer(OwnerId)=<%=ownerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(DocumentType)='PROPOSAL'&answer(parentQuoteId)=<%= ""+parentQuoteId%>&answer(Object::Quote::QuoteVerId)=<%= ""+strParetQuoteVerId%>&answer(Object::Quote::ProductVerId)=<%= productVerId.toString() %>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&answer(subQuoteVerId)=<%=subQuoteVerId.toString()%>&answer(ParentQuoteVerId)=<%= ""+strParetQuoteVerId%>&answer(activeTabNameProposal)=DocumentationTab&answer(Object::Quote::SubQuoteId)=<%=subQuoteId.toString()%>&answer(System::flag::requiredMultiSubmissionCheck)=No&<%="org.apache.struts.taglib.html.TOKEN"%>=<%= session.getAttribute(Action.TRANSACTION_TOKEN_KEY) %>&<%= Constants.TOKEN_KEY %>=<%= session.getAttribute(Action.TRANSACTION_TOKEN_KEY) %>" id="Create_Quote_Proposal">
							<html:button styleClass="covsmallbutton"  style="font-size:13.5px; width:185px;;text-align: center;margin: 0px 0px 0px 0px;" property="answer(createQuoteProposal)" value="Create Quote Proposal" onclick="window.location=document.getElementById('Create_Quote_Proposal')"/></a>

		        					
				</td>
				<%} %>	
				<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%= ""+subQuoteVerId1%>' />
				<dmshtml:dms_isPresent property='<%=new String[]{"Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				<td colspan="3">
							<a href="../ReactivateQuoteBTA.do?TabPanelName=Quote_Panel&answer(Object::Quote::QuoteType)=<%=strParentQuoteType.toString()%>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(productId)=<%=""+ProductId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(productVerId)=<%=""+productVerId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(prevSubQuoteVerId)=<%=subQuoteVerId.toString()%>" id="Reactivate_Quote"><html:button styleClass="covsmallbutton" style="font-size:13.5px; width:100px;" property="answer(reactivateQuote)" value="Reactivate" title="Click here to Reactivate this quote" onclick="window.location=document.getElementById('Reactivate_Quote')"/></a>
				</td>
				</dmshtml:dms_isPresent>
				
			<dmshtml:dms_isPresent property='<%=new String[]{"In Progress","Offered","Referred","Bind Request","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				<td colspan="3">
					<a href="../DeclineQuoteUI3.do?TabPanelName=Quote_Panel&answer(parentQuoteStatus)=<%=""+paretQuoteStatus %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(productId)=<%=""+ProductId %>&answer(productVerId)=<%=""+productVerId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::QuoteType)=<%=strParentQuoteType.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(prevSubQuoteVerId)=<%=subQuoteVerId.toString()%>" id="Decline_Quote"><html:button styleClass="covsmallbutton" style="font-size:13.5px; width:100px;" property="answer(declineQuote)" value="Decline" title="Click here to Decline this quote" onclick="window.location=document.getElementById('Decline_Quote')"/></a>
				</td>
			</dmshtml:dms_isPresent>	
			</logic:present>
			<%boolean reanOnly = false;%>
			<%String strQuoteStatus = ""+paretQuoteStatus; %>
			<%if(strQuoteStatus.equals("Bound") || strQuoteStatus.equals("Issued") || lockStatus.equals("Locked")){ 
					reanOnly = true;
			}
			%>
		</tr>
	    
		<tr class="sectionhead" align="center">
			<td class="sectionhead" colspan="3"> 
				Underwriter Worksheet 
			</td>  
		</tr>
	
		<tr>
			<td colspan="3"> &nbsp; </td>  
		</tr>
	
		<tr>
	     	<td width="1%">
	        	
	        </td> 
	       	<td width="58%"> Collateral Lines Of Business In Force </td>
	       	<td>
	       		<html:text property="answer(Object::PlanFactor::CollateralLOBFactor)" onblur = "javascript:showReasonsText();" name="UWWorkSheet" styleClass="txtboxrightalign" size="6" maxlength="6" styleId="collateralLOBFactor" readonly="<%=reanOnly%>"/>
	       	</td>        	   		
	     </tr> 
	     
	     <tr  style="display:none" id="collateralLOBFactorReasonTD">
	     	<td>
	        	 &nbsp;&nbsp;&nbsp;&nbsp;
	        </td> 
	       	<td> Reason</td>
	       <td>
	       
	       		<html:textarea property="answer(Object::PlanFactor::CollateralLOBFactorReason)" name="UWWorkSheet"  rows="3" cols="40" styleId="collateralLOBFactorReason" />
	       	</td>        	   		
	     </tr> 
	     
	     <tr>
	     	<td>
	        	 &nbsp;&nbsp;&nbsp;&nbsp;
	        </td> 
	       	 <td> 
	       	 	* Quality Of In Force Business In Place With The Producer 
	       	 </td>
	       	 <td>
	       	 	 <html:text property="answer(Object::PlanFactor::QualityInforceBusinessFactor)" name="UWWorkSheet" onblur = "javascript:showReasonsText();" styleClass="txtboxrightalign" size="6" maxlength="6" styleId="qualityInforceBusinessFactor" readonly="<%=reanOnly%>"/>
	       	 </td>        	   		
	     </tr> 
	     
	     <tr style="display:none" id="qualityInforceBusinessFactorRaesonTD">
	     	<td>
	        	 &nbsp;&nbsp;&nbsp;&nbsp;
	        </td> 
	       	 <td> 
	       	 	Reason
	       	 </td>
	       	 <td >
	       	 	 <html:textarea property="answer(Object::PlanFactor::QualityInforceBusinessFactorReason)" name="UWWorkSheet"  rows="3" cols="40"  styleId="qualityInforceBusinessFactorRaeson"  />
	       	 </td>        	   		
	     </tr> 
	     
	     <tr>
	     	<td>
	        	 &nbsp;&nbsp;&nbsp;&nbsp;
	        </td>  
			<td>
				* Account Labeled As A Target Based On Favorable Results Of Similar Size And Type Of Risk
			</td>
			<td>
				<html:text property="answer(Object::PlanFactor::AccountLabeledFactor)" name="UWWorkSheet" styleClass="txtboxrightalign" onblur = "javascript:showReasonsText();" size="6" maxlength="6" styleId="accountLabeledFactor" readonly="<%=reanOnly%>"/>
			</td>
	     </tr> 
	     
	     <tr style="display:none" id="accountLabeledFactorReasonTD">
	     	<td>
	        	 &nbsp;&nbsp;&nbsp;&nbsp;
	        </td>  
			<td>
				Reason
			</td>
			<td >
				<html:textarea property="answer(Object::PlanFactor::AccountLabeledFactorReason)" name="UWWorkSheet"  rows="3" cols="40"  styleId="accountLabeledFactorReason" />
			</td>
	     </tr> 
	     
	     <tr>
	     	<td>
	        	 &nbsp;&nbsp;&nbsp;&nbsp;
	        </td> 
			<td>
				* Producer Labeled As A Target Based On The Size And Quality Of Their In Force A&H Business
			</td>
			<td>
				<html:text property="answer(Object::PlanFactor::ProducerLabeledFactor)" name="UWWorkSheet" styleClass="txtboxrightalign" onblur = "javascript:showReasonsText();" size="6" maxlength="6" styleId="producerLabeledFactor" readonly="<%=reanOnly%>"/>
			</td>
	     </tr> 
	     
	     <tr style="display:none" id="producerLabeledFactorReasonTD">
	     	<td>
	        	 &nbsp;&nbsp;&nbsp;&nbsp;
	        </td> 
			<td>
				Reason
			</td>
			<td >
				<html:textarea property="answer(Object::PlanFactor::ProducerLabeledFactorReason)" name="UWWorkSheet"  rows="3" cols="40"  styleId="producerLabeledFactorReason" />
			</td>
	     </tr> 
	     
	     <tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			
			<td>
				* Quality Of Underwriting Data Made Available
			</td>
			<td>
				<html:text property="answer(Object::PlanFactor::QualityOfUWDataMadeFactor)" name="UWWorkSheet" styleClass="txtboxrightalign" onblur = "javascript:showReasonsText();" size="6" maxlength="6" styleId="qualityOfUWDataMadeFactor" readonly="<%=reanOnly%>"/>
			</td>        	   		
	     </tr> 
	     
	      <tr style="display:none" id="qualityOfUWDataMadeFactorReasonTD">
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			
			<td>
				Reason
			</td>
			<td >
				<html:textarea property="answer(Object::PlanFactor::QualityOfUWDataMadeFactorReason)" name="UWWorkSheet"  rows="3" cols="40" styleId="qualityOfUWDataMadeFactorReason" />
			</td>        	   		
	     </tr> 
	     
	     <tr>
	     	<td>
	        	 &nbsp;&nbsp;&nbsp;&nbsp;
	        </td>  
	        <td>
	        	* High Per Person Sums Insured
	        </td>
			<td>
	        	<html:text property="answer(Object::PlanFactor::HighPerPersonSumInsuredFactor)" name="UWWorkSheet" styleClass="txtboxrightalign" onblur = "javascript:showReasonsText();" size="6" maxlength="6" styleId="highPerPersonSumInsuredFactor" readonly="<%=reanOnly%>"/>
	        </td>        	   		
	     </tr> 
	     
	     <tr style="display:none" id="highPerPersonSumInsuredFactorReasonTD">
	     	<td>
	        	 &nbsp;&nbsp;&nbsp;&nbsp;
	        </td>  
	        <td>
	        	Reason
	        </td>
			<td >
	        	<html:textarea property="answer(Object::PlanFactor::HighPerPersonSumInsuredFactorReason)" name="UWWorkSheet"  rows="3" cols="40"   styleId="highPerPersonSumInsuredFactorReason" />
	        </td>        	   		
	     </tr> 
	     
	     <tr >
	     	<td>
	        	&nbsp;&nbsp;&nbsp;&nbsp;
			</td>  
			<td>
				* High Concentrations Of Risk In Any Given Location
			</td>
			<td>
				<html:text property="answer(Object::PlanFactor::HighConcentrationofRiskFactor)" name="UWWorkSheet" onblur = "javascript:showReasonsText();" styleClass="txtboxrightalign" size="6" maxlength="6" styleId="highConcentrationofRiskFactor" readonly="<%=reanOnly%>"/>
			</td>        	   		
	     </tr> 
	     
	     
	     <tr style="display:none" id="highConcentrationofRiskFactorReasonTD">
	     	<td>
	        	&nbsp;&nbsp;&nbsp;&nbsp;
			</td>  
			<td>
				Reason
			</td>
			<td >
				<html:textarea property="answer(Object::PlanFactor::HighConcentrationofRiskFactorReason)" name="UWWorkSheet"  rows="3" cols="40" styleId="highConcentrationofRiskFactorReason" />
			</td>        	   		
	     </tr> 
	     
	     <tr>
	     	<td>
	        	&nbsp;
			</td>  
			<td>
				* Unusual Activities To Be Insured        	 	
			</td>
			<td>
				<html:text property="answer(Object::PlanFactor::UnusualActivitiesFactor)" name="UWWorkSheet" onblur = "javascript:showReasonsText();" styleClass="txtboxrightalign" size="6" maxlength="6" styleId="unusualActivitiesFactor" readonly="<%=reanOnly%>"/>
				
			</td>        	   		
	     </tr> 
	     
	     
	     <tr style="display:none" id="unusualActivitiesFactorReasonTD">
	     	<td>
	        	&nbsp;
			</td>  
			<td>
				Reason       	 	 
			</td>
			<td >
				<html:textarea property="answer(Object::PlanFactor::UnusualActivitiesFactorReason)" name="UWWorkSheet"  rows="3" cols="40"  styleId="unusualActivitiesFactorReason" />
			</td>        	   		
	     </tr> 
	     <tr>
			<td colspan="3" width="900px"> &nbsp; </td>  
			<td colspan="3"> &nbsp; </td>  
			<td colspan="3"> &nbsp; </td>  
		</tr>
	     </table>
	     <table width="630px">
	     <tr>
	     	
			<td>
			&nbsp;&nbsp;	= Net UW Adjustment Factor
			</td>
			<td align="right">
				<bean:write property="answer(Object::PlanFactor::NetUWAdjustmentFactor)" name="UWWorkSheet" />
			</td>
	     </tr> 
	
		<tr>
			<td colspan="3"> &nbsp; </td>  
		</tr>
	     
	     <tr>
	     
			<td>
				&nbsp;&nbsp;Total Premium Before UW Adjustment
			</td>
			<td align="right">
		       	<bean:define id="totalPremiumBeforUWAdj" property="answer(Object::Quote::UWAdjTotalPremium)" name="UWWorkSheet"/>
		       	<dmshtml:CurrencyFormatTag digits="2" format="<%=""+totalPremiumBeforUWAdj%>" />
	       	</td>
	     </tr> 
	
	     <tr>
	     	
	       	<td>
	       		&nbsp;&nbsp;Total Premium After UW Adjustment
	       	</td>
			<td align="right">
				<bean:define id="totalPremium" property="answer(Object::Quote::TotalPremium)" name="UWWorkSheet"/>
				<dmshtml:CurrencyFormatTag digits="2" format="<%=""+totalPremium%>" />
			</td>
	     </tr> 
	    <tr>
	     	
	       	<td>
	       		&nbsp;&nbsp;Minimum Premium Applies
	       	</td>
			<td align="right">
				<bean:define id="isMinimumPremiumApplies" property="answer(Object::Plan::IsMinimumPremiumApplies)" name="UWWorkSheet"/>
				<%if(reanOnly && isMinimumPremiumApplies.toString().equals("1")){ %>
					<%="Yes" %>
				<%}else if(reanOnly && isMinimumPremiumApplies.toString().equals("0")){%>
					<%="No" %>
				<%} %>
				
				<%if(!reanOnly&&isMinimumPremiumApplies.toString().equals("1")) {%>				
				<input type="radio" name="answer(Object::Plan::IsMinimumPremiumApplies)" value="1" id="isMinimumPremiumAppliesY" checked="checked" onclick="showHideMinimumPremium();"/>Yes
				<input type="radio" name="answer(Object::Plan::IsMinimumPremiumApplies)" value="0" id="isMinimumPremiumAppliesN" onclick="showHideMinimumPremium();"/>No&nbsp;&nbsp;
				<%}else if(!reanOnly&&isMinimumPremiumApplies.toString().equals("0")){%>
					<input type="radio" name="answer(Object::Plan::IsMinimumPremiumApplies)" value="1" id="isMinimumPremiumAppliesY" onclick="showHideMinimumPremium();"/>Yes
					<input type="radio" name="answer(Object::Plan::IsMinimumPremiumApplies)" value="0" id="isMinimumPremiumAppliesN" checked="checked" onclick="showHideMinimumPremium();"/>No&nbsp;&nbsp;
				<%} %>
				
				
			</td>
	     </tr> 
	     
	     <tr style="display:none;" id="MinimumPremium1Tr">
	     	
	       	<td>
	       		&nbsp;&nbsp;Minimum Premium
	       	</td>
			<td align="right">
				<bean:define id="MinimumPremium" property="answer(Object::Plan::MinimumPremium)" name="UWWorkSheet"/>
				<%DMSDetail dmsDetail = new DMSDetail(); %>
				<%String MinimumPremium1 = dmsDetail.currencyFormat(Double.parseDouble(MinimumPremium.toString())); %>
				<html:text property="answer(Object::Plan::MinimumPremium)" name="UWWorkSheet" value="<%=MinimumPremium1+""%>"  styleClass="txtboxrightalign" size="11" maxlength="13" styleId="MinimumPremium1" readonly="<%=reanOnly%>"/>				
			</td>
	     </tr> 
	     <%if(reanOnly && isMinimumPremiumApplies.toString().equals("1")){ %>
		     <tr>	     	
		       	<td>
		       		&nbsp;&nbsp;Minimum Premium
		       	</td>
				<td align="right">					
					<%=MinimumPremium1+""%>
				</td>
		     </tr>
		<%}%> 
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<bean:define id="subQuoteId" property="answer(subQuoteId)" name="UWWorkSheet" />
				<html:hidden property="answer(Quote::Page)" value="isUnderWriterWorkSheet" />
				<html:hidden property="answer(parentQuoteId)" name="UWWorkSheet" />
				<html:hidden property="answer(Object::Quote::ProductId)" name="ProductID" value='<%= ProductId.toString() %>'/>
				<html:hidden property="answer(Object::Quote::ProductVerId)" name="ProductVerID" value='<%= ""+productVerId1 %>'/>
				<html:hidden property="answer(ProductVerId)" name="productVerID" value='<%= ""+productVerId1 %>'/>
				<input type="hidden" name="answer(RULE_OBJECT_ID)" value="<%=""+ProductId %>"/>
				<input type="hidden" name="answer(RULE_OBJECT_VER_ID)" value="<%=""+productVerId1 %>" />
				<input type="hidden" name="answer(RULE_OBJECT_TYPE)" value="PRODUCT"/>
				<input type="hidden" name="answer(RULE_OBJECT_NAME)" value="APPLICATION"/>
				<html:hidden property="answer(ParentQuoteVerId)" name="ParentQuoteID" value='<%=""+parentQuoteVerId%>'/>
				<html:hidden property="answer(parentQuoteId)" name="parentQuoteID" value='<%=""+parentQuoteId%>'/>
				<html:hidden property="answer(Object::UWWorkSheet::ParentQuoteId)" name="parentQuoteID1" value='<%=""+parentQuoteId%>'/>
				<html:hidden property="answer(SubQuoteId)" name="subQuoteId" value='<%= ""+subQuoteId %>' />
				<html:hidden property="answer(subQuoteVerId)" name="SubQuoteVerId" value='<%=""+ subQuoteVerId1%>' />
				<html:hidden property="answer(QuoteId)" name="UWWorkSheet" value='<%= ""+subQuoteId %>' />
				<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
				<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
				<html:hidden property="answer(UnderWriterWorkSheet)" value="Yes" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />				
				<html:hidden property ="answer(pagename)" value="Underwriter worksheet page" />
				<html:hidden name="UWWorkSheet" property="answer(Object::Quote::LockStatus)" styleId="LockStatus" />
				<html:hidden property="answer(activateTabId)" value="Worksheet"/>	
				<html:hidden name="UWWorkSheet" property="answer(Object::Quote::EndorsementModified)" />
				
				<html:hidden property="answer(policyNumber)" value='<%=""+policyNumber%>'/>
				<html:hidden property="answer(Object::Quote::PolicyNumber)" value='<%=""+policyNumber%>'/>
				<html:hidden property="answer(Object::Policy::ParentPolicyId)" value='<%=""+parentPolicyId%>'/>
				<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=""+parentPolicyVerId %>"/>
				<%if((""+QuoteType).equalsIgnoreCase("ENDORSEMENT")){%>
					<html:hidden name="UWWorkSheet" property="answer(Object::Quote::EndorsementModified)" value="Y" />
				<%}%>
				<html:hidden name="UWWorkSheet" property="answer(Object::Customer::CustomerId)" />
				<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
				<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
				<html:hidden property="answer(isUpdated)" value="Y" />
				<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
				<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
				<html:hidden property="answer(activateTabId)" value="Worksheet"/>
				<html:hidden property="answer(openTabAPolicyInfo)" value="openTabWorksheetY"/>				
			</td>  
		</tr>
	</table>
	
	<table width="630px">
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_QUOTE_COMMISSION"}%>' connector='or' negated="true">
		<tr>
			<td colspan="3">
				<html:hidden name="UWWorkSheet" property="answer(Object::PlanFactor::CommissionFactor)"  styleId="commissionFactor" />
			</td>
		</tr>
		<bean:define id="oldCommissionPercentage" name="UWWorkSheet" property="answer(Object::QuoteCommission::InitialCommissionPercentage)" type="java.lang.String"/>
		<%
			double dblCommissionVal = 0.0;
			dblCommissionVal = (new Double(oldCommissionPercentage)).doubleValue();
		%>
		
		<tr>
			<td> &nbsp; </td>
			<td> Default Agent Commission % </td>
			<td align="right" >
				<dmshtml:dms_text  name="UWWorkSheet" property ="answer(Object::QuoteCommission::InitialCommissionPercentage)"  size="6" maxlength="6" styleClass="txtboxrightalign" readonly="true"  />
			</td>
		</tr>
		
		<tr>
			<bean:define id="currCommissionPercentage" name="UWWorkSheet" property="answer(Object::QuoteCommission::CommissionPercentage)" type="java.lang.String"/>
			<td> &nbsp; </td>
			<td> Commission Adjustment % </td>
			<td align="right" >
				<% 
					int commissionVal = 0;
					double dblCurrCommissionVal = 0.0;
				
					try{
						dblCurrCommissionVal = (new Double(currCommissionPercentage)).doubleValue();
						commissionVal = (new Double(oldCommissionPercentage)).intValue(); 							
						System.out.println("commissionVal-->"+commissionVal);
					}catch(Exception ex){}

					double commissionAdjustValue=Double.parseDouble(""+commissionAdjValue);
					java.text.DecimalFormat money = new java.text.DecimalFormat("0.000");
					commissionAdjustValue = Double.parseDouble(money.format(commissionAdjustValue));
					commissionAdjustValue = Math.abs(commissionAdjustValue);
				%>														
				<%if(paretLockStatus!=null && paretLockStatus.equals("Locked")){%>
					<html:select disabled="true" property="answer(Object::QuoteCommission::CommissionAdjustmentSign)"  name="UWWorkSheet"  styleId="CommissionAdjustmentSign" onchange="diplayCMP(this.form);" >
						<html:option value ="+">+</html:option>
						<html:option value ="-">-</html:option>
					</html:select>								
				
					<input type="text" name="answer(Object::QuoteCommission::CommissionAdjustmentValue)" value="<%=""+commissionAdjustValue%>" maxlength="5" class="txtboxrightalign" size="5" readonly="true" id="CommissionAdjustmentValue" onchange="diplayCMP(this.form);"/> 
				<%}
				else{%>
					<html:select property="answer(Object::QuoteCommission::CommissionAdjustmentSign)"  name="UWWorkSheet"  styleId="CommissionAdjustmentSign" onchange="diplayCMP(this.form);" >
						<html:option value ="+">+</html:option>
						<html:option value ="-">-</html:option>
					</html:select>

					<input type="text" name="answer(Object::QuoteCommission::CommissionAdjustmentValue)" value="<%=""+commissionAdjustValue%>" maxlength="6" class="txtboxrightalign" size="6" id="CommissionAdjustmentValue" onchange="diplayCMP(this.form);"/> 
				<%}%>
			
			<html:hidden name="UWWorkSheet" property="oldCommissionPercentage" value="<%=""+dblCommissionVal%>" styleId="oldCommissionPercentage" />
			</td>
		</tr>

		<tr>
			<td> &nbsp; </td>								
			<td> Adjusted Agent Commission % </td>
			<td align="right" >
				<dmshtml:dms_text  name="UWWorkSheet" property ="CurrentCommissionPercentage"  size="6" maxlength="6" styleClass="txtboxrightalign" styleId="CurrentCommissionPercentage" readonly="true" value="<%=""+dblCurrCommissionVal%>" /> 
				<html:hidden name="UWWorkSheet" property="answer(Object::QuoteCommission::CommissionPercentage)" value="<%=""+dblCurrCommissionVal%>" styleId="newCommissionPercentage" />
			</td>
		</tr>
		
		<% double subQuoteTotal = 0;
			//double allriskCommissionPercent = 0;
			try{
				subQuoteTotal = (new Double(""+localTotalBasePremium)).doubleValue();
			}catch(Exception ex){}
			try{
				//allriskCommissionPercent = (new Double(""+parentOwnerCommissionPercent)).doubleValue();
			}catch(Exception ex){}
		%>
		<tr>
			<td> &nbsp; </td>							   
			<td align="left"> Agent Commission </td>
			<td align="right">
				<dmshtml:CurrencyFormatTag format='<%= "" + ( subQuoteTotal * dblCurrCommissionVal / 100 )%>'/>
			</td>
		</tr>
		
		</dmshtml:dms_static_with_connector>

		<tr>
			<td> &nbsp; </td>
			<td> Quote Status </td>
			<td align="right">	
				<logic:present name="parentQuoteDetail" scope="request">
					<%boolean  isRenewal=false;%>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bind","Lapsed","Issued","Declined","Bound"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<%isRenewal=true; %>
					</dmshtml:isFeatureAvailableForProductRoleStatus>					
					

					<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Submitted", "Offered", "Bound", "Bind Request","In Progress","Declined"}%>" value="<%=paretQuoteStatus.toString()%>"  negated= "true">
						<%if((""+QuoteType).equalsIgnoreCase("ENDORSEMENT")  && !isRenewal){%>
							<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"   name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>" styleId="Object$Quote$QuoteStatus" onchange="return setLockStatus(this.form);">	
								<dmshtml:dms_option value ='In Progress'>In Progress</dmshtml:dms_option>
								<dmshtml:dms_option value ='Bind Request'>Bind Request</dmshtml:dms_option>
								<dmshtml:dms_isPresent property="<%=new String[]{"Declined"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
									<dmshtml:dms_option value ='In Progress'>Reactivate</dmshtml:dms_option>
								</dmshtml:dms_isPresent>																										
							</dmshtml:dms_select>	
						<%}else{%>
						<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>"  negated= "true">
							<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"   name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>" styleId="Object$Quote$QuoteStatus" onchange="return setLockStatus(this.form);">	
								<dmshtml:dms_option value ='In Progress'>In Progress</dmshtml:dms_option>		
								<dmshtml:dms_option value ='Offered'>Offered</dmshtml:dms_option>	
								<dmshtml:dms_option value ='Bind Request'>Bind Request</dmshtml:dms_option>																			
								<dmshtml:dms_isPresent property='<%=new String[]{"In Progress","Offered","Referred","Bind Request","Submitted","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
									<dmshtml:dms_option value ='Declined'>Decline</dmshtml:dms_option>	
								</dmshtml:dms_isPresent>										
							</dmshtml:dms_select>							
						</dmshtml:dms_isPresent>	
						<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Submitted", "Offered", "Bound", "Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>"  negated= "true">
							<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"   name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>" styleId="Object$Quote$QuoteStatus" onchange="return setLockStatus(this.form);">	
								
								<dmshtml:dms_option value ='Bind Request'>Bind Request</dmshtml:dms_option>	
								<dmshtml:dms_option value ='Offered'>Offered</dmshtml:dms_option>																			
																
							</dmshtml:dms_select>							
						</dmshtml:dms_isPresent>	
						<dmshtml:dms_isPresent property="<%=new String[]{"Declined"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
										<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"  name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>"  styleId="Object$Quote$QuoteStatus" onchange="return setLockStatus(this.form);">											
											<dmshtml:dms_option value ='<%=paretQuoteStatus.toString()%>'><%=paretQuoteStatus.toString()%></dmshtml:dms_option>
											<dmshtml:dms_option value ='In Progress'>Reactivate</dmshtml:dms_option>
										</dmshtml:dms_select>		
						</dmshtml:dms_isPresent>	
						<%}%>	
					</dmshtml:dms_isPresent>	
				</logic:present>				
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="hidden" name="quoteStatusInitValue" value="<%=paretQuoteStatus.toString()%>" id="quoteStatusInitValue"/>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SELECT_RATE_LEVEL"}%>' connector='or' negated="true">
					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >
					</dmshtml:dms_isPresent>
				</dmshtml:dms_static_with_connector>
			</td>
		</tr>
		
		<!-- To hide the Calculate and Save buttons is the quote status is Sold, Lost,Rejected (+ Bound, Issued)-->
		<dmshtml:dms_isPresent property="<%=new String[]{"Sold", "Lost", "Rejected", "Bound", "Issued","Lapsed"}%>" value="<%=paretQuoteStatus.toString()%>">
			<tr>
			  	 <td colspan="3" align="right">
			  	 	<input type="submit" id="worksheetSave" value="Save" class="covsmallbutton" >
			  	 </td>        	   		
			</tr>
		</dmshtml:dms_isPresent>
		<tr> <td> &nbsp; </td> </tr>
	</table>		
</html:form>

<logic:present name='ClassListArray'>
	<logic:iterate id="ClassList" name="ClassListArray" >
		<table width="900px">
			<tr>
			 	<td>
					<bean:define id="Classname"  property="Object::Risk::Class::ClassName" name="ClassList" />
					<bean:define id="ClassDecs"  property="Object::Risk::Class::ClassDescription" name="ClassList" />
					<bean:define id="ClassId"  property="Object::Risk::RiskId" name="ClassList" />
					<bean:define id="ClassPremium"  property="Object::Quote::ClassPremium" name="ClassList" />
		   	   	</td>        	   		
		      </tr>   
		
			<tr>
		    	
		  		<td width="95%" style="color: black;font-size: 9pt;font-weight:bold ;">
			   		<a href="javascript:void(0);" style="color: black;font-size: 9pt;font-weight:bold ;" onclick="getWorkSheetClassHazardsList('<%=""+ClassId.toString()%>',this.id,'<%=""+Classname.toString()%>');" id='<%="WorksheetClass"+ClassId.toString()%>'>	 <%="+ "+Classname%> 
				   	</a>
				</td>  
				<td width="5%" align="right">
					<dmshtml:CurrencyFormatTag digits="2" format="<%=""+ClassPremium%>" />
				</td>
			</tr> 
			</table>
			<table width="900px">
			<tr>
				
        	   	<td width="95%">
        	    	<div id='<%="WorkSheetHazardDiv"+ClassId.toString()%>' style="display:none;"></div>
        	    </td>
        	   	<td width="5%">
					
				</td>
			</tr> 
		</table>
	</logic:iterate>
</logic:present>