<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<SCRIPT SRC="../Scripts/JScripts/AddCustomer.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>

<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="EndorsementDetail" property="answer(productVerId)" scope="request"/>
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
<table width="98%">
	
	<tr>
		<td  colspan="2">
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
	<tr height="5">
		<td></td>
	</tr>
	<tr>
		<td colspan="2">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
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
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
		</td>
		<%-- <td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td> --%>
	</tr>

	<tr>
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
	<div id="dolphincontainer">
		<div id="dolphinnav">
			<ul>				
				<li>
					<a class="" rel="Edit Insured">
					<span>Edit Insured</span></a></li>
			</ul>
		</div>		
			
		<div style="display:none;" id="Edit Insured" class="innercontent">

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
							<html:text property="answer(Object::QuoteInsured::InsuredFullName)" maxlength="50" styleClass="txtbox" styleId="InsuredName"/>
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
						<!-- <html:select property="answer(Object::QuoteInsured::State)" styleId="State" styleClass="txtbox">
								<html:option value="AL">Alabama</html:option>		    
							    <html:option value="AK">Alaska</html:option>		    
							    <html:option value="AS">American Samoa</html:option>
							    <html:option value="AZ">Arizona</html:option>	    
							    <html:option value="AR">Arkansas</html:option>		    
							    <html:option value="CA">California</html:option>		    
							    <html:option value="CO">Colorado</html:option>		    
							    <html:option value="CT">Connecticut</html:option>		    
							    <html:option value="DE">Delaware</html:option>		    
							    <html:option value="DC">District of Columbia</html:option>		    
							    <html:option value="FM">Federated States of Micronesia</html:option>		    
							    <html:option value="FL">Florida</html:option>		    
							    <html:option value="GA">Georgia</html:option>		    
							    <html:option value="GU">Guam</html:option>		    
							    <html:option value="HI">Hawaii</html:option>		    
							    <html:option value="ID">Idaho</html:option>		    
							    <html:option value="IL">Illinois</html:option>		    
							    <html:option value="IN">Indiana</html:option>		    
							    <html:option value="IA">Iowa</html:option>		    
							    <html:option value="KS">Kansas</html:option>	    
							    <html:option value="KY">Kentucky</html:option>		    
							    <html:option value="LA">Louisiana</html:option>		    
							    <html:option value="ME">Maine</html:option>		    
							    <html:option value="MH">Marshall Islands</html:option>		    
							    <html:option value="MD">Maryland</html:option>		    
							    <html:option value="MA">Massachusetts</html:option>		    
							    <html:option value="MI">Michigan</html:option>
							    <html:option value="MN">Minnesota</html:option>
							    <html:option value="MS">Mississippi</html:option>
							    <html:option value="MO">Missouri</html:option>
							    <html:option value="MT">Montana</html:option>
							    <html:option value="NE">Nebraska</html:option>
							    <html:option value="NV">Nevada</html:option>
							    <html:option value="NH">New Hampshire</html:option>
							    <html:option value="NJ">New Jersey</html:option>
							    <html:option value="NM">New Mexico</html:option>
							    <html:option value="NY">New York</html:option>
								<html:option value="NC">North Carolina</html:option>
							    <html:option value="ND">North Dakota</html:option>
							    <html:option value="MP">Northern Mariana Islands</html:option>
							    <html:option value="OH">Ohio</html:option>
							    <html:option value="OK">Oklahoma</html:option>
							    <html:option value="OR">Oregon</html:option>
							    <html:option value="PW">Palau</html:option>
							    <html:option value="PA">Pennsylvania</html:option>
							    <html:option value="PR">Puerto Rico</html:option>
							    <html:option value="RI">Rhode Island</html:option>
							    <html:option value="SC">South Carolina</html:option>
							    <html:option value="SD">South Dakota</html:option>
							    <html:option value="TN">Tennessee</html:option>
							    <html:option value="TX">Texas</html:option>
							    <html:option value="UT">Utah</html:option>
							    <html:option value="VT">Vermont</html:option>
							    <html:option value="VI">Virgin Islands</html:option>
							    <html:option value="VA">Virginia</html:option>-->
							    <!-- initialy the state code for washington was DC -->
							    <!--<html:option value="WA">Washington</html:option>
							    <html:option value="WV">West Virginia</html:option>
							    <html:option value="WI">Wisconsin</html:option>
							    <html:option value="WY">Wyoming</html:option>-->
								<!--<html:option value="DC">Washington</html:option>
								<html:option value="DE">Delaware</html:option>
								<html:option value="GA">Georgia</html:option>
								<html:option value="MD">MaryLand</html:option>
								<html:option value="NC">North Carolina</html:option>
								<html:option value="NJ">New Jersey</html:option>
								<html:option value="PA">Pennsylvania</html:option>
								<html:option value="SC">South Carolina</html:option>
								<html:option value="VA">Virginia</html:option>
							--><!--</html:select>--></td></tr>
					<tr>
						<td class="FormLabels" width="40%">Zip*</td>
						<td class="FormLabels" width="40%">
				         <html:hidden styleId="Zip" property="answer(Object::QuoteInsured::Zip)" />	
						<bean:write  name="EndorsementDetail" property="answer(Object::QuoteInsured::Zip)" />																												
						<!-- <a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=Application1&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>-->
						</td>
					</tr>
		<%boolean displayGeniusFields = false;%>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LIBERTY_GENIUSADDRESS"}%>' connector='or' negated="false">
		<%displayGeniusFields=true;%>
		</dmshtml:dms_static_with_connector>
		<%if(displayGeniusFields){%>
		  <tr>
				<td class="FormLabels" width="40%">
					Is Genius Address same as Business Address?
				</td>
				<td class="FormLabels" width="40%">
			      <html:radio name="EndorsementDetail" property="answer(Object::QuoteInsured::IsMailingAddressSame)" value="Y" styleId="MailingAddressSameAsBusinessAddress_Y"  onclick="disableMailingAddressBlock()" />Yes
				  <html:radio name="EndorsementDetail" property="answer(Object::QuoteInsured::IsMailingAddressSame)" value="N" styleId="MailingAddressSameAsBusinessAddress_N" onclick="enableMailingAddressBlock()" />No&nbsp;&nbsp;
				</td>
		  </tr>
		  <tr><td colspan="2">
		   <div id="MailingAddressBlock" >
             <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
               <tr>
                 <td class="FormLabels" width="40%">
					Genius Address 1
				 </td>
				 <td class="FormLabels" width="40%">
	     		   <html:text property="answer(Object::QuoteInsured::MailingAddress1)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress1"/>
	     		 </td>
			   </tr>
			   <tr>
					<td class="FormLabels" width="40%">
						Genius Address 2
					</td>
					<td class="FormLabels" width="40%">
				    	<html:text property="answer(Object::QuoteInsured::MailingAddress2)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress2" />
					</td>
				</tr>
				<tr>
					<td class="FormLabels" width="40%">
						Genius Address 3
					</td>
					<td class="FormLabels" width="40%">
				      <html:text property="answer(Object::QuoteInsured::MailingAddress3)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress3" />
					</td>
				</tr>
				<tr>
					<td class="FormLabels" width="40%">
						Genius Address 4
					</td>
					<td class="FormLabels" width="40%">
			    		<html:text property="answer(Object::QuoteInsured::MailingAddress4)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress4"/>
					</td>
				</tr><tr>
					<td class="FormLabels" width="40%">
						Genius Address 5
					</td>
					<td class="FormLabels" width="40%">
						<html:text  property="answer(Object::QuoteInsured::MailingAddress5)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress5" />
					</td>
				</tr>	
				<%}else{%>
				<tr style="display:none;">
				<td class="FormLabels" width="40%">
					Is Genius Address same as Business Address?
				</td>
				<td class="FormLabels" width="40%">
			      <html:radio name="EndorsementDetail" property="answer(Object::QuoteInsured::IsMailingAddressSame)" value="Y" styleId="MailingAddressSameAsBusinessAddress_Y"  onclick="disableMailingAddressBlock()" />Yes
				  <html:radio name="EndorsementDetail" property="answer(Object::QuoteInsured::IsMailingAddressSame)" value="N" styleId="MailingAddressSameAsBusinessAddress_N" onclick="enableMailingAddressBlock()" />No&nbsp;&nbsp;
				</td>
		  </tr>
		  <tr><td colspan="2">
		   <div id="MailingAddressBlock" >
             <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
               <tr style="display:none;">
                 <td class="FormLabels" width="40%">
					Genius Address 1
				 </td>
				 <td class="FormLabels" width="40%">
	     		   <html:text property="answer(Object::QuoteInsured::MailingAddress1)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress1"/>
	     		 </td>
			   </tr>
				<tr style="display:none;">
					<td class="FormLabels" width="40%">
						Genius Address 2
					</td>
					<td class="FormLabels" width="40%">
				    	<html:text property="answer(Object::QuoteInsured::MailingAddress2)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress2" />
					</td>
				</tr>
				<tr style="display:none;">
					<td class="FormLabels" width="40%">
						Genius Address 3
					</td>
					<td class="FormLabels" width="40%">
				      <html:text property="answer(Object::QuoteInsured::MailingAddress3)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress3" />
					</td>
				</tr>
				<tr style="display:none;">
					<td class="FormLabels" width="40%">
						Genius Address 4
					</td>
					<td class="FormLabels" width="40%">
			    		<html:text property="answer(Object::QuoteInsured::MailingAddress4)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress4"/>
					</td>
				</tr><tr style="display:none;">
					<td class="FormLabels" width="40%">
						Genius Address 5
					</td>
					<td class="FormLabels" width="40%">
						<html:text  property="answer(Object::QuoteInsured::MailingAddress5)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress5" />
					</td>
				</tr>	
				<%}%>				
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
								<input name="answer(SubmitType)" value="Save" class="sbttn" type="submit"></td></tr>
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
			</div>
							</td>
						</tr>
					</table>
				</html:form>
		</div>
			
				<%-- Endorsement Detail END --%>
	</td></tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<script type="text/javascript">
