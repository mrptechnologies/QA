<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/QuoteSummary.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AutoRenewal.js"> </SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript">

	
function GoToRenewal() {
	
	var formElement = document.forms[0];
	
	var CrebeginMM=formElement.Date1.value;
	var CrebeginDD=formElement.Date2.value;
	var CrebeginYY=formElement.Date3.value;
	var CreendMM=formElement.Date4.value;
	var CreendDD=formElement.Date5.value;
	var CreendYY=formElement.Date6.value;
	var daysInMonth = DaysArray(12);
	
if(CreendYY!="" && CrebeginMM < 1 || CrebeginMM > 12){
	alert("month should be 1-12");
	return false;
}
if(CreendMM!="" && CreendMM < 1 || CreendMM > 12){
	alert("month should be 1-12");
	return false;
}


if(CrebeginDD!="" && CrebeginDD < 1 || CrebeginDD > daysInMonth[parseInt(CrebeginMM)]){
	alert("Date should be 1-"+daysInMonth[parseInt(CrebeginMM)]);
	formElement.Date2.focus();
	return false;
}	
if(CreendDD!="" && CreendDD < 1 || CreendDD > daysInMonth[parseInt(CreendMM)]){
	alert("Date should be 1-"+daysInMonth[parseInt(CreendMM)]);
	formElement.Date5.focus();
	return false;
}
if(CrebeginYY!="" && CrebeginYY<999){
	alert("year should be >999");
	return false;
}
if(CreendYY!="" && CreendYY<999){
	alert("year should be >999");
	return false;
}


if(isNaN(CrebeginMM)){
	alert("should be numeric.");
	return false;
}
if(isNaN(CrebeginDD)){
	alert("should be numeric.");
	return false;
}
if(isNaN(CrebeginYY)){
	alert("should be numeric.");
	return false;
}
if(isNaN(CreendMM)){
	alert("should be numeric.");
	return false;
}
if(isNaN(CrebeginDD)){
	alert("should be numeric.");
	return false;
}
if(isNaN(CreendYY)){
	alert("should be numeric.");
	return false;
}
if(CrebeginMM.length != 2) {
	alert("Enter valid Policy Expiration Start Month");
	return false;
}
if(CrebeginDD.length != 2) {
	alert("Enter valid Policy Expiration Start Date");
	return false;
}
if(CrebeginYY.length != 4) {
	alert("Enter valid Policy Expiration Start Year");
	return false;
}
if(CreendMM.length != 2) {
	alert("Enter valid Policy Expiration End Month");
	return false;
}
if(CreendDD.length != 2) {
	alert("Enter valid Policy Expiration End Date");
	return false;
}
if(CreendYY.length != 4) {
	alert("Enter valid Policy Expiration End Year");
	return false;
}

if((CrebeginMM==2 && CrebeginDD>29 && (CrebeginYY%4==0)) || (CrebeginMM==2 && CrebeginDD>28 && (CrebeginYY%4!=0))) {
	alert("'Policy Expiration Start Date' isInvalid");
	return false;
}
if((CreendMM==2 && CreendDD>29 && (CreendYY%4==0)) || (CreendMM==2 && CreendDD>28 && (CreendYY%4!=0))) {
	alert("'Policy Expiration End Date' is Invalid");
	return false;
}	
if((CrebeginMM!="")&&(CrebeginDD!="")&&(CrebeginYY!="")) {
	formElement.inpDateBegin.value=CrebeginYY+"-"+CrebeginMM+"-"+CrebeginDD;
}
if((CreendMM!="")&&(CreendDD!="")&&(CreendYY!="")) {
	formElement.inpDateEnd.value=CreendYY+"-"+CreendMM+"-"+CreendDD;
}
return true;
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}
function validateSubmit() {
	
	if(GoToRenewal()) {	
	  SubmitToCreateQuote();	
	  return true;
	}	
	return false;
}
</script>

<%
java.util.Calendar scal = java.util.Calendar.getInstance();
java.util.Calendar cal = java.util.Calendar.getInstance();
int currentDateI = scal.get(java.util.Calendar.DATE);
String currentDate = ""+currentDateI;
if(currentDateI <= 9 ){
	currentDate = "0"+currentDateI;
}
int currentMonthI = scal.get(java.util.Calendar.MONTH) + 1;
String currentMonth = ""+currentMonthI;
if(currentMonthI <= 9 ){
	currentMonth = "0"+currentMonthI;
}
int currentYear = scal.get(java.util.Calendar.YEAR);

cal.add(java.util.Calendar.DATE, 90);
int endDateI = cal.get(java.util.Calendar.DATE);
String endDate = ""+endDateI;
if(endDateI <= 9 ){
	endDate = "0"+endDateI;
}
int endMonthI = cal.get(java.util.Calendar.MONTH) + 1;
String endMonth = ""+endMonthI;
if(endMonthI <= 9 ){
	endMonth = "0"+endMonthI;
}
int endYear = cal.get(java.util.Calendar.YEAR);
%>

