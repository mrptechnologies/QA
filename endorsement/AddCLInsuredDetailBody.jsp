<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/AddCustomer.js"  type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/AddInsured.js" type="text/javascript"> </SCRIPT>
<SCRIPT type="text/javascript">

function setBillingAddress(){	

	var formElement=document.forms[0];
	if(formElement.BillingAddressSame.checked==true)
	{
	formElement.BillingStreetName.value=formElement.StreetName.value;
	formElement.BillingAddress2.value=formElement.Address2.value;
	formElement.BillingCity.value=formElement.City.value;
	formElement.BillingCounty.value=formElement.County.value;
	formElement.BillingState.value=formElement.State.value;
	formElement.BillingZip.value=formElement.Zip.value;		
	} 
}
		
	
//Notes value truncated issue
	function maxLengthTextArea() {
		var field = document.forms[0].BusinessDesc;
		if ( field.value.length > 1024 )
	  	{
	  	
	    	field.value = field.value.substring( 0, 1024 );
	    	alert( "Quote Notes value can only be 1024 characters in length." );
	    	return false;
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
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />

<table width="98%">
	
	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0" bgcolor="#C6DEEA">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
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
				      <jsp:param name="policyId" value="<%=parentPolicyId.toString()%>" />
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
			<%-- <tr>
				<td>
				<table width="60%" align="Left" border="0">
					<jsp:include page="../common/QuoteHeader.jsp">
						<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="productVerId" value="<%=""+productVerId%>" />
						<jsp:param name="heading" value="<%="ENDORSEMENT DETAIL"%>" />
					</jsp:include>
				</table>
				</td>
			</tr>--%>
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
					<a class="" rel="Add Insured">
					<span>Add Insured</span></a></li>
			</ul>
		</div>

		<div style="display:block;" id="Add Insured" class="innercontent">

			<html:form action="/SaveEndorsementDetailAction.go" onsubmit="return validateCLEndorsementIns(this)" styleId="Application1">
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2" >
					<tr>
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Named Insured*</td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::QuoteInsured::InsuredFullName)"  size="60" maxlength="120" styleClass="txtbox" styleId="InsuredName" /></td>								
								
								<bean:define id="isBillingAddressSame" name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingAddressSame)" /> 
								<html:hidden name="EndorsementDetail" property ="answer(Object::QuoteInsured::BillingAddressSamehidden)" styleId="hidIsBillingSame" value="<%=isBillingAddressSame+"" %>"/>			
								
							</tr>							
			
							<tr>
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;DBA/TA</td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::QuoteInsured::DBA)"  size="30" maxlength="60" styleClass="txtbox" styleId="DBA" /></td>
							</tr>

							 <tr>
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Form of Business</td>
								<td class="links" style="Class:txtbox">&nbsp;
								<html:select name="EndorsementDetail" property="answer(Object::QuoteInsured::Business)" styleClass="txtbox" styleId="FormOfBusiness">
										<html:option value="">Select</html:option>	
										<html:option value="Individual">Individual</html:option>		    
									    <html:option value="Corporation">Corporation</html:option>		    
									    <html:option value="Limited Corporation">Limited Corporation</html:option>		    
									    <html:option value="Partnership">Partnership</html:option>		    
									    <html:option value="Joint Venture">Joint Venture</html:option>
									    <html:option value="Government Office">Government Office</html:option>
									    <html:option value="Other">Other</html:option>
								</html:select>
								</td>
							</tr> 
							
							<tr>
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Description of Business</td>
								<td class="links">&nbsp;<html:textarea name="EndorsementDetail" property="answer(Object::QuoteInsured::BusinessDesc)" rows="3" cols="60" styleId="BusinessDesc" onkeyup="maxLengthTextArea()" /></td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Mailing Address Line1</td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property="answer(Object::QuoteInsured::StreetName)" size="24" maxlength="25" styleClass="txtbox" styleId="StreetName"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Mailing Address Line2</td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property="answer(Object::QuoteInsured::Address2)" size="24" maxlength="60" styleClass="txtbox" styleId="Address2"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="AddCustomer.City" /></td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property="answer(Object::QuoteInsured::City)" size="20" maxlength="40" styleClass="txtbox" styleId="City"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;County Name</td>
								<td class="links">&nbsp;<html:text   property="answer(Object::QuoteInsured::CountyName)" size="20" maxlength="20" styleClass="txtbox" styleId="County"/></td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="AddCustomer.State"/>*</td>
							
								<td class="links" style="Class:txtbox">&nbsp;<html:select name="EndorsementDetail" property="answer(Object::QuoteInsured::State)" styleClass="txtbox" styleId="State">
									<html:option value ="" styleClass="txtbox">Select A State</html:option>
									   		
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
									    <html:option value="VA">Virginia</html:option>
									    <html:option value="WA">Washington</html:option>
									    <html:option value="WV">West Virginia</html:option>
									    <html:option value="WI">Wisconsin</html:option>
									    <html:option value="WY">Wyoming</html:option>
										
										
									
									</html:select>
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Zip Code*</td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property="answer(Object::QuoteInsured::Zip)" size="10" maxlength="10" styleClass="txtbox" styleId="Zip" onkeyup="if(this.value.length==5) {this.value=this.value+'-'}"/>
								<!--Zipcode lookup start 05-06-2006-->
								<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=EndorsementDetail&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a></td>
								<!-- 05-06-2006 end-->																	
							</tr>
							
							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Is billing information same as above </td>				
								<td class="TextMatter">&nbsp;
									<input type="radio" name="answer(Object::QuoteInsured::BillingAddressSame)" value="Yes" onclick="setBillingAddress()" id="BillingAddressSame" >Yes&nbsp;&nbsp;&nbsp;
									<input type="radio" name="answer(Object::QuoteInsured::BillingAddressSame)" value="No" onclick="setBillingAddress()" id="BillingAddressNotSame" >No
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Billing Address Line1</td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingAddress1)" size="24" maxlength="25" styleClass="txtbox" styleId="BillingStreetName"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Billing Address Line2</td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingAddress2)" size="24" maxlength="60" styleClass="txtbox" styleId="BillingAddress2"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="AddCustomer.City" /></td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingCity)" size="20" maxlength="40" styleClass="txtbox" styleId="BillingCity"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;County Name</td>
								<td class="links">&nbsp;<html:text   property="answer(Object::QuoteInsured::BillingCounty)" size="20" maxlength="20" styleClass="txtbox" styleId="BillingCounty"/></td>
							</tr>
							
							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="AddCustomer.State"/></td>
							
								<td class="links" style="Class:txtbox">&nbsp;<html:select name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingState)" styleClass="txtbox" styleId="BillingState">
									<html:option value ="" styleClass="txtbox">Select A State</html:option>
									   		
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
									    <html:option value="VA">Virginia</html:option>
									    <html:option value="WA">Washington</html:option>
									    <html:option value="WV">West Virginia</html:option>
									    <html:option value="WI">Wisconsin</html:option>
									    <html:option value="WY">Wyoming</html:option>								
									</html:select>
								</td>
							</tr>
							<tr>
							<html:hidden property="answer(InsType)" value="CL" styleId="InsType"/>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Zip Code</td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingZip)" size="10" maxlength="10" styleClass="txtbox" styleId="BillingZip" onkeyup="if(this.value.length==5) {this.value=this.value+'-'}"/>
								<!--Zipcode lookup start 05-06-2006-->
								<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=EndorsementDetail&clear=yes&BillingCity=BillingCity&BillingCounty=BillingCounty&BillingState=BillingState&BillingZip=BillingZip" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a></td>
								<!-- 05-06-2006 end-->																	
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Bill to Loan #</td>
								<td class="links">&nbsp;<html:text  name="EndorsementDetail" property="answer(Object::QuoteInsured::BilltoLoan)" size="24" maxlength="60" styleClass="txtbox" styleId="BillToLoan"/></td>
							</tr>

					<html:hidden property="answer(Object::QuoteInsured::QuoteInsuredId)" />
					<html:hidden property="answer(Object::QuoteInsured::Active)" value="Y"/>
					<html:hidden property="answer(Object::QuoteInsured::EndorsementModified)" value="Y"/>
					<html:hidden property="answer(Object::QuoteInsured::InsuredType)" />
					<html:hidden property="answer(Object::QuoteInsured::InsuredId)" />
								
					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >				
					<tr>
						<td colspan="2" align="center">
							<input name="answer(SubmitType)" value="Save" class="sbttn" type="submit">
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
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>"/>						
					<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
					<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>" />	
					<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
				</table>
			</html:form>
		</div>
	</div>
	<%-- Endorsement Detail END --%>
	</td></tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<SCRIPT type="text/javascript">
//logic to enable billing address same check box
var isBillingAdrSame=document.getElementById("hidIsBillingSame").value
if(isBillingAdrSame=="Y")
document.getElementById("BillingAddressSame").checked="checked";
else
document.getElementById("BillingAddressNotSame").checked="checked";

</SCRIPT>															


<script type="text/javascript">dolphintabs.init('dolphinnav', 0)</script>




<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
<script type="text/javascript">
  </script>