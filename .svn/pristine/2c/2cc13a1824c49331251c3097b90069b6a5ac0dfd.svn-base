<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<SCRIPT SRC="../Scripts/JScripts/AddCustomer.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>

<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request"/>
<logic:empty name="productVerId">
	<bean:define id="productVerIdTemp" name="EndorsementDetail" property="answer(Object::Product::ProductVerId)" scope="request"/>
	<% productVerId = "" + productVerIdTemp; %>
</logic:empty>
<bean:define id="customerId" name="EndorsementDetail" property="answer(customerId)" scope="request"/>
<bean:define id="CustomerState" name="EndorsementDetail" property="answer(State)" scope="request"/>
<bean:define id="agencyId" name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" scope="request"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:define name="EndorsementDetail" id="mailingAddressSameAsBusinessAddress" property="answer(Object::QuoteInsured::IsMailingAddressSame)" />
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />
<%System.out.println("productVerId >> " + productVerId); %>
<table width="98%"   >
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
				<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
				 	<tr>
						<td align="left">				
							<jsp:include page="../common/DynamicPolicyHeaderUI3.jsp">
								<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
								<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
								<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
								<jsp:param name="prodId" value="<%=""+productId%>" />
								<jsp:param name="ProductVerId" value="<%=""+productVerId%>" />								
								<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
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
	</tr>
	
	<tr>
	</tr>

	<tr class="todotab_yellowbox">
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
	<div class="todotab_yellowbox">
		
			
		<div  id="Edit Insured" >

			<html:form action="/SaveEndorsementDetailAction.go" onsubmit="return validateEndorsementIns(this)" styleId="Application1">
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2" >

				<bean:define id="insuredTypeToCheck" name="EndorsementDetail" property="answer(Object::QuoteInsured::InsuredType)"/>

				<% 
					boolean isDisabled = false;
					if(insuredTypeToCheck.toString().equalsIgnoreCase("PRIMARY")){
						isDisabled = true;
				%>
				
				<%}%>
					<tr>
						<td class="FormLabels" width="40%">Insured Name(Last Name, First Name)*</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::QuoteInsured::InsuredFullName)" maxlength="50" size="50" styleClass="txtbox" styleId="InsuredName"/>
						</td>
					</tr>	
					
		  			<tr>
						<td class="FormLabels" width="40%">
							Insured DBA:
						</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::QuoteInsured::DBA)" maxlength="60" styleClass="txtbox"/>
						</td>
					</tr>					
					<tr>
						<td class="FormLabels" width="40%">Address 1*</td><td class="FormLabels" width="40%">
							<html:text property="answer(Object::QuoteInsured::Address1)" styleClass="txtbox" styleId="Address1"/></td></tr>


					<tr>
						<td class="FormLabels" width="40%">Address 2</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::QuoteInsured::Address2)"  styleClass="txtbox" styleId="Address2"/></td></tr>

					<tr>
						<td class="FormLabels" width="40%">City</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::QuoteInsured::City)" styleId="City" styleClass="txtbox"/></td></tr>

					<tr>
						<td class="FormLabels" width="40%">County</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::QuoteInsured::CountyName)" styleId="County" styleClass="txtbox" /></td></tr>

					<tr>
						<td class="FormLabels" width="40%">State*</td>
						<td class="FormLabels" width="40%">
						<html:hidden styleId="State" property="answer(Object::QuoteInsured::State)"/>
						<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::State)"/>						
							</td>
							</tr>
					<tr>
						<td class="FormLabels" width="40%">Zip*</td>
						<td class="FormLabels" width="40%">
				         <html:hidden styleId="Zip" property="answer(Object::QuoteInsured::Zip)" />	
						<bean:write  name="EndorsementDetail" property="answer(Object::QuoteInsured::Zip)" />																																		</td>
					</tr>
					
		  	
					<tr>
						<td class="FormLabels" width="40%">Phone #</td>
						<td class="FormLabels" width="40%">							
							<dmshtml:dms_text name="EndorsementDetail" property ="answer(Object::QuoteInsured::WorkPhoneAreaCode)" size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber1" onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}"/>&nbsp;
							<dmshtml:dms_text name="EndorsementDetail" property ="answer(Object::QuoteInsured::WorkPhoneExchangeCode)" size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber2" onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}"/>&nbsp;
							<dmshtml:dms_text name="EndorsementDetail" property ="answer(Object::QuoteInsured::WorkPhone)" size="4" maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" />
						</td>
					</tr>

					<tr>
						<td class="FormLabels" width="40%">Fax #</td>
						<td class="FormLabels" width="40%">
							<dmshtml:dms_text name="EndorsementDetail" property ="answer(Object::QuoteInsured::FaxAreaCode)" size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber1" onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber2.focus()}"/>&nbsp;
							<dmshtml:dms_text name="EndorsementDetail" property ="answer(Object::QuoteInsured::FaxExchangeCode)" size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber2" onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber3.focus()}"/>&nbsp;
							<dmshtml:dms_text name="EndorsementDetail" property ="answer(Object::QuoteInsured::Fax)" size="4" maxlength="4" styleClass="txtbox" styleId="FaxNumber3" />
						</td>
					</tr>
						
							<html:hidden property="answer(Object::QuoteInsured::QuoteInsuredId)" />
							<html:hidden property="answer(Object::QuoteInsured::Active)" value="Y"/>
							<html:hidden property="answer(Object::QuoteInsured::EndorsementModified)" value="Y"/>
							<html:hidden property="answer(Object::QuoteInsured::InsuredType)" />
							<html:hidden property="answer(Object::QuoteInsured::InsuredId)" />	
						<bean:define id="quoteInsuredId" property="answer(Object::QuoteInsured::QuoteInsuredId)" name="EndorsementDetail" />
						<%if(!quoteInsuredId.equals("")){%>
						<dmshtml:dms_isPresent property="<%=new String[]{"In Progress", "Submitted"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >				
						<tr>
							<td colspan="2" align="center">
								<input name="answer(SubmitType)" value="Save" class="covsmallbutton" type="submit"></td></tr>
						</dmshtml:dms_isPresent>
						<%}%>
						<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />

						<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>"/>
						<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />	
						<html:hidden name="EndorsementDetail" property="answer(OwnerId)" value="<%=ownerId.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::OwnerId)" value="<%=ownerId.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
						<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
						<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::IndustryName)"/>
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						<html:hidden property="answer(isUpdated)" value="Y" />
			<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Insured - Modify"%>"/>
			<html:hidden property="answer(pagename)" value=" Insured Details Modified" />			
			<html:hidden property="answer(Object::QuoteInsured::Business)"/>
			<html:hidden property="answer(Object::QuoteInsured::NameType)" name="EndorsementDetail" />
			
	
						</table>
			</html:form>
		</div>
	</div>
	<%-- Endorsement Detail END --%>
	</td></tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<script type="text/javascript">
