<% 
/**
 * Copyright 2002-2010 of Solartis Inc, USA .
 * All Rights Reserved.
 * This software is confidential and proprietary information of Solartis,Inc, USA.
 * This should not be used without proper agreement signed with Solartis Inc,USA.
 */
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>

<jsp:include page="../common/autoCompleteScript.jsp">
<jsp:param name="autoCompleteSqlLookupName" value="AUTOCOMPLETEZIPCODEADDEDITEMPLOYER" />
</jsp:include>

<style type="text/css">

#ZipCode {
    width:8em; /* set width here or else widget will expand to fit its container */
    z-index: 140;
}

#myContainer {
    width:26em; /* set width here or else widget will expand to fit its container */
    padding-bottom:1em;
    z-index: 140;
}
</style>
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"> </SCRIPT>
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/build/datatable/assets/skins/sam/datatable.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/build/autocomplete/assets/skins/sam/autocomplete.css" />
<script type="text/javascript" src="../Scripts/YUI/build/yahoo-dom-event/yahoo-dom-event.js"></script>

<script type="text/javascript" src="../Scripts/YUI/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/datasource/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/event-delegate/event-delegate-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/animation/animation-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/autocomplete/autocomplete-min.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css" />
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/PolicySummaryNonBTA.js"></script>

<%
long lngAgencyId=0;
long lngAgentId=0;
%>
<% Date  myDate = Calendar.getInstance().getTime();
		   DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		   String today = formatter.format(myDate);%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<html:form action="/createPolicyValidationNonBTA.do" method="post" onsubmit="javascript:return validateNonBTAPolicyDetails(this);">





<table>
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
</table>
<div class="formpageinsured1">
	<div class="todotab_yellowbox">
	<div class="formhead">
	<h2 class="left">Policy Details</h2>
	</div>
	
<bean:define id="CustomerId"  name="AddCustomer" property="answer(Object::Customer::CustomerId)" ></bean:define>
<bean:define id="objectId" property="answer(Object::Quote::primaryEntityId)" name="AddCustomer" scope="request"/>
<bean:define id="userId" property="answer(Object::Quote::CreatedBy)" name="AddCustomer" scope="request"/> 

<dmshtml:Get_Customer_HeaderDetail_ByCustomerId
	nameInSession="customerMap" customerId='<%=""+CustomerId%>'
	dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
<bean:define id="customerDetailMap" name="customerMap" scope="request" type="com.dms.ejb.data.QuestionHashMap" /> 
<% String EmpGrpState=customerDetailMap.getString("Object::Customer::State");%>

<html:hidden property="answer(OwnerId)" value='<%=ownerId+""%>'/>
<html:hidden property="answer(Object::CustomerAdditional::ProgramName)" value="NON BTA"/>
<html:hidden property="answer(createQuoteEffectiveDate)" value="yes"/>
<html:hidden property="answer(Object::Quote::primaryEntityId)" value="<%=objectId.toString()%>"/>
<html:hidden property="Object::Quote::OwnerId" value='<%=ownerId+""%>'/>
<html:hidden property="answer(Object::Quote::CreatedBy)" value='<%=userId+""%>'/>
<html:hidden property="formName" value="form::GETCLQUOTEDETAILS"/> 
<html:hidden property="answer(State)" value='<%=EmpGrpState+""%>'/>
<html:hidden property="answer(Object::Risk::RiskId)" value="15"/>
<html:hidden property="answer(Object::Quote::QuoteStartDate)" value='<%=today+""%>'/>
<html:hidden property="answer(Object::Quote::NewQuote)" value="YES"/>
<html:hidden property="TabPanelName" value="Quote_Panel"/>
<html:hidden property="Object::Quote::QuoteStatus" value="In Progress"/>
<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=CustomerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
 <logic:present name="customerDetail1" scope="request">
  <bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
  <%try{
		lngAgencyId=Long.parseLong(customerDetailMap.getString("agencyid"));
		}catch(Exception nfe) {lngAgencyId=0;    }
		try{
		lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
		}catch(Exception nfe) {lngAgentId=0;    }%>
</logic:present>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=CustomerId.toString()%>"/>
<html:hidden property="customerId" value="<%=CustomerId.toString()%>"/>
	<br>

