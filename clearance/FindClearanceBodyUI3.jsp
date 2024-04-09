<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/CheckClearance.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"> </SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/FindClearanceUI3.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CommonYUIUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/assets/skins/sam/menu.css">
<%-- <link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/assets/skins/sam/skin.css">--%>
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css"	href="../Scripts/YUI/2.7.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />  
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script> 
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CauseListTable.js"></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/Subjectivity.js" ></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>
<script type="text/JavaScript" SRC="../Scripts/YUI/2.7.0/build/menu/menu-min.js" ></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>

<script type="text/javascript" src="/Scripts/JScripts/Application.js"></script>		
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<style type="text/css">
.yui-skin-sam .yui-pg-container {
    display: block;
    margin: 6px 0;
    white-space: nowrap;
    width:76.5%
}

.yui-panel .hd {
	color : #3D77CB;
	font-weight : bold;
	border-color : #FFFFFF;
	background-color : #FFFFFF;
	font-size : 20px;
}

.yui-skin-sam .yui-dt th .yui-dt-liner {
	white-space: normal;
}
</style>

<html:form name="FindClearance" type="com.dms.web.data.DataForm" action="/FindClearanceActionUI3.do" onsubmit="return validateDate()">
<div class="formpage01">
	<div class="content">
		<div class="formheadnew"><h2 class="left">Find Clearance</h2></div>
 			<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/> 
 			<div><h3>Clearance Search Criteria</h3></div>
			<div class="field" style="width:52.5%">Insured Name Type:
				<html:select property="answer(Object::Clearance::NameType)"	styleClass="txtbox" styleId="NameType" onchange="showPersonInformation(this.form)">
					<html:option value="" >All</html:option>
					<html:option value="Company" >Company</html:option>
					<html:option value="Person" >Person</html:option>					
				</html:select>
			</div>
			<div id="company_legal_name1"><div class="field" style="width:77%">Insured Name 1:<html:text property="answer(Object::Clearance::LegalName1)" size="50" maxlength="50" styleClass="txtbox" styleId="LegalName1" /><br/></div></div>		
			<div id="company_legal_name2"><div class="field" style="width:77%">Insured Name 2:<html:text property="answer(Object::Clearance::LegalName2)" size="50" maxlength="50" styleClass="txtbox" styleId="LegalName2" /><br/></div></div>
			<div id="personfirstname"><div class="field" style="width:64.5%">First Name:<html:text property="answer(Object::Clearance::FirstName)" size="30" maxlength="30" styleClass="txtbox" styleId="FirstName" /><br/></div></div>
			<div id="personlastname"><div class="field" style="width:64.5%">Last Name:<html:text property="answer(Object::Clearance::LastName)" size="30" maxlength="30" styleClass="txtbox" styleId="LastName" /><br/></div></div>
			<div id="insureddba"><div class="field" style="width:77%">DBA:<html:text property="answer(Object::Clearance::DBA)" size="50" maxlength="50"	styleClass="txtbox" styleId="DBA" /></div></div>
			<div class="field" style="width:65%">State/Province:
				<html:select property="answer(Object::Clearance::State)" styleClass="txtbox" styleId="State">
					<html:option value ="" styleClass="txtbox">All</html:option>
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
			</div>
			<div class="field" style="width:55%">Zip Code:<html:text property="answer(Object::Clearance::Zipcode)" size="5" maxlength="5" styleClass="txtbox" styleId="Zip" />
				<!--Zipcode lookup start 05-06-2006--> 
				<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=FindClearance&clear=yes&PopupWindowName=Zip Code Search"
						title="Search for zip code, state, county"
						onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG
						SRC="../Images/zipcodefind.jpg" BORDER="0" align="top"
						ALT="Search for Zip code, City, State and County.">
				</a>
				<!-- 05-06-2006 end-->
				<html:hidden property="answer(Object::Customer::City)"  styleId="City"/>
				<html:hidden property="answer(Object::Customer::County)" styleId="County"/>						
			</div>
			<div class="field" style="width:58.5%">Submission #:<html:text property="answer(Object::Clearance::SubmissionNumber)" size="20" maxlength="20" styleClass="txtbox" styleId="SubmissionNumber" /></div>
			<div class="field" style="width:68.5%">Submission Expiry Start Date:
					<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="SESDate1" onkeyup="if(this.value.length==2) {document.forms[0].SESDate2.focus()}" />
				<span style="width:15px">/</span>
					<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="SESDate2" onkeyup="if(this.value.length==2) {document.forms[0].SESDate3.focus()}" />
				<span style="width:15px">/</span>			
					<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="SESDate3" onkeyup="if(this.value.length==4) {document.forms[0].SEEDate1.focus()}" />
				<span style="width:50px">(MM/DD/YYYY)</span>
			</div>
			<div class="field" style="width:68.5%">Submission Expiry End Date:
					<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="SEEDate1" onkeyup="if(this.value.length==2) {document.forms[0].SEEDate2.focus()}" />
				<span style="width:15px">/</span>
					<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="SEEDate2" onkeyup="if(this.value.length==2) {document.forms[0].SEEDate3.focus()}" />
				<span style="width:15px">/</span>			
					<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="SEEDate3" />
				<span style="width:50px">(MM/DD/YYYY)</span>
			</div>
			<div class="field" style="width:58.5%">Quote #:<html:text property="answer(Object::Clearance::QuoteNumber)" size="20" maxlength="20" styleClass="txtbox" styleId="QuoteNumber" /></div>
			<div class="field" style="width:68.5%">Quote Expiry Start Date:
					<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="QESDate1" onkeyup="if(this.value.length==2) {document.forms[0].QESDate2.focus()}" />
				<span style="width:15px">/</span>
					<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="QESDate2" onkeyup="if(this.value.length==2) {document.forms[0].QESDate3.focus()}" />
				<span style="width:15px">/</span>			
					<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="QESDate3" onkeyup="if(this.value.length==4) {document.forms[0].QEEDate1.focus()}" />
				<span style="width:50px">(MM/DD/YYYY)</span>
			</div>
			<div class="field" style="width:68.5%">Quote Expiry End Date:
					<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="QEEDate1" onkeyup="if(this.value.length==2) {document.forms[0].QEEDate2.focus()}" />
				<span style="width:15px">/</span>
					<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="QEEDate2" onkeyup="if(this.value.length==2) {document.forms[0].QEEDate3.focus()}" />
				<span style="width:15px">/</span>			
					<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="QEEDate3" />
				<span style="width:50px">(MM/DD/YYYY)</span>
			</div>
			<div class="field" style="width:58.5%">Policy #:<html:text property="answer(Object::Clearance::PolicyNumber)" size="20" maxlength="20" styleClass="txtbox" styleId="PolicyNumber" /></div>
			<div class="field" style="width:68.5%">Policy Expiry Start Date:
					<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="PESDate1" onkeyup="if(this.value.length==2) {document.forms[0].PESDate2.focus()}" />
				<span style="width:15px">/</span>
					<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="PESDate2" onkeyup="if(this.value.length==2) {document.forms[0].PESDate3.focus()}" />
				<span style="width:15px">/</span>			
					<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="PESDate3" onkeyup="if(this.value.length==4) {document.forms[0].PEEDate1.focus()}" />
				<span style="width:50px">(MM/DD/YYYY)</span>
			</div>
			<div class="field" style="width:68.5%">Policy Expiry End Date:
					<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="PEEDate1" onkeyup="if(this.value.length==2) {document.forms[0].PEEDate2.focus()}" />
				<span style="width:15px">/</span>
					<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="PEEDate2" onkeyup="if(this.value.length==2) {document.forms[0].PEEDate3.focus()}" />
				<span style="width:15px">/</span>			
					<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="PEEDate3" />
				<span style="width:50px">(MM/DD/YYYY)</span>
			</div>
			<div class="field" style="width:53%">Clearance Source:
					<html:select property="answer(Object::Clearance::Source)" styleClass="txtbox" styleId="ClearanceSource">
						<html:option value="">All</html:option>
						<html:option value="SOLARTIS" >SOLARTIS</html:option>
						<html:option value="GENIUS">GENIUS</html:option>					
					</html:select>
			</div>				
			<div class="field" style="width:49%">Linked:
					<html:select property="answer(Object::Clearance::Linked)"	styleClass="txtbox" styleId="Linked">
						<html:option value="" styleClass="txtbox">All</html:option>
						<html:option value="Y" >Yes</html:option>
						<html:option value="N" >No</html:option>					
					</html:select>
			</div>
			<bean:define id="submissionName1"><bean:message key='ToolTip.ClearanceSearch.SubmissionName1'/></bean:define>
			<bean:define id="submissionNumber"><bean:message key='ToolTip.ClearanceSearch.SubmissionNumber'/></bean:define>
			<bean:define id="quoteNumber"><bean:message key='ToolTip.ClearanceSearch.QuoteNumber'/></bean:define>
			<bean:define id="policyNumber"><bean:message key='ToolTip.ClearanceSearch.PolicyNumber'/></bean:define>
			<bean:define id="clearanceRecord"><bean:message key='ToolTip.ClearanceSearch.ClearanceRecord'/></bean:define>
			<div class="formcontent" style="width:50%" align="center"  title="<bean:message key='ToolTip.FindClearance.Find'/>">
				<center><input type="button" value="Find >" class="covbutton" onclick="listClearances('../FindClearanceActionUI3.do')"></center>
			</div>
			<div id="searchResults">
				<div id="SEARCH_CONT"></div>
			<a class="container-close" href="javascript:void(0);" onclick="YAHOO.example.container.searchResult.hide();document.getElementById('searchResultContent').style.display = 'none';"></a>
			</div>
			<div id="searchResultContent" style="display: none;">
				<table width="100%">
					<tr>
						<td>&nbsp;</td>
						<td colspan=5><div id="numberofRecords"></div></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="left">
							<div id="dynamicdata"></div> 
						</td>
					</tr>
					
				</table>
			</div>
	</div>
</div> 
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(pagename)" value="Search in Clearance Database"/>	
 <html:hidden property="answer(Object::Customer::CustomerName)" styleId="customerName1"/>
	<html:hidden property="answer(Object::Customer::CustomerName2)" styleId="customerName2"/>
 <html:hidden property="answer(Object::Clearance::SESDate)" value="" styleId="SESDate" />
  <html:hidden property="answer(Object::Clearance::SEEDate)" value="" styleId="SEEDate" />
   <html:hidden property="answer(Object::Clearance::QESDate)" value="" styleId="QESDate" />
    <html:hidden property="answer(Object::Clearance::QEEDate)" value="" styleId="QEEDate" />
     <html:hidden property="answer(Object::Clearance::PESDate)" value="" styleId="PESDate" />
      <html:hidden property="answer(Object::Clearance::PEEDate)" value="" styleId="PEEDate" />
      <html:hidden property="answer(Object::Clearance::PageNum)" value="0"/>
      </div>
</html:form>
<SCRIPT type="text/javaScript">	
YAHOO.util.Event.onDOMReady(initSearchDialog);
var formElement=document.forms[0];
showPersonInformation(document.forms[0]);
</SCRIPT>

