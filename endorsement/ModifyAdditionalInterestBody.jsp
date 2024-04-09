<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>

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
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
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
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>
		</td>
		<%--<td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td>--%>
	</tr>

	<tr>
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
	<div id="dolphincontainer">
		<div id="dolphinnav">
			<ul>
				<li>
					<a class="" rel="Select Additional Interest">
					<span>Select Additional Interest</span></a></li>
				<li>
					<a class="" rel="Edit Additional Interest">
					<span>Edit Additional Interest</span></a></li>
			</ul>
		</div>

		<div style="display:block;" id="Select Additional Interest" class="innercontent">
			<html:form action="/GetEndorsementDetailAction.go" styleId="firstForm" onsubmit="return dolphinTabDisplay()" >
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2">
				<tr>
					<td class="FormLabels" width="10%">Select</td>
					<td class="FormLabels" width="20%">Type</td>
					<td class="FormLabels" width="40%">Company Name</td>
				</tr>
				<%int count = 0;%>
				<logic:present name="ADDITIONAL_INTEREST_LIST" scope="request">
				<bean:define id="addnlList" name="ADDITIONAL_INTEREST_LIST" type="java.util.ArrayList" scope="request"/>
				<logic:iterate id="addnlIntDetail" name="addnlList" type="com.dms.ejb.data.QuestionHashMap">
				<tr>
					<td class="TextMatter" width="10%">
					<bean:define id="additionalInterestId" name="addnlIntDetail" property="Object::Risk::ResProperty::AdditionalInterest::ItemDetailInterestId"/>
						<html:radio property="answer(Object::Risk::ResProperty::AdditionalInterest::ItemDetailInterestId)" styleId="<%="additionalInterestId"+count%>" value="<%=""+additionalInterestId%>" styleClass="txtbox"></html:radio>
						</td>
					<td class="TextMatter" width="20%">
						<bean:write name="addnlIntDetail" property="Object::Risk::ResProperty::AdditionalInterest::InterestType"/></td>
					<td class="TextMatter" width="40%">
						<bean:write name="addnlIntDetail" property="Object::Risk::ResProperty::AdditionalInterest::InterestCompanyName"/></td>
				</tr><%count++;%>
				</logic:iterate>
				</logic:present>
				<tr>
					<td colspan="2" align="center">
						<input name="answer(SubmitType)" value="Select" class="sbttn" type="submit"></td></tr>
				</table>
				
				<input name="answer(Page::Action)" value="SELECT" type="hidden"/>
				<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" />
				<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
				<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
				<html:hidden property="answer(dolTabCheck)" styleId="dolTab"/>
				<html:hidden property="answer(count)" styleId="totCount" value='<%=""+count%>' />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</html:form>	
		</div>
			
		<div style="display:none;" id="Edit Additional Interest" class="innercontent">

			<html:form action="/SaveEndorsementDetailAction.go" onsubmit="return validateCompName(this)" styleId="ModifyInterest">
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2" >
					<bean:define id="AdditionalInterestId" name="EndorsementDetail" property="answer(Object::Risk::ResProperty::AdditionalInterest::AdditionalInterestId)" />
					<%if(AdditionalInterestId.equals("")){%>
						<tr><td class="Error"> Please Select Additional Interest for Edit Additional Interest </td></tr>
					<%}%>

					<tr>
						<td class="FormLabels" width="40%">Additional Interest Type</td>
						<td class="FormLabels" width="40%">
						<dmshtml:get_DropDown_Values nameInSession="dropDownValues"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" lookupType="Additional_Interest_Type" ownerId='<%=ownerId+""%>' />
							<!--<html:select property="answer(Object::Risk::ResProperty::AdditionalInterest::InterestType)" styleId="InterestType" styleClass="txtbox">
								<html:option value="Mortgagee">Mortgagee</html:option>
								<html:option value="Loss Payee">Loss Payee</html:option>
								<html:option value="Others">Others</html:option>
							</html:select>-->
							
							<logic:present name="dropDownValues" scope="request">	
								<bean:define id="dropDownValues" name="dropDownValues" type="java.util.ArrayList"/>										
								<html:select property="answer(Object::Risk::ResProperty::AdditionalInterest::InterestType)" styleClass='txtbox' styleId="InterestType" >
									<%for(int i=0;i<dropDownValues.size();i++) {
										com.dms.ejb.data.QuestionHashMap dropDownMap=(com.dms.ejb.data.QuestionHashMap)dropDownValues.get(i);	
									%>
									
									<html:option value ='<%=dropDownMap.getString("DropDownValue")%>'>
									<%=dropDownMap.getString("DropDownDescription")%></html:option>										
									<%}%>
							</html:select>
								</logic:present>
						</td>
					</tr>						<td class="FormLabels" width="40%">Company Name *</td><td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::InterestCompanyName)" styleId="companyName" styleClass="txtbox"/></td></tr>

					<tr>
						<td class="FormLabels" width="40%">Loan Number</td><td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::LoanNumber)" styleId="loanNumber" styleClass="txtbox" styleId="compName"/></td></tr>
										
					<tr>
						<td class="FormLabels" width="40%">Address 1</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::Address1)" styleId="address1" styleClass="txtbox"/></td></tr>

					<tr>
						<td class="FormLabels" width="40%">Address 2</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::Address2)" styleId="address2" styleClass="txtbox"/></td></tr>

					<tr>
						<td class="FormLabels" width="40%">City</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::City)" styleId="City" styleClass="txtbox" /></td></tr>

					<tr>
						<td class="FormLabels" width="40%">County</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::CountryCode)" styleId="County" styleClass="txtbox" /></td></tr>

					<tr>
						<td class="FormLabels" width="40%">State</td>
						<td class="FormLabels" width="40%">
						
							<html:select property="answer(Object::Risk::ResProperty::AdditionalInterest::State)" styleId="State" styleClass="txtbox">
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
							    <!-- initialy the state code for washington was DC -->
							    <html:option value="WA">Washington</html:option>
							    <html:option value="WV">West Virginia</html:option>
							    <html:option value="WI">Wisconsin</html:option>
							    <html:option value="WY">Wyoming</html:option>
							    </html:select>
							    </td></tr>

					<tr>
						<td class="FormLabels" width="40%">Zip Code</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::Zip)" styleId="Zip" styleClass="txtbox"/>							
							<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=Application1&MultiplefrmWithSameName=YES&FormID=ModifyInterest&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
						</td>
					</tr>
							<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::AdditionalInterestId)" />
							<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" />
							<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::CommonAdditionalInterestId)" />
							<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::LoanNumber)" />
							<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::Active)" value="Y"/>
							<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::EndorsementModified)" value="Y"/>
							<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::CreatedBy)" value="<%=userId.toString()%>" />
							<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::UpdatedBy)" value="<%=userId.toString()%>" />
						
						<%if(!AdditionalInterestId.equals("")){%>
						<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >
							<tr>
								<td colspan="2" align="center">
									<input name="answer(SubmitType)" value="Save" class="sbttn" type="submit">&nbsp;&nbsp;&nbsp;
									<input type="reset" value="Clear" class="sbttn" name="answer(clearType)">
								</td>
							</tr>
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
						<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
						<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
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

<script type="text/javascript">

function validateCompName(formElement){
 	if(formElement.companyName.value=="" ||!formElement.companyName.value.match(/[^\s]/)){
 		alert("Please enter the Addl. Interset providing Company Name");
 		return false;
 	}
 	if(!isInteger(formElement.Zip.value)) {
			alert("Please enter the valid Zip Code ");
			return false;
	}
 	
 	return true; 	
 }
 
 function isInteger(data)
{   
	var index;
    for (index = 0; index < data.length; index++)
    {   
        // Check that current character is number.
        var c = data.charAt(index);
        if (((c < "0") || (c > "9"))) {
      
       		if(c=="-") {
       			for(i=index+1;i < data.length;i++) {
       				
       				var e = data.charAt(i);
       				if (((e < "0") || (e > "9"))) {
       					return false;
       				}
       			}
       			break;
       			
       		} else {
  	 			return false;
  	 		}
       	 }
    }
    // All characters are numbers. 
    return true;
}


function dolphinTabDisplay()
{
	var formElement=document.getElementById("firstForm");
	var totCount = formElement.totCount.value;
	var isSelected = "NO";
	
	for (var i=0;i<totCount;i++){
		if(eval("formElement.additionalInterestId"+i+".checked")==true) {
			firstForm.dolTab.value="yes";
			isSelected = "YES";
			return true;
		}
	}
	if(isSelected == "NO"){
		alert("Please select an Additional Interest.");
		return false;
	}
}
	if(firstForm.dolTab.value!="yes")
	dolphintabs.init('dolphinnav',0)
	else
	dolphintabs.init('dolphinnav',1)

</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