<html:form action="/GetRenewalProcessSummary.do" onsubmit="return validateSubmit();">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<div class="formpage01">
<div class="content">

<table WIDTH="98%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
	<tr>
		<td>
			<table WIDTH="98%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
						<table WIDTH="98%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							
							<tr>
								<td>
									<table WIDTH="90%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
		
										<tr>											
											<td colspan="4" align="center"><div class="formheadnew"><h2 class="left">AUTOMATED RENEWAL</h2></div></td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<logic:present name="AutomatedRenewal" >
										<tr>
											<td class="error">
												Automated Renewal Creation Completed !!!
											</td>
										</tr>
										</logic:present>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr style='display:none' id="panel" >
											<td class="error" >Auto Renewal Quote Creation Process is Running...</td>
										</tr>
										
										<logic:equal property="answer(Object::AutoRenewal::Running)" value="YES" name="RenewalList">
										<tr>
											<td class="error" >Auto Renewal Process Completed</td>
										</tr>
										<logic:present name ='QuoteCountList'>
										<table WIDTH="50%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td class="FormLabels">
												No Of Policies
											</td>
											<td class="SearchResult">
												135
											</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td class="FormLabels">
								   				Quote Status   
										    </td>
										    
										    <td class="FormLabels">
										  		 No Of Quotes
										   	</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<logic:iterate id="searchResultQMap"  name='QuoteCountList' type="com.dms.ejb.data.QuestionHashMap">
										
										<tr>
											<td class="SearchResult">
								   				<%=searchResultQMap.getString("Object::Quote::Status")%>   
										    </td>
										    
										    <td class="SearchResult">
										  		 <%=searchResultQMap.getString("Object::Quote::Count")%>   
										   	</td>
										 </tr>
										 
										</logic:iterate>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td align="center">
												<INPUT TYPE="button"  class="covbutton"  property="answer(refresh)"  value="VIEW CURRENT STATUS" id="viewcurrentstatus" onclick="javascript:location.reload(true)"/>
											</td>
										</tr>
										</table>
										</logic:present>
										
										
										</logic:equal>
										<logic:notEqual property="answer(Object::AutoRenewal::Running)" value="YES" name="RenewalList">
										<tr>
											<td align="center">	
												<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
													<tr>
														<td>
															<table width="100%" border="0" align="center">
															<!-- Rule Status & Messages :START -->
																<tr>
																	<td width="40%" class="field" align="right" height="25">Policy Expiration Start Date :&nbsp;&nbsp;</td>
																	<td width="60%" align="left" >
																	<html:text  property ="answer(Month)" value='<%=""+currentMonth%>' onkeyup="if(this.value.length==2) {document.forms[0].Date2.focus()}" size="2" maxlength="2" styleClass="txtbox" styleId="Date1" />&nbsp;
																	<html:text  property ="answer(Date)"  value="<%=""+currentDate%>"  onkeyup="if(this.value.length==2) {document.forms[0].Date3.focus()}" size="2" maxlength="2" styleClass="txtbox"  styleId="Date2" />&nbsp;
																	<html:text  property ="answer(Year)"  value="<%=""+currentYear%>"  onkeyup="if(this.value.length==4) {document.forms[0].Date4.focus()}" size="4" maxlength="4" styleClass="txtbox" styleId="Date3" />&nbsp;(MM/DD/YYYY)</td>
																</tr>
															
																<tr>
																	<td width="40%" class="field" align="right" height="25">Policy Expiration End Date :&nbsp;&nbsp;</td>
																	<td width="60%" align="left" >
																	<html:text  property ="answer(Month)" value="<%=""+endMonth%>" onkeyup="if(this.value.length==2) {document.forms[0].Date5.focus()}" size="2" maxlength="2" styleClass="txtbox" styleId="Date4" />&nbsp;
																	<html:text  property ="answer(Date)" value="<%=""+endDate%>" onkeyup="if(this.value.length==2) {document.forms[0].Date6.focus()}" size="2" maxlength="2" styleClass="txtbox"  styleId="Date5" />&nbsp;
																	<html:text  property ="answer(Year)" value="<%=""+endYear%>" size="4" maxlength="4" styleClass="txtbox" styleId="Date6" />&nbsp;(MM/DD/YYYY)</td>
															
																
																</tr>
																<tr>
																	<td>
																		&nbsp;
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td>
															<table width="100%" border="0" align="center">
															<tr>
															<td align="center" class="TextMatter" >
															
																		&nbsp;&nbsp;This process will create Renewal quotes for the Policies under the given criteria.<br>
																		&nbsp;&nbsp;<b>Rule 1:</b> Policies Expiring in above selected period <br>
																		&nbsp;&nbsp;<b>Rule 2:</b> Policies set for Renewal in the Policy Renewal tab <br>
																		&nbsp;&nbsp;<b>Rule 3:</b> No Renewal quotes created for the Policy<br><br><br><br>
																		
															</td>
															</tr>
															<%-- 
															<logic:equal property="answer(Object::AutoRenewal::Running)" value="NO" name="RenewalList">
															<logic:notEqual property="answer(AUTO_OFFER_ENABLED)" value="yes" name="RenewalList"> --%>
																	<tr>	
																		<td align="center" class="TextMatter">
																			<logic:notPresent name="AutomatedRenewal" >
																				&nbsp;&nbsp;This process will create "In Progress" Renewal quotes and set "Renewal Quote Created" notification message for the Broker user.<br>     
																				&nbsp;&nbsp;Do you want to start <font color="FF0000"> Renewal Quote Creation Process </font> for above criteria?
																				<input type="radio" name="answer(Object::QuoteAdditional::Create)" value="Yes" id="proposalYES" onclick="QuoteCreateEnable(this.form,this.document)">&nbsp;Yes 
																				<input type="radio" name="answer(Object::QuoteAdditional::Create)" value="No" checked="checked" id="proposalNO" onclick="QuoteCreateDisable(this.form,this.document)">&nbsp;No 
																			</logic:notPresent>																		
																		</td>
																	</tr>
																	<tr>
																		<td>
																			&nbsp;
																		</td>
																	</tr>
																	<tr>
																		<td align="center" class="links">
																			<logic:notPresent name="AutomatedRenewal" >																				
									      										<INPUT title="<bean:message key='ToolTip.AutoRenewalConfirm.StartQuoteCreationProcess'/>" TYPE="SUBMIT" style="width: 300px" class="covbutton"  property="answer(createquote)"  value="Start Renewal Quote creation process" id="QuoteProposalSubmit" disabled="disabled"/>									      										
																			</logic:notPresent>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			&nbsp;
																		</td>
																	</tr>
																	
																	<%-- 
																</logic:notEqual> --%>
																<logic:equal property="answer(AUTO_OFFER_ENABLED)" value="yes" name="RenewalList">
																	<tr>	
																		<td>
																			<logic:notPresent name="AutomatedRenewal" >
																				Do you want start Renewal Quote Creation Process for the given criteria entered above? &nbsp;&nbsp;&nbsp; 
																				<input type="radio" name="answer(Object::QuoteAdditional::Create)" value="Yes" id="proposalYES" onclick="QuoteProposalEnable1(this.form,this.document)">&nbsp;Yes 
																				<input type="radio" name="answer(Object::QuoteAdditional::Create)" value="No" checked="checked" id="proposalNO" onclick="QuoteCreateDisable(this.form,this.document)">&nbsp;No 
																			</logic:notPresent>																		
																		</td>
																	</tr>
																	<tr>
																		<td>
																			&nbsp;
																		</td>
																	</tr>
																	<tr>
																		<td align="center" class="links">
																			<logic:notPresent name="AutomatedRenewal" >																				
									      											<INPUT TYPE="button"  class="covbutton"  property="answer(createquote)"  value="Start Renewal Process" id="QuoteProposalSubmit" disabled="disabled" onclick="javascript:SubmitToCreateQuote();"/>									      										
																			</logic:notPresent>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			&nbsp;
																		</td>
																	</tr>
																</logic:equal>
															<%-- 	</logic:equal> --%>
															</table>
														</td>
													</tr>
													</logic:notEqual>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<html:hidden property="page" value="7" />
			
			<!-- New hidden variables -->
			
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(Quote::Page)" value="" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="Automated_Renewal" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="Automated_Renewal" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="Automated_Renewal" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="Automated_Renewal" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			<html:hidden property="answer(PageLoadForFirstTime)" value="Y" />
			
			<html:hidden property="answer(Object::Automated::Renewal::StartDate)" value="" styleId="inpDateBegin"/>
			<html:hidden property="answer(Object::Automated::Renewal::EndDate)" value="" styleId="inpDateEnd"/>
			
			<input type="hidden" name="answer(RULE_OBJECT_ID)" value=""/>
			<input type="hidden" name="answer(RULE_OBJECT_VER_ID)" value="" />
			<input type="hidden" name="answer(RULE_OBJECT_TYPE)" value="PRODUCT"/>
			<input type="hidden" name="answer(RULE_OBJECT_NAME)" value="APPLICATION"/>
			<input type="hidden" name="answer(MERGE_BEFORE)" value="YES"/>
			<input type="hidden" name="answer(MERGE_AFTER)" value="NO"/>
			<input type="hidden" name="answer(ASSERT_MAP_ENTRIES)" value="YES" />
			<input type="hidden" name="answer(MODIFIED_FACT_MAP)" value="YES" />
			<input type="hidden" name="answer(OwnerId)" value="<%=ownerId.toString()%>" />
			<input type="hidden" name="answer(Object::AutoRenewal::Running)" value="STARTED" />
			<!-- Rules Related Variables: END -->
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
			
			<input type="hidden" name="answer(Object::Automated::Renewal::OwnerId)" value="<%=ownerId.toString()%>" />
			<input type="hidden" name="answer(Object::Automated::Renewal::ProcessType)" value="Automated" />
		</td>
	</tr>

</table>
</div>    
</div>


</html:form>


