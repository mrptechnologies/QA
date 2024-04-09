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

<SCRIPT type="text/JavaScript">
<!--
function GoTOFindButton()
{
var formElement=document.forms[0];

var cbeginMM=formElement.csdmm.value;
var cbeginDD=formElement.csddd.value;
var cbeginYY=formElement.csdyy.value;
var cendMM=formElement.cedmm.value;
var cendDD=formElement.ceddd.value;
var cendYY=formElement.cedyy.value;

var uCrebeginMM=formElement.usdmm.value;
var uCrebeginDD=formElement.usddd.value;
var uCrebeginYY=formElement.usdyy.value;
var uCreendMM=formElement.uedmm.value;
var uCreendDD=formElement.ueddd.value;
var uCreendYY=formElement.uedyy.value;

var uEffbeginMM=formElement.efsmm.value;
var uEffbeginDD=formElement.efsdd.value;
var uEffbeginYY=formElement.efsyy.value;
var uEffendMM=formElement.efemm.value;
var uEffendDD=formElement.efedd.value;
var uEffendYY=formElement.efeyy.value;

if((uCrebeginMM!="")&&(uCrebeginDD!="")&&(uCrebeginYY!="")) {
formElement.inpUpdatedDateBegin.value=uCrebeginYY+"-"+uCrebeginMM+"-"+uCrebeginDD;
}

if((uCreendMM!="")&&(uCreendDD!="")&&(uCreendYY!="")) {
formElement.inpUpdatedDateEnd.value=uCreendYY+"-"+uCreendMM+"-"+uCreendDD;
}

if((cbeginMM!="")&&(cbeginDD!="")&&(cbeginYY!="")) {
formElement.inpCreatedDateBegin.value=cbeginYY+"-"+cbeginMM+"-"+cbeginDD;
}

if((cendMM!="")&&(cendDD!="")&&(cendYY!="")) {
formElement.inpCreatedDateEnd.value=cendYY+"-"+cendMM+"-"+cendDD;
}

if((uEffbeginMM!="")&&(uEffbeginDD!="")&&(uEffbeginYY!="")) {
formElement.inpEffectiveDateBegin.value=uEffbeginYY+"-"+uEffbeginMM+"-"+uEffbeginDD;
}

if((uEffendMM!="")&&(uEffendDD!="")&&(uEffendYY!="")) {
formElement.inpEffectiveDateEnd.value=uEffendYY+"-"+uEffendMM+"-"+uEffendDD;
}

var quoteNumber = formElement.quoteNumberTemp.value;

if(quoteNumber !="") {

var quoteAndSubQuoteNum = quoteNumber.split("-");

if(quoteAndSubQuoteNum.length==2) {

	formElement.quoteNumber.value=quoteAndSubQuoteNum[0];
	formElement.quoteSubNumber.value=quoteAndSubQuoteNum[1];
} else {

	formElement.quoteNumber.value=quoteNumber;
}
}else {
	formElement.quoteNumber.value=quoteNumber;		
}	

return true;
}

//-->
</SCRIPT>

