<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/QuoteSummary.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AutoRenewal.js"> </SCRIPT>
<script type="text/javascript">

	
function GoToRenewal() {
	
	var formElement = document.forms[0];
	
	var CrebeginMM=formElement.Date1.value;
	var CrebeginDD=formElement.Date2.value;
	var CrebeginYY=formElement.Date3.value;
	var CreendMM=formElement.Date4.value;
	var CreendDD=formElement.Date5.value;
	var CreendYY=formElement.Date6.value;
	
if(CreendYY!="" && CrebeginMM < 1 || CrebeginMM > 12){
	alert("month should be 1-12");
	return false;
}
if(CreendMM!="" && CreendMM < 1 || CreendMM > 12){
	alert("month should be 1-12");
	return false;
}
if(CrebeginDD!="" && CrebeginDD < 1 || CrebeginDD > 31){
	alert("date should be 1-31");
	return false;
}
if(CreendDD!="" && CreendDD < 1 || CreendDD > 31){
	alert("date should be 1-31");
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

if((CrebeginMM!="")&&(CrebeginDD!="")&&(CrebeginYY!="")) {
	formElement.inpDateBegin.value=CrebeginYY+"-"+CrebeginMM+"-"+CrebeginDD;
}
if((CreendMM!="")&&(CreendDD!="")&&(CreendYY!="")) {
	formElement.inpDateEnd.value=CreendYY+"-"+CreendMM+"-"+CreendDD;
}
}
</script>

<%
String viewCurrentStatusButton = "Y";
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

<html:form action="/GetRenewalProcessSummary.do" onsubmit="return GoToRenewal();">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="policyCount" name="RenewalList" property="answer(NoOfPolicies)" scope="request" />
<bean:define id="inpDateBegin" name="RenewalList" property="answer(Object::Automated::Renewal::StartDate)" />
<bean:define id="inpDateEnd" name="RenewalList" property="answer(Object::Automated::Renewal::EndDate)" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<%
long policyPendingCount=0;
long policyProcessedCount=0;
long quotePendingCount=0;
long quoteProcessedCount=0;
boolean pageHeadingSet = false;
%>
<div class="formpage01">
<div class="content">
<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
						<table WIDTH="760px" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							
							<tr>
								<td>
									<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
									
										<tr>
										<logic:equal property="answer(PROCESS_TYPE)" value="QUOTE" name="RenewalList">
											<td colspan="4" align="center"><div class="formheadnew"><h2 class="left">AUTOMATED RENEWAL QUOTE CREATION PROCESS.</h2></div></td>
											<%pageHeadingSet = true; %>											
										</logic:equal>
										<logic:equal property="answer(PROCESS_TYPE)" value="OFFER" name="RenewalList">
											<td colspan="4" align="center"><div class="formheadnew"><h2 class="left">STEP 2: AUTOMATED RENEWAL QUOTE OFFER PROCESS.</h2></div></td>
											<%pageHeadingSet = true; %>
										</logic:equal>
										<logic:equal property="answer(PROCESS_TYPE)" value="NO_ACTIVE_PROCESS" name="RenewalList">
											<td colspan="4" align="center"><div class="formheadnew"><h2 class="left">AUTOMATED RENEWAL PROCESS. </h2></div></td>
											<%pageHeadingSet = true; %>
										</logic:equal>
										<logic:equal property="answer(PROCESS_TYPE)" value="COMPLETED" name="RenewalList">
											<td colspan="4" align="center"><div class="formheadnew"><h2 class="left">AUTOMATED RENEWAL PROCESS COMPLETED.</h2></div></td>
											<%pageHeadingSet = true; %>
										</logic:equal>
										<logic:equal property="answer(PageLoadForFirstTime)" value="N" name="RenewalList">
											<logic:equal property="answer(PROCESS_STATUS)" value="" name="RenewalList">
												<td colspan="4" align="center"><div class="formheadnew"><h2 class="left">AUTOMATED RENEWAL PROCESS. </h2></div></td>
												<%pageHeadingSet = true; %>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="Automated" name="RenewalList">
												<td colspan="4" align="center"><div class="formheadnew"><h2 class="left">AUTOMATED RENEWAL PROCESS. </h2></div></td>
												<%pageHeadingSet = true; %>
											</logic:equal>
										</logic:equal>											
										<%if(!pageHeadingSet) { %>
											<td colspan="4" align="center"><div class="formheadnew"><h2 class="left">AUTOMATED RENEWAL PROCESS. </h2></div></td>
											<%pageHeadingSet = true; %>
										<%} %>
										</tr>			
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>							
										<logic:notPresent name ='QuoteCountList'>
										<table WIDTH="90%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										
										<!-- <tr>
											<td align="center">
												<INPUT TYPE="submit"  class="sbttn2"  property="answer(refresh)"  value="VIEW CURRENT STATUS" id="viewcurrentstatus"/>
											</td>
										</tr>-->
										</logic:notPresent>
										<logic:present name="AutomatedRenewal" >
										<tr>
											<td class="error">
												Automated Renewal Creation Completed !!!
											</td>
										</tr>
										</logic:present>
										<tr>
										<logic:equal property="answer(PROCESS_STATUS)" value="STARTED" name="RenewalList">
											<logic:equal property="answer(PROCESS_TYPE)" value="QUOTE" name="RenewalList">
												<td class="Error" colspan="4" align="center"> Auto renewal quote creation process is running...</td>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="OFFER" name="RenewalList">
												<td class="Error" colspan="4" align="center">Auto renewal quote offer process is running...</td>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="NO_ACTIVE_PROCESS" name="RenewalList">
												<td class="Error" colspan="4" align="center">Auto Renewal Process is not Started...</td>
											</logic:equal>
											<logic:equal property="answer(PageLoadForFirstTime)" value="N" name="RenewalList">
												<logic:equal property="answer(PROCESS_TYPE)" value="Automated" name="RenewalList">
													<td class="Error" colspan="4" align="center"> There are NO Policies found to Renew under the following search criteria.</td>
													<% viewCurrentStatusButton = "N"; %>
												</logic:equal>
											</logic:equal>
										</logic:equal>
										<logic:equal property="answer(PROCESS_STATUS)" value="COMPLETED" name="RenewalList">
											<logic:equal property="answer(PROCESS_TYPE)" value="QUOTE" name="RenewalList">
												<td class="Error" colspan="4" align="center"> Auto renewal quote creation process Completed.</td>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="OFFER" name="RenewalList">
												<td class="Error" colspan="4" align="center">Auto renewal quote offer process Completed.</td>
											</logic:equal>
										</logic:equal>
										<logic:equal property="answer(PageLoadForFirstTime)" value="N" name="RenewalList">
											<logic:equal property="answer(PROCESS_STATUS)" value="null" name="RenewalList">
												<td class="Error" colspan="4" align="center">There are NO Policies found to Renew under the following search criteria.</td>
												<% viewCurrentStatusButton = "N"; %>
											</logic:equal>
										</logic:equal>
										<logic:equal property="answer(PageLoadForFirstTime)" value="N" name="RenewalList">
											<logic:equal property="answer(PROCESS_STATUS)" value="" name="RenewalList">
												<td class="Error" colspan="4" align="center">There are NO Policies found to Renew under the following search criteria.</td>
												<% viewCurrentStatusButton = "N"; %>
											</logic:equal>
										</logic:equal>
										</tr>

										<table WIDTH="90%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td class="FormLabels">
												Policy Expiration Start Date:
											</td>
											<td class="FormLabels">
												<bean:write property="answer(Object::Automated::Renewal::StartDate)" name="RenewalList"/>
											</td>
										</tr>
											<tr>
											<td class="FormLabels">
												Policy Expiration End Date:
											</td>
											<td class="FormLabels">
												<bean:write property="answer(Object::Automated::Renewal::EndDate)" name="RenewalList"/>
											</td>
										</tr>
	
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<logic:present name ='QuoteCountData'>
										<logic:iterate id="searchResultData"  name='QuoteCountData' type="com.dms.ejb.data.QuestionHashMap">
										<logic:equal property="answer(PROCESS_TYPE)" value="QUOTE" name="RenewalList">
								   			<%
								   			if(searchResultData.getString("Object::Quote::Status").equalsIgnoreCase("Pending policies")){
								   				policyPendingCount = Long.parseLong("0"+searchResultData.getString("Object::Quote::Count"));
								   			}else{
								   				policyProcessedCount = policyProcessedCount + Long.parseLong("0"+searchResultData.getString("Object::Quote::Count"));
								   			}
								   			
								   			%>   
										 </logic:equal>
										 <logic:equal property="answer(PROCESS_TYPE)" value="OFFER" name="RenewalList">
								   			<%
								   			System.out.println("QuoteStatus"+searchResultData.getString("Object::Quote::Status"));
							   				System.out.println("policyProcessedCount"+searchResultData.getString("Object::Quote::Count"));
								   			if(searchResultData.getString("Object::Quote::Status").equalsIgnoreCase("Pending quotes")){
								   				quotePendingCount = Long.parseLong("0"+searchResultData.getString("Object::Quote::Count"));
								   			}else{
								   				quoteProcessedCount = quoteProcessedCount + Long.parseLong("0"+searchResultData.getString("Object::Quote::Count"));
								   			}
								   			
								   			%>   
										 </logic:equal>
										 
										</logic:iterate>
										</logic:present>
										
										<tr>
											<td colspan="3" class="TextMatter">
											<b>Rule 1:</b> Policies Expiring in above selected period <br>
											<b>Rule 2:</b> Policies set for Renewal in the Policy Renewal tab <br>
											<b>Rule 3:</b> No Renewal quotes created for the Policy<br><br>
											</td>										
										</tr>
										
										<tr>
											<logic:equal property="answer(PROCESS_TYPE)" value="QUOTE" name="RenewalList">
												<td class="FormLabels">
												Number of Renewing Policies identified for creating renewal quotes for given criteria above :
												</td>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="OFFER" name="RenewalList">
												<td class="FormLabels">
												Number of Renewal Quotes identified for Offer for the critieria given above:
												</td>
											</logic:equal>
											
											<logic:notEqual property="answer(PROCESS_STATUS)" value="" name="RenewalList">
												<logic:notEqual property="answer(PROCESS_STATUS)" value="null" name="RenewalList">
													<logic:notEqual property="answer(PROCESS_TYPE)" value="Automated" name="RenewalList">
														<td class="SearchResult">
															<%=""+policyCount%>
														</td>
													</logic:notEqual>
												</logic:notEqual>
											</logic:notEqual>
											
										</tr>
										
										<tr>
											<td>
												<hr style="border:1px solid #7094D1">
											</td>
											<td>
												<hr style="border:1px solid #7094D1">
											</td>
										</tr>
										<tr>
											<logic:equal property="answer(PROCESS_TYPE)" value="QUOTE" name="RenewalList">
												<td class="FormLabels">
													Number of Policies Processed:
												</td>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="OFFER" name="RenewalList">
												<td class="FormLabels">
													Number Of Renewal Quotes Processed:
												</td>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="QUOTE" name="RenewalList">
												<td class="SearchResult">
												<%=""+policyProcessedCount%>
												</td>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="OFFER" name="RenewalList">
												<td class="SearchResult">
												<%=""+quoteProcessedCount%>
											</td>
											</logic:equal>
											
											
										</tr>
										
										<tr>
											<logic:equal property="answer(PROCESS_TYPE)" value="QUOTE" name="RenewalList">
												<td class="FormLabels">
													Number of Pending Policies to Renew:
												</td>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="OFFER" name="RenewalList">
												<td class="FormLabels">
													Number Of Pending Renewal Quotes:
												</td>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="QUOTE" name="RenewalList">
												<td class="SearchResult">
												<%=""+policyPendingCount%>
											</td>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="OFFER" name="RenewalList">
												<td class="SearchResult">
												<%=""+quotePendingCount%>
											</td>
											</logic:equal>
											
											
										</tr>
										<tr>
											<td>
												<hr style="border:1px solid #7094D1">
											</td>
											<td>
												<hr style="border:1px solid #7094D1">
											</td>
										</tr>
										
										<logic:equal property="answer(PROCESS_STATUS)" value="STARTED" name="RenewalList">
											<logic:equal property="answer(PROCESS_TYPE)" value="QUOTE" name="RenewalList">
											<tr>
												<td class="FormLabels">											
									   				Quote Creation Status   								   			
											    </td>										    
											    <td class="FormLabels">
											  		 Number Of Quotes
											   	</td>										   	
											</tr>
											</logic:equal>
											<logic:equal property="answer(PROCESS_TYPE)" value="OFFER" name="RenewalList">
											<tr>
												<td class="FormLabels">											
									   				Quote Offering Status   								   			
											    </td>										    
											    <td class="FormLabels">
											  		 Number Of Quotes
											   	</td>										   	
											</tr>
											</logic:equal>
										</logic:equal>
										<logic:equal property="answer(PROCESS_STATUS)" value="COMPLETED" name="RenewalList">
										<tr>
											<td class="FormLabels">											
								   				Quote Creation Status   								   			
										    </td>										    
										    <td class="FormLabels">
										  		 Number Of Quotes
										   	</td>										   	
										</tr>
										</logic:equal>										
										<logic:present name ='QuoteCountList'>
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
										
										<logic:equal property="answer(PROCESS_STATUS)" value="COMPLETED" name="RenewalList">
										<tr>
											<!-- <td align="center">
												<INPUT TYPE="BUTTON"  class="sbttn2"  property="answer(refresh)"  value="OK" id="viewcurrentstatus"/>
											</td>
											-->
										</tr>
										</logic:equal>
										</logic:present>
										<% if(viewCurrentStatusButton.equalsIgnoreCase("Y")) { %>
										<tr>
											<td align="center" colspan="3">
												<INPUT title="<bean:message key='ToolTip.AutoRenewalSummary.CurrentStatus'/>" TYPE="submit" style="width: 300px"  class="covbutton" property="answer(refresh)"  value="Refresh Current Processing Status" id="viewcurrentstatus"/>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<%} %>
										</table>
										
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
			
			<!-- New hidder variables -->
			
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(Quote::Page)" value="" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="Automated_Renewal" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="Automated_Renewal" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="Automated_Renewal" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="Automated_Renewal" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			<html:hidden property="answer(PageLoadForFirstTime)" value="N" />
			
			<html:hidden property="answer(Object::Automated::Renewal::StartDate)" value='<%=""+inpDateBegin %>' styleId="inpDateBegin"/>
			<html:hidden property="answer(Object::Automated::Renewal::EndDate)" value='<%=""+inpDateEnd %>' styleId="inpDateEnd"/>
			
			<input type="hidden" name="answer(RULE_OBJECT_ID)" value=""/>
			<input type="hidden" name="answer(RULE_OBJECT_VER_ID)" value="" />
			<input type="hidden" name="answer(RULE_OBJECT_TYPE)" value="PRODUCT"/>
			<input type="hidden" name="answer(RULE_OBJECT_NAME)" value="APPLICATION"/>
			<input type="hidden" name="answer(MERGE_BEFORE)" value="YES"/>
			<input type="hidden" name="answer(MERGE_AFTER)" value="NO"/>
			<input type="hidden" name="answer(ASSERT_MAP_ENTRIES)" value="YES" />
			<input type="hidden" name="answer(MODIFIED_FACT_MAP)" value="YES" />
			<input type="hidden" name="answer(OwnerId)" value="<%=ownerId.toString()%>" />
			<input type="hidden" name="answer(NoOfPolicies)" value="<%=policyCount.toString()%>" />			
			<!-- Rules Related Variables: END -->
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
			
			<input type="hidden" name="answer(Object::Automated::Renewal::OwnerId)" value="<%=ownerId.toString()%>" />
			<input type="hidden" name="answer(Object::Automated::Renewal::ProcessType)" />
		</td>
	</tr>

</table>    
</td></tr></table>
</td></tr></table>
</div>
</div>

</html:form>