<table WIDTH="90%" BORDER="0" ALIGN="center" CELLSPACING="0" CELLPADDING="4" >
       <tr class="field">
				<td width="45%" align="left"><font color="red">*&nbsp;Insured Name:</font></td>
				<td width="55%" align="left"><html:text property="answer(Object::Customer::CustomerName)" styleClass="txtbox" size="45" name="AddCustomer" maxlength="200" styleId="InsuredName" /></td>
	   </tr>
	   <tr class="field">
				<td width="45%"  align="left"><font color="red">*&nbsp;Insured Address 1:</font></td>
				<td width="55%" align="left"><html:text property="answer(Object::Customer::StreetName)" styleClass="txtbox" size="45" name="AddCustomer" maxlength="200" styleId="InsuredAddress1" /></td>
	   </tr>	
		<tr class="field">
				<td width="45%"  align="left">Insured Address 2:</td>
				<td width="55%" align="left"><html:text property="answer(Object::Customer::Address2)" styleClass="txtbox" size="45" name="AddCustomer" maxlength="200" styleId="InsuredAddress2" /></td>
	   </tr>
	   <tr class="field">
				<td width="45%"  align="left">Insured Address 3:</td>
				<td width="55%" align="left"><html:text property="answer(Object::Customer::Address3)" styleClass="txtbox" size="45" name="AddCustomer" maxlength="200" styleId="InsuredAddress3" /></td>
	   </tr>
	   <tr class="field">
				<td width="45%"  align="left"><font color="red">*&nbsp;Insured Address City:</font></td>
				<td width="55%" align="left"><html:text property="answer(Object::Customer::City)" styleClass="txtbox" size="45" name="AddCustomer" maxlength="200" styleId="City" /></td>
	   </tr>
	   <tr class="field">
				<td width="45%"  align="left"><font color="red">*&nbsp;Insured Address State:</font></td>
				<td width="55%" align="left"><dmshtml:get_type nameInSession="arStates" dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
					<html:select styleClass="widthText" property="answer(Object::Customer::State)" styleClass="txtbox" style="width:290px" styleId="State" name="AddCustomer">
						<html:option value ="">Select</html:option>
			        		<logic:present name="arStates" scope="request">
			          		<logic:iterate id="details" name="arStates" scope="request" >
					 	    <bean:define id='test' name="details"  property="typeDesc" />
					  		<html:option value ='<%=test.toString()%>'>
					       	<bean:write name="details" property="dmsType" />
					   		</html:option>
							</logic:iterate>
							</logic:present>
					</html:select></td>
	   </tr>
	   <tr class="field">
				<td width="45%"  align="left">Insured Address County:</td>
				<td width="55%" align="left"><html:text property="answer(Object::Customer::County)" styleClass="txtbox" size="45" name="AddCustomer" maxlength="200" styleId="County" /></td>
	   </tr>
	   <tr width="20%" class="field">
				<td width="45%" align="left" id="zipcodeAutoComplete" ><font color="red">*&nbsp;Insured Address Zip Code:</font></td>
				<td align="left"><html:hidden property="autoCompleteSqlLookupName" styleId="zipLookupName" value="AUTOCOMPLETEZIPCODEALLSTATES"/><html:text name="AddCustomer" property="answer(Object::Customer::Zip)" maxlength="10" style="width:120px;" size="45" styleClass="txtbox" styleId="Zip" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <div  id="zipAutoCompleteResContainer" class="field" style="text-align:left; float:left;"></div><a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search"
					title="Search for zip code, state, county"
					onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG
					SRC="../Images/FindZipCode.jpg" BORDER="0" align="top"
					ALT="Search for Zip code, City, State and County."/></a></td>
	   </tr>
	   
	     <tr class="field">
				<td width="45%" align="left">New Business, Renewal:</td>
				<td width="55%" align="left">
					<html:radio value="NonBTANewBusiness" name="AddCustomer" property="answer(Object::Policy::BusinessType)" styleId="NewBusiness"/>New Business
					<html:radio value="NonBTARenewal" name="AddCustomer" property="answer(Object::Policy::BusinessType)"/>Renewal
					
				</td>
	       </tr> 
	       <tr class="field">
				<td width="45%" align="left"><font color="red">*&nbsp;Policy Number Prefix:</font></td>
				<td width="55%" align="left">
					<html:select property="answer(Object::Policy::PolicyNumberPrefix)" styleId="PolicyNumberPrefix" name="AddCustomer" styleClass="txtbox" style="width:340px">
						<html:option value="">Select</html:option>
						<html:option value="BTA">BTA - Business Travel Accident</html:option>
						<html:option value="STA">STA - Student Travel Accident</html:option>
						<html:option value="SPR">SPR - Special Risk</html:option>
						<html:option value="PAI">PAI - Personal Accident (Vol)</html:option>
						<html:option value="PAB">PAB - Personal Accident  Basic/Carve Out (Mandatory)</html:option>
						<html:option value="ITA">ITA - International Travel Accident</html:option>
						<html:option value="ASN">ASN - Association</html:option>
					</html:select>
				</td>
	       </tr>  
	       <tr class="field">
				<td width="45%" align="left"><font color="red">*&nbsp;Policy Number:</font></td>
				<td width="55%" align="left">
					<html:text property="answer(Object::Policy::PolicyNumber)" size="45" styleClass="txtbox" maxlength="6" styleId="PolicyNumber" name="AddCustomer" />
				</td>
	       </tr> 
	        <tr class="field">
				<td width="45%" align="left"><font color="red">*&nbsp;Master Policy Type:</font></td>
				<td width="55%" align="left">
					<html:select property="answer(Object::Policy::MasterPolicyType)" name="AddCustomer" styleClass="txtbox" style="width:290px" styleId="MasterPolicyType">
						<html:option value="">Select</html:option>
						<html:option value="Group">Group</html:option>
						<html:option value="Individual">Individual </html:option>
						<html:option value="Blanket">Blanket</html:option>				
					</html:select>
				</td>
	       </tr>  
	       <tr class="field">
				<td width="45%" align="left"><font color="red">*&nbsp;Salesforce Parent Submission Number:</font></td>
				<td width="55%" align="left">
					<html:text property="answer(Object::Policy::SalesforceSubmissionNumber)"
				styleClass="txtbox" maxlength="40" styleId="SalesforceNumber" size="45" name="AddCustomer"/></td>
			</tr>
			<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Transaction Date (date policy was bound):</font></td>
			<td class="sectionhead1" align="left";>
	          				<div id="TransactionDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="TransactionDate"/>
           						<jsp:param name="panelDiv" value="TransactionDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="false"/>
       	   						<jsp:param name="TodayDate" value=""/>
           					</jsp:include>   
           					<html:hidden property="answer(Object::Policy::TransactionDate)" styleId="transactionDateHidden" />  						
			</td>
		</tr>
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Policy Effective Date:</font></td>
			<td class="sectionhead1"  align="left">
	          				<div id="policyEffectiveDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="policyEffectiveDate"/>
           						<jsp:param name="panelDiv" value="policyEffectiveDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="false"/>
       	   						<jsp:param name="TodayDate" value=""/>
           					</jsp:include>    
           					<html:hidden property="answer(Object::Policy::Poleffdate)" styleId="effectiveDate" /> 						
			</td>
		</tr>
		
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Policy Expiration Date:</font></td>
			<td class="sectionhead1"  align="left">
	          				<div id="policyExpirationDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="policyExpirationDate"/>
           						<jsp:param name="panelDiv" value="policyExpirationDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="false"/>
       	   						<jsp:param name="TodayDate" value=""/>
           					</jsp:include>
           					<html:hidden property="answer(Object::Policy::Polexpdate)" styleId="expirationDate" />
     		</td>
		</tr>	  
		<tr class="field">
			<td width="45%" align="left">Carrier/Issuing Company:</font></td>
			<td width="55%" align="left">
	          	<html:select style="width:275px" style="width:290px"
				property="answer(Object::Policy::CarrierCompany)"
				styleClass="txtbox" name="AddCustomer">
				<html:option value="Starr Indemnity">Starr Indemnity</html:option>
				<html:option value="Starr Surplus Lines">Starr Surplus Lines</html:option>
				<html:option value="CVS 1919">CVS 1919</html:option>
			</html:select>
     		</td>
		</tr>	
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Written Premium (including any rider premium):</font></td>
			<td width="55%" align="left">
	          	<html:text property="answer(Object::Policy::WrittenPremium)"
						styleClass="txtboxrightalign" maxlength="19" styleId="WrittenPremium" size="45" name="AddCustomer"/></td>
		</tr>
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Commission:</font></td>
			<td width="55%" align="left">
	          	<html:text property="answer(Object::Policy::Commission)" size="45"
				styleClass="txtboxrightalign" maxlength="19" styleId="Commission" name="AddCustomer"/>
		</tr>
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Attachment Point:</font></td>
			<td width="55%" align="left">
	          	<html:text property="answer(Object::Policy::AttachmentPoint)" size="45"
				styleClass="txtboxrightalign" maxlength="19" styleId="AttachmentPoint"  name="AddCustomer" value="$0.00"/>
		</tr>
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Policy Limit (Aggregate, if none use the highest principal sum):</font></td>
			<td width="55%" align="left">
	          	<html:text property="answer(Object::Policy::PolicyLimit)" size="45"
				styleClass="txtboxrightalign" maxlength="15" styleId="PolicyLimit"  name="AddCustomer"/></td>
		</tr>
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Tax State:</font></td>
			<td width="55%" align="left">
	          	<dmshtml:get_type nameInSession="arStates" dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
				<html:select styleClass="widthText" property="answer(Object::Policy::TaxState)" style="width:290px" styleClass="txtbox" styleId="TaxState" name="AddCustomer">
					<html:option value ="">Select</html:option>
		        		<logic:present name="arStates" scope="request">
		          		<logic:iterate id="details" name="arStates" scope="request" >
				 	    <bean:define id='test' name="details"  property="typeDesc" />
				  		<html:option value ='<%=test.toString()%>'>
				       	<bean:write name="details" property="dmsType" />
				   		</html:option>
						</logic:iterate>
						</logic:present>
				</html:select>
		</tr>
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Line of Business:</font></td>
			<td width="55%" align="left">
	          	<html:select
				property="answer(Object::Policy::LineOfBusiness)" style="width:290px" styleId="LineOfBusiness" styleClass="txtbox" name="AddCustomer" onchange="showOccupancies(this.value);">
				<html:option value="">Select</html:option>
				<html:option value="Specialty">Specialty</html:option>
				<html:option value="Corporate">Corporate</html:option>
				<html:option value="Consumer">Consumer</html:option>
			</html:select>
		</tr>
		<bean:define id="lineOfBuss" name="AddCustomer" property="answer(Object::Policy::LineOfBusiness)"  scope="request"/>
		<%if(lineOfBuss.equals("")){%>
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Occupancies:</font></td>
			<td width="55%" align="left">
	          	<html:select
				property="answer(Object::Policy::Occupancies)" style="width:290px" styleId="Occupancies"
				styleClass="txtbox" name="AddCustomer">
				<html:option value="">Select</html:option>
				<html:option value="College A&S">College A&S</html:option>
				<html:option value="Student International Inbound">Student International Inbound</html:option>
				<html:option value="Student International Outbound">Student International Outbound</html:option>
				<html:option value="Intercollegiate Sports">Intercollegiate Sports</html:option>
				<html:option value="K-12">K-12</html:option>
				<html:option value="Volunteer Fire">Volunteer Fire</html:option>
				<html:option value="Special Risk">Special Risk</html:option>
			</html:select>
		</tr>
		<%}%>
		<%if(lineOfBuss.equals("Specialty")){%>
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Occupancies:</font></td>
			<td width="55%" align="left">
	          	<html:select
				property="answer(Object::Policy::Occupancies)" style="width:290px" styleId="Occupancies"
				styleClass="txtbox" name="AddCustomer">
				<html:option value="">Select</html:option>
				<html:option value="College A&S">College A&S</html:option>
				<html:option value="Student International Inbound">Student International Inbound</html:option>
				<html:option value="Student International Outbound">Student International Outbound</html:option>
				<html:option value="Intercollegiate Sports">Intercollegiate Sports</html:option>
				<html:option value="K-12">K-12</html:option>
				<html:option value="Volunteer Fire">Volunteer Fire</html:option>
				<html:option value="Special Risk">Special Risk</html:option>
			</html:select>
		</tr>
		<%}%>
		<%if(lineOfBuss.equals("Corporate")){%>	
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Occupancies:</font></td>
			<td width="55%" align="left">
	          	<html:select
				property="answer(Object::Policy::Occupancies)" style="width:290px" styleId="Occupancies"
				styleClass="txtbox" name="AddCustomer">
			<html:option value="">Select</html:option>
			<html:option value="BTA">BTA</html:option>
				<html:option value="PAI">PAI</html:option>
				<html:option value="PAI(vol)">PAI(vol)</html:option>
				<html:option value="PAI Basic/Carve-out (mandatory)">PAI Basic/Carve-out (mandatory)</html:option>
				<html:option value="International Travel">International Travel</html:option>
			</html:select></td>
	       </tr>
	   <%}%> 
	   <%if(lineOfBuss.equals("Consumer")){%>	
	  <tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Occupancies:</font></td>
			<td width="55%" align="left">
	          	<html:select
				property="answer(Object::Policy::Occupancies)" style="width:290px" styleId="Occupancies"
				styleClass="txtbox" name="AddCustomer">
			<html:option value="">Select</html:option>
				<html:option value="Broad Market Association">Broad Market Association</html:option>
				<html:option value="Affinity Association">Affinity Association</html:option>
				<html:option value="Financial Institutions">Financial Institutions</html:option>				
			</html:select></td>
	       </tr>
	       <%}%>   
		<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Product Coverage Type:</font></td>
			<td width="55%" align="left">
	          	<html:select
				property="answer(Object::Policy::ProductCoverageType)" style="width:290px"
				styleClass="txtbox" name="AddCustomer" styleId="ProductCoverageType">
				<html:option value="">Select</html:option>
				<html:option value="AD">AD</html:option>
				<html:option value="AD&D"> AD&D </html:option>
				<html:option value="STM">STM</html:option>			
			</html:select>
		</tr>
		<tr width="20%" class="field">
			<td width="45%" align="left"><div id="ridersDiv"><a href="javascript:showRider();" style="color:black;">+Riders</a> </div></td>
			<td>&nbsp;</td>
		</tr>
		
		<tr id="riderTR" style="display:none">
			<td class="field" style="width:22%"></td>
			<td>&nbsp;
				<table border="0" cellpadding="0" cellspacing="0" align="center" width="100%">
				<tr class="field">
					<td valign="top" width="25%" colspan="2" align="left" style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rider</td>
					<td style="color:black" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Premium</td>
				</tr>
				<bean:define id="criticalRider" property="answer(Object::Policy::Rider::CriticalIllness)" name="AddCustomer" scope="request"/>
				<bean:define id="warRiskRider" property="answer(Object::Policy::Rider::WarRisk)" name="AddCustomer" scope="request"/>
				<bean:define id="AMEPrimaryRider" property="answer(Object::Policy::Rider::AMEPrimary)" name="AddCustomer" scope="request"/>
				<bean:define id="AMEExcessRider" property="answer(Object::Policy::Rider::AMEExcess)" name="AddCustomer" scope="request"/>
				<bean:define id="AMECOBRider" property="answer(Object::Policy::Rider::AMECOB)" name="AddCustomer" scope="request"/>
				<bean:define id="aviationRider" property="answer(Object::Policy::Rider::Aviation)" name="AddCustomer" scope="request"/>
				
				<%if(criticalRider.equals("")){%>
				<tr class="field">
				 	<td style="padding-left:15px" valign="top" width="25%"align="left">Critical Illness</td>
					<td width="5%" valign="top" align="left"><html:checkbox property="answer(Object::Policy::Rider::CriticalIllness)" styleId="criticalIllness" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="80%" valign="top" align="left"><span id="criticalIllnessTD" style="display:none">
					<html:text property="answer(Object::Policy::Rider::CriticalIllnessPremium)" size="27" styleClass="txtbox" styleId="criticalIllnessPremium" maxlength="25" name="AddCustomer" styleClass="txtboxrightalign"/></span></td>
				 </tr>
				<%}%>
				 <%if(criticalRider.equals("Y")){%>
				<tr class="field">
				    <td style="padding-left:15px" valign="top" width="25%"align="left">Critical Illness</td>
					<td width="5%" valign="top" align="left"><input type="checkbox" name="answer(Object::Policy::Rider::CriticalIllness)" Id="criticalIllness"  onclick="showRiderPremium(this.id)" value="Y" checked/></td>
					<td width="80%" valign="top" align="left"><span id="criticalIllnessTD"><html:text property="answer(Object::Policy::Rider::CriticalIllnessPremium)" size="27" styleClass="txtbox" styleId="criticalIllnessPremium" maxlength="25" name="AddCustomer" styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				<%if(warRiskRider.equals("")){%>	
				<tr class="field">
					<td style="padding-left:15px" valign="top" width="25%"align="left">War Risk</td>
					<td width="5%" valign="top" align="left"><html:checkbox property="answer(Object::Policy::Rider::WarRisk)" styleId="warRisk" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="80%" valign="top" align="left"><span id="warRiskTD" style="display:none"><html:text property="answer(Object::Policy::Rider::WarRiskPremium)" size="27" styleClass="txtbox" styleId="warRiskPremium" maxlength="25" name="AddCustomer" styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				<%if(warRiskRider.equals("Y")){%>
				<tr class="field">
					<td style="padding-left:15px" valign="top" width="25%"align="left">War Risk</td>
					<td width="5%" valign="top" align="left"><input type="checkbox" name="answer(Object::Policy::Rider::WarRisk)" Id="warRisk" onclick="showRiderPremium(this.id)" value="Y" checked/></td></td>
					<td width="80%" valign="top" align="left"><span id="warRiskTD"><html:text property="answer(Object::Policy::Rider::WarRiskPremium)" size="27" styleClass="txtbox" styleId="warRiskPremium" maxlength="25" name="AddCustomer" styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				<%if(AMEPrimaryRider.equals("")){%>
				<tr class="field">
					<td style="padding-left:15px" valign="top" width="25%"align="left">AME - Primary</td>
					<td width="5%" valign="top" align="left"><html:checkbox property="answer(Object::Policy::Rider::AMEPrimary)" styleId="AMEPrimary" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="80%" valign="top" align="left"><span id="AMEPrimaryTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMEPrimaryPremium)" styleClass="txtbox" size="27" styleId="AMEPrimaryPremium" maxlength="25" name="AddCustomer" styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				<%if(AMEPrimaryRider.equals("Y")){%>
				<tr class="field">
					<td style="padding-left:15px" valign="top" width="25%"align="left">AME - Primary</td>
					<td width="5%" valign="top" align="left"><input type="checkbox" name="answer(Object::Policy::Rider::AMEPrimary)" Id="AMEPrimary" onclick="showRiderPremium(this.id)" value="Y" checked/></td>
					<td width="80%" valign="top" align="left"><span id="AMEPrimaryTD"><html:text property="answer(Object::Policy::Rider::AMEPrimaryPremium)" styleClass="txtbox" size="27" styleId="AMEPrimaryPremium" maxlength="25" name="AddCustomer" styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				<%if(AMEExcessRider.equals("")){%>
				<tr class="field">
					<td style="padding-left:15px" valign="top" width="25%"align="left">AME - Excess</td>
					<td width="5%" valign="top" align="left"><html:checkbox property="answer(Object::Policy::Rider::AMEExcess)" styleId="AMEExcess" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="80%" valign="top" align="left"><span id="AMEExcessTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMEExcessPremium)" styleClass="txtbox" size="27" styleId="AMEExcessPremium" maxlength="25" name="AddCustomer"  styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				<%if(AMEExcessRider.equals("Y")){%>
				<tr class="field">
					<td style="padding-left:15px" valign="top" width="25%"align="left">AME - Excess</td>
					<td width="5%" valign="top" align="left"><input type="checkbox" name="answer(Object::Policy::Rider::AMEExcess)" Id="AMEExcess" onclick="showRiderPremium(this.id)" value="Y" checked/></td>
					<td width="80%" valign="top" align="left"><span id="AMEExcessTD"><html:text property="answer(Object::Policy::Rider::AMEExcessPremium)" styleClass="txtbox" size="27" styleId="AMEExcessPremium" maxlength="25" name="AddCustomer"  styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				<%if(AMECOBRider.equals("")){%>
				<tr class="field">
					<td style="padding-left:15px" valign="top" width="25%"align="left">AME - COB</td>
					<td width="5%" valign="top" align="left"><html:checkbox property="answer(Object::Policy::Rider::AMECOB)" styleId="AMECOB" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="80%" valign="top" align="left"><span id="AMECOBTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMECOBPremium)" size="27" styleClass="txtbox" styleId="AMECOBPremium" maxlength="25" name="AddCustomer"  styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				<%if(AMECOBRider.equals("Y")){%>
				<tr class="field">
					<td style="padding-left:15px" valign="top" width="25%"align="left">AME - COB</td>
					<td width="5%" valign="top" align="left"><input type="checkbox"  name="answer(Object::Policy::Rider::AMECOB)" Id="AMECOB" onclick="showRiderPremium(this.id)" value="Y" checked/></td>
					<td width="80%" valign="top" align="left"><span id="AMECOBTD"><html:text property="answer(Object::Policy::Rider::AMECOBPremium)" size="27" styleClass="txtbox" styleId="AMECOBPremium" maxlength="25" name="AddCustomer"  styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				<%if(aviationRider.equals("")){%>
				<tr class="field">
					<td style="padding-left:15px" valign="top" width="25%"align="left">Aviation</td>
					<td width="5%" valign="top"  align="left"><html:checkbox property="answer(Object::Policy::Rider::Aviation)" styleId="aviation" onclick="showRiderPremium(this.id);"></html:checkbox></td>
					<td width="80%" valign="top" align="left"><span id="aviationTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AviationPremium)" size="27" styleClass="txtbox" styleId="aviationPremium" maxlength="25" name="AddCustomer"  styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				<%if(aviationRider.equals("Y")){%>
				<tr class="field">
					<td style="padding-left:15px" valign="top" width="25%"align="left">Aviation</td>
					<td width="5%" valign="top"  align="left"><input type="checkbox" name="answer(Object::Policy::Rider::Aviation)" Id="aviation" onclick="showRiderPremium(this.id)" value="Y" checked/></td>
					<td width="80%" valign="top" align="left"><span id="aviationTD"><html:text property="answer(Object::Policy::Rider::AviationPremium)" size="27" styleClass="txtbox" styleId="aviationPremium" maxlength="25" name="AddCustomer"  styleClass="txtboxrightalign"/></span></td>
				</tr>
				<%}%>
				
				</table>
			</td>
		   </tr>
	          <tr class="field">
				<td width="45%" align="left">Occurrence Indicator:</td>
				<td width="55%" align="left">
		          	<html:radio value="Yes" property="answer(Object::Policy::OccurrenceIndicator)" styleId="OccurrenceIndicatorYes" name="AddCustomer"/>Yes
				    <html:radio value="No" property="answer(Object::Policy::OccurrenceIndicator)" styleId="OccurrenceIndicatorNo"  name="AddCustomer"/>No</td>
			</tr>
			<tr class="field">
				<td width="45%" align="left">Facultative Reinsurance Indicator:</td>
				<td width="55%" align="left">
		          	<html:radio value="Yes" property="answer(Object::Policy::FacultativeReinsuranceIndicator)" styleId="FacultativeReinsuranceIndicatorYes"  name="AddCustomer"/>Yes
			        <html:radio value="No" property="answer(Object::Policy::FacultativeReinsuranceIndicator)" styleId="FacultativeReinsuranceIndicatorNo" name="AddCustomer"/>No</td>
			</tr>
			<tr class="field">
				<td width="45%" align="left"><font color="red">*&nbsp;Agent/Broker Commission Percent:</font></td>
				<td width="55%" align="left">
		          	<html:text property="answer(Object::Policy::AgentCommission)" size="45" styleClass="txtboxrightalign" maxlength="9" styleId="AgentCommission" name="AddCustomer"/>
			</tr>
			<tr class="field">
				<td width="45%" align="left">Number of Covered Lives:</td>
				<td width="55%" align="left">
		          	<html:text property="answer(Object::Policy::NumberOfCoveredLives)" size="45" styleClass="txtbox" maxlength="100" styleId="CoveredLives" name="AddCustomer"/>
			</tr>
			<tr class="field">
			<td width="45%" align="left"><font color="red">*&nbsp;Premium Due Date:</font></td>
			<td class="sectionhead1"  align="left">
	          				<div id="PremiumDueDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="PremiumDueDate"/>
           						<jsp:param name="panelDiv" value="PremiumDueDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="false"/>
       	   						<jsp:param name="TodayDate" value=""/>
           					</jsp:include>
           					<html:hidden property="answer(Object::Policy::PremiumDueDate)" styleId="PremiumDueDateHidden" />
			</td>
		</tr>
		<tr class="field">
				<td width="45%" align="left">Billing Mode:</td>
				<td width="55%" align="left">
		          	<html:select
					property="answer(Object::Policy::BillingMode)" style="width:290px"
					styleClass="txtbox" name="AddCustomer">
					<html:option value="Annual">Annual</html:option>
					<html:option value="Semi-annual">Semi-annual</html:option>
					<html:option value="Quarterly">Quarterly</html:option>
					<html:option value="Monthly">Monthly</html:option>
					<html:option value="Daily">Daily</html:option>
				</html:select>
			</tr>	
			<tr class="field">
				<td width="45%" align="left"><font color="red">*&nbsp;Underwriter:</font></td>
				<td width="55%" align="left">
		          	<dmshtml:Get_users_byRoleId nameInSession="arListUsers" roleId="3" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId)%>" />
					<html:select property="answer(Object::Policy::Underwriter)" styleId="underwriterName" name="AddCustomer" style="width:290px" styleClass="txtbox">
						<html:option value="">Select</html:option>
						<logic:present name="arListUsers" scope="session">
							<logic:iterate id="details" name="arListUsers" scope="session" >
							<bean:define id='underwriterName' name="details" property="id" />
							<html:option value ='<%=underwriterName.toString()%>' >
								<bean:write name="details" property="id"  />
							</html:option>
							</logic:iterate>
						</logic:present>	
					</html:select>
			</tr>
			<tr class="field">
				<td width="45%" align="left">Sale Ownership:</td>
				<td width="55%" align="left">
		          	<html:radio value="UW" property="answer(Object::Policy::SaleOwnership)" styleId="SaleOwnerUnderwriter" name="AddCustomer"/>Underwriter
			        <html:radio value="BDM" property="answer(Object::Policy::SaleOwnership)" styleId="SaleOwnerBDM" name="AddCustomer"/>BDM</td>
			</tr>
			<tr class="field">
				<td width="45%" align="left">Premium Collection:</td>
				<td width="55%" align="left">
		         <html:select
					property="answer(Object::Policy::PremiumCollection)" style="width:290px"
					styleClass="txtbox" name="AddCustomer">
					<html:option value="Producer">Producer</html:option>
					<html:option value="TPA">TPA</html:option>				
					<html:option value=" Carrier">Carrier</html:option>
				</html:select>
			</tr>	
			<tr class="field">
				<td width="45%" align="left"><font color="red">*&nbsp;Claims Payor:</font></td>
				<td width="55%" align="left">
		         <html:select
					property="answer(Object::Policy::ClaimsPayor)" style="width:290px"
					styleClass="txtbox" name="AddCustomer" styleId="ClaimsPayor">
					<html:option value="">Select</html:option>
					<html:option value="Administrative Concepts (ACI)">Administrative Concepts (ACI)</html:option>
					<html:option value="Cook & Co.">Cook & Co.</html:option>
					<html:option value="Trawick/GBG">Trawick/GBG</html:option>
					<html:option value="Health Special Risk, Inc. (HSRI)">Health Special Risk, Inc. (HSRI)</html:option>
					<html:option value="MCA Administrators">MCA Administrators</html:option>
					<html:option value="Personal Insurance Administrators (PIA)">Personal Insurance Administrators (PIA)</html:option>
					<html:option value="Coordinated Benefit Plans (CBP)">Coordinated Benefit Plans (CBP)</html:option>
					<html:option value="Starr Companies">Starr Companies</html:option>
				</html:select>
			</tr>			  
	</table>	
	<table border="0" cellpadding="0" cellspacing="15" align="right"
		width="90%">
		<bean:define id="arrProductGroups" name="PRODUCT_GROUPS" type="java.util.ArrayList"/>
			<%
												for(int i=0;i<arrProductGroups.size();i++) {
													com.dms.ejb.data.QuestionHashMap productMap=(com.dms.ejb.data.QuestionHashMap)arrProductGroups.get(i);	
											%>				
											
										<html:hidden value ='<%=productMap.getString("Object::ProductGroup::ProductGroupId")%>' property="answer(Object::Quote::GroupId)" />
										<html:hidden value ='<%=productMap.getString("Object::ProductGroup::ProductGroupVerId")%>' property="answer(Object::Quote::GroupverId)" />											
										<%}%>
										<html:hidden value ='<%=""+ownerId%>' property="answer(ownerId)" />
										<html:hidden property="answer(Object::Quote::ProductStatus)" name="AddCustomer" value="DEVELOPMENT"/>
		<tr>
			<td align="right"><html:submit value="Next" styleClass="covbutton" property="answer(submit)" style="width:80px" /></td>
		</tr>
	</table>
	<bean:define id="arrProductCompanies" name="INSURANCE_COMPANIES" type="java.util.ArrayList"/>	
	<%
						for(int i=0;i<arrProductCompanies.size();i++) {
									com.dms.ejb.data.QuestionHashMap productCompanyMap=(com.dms.ejb.data.QuestionHashMap)arrProductCompanies.get(i);	
	%>															
					<html:hidden value ='<%=productCompanyMap.getString("Object::InsuranceType::CompanyId")%>' property="answer(Object::InsuranceType::CompanyId)" />
																
	<%}%>
	
		<bean:define id="arrInsuranceTypes" name="RISK_INSURANCE_TYPES" type="java.util.ArrayList"/>	
	<%
						for(int i=0;i<arrInsuranceTypes.size();i++) {
									com.dms.ejb.data.QuestionHashMap productInsuranceType=(com.dms.ejb.data.QuestionHashMap)arrInsuranceTypes.get(i);	
	%>															
					<html:hidden value ='<%=productInsuranceType.getString("Object::Risk::InsuranceTypeId")%>' property="answer(Object::InsuranceType::InsuranceTypeId)" />																
	<%}%>
	<html:hidden property="answer(Object::Customer::VersionId)" name="AddCustomer"/>
	<html:hidden property="answer(Object::Agency::AgencyId)" value='<%=""+lngAgencyId %>'/>
	<html:hidden property="answer(Object::Agency::AgentId)" value='<%=""+lngAgentId %>'/>
	<html:hidden property="answer(Object::Quote::ProductId)" value="661"/>
	<html:hidden property="answer(Object::Quote::ProductVerId)" value="748"/>
	
	
	</div>	
	</div>	
	</html:form>
<script type="text/javascript">

document.getElementById('NewBusiness').checked = true;
document.getElementById('OccurrenceIndicatorYes').checked = true;
document.getElementById('FacultativeReinsuranceIndicatorNo').checked = true;
document.getElementById('SaleOwnerUnderwriter').checked = true;
    

</script>
<script type="text/javascript">
YAHOO.example.BasicRemote = function() {
    // Use an XHRDataSource    
   var oDS = new YAHOO.util.XHRDataSource('../AutoCompleteZipCode.do');
    // Set the responseType
    oDS.responseType = YAHOO.util.XHRDataSource.TYPE_JSARRAY;
    oDS.responseSchema = {fields:["Zipcode", "City","County","State","Country"]};

    // Enable caching
    oDS.maxCacheEntries = 5;

    // Instantiate the AutoComplete
    var oAC = new YAHOO.widget.AutoComplete("Zip", "zipAutoCompleteResContainer", oDS);
    // The webservice needs custom parameters 
    oAC.generateRequest = function(sQuery) { 
    	
        return "?answer(Object::ZipCode::PageNum)=0&AutoCompleteZipLookupSqlname="+document.forms[0].zipLookupName.value+"&FormName=AddCustomer&query=" + sQuery ; 
    };
         
    oAC.useShadow = true;
    oAC.resultTypeList = false;
	oAC.applyLocalFilter = false;
	oAC.queryMatchSubset = false;
	oAC.minQueryLength = 3;	
	oAC.queryDelay = 1;
	oAC.prehighlightClassName = "yui-ac-prehighlight";
	// Display up to 20 results in the container
	oAC.maxResultsDisplayed = 20

    // Custom formatter to highlight the matching letters
    oAC.formatResult = function(oResultData, sQuery, sResultMatch) {
        var query = sQuery.toLowerCase(),
            zipcode = oResultData.Zipcode,
            city = oResultData.City,
            county = oResultData.County || "", // Guard against null value
            query = sQuery.toLowerCase(),
            zipcodeMatchIndex = zipcode.toLowerCase().indexOf(query),
            cityMatchIndex = city.toLowerCase().indexOf(query),
            countyMatchIndex = county.toLowerCase().indexOf(query),
            displayZipcode, displayCity, displaynCounty;

        if(zipcodeMatchIndex > -1) {
            displayZipcode = highlightMatch1(zipcode, query, zipcodeMatchIndex);
        }
        else {
            displayZipcode = zipcode;
        }

        if(cityMatchIndex > -1) {
            displayCity = highlightMatch1(city, query, cityMatchIndex);
        }
        else {
            displayCity = city;
        }

        if(countyMatchIndex > -1) {
            displayCounty = highlightMatch1(county, query, countyMatchIndex);
        }
        else {
            displayCounty = county ? county : "";
        }
		
        return displayZipcode + "\t" + displayCity + "\t" + displayCounty + "\t" + oResultData.State + "\t" + oResultData.Country ;

    };

    // Helper function for the formatter
    var highlightMatch1 = function(full, snippet, matchindex) {
        return full.substring(0, matchindex) +
                "<span class='match'>" +
                full.substr(matchindex, snippet.length) +
                "</span>" +
                full.substring(matchindex + snippet.length);
    };

    // Define an event handler to populate a hidden form field
    // when an item gets selected and populate the input field
    var myHiddenField = YAHOO.util.Dom.get("myHidden");
    var myHandler = function(sType, aArgs) {

        var myAC = aArgs[0]; // reference back to the AC instance
        var elLI = aArgs[1]; // reference to the selected LI element
        var oData = aArgs[2]; // object literal of selected item's result data
       
        document.forms[0].City.value = oData.City;
		document.forms[0].County.value = oData.County;
		document.forms[0].State.value = oData.State;
        
        // update hidden form field with the selected item's ID
        myHiddenField.value = elLI.Zipcode;
        myAC.getInputEl().value = oData.Zipcode + "\t" + oData.City+"\t" + (oData.County ? " (" + oData.State + ")" : "")+ "\t" + oData.State + "\t" + oData.Country ;
   		document.forms[0].City.value = oData.City;
		document.forms[0].County.value = oData.County;
		  
    };
    oAC.itemSelectEvent.subscribe(myHandler);
	
    return {
        oDS: oDS,
        oAC: oAC
    };

}();
</script>
<script type="text/javascript">
  function validateFrm(){
		if(document.getElementById('InsuredName').value==""){
			alert("Please enter Legal Name 1");			
			PolicyDetailFrm.InsuredName.focus();
			return false;
		}
		if(document.getElementById('InsuredAddress1').value==""){
			alert("Please enter Address1");			
			PolicyDetailFrm.InsuredAddress1.focus();
			return false;
		}
		if(document.getElementById('InsuredCity').value==""){
			alert("Please enter City");			
			PolicyDetailFrm.InsuredCity.focus();
			return false;
		}
		if(document.getElementById('InsuredState').value==""){
			alert("Please select State");
			PolicyDetailFrm.InsuredState.focus();
			return false;
		}
		if(document.getElementById('ZipCode').value==""){
			alert("Please enter ZipCode");			
			PolicyDetailFrm.ZipCode.focus();
			return false;
		}
		if(document.getElementById('policyEffectiveDate').value==""){
			alert("Please enter Policy Effective Date");			
			PolicyDetailFrm.policyEffectiveDate.focus();
			return false;
		}
		if(document.getElementById('policyExpirationDate').value==""){
			alert("Please enter Policy Expiration Date");			
			PolicyDetailFrm.policyExpirationDate.focus();
			return false;
		}
		if((PolicyDetailFrm.ZipCode.value.length!=5)||(PolicyDetailFrm.ZipCode.value<=0))
		{
			alert("Please enter a valid Zip Code");
			PolicyDetailFrm.ZipCode.focus();
			return false;
		}
		if(!isInteger(PolicyDetailFrm.ZipCode.value))
		{
			alert("Please enter a valid Zip Code");
			PolicyDetailFrm.ZipCode.focus();
			return false;
		}
	}	
	
	function isInteger(s){
		var i;
		for (i = 0; i < s.length; i++){   
			// Check that current character is number.
			var c = s.charAt(i);         
			if ((c < "0") || (c > "9")) return false;
		}
	// All characters are numbers.
	return true;
	}
	
	function showRider(){
		document.getElementById('ridersDiv').innerHTML = "<a href='javascript:hideRider();' style='color:black;'>- Riders</a>";
		document.getElementById('riderTR').style.display="";
	}
	
	function hideRider(){
		document.getElementById('ridersDiv').innerHTML = "<a href='javascript:showRider();' style='color:black;'>+Riders</a>";
		document.getElementById('riderTR').style.display="none";
	}
</script>
 <script type="text/javascript">
   		Ext.onReady(function(){  	
   			var blurHandlerEffectiveDate = function() {  
  			 
  			var strDate = document.getElementById('policyEffectiveDate').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{
			    if(document.getElementById('policyEffectiveDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
			}else{
				var effDate = Ext.getCmp('policyEffectiveDate').getValue(); 
				var MM2 = effDate.getMonth()+1;
				var DD2 = effDate.getDate();
				var YY2 = effDate.getFullYear();				
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
   				document.getElementById('effectiveDate').value =MM2+'/'+DD2+'/'+YY2;   
   				 Ext.getCmp('PremiumDueDate').setValue(MM2+'/'+(DD2+30)+'/'+YY2); 	
   				 document.getElementById('PremiumDueDateHidden').value =MM2+'/'+(DD2+30)+'/'+YY2; 							
   			}
   			}; 
   			
   			var blurHandlerTransactionDate = function() {  
  			 
  			var strDate = document.getElementById('TransactionDate').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{
			    if(document.getElementById('TransactionDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
			}else{
				var effDate = Ext.getCmp('TransactionDate').getValue(); 
				var MM2 = effDate.getMonth()+1;
				var DD2 = effDate.getDate();
				var YY2 = effDate.getFullYear();				
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
   				document.getElementById('transactionDateHidden').value =MM2+'/'+DD2+'/'+YY2;     				 								
   			}
   			};
   			
   			var blurHandlerPremiumDate = function() {  
  			 
  			var strDate = document.getElementById('PremiumDueDate').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{
			    if(document.getElementById('PremiumDueDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
			}else{
				var effDate = Ext.getCmp('PremiumDueDate').getValue(); 
				var MM2 = effDate.getMonth()+1;
				var DD2 = effDate.getDate();
				var YY2 = effDate.getFullYear();				
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
   				document.getElementById('PremiumDueDateHidden').value =MM2+'/'+DD2+'/'+YY2;   								
   			}
   			};
   			
   			var blurHandlerExpirationDate = function() {  
  			 
  			var strDate = document.getElementById('policyExpirationDate').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{
			    if(document.getElementById('policyExpirationDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
			}else{
				var expDate1 = Ext.getCmp('policyExpirationDate').getValue(); 
				var MM2 = expDate1.getMonth()+1;
				var DD2 = expDate1.getDate();
				var YY2 = expDate1.getFullYear();
				var effDate1 = document.getElementById('policyEffectiveDate').value;
  				var dmonth1 = parseInt(effDate1.substring(0, 2), 10);
				var dday1 = parseInt(effDate1.substring(3, 5), 10);
				var dyear1 = parseInt(effDate1.substring(6, 10), 10);
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
				Ext.getCmp('policyExpirationDate').setValue(MM2+'/'+DD2+'/'+YY2);
   				document.getElementById('expirationDate').value =MM2+'/'+DD2+'/'+YY2;   				
				if(YY2 < dyear1){
					alert("Please enter the valid Policy Expiration date");									
				}
				if((MM2 < dmonth1) && (YY2==dyear1)){
					alert("Please enter the valid Policy Expiration date");					
				}
				if((MM2 == dmonth1) && (DD2<=dday1) && (YY2==dyear1)){
					alert("Please enter the valid Policy Expiration date");					
				}
   			}
   			}; 
   			Ext.EventManager.on('PremiumDueDate', 'blur', blurHandlerPremiumDate); 
   			Ext.EventManager.on('TransactionDate', 'blur', blurHandlerTransactionDate); 
			Ext.EventManager.on('policyEffectiveDate', 'blur', blurHandlerEffectiveDate); 
			Ext.EventManager.on('policyExpirationDate', 'blur', blurHandlerExpirationDate); 
 			});
	</script>	  

	<script type="text/javascript">
		function showOccupancies(value){
		var occupancies = document.getElementById('Occupancies');
		if(value == "Corporate"){
				occupancies.length = 6;
				
				//Setting display names
				occupancies[0].text = "Select";
				occupancies[1].text = "BTA";
				occupancies[2].text = "PAI";
				occupancies[3].text = "PAI(vol)";
				occupancies[4].text = "PAI Basic/Carve-out (mandatory)";
				occupancies[5].text = "International Travel";
				
				//Setting option values
				occupancies[0].value = "";
				occupancies[1].value = "BTA";
				occupancies[2].value = "PAI";				
				occupancies[3].value = "PAI(vol)";
				occupancies[4].value = "PAI Basic/Carve-out (mandatory)";
				occupancies[5].value = "International Travel";
			}
			if(value == "Specialty"){
				occupancies.length = 8;
				
				//Setting display names
				occupancies[0].text = "Select";
				occupancies[1].text = "College A&S";
				occupancies[2].text = "Student International Inbound";
				occupancies[3].text = "Student International Outbound";
				occupancies[4].text = "Intercollegiate Sports";
				occupancies[5].text = "K-12";
				occupancies[6].text = "Volunteer Fire";
				occupancies[7].text = "Special Risk";
				
				//Setting option values
				occupancies[0].value = "";
				occupancies[1].value = "College A&S";
				occupancies[2].value = "Student International Inbound";
				occupancies[3].value = "Student International Outbound";
				occupancies[4].value = "Intercollegiate Sports";
				occupancies[5].value = "K-12";
				occupancies[6].value = "Volunteer Fire";
				occupancies[7].value = "Special Risk";				
			}
			if(value == "Consumer"){
				occupancies.length = 4;
				
				//Setting display names
				occupancies[0].text = "Select";
				occupancies[1].text = "Broad Market Association";
				occupancies[2].text = "Affinity Association";
				occupancies[3].text = "Financial Institutions";
				
				//Setting option values
				occupancies[0].value = "";
				occupancies[1].value = "Broad Market Association";
				occupancies[2].value = "Affinity Association";
				occupancies[3].value = "Financial Institutions";
			}			
		}
	</script>