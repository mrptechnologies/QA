<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AddAdditionalInsured.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>

<SCRIPT type="text/javascript">


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
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>" title="<bean:message key='ToolTip.AdditionalInsuredAdd.QuoteSummary'/>">Quote Summary</a>			
		</td>
		<%-- <td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td> --%>
	</tr>
	<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="CUSTOMER_NAME_LENGTH" />
	<%
	  String nameFieldLength =(String) request.getAttribute("paramValue");
	if (nameFieldLength.length() <= 0 && nameFieldLength == null){
		 nameFieldLength = "60";								   
	  }
	
	%>
	<tr>
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
	<div id="dolphincontainer">
		<div id="dolphinnav">
			<ul>
				<li>
					<a class="" rel="Select Insured">
					<span>Select Additional Insured</span></a></li>
				<li>
					<a class="" rel="Edit Insured">
					<span>Add/Edit Additional Insured</span></a></li>
			</ul>
		</div>

		<div style="display:block;" id="Select Insured" class="innercontent">
			<html:form  action="/GetEndorsementDetailAction.go" styleId="firstForm"  onsubmit="return dolphinTabDisplay()" >
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2">
				<tr>
					<td class="FormLabels" width="10%">Select</td>
					<td class="FormLabels" width="20%">Type</td>
					<td class="FormLabels" width="40%">Additional Insured Name</td>
					
				</tr>
				<logic:present name="ADDITIONAL_INSURED_LIST" scope="request">
				<bean:define id="insuredList" name="ADDITIONAL_INSURED_LIST" type="java.util.ArrayList" scope="request"/>
				<% int count=0;
                   String selected="false"; 				
				%>
				<%String InsuredType = ""; %>
				<logic:iterate id="insuredDetail" name="insuredList" type="com.dms.ejb.data.QuestionHashMap">
				<% count++; 
				if(count==1){
					selected="true";
				}
				else{
					selected="false";
				}
				%>
			<%-- 	<bean:define id="IsModified" name="insuredDetail" property="Object::QuoteInsured::EndorsementModified"/> 
				<bean:define id="insuredType" name="insuredDetail" property="Object::AdditionalInsured::InsuranceType"/>
			    <%InsuredType = ""+insuredType;%>    
			    
			    <% 
					String styleClass="";
					if ((IsModified.toString()).equalsIgnoreCase("Y")){						     
						styleClass = "error";
					}
					else{
						styleClass = "TextMatter";	
					}
				%>  --%>
				<% String styleClass = "TextMatter";	 %>
			    <tr>
				    <td class=<%= styleClass %> width="10%">
				    	<bean:define id="quoteInsuredId" name="insuredDetail" property="Object::AdditionalInsured::QuoteAdditionalInsuredId"/>			     	
				     	<input type="radio"  name="answer(Object::AdditionalInsured::QuoteAdditionalInsuredId)" value="<%=""+quoteInsuredId %>" styleClass="txtbox" checked="<%= selected %>">
				     </td>
				     
					 <td class=<%= styleClass %> width="20%">
					 	<bean:write name="insuredDetail" property="Object::AdditionalInsured::InsuranceType"/>
					 </td>
					 <td class=<%= styleClass %> width="40%">
						<bean:write name="insuredDetail" property="Object::AdditionalInsured::InsuredName"/>
					</td>
				</tr>
				</logic:iterate>
				<html:hidden property="answer(Object::Activity::ActivityMsg)" value="<%="Added Additional Insured "%>"/>
	
					<tr>
						<td colspan="2" align="center">
						<%if(count!=0){ %>
						<span title="<bean:message key='ToolTip.AdditionalInsuredAdd.Edit'/>"><html:submit value="Edit" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/></span> &nbsp;&nbsp;&nbsp;&nbsp;
						<html:hidden property="answer(Object::Activity::ActivityMsg)" value="<%="Edited Additional Insured "%>"/>
	
						<%} %>
							<span title="<bean:message key='ToolTip.AdditionalInsuredAdd.Add'/>"><html:button value="Add" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" onclick="forwardControl()"/></span>
							
						</td>
						
							
					
					</tr>

				</logic:present>

				</table>
				<input id="pageForward" name="answer(Page::Action)" value="SELECT" type="hidden"/>
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
				<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>
				<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />				
				<html:hidden property="answer(dolTabCheck)" styleId="dolTab"/>
				<html:hidden name="EndorsementDetail" property="answer(OwnerId)" value="<%=ownerId.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(Object::AdditionalInsured::OwnerId)" value="<%=ownerId.toString()%>"/>				
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
				<html:hidden styleId="clearForm" name="EndorsementDetail" property="answer(Object::AdditionalInsured::Flag)" />
			</html:form>	
		</div>
			
		<div style="display:none;" id="Edit Insured" class="innercontent">

			<html:form action="/SaveEndorsementDetailAction.go" onsubmit="return ValidateEndorsement();" styleId="ModifyAdditionalInsuredFormId">
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2" >
				<tr>
					<td>&nbsp;</td>
				</tr>
					<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Additional Insured Type</td>
			<td class="FormLabels">
			 <html:radio name="EndorsementDetail" onclick="callShowInsuredInformation()" property="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" value="N" styleId="insured" > </html:radio>
			Additional Insured&nbsp;&nbsp;&nbsp;&nbsp;
			
			 <html:radio name="EndorsementDetail" onclick="callShowInsuredInformation()" property="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" value="Y" styleId="namedInsured" > </html:radio>Additional Named Insured
			</td>
			</tr>
			
			<dmshtml:GetParameterByOwnerId nameInSession="isWaivaerOfSurogationRequired" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="INSURED_REQUIRED_WAIVER_OF_SUROGATION" />	
			<dmshtml:GetParameterByOwnerId nameInSession="isPrimaryContributoryRequired" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="INSURED_REQUIRED_PRIMARY_CONTRIBUTORY" />					
			<%
			String isWaivaerOfSurogationRequired =(String) request.getAttribute("isWaivaerOfSurogationRequired");
			String isPrimaryContributoryRequired =(String) request.getAttribute("isPrimaryContributoryRequired");					
			%>
						
			<tr>
			<dmshtml:get_type nameInSession="arStates"  dcdObjectType="INSURED_TYPE" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>

			<td class="FormLabels" align="left">&nbsp;&nbsp;Insured  Type *</td>
			<td class="links" style="Class:txtbox">
			
			<dmshtml:get_DropDown_Values nameInSession="dropDownValues"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" lookupType="Additional_Insured_Type" ownerId='<%=ownerId+""%>' />
	

			<logic:present name="dropDownValues" scope="request">	
			<bean:define id="dropDownValues" name="dropDownValues" type="java.util.ArrayList"/>										
			<html:select name="EndorsementDetail" property="answer(Object::AdditionalInsured::InsuranceType)"  styleClass='txtbox' styleId="AdditionalInsuredType" >
			<%for(int i=0;i<dropDownValues.size();i++) {
				com.dms.ejb.data.QuestionHashMap dropDownMap=(com.dms.ejb.data.QuestionHashMap)dropDownValues.get(i);	
			%>

			<html:option value ='<%=dropDownMap.getString("DropDownValue")%>'>
			<%=dropDownMap.getString("DropDownDescription")%></html:option>										
			<%}%>
			</html:select>
			</logic:present>

			</td>
			</tr>
			
		<tr>
			<%if (isPrimaryContributoryRequired.equalsIgnoreCase("YES")){ %>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Primary and Contributory Wording</td>
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="EndorsementDetail" property="answer(Object::AdditionalInsured::IsPrimaryAndContributoryWording)" styleClass="txtbox" styleId="IsPrimaryAndContributoryWording">
					<html:option value="N">No</html:option>	
					<html:option value="Y">Yes</html:option>	 
				    	    
				    
			</html:select>
			<%} %>
			</td>
		</tr>	
		<tr>
			<%if (isWaivaerOfSurogationRequired.equalsIgnoreCase("YES")){ %>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Waiver of Subrogation</td>
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="EndorsementDetail" property="answer(Object::AdditionalInsured::IsWaiverOfSubrogation)" styleClass="txtbox" styleId="IsWaiverOfSubrogation">
					<html:option value="N">No</html:option>	
					<html:option value="Y">Yes</html:option>	 
				</html:select>
			<%} %>	
			</td>
		</tr>		
			<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Insured Name Type</td>
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="EndorsementDetail" property="answer(Object::AdditionalInsured::CompanyPerson)" styleClass="txtbox" styleId="CompanyPerson" onchange="showCompanyInformation(this.form)">
					 <html:option value ="Person" styleClass="txtbox">Person</html:option>
				     <html:option value ="Company" styleClass="txtbox">Company</html:option>
			</html:select>
			</td>
		</tr> 
		<tr id="insuredFirstBlock">
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Insured First Name</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::InsuredFName)" size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredFName" /></td>
		</tr>
		<tr id="insuredLastBlock">
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Insured Last Name</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::InsuredLName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredLName" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Insured Name *</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::InsuredName)" size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName" /></td>
		</tr>
		<tr id="DBABlock">
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;DBA/TA</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::DBA)" size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="DBA" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Loan/Account/Reference Number (if any)</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::LoanNumber)" styleClass="txtbox" styleId="LoanNumber" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Street Number</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::StreetNumber)" styleClass="txtbox" styleId="StreetNumber" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Street Name 1</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::StreetName)" size="60" maxlength="50" styleClass="txtbox" styleId="Street2" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Street Name 2</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Address2)" size="60" maxlength="50" styleClass="txtbox" styleId="Street2" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;City</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::City)" size="20" maxlength="40" styleClass="txtbox" styleId="City" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;County Name</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::County)" size="20" maxlength="20" styleClass="txtbox" styleId="County" /></td>
		</tr>
		<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;State/Province*</td>
		
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="EndorsementDetail" property="answer(Object::AdditionalInsured::State)" styleClass="txtbox" styleClass="txtbox" styleId="State">
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
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property="answer(Object::AdditionalInsured::Zip)" size="10" maxlength="10" styleClass="txtbox" styleId="Zip" onkeyup="if(this.value.length==5) {this.value=this.value}"/>
			<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&MultiplefrmWithSameName=YES&FormID=ModifyAdditionalInsuredFormId&FormName=EndorsementDetail&clear=yes&PopupWindowName=Zip Code Search" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a></td>
			<!-- 05-06-2006 end-->																	
		</tr>							
		<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Country</td>
		
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="EndorsementDetail" property="answer(Object::AdditionalInsured::Country)" styleClass="txtbox" styleId="Country">
				<html:option value ="USA" styleClass="txtbox">United States</html:option>									   		   
				</html:select>
			</td>
		</tr>
		<tr id="CompanyFNameBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Contact First Name</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Contact::FName)"  size="65" maxlength="<%=nameFieldLength%>"  styleClass="txtbox" styleId="ContactFirstName" />
			</td>
		</tr>
		<tr id="CompanyLNameBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Contact Last Name</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Contact::LName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="ContactLastName" />
			</td>
		</tr>
		<tr id="CompanyTitleBlock" >
			<td class="FormLabels" align="left">&nbsp;&nbsp;Contact Title</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Contact::Title)"  size="4" styleClass="txtbox" styleId="ContactTitle" />
			</td>
		</tr>
		<tr>
				<td class="FormLabels" align="left">&nbsp;&nbsp;Email Address</td>
				<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Contact::EmailAddress1)" onblur="checkEmailAddress(this.form)" size="30"  styleClass="txtbox" styleId="emailID" />
				</td>
			</tr>
			
			 <tr>
				<td class="FormLabels" align="left">&nbsp;&nbsp;Phone #</td>
				<td class="links">&nbsp;<dmshtml:dms_text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::WorkPhoneAreaCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber1"  onkeyup="if(this.value.length==3) {document.forms[1].PhoneNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::WorkPhoneExchgCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber2" onkeyup="if(this.value.length==3) {document.forms[1].PhoneNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::WorkPhone)"  size="4" maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" /></td>
			</tr>	
			<tr>
				<td class="FormLabels" align="left">&nbsp;&nbsp;Fax #</td>
				<td class="links">&nbsp;<dmshtml:dms_text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::FaxAreaCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber1" onkeyup="if(this.value.length==3) {document.forms[1].FaxNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::FaxExchgCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber2" onkeyup="if(this.value.length==3) {document.forms[1].FaxNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Fax)"  size="4" maxlength="4" styleClass="txtbox" styleId="FaxNumber3"/></td>
		</tr>	
		
		<tr id="CompanywebsiteBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Company website</td>
			<td class="links">&nbsp;<html:text  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Contact::URL)"  size="30" styleClass="txtbox" styleId="CompanyWebSite" />
			</td>
	</tr>
			
		<tr id="FOBBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Form of Business</td>
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="EndorsementDetail" property="answer(Object::AdditionalInsured::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.form)">
					<html:option value="">Select</html:option>	 
				    <html:option value="Corporation">Corporation</html:option>		    
				    <html:option value="Sole Proprietor">Sole Proprietor</html:option>		    
				    <html:option value="Partnership">Partnership</html:option>		    
				    <html:option value="Joint Venture">Joint Venture</html:option>
				    <html:option value="Other">Other</html:option>
			</html:select>
			</td>
		</tr> 
		<tr id="otherFOBBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;If Other,please Specify</td>
			<td class="links">&nbsp;<html:textarea name="EndorsementDetail" property ="answer(Object::AdditionalInsured::OtherBusiness)" rows="4" cols="60" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
			</td>
		</tr>
		
		<tr><td>&nbsp;</td></tr>
		
					<html:hidden property="answer(Object::AdditionalInsured::QuoteAdditionalInsuredId)"/>
					<html:hidden property="answer(Object::QuoteInsured::Active)" value="Y"/>
					<html:hidden property="answer(Object::AdditionalInsured::EndorsementModified)" value="Y"/>
					<html:hidden property="answer(Object::AdditionalInsured::InsuranceType)" />
					<html:hidden property="answer(Object::AdditionalInsured::AdditionalInsuredID)" />
								
					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >				
					<tr>
						<td colspan="2" align="center">
							<html:submit value="Save" property="amswer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							&nbsp;&nbsp;&nbsp;
							<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							
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
					<html:hidden name="EndorsementDetail" property="answer(Object::AdditionalInsured::OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::AdditionalInsured::EndorsementModified)" value="Y" />
					<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>" />	
					<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden property="answer(isUpdated)" value="Y" />
			<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Additional Insured - Add/Edit "%>"/>
			<html:hidden property="answer(pagename)" value="Additional Insured" />
			<html:hidden  name="EndorsementDetail" property="answer(Object::AdditionalInsured::IsAddedInQuote)" value="Y" />
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					<html:hidden property="answer(dolTabCheck)" styleId="dolTab"/>
					
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
function callShowInsuredInformation(){
	var formElement = document.forms[1];
	if(formElement.namedInsured.checked){
		showInsuredInformation('Y');
 	}else{
 		showInsuredInformation('N');
 	}	
 	showCompanyInformation(formElement);
 }

</script>
<script type="text/javascript">
callShowInsuredInformation();
function dolphinTabDisplay()
{
	firstForm.dolTab.value="yes";	
	callShowInsuredInformation();
}

function forwardControl()
{
	firstForm.dolTab.value="yes";
	document.getElementById("clearForm").value = "-1";
	if(document.getElementById("pageForward")!=null && document.getElementById("pageForward")!=undefined){
	document.getElementById("pageForward").value = "ADD";
	}
	document.getElementById("firstForm").submit();
}
if(firstForm.dolTab.value!="yes")
dolphintabs.init('dolphinnav',0)
else
dolphintabs.init('dolphinnav',1)

</script>




<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
<script type="text/javascript">
  </script>