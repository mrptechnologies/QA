<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>


<%!
	static final int beniRater = 0;
	static final int MicaRater = 1;
	static final int MicaIowa = 3;
	String submissionProposedEffectiveDate="";
	String strProposedEffectiveDate = "";
%>

<%		
	int productGroup = beniRater;
	boolean disableCompositeFlag = true;
	boolean isEmployeeElectedMedicalFlag = false;
	boolean blnPPOFlag=false;
	boolean blnPlanFlag=false;
	boolean displayHRA=true;
	boolean displayComposite=true;

	//No PPO Network Available for the Group's Zipcode
%>

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/datatable1/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />

<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CreateQuoteBTA.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CommercialLinesRisk.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css">
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>

<style>
   .tableHeader{	border:1px solid #4E4E50;}
  .tableData{line-height:17px;text-align:left;margin:0;padding:0;font-weight:bold;}
  .yui-dt th {border-color:-moz-use-text-color #CBCBCB -moz-use-text-color -moz-use-text-color;border-style:none solid none none;border-width:medium 1px medium medium;margin:0;padding:0;color:#000000;font-weight:normal;text-decoration:none;vertical-align:bottom;background:#D8D8DA;border-collapse:separate;border-spacing:0;font-family:arial;font-size:inherit;}
  .yui-dt-table {border:1px solid #7F7F7F;border-collapse:separate;border-spacing:0;font-family:arial;font-size:inherit;margin:0;padding:0;}
</style>

<script type="text/javascript"><!--
function disableButton(frm){
var returnValue = false;
returnValue = validateEffectiveDateWhileSubmit('submit');
if(returnValue){
		//document.getElementById("CreateQuoteSubmit").disabled = true;
}
return returnValue;
}

function setSelectedRiskTypes(frm){


		if(document.getElementsByName("answer(Object::Quote::ProductGroupVerId)").length==0){
			alert("No Plans under the Selected Options");
			return false;
		}
		
		if(document.getElementsByName("answer(Object::Quote::ProductGroupVerId)")[0].value==0){
			alert("No Plans under the Selected Options");
			return false;
		}
	
		if(document.getElementById("QuoteType").value == "RENEWAL"){
			var renewalPolicyNum = document.getElementById("RenewalPolicyNumber").value;

			renewalPolicyNum = renewalPolicyNum.replace(/\s/g,"");

            if(!renewalPolicyNum.length > 0){
				alert("No Renewal Policy Number is given.Please enter renewing Policy #.");
				return false;
			}
			
		}
		
		var formElement = document.forms[0];
		var count = 0;
		
		for(var i=0; formElement.elements[i]!=null; i++) {
			if(formElement.elements[i].type=="checkbox" && formElement.elements[i].name == "answer(Object::Quote::SelectedRiskList)" && formElement.elements[i].checked == true) {
				count++;
				break;
			}
		}

		if(count<=0) {
			alert("Please select Class.");
			return false;
		}
		
		if(document.forms[0].State.value=="") {
			alert("Please select State");
		return false;
		}
		
		if(document.forms[0].NumberOfInsureds.value=="0" || document.forms[0].NumberOfInsureds.value=="") {
			alert("Please Enter Number of Insureds");
			document.forms[0].NumberOfInsureds.focus();
		return false;
		}
return disableButton(frm);
}
--></script>
<div class="productbrowse"  style="width:960px;">
<div class="content" style="width:100%;">							
<html:form action="/RateBTA.do" styleId="frm" onsubmit="{return setSelectedRiskTypes(this);}">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" value="no" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="fname" property="answer(Object::UserDetail::UserFirstName)" name="LoginPage" scope="session"/>
<bean:define id="lname" property="answer(Object::UserDetail::UserLastName)" name="LoginPage" scope="session"/>

<bean:define id="submissionId" property="answer(Object::Quote::SubmissionId)" name="AddParentQuote" scope="request" />
<bean:define id="submissionVerId" property="answer(Object::Quote::SubmissionVerId)" name="AddParentQuote" scope="request" />

<bean:define id="State" property="answer(State)" name="AddParentQuote" scope="request"/>
<html:hidden property="answer(State)" value='<%=State.toString() %>'/>
<bean:define id="RiskState" property="answer(Object::Risk::ResProperty::State)" name="AddParentQuote" scope="request"/>
<bean:define id="RiskType" property="answer(Object::Risk::ResProperty::RiskType)" name="AddParentQuote" scope="request"/>
<bean:define id="formName" property="answer(formname)" name="AddParentQuote" scope="request"/>

<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)"/>
<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
<html:hidden property="answer(Object::Risk::InsuranceTypeId)" value = "-1" />
<html:hidden  property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" styleId="customerId"/>

<html:hidden property="answer(Object::Plan::CoverageBCorrectiveAction)" value='<%=""%>' styleId="CoverageB"/> 
<html:hidden property="answer(Object::Plan::CoverageCCleanupOfPollutants)" value='<%=""%>' styleId="CoverageC"/> 

<bean:parameter id="primaryEntityId" name="answer(Object::Quote::primaryEntityId)"/>
 <%
String submissionNumber =""; 
String clearanceStatus ="";
String submissionStatus = "";
%>
<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" submissionId='<%=""+submissionId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
<logic:present name="customerDetail1" scope="request">
	<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
	<%
		submissionNumber = customerDetailMap.getString("SubmissionNumber"); 
		clearanceStatus = customerDetailMap.getString("ClearanceStatus"); 
		submissionStatus = customerDetailMap.getString("custStatus");
		if(!(customerDetailMap.getString("SubmissionProposedEffectiveDate")).equals("")){
			submissionProposedEffectiveDate = customerDetailMap.getString("SubmissionProposedEffectiveDate");
			DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
			Date effectiveDate = dateFormat.parse(submissionProposedEffectiveDate); 
			DateFormat formatter = new SimpleDateFormat("mm/dd/yyyy");
			strProposedEffectiveDate =  formatter.format(effectiveDate); 
		}else{
			DateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			Date currentDate = new Date();
			strProposedEffectiveDate = simpleDateFormat.format(currentDate);
		}
	%>
</logic:present>
 

	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td >
			<table WIDTH="100%" ALIGN="c" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<logic:notPresent name="RISK_INURED_IN_REQUEST" scope="request">
				<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >	
				<tr>
					<td>
						<jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
					</td>
				</tr>
				</logic:notEqual>
				</logic:notPresent>

<tr>
	<td  colspan="5"><div class="formhead"><h2>CREATE NEW QUOTE</h2></div></td>
</tr>

<tr><td height="5"></td></tr>
<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td  align="center" colspan="5"><h3>Select Product</h3></td>
</tr>


<!-- [1] Modified for showing message if PPO(Area Network keys) not found-->
		<bean:define id="ansmapcheck" name="AddParentQuote" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
			
			<logic:iterate id="element" name="ansmapcheck">
				<bean:define id="AreaNetWorkKeys" name="element" property="key" />
				<logic:equal name="AreaNetWorkKeys" value="AreaNetWorkKeys">
					<bean:define id="arrListckeck" name="element" property="value" type="java.util.ArrayList"/>
				
						<%if(arrListckeck.size()>0)
							{
								blnPPOFlag=false;
							}
						else
							{
								blnPPOFlag=true;
							}%>
							<bean:define id="productSelected" name="AddParentQuote" property="answer(Object::Quote::ProductId)" scope="request" />
						<%try{
							if((Long.parseLong(""+productSelected))>0)
							{
								blnPlanFlag=true;
							}
							else{
								blnPlanFlag=false;
							}
							
						}catch(Exception e)
							{
								System.out.println("Exception fired");
							}%>


						<%if(blnPPOFlag==true && blnPlanFlag==true){
							%>
							<tr>
								<td>
									<table border="0"width="100%">
										<tr>
											<td class="Error">No PPO Network Available for the Group's Zipcode !!</td>
										</tr>
									</table>
								</td>
							</tr>
						<%}%>
		
					</logic:equal>
				</logic:iterate>

<!-- [1] Done -->



		<tr>
			<td colspan="2">
				<table width="100%" border="0"  align="left">
					
					<%
							com.dms.ejb.data.QuestionHashMap qmapArea =   new com.dms.ejb.data.QuestionHashMap(10);				
							qmapArea.put("ownerId", ""+ownerId);
							qmapArea.put("dbname", ""+com.dms.web.util.DbUtils.getWriteDS(pageContext));
							qmapArea.put("Object::Customer::CustomerId", ""+customerId);					
							qmapArea.put("Object::Quote::AgencyId", ""+agencyIdTemp);
							
					%>
					<bean:define id="QuoteEffectiveDate" name ="AddParentQuote" property="answer(Object::Quote::QuoteStartDate)"/>
					
				

						<span id="message" class="Error"> </span>
					<tr >
							<td class="fieldLeft" align="right">Product&nbsp;</td>
							<td class="links" align="left" >				
								<bean:define id="arrProductGroups" name="PRODUCT_GROUPS" type="java.util.ArrayList"/>
								<span id="insPrdSelection">
									<html:select property="answer(Object::Quote::ProductGroupVerId)" styleClass='txtbox' styleId="selectGroup" onchange="return ProductBrowse()">
										
											<%
												for(int i=0;i<arrProductGroups.size();i++) {
													com.dms.ejb.data.QuestionHashMap productMap=(com.dms.ejb.data.QuestionHashMap)arrProductGroups.get(i);	
											%>				
										<html:option value ='<%=productMap.getString("Object::ProductGroup::ProductGroupVerId")%>'>
											<%=productMap.getString("Object::ProductGroup::GroupName")%></html:option>
										<%}%>
									</html:select>
								</span>
							</td>
						</tr>	
						<tr>
								<td align="right" class="fieldLeft"> Quote Type &nbsp;</td>
								<td class="sectionhead1" align="left" >
										<html:select name="AddCustomer" property="answer(Object::Quote::QuoteType)" styleId="QuoteType" onchange="showRenewalNumber(this.value);">									
											<html:option value="NEW_BUSINESS">NEW BUSINESS</html:option>							       	
									         <html:option value="RENEWAL">RENEWAL</html:option>						
							    		</html:select>								
						      </td>	
											
					  </tr>
					  <tr id="RenewalNumbertr" style="display:none;">
					  	<td align="right" class="fieldLeft">Renewing Policy # </td>
							<td class="sectionhead1" align="left"><input type="text"
								name="answer(Object::QuoteAdditional::RenewalPolicyNumber)" 
								id="RenewalPolicyNumber" size="15" maxlength="25"/>
						</td>
					  </tr>
					 
						<tr>
							<td width="0%" align="left" class="field" style="display:none"></td>
							<td class="links">
								<span id="insPrdTermSelection">
									
								</span>
							</td> 
						</tr>
						<tr>
						<td align="right" class="fieldLeft">State of Delivery:</font></td>
						
						<td align="left" class="sectionhead1">			
							<bean:define id="arrProductTerms" name="PRODUCT_TERMS" type="java.util.ArrayList"/>
							<bean:define id="cusState" name="AddParentQuote" property="answer(State)" scope="request" />
							<%
								for(int i=0;i<arrProductTerms.size();i++) {
									com.dms.ejb.data.QuestionHashMap productMap1=(com.dms.ejb.data.QuestionHashMap)arrProductTerms.get(i);	
							%>				
									<html:hidden property="answer(Object::Plan::TermInMonths)"  value ='<%=productMap1.getString("Object::Plan::TermInMonths")%>' />
							<%}%>
												    
							<dmshtml:get_state_code
								nameInSession="arrStates"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								productVerId="688"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								
								<html:select name="AddCustomer" property="answer(Object::Plan::StateCode)" styleClass="txtbox" styleId="State" value="<%=cusState.toString()%>" onchange="javascript:showStateDependentQuestion(this.value);">
								<logic:present name='arrStates' scope="request">
									<html:option value="">Select</html:option>
							       	<logic:iterate id="states" name="arrStates" scope="request">
								         <bean:define id="state" name="states" property="State"/>
								         <bean:define id="stateCode" name="states" property="StateCode"/>
								         <bean:define id="stateName" name="states" property="StateName"/>
								         <html:option value='<%=stateCode.toString()%>'><%=stateName.toString() %></html:option>
							       </logic:iterate>
						    	</logic:present>		
						    	</html:select>
						    	
						  
						</td>
				      </tr>
						<tr id="DETrustTr" style="display:none;">
								<td  style="padding-left:10px;"> Trust</td>
								<td class="sectionhead1" align="left" >
									<input type="radio" name="answer(Object::Quote::IsTrust)" value="Y" id="DETrustY" />Yes
							 		<input type="radio" name="answer(Object::Quote::IsTrust)" value="N" checked="checked" id="DETrustN" />No&nbsp;&nbsp;
								</td>								
						</tr>
						<tr>
							<td align="right" class="fieldLeft"><font color="red">Number of Eligibles/Insureds</font></td>
							<td class="sectionhead1" align="left"><input type="text"
								name="answer(Object::Quote::NumberOfInsureds)" value="0"
								id="NumberOfInsureds" size="6" maxlength="6"/>
							</td>
						</tr>

						<tr>
						<td align="left">Policy Effective Date&nbsp;</td>
	          			<td class="sectionhead1" align="left" >
	          				<div id="policyEffectiveDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="txtDate1"/>
           						<jsp:param name="panelDiv" value="policyEffectiveDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="true"/>
       	   						<jsp:param name="TodayDate" value="<%=""+strProposedEffectiveDate%>"/>
           					</jsp:include>
     						</div>
     						<html:hidden property="answer(Object::Quote::QuoteStartDate)" styleId="txtDate" />
     					</td>
     				</tr>
					
					<tr>
								<td align="right" class="fieldLeft"> Is Policy Anniversary Date required on Policy? &nbsp;</td>
								<td class="sectionhead1" align="left" >
									<input type="radio" name="answer(Object::Quote::IsAnniversaryDateRequired)" value="Y" id="IsAnniversaryDateRequiredY" checked="checked" onClick="DisplayIsAnniversaryDateRequired(this.value)" />Yes
							 		<input type="radio" name="answer(Object::Quote::IsAnniversaryDateRequired)" value="N" id="IsAnniversaryDateRequiredN" onClick="DisplayIsAnniversaryDateRequired(this.value)" />No&nbsp;&nbsp;
								</td>	
											
					</tr>
					
					
					<html:hidden property="answer(Object::Product::LOB)" value="BBT" />
			
							
					
					<tr>
						<td align="left"><div id="polAnniversaryDateLabel" style="margin:0 0 0 10px;">Policy Anniversary Date &nbsp;</div></td>
	          			<td class="sectionhead1" align="left" >
	          				<div id="policyAnniversaryDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="policyAnniversaryDate"/>
           						<jsp:param name="panelDiv" value="policyAnniversaryDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="false"/>
       	   						<jsp:param name="TodayDate" value=""/>
           					</jsp:include>
     						
     						<html:hidden property="answer(Object::Quote::QuoteAnniversaryDate)" name="AddParentQuote" styleId="AnniversaryDate" />
     					</td>
     				</tr>
     								
					<tr>
						<td align="left">Policy Expiration Date &nbsp; </td>
	          			<td class="sectionhead1" align="left" >
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
     						
     						<html:hidden property="answer(Object::Quote::QuoteEndDate)" styleId="ExpDate" />
     					</td>
     				</tr>
					
					<tr>
							
								<td  align="right" class="fieldLeft"> Will benefits be extended beyond the expiration date of the policy if the Covered Person is hospitalized and under the care of a doctor? &nbsp;</td>
								<td class="sectionhead1" align="left" >
									<input type="radio" name="answer(Object::Quote::PersonHospitalised)" value="Y" id="PersonHospitalisedY"  onClick="PersonHospitalised(this.value)" />Yes
							 		 <input type="radio" name="answer(Object::Quote::PersonHospitalised)" value="N" id="PersonHospitalisedN" checked="checked" onClick="PersonHospitalised(this.value)" />No&nbsp;&nbsp;
								</td>			
						</tr>	
						
					<tr id="howLongid" style="display:none">
							
								<td  align="right" class="fieldLeft"><font color="red"> How long?</font> &nbsp;</td>
								<td class="sectionhead1" align="left" >
									<input type="text" name="answer(Object::Quote::HowLong)" value="" id="HowLong"  maxlength="2" size="3"/>
								</td>			
						</tr>		
					
					<tr>
							
								<td  align="right" class="fieldLeft"> Deferred Effective Date applies? &nbsp;</td>
								<td class="sectionhead1" align="left" >
									<input type="radio" name="answer(Object::Quote::IsDefferedDateApplies)" value="Y" id="IsDefferedDateAppliesY"   />Yes
							 		 <input type="radio" name="answer(Object::Quote::IsDefferedDateApplies)" value="N" id="IsDefferedDateAppliesN" checked="checked"  />No&nbsp;&nbsp;
								</td>			
						</tr>	
			
						<tr id="EligiblePerson">
								<td  align="left" style="font-size:14px;font-weight:bold;" > Classes of Eligible Persons&nbsp;</td>
								<td class="sectionhead1" align="left" >
								</td>
								
						</tr>		
						
						<tr id="MultipleClass">
								<td  align="right" class="fieldLeft"> Person can be insured under multiple classes?&nbsp;</td>
								<td class="sectionhead1" align="left" >
									<input type="radio" name="answer(Object::Quote::IsInsuredUnderMultipleClasses)" value="Y" id="IsIsInsuredUnderMultipleClassesY" onclick="javascript:showDependentInsured(this.value);" />Yes
							 		 <input type="radio" name="answer(Object::Quote::IsInsuredUnderMultipleClasses)" value="N" checked="checked" id="IsIsInsuredUnderMultipleClassesN" onclick="javascript:showDependentInsured(this.value);" />No&nbsp;&nbsp;
								</td>
								
						</tr>			
						<tr id="InsuredDependent" style="display:table-row;">
								<td  align="right" class="fieldLeft" style="padding-left:10px;"> Person can be insured as a Dependent and Insured at the same time?&nbsp;</td>
								<td class="sectionhead1" align="left" >
									<input type="radio" name="answer(Object::Quote::IsInsuredDependentAtSameTime)" value="Y" id="IsIsInsuredDependentY"  checked="checked"/>Yes
							 		 <input type="radio" name="answer(Object::Quote::IsInsuredDependentAtSameTime)" value="N" id="IsIsInsuredDependentN" />No&nbsp;&nbsp;
								</td>
								
						</tr>										
						</div>
						
		
						<bean:define id="riskId" name ="AddParentQuote" property="answer(Object::Plan::PLResRiskPropertyId)"/>
						<bean:define id="arrRiskInsuranceType" name="RISK_INSURANCE_TYPES" type="java.util.ArrayList"/>
						<span id="insTypeSelection">
						</span>
					
								<%	long ownerid=0;
									ownerid = Long.parseLong(""+session.getAttribute("ownerId"));
								%>
								
						<bean:define id="arrInsuranceComp" name="INSURANCE_COMPANIES" type="java.util.ArrayList"/>
						<tr>
						
							<td class="sectionhead1">
								<html:hidden property="answer(Object::InsuranceType::CompanyId)" value="25" />
								<html:hidden property="answer(Object::Quote::ProductStatus)" name="AddParentQuote" />
							</td> 
						</tr>						
					</table>
					
				</td></tr>
				<tr>
				<td>
				
				<table width="100%">
				<tr>
						<td>
							<span id="insRenewalSelection">	</span>
						</td> 
				</tr>	
				</table>
				</td>
				</tr>
				
				<tr><td>	
				<div id="RiskListPanel"></div>							
						</td></tr>
				<tr>
					<td>
				<table width="75%" align="center" border="0">		
					<!-- Fields Added For REnewal Fields -->
					
			<bean:define id="ansmap" name="AddParentQuote" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
			
		<html:hidden property="answer(Object::Quote::CompositeRate)" value="No" />    
		<html:hidden property="answer(Object::Quote::HelthHra)" value="No" />
		<html:hidden name="AddParentQuote" property="answer(Object::Quote::AreaNetWorkKey)" value=""/>
		
		<dmshtml:dms_static_with_connector ruleName='privilage'property='<%=new String[]{"CREATE_QUOTE_ALLPRODUCTSTATUS","CREATE_QUOTE_RESTRICTED_RELEAS"}%>' connector='or' negated="false">
			<html:hidden   property="answer(Object::Quote::ProductStatus)"  value="RELEASED" />
		</dmshtml:dms_static_with_connector>
		
		<% String riskTypeId = ""; %>
		<dmshtml:GetRiskTypeId nameInSession="riskTypeIds" riskType="AST" ownerId='<%=""+ownerId%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
			<logic:present name="riskTypeIds" scope="request">
				<bean:define id="riskTypeId1" name="riskTypeIds"/>
					<%riskTypeId = ""+riskTypeId1;%>
			</logic:present>			
			<tr>
				<td colspan="2" >&nbsp;&nbsp;</td>
			</tr>
		</table>
	</td>
  </tr>
	<TR>

		<td colspan="2" align="Center">&nbsp;&nbsp;&nbsp;	
			<!--  <div id="submitButton">
				<input type="submit" value="Next" class="sbttn" id="CreateQuoteSubmit" >&nbsp;
			</div> -->
		</td>
	
	</TR>
</table>	
</td>
</tr>
</table>
<SCRIPT type="text/javascript"> checkFields(); </SCRIPT>

<html:hidden property="answer(Object::Risk::Teritory)" value="0"/>
<%if(!RiskState.equals("")){ %>
<html:hidden property="answer(Object::Quote::CustomerState)" value='<%=""+RiskState%>'/>

<%} %>
<html:hidden name="AddParentQuote" property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
<html:hidden property="answer(Object::Quote::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
<html:hidden property="answer(Object::Quote::LockStatus)" value="Unlocked"/>
<html:hidden property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>" />
<html:hidden name="AddParentQuote" property="answer(Object::Quote::primaryEntityId)" value="<%=primaryEntityId.toString()%>"/>
<html:hidden property="answer(productFamilyId)" value='1'/>
<html:hidden property="answer(ownerId)" value='<%=ownerId.toString()%>'/>
<html:hidden property="answer(userId)" value='<%=userId.toString()%>'/>
<html:hidden property="answer(multiRisks)" value="yes" />



<html:hidden  property="answer(Object::Quote::SubmissionId)" value='<%=""+submissionId%>' />
<html:hidden  property="answer(Object::Coverages::Modified)" value='N' />
<html:hidden  property="answer(Object::Quote::SubmissionVerId)" value='<%=""+submissionVerId%>' />
<html:hidden  property="answer(PageType)" value='<%="ProductBrowse"%>' />
<html:hidden  property="answer(Object::Quote::SubmissionNumber)" value='<%=""+submissionNumber%>' />
<html:hidden  property="answer(Object::Quote::SubmissionStatus)" value='<%=""+submissionStatus%>' />
<html:hidden  property="answer(Object::Quote::ClearanceStatus)" value='<%=""+clearanceStatus%>' />

<bean:define id="QuoteNumber" name="AddParentQuote" property="answer(Object::Quote::QuoteNumber)" scope="request"/>
<html:hidden property="answer(Object::Quote::QuoteNumber)" value="<%=QuoteNumber.toString()%>" />

<html:hidden property="answer(Object::Quote::NewQuote)" value="YES" name="AddParentQuote"/>
<html:hidden property="answer(form::ForwordControl)" value="Save" name="AddParentQuote"/>

<html:hidden property="answer(Plan::PlanNumber)" value="1" />
<html:hidden name="AddQuote" property="answer(Object::Quote::GroupOutOfSync)" value="N"/>
<html:hidden name="AddQuote" property="answer(Object::Quote::CensusOutOfSync)" value="N"/>
<html:hidden name="AddQuote" property="answer(Object::Quote::ProductOutOfSync)" value="N"/>
<html:hidden property="answer(optionGroupId)" value=""/>
<html:hidden property="answer(Option::DefaultValue)" value="Yes"/>
<html:hidden property = "answer(isLoBChanged)" value = "N" styleId = "isLoBChanged" />
<html:hidden property="org.apache.struts.action.TOKEN" styleId="requiredMultiSubmissionCheck" value='<%=""+session.getAttribute("org.apache.struts.action.TOKEN")%>' />		
<html:hidden property="answer(Object::Risk::RiskId)" value="<%=""+riskTypeId%>"/>
<html:hidden property="answer(ProductBrowse)" value="NO" styleId="ProductBrowseId"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<span id="hiddenElement">
</span>

<!-- Newly Added for QuickQuote -->
	<logic:present name="RISK_INURED_IN_REQUEST">

		<bean:define id="riskInsuredFromRequest" name="RISK_INURED_IN_REQUEST" type="com.dms.ejb.data.QuestionHashMap"/>				
		<%
		
		com.dms.ejb.data.QuestionHashMap riskInsuredmap = new com.dms.ejb.data.QuestionHashMap();
		riskInsuredmap = riskInsuredFromRequest;
		riskInsuredmap.remove("Object::Risk::InsuranceTypeId");
		 java.util.Set set = riskInsuredmap.keySet();
		 java.util.Iterator keyIterate = set.iterator();
		     
		 String keyValue[] = new String[riskInsuredmap.size()];	     
		    
		    for(int key = 0; keyIterate.hasNext() ; key++) 
		    {	      
		    	keyValue[key] = (String)keyIterate.next();
		    }
		    
		    for(int keyIndex=0;keyIndex<keyValue.length;keyIndex++)
		    {
		%>    		    	
		    <html:hidden property='<%="answer("+keyValue[keyIndex]+")" %>' value="<%=riskInsuredmap.getString(keyValue[keyIndex])%>" />
		<%  
		    }									
		%>
		<html:hidden property="answer(requestFrom)" value="QuickQuote"/>	
		<html:hidden property="answer(effDate)" styleId="effDatefrmRequest"/>
	
		
	</logic:present>
<%-- To bring the Effective date from requested coverages (Start)--%>	
	
	<dmshtml:GetRequestedCoverages nameInSession="RequestedCoverages" submissionId="<%=Long.parseLong(""+submissionId)%>" submissionVerId="<%=Long.parseLong(""+submissionVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
	<% String Effdate ="";
		String RequestedCoveragesExpiring="";
		String incidentLimit = "";
		long classBenefitsListSize = 0;
		long classHazardListSize=0;
	%>
	<dmshtml:Get_Submission_Class_Hazards_List_By_Submission_Id nameInSession="classHazardList"
										submissionId='<%=""+submissionId %>'
										submissionVerId='<%=""+submissionVerId%>'
										ownerId='<%=""+ownerId%>' customerId = '<%=""+customerId %>'
										dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
										
	<logic:present name="classHazardList">
		<%classHazardListSize= Long.parseLong(""+request.getAttribute("classHazardListSize"));%>
	</logic:present>	
	
	<dmshtml:Get_Submission_Benefit_List_By_Submission_Id nameInSession="benefitList"
										submissionId='<%=""+submissionId %>'
										submissionVerId='<%=""+submissionVerId%>'
										ownerId='<%=""+ownerId%>'customerId = '<%=""+customerId %>'
										dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
										
	<logic:present name="benefitList">
		<% classBenefitsListSize = Long.parseLong(""+request.getAttribute("benefitList"));%>
	</logic:present>							
	
	<html:hidden  property="answer(Object::Submission::EffDate)" value='<%=""+Effdate %>' styleId="CoveragesEffDate"/>
	
	<html:hidden  property="answer(RequestingCoverageAsExpired)" value='<%=""+RequestedCoveragesExpiring %>' styleId="RequestingCoverageAsExpired" />
	<html:hidden  property="answer(IncidentLimit)" value='<%=""+incidentLimit %>' styleId="IncidentLimit" />
	
	<html:hidden  property="answer(Object::Plan::RequestingCoverageAsExpired)"  styleId="ReqCovExpired" />
	<html:hidden  property="answer(Object::Plan::IncidentLimit)"  styleId="InsLimit" />
	<html:hidden  property="answer(Object::Plan::OnLoadFlag)" value='<%="Y"%>'/>
	<html:hidden  property="answer(Object::Plan::UserModifiedAggLimit)" styleId="UserModifiedAggLimit" />
	<html:hidden  property="answer(Object::Plan::Accident)" styleId="Accident" value="Y"/>
	<html:hidden  property="answer(Object::Plan::Medical::Medical)" styleId="Medical" value="N"/>
	<html:hidden  property="answer(Object::Plan::AggregateLimitApplies)" styleId="AggregateLimitApplies" value="Y"/>
	<html:hidden  property="answer(Object::Plan::BenefitMaximum)" styleId="BenefitMaximum" value="50000"/>
	<html:hidden  property="answer(Object::Plan::Period)" styleId="Period" value="Year"/>
	<html:hidden  property="answer(Object::Plan::Period::PeriodOthers)" styleId="Period" value=""/>
	<%if(classHazardListSize > 1 || classBenefitsListSize>1 ){ %>
		<html:hidden  property="answer(Object::Plan::Units)" styleId="Units" value="Annual Premium"/>	
	<%}else if(classHazardListSize == 1 &&classBenefitsListSize==1 ){ %>
		<html:hidden  property="answer(Object::Plan::Units)" styleId="Units" value="Rate incl. Addl Benefit per 1000"/>	
	<%} %>
	
	<html:hidden  property="answer(Object::Plan::Units::UnitsOthers)" styleId="UnitsOthers" value=""/>
	
	<html:hidden  property="answer(Object::Plan::MinimumDeposit)" styleId="MinimumDeposit" value="Y"/>
	<html:hidden  property="answer(Object::Plan::subjectToAudit)" styleId="subjectToAudit" value="Y"/>
	<html:hidden  property="answer(Object::plan::AuditPeriod)" styleId="AuditPeriod" value="Quarterly"/>
	
	<script type="text/javascript">	

		if(document.getElementById("CoveragesEffDate")!=null && document.getElementById("CoveragesEffDate")!=undefined){
			if(document.getElementById("CoveragesEffDate").value!=""){
				document.getElementById("txtDate").value = document.getElementById("CoveragesEffDate").value;
			}
		}
		
		if(document.getElementById("RequestingCoverageAsExpired")!=null && document.getElementById("RequestingCoverageAsExpired")!=undefined){
			if(document.getElementById("RequestingCoverageAsExpired").value!=""){
				document.getElementById("ReqCovExpired").value = document.getElementById("RequestingCoverageAsExpired").value;
			}
		}
		
		if(document.getElementById("IncidentLimit")!=null && document.getElementById("IncidentLimit")!=undefined){
			if(document.getElementById("IncidentLimit").value!=""){
				document.getElementById("InsLimit").value = document.getElementById("IncidentLimit").value;
			}
		}
		
	</script>
<%-- To bring the Effective date from requested coverages (End)--%>		
	
	<html:hidden property="answer(Object::Quote::CustomerState)" value='<%=State.toString()%>'/>
	

	<script type="text/javascript">
		var effdate = document.getElementById("txtDate").value;		
		var effDate1 = new Date(effdate)
		var MM = effDate1.getMonth();
		var DD = effDate1.getDate();
		var YY = effDate1.getFullYear()+1;
		var anniversaryYY =  effDate1.getFullYear();
		MM = "0"+(MM+1);
		DD = "0"+DD;
		document.getElementById("ExpDate").value =  MM+"/"+DD+"/"+YY;
		document.getElementById("AnniversaryDate").value =MM+"/"+DD+"/"+anniversaryYY;
		
		getRiskListBTA();
		var state = document.getElementById('State').value;
		showStateDependentQuestion(state);
	
	</script>
	
	<script type="text/javascript">
   			Ext.onReady(function(){
   		
   				 var effDate = Ext.getCmp('txtDate1').getValue();  
   				 var MM = effDate.getMonth()+1;
				 var DD = effDate.getDate();
				 var YY = effDate.getFullYear();
			     if(MM<10){ MM = "0"+(MM);}
				 if(DD<10){ DD = "0"+DD;}   
   				 Ext.getCmp('policyAnniversaryDate').setValue(MM+'/'+DD+'/'+YY);
   				 document.forms[0].AnniversaryDate.value =MM+'/'+DD+'/'+YY; 
   				 document.forms[0].txtDate.value =MM+'/'+DD+'/'+YY; 
   				 var effDate1 = Ext.getCmp('txtDate1').getValue();  
   				 var MM1 = effDate.getMonth()+1;
				 var DD1 = effDate.getDate();
				 var YY1 = effDate.getFullYear()+1;
			     if(MM1<10){ MM1 = "0"+(MM1);}
				 if(DD1<10){ DD1 = "0"+DD1;}
   				 Ext.getCmp('policyExpirationDate').setValue(MM1+'/'+DD1+'/'+YY1);
   				 document.forms[0].ExpDate.value =MM1+'/'+DD1+'/'+YY1; 
   					  			
 				 var blurHandler = function() {    
				 
 				 var strDate = document.getElementById('txtDate1').value;
  				 var dmonth = parseInt(strDate.substring(0, 2), 10);
				 var dday = parseInt(strDate.substring(3, 5), 10);
				 var dyear = parseInt(strDate.substring(6, 10), 10);

				 if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
				 {	
					//alert("Please enter date in 'MM/DD/YYYY' format");
					document.forms[0].txtDate.value = strDate;
					return false;
			 	 }else{
   					 var effDate = Ext.getCmp('txtDate1').getValue();  
   					 var MM = effDate.getMonth()+1;
					 var DD = effDate.getDate();
					 var YY = effDate.getFullYear();
					 var YY1 = effDate.getFullYear() + 1;
					 if(MM<10){ MM = "0"+(MM);}
					 if(DD<10){ DD = "0"+DD;}
   					 document.forms[0].txtDate.value =MM+'/'+DD+'/'+YY; 
   					 document.forms[0].ExpDate.value =MM+'/'+DD+'/'+YY1; 
   					 document.forms[0].AnniversaryDate.value =MM+'/'+DD+'/'+YY;
   					 Ext.getCmp('txtDate1').setValue(MM+'/'+DD+'/'+YY);
   					 Ext.getCmp('policyAnniversaryDate').setValue(MM+'/'+DD+'/'+YY);
   					 Ext.getCmp('policyExpirationDate').setValue(MM+'/'+DD+'/'+YY1);
   					 }
   				};      				
   				var blurHandlerAnniversaryDate = function() {  
   					 
   					 var strDate = document.getElementById('policyAnniversaryDate').value;
	  				 var dmonth = parseInt(strDate.substring(0, 2), 10);
					 var dday = parseInt(strDate.substring(3, 5), 10);
					 var dyear = parseInt(strDate.substring(6, 10), 10);
	
					 if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
					 {	
						document.forms[0].AnniversaryDate.value = strDate;
						return false;
				 	 }else{      
   						 var effDate = Ext.getCmp('policyAnniversaryDate').getValue();  
   						 var MM = effDate.getMonth()+1;
						 var DD = effDate.getDate();
						 var YY = effDate.getFullYear();
						 if(MM<10){ MM = "0"+(MM);}
						 if(DD<10){ DD = "0"+DD;}
   						 document.forms[0].AnniversaryDate.value =MM+'/'+DD+'/'+YY; 
   						 Ext.getCmp('policyAnniversaryDate').setValue(MM+'/'+DD+'/'+YY);
   						 }
   					};      				
   				var blurHandlerExpirationDate = function() {    
   				
	   				 var strDate = document.getElementById('policyExpirationDate').value;
	  				 var dmonth = parseInt(strDate.substring(0, 2), 10);
					 var dday = parseInt(strDate.substring(3, 5), 10);
					 var dyear = parseInt(strDate.substring(6, 10), 10);
	
					 if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
					 {	
						document.forms[0].ExpDate.value = strDate;
						return false;
				 	 }else{     
   					 var effDate = Ext.getCmp('policyExpirationDate').getValue();  
   					 var MM = effDate.getMonth()+1;
					 var DD = effDate.getDate();
					 var YY = effDate.getFullYear();					 
					 if(MM<10){ MM = "0"+(MM);}
					 if(DD<10){ DD = "0"+DD;}
   					 document.forms[0].ExpDate.value =MM+'/'+DD+'/'+YY;
   					 Ext.getCmp('policyExpirationDate').setValue(MM+'/'+DD+'/'+YY);
   					 }
   				};      				
   				Ext.EventManager.on('txtDate1', 'blur', blurHandler);   				
   				Ext.EventManager.on('policyAnniversaryDate', 'blur', blurHandlerAnniversaryDate);   				
   				Ext.EventManager.on('policyExpirationDate', 'blur', blurHandlerExpirationDate);
  			});
	</script>
		
</html:form>
</div>
	</div>