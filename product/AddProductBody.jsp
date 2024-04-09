<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<SCRIPT type="text/JavaScript">
<!--
function getObjectType()
	{
		var formElement=document.forms[0];		
		formElement.action="../LoadProduct.do";
		
		if((formElement.psdmm.value!="")&&(formElement.psddd.value!="")&&(formElement.psdyy.value!="")) {
			formElement.ProductStartDate.value=formElement.psdmm.value+"/"+formElement.psddd.value+"/"+formElement.psdyy.value;
		}

		if((formElement.pedmm.value!="")&&(formElement.peddd.value!="")&&(formElement.pedyy.value!="")) {
		formElement.ProductEndDate.value=formElement.pedmm.value+"/"+formElement.peddd.value+"/"+formElement.pedyy.value;
		}
		
		formElement.submit();
		return true;
	}
 function y2k(number) { return (number < 1000) ? number + 1900 : number; }
function storeDateValues()
{
var formElement=document.forms[0];

if((formElement.psdmm.value!="")&&(formElement.psddd.value!="")&&(formElement.psdyy.value!="")) {
formElement.ProductStartDate.value=formElement.psdmm.value+"/"+formElement.psddd.value+"/"+formElement.psdyy.value;
}

if((formElement.pedmm.value!="")&&(formElement.peddd.value!="")&&(formElement.pedyy.value!="")) {
formElement.ProductEndDate.value=formElement.pedmm.value+"/"+formElement.peddd.value+"/"+formElement.pedyy.value;
}

var startdate = new Date(formElement.psdyy.value-0,formElement.psdmm.value-1,formElement.psddd.value-0);
var enddate = new Date(formElement.pedyy.value-0,formElement.pedmm.value-1,formElement.peddd.value-0);

	starttime = Date.UTC(y2k(startdate.getYear()),startdate.getMonth(),startdate.getDate(),0,0,0);
	endtime = Date.UTC(y2k(enddate.getYear()),enddate.getMonth(),enddate.getDate(),0,0,0);
	
	formElement.ProductverName.value=formElement.ProductName.value;
	formElement.ProductVerDesc.value=formElement.ProductDesc.value;
	formElement.ProductVerStatus.value=formElement.ProductStatus.value;
	formElement.ProductVerStartDate.value=formElement.ProductStartDate.value;
	formElement.ProductVerEndDate.value=formElement.ProductEndDate.value;
	formElement.ProductVerFamilyId.value=formElement.FamilyId.value;
	formElement.ProductVersionNumber.value=formElement.VerNumber.value;
	formElement.ProdVerQuoteLookUpName.value=formElement.QuoteLookUpName.value;
	formElement.ProdVerPlanLookUpName.value=formElement.PlanLookUpName.value;
	formElement.ProdVerRateLookUpName.value=formElement.RateLookUpName.value;
	formElement.ProdVerRatesheetLookUpName.value=formElement.RatesheetLookUpName.value;

}

function popDateFields(){
	var formElement=document.forms[0];	
	
	var vPrdstrartDate="<bean:write name='AddProduct' property='answer(Object::Product::ProductStartDate)' />";
	var vPrdendDate="<bean:write name='AddProduct' property='answer(Object::Product::ProductEndDate)' />";
		
	if(vPrdstrartDate!=""){
		formElement.psdmm.value = vPrdstrartDate.substring(0,2);
		formElement.psddd.value = vPrdstrartDate.substring(3,5);
		formElement.psdyy.value = vPrdstrartDate.substring(6,10);
	}
	if(vPrdendDate!=""){
		formElement.pedmm.value = vPrdendDate.substring(0,2);
		formElement.peddd.value = vPrdendDate.substring(3,5);
		formElement.pedyy.value = vPrdendDate.substring(6,10);
	}	

}
//-->
</SCRIPT>

<body leftmargin="0" rightmargin="0" topmargin="0" onLoad="return popDateFields()">
<%int dataBaseIdViewPrivillage=0;%>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>

