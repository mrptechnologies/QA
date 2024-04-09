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
<SCRIPT type="text/JavaScript" SRC="../Scripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Quote.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CommonYUIUtil.js"></script>



<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>

<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<html:form action="/FindQuotes.do"  onsubmit="return false;">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<div class="formpage01">
	<div class="content">
	<div class="formheadnew"><h2 class="left">Find Quote</h2></div>

<br class="clear" />


<div>&nbsp;</div>

<div class="field" style="width:500px">Quote Number:<html:text  property="answer(Object::Quote::quoteNum)" styleClass="txtbox" styleId="quoteNumberTemp" /></div>
<div class="field" style="width:740px">Insured Name:<html:text  property ="answer(Object::Quote::customerName)"   styleClass="txtbox" size="60" maxlength="110"/></div>
<div class="field" style="width:465px">Quote Type:<html:select property="answer(Object::Quote::quoteType)" styleClass="txtbox"> 
<html:option value ="">All</html:option>
<html:option value ="RENEWAL">Renewal</html:option>
<html:option value ="NEW_BUSINESS">New Business</html:option>
</html:select>
</div>
<div class="field" style="width:465px">Quote Status:
						<html:select property="answer(Object::Quote::quoteStatus)" styleClass="txtbox">
							<html:option value ="">All</html:option>							
							<html:option value ="In Progress">In Progress</html:option>	
							<html:option value ="Referred">Referred</html:option>						
							<html:option value ="Offered">Offered</html:option>
							<html:option value ="Lapsed">Lapse</html:option>
							<html:option value ="Declined">Declined</html:option>
							<html:option value="Bind Request">Bind Request</html:option>
							<html:option value="Bound">Bound</html:option>
							<html:option value="Issued">Issued</html:option>						
						</html:select>
</div>
<div class="field" style="width:785px">Quote Created Date:
		<span style="width:50px">From :</span>
			<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="if(this.value.length==2) {document.forms[0].csddd.focus()}" styleId="csdmm" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="if(this.value.length==2) {document.forms[0].csdyy.focus()}" styleId="csddd" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px" onkeyup="if(this.value.length==4) {document.forms[0].cedmm.focus()}" styleId="csdyy" />
			
		<span style="width:50px">To :</span>
			<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="if(this.value.length==2) {document.forms[0].ceddd.focus()}" styleId="cedmm" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="if(this.value.length==2) {document.forms[0].cedyy.focus()}" styleId="ceddd" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px"  styleId="cedyy" /> 
	    <span style="width:50px">(MM/DD/YYYY)</span>
</div>
<div class="field" style="width:785px">Quote Updated Date:
		<span style="width:50px">From :</span>
			<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="if(this.value.length==2) {document.forms[0].usddd.focus()}" styleId="usdmm" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="if(this.value.length==2) {document.forms[0].usdyy.focus()}" styleId="usddd" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px" onkeyup="if(this.value.length==4) {document.forms[0].uedmm.focus()}" styleId="usdyy" />
			
		<span style="width:50px">To :</span>
			<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="if(this.value.length==2) {document.forms[0].ueddd.focus()}" styleId="uedmm" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="if(this.value.length==2) {document.forms[0].uedyy.focus()}" styleId="ueddd" />
		<span style="width:15px">/</span>
			<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px"  styleId="uedyy" />
		<span style="width:15px">(MM/DD/YYYY)</span>	  
</div>

<div class="field" style="width:785px">Quote Effective Date:
	<span style="width:50px">From :</span>
		<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="if(this.value.length==2) {document.forms[0].efsdd.focus()}" styleId="efsmm" />
	<span style="width:15px">/</span>
		<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="if(this.value.length==2) {document.forms[0].efsyy.focus()}" styleId="efsdd" />
	<span style="width:15px">/</span>
		<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px" onkeyup="if(this.value.length==4) {document.forms[0].efemm.focus()}" styleId="efsyy" />
		
	<span style="width:50px">To :</span>
		<html:text  property ="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="if(this.value.length==2) {document.forms[0].efedd.focus()}" styleId="efemm" />
	<span style="width:15px">/</span>
		<html:text  property ="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="if(this.value.length==2) {document.forms[0].efeyy.focus()}" styleId="efedd" />
	<span style="width:15px">/</span>
		<html:text  property ="answer(Year)"  size="4" maxlength="4" style="width:40px"  styleId="efeyy" />
	<span style="width:50px">(MM/DD/YYYY)</span>  
