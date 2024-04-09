<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dms.ejb.insurance.quote.common.plan.PlanDetail" %>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CleanPaste.js"></script>

<!-- Skin CSS file -->
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/editor/simpleeditor-min.js"></script>

<script type="text/javascript">
var myEditor;
function renderEditor() {
    var Dom = YAHOO.util.Dom,
        Event = YAHOO.util.Event;
        
    YAHOO.log('Create the Editor..', 'info', 'example');
    myEditor = new YAHOO.widget.SimpleEditor('editor', {
    	height: '150px',
        width: '875px',
        dompath: true,
        filterWord: true,
        focusAtStart: true,
        animate: true,                        
        toolbar: {
    		titlebar: 'Endorsement Content',
            buttons: [
                      { group: 'fontstyle', label: 'Font Name and Size',
                          buttons: [
                              { type: 'select', label: 'Arial', value: 'fontname', disabled: false,
                                  menu: [
                                      { text: 'Arial', checked: true },
                                      { text: 'Arial Black' },
                                      { text: 'Comic Sans MS' },
                                      { text: 'Courier New' },
                                      { text: 'Garamond' },
                                      { text: 'Lucida Console' },
                                      { text: 'Tahoma' },
                                      { text: 'Times New Roman' },
                                      { text: 'Trebuchet MS' },
                                      { text: 'Verdana' }
                                  ]
                              },
                              { type: 'spin', label: '10', value: 'fontsize', range: [ 9, 75 ], disabled: false }
                          ]
                      },
                      { type: 'separator' },
                      { group: 'textstyle', label: 'Font Style',
                          buttons: [
                              { type: 'push', label: 'Bold CTRL + SHIFT + B', value: 'bold' },
                              { type: 'push', label: 'Italic CTRL + SHIFT + I', value: 'italic' },
                              { type: 'push', label: 'Underline CTRL + SHIFT + U', value: 'underline' },
                              { type: 'push', label: 'Strike Through', value: 'strikethrough' },                              
                              { type: 'separator' },
                              { type: 'color', label: 'Font Color', value: 'forecolor', disabled: false },
                              { type: 'color', label: 'Background Color', value: 'backcolor', disabled: false }
                          ]
                      },
                      { type: 'separator' },
                      { group: 'indentlist', label: 'Lists',
                          buttons: [
                              { type: 'push', label: 'Create an Unordered List', value: 'insertunorderedlist' },
                              { type: 'push', label: 'Create an Ordered List', value: 'insertorderedlist' }
                          ]
                      }                   
                  ]
        }
    });   
    myEditor._defaultToolbar.buttonType = 'advanced'; 
    myEditor.render();
    var cleanPaste = new CleanPaste(myEditor);
    YAHOO.util.Event.on('save', 'click', function() {
    	var stripHTML = /<\S[^><]*>/g; 
    	myEditor.get('textarea').value = myEditor.get('textarea').value.replace(' ', '&nbsp;').replace(stripHTML, '&nbsp;').replace(/<\s[^><]*>/g,'&nbsp;');
    	myEditor.saveHTML();
        
    });
        
      
}

function saveHtml(){
	myEditor.saveHTML();
	if(document.getElementById("editor") != null && document.getElementById("editor") != undefined) {
		document.getElementById("editor").value = convertSpecialCharactersToAsciiValue(document.getElementById("editor").value);
	}
}
</script>

<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="EndorsementDetail" property="answer(productVerId)" scope="request"/>
<bean:define id="customerId" name="EndorsementDetail" property="answer(customerId)" scope="request"/>
<bean:define id="CustomerState" name="EndorsementDetail" property="answer(State)" scope="request"/>
<bean:define id="agencyId" name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" scope="request"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="isGASurchargeApplicable" name="EndorsementDetail" property="answer(Object::Plan::IsGASurchargeApplicable)" />

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
	<%
	
	ArrayList historyFeeDetailsList=new ArrayList();
	ArrayList feeDetailsList=new ArrayList();
	ArrayList historySurchargeDetailsList=new ArrayList();
	ArrayList surchargeDetailsList=new ArrayList();

	ArrayList historyTaxDetailsList=new ArrayList();
	ArrayList taxDetailsList=new ArrayList();
	
 	historyFeeDetailsList=(ArrayList)request.getAttribute("QUOTE_POLICY_FEE_HISTORY");
 	feeDetailsList=(ArrayList)request.getAttribute("QUOTE_PLAN_FEE");
 	historySurchargeDetailsList=(ArrayList)request.getAttribute("QUOTE_POLICY_SURCHARGE_HISTORY");
 	surchargeDetailsList=(ArrayList)request.getAttribute("QUOTE_PLAN_SURCHARGE");

 	historyTaxDetailsList=(ArrayList)request.getAttribute("QUOTE_POLICY_TAX_HISTORY");
 	taxDetailsList=(ArrayList)request.getAttribute("QUOTE_PLAN_TAX");%>
 	
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(policyNumber)" />