<html:form action="/AddProduct"  onsubmit="return storeDateValues()">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />

	<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td>&nbsp;
		</td>
	</tr>
	<bean:define id="productStatus" name='AddProduct'
			property='answer(Object::Product::ProductStatus)' />
		<% System.out.println("productStatus-->"+productStatus);
	boolean readonly = false; %>
		<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
			value="<%=""+productStatus%>" negated="true">
			<% readonly = true;%>
		</dmshtml:dms_isPresent>
	<tr>
		<td valign="top" align="left">
			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<logic:present name="staleDataSubmissionMsg"  scope="request">
				<tr>
					<td class="Error" >
						<bean:message key="error.staleDataSubmissionMsg"/>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				</logic:present>

				<tr>
					<td colspan="3">
						<table WIDTH="760px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
							<tr>
								<td valign="top">
									<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												<bean:message key="Products.Productname"/>
											</td>								
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table WIDTH="770px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td  class="FormLabels" align="left" colspan="4">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="NewSectionHead" colspan="4" align="center">	
									ADD/EDIT PRODUCT
								</td>
							</tr>
							<tr>
								<td  class="FormLabels" align="left" colspan="4"> 
									&nbsp;
								</td>
							</tr>
								
<!--/logic:notPresent-->
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
						</table>
					</td>
				</tr>	
				<tr>
					<td align="left" colspan="2">
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td colspan="2" align="center" class="sectionhead">
									PRODUCT DETAILS
								</td>
							</tr>
							<tr>
								<td colspan="2">
								</td>
							</tr>
							<tr>
								<td colspan="2">
								</td>
							</tr>
							<tr>
								<td colspan="2">
								</td>
							</tr>
							
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
							<tr>
								<td class="FormLabels" align="left">
									Family
								</td>
								<td>
									<dmshtml:get_product_family nameInSession="arProductFamily" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<html:select property="answer(Object::Product::FamilyId)"  styleId="FamilyId"> 
										<html:option value ="">Select</html:option>
							      	  	<logic:present name="arProductFamily" scope="request">
							          	 <logic:iterate id="details" name="arProductFamily" scope="request" >
									    <bean:define id='familyId' name="details"  property="prdFamilyId" />
									     <html:option value ='<%=familyId.toString()%>' >
									       <bean:write name="details" property="familyName"  />
									    </html:option>
									</logic:iterate>
									</logic:present>
									</html:select>
								</td>
							</tr> 

							<tr>
								<td width="30%" class="FormLabels" align="left">
									Type
								</td>
								<td class="links">
									<html:text  name='AddProduct' property ="answer(Object::Product::ProductType)"  size="30" maxlength="30" styleClass="txtbox"/>
								</td>
							</tr>
	
							<tr>
								<td width="30%" class="FormLabels" align="left">
									Number
								</td>
								<td class="links">
									<html:text  name='AddProduct' property ="answer(Object::Product::ProductNum)"  size="30" maxlength="30" styleClass="txtbox"/>
								</td>
							</tr>

							<tr>
								<td width="30%" class="FormLabels" align="left">
									Version Number
								</td>
								<td class="links">
									<html:text  name='AddProduct' property ="answer(Object::Product::VerNumber)"  size="15" maxlength="20" styleClass="txtbox" styleId="VerNumber"/>
								</td>
							</tr>

							<tr>
								<td width="30%" class="FormLabels" align="left">
									Name
								</td>
								<td class="links">
									<html:text  name='AddProduct' property ="answer(Object::Product::ProductName)"  size="30" maxlength="40" styleClass="txtbox" styleId="ProductName"/>
								</td>
							</tr>

							<tr>
								<td width="30%" class="FormLabels" align="left">
									Description
								</td>
								<td class="links">
									<html:text  name='AddProduct' property ="answer(Object::Product::ProductDesc)"  size="15" maxlength="120" styleClass="txtbox" styleId="ProductDesc"/>
								</td>
							</tr>
							<tr>
								<td width="30%" class="FormLabels" align="left">
									Line Of Business
								</td>
								<td class="links">
									<html:text  name='AddProduct' property ="answer(Object::Product::LineOfBusiness)"  size="15" maxlength="120" styleClass="txtbox" styleId="ProductDesc"/>
								</td>
							</tr>
		
							<tr>
								<td class="FormLabels" align="left">
									Can this product be sold independently
								</td>

								<td class="FormLabels">
									<html:radio property = "answer(Object::Product::SellIndependent)" value="Yes" />&nbsp;Yes
									&nbsp;<html:radio property = "answer(Object::Product::SellIndependent)" value="No" />&nbsp;No
								</td>
							</tr>

	
							<tr>

								<td class="FormLabels" align="left">
									Status
								</td>
								<td class="links" style="Class: txtbox">
									<html:select name="AddProduct" property="answer(Object::Product::ProductStatus)" styleClass="txtbox" styleId="ProductStatus">
									    <html:option value ='DEVELOPMENT'>Development</html:option>
									    <html:option value ='RELEASED'>Released</html:option>
							   		    <html:option value ='RESTRICTED'>Restricted</html:option>
										<html:option value ='QA'>QA</html:option>
									</html:select>
								</td>
							</tr>							
							<tr>
								<td width="30%" class="FormLabels" align="left" height="25">
									Product Start Date
								</td>
								<td class="links">
									<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].psddd.focus()}" styleId="psdmm" />&nbsp;
									<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].psdyy.focus()}" styleId="psddd" />&nbsp;
									<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].pedmm.focus()}" styleId="psdyy" />&nbsp;(MM/DD/YYYY)
								</td>	
							</tr>
							<tr>
								<td width="30%" class="FormLabels" align="left" height="25">
									Product Expiration Date
								</td>
								<td class="links">
									<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].peddd.focus()}" styleId="pedmm" />&nbsp;
									<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].pedyy.focus()}" styleId="peddd" />&nbsp;
									<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="pedyy" />&nbsp;(MM/DD/YYYY)
								</td>	
							</tr>
							
							<tr>
							<td class="FormLabels" align="left">Quote LookUpName</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct'
								property="answer(Object::Product::QuoteLookUpName)" size="30"
								maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />
							</td>
						</tr>

						<tr>
							<td class="FormLabels" align="left">Plan LookUpName</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct'
								property="answer(Object::Product::PlanLookUpName)" size="30"
								maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />
							</td>
						</tr>

						<tr>
							<td class="FormLabels" align="left">Rate LookUpName</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct'
								property="answer(Object::Product::RateLookUpName)" size="30"
								maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />
							</td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">Ratesheet LookUpName</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct'
								property="answer(Object::Product::RatesheetLookUpName)" size="30"
								maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />
							</td>
						</tr>
							
						<tr>
							<td class="FormLabels" align="left">
								Risk
							</td>
							<td>
							<dmshtml:get_available_risks nameInSession="arrRisks" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							<bean:define id="risks" name="arrRisks" type="java.util.ArrayList"/>
								<html:select property="answer(Object::Risk::RiskId)" name="AddProduct" onchange="return getObjectType()" > 
									<html:option value ="">Select</html:option>
									<%for(int i=0;i<risks.size();i++) {
									com.dms.ejb.data.QuestionHashMap riskMap=(com.dms.ejb.data.QuestionHashMap)risks.get(i);	
									%>
		
									<html:option value ='<%=riskMap.getString("Object::Risk::RiskId")%>'>
									<%=riskMap.getString("Object::Risk::RiskTypeName")%></html:option>
									<%}%>
								</html:select>
							</td>
						</tr> 

							<tr>
								<td class="FormLabels" align="left">
									Insurance Type
								</td>
								<td>
								<logic:present name="RISK_INSURANCE_TYPES" scope="request" >
									<bean:define id="arrInsuranceTypes" name="RISK_INSURANCE_TYPES" type="java.util.ArrayList"/>
									<html:select property="answer(Object::Risk::InsuranceTypeId)" onchange="return getObjectType()">
									<html:option value ="">Select</html:option>
										<%for(int i=0;i<arrInsuranceTypes.size();i++) {
										com.dms.ejb.data.QuestionHashMap productMap=(com.dms.ejb.data.QuestionHashMap)arrInsuranceTypes.get(i);	
										%>
			
										<html:option value ='<%=productMap.getString("Object::Risk::InsuranceTypeId")%>'>
										<%=productMap.getString("Object::Risk::InsuranceTypeName")%></html:option>
										<%}%>
									</html:select>
									</logic:present>
								</td>
							</tr> 

							<tr>
								<td class="FormLabels" align="left">
									Company
								</td>
								<td>
								<logic:present name="INSURANCE_COMPANIES" scope="request" >
									<bean:define id="arrCompanies" name="INSURANCE_COMPANIES" type="java.util.ArrayList" />
									<html:select property="answer(Object::InsuranceType::CompanyId)" onchange="return getObjectType()">
									<html:option value ="">Select</html:option>
										<%for(int i=0;i<arrCompanies.size();i++) {
										com.dms.ejb.data.QuestionHashMap productMap=(com.dms.ejb.data.QuestionHashMap)arrCompanies.get(i);	
										%>
			
										<html:option value ='<%=productMap.getString("Object::InsuranceType::CompanyId")%>'>
										<%=productMap.getString("Object::InsuranceType::CompanyName")%></html:option>
										<%}%>
									</html:select>
									</logic:present>
								</td>
							</tr> 

								<tr>
								<td class="FormLabels" align="left">
									Program
								</td>
								<td>
								<logic:present name="PROGRAMS" scope="request" >
									<bean:define id="arrPrograms" name="PROGRAMS" type="java.util.ArrayList"/>
									<html:select property="answer(Object::Company::ProgramId)">
									<html:option value ="">Select</html:option>
										<%for(int i=0;i<arrPrograms.size();i++) {
										com.dms.ejb.data.QuestionHashMap productMap=(com.dms.ejb.data.QuestionHashMap)arrPrograms.get(i);	
										%>
			
										<html:option value ='<%=productMap.getString("Object::Company::ProgramId")%>'>
										<%=productMap.getString("Object::Company::ProgramName")%></html:option>
										<%}%>
									</html:select>
									</logic:present>
								</td>
							</tr> 

								<tr>
								<td class="FormLabels" align="left">
									Form
								</td>
								<td>
								<dmshtml:get_available_forms nameInSession="arrForms" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
						<bean:define id="forms" name="arrForms" type="java.util.ArrayList"/>
									<html:select property="answer(Object::Program::FormId)" name="AddProduct" > 
						<html:option value ="">Select</html:option>
										<%for(int i=0;i<forms.size();i++) {
										com.dms.ejb.data.QuestionHashMap formMap=(com.dms.ejb.data.QuestionHashMap)forms.get(i);	
										%>
			
										<html:option value ='<%=formMap.getString("Object::Program::FormId")%>'>
										<%=formMap.getString("Object::Program::FormName")%></html:option>
										<%}%>
									</html:select>
								</td>
							</tr> 

								<tr>
								<td class="FormLabels" align="left">
									Surplus Line
								</td>

								<td class="FormLabels">
									<html:radio property = "answer(Object::Product::SurplusLines)" value="Yes" />&nbsp;Yes
									&nbsp;<html:radio property = "answer(Object::Product::SurplusLines)" value="No" />&nbsp;No
								</td>
							</tr>

							<tr>
								<td class="FormLabels" align="left">
									Is Rated
								</td>

								<td class="FormLabels">
									<html:radio property = "answer(Object::Product::IsRated)" value="Y" />&nbsp;Yes
									&nbsp;<html:radio property = "answer(Object::Product::IsRated)" value="N" />&nbsp;No
								</td>
							</tr>

							<tr>
								<td class="FormLabels" align="left">
									Type
								</td>
								<td class="links" style="Class: txtbox">
									<html:select name='AddProduct' property="answer(Object::Product::Type)" styleClass="txtbox" styleId="State">
									    <html:option value ='Product'>Product</html:option>
									    <html:option value ='Endorsement'>Endorsement</html:option>
									</html:select>
								</td>
							</tr>

							<tr>
								<td class="FormLabels" align="left">
									Monetary
								</td>
								<td class="links" style="Class: txtbox">
									<html:select name='AddProduct' property="answer(Object::Product::Monetary)" styleClass="txtbox" styleId="State">
									    <html:option value ='Yes'>Yes</html:option>
									    <html:option value ='No'>No</html:option>
									</html:select>
								</td>
							</tr>

							<tr>
								<td width="30%" class="FormLabels" align="left">
									ExtnGroup
								</td>
								<td class="links">
									<html:text  name='AddProduct' property ="answer(Object::Product::ExtnGroup)"  size="5" maxlength="5" styleClass="txtbox" styleId="ProductDesc"/>
								</td>
							</tr>
													
							<tr>
								<td width="30%" class="FormLabels" align="left">
									ExtnType
								</td>
								<td class="links">
									<html:text  
									name='AddProduct' 
									property ="answer(Object::Product::ExtnType)"  
									size="5" maxlength="5" 
									styleClass="txtbox" 
									styleId="ProductDesc"/>
								</td>
							</tr>
							
							
							<tr>
								<td class="FormLabels" align="left">SubmissionURL</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::SubmissionURL)" size="50"
									maxlength="100" styleClass="txtbox" />
									</td>
							</tr>
						
							<tr>
								<td class="FormLabels" align="left">BillingURL</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::BillingURL)" size="50"
									maxlength="100" styleClass="txtbox" />
									</td>
							</tr>			
							
							<tr>
								<td class="FormLabels" align="left">Product Code</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::ProductCode)" size="2"
									maxlength="2" styleClass="txtbox" />
									</td>
							</tr>
						
							<tr>
								<td class="FormLabels" align="left">Carrier Code</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::CarrierCode)" size="5"
									maxlength="5" styleClass="txtbox" />
									</td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">Transaction Code 1</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::TransactionCode1)" size="5"
									maxlength="5" styleClass="txtbox" />
									</td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">Transaction Code 2</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::TransactionCode2)" size="5"
									maxlength="5" styleClass="txtbox" />
									</td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">SubmissionQueue Name</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::SubmissionQueueName)" size="30"
									maxlength="80" styleClass="txtbox" />
									</td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">BillingQueue Name</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::BillingQueueName)" size="30"
									maxlength="80" styleClass="txtbox" />
									</td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">
									Active
								</td>
								<td class="links" style="Class: txtbox">
									<html:select name='AddProduct' property="answer(Object::Product::Active)" styleClass="txtbox" styleId="State">
									    <html:option value ='Y'>Active</html:option>
									    <html:option value ='D'>Inactive</html:option>
									</html:select>
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
			<hr size="1" noshade width="95%">
		</td>
	</tr>
	<tr>

		<td align="center">

						<html:submit value="Save" property="answer(Save)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
			&nbsp;&nbsp;&nbsp;
			<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
		</td>
	</tr>