var check='<%=""+mailingAddressSameAsBusinessAddress%>';
if (check=='Y'){
	if(document.getElementById("MailingAddressSameAsBusinessAddress_Y")!= 'undefined' && document.getElementById("MailingAddressSameAsBusinessAddress_Y")!= null){
	 document.getElementById("MailingAddressSameAsBusinessAddress_Y").checked="checked";
	 document.forms[0].MailingAddress1.readOnly = true;
	 document.forms[0].MailingAddress2.readOnly = true;
	 document.forms[0].MailingAddress3.readOnly = true;
	 document.forms[0].MailingAddress4.readOnly = true;
	 document.forms[0].MailingAddress5.readOnly = true;
	}
}

if(check=='N') {
	if(document.getElementById("MailingAddressSameAsBusinessAddress_N")!= 'undefined' && document.getElementById("MailingAddressSameAsBusinessAddress_N")!= null){
	 document.getElementById("MailingAddressSameAsBusinessAddress_N").checked="checked";
	 document.forms[0].MailingAddress1.readOnly = false;
	 document.forms[0].MailingAddress2.readOnly = false;
	 document.forms[0].MailingAddress3.readOnly = false;
	 document.forms[0].MailingAddress4.readOnly = false;
	 document.forms[0].MailingAddress5.readOnly = false;
	}
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

dolphintabs.init('dolphinnav',0)

</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>

