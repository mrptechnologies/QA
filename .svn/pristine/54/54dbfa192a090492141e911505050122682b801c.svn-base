<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
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
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
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
					<a class="" rel="Remove Insured">
					<span>Remove Additional Insured</span></a></li>
			</ul>
		</div>

		<div style="display:block;" id="Select Insured" class="innercontent">
			<html:form  action="/GetEndorsementDetailAction.go" styleId="firstForm"  onsubmit="return dolphinTabDisplay()">
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
				
					<tr>
						<td colspan="2" align="center">
						<%if(count!=0){ %>
							<html:submit value="Remove" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
						<%} %>
							
						
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
		<div style="display:none;" id="Remove Insured" class="innercontent">

			<html:form action="/SaveEndorsementDetailAction.go" styleId="ModifyAdditionalInsuredFormId">
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2" >
				<tr>
					<td>&nbsp;</td>
				</tr>
				<bean:define id="addInsType" name="EndorsementDetail" property="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" />
				<tr>
					
			<td class="FormLabels" align="left">&nbsp;&nbsp;Additional Insured Type</td>
			<td width="40%" class="FormLabelsNew" align="left">
			<%
				
				String additionalInsuredType ="";
				if((""+addInsType).equals("Y")){
					additionalInsuredType = "Additional Named Insured";
				}
				else if((""+addInsType).equals("N")){
					additionalInsuredType = "Additional Insured";
				}
							
			%>
			<%=""+ additionalInsuredType%>
			
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
			<td width="40%" class="FormLabelsNew" align="left">
					<bean:write name="EndorsementDetail" property="answer(Object::AdditionalInsured::InsuranceType)" />
			
			</td>
			</tr>
			<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Insured Name Type</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write name="EndorsementDetail" property="answer(Object::AdditionalInsured::CompanyPerson)" />
					 
		
			</td>
		</tr> 
		<tr id="insuredFirstBlock">
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Insured First Name</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::InsuredFName)"  /></td>
		</tr>
		<tr id="insuredLastBlock">
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Insured Last Name</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::InsuredLName)"  /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Insured Name *</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::InsuredName)"  /></td>
		</tr>
		<tr id="DBABlock">
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;DBA/TA</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::DBA)" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Loan/Account/Reference Number (if any)</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::LoanNumber)" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Street Number</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::StreetNumber)"  /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Street Name 1</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::StreetName)"/></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Street Name 2</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Address2)"  /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;City</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::City)" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;County Name</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::County)"  /></td>
		</tr>
		<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;State/Province*</td>
		
			<td width="40%" class="FormLabelsNew" align="left"><bean:write name="EndorsementDetail" property="answer(Object::AdditionalInsured::State)" />
				
			</td>
		</tr>
		<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Zip Code*</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property="answer(Object::AdditionalInsured::Zip)" />
			</td>
		</tr>							
		<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Country</td>
		
			<td width="40%" class="FormLabelsNew" align="left"><bean:write name="EndorsementDetail" property="answer(Object::AdditionalInsured::Country)" />
				
			</td>
		</tr>
		<tr id="CompanyFNameBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Contact First Name</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Contact::FName)"   />
			</td>
		</tr>
		<tr id="CompanyLNameBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Contact Last Name</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Contact::LName)"   />
			</td>
		</tr>
		<tr id="CompanyTitleBlock" >
			<td class="FormLabels" align="left">&nbsp;&nbsp;Contact Title</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Contact::Title)"  />
			</td>
		</tr>
		<tr>
				<td class="FormLabels" align="left">&nbsp;&nbsp;Email Address</td>
				<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Contact::EmailAddress1)"  />
				</td>
			</tr>
			
			 <tr>
				<td class="FormLabels" align="left">&nbsp;&nbsp;Phone #</td>
				<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::WorkPhoneAreaCode)"  />&nbsp;<bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::WorkPhoneExchgCode)"  />&nbsp;<bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::WorkPhone)"  /></td>
			</tr>	
			<tr>
				<td class="FormLabels" align="left">&nbsp;&nbsp;Fax #</td>
				<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::FaxAreaCode)" />&nbsp;<bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::FaxExchgCode)"  />&nbsp;<bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Fax)"  /></td>
		</tr>	
		
		<tr id="CompanywebsiteBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Company website</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write  name="EndorsementDetail" property ="answer(Object::AdditionalInsured::Contact::URL)" />
			</td>
	</tr>
			
		<tr id="FOBBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Form of Business</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write name="EndorsementDetail" property="answer(Object::AdditionalInsured::Business)" />
					
			</td>
		</tr> 
		<tr id="otherFOBBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;If Other,please Specify</td>
			<td width="40%" class="FormLabelsNew" align="left"><bean:write name="EndorsementDetail" property ="answer(Object::AdditionalInsured::OtherBusiness)" />
			</td>
		</tr>
		
		<tr><td></td></tr>
		
					<html:hidden property="answer(Object::AdditionalInsured::QuoteAdditionalInsuredId)"/>
					<html:hidden property="answer(Object::QuoteInsured::Active)" value="Y"/>
					<html:hidden property="answer(Object::AdditionalInsured::EndorsementModified)" value="Y"/>
					<html:hidden property="answer(Object::AdditionalInsured::InsuranceType)" />
					<html:hidden property="answer(Object::AdditionalInsured::AdditionalInsuredID)" />
					<bean:define id="AdditionalInsuredId_ToCheck" name="EndorsementDetail" property="answer(Object::AdditionalInsured::QuoteAdditionalInsuredId)"/>			
					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >				
					<tr>
						<td colspan="2" align="center">
						<bean:define id="insuredList" name="ADDITIONAL_INSURED_LIST" type="java.util.ArrayList" scope="request"/>
						<% int count=0;
		                		
						%>
						
						<logic:iterate id="insuredDetail" name="insuredList" type="com.dms.ejb.data.QuestionHashMap">
						<% count++; %>
						</logic:iterate>
						<%if(count!=0 && AdditionalInsuredId_ToCheck!=null && !AdditionalInsuredId_ToCheck.equals("")){ %>
							<html:submit value="Remove" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
						<%} %>
							
														
						</td>
					</tr>
					</dmshtml:dms_isPresent>
					<input id="pageForward" name="answer(Page::Action)" value="REMOVE" type="hidden"/>
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
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					<html:hidden property="answer(dolTabCheck)" styleId="dolTab"/>
						<html:hidden property="answer(isUpdated)" value="Y" />
			<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Additional Insured - Remove "%>"/>
			<html:hidden property="answer(pagename)" value="Remove Additional Insured" />
	
					
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
var isBillingAdrSame= "";
if((document.getElementById("hidIsBillingSame") != null) && (document.getElementById("hidIsBillingSame") != undefined))
	isBillingAdrSame = document.getElementById("hidIsBillingSame").value
if(isBillingAdrSame=="Y") {
	if((document.getElementById("BillingAddressSame") != null) && (document.getElementById("BillingAddressSame") != undefined))
		document.getElementById("BillingAddressSame").checked="checked";
}
else {
	if((document.getElementById("BillingAddressNotSame") != null) && (document.getElementById("BillingAddressNotSame") != undefined))
		document.getElementById("BillingAddressNotSame").checked="checked";
}

</SCRIPT>															


<script type="text/javascript">
function dolphinTabDisplay()
{
	firstForm.dolTab.value="yes";
	return true;	
}
if(firstForm.dolTab.value!="yes")
dolphintabs.init('dolphinnav',0)
else
dolphintabs.init('dolphinnav',1)

</script>




<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
<script type="text/javascript">
  </script>