</table>



<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
   <html:hidden property="answer(Object::Product::User)" value="<%=userName.toString()%>" />   
   <html:hidden property="answer(Object::Product::CreatedBy)" value="<%=userName.toString()%>" /> 
   <html:hidden property="answer(Object::Product::UpdatedBy)" value="<%=userName.toString()%>" />
<html:hidden name="DataForm" property="answer(versionid)" value="3"/>
<html:hidden name="DataForm" property="answer(RootTemplate)" value="yes"/>
<html:hidden property="answer(Object::Product::dbName)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
   <html:hidden property="answer(Object::Product::CurrentReleasedVerId)" value="1" />
   <html:hidden property="answer(Object::Product::ProductNumType)" value="fhj" />
   <html:hidden property="answer(Object::Product::ProductSubNum)" value="dgjg" />
   
   <html:hidden property="answer(Object::ProductVer::AttachmentId)" value="-1" />
   <html:hidden property="answer(Object::ProductVer::ChangePurpose)" value="chsewnsr" />
   <html:hidden property="answer(Object::ProductVer::ChangeType)" value="chngetype" />
   <html:hidden property="answer(Object::Product::OwnerId)" value="<%=ownerId.toString()%>" />
	

	<html:hidden  property="answer(Object::Product::ProductStartDate)" value="" styleId="ProductStartDate"/>
	<html:hidden  property="answer(Object::Product::ProductEndDate)" value="" styleId="ProductEndDate"/>
	
	<html:hidden  property="answer(Object::ProductVer::ProductName)" value="" styleId="ProductverName"/>
	<html:hidden  property="answer(Object::ProductVer::ProductVerDesc)" value="" styleId="ProductVerDesc"/>
	<html:hidden  property="answer(Object::ProductVer::ProductVerStatus)" value="" styleId="ProductVerStatus"/>			
	<html:hidden  property="answer(Object::ProductVer::ProductVerStartDate)" value="" styleId="ProductVerStartDate"/>
	<html:hidden  property="answer(Object::ProductVer::ProductVerEndDate)" value="" styleId="ProductVerEndDate"/>
	<html:hidden  property="answer(Object::ProductVer::CreatedBy)" value="<%=userName.toString()%>" />		
	<html:hidden  property="answer(Object::ProductVer::FamilyId)" value="" styleId="ProductVerFamilyId"/>	
	<html:hidden  property="answer(Object::ProductVer::VerNumber)" value="" styleId="ProductVersionNumber"/>											
	<html:hidden  property="answer(Object::ProductVer::ProdVerQuoteLookUpName)" value="" styleId="ProdVerQuoteLookUpName"/>
	<html:hidden  property="answer(Object::ProductVer::ProdVerPlanLookUpName)" value="" styleId="ProdVerPlanLookUpName"/>
	<html:hidden  property="answer(Object::ProductVer::ProdVerRateLookUpName)" value="" styleId="ProdVerRateLookUpName"/>
	<html:hidden  property="answer(Object::ProductVer::ProdVerRatesheetLookUpName)" value="" styleId="ProdVerRatesheetLookUpName"/>
	<html:hidden property="answer(Object::ProductVer::Active)" value="y" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<!--  -->
 </html:form>

 </body>