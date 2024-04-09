<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>



<%!
	static final int beniRater = 0;
	static final int MicaRater = 1;
	static final int MicaIowa = 3;
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

<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CreateQuoteEIL.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CommercialLinesRisk.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript"><!--
function disableButton(frm){
var returnValue = false;
returnValue = validateEffectiveDateWhileSubmit('submit');
if(returnValue){
		document.getElementById("CreateQuoteSubmit").disabled = true;
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
		if((document.getElementById("QuoteType") != undefined) && (document.getElementById("QuoteType") != null)) {
			if(document.getElementById("QuoteType").value == "RENEWAL"){
				var renewalPolicyNum = document.getElementById("RenewalPolNum").value;

				renewalPolicyNum = renewalPolicyNum.replace(/\s/g,"");

    	        if(!renewalPolicyNum.length > 0){
					alert("No Renewal Policy Number is given");
					return false;
				}
    	        if( /[^a-zA-Z0-9]/.test( renewalPolicyNum ) ) {
    	            alert('Please enter the Policy Number with Alphanumeric characters');
    	            return false;
    	        }
    	    				
			
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
			alert("Please select tank.");
			return false;
		}

//if Only one Tank Selected
var totalTanks=document.forms[0].SelectedRiskID.length;
	if(totalTanks==undefined && totalTanks==null){
		var riskId=document.forms[0].SelectedRiskID.value;
		var riskType='';
		var strRiskTypeObject='document.forms[0].UST_'+riskId;	
		strRiskTypeObject=eval(strRiskTypeObject);		
			if(strRiskTypeObject!=undefined && strRiskTypeObject != null){
						document.forms[0].CoverageB.value="Y";
			}else{
						document.forms[0].CoverageC.value="Y";
			}	

		}
		
//if More Than One Tank Selected		
	if (totalTanks!=undefined && totalTanks!=null){
		for(var index=0;index < totalTanks;index++){
			if(document.forms[0].SelectedRiskID[index].checked){
				var riskId=document.forms[0].SelectedRiskID[index].value;
				var riskType='';
					var strRiskTypeObject='document.forms[0].UST_'+riskId;	
					strRiskTypeObject=eval(strRiskTypeObject);									
					if(strRiskTypeObject!=undefined && strRiskTypeObject != null){
						document.forms[0].CoverageB.value="Y";
					}else{
						document.forms[0].CoverageC.value="Y";
					}	
			}	
		}
	}
return disableButton(frm);
}
--></script>
<div class="productbrowse"  style="width:960px;">
<div class="content" style="width:100%;">							
<html:form action="/NewEILQuoteActionV2.do" styleId="frm" onsubmit="{return setSelectedRiskTypes(this);}">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="fname" property="answer(Object::UserDetail::UserFirstName)" name="LoginPage" scope="session"/>
<bean:define id="lname" property="answer(Object::UserDetail::UserLastName)" name="LoginPage" scope="session"/>

<bean:define id="submissionId" property="answer(Object::Quote::SubmissionId)" name="AddParentQuote" scope="request" />
<bean:define id="submissionVerId" property="answer(Object::Quote::SubmissionVerId)" name="AddParentQuote" scope="request" />

<bean:define id="State" property="answer(State)" name="AddParentQuote" scope="request"/>
<bean:define id="RiskState" property="answer(Object::Risk::ResProperty::State)" name="AddParentQuote" scope="request"/>
<bean:define id="RiskType" property="answer(Object::Risk::ResProperty::RiskType)" name="AddParentQuote" scope="request"/>
<bean:define id="formName" property="answer(formname)" name="AddParentQuote" scope="request"/>

<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)"/>
<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />

<bean:define id="submissionRenewalPolNo1" property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" name="AddParentQuote" />
<bean:define id="QuoteType1" property="answer(Object::Quote::QuoteType)" name="AddParentQuote" />
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" styleId="submissionRenewalPolNo" value= '<%=""+submissionRenewalPolNo1%>'/>

<html:hidden property="answer(Object::Risk::InsuranceTypeId)" value = "-1" />
<html:hidden  property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" styleId="customerId"/>

<html:hidden property="answer(Object::Plan::CoverageBCorrectiveAction)" value='<%=""%>' styleId="CoverageB"/> 
<html:hidden property="answer(Object::Plan::CoverageCCleanupOfPollutants)" value='<%=""%>' styleId="CoverageC"/> 

<bean:parameter id="primaryEntityId" name="answer(Object::Quote::primaryEntityId)"/>
 

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
				<table width="80%" border="0"  align="left">
					
					<%
							com.dms.ejb.data.QuestionHashMap qmapArea =   new com.dms.ejb.data.QuestionHashMap(10);				
							qmapArea.put("ownerId", ""+ownerId);
							qmapArea.put("dbname", ""+com.dms.web.util.DbUtils.getWriteDS(pageContext));
							qmapArea.put("Object::Customer::CustomerId", ""+customerId);					
							qmapArea.put("Object::Quote::AgencyId", ""+agencyIdTemp);
							
					%>
					<bean:define id="QuoteEffectiveDate" name ="AddParentQuote" property="answer(Object::Quote::QuoteStartDate)"/>
					
					<dmshtml:get_EIL_risk_list nameInSession="riskList" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" customerId='<%=customerId+"" %>' ownerId='<%=ownerId+""%>' />

						<logic:present name="noRiskAssociated" scope="request">
							<tr>
							 	<td class="Error">No Tank Selected to Create Quote!!</td>
							</tr>
						</logic:present>
						
						<logic:present name="RiskNotValid" scope="request">
							<tr>
							 	<td colspan="2" class="Error">Pl. select another Tank type, along with Tank type to create quote</td>
							</tr>
						</logic:present>
						
						<logic:notPresent name="riskList" scope="request">	
							<tr>
							 	<td class="Error"  colspan="2"><!-- No Underlying Policies (risks) found which qualifies for this Quote's Effective Date! --></td>
							 </tr>
							 <tr>
							 	<td class="Error"  colspan="2"><!-- Pl. change the Quote Effective date or Add/change Underlying Policies (risks) -->  </td>
							</tr>
						</logic:notPresent>
							

						<span id="message" class="Error"> </span>
						
					<tr>
						<td width="30%" align="left" class="field">Effective Date &nbsp; </td>
						<td class="sectionhead1">
							<html:text property="answer(Object::Quote::QuoteStartDate)" size="30" maxlength="30" styleId="txtDate" styleClass='txtbox' onchange="return validateDateCL('submit');" />
						</td>
					</tr>
						<tr>
							<dmshtml:dms_static_with_connector ruleName='privilage'	property='<%=new String[]{"MODIFY_QUOTE_TYPE"}%>' connector='or' negated="true">			
								<td width="30%" align="left" class="field"> Select Quote Type &nbsp;</td>
								<td class="sectionhead1">
									<html:select property="answer(Object::Quote::QuoteType)" styleId="QuoteType" styleClass='txtbox' onchange="return renewalBasedProductBrowse()">
										<html:option value ='NEW_BUSINESS'>New Business</html:option>
										<html:option value ='RENEWAL'>Renewal Quote</html:option>
									</html:select>
								</td>
							</dmshtml:dms_static_with_connector>
							
		
							<dmshtml:dms_static_with_connector ruleName='privilage'	property='<%=new String[]{"QUOTE_TYPE_VIEW"}%>' connector='or' negated="true">				
								<html:hidden property="answer(Object::Quote::QuoteType)" value="NEW_BUSINESS"/>			
							</dmshtml:dms_static_with_connector>
						</tr>	
					
					
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CREATE_QUOTE_ALLPRODUCTSTATUS"}%>' connector='or' negated="true">
							<tr>
								<td width="30%" align="left" class="field"> Select Product Status&nbsp;</td>
								<td class="sectionhead1">
									<html:select property="answer(Object::Quote::ProductStatus)" styleClass='txtbox' onchange="return ProductBrowse()">
										<html:option value ='RELEASED'>Released</html:option>
										<html:option value ='DEVELOPMENT'>Development</html:option>
										<html:option value ='QA'>QA</html:option>
									</html:select>
								</td>
							</tr>
							
							
						</dmshtml:dms_static_with_connector>
						<tr>
							<td width="30%" align="left" class="field"> Select Line Of Business&nbsp;</td>
							<td class="sectionhead1">
							<bean:define id="arrLineOfBusiness" name="LINE_OF_BUSINESS" type="java.util.ArrayList"/>
							<span id="LineOfBusiness">
							    <html:select property="answer(Object::Product::LOB)" styleClass='txtbox' styleId="LineOfBusiness" onchange="return ProductBrowseEIL()">
							    
							
							    <%for(int i=0;i<arrLineOfBusiness.size();i++) {
							     com.dms.ejb.data.QuestionHashMap arrLineOfBusinessMap=(com.dms.ejb.data.QuestionHashMap)arrLineOfBusiness.get(i); 
							     %>
							    
							     <html:option value ='<%=arrLineOfBusinessMap.getString("Object::Product::LOB")%>'>
							     <%=arrLineOfBusinessMap.getString("Object::Product::LOB")%></html:option>
							     <%}%>
							    </html:select>
		
							    </span>			
 					    </td>	
 					    </tr>			
						<dmshtml:dms_static_with_connector ruleName='privilage'
							property='<%=new String[]{"CREATE_QUOTE_RESTRICTED_RELEAS"}%>' connector='or'
							negated="true">
							
								<td width="30%" align="left" class="field">
								Select Product Status
								&nbsp;</td>
								<td class="sectionhead1">
									<html:select property="answer(Object::Quote::ProductStatus)" styleId="prdStatus"  styleClass='txtbox' onchange="return ProductBrowse()">
										<html:option value ='RELEASED'>Released</html:option>
										<html:option value ='RESTRICTED'>Restricted</html:option>
									</html:select>
								</td>
						</dmshtml:dms_static_with_connector>								
				
		
						<bean:define id="riskId" name ="AddParentQuote" property="answer(Object::Plan::PLResRiskPropertyId)"/>
						<bean:define id="arrRiskInsuranceType" name="RISK_INSURANCE_TYPES" type="java.util.ArrayList"/>
						<span id="insTypeSelection">
						</span>
					<!-- 	<tr>
							<td width="30%" align="left" class="FormLabels">Select Type Of Insurance&nbsp;</td>
							<td class="sectionhead1">
								<span id="insTypeSelection">
									<html:select property="answer(Object::Risk::InsuranceTypeId)" styleClass='txtbox' styleId="InsuranceType" onchange="return ProductBrowse()">
										<html:option value ='0'>Select</html:option>
										<%
											for(int i=0;i<arrRiskInsuranceType.size();i++) {
											com.dms.ejb.data.QuestionHashMap riskInsuranceTypeMap=(com.dms.ejb.data.QuestionHashMap)arrRiskInsuranceType.get(i);	
										%>
										<html:option value ='<%=riskInsuranceTypeMap.getString("Object::Risk::InsuranceTypeId")%>'>
											<%=riskInsuranceTypeMap.getString("Object::Risk::InsuranceTypeName")%></html:option>
										<%}%>
									</html:select>
								</span>
							</td> 
						</tr>
					 -->	
					<!-- 	<tr>
							<td width="30%" align="left" class="FormLabels">Select Governing States &nbsp;</td>
							<td class="sectionhead1">
								<span id="insStateSelection">
								<%	long ownerid=0;
									ownerid = Long.parseLong(""+session.getAttribute("ownerId"));
								%>
								<dmshtml:get_all_risk_states nameInSession="arStates" ownerId='<%=ownerid%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
									<html:select property="answer(Object::Risk::ResProperty::State)" styleClass='txtbox' styleId="State" onchange="return ProductBrowse()">
										<html:option value ="">Select</html:option>
			       							 <logic:present name="arStates" scope="request">
			         							 <logic:iterate id="details" name="arStates">
											    	<bean:define id='test' name="details"  property="stateCode" />
											    		<html:option value ='<%=test.toString()%>'>
											      			 <bean:write name="details" property="state" />
											    		</html:option>
												</logic:iterate>
											</logic:present>								
									</html:select>
								</span>
							</td> 
						</tr> -->
						<bean:define id="arrInsuranceComp" name="INSURANCE_COMPANIES" type="java.util.ArrayList"/>
						<tr>
							<!-- <td width="30%" align="left" class="FormLabels"> Select Company &nbsp;</td> -->
							<td class="sectionhead1">
								<html:hidden property="answer(Object::InsuranceType::CompanyId)" value="24" />
							</td> 
						</tr>						
						<tr >
							<td class="field" align="left" width="30%">Select Plan&nbsp;</td>
							<td class="links">				
								<bean:define id="arrProductGroups" name="PRODUCT_GROUPS" type="java.util.ArrayList"/>
								<span id="insPrdSelection">
									<html:select property="answer(Object::Quote::ProductGroupVerId)" styleClass='txtbox' styleId="selectGroup" onchange="return ProductBrowse()">
										<html:option value ='0'>Select</html:option>
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
						<bean:define id="arrPolicyTerms" name="PRODUCT_TERMS" type="java.util.ArrayList"/>
						<tr>
							<td width="30%" align="left" class="field"> Select Policy Term	&nbsp;</td>
							<td class="links">
								<span id="insPrdTermSelection">
									<select name="answer(Object::Plan::TermInMonths)" Id="selectTerm" >
									<%
										for(int i=0;i<arrPolicyTerms.size();i++) {
											com.dms.ejb.data.QuestionHashMap termMap=(com.dms.ejb.data.QuestionHashMap)arrPolicyTerms.get(i);	
											String period=termMap.getString("Object::Plan::TermInMonths");
											String selected=""; 
											if(period.equals("6")){
												selected="SELECTED";
											}
									%>
									<option value ='<%=period%>' <%=selected%> >
										<%=period%> </option>
									<%}%>
									</select>
								</span>
							</td> 
						</tr>
						
						 <bean:define id="paymentPlanList" name="PRODUCT_PAYMENT_PLAN" type="java.util.ArrayList"/>
						<tr>
						<!-- 	<td width="30%" align="left" class="FormLabels"> Select Payment Plan&nbsp;</td>
							<td class="sectionhead1">
								<span id="insPaymentplanSelection">
									<html:select property="answer(Object::Quote::PaymentPlan)" styleClass='txtbox' styleId="PaymentPlan" >
										<html:option value ='0'>Select</html:option>
										<%
											for(int i=0;i<paymentPlanList.size();i++) {
												com.dms.ejb.data.QuestionHashMap paymentPlanMap=(com.dms.ejb.data.QuestionHashMap)paymentPlanList.get(i);	
										%>
										<%=""+paymentPlanList.size() %>
										<html:option value ='<%=""+paymentPlanMap.getString("Object::QuoteBilling::InstallmentTypeDesc")%>'>
											<%=paymentPlanMap.getString("Object::QuoteBilling::InstallmentTypeDesc")%>
										</html:option>
										<%}%>
									</html:select>									
								</span>
							</td>
							 --> 
						</tr>
						<!--  Changed For QuoteType -->
						<!-- 
						<tr>
			
								<td width="30%" align="left" class="FormLabels">
									Select Location	&nbsp;
								</td>
								<td>
									<dmshtml:get_Location_List nameInSession="locationList" customerId='<%=""+customerId%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
									<logic:present name="locationList" scope="request">
									<bean:define id="locationList" name="locationList" type="java.util.ArrayList"/>		
									<html:select property="answer(Object::Plan::LocationId)" styleClass='txtbox' styleId="selectLocation" onchange="return getRiskListByLocation()">
										<html:option value ='0'>Select</html:option>
											<%
												for(int i=0;i<locationList.size();i++) {
													com.dms.ejb.data.QuestionHashMap locationMap=(com.dms.ejb.data.QuestionHashMap)locationList.get(i);	
											%>				
										<html:option value ='<%=locationMap.getString("Object::Location::LocationId")%>'>
											<%=locationMap.getString("Object::Location::LocationName")%></html:option>
										<%}%>
									</html:select>
									</logic:present>
								</td>
						</tr>			
					 -->
					</table>
					
				</td></tr>
				<table width="100%">
				<tr>
				<td>
					<span id="insRenewalSelection" style="display:none">	</span>
				</td>
				</tr> 
				</table>
				<dmshtml:dms_static_with_connector ruleName='privilage'	property='<%=new String[]{"MODIFY_QUOTE_TYPE"}%>' connector='or' negated="true">
				<table width="100%">
				<tr id="RenewalType">
					<td width="30%" align="left" class="field">Renewing Policy # &nbsp;</td>
					<td class="sectionhead1">
					<html:text property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" value="<%=""+submissionRenewalPolNo1%>" size="30" maxlength="15" styleId="RenewalPolNum" styleClass='txtbox' onchange="setSubmissionRenewalPolNoVal(this.value)"/>
					</td>
				</tr>	
				</table>
				</dmshtml:dms_static_with_connector>
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
			<div id="submitButton" title="<bean:message key='ToolTip.CreateNewQuote.Next'/>">
				<input type="submit" value="Next" class="sbttn" id="CreateQuoteSubmit" >&nbsp;
			</div>
		</td>
	
	</TR>
</table>	
</td>
</tr>
</table>

<script type="text/javascript">

function renewalBasedProductBrowse()
{
		if((document.getElementById('QuoteType').value == "RENEWAL"))
			{
				document.getElementById('RenewalType').show();
			}
			else
			{
				document.getElementById('RenewalType').hide();
			}
}
window.onload= renewalBasedProductBrowse;
function setSubmissionRenewalPolNoVal(value)
{
	document.getElementById('submissionRenewalPolNo').value = value;
}
</script>

<%
String submissionNumber =""; 
String clearanceStatus ="";
String submissionStatus = "";

%>
<SCRIPT type="text/javascript"> checkFields(); </SCRIPT>
<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" submissionId='<%=""+submissionId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
<logic:present name="customerDetail1" scope="request">
	<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
	<%
		submissionNumber = customerDetailMap.getString("SubmissionNumber"); 
		clearanceStatus = customerDetailMap.getString("ClearanceStatus"); 
		submissionStatus = customerDetailMap.getString("custStatus");
	%>
	
</logic:present>

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
<html:hidden property="answer(Object::Quote::NewQuote)" name="AddParentQuote"/>
<html:hidden property="answer(Plan::PlanNumber)" value="1" />
<html:hidden name="AddQuote" property="answer(Object::Quote::GroupOutOfSync)" value="N"/>
<html:hidden name="AddQuote" property="answer(Object::Quote::CensusOutOfSync)" value="N"/>
<html:hidden name="AddQuote" property="answer(Object::Quote::ProductOutOfSync)" value="N"/>
<html:hidden property="answer(optionGroupId)" value=""/>
<html:hidden property="answer(Option::DefaultValue)" value="Yes"/>
<html:hidden property = "answer(isLoBChanged)" value = "N" styleId = "isLoBChanged" />



<html:hidden property="answer(Object::Risk::RiskId)" value="<%=""+riskTypeId%>"/>
<html:hidden property="answer(ProductBrowse)" value="Yes"/>
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
		<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" submissionId='<%=""+submissionId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>

	<%String uwNameCode=""; %>
		<logic:present name="customerDetail1" scope="request">
		<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
												type="com.dms.ejb.data.QuestionHashMap" />
		<% uwNameCode = customerDetailMap.getString("SubmissionUWNameCode");%>
		
		</logic:present>
		<html:hidden property="answer(Object::Quote::QuoteUWNameCode)" value="<%=""+uwNameCode%>" />
	<dmshtml:GetRequestedCoverages nameInSession="RequestedCoverages" submissionId="<%=Long.parseLong(""+submissionId)%>" submissionVerId="<%=Long.parseLong(""+submissionVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
	<% String Effdate ="";
		String RequestedCoveragesExpiring="";
		String incidentLimit = "";
	%>
	<logic:present name="RequestedCoverages">
	
		<%com.dms.ejb.submission.SubmissionCoveragesDetail submissionCoveragesDetail = (com.dms.ejb.submission.SubmissionCoveragesDetail)request.getAttribute("RequestedCoverages"); %>
					<% if(submissionCoveragesDetail.getProposedEffDate() != null ){
							Effdate = ""+submissionCoveragesDetail.getProposedEffDate(); 
							if(""+submissionCoveragesDetail.getRequestingCoverageExpiring() !=null){
								RequestedCoveragesExpiring = submissionCoveragesDetail.getRequestingCoverageExpiring();
							}
							 if(""+submissionCoveragesDetail.getIncidentLimit() !=null){
								   
								   incidentLimit = ""+submissionCoveragesDetail.getIncidentLimit();
							   }
					}%>
					
	</logic:present>
	
	<html:hidden  property="answer(Object::Submission::EffDate)" value='<%=""+Effdate %>' styleId="CoveragesEffDate"/>
	
	<html:hidden  property="answer(RequestingCoverageAsExpired)" value='<%=""+RequestedCoveragesExpiring %>' styleId="RequestingCoverageAsExpired" />
	<html:hidden  property="answer(IncidentLimit)" value='<%=""+incidentLimit %>' styleId="IncidentLimit" />
	
	<html:hidden  property="answer(Object::Plan::RequestingCoverageAsExpired)"  styleId="ReqCovExpired" />
	<html:hidden  property="answer(Object::Plan::IncidentLimit)"  styleId="InsLimit" />
	<html:hidden  property="answer(Object::Plan::OnLoadFlag)" value='<%="Y"%>'/>
	<html:hidden  property="answer(Object::Plan::UserModifiedAggLimit)" styleId="UserModifiedAggLimit" />
	
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
		if(document.getElementById("selectGroup")!=null && document.getElementById("selectGroup")!=undefined){
			document.getElementById("selectGroup").value="362";
		}
	ProductBrowse();
	
 function validateDateCL(submit){
	var frm = document.forms[0];
	var vardate = frm.txtDate.value
	var ddate = new Date(vardate);	
	if(!isDate(vardate)){
		alert("Invalid Date")
		frm.txtDate.select();
		return false;
	}
	if (vardate=="")
	{
		alert("Please enter the Effective Date");
		frm.txtDate.focus();
		return false;
	}
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.txtDate.select();
		return false;
	}
	var reqDate = new Date("01/01/2005");
	
	if (ddate < reqDate)
	{
	
		alert("Effective Date cannot be prior to Jan 1, 2005");
		frm.txtDate.select();
		frm.txtDate.focus();
		return false;
	}

	if(submit!=null && submit=="submit") {
		if(frm.selectGroup!=null) {
			frm.selectGroup.value=0;
		}
		// commented for bug 13168
		// ProductBrowse();
	}
	if(frm.effDatefrmRequest!=null && frm.effDatefrmRequest!=undefined ){
		frm.effDatefrmRequest.value=vardate;
	}
	
	// commented for bug 13168
	// getRiskList()
	return true;
}		
	</script>
	
</html:form>
</div>
	</div>