<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<html:form action="/FindQuotes.do"  onsubmit="return GoTOFindButton()">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td height="5">
		
		</td>
	</tr>

	<tr>
		<td class="NewSectionHead" colspan="4" align="center">FIND QUOTES</td>
	</tr>

 	<tr>
 		<td>
 			&nbsp;
 		</td>
 	</tr>

	<tr>
		<td>
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">

				<tr>
					<td width="40%" align="right" class="FormLabels">
					
						Quote Number
					</td> 
					
					<td align="left" >
						
						<html:text  property="answer(Object::Quote::quoteNumTemp)" styleClass="txtbox" styleId="quoteNumberTemp" />
					</td>
				</tr>

				<tr>
					<td width="30%" class="FormLabels" align="right">
					
						Insured Name
					 </td>
					<td class="links">
				
						<html:text  property ="answer(Object::Quote::customerName)"   styleClass="txtbox"/>
					</td>
				</tr>
				
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_NAME_VIEW"}%>' connector='or' negated="true">  
				<tr>
					<td width="30%" class="FormLabels" align="right">
					
						Quote Name
					 </td>
					<td class="links">
				
						<html:text  property ="answer(Object::Quote::QuoteName)"   styleClass="txtbox"/>
					</td>
				</tr>
				</dmshtml:dms_static_with_connector>

				<tr>
					<td width="30%" class="FormLabels" align="right">
						Quote Type
					</td>
					<td class="links">
						<html:select property="answer(Object::Quote::quoteType)" styleClass="txtbox">
							<html:option value ="">All</html:option>
							<html:option value ="RENEWAL">Renewal</html:option>
							<html:option value ="NEW_BUSINESS">New Business</html:option>
						</html:select>
					</td>
				</tr>

				<tr>
					<td width="30%" class="FormLabels" align="right">
							Quote Status 
					</td>
					
					<td class="links">
						<html:select property="answer(Object::Quote::quoteStatus)" styleClass="txtbox">
							<html:option value ="">All</html:option>							
							<html:option value ="In Progress">In Progress</html:option>	
							<html:option value ="Referred">Referred</html:option>						
							<html:option value ="Offered">Offered</html:option>
							<html:option value ="Lapsed">Lapse</html:option>
							<html:option value="Bind Request">Bind Request</html:option>
							<html:option value="Bound">Bound</html:option>
							<html:option value="Issued">Issued</html:option>
							
							
						</html:select>
					</td>
				</tr>
				

					<%	com.dms.ejb.data.QuestionHashMap qmapExtNames =   new com.dms.ejb.data.QuestionHashMap(10);%>
					<dmshtml:execute_rules 
						nameInSession="GETEXTRACTNAMES" 					dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"
						formName="form::VIEWRATECARD"
						answerMap="<%=qmapExtNames%>" 
						processInstance="preprocess" />
					<logic:present name='GETEXTRACTNAMES' scope='request'>
					<%if(qmapExtNames.containsKey("renewalMonths")) {
					try {
						java.util.ArrayList arrDates = (java.util.ArrayList)qmapExtNames.get("renewalMonths");	
						if(arrDates.size()>0){ 	%>
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Renewal Month
					</td> 
				
					<td class="links" >&nbsp; 
						<html:select property="answer(Object::Quote::renewalMonth)" >
							<html:option value =''>Select</html:option>
								<%
								for(int i=0; i<arrDates.size();i++ ) {
									com.dms.ejb.data.QuestionHashMap qmap_Temp = (com.dms.ejb.data.QuestionHashMap)arrDates.get(i);
								%>
								<html:option value='<%=qmap_Temp.getString("renewalMonth")%>'>
								<%=qmap_Temp.getString("renewalMonth")%>
								</html:option>
								<%}%>
						</html:select>
					</td>
				</tr>
					<%}
					} catch(Exception ex){}	
					}%>

					</logic:present>


				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
						Quote Create Start Date
					</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].csddd.focus()}" styleId="csdmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].csdyy.focus()}" styleId="csddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].cedmm.focus()}" styleId="csdyy" />&nbsp;(MM/DD/YYYY)
					</td>
				</tr>

				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">Quote Create End Date
				</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].ceddd.focus()}" styleId="cedmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].cedyy.focus()}" styleId="ceddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="cedyy" />&nbsp;(MM/DD/YYYY)
					</td>

				</tr>

				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
						Quote Updated Start Date
					</td>
					
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].usddd.focus()}" styleId="usdmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].usdyy.focus()}" styleId="usddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].uedmm.focus()}" styleId="usdyy" />&nbsp;(MM/DD/YYYY)
					</td>
		
				</tr>

				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
						Quote Updated End Date
					</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].ueddd.focus()}" styleId="uedmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].uedyy.focus()}" styleId="ueddd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="uedyy" />&nbsp;(MM/DD/YYYY)
					</td>
				</tr>

				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
						Quote Effective Start Date
					</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].efsdd.focus()}" styleId="efsmm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].efsyy.focus()}" styleId="efsdd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].efemm.focus()}" styleId="efsyy" />&nbsp;(MM/DD/YYYY)
					</td>
		
				</tr>

				<tr>
					<td width="30%" class="FormLabels" align="right" height="25">
						
						Quote Effective End Date
					</td>
		
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].efedd.focus()}" styleId="efemm" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].efeyy.focus()}" styleId="efedd" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="efeyy" />&nbsp;(MM/DD/YYYY)
					</td>
				</tr>

				<tr>
					<td>
						&nbsp;
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center" >
						<html:submit value="Find" property="Search" styleClass="sbttn"/>
						&nbsp;&nbsp;&nbsp;
						<html:reset value="Clear" styleClass="sbttn"/>
						&nbsp;&nbsp;&nbsp;
						<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<hr size="1" noshade>
		</td>
	</tr>
</table>

<%
session.removeAttribute("showAllCustomers");

%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<html:hidden property="answer(Object::Quote::createdDateBegin)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Quote::createdDateEnd)" value="" styleId="inpCreatedDateEnd"/>
<html:hidden property="answer(Object::Quote::updatedDateBegin)" value="" styleId="inpUpdatedDateBegin"/>
<html:hidden property="answer(Object::Quote::updatedDateEnd)" value="" styleId="inpUpdatedDateEnd"/>
<html:hidden property="answer(Object::Quote::effectiveDateBegin)" value="" styleId="inpEffectiveDateBegin"/>
<html:hidden property="answer(Object::Quote::effectiveDateEnd)" value="" styleId="inpEffectiveDateEnd"/>
<html:hidden property="answer(Object::Quote::SubNumber)" styleId="quoteSubNumber" />
<html:hidden property="answer(Object::Quote::quoteNum)" styleId="quoteNumber" />

<html:hidden  property="answer(SearchQuote::PageNum)" value="0" />
<html:hidden  property="answer(SearchQuote::CurrentPageNum)" value="0" />
<html:hidden  property="answer(OwnerId)" value="<%=""+ownerId%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<html:hidden styleId="orderby" property="answer(SearchQuote::orderBy)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
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
	
</html:form>