</div>

<div>&nbsp;</div>

<div class="formcontent" style="width:50%" align="center"><center>
<input type="submit" value="Find >" class="covbutton" onclick="FindQuote1('../FindQuotesUI3.do')" style="width:90px;">	</center>
</div>

<table>
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
		
<div>&nbsp;</div>
</div>
</div>

<%
session.removeAttribute("showAllCustomers");

%>
<html:hidden property="answer(Object::Quote::IsRenewalEndorsementQuotesAvailable)" value="N" styleId="isRenewalEndorsementQuotesAvailable"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="FIND_RENEWAL_ENDORSEMENT_QUOTES" />
<logic:present name="paramValue">
	<logic:equal value="TRUE" name="paramValue">
		<html:hidden property="answer(Object::Quote::IsRenewalEndorsementQuotesAvailable)" value="Y" styleId="isRenewalEndorsementQuotesAvailable"/>
	</logic:equal>
</logic:present>

<html:hidden property="answer(Object::Quote::createdDateBegin)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Quote::createdDateEnd)" value="" styleId="inpCreatedDateEnd"/>
<html:hidden property="answer(Object::Quote::updatedDateBegin)" value="" styleId="inpUpdatedDateBegin"/>
<html:hidden property="answer(Object::Quote::updatedDateEnd)" value="" styleId="inpUpdatedDateEnd"/>
<html:hidden property="answer(Object::Quote::effectiveDateBegin)" value="" styleId="inpEffectiveDateBegin"/>
<html:hidden property="answer(Object::Quote::effectiveDateEnd)" value="" styleId="inpEffectiveDateEnd"/>
<html:hidden property="answer(Object::Quote::SubNumber)" styleId="quoteSubNumber" />
<html:hidden property="answer(Object::Quote::quoteNumTemp)" styleId="quoteNumber" />

<html:hidden  property="answer(SearchQuote::PageNum)" value="0" />
<html:hidden  property="answer(SearchQuote::CurrentPageNum)" value="0" />
<html:hidden  property="answer(OwnerId)" value="<%=""+ownerId%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<html:hidden styleId="orderby" property="answer(SearchQuote::orderByOLD)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
<%     long agencyId = 0;
	 	try{
	 		agencyId=Long.parseLong(""+AgencyID);
	 	}catch(Exception ex){}
	 	if(agencyId > 0){
%>
    <html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectType)" value="AGENCY"/>
	<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectId)" value="<%=""+agencyId%>"/>
 <%}else{ %>
	<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>" />	
	<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
	<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
	<%if(objDescType.toString().equals("ENTITY")){%>			
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT"}%>' connector='or' negated="true">
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>" />
					<logic:present name="agencyIdent" scope="session">
						<bean:define id="agencyID" name="agencyIdent" type="java.lang.Long" scope="session"/>
						<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectType)" value="AGENCY"/>
						<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectId)" value="<%=""+agencyID%>"/>
					</logic:present>
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENCY_EMPLOYEE"}%>' connector='or' negated="true">
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>" />
					<logic:present name="agencyIdent" scope="session">
						<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
						<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectId)" value="<%=""+agencyIdid%>"/>
						<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectType)" value="AGENCY"/>
					</logic:present>
			</dmshtml:dms_static_with_connector>			
	<%}else if(objDescType.toString().equals("AGENCY")){ %>
			<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectType)" value="AGENCY"/>
			<html:hidden property="answer(Object::Quote::QuoteSearch::SearchObjectId)" value="<%=""+objDescId%>"/>	
	<%} %>
 <%}%>	

<SCRIPT type="text/JavaScript">

</script>	
</html:form>

