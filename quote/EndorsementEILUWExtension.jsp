<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="customerId" name="UWWorkSheet" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="UWWorkSheet" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="parentQuoteId" name="UWWorkSheet" property="answer(parentQuoteId)" scope="request" />
<bean:parameter name="answer(policyNumber)" id="policyNumber" />
<bean:parameter name="answer(Object::Policy::ParentPolicyId)" id="parentPolicyId" />
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="parentPolicyVerId" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="prodId" name="UWWorkSheet" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="paretQuoteStatus" name="parentQuoteDetail" property="quoteStatus" scope="request"/>
<bean:define id="ProductId" name="UWWorkSheet" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="uwId" name="UWWorkSheet" property="answer(Object::Quote::IssuanceUnderwriterId)" />
<bean:define id="objectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/> 
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
<bean:define id="productVerId" name="UWWorkSheet" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="subQuoteId" name="UWWorkSheet" property="answer(Object::Quote::Id)" />
<bean:define id="subQuoteVerId" name="UWWorkSheet" property="answer(Object::Quote::QuoteVerId)" />
<bean:define id="quoteStartDate" name="UWWorkSheet" property="answer(Object::Quote::QuoteStartDate)" />
<bean:define id="CustomerState" name="UWWorkSheet" property="answer(Object::Quote::CustomerState)" />
<bean:define id="prevSubQuoteVerId" name="UWWorkSheet" property="answer(prevSubQuoteVerId)" />