var check='<%=""+mailingAddressSameAsBusinessAddress%>';
if (check=='Y'){
	 document.getElementById("MailingAddressSameAsBusinessAddress_Y").checked="checked";
	 document.forms[0].MailingAddress1.readOnly = true;
	 document.forms[0].MailingAddress2.readOnly = true;
	 document.forms[0].MailingAddress3.readOnly = true;
	 document.forms[0].MailingAddress4.readOnly = true;
	 document.forms[0].MailingAddress5.readOnly = true;
}

if(check=='N') {
	 document.getElementById("MailingAddressSameAsBusinessAddress_N").checked="checked";
	 document.forms[0].MailingAddress1.readOnly = false;
	 document.forms[0].MailingAddress2.readOnly = false;
	 document.forms[0].MailingAddress3.readOnly = false;
	 document.forms[0].MailingAddress4.readOnly = false;
	 document.forms[0].MailingAddress5.readOnly = false;
}
function disableMailingAddressBlock() {
     document.forms[0].MailingAddress1.readOnly = true;
     document.forms[0].MailingAddress2.readOnly = true;
     document.forms[0].MailingAddress3.readOnly = true;
     document.forms[0].MailingAddress4.readOnly = true;
     document.forms[0].MailingAddress5.readOnly = true;
}

function enableMailingAddressBlock() {
     document.forms[0].MailingAddress1.readOnly = false;
     document.forms[0].MailingAddress2.readOnly = false;
     document.forms[0].MailingAddress3.readOnly = false;
     document.forms[0].MailingAddress4.readOnly = false;
     document.forms[0].MailingAddress5.readOnly = false;
}


function dolphinTabDisplay()
{
	firstForm.dolTab.value="yes";	
}


</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