<table width="100%">
	
	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0" bgcolor="#C6DEEA">
				<tr>
					<td>
						<div id="QuoteInsuerdAgencyAgentHeader">
							<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
							<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
							</jsp:include>
						</div>
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
					<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
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
	</tr>
	<tr>
		<td class="links">
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
		</td>
	</tr>

	<tr>
	<td colspan="2">

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
			<html:form action="/SaveEndorsementDetailAction.go" >
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
					<td class="Numeric">
						<bean:define id="totalBasePremiumPrior" name="quotePolicyHistoryDetail" property="totalBasePremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumPrior%>"/>					
					 </td>
					<td class="Numeric">
						<bean:define id="totalBasePremiumNew" name="EndorsementDetail" property="answer(Object::Plan::TotalBasePremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumNew%>"/>					
					</td>
					<td class="Numeric">
						<bean:define id="totalBasePremiumDiff" name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalBasePremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumDiff%>"/>	
					</td>
					<td class="Numeric">
						<bean:define id="ProrataTotalBasePremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalBasePremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTotalBasePremiumDiference%>"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels">TRIA Premium</td>
					<td class="Numeric">
						<bean:define id="triaPremium" name="quotePolicyHistoryDetail" property="triaPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+triaPremium%>"/>
					 </td>
					<td class="Numeric">
						<bean:define id="TRIAPremium" name="EndorsementDetail" property="answer(Object::Plan::TRIAPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TRIAPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="TriaPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::TriaPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TriaPremiumDiference%>"/>					
					</td>
					<td class="Numeric">
						<bean:define id="ProrataTriaPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTriaPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTriaPremiumDiference%>"/>		
					</td>
				</tr>
				<tr>
					<td class="FormLabels">Non Certified TRIA Premium</td>
					<td class="Numeric">
						<bean:define id="nonTriaPremium" name="quotePolicyHistoryDetail" property="nonCertifiedTriaPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+nonTriaPremium%>"/>
					 </td>
					<td class="Numeric">
						<bean:define id="nonTRIAPremium" name="EndorsementDetail" property="answer(Object::Plan::NonCertifiedTRIAPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+nonTRIAPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="NonTriaPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::NonTriaPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+NonTriaPremiumDiference%>"/>					
					</td>
					<td class="Numeric">
						<bean:define id="ProrataNonTriaPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataNonTriaPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataNonTriaPremiumDiference%>"/>		
					</td>
				</tr>
				<bean:define id="prorataFactor" name="EndorsementDetail" property="answer(Object::PlanFactor::ProrataFactor)"/>
				<tr>
					<td class="FormLabels">Total Premium</td>
					<td class="Numeric">
						<bean:define id="totalPremium" name="quotePolicyHistoryDetail" property="totalPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="TotalPremium" name="EndorsementDetail" property="answer(Object::Quote::TotalPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="TotalPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalPremiumDiference%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="ProrataTotalPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTotalPremiumDiference%>"/>
					</td>
				</tr>
				<%

					if(historySurchargeDetailsList.size()!=0 && surchargeDetailsList.size()!=0) {
					     for(int historySurchargeCount=0;historySurchargeCount<historySurchargeDetailsList.size();historySurchargeCount++)
				         {
				          for(int surchargeCount=historySurchargeCount;surchargeCount<historySurchargeCount+1;surchargeCount++)
								{		
								PlanDetail historySurchargeDetail=(PlanDetail)historySurchargeDetailsList.get(historySurchargeCount); 
								PlanDetail surchargeDetail=(PlanDetail)surchargeDetailsList.get(surchargeCount);								
								if(historySurchargeDetail.getIncludedInCalculation().equals("No")){
									historySurchargeDetail.setSurcharge(0.00);
								}	
								if(surchargeDetail.getIncludedInCalculation().equals("No")){
									surchargeDetail.setSurcharge(0.00);
								}
								double surchargeDifference = surchargeDetail.getSurcharge() - historySurchargeDetail.getSurcharge();
								double prorataSurchargeDifference = surchargeDifference * new Double(prorataFactor.toString());
								%>
							  <tr>
									<td class="FormLabels">				
									<%=surchargeDetail.getSurchargeName() %>
									</td>
								    <td class="Numeric">
										<dmshtml:CurrencyFormatTag format="<%=""+historySurchargeDetail.getSurcharge()%>"/>
									</td>
									
									<td class="Numeric">
										<dmshtml:CurrencyFormatTag format="<%=""+surchargeDetail.getSurcharge()%>"/>
									</td>									
									<td class="Numeric">
										<dmshtml:CurrencyFormatTag format="<%=""+surchargeDifference%>"/>
									</td>
									<td class="Numeric">
										<dmshtml:CurrencyFormatTag format="<%=""+prorataSurchargeDifference%>"/>
									</td>	
								</tr>
							<%}
	                     }
	                     
				}%>		
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
						
						<td class="FormLabels" width="30%" valign="middle">Endorsement Title </td>
						<td class="FormLabels" valign="top">
							<%String endTitle = "MISCELLANEOUS ENDORSEMENT"; %>
							<bean:define id="endorsementTitle" name="EndorsementDetail" property="answer(Object::QuoteAdditional::EndorsementTitle)" />
							<%if(!(""+endorsementTitle).equals("")){endTitle=""+endorsementTitle;} %>
							<html:text name="EndorsementDetail" property="answer(Object::QuoteAdditional::EndorsementTitle)" size="60" maxlength="60" value="<%=""+endTitle %>" styleId="EndorsementTitle" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr class="yui-skin-sam">
						<!--  <td class="FormLabels" width="30%" valign="middle">Endorsement Content</td>
						<td class="FormLabels" valign="top"> -->
						<td align="left" colspan="2">
						<bean:define id="endorsementDescription" name="EndorsementDetail" property="answer(Object::QuoteAdditional::EndorsementDescription)" />
							<textarea name="answer(Object::QuoteAdditional::EndorsementDescription)" id="editor" cols="110" rows="20" ><%=""+endorsementDescription%></textarea>
						</td>
					</tr>

					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input id="save" name="answer(SubmitType)" value="Save" class="sbttn" type="submit" onclick="saveHtml()">
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
	</div>
	</td></tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>
<script type="text/javascript">
renderEditor();</script>
<script type="text/javascript">dolphintabs.init('dolphinnav', 0)</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>