<%boolean isRenewal = false; %>
<%String strParetQuoteVerId="";%>
<% String isRenewalEndorsement ="";%>
<dmshtml:IsRenewalEndorsement productId='<%=""+ProductId%>'dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId)%>" ></dmshtml:IsRenewalEndorsement>
  <% isRenewalEndorsement = (String) request.getAttribute("isRenewalEndorsement"); 
 		if(isRenewalEndorsement.equals("Y")){ 
  %>	
  <html:hidden property="answer(isRenewalEndorsement)"  styleId="isRenewalEndorsement" value="YES" />
  <html:hidden property ="answer(isRenewalWorkSheetSave)" value ="YES" />
  <%}else{ %>
  	<html:hidden property="answer(isRenewalEndorsement)" styleId="isRenewalEndorsement" value="NO" />
  <%} %>
	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0" bgcolor="#C6DEEA">
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
		<td  colspan=2>
			<table width="100%" align="center" border="0" >
				<tr>
					<td class="NewSectionHead" align="center">UNDERWRITER WORKSHEET</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<table WIDTH="100%" BORDER="0"  align="center">
			 	<tr>
					<td>				
					<%if(isRenewalEndorsement.equals("Y")){ 
							isRenewal = true;%>
						<jsp:include page="../common/DynamicPolicyHeader.jsp">
							<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
							<jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
							<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
							<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
							<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
						</jsp:include>
					<%} else { %>
						<jsp:include page="../common/DynamicPolicyHeader.jsp">
							<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
							<jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
							<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
							<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
						</jsp:include>
					<%} %>
					 </td>
			  	</tr>
			</table>  	 								
		</td>
	</tr>


	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<tr>
				<td>
			<jsp:include page="../common/EndorsementQuoteHeader.jsp">
				<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
				<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
			</jsp:include>
		</td>
		</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<table width="764px" align="Left" border="0" >
				<tr>
					<td width="25%" align="Left" class="links">
						<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>" title="<bean:message key='ToolTip.UWWorksheet.QuoteSummary'/>">Quote Summary</a>
					</td>
						<logic:present name="parentQuoteDetail" scope="request">
							<bean:define id="paretQuoteVerId" name="parentQuoteDetail" property="quoteVerId"/>
							<%strParetQuoteVerId=paretQuoteVerId.toString();%>
								


							<html:hidden name="UWWorkSheet" property="answer(parentQuoteVerId)" value="<%=""+paretQuoteVerId%>"/>
							<html:hidden name="UWWorkSheet" property="answer(Object::Quote::ParentQuoteVerId)" value="<%=paretQuoteVerId.toString()%>" />
						</logic:present>



					<logic:present name="parentQuoteDetail" scope="request">
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bind","Bound","Lapsed","Referred","Issued","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<%isRenewal=true; %>
					</dmshtml:isFeatureAvailableForProductRoleStatus>	
					<%String isRenewalEndorsementnew="";%>
					<%if(isRenewalEndorsement.equals("Y")){ 
						isRenewalEndorsementnew="YES";
					}
					%>
					
					<td width="60%" class="links" align="left">
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+ProductId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
														property='<%=new String[]{"Sold","Offered","Bind Request","Accepted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
																
						   <a href="../VerifySubjectivityforEILProposal.go?TabPanelName=Quote_Panel&answer(DocumentType)=PROPOSAL&answer(Object::Quote::QuoteType)=ENDORSEMENT&answer(QuoteId)=<%= ""+parentQuoteId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Quote::ProductId)=<%=""+ProductId%>&answer(isRenewalEndorsement)=YES&answer(Object::Quote::ProductVerId)=<%= productVerId.toString() %>&answer(Object::Quote::QuoteVerId)=<%= ""+strParetQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&answer(subQuoteVerId)=<%=subQuoteVerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(EffectiveDate)=<%=""+quoteStartDate%>&answer(isRenewalEndorsement)=<%=""+isRenewalEndorsementnew%>&answer(Object::UserDetail::roleName)=<%=""+roleName%>&answer(Object::UserDetail::PrimaryObjectId)=<%=""+uwId%>&answer(Object::UserDetail::PrimaryObjectType)=<%=""+objectType%>" title="<bean:message key='ToolTip.UWWorksheet.CreateRenewalProposal'/>" id="Renewal_PDF">
							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><html:button styleClass="linkButton" style="width:35%" property="answer(renewalPDF)" value="Create Renewal Quote" onclick="window.location=document.getElementById('Renewal_PDF')"/></a>
														
				   </dmshtml:isFeatureAvailableForProductRoleStatus>
						
					</td>
					
					</logic:present>
					
					<td width="20%" class="links" align="left">
						<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(ProductId.toString())%>" featureName="Member_Based_Rate" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+CustomerState%>" >			
							<a href="../GetRateCalc.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=request.getParameter("answer(parentQuoteId)")%>&parentQuoteId=<%=request.getParameter("answer(parentQuoteId)")%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&subQuotePlanName=<%=""+ProductId%>&rateType=member_rates" >&nbsp;Member</a> 
						</dmshtml:dms_HasFeature_Available_InProduct>

						<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(ProductId.toString())%>" featureName="Employee_Based_Rate" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+CustomerState%>" >	
							<a href="../GetRateCalc.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=request.getParameter("answer(parentQuoteId)")%>&parentQuoteId=<%=request.getParameter("answer(parentQuoteId)")%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&subQuotePlanName=<%=""+ProductId%>&rateType=employee_rates" >Employee</a>
						</dmshtml:dms_HasFeature_Available_InProduct>
					</td>
					
					<% if (isRenewal) {%>
					<dmshtml:dms_isPresent property='<%=new String[]{"Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td width="20%" align="Left" class="links">
							<a href="../ReactivateQuoteUI3.do?TabPanelName=Quote_Panel&answer(Object::Quote::QuoteType)=ENDORSEMENT&answer(productId)=<%=""+ProductId %>&answer(productVerId)=<%=""+productVerId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(prevSubQuoteVerId)=<%=prevSubQuoteVerId.toString()%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(isRenewalEndorsement)=<%=""+isRenewal%>" title="<bean:message key='ToolTip.UWWorksheet.Reactivate'/>" id="Reactivate_Quote"><html:button styleClass="linkButton" property="answer(reactivateQuote)" value="Reactivate" onclick="window.location=document.getElementById('Reactivate_Quote')"/></a>
						</td>
					</dmshtml:dms_isPresent>
				
					<dmshtml:dms_isPresent property='<%=new String[]{"In Progress","Referred"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td width="20%" align="Left" class="links">
							<a href="../DeclineQuote.do?TabPanelName=Quote_Panel&answer(Object::Quote::QuoteType)=ENDORSEMENT&answer(productId)=<%=""+ProductId %>&answer(productVerId)=<%=""+productVerId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(prevSubQuoteVerId)=<%=prevSubQuoteVerId.toString()%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(isRenewalEndorsement)=<%=""+isRenewal%>&paretQuoteStatus=<%=""+paretQuoteStatus %>" title="<bean:message key='ToolTip.UWWorksheet.Decline'/>" id="Decline_Quote"><html:button styleClass="linkButtonMid" property="answer(declineQuote)" value="Decline this Quote" onclick="window.location=document.getElementById('Decline_Quote')"/></a>
						</td>
					</dmshtml:dms_isPresent>
					<%}%>
					<td width="20%" >
						&nbsp;
					</td>
					<td width="20%" >
						&nbsp;
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<logic:present name="MESSAGE_LIST" scope="request">
		<tr>
			<td class="Error">						
				<ol>
						<logic:iterate id="message" name="MESSAGE_LIST">
							<li><bean:write name="message"/></li>
						</logic:iterate>
				</ol>			
													
			</td>
		</tr>
	</logic:present>	