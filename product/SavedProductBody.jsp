<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript">
<!--

function getObjectType()
	{
		var formElement=document.forms[0];		
		formElement.action="../LoadSavedProduct.do";
		
		if((formElement.psdmm.value!="")&&(formElement.psddd.value!="")&&(formElement.psdyy.value!="")) {
			formElement.ProductStartDate.value=formElement.psdmm.value+"/"+formElement.psddd.value+"/"+formElement.psdyy.value;
		}

		if((formElement.pedmm.value!="")&&(formElement.peddd.value!="")&&(formElement.pedyy.value!="")) {
		formElement.ProductEndDate.value=formElement.pedmm.value+"/"+formElement.peddd.value+"/"+formElement.pedyy.value;
		}
		
		formElement.submit();
		return true;
	}
function storeDateValues()
{
var formElement=document.forms[0];

if((formElement.psdmm.value!="")&&(formElement.psddd.value!="")&&(formElement.psdyy.value!="")) {
formElement.ProductStartDate.value=formElement.psdmm.value+"/"+formElement.psddd.value+"/"+formElement.psdyy.value;
}

if((formElement.pedmm.value!="")&&(formElement.peddd.value!="")&&(formElement.pedyy.value!="")) {
formElement.ProductEndDate.value=formElement.pedmm.value+"/"+formElement.peddd.value+"/"+formElement.pedyy.value;
}

return true;
}
//-->
</SCRIPT>
<body leftmargin="0" rightmargin="0" topmargin="0" onLoad="return popDateFields()">
<html:form action="/SaveProduct" onsubmit="return storeDateValues()">
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">


		<bean:define id="productStatus" name='AddProduct'
			property='answer(Object::Product::ProductStatus)' />
		<% System.out.println("productStatus-->"+productStatus);
	boolean readonly = false; %>
		<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
			value="<%=""+productStatus%>" negated="true">
			<% readonly = true;%>
		</dmshtml:dms_isPresent>
		<tr><td><html:hidden property="answer(dbname)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
		<html:hidden property="versionNum" value="1.0" /></td></tr>
		<tr>
			<td>
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2"
				CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<logic:present name="staleDataSubmissionMsg" scope="request">
					<tr>
						<td class="Error"><bean:message
							key="error.staleDataSubmissionMsg" /></td>
					</tr>
				</logic:present>



				<tr>
					<td height="5"></td>
				</tr>

				<tr>
					<td class="NewSectionHead" align="center">PRODUCT SUMMARY</td>
				</tr>


				<tr>
					<td>&nbsp;</td>
				</tr>
				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />
				<bean:define id="productId"
					property="answer(Object::Product::ProductId)" name="AddProduct"
					scope="request" />
				<bean:define id="productVerId"
					property="answer(Object::Product::CurrentVerId)" name="AddProduct"
					scope="request" />

				<tr>
					<td>
					<hr size="1" noshade>
					</td>
				</tr>
				<tr>
					<td align="center">

					<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"
						CELLPADDING="2">
						<tr>
							<td align="center" class="sectionhead" colspan="2">&nbsp;
							PRODUCT DETAILS</td>

						</tr>

						<tr>
							<td class="links" align="left"><a
								href='../ListProductVersions.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<%=""+productId%>'>List
							Product Versions</a></td>
						
						<dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
						value="<%=""+productStatus%>" negated="true">
								<td class="links" align="left">	
								<a href ='../CopyProduct.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&productId=<%=""+productId%>' >Copy Product</a>	
								</td>	
						</dmshtml:dms_isPresent>
						</tr>
						
						<logic:present name="copyPrdSuccess" scope="request">						
						<tr>
							<td class="error" align="left">
								Product was copied successfully
							</td>
						</tr>
						<tr>
							<td class="error" align="left">
								Policy Number need to be set to generate Policy Number
							</td>
						</tr>
						<tr>
							<td class="error" align="left">
								Modify rules file(.drl) if product name is changed
							</td>
						</tr>
						</logic:present>	

						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="sectionhead1" align="left">Product Id</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct' property="answer(Object::Product::ProductId)"
								size="10" maxlength="10" styleClass="txtbox"
								readonly="<%=readonly%>" /></td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left" WIDTH="40%">Family:</td>
							<td class="TextMatter" align="left" WIDTH="40%"><dmshtml:get_product_family
								nameInSession="arProductFamily"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />

							<html:select property="answer(Object::Product::FamilyId)"
								disabled="<%=readonly%>">
								<html:option value="">Select</html:option>
								<logic:present name="arProductFamily" scope="request">
									<logic:iterate id="details" name="arProductFamily"
										scope="request">
										<bean:define id='familyId' name="details"
											property="prdFamilyId" />
										<html:option value='<%=familyId.toString()%>'>
											<bean:write name="details" property="familyName" />
										</html:option>
									</logic:iterate>
								</logic:present>
							</html:select></td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left">Type</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct'
								property="answer(Object::Product::ProductType)" size="30"
								maxlength="30" styleClass="txtbox" readonly="<%=readonly%>" /></td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Number</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct' property="answer(Object::Product::ProductNum)"
								size="30" maxlength="30" styleClass="txtbox"
								readonly="<%=readonly%>" /></td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left">Version Number</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct' property="answer(Object::Product::VerNumber)"
								size="15" maxlength="20" styleClass="txtbox" /></td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left">Name</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct'
								property="answer(Object::Product::ProductName)" size="30"
								maxlength="40" styleClass="txtbox" readonly="<%=readonly%>" />

							</td>

						</tr>
						
						
						<tr>
							<td class="sectionhead1" align="left">Description</td>
							<td class="TextMatter" align="left"><html:textarea rows="4"
								name='AddProduct'
								property="answer(Object::Product::ProductDesc)" cols="37" 
								styleClass="txtarea" readonly="<%=readonly%>" />
							</td>
						</tr>

							<tr>
								<td width="30%" class="sectionhead1" align="left">
									Line Of Business
								</td>
								<td class="links">
									<html:text  name='AddProduct' property ="answer(Object::Product::LineOfBusiness)"  size="15" maxlength="120" styleClass="txtbox" styleId="ProductDesc"/>
								</td>
							</tr>

						<tr>
							<td class="sectionhead1" align="left">Can this product be
							sold independently</td>

							<td class="FormLabels"><html:radio name='AddProduct'
								property="answer(Object::Product::SellIndependent)" value="Y"
								disabled="<%=readonly%>" /> &nbsp;Yes&nbsp; <html:radio
								name='AddProduct'
								property="answer(Object::Product::SellIndependent)" value="N"
								disabled="<%=readonly%>" /> &nbsp;No</td>

						</tr>
						<tr>
							<td class="sectionhead1" align="left">Status</td>
							<td class="TextMatter" align="left"><html:select
								name="AddProduct"
								property="answer(Object::Product::ProductStatus)"
								styleClass="txtbox" disabled="<%=readonly%>">
								<html:option value='RELEASED'>Released</html:option>
								<html:option value='RESTRICTED'>Restricted</html:option>
								<html:option value='DEVELOPMENT'>Development</html:option>
								<html:option value='QA'>QA</html:option>
							</html:select></td>

						</tr>


						<tr>
							<td class="sectionhead1" align="left">Product Start Date</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Month)" size="2" maxlength="2"
								styleClass="txtbox"
								onkeyup="if(this.value.length==2) {document.forms[0].psddd.focus()}"
								styleId="psdmm" />&nbsp; <html:text property="answer(Date)"
								size="2" maxlength="2" styleClass="txtbox"
								onkeyup="if(this.value.length==2) {document.forms[0].psdyy.focus()}"
								styleId="psddd" />&nbsp; <html:text property="answer(Year)"
								size="4" maxlength="4" styleClass="txtbox"
								onkeyup="if(this.value.length==4) {document.forms[0].pedmm.focus()}"
								styleId="psdyy" />&nbsp;(MM/DD/YYYY)</td>

						</tr>
						<tr>
							<td class="sectionhead1" align="left">Product Expiration
							Date</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Month)" size="2" maxlength="2"
								styleClass="txtbox"
								onkeyup="if(this.value.length==2) {document.forms[0].peddd.focus()}"
								styleId="pedmm" />&nbsp; <html:text property="answer(Date)"
								size="2" maxlength="2" styleClass="txtbox"
								onkeyup="if(this.value.length==2) {document.forms[0].pedyy.focus()}"
								styleId="peddd" />&nbsp; <html:text property="answer(Year)"
								size="4" maxlength="4" styleClass="txtbox" styleId="pedyy" />&nbsp;(MM/DD/YYYY)
							</td>

						</tr>
						
							<tr>
							<td class="sectionhead1" align="left">Quote LookUpName</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct'
								property="answer(Object::Product::QuoteLookUpName)" size="30"
								maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />

							</td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Plan LookUpName</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct'
								property="answer(Object::Product::PlanLookUpName)" size="30"
								maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />

							</td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Rate LookUpName</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct'
								property="answer(Object::Product::RateLookUpName)" size="30"
								maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />

							</td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Ratesheet LookUpName</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct'
								property="answer(Object::Product::RatesheetLookUpName)" size="30"
								maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />

							</td>

						</tr>


						<tr>
								<td class="sectionhead1" align="left">
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
							<td class="sectionhead1" align="left">
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
							<td class="sectionhead1" align="left">
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
								<td class="sectionhead1" align="left">
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
								<td class="sectionhead1" align="left">
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
								<td class="sectionhead1" align="left">
									Surplus Lines
								</td>

								<td class="FormLabels">
									<html:radio property = "answer(Object::Product::SurplusLines)" value="Yes" />&nbsp;Yes
									&nbsp;<html:radio property = "answer(Object::Product::SurplusLines)" value="No" />&nbsp;No
								</td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">
									Is Rated
								</td>

								<td class="FormLabels">
									<html:radio property = "answer(Object::Product::IsRated)" value="Y" />&nbsp;Yes
									&nbsp;<html:radio property = "answer(Object::Product::IsRated)" value="N" />&nbsp;No
								</td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">
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
								<td class="sectionhead1" align="left">
									Monetary
								</td>
								<td class="links" style="Class: txtbox">
									<html:select name='AddProduct' property="answer(Object::Product::Monetary)" styleClass="txtbox" styleId="State">
									    <html:option value ='Y'>Yes</html:option>
									    <html:option value ='N'>No</html:option>
									</html:select>
								</td>
							</tr>

							<tr>
								<td width="30%" class="sectionhead1" align="left">
									ExtnGroup
								</td>
								<td class="links">
									<html:text  name='AddProduct' property ="answer(Object::Product::ExtnGroup)"  size="5" maxlength="5" styleClass="txtbox" styleId="ProductDesc"  readonly="<%=readonly%>"/>
								</td>
							</tr>
													
							<tr>
								<td width="30%" class="sectionhead1" align="left">
									ExtnType
								</td>
								<td class="links">
									<html:text  name='AddProduct' property ="answer(Object::Product::ExtnType)"  size="5" maxlength="5" styleClass="txtbox" styleId="ProductDesc"  readonly="<%=readonly%>"/>
								</td>
							</tr>
							
							
							<tr>
								<td class="sectionhead1" align="left">SubmissionURL</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::SubmissionURL)" size="50"
									maxlength="50" styleClass="txtbox" readonly="<%=readonly%>" />
									</td>
							</tr>
						
							<tr>
								<td class="sectionhead1" align="left">BillingURL</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::BillingURL)" size="50"
									maxlength="50" styleClass="txtbox" readonly="<%=readonly%>" />
									</td>
							</tr>			
							
							<tr>
								<td class="sectionhead1" align="left">Product Code</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::ProductCode)" size="3"
									maxlength="3" styleClass="txtbox" readonly="<%=readonly%>" />
									</td>
							</tr>							
							
							<tr>
								<td class="sectionhead1" align="left">Carrier Code</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::CarrierCode)" size="5"
									maxlength="5" styleClass="txtbox" readonly="<%=readonly%>" />
									</td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left">Transaction Code 1</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::TransactionCode1)" size="5"
									maxlength="5" styleClass="txtbox" readonly="<%=readonly%>"/>
									</td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left">Transaction Code 2</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::TransactionCode2)" size="5"
									maxlength="5" styleClass="txtbox" readonly="<%=readonly%>" />
									</td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left">SubmissionQueue Name</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::SubmissionQueueName)" size="30"
									maxlength="80" styleClass="txtbox" readonly="<%=readonly%>"/>
									</td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left">BillingQueue Name</td>
									<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::Product::BillingQueueName)" size="30"
									maxlength="80" styleClass="txtbox" readonly="<%=readonly%>"/>
									</td>
							</tr>
						<tr>
							<td class="sectionhead1" align="left">Active</td>
							<td class="TextMatter" align="left"><html:select
								name='AddProduct' property="answer(Object::Product::Active)"
								styleClass="txtbox" styleId="State" disabled="<%=readonly%>">
								<html:option value='Y'>Active</html:option>
								<html:option value='D'>Inactive</html:option>
							</html:select></td>
							<td class="links" ><a
	href="../ListPolicyDurations.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&productId=<%=""+productId%>">Policy Duration </a></td>
						</tr>



					</table>

				<tr>
					<td align="center">&nbsp;</td>
				</tr>




				<tr>
					<td align="center" class="SearchResult">
					<table WIDTH="760px" ALIGN="center" BORDER="0"
						style="{border-width:1px; border-style:solid; border-color: #999999;}">

						<!-- Add/Remove Links Starts-->
						<tr>


							

								<td class="sectionhead" align="center">Available Features</td>
								<td class="sectionhead" align="center">Available Options</td>
								<td class="sectionhead" align="center">Available Factors</td>

						</tr>

						
							<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
								value="<%=""+productStatus%>" negated="false">
						<tr>
								<td align="center" class="sectionheadLink"><a
									href="../product/LinkFeaturesToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
								Feature</a></td>


								<td align="center" class="sectionheadLink"><a
									href="../product/LinkOptionsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
								Option</a></td>


								<td align="center" class="sectionheadLink"><a
									href="../product/LinkFactorsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
								Factor</a></td>
						</tr>
							</dmshtml:dms_isPresent>

	

						<!-- Add/Remove Links End -->




						<tr>
							<td class="SearchResult" width="33%" valign="top">
							<table width="100%">
								<dmshtml:get_product_features nameInSession="arrFeatures"
									ownerId="<%=Long.parseLong(""+ownerId)%>"
									productId="<%=Long.parseLong(productId.toString())%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />

								<logic:present name="arrFeatures" scope="request">
									<logic:iterate id="features" name="arrFeatures" scope="request">
											<tr>
											<td class="SearchResult">
											<bean:define id='featureId'
												name="features" property="productFeatureId" />
												<bean:define id='featureName'
												name="features" property="featureName" />
												<a href="../product/LinkRoleToProductFeatures.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(featureId)=<%=featureId.toString()%>&answer(featureName)=<%=featureName.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">
												<bean:write
												name="features" property="featureDesc" /></a></td>
										</tr>
									</logic:iterate>
								</logic:present>
							</table>
							</td>

							<td class="SearchResult" width="33%" valign="top">
							<table width="100%">
								<dmshtml:get_product_options nameInSession="arrProdOptions"
									ownerId="<%=Long.parseLong(""+ownerId)%>"
									productId="<%=Long.parseLong(productId.toString())%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrProdOptions" scope="request">
									<logic:iterate id="prodOptions" name="arrProdOptions"
										scope="request">
										<tr>
											<td class="SearchResult">
												<bean:define id='optionName' name="prodOptions" property="optionName"/>
												<bean:define id='optionId' name="prodOptions" property="optionId"/>
												<a href="/GetOptionDetails.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductOptions::Equals::OptionId)=<%=optionId%>"><%=optionName.toString()%></a>
												
											</td>											
										</tr>
									</logic:iterate>
								</logic:present>
							</table>
							</td>


							<td class="SearchResult" width="33%" valign="top">
							<table width="100%">
								<dmshtml:get_product_factors nameInSession="arrProdFactors"
									ownerId="<%=Long.parseLong(""+ownerId)%>"
									productId="<%=Long.parseLong(productId.toString())%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrProdFactors" scope="request">
									<logic:iterate id="prodFactors" name="arrProdFactors"
										scope="request">
										<tr>
											<td class="SearchResult">
											<bean:define id='factorName' name="prodFactors" property="factorName" />
											<bean:define id='factorId' name="prodFactors" property="factorId" />
												<A HREF="../GetFactor.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductFactors::Equals::FactorId)=<%=""+factorId%>"><%=factorName.toString()%></A>
											</td>
										</tr>
									</logic:iterate>
								</logic:present>
							</table>
							</td>

						</tr>


						<!-- Add/Remove Links Starts-->


							<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
								value="<%=""+productStatus%>" negated="false">
						<tr>
								<td align="center" class="sectionheadLink"><a
									href="../product/LinkFeaturesToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
								Feature</a></td>

								<td align="center" class="sectionheadLink"><a
									href="../product/LinkOptionsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
								Option</a></td>



								<td align="center" class="sectionheadLink"><a
									href="../product/LinkFactorsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
								Factor</a></td>
						</tr>
							</dmshtml:dms_isPresent>


						<!-- Add/Remove Links End-->


						
					</table>
					</td>
				</tr>





				<tr>
					<td align="center">&nbsp;</td>
				</tr>
<bean:define id='type' name="AddProduct" property="answer(Object::Product::Type)" />
				<tr>
					<td>
												<table WIDTH="500px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">						
							<tr>
								<td class="sectionhead" align="left">Available States</td>
											<logic:equal name="type" value="Product">
								<td class="sectionhead" align="left">Available endorsements</td>
								</logic:equal>
							</tr>
	
							<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
								value="<%=""+productStatus%>" negated="false">
							<tr>
								<td align="center" class="sectionheadLink"><a
	href="../product/LinkStatesToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
								State</a></td>
									<logic:equal name="type" value="Product">
		<td align="center" class="sectionheadLink"><a
	href="../product/LinkEndorsementToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
								endorsements</a></td>
							</logic:equal>
							</tr>
							</dmshtml:dms_isPresent>

						<tr>

							<td class="links" align="left"><dmshtml:get_product_states
								nameInSession="arrStates"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								productId="<%=Long.parseLong(productId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							<logic:present name="arrStates" scope="request">
								<logic:iterate id="states" name="arrStates" scope="request">
									<bean:define id='state' name="states" property="state" />
									<a
href="../product/LinkStateToProductFeatures.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(Object::Product::State)=<%=state.toString()%>">
									<bean:write name="states" property="stateCode" /></a>
									<br>
								</logic:iterate>
							</logic:present></td>
					<logic:equal name="type" value="Product">
							<td class="links" align="left">
							<dmshtml:get_product_endorsements
								nameInSession="arrProds"
								productId="<%=Long.parseLong(productId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrProds" scope="request">
           <logic:iterate id="prods" name="arrProds" scope="request" >
		    <bean:define id='endorsementId' name="prods"  property="productId" />
				<a href="../GetProductAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<%=endorsementId.toString()%>">
									<bean:write name="prods" property="MProductName" /> </a>
									<br>
								</logic:iterate>
							</logic:present></td>
							</logic:equal>
							</tr>

							
							<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
								value="<%=""+productStatus%>" negated="false">
								<tr>
									<td align="center" class="sectionheadLink"><a
										href="../product/LinkStatesToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
									State</a></td>
									<logic:equal name="type" value="Product">
									<td align="center" class="sectionheadLink"><a
										href="../product/LinkEndorsementToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
									Endorsements</a></td>
									</logic:equal>
								</tr>
							</dmshtml:dms_isPresent>
					</table>
						

				</td>
				</tr>

			</table>
			</td>
		</tr>

		 <tr><td>&nbsp;</td></tr>
		    
		 <tr>
		 	<td>
		    	<table WIDTH="700px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">
		    		<tr>
						<td class="sectionheadLink" align="center" colspan="4">Applications Associated to the Product </td>
			       </tr>      
		    	   <tr>
		  				  <td class="sectionheadLink" align="center">Risk/Quote</td>
				        <td class="sectionheadLink" align="center">Submission</td>
				        <td class="sectionheadLink" align="center">Proposal</td>
								<td class="sectionheadLink" align="center">Request To Bind</td>
				        <td class="sectionheadLink" align="center">Binder</td>
				        <td class="sectionheadLink" align="center">Issuance</td>
				        
			       </tr>
		
					<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>" value="<%=""+productStatus%>" negated="false">
				       <tr>
							<td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=RISK">Add/Remove Application</a></td>
					        <td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=SUBMISSION">Add/Remove Application</a></td>
					        <td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=PROPOSAL">Add/Remove Application</a></td>
<td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=REQUEST_TO_BIND">Add/Remove Application</a></td>
									<td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=BINDER">Add/Remove Application</a></td>
									<td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=ISSUANCE">Add/Remove Application</a></td>
					   </tr>
				   </dmshtml:dms_isPresent>
				   
				   <tr>
				   		
				   		<td class="SearchResult">
			   			
<dmshtml:get_product_apps_by_type
								nameInSession="arrApps"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								type="RISK"
								productId="<%=Long.parseLong(productId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrApps" scope="request">
           <logic:iterate id="apps" name="arrApps" scope="request" >
		    <bean:define id='applicationId' name="apps"  property="applicationId" />
				<a href="../GetApplicationAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>">
									<bean:write name="apps" property="applicationName" /> </a>
									<br>
								</logic:iterate>
							</logic:present>
						</td>
						
						
						<td class="SearchResult">
			   			<dmshtml:get_product_apps_by_type
								nameInSession="arrApps"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								type="SUBMISSION"
								productId="<%=Long.parseLong(productId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrApps" scope="request">
           <logic:iterate id="apps" name="arrApps" scope="request" >
		    <bean:define id='applicationId' name="apps"  property="applicationId" />
				<a href="../GetApplicationAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>">
									<bean:write name="apps" property="applicationName" /> </a>
									<br>
								</logic:iterate>
							</logic:present>
						</td>
				   		
				   		<td class="SearchResult">
<dmshtml:get_product_apps_by_type
								nameInSession="arrApps"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								type="PROPOSAL"
								productId="<%=Long.parseLong(productId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrApps" scope="request">
           <logic:iterate id="apps" name="arrApps" scope="request" >
		    <bean:define id='applicationId' name="apps"  property="applicationId" />
				<a href="../GetApplicationAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>">
									<bean:write name="apps" property="applicationName" /> </a>
									<br>
								</logic:iterate>
							</logic:present>
						</td>
				   		
				   		<td class="SearchResult">
<dmshtml:get_product_apps_by_type
								nameInSession="arrApps"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								type="REQUEST_TO_BIND"
								productId="<%=Long.parseLong(productId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrApps" scope="request">
           <logic:iterate id="apps" name="arrApps" scope="request" >
		    <bean:define id='applicationId' name="apps"  property="applicationId" />
				<a href="../GetApplicationAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>">
									<bean:write name="apps" property="applicationName" /> </a>
									<br>
								</logic:iterate>
							</logic:present></td>

							<td class="SearchResult">
<dmshtml:get_product_apps_by_type
								nameInSession="arrApps"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								type="BINDER"
								productId="<%=Long.parseLong(productId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrApps" scope="request">
           <logic:iterate id="apps" name="arrApps" scope="request" >
		    <bean:define id='applicationId' name="apps"  property="applicationId" />
				<a href="../GetApplicationAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>">
									<bean:write name="apps" property="applicationName" /> </a>
									<br>
								</logic:iterate>
							</logic:present></td>

							<td class="SearchResult">
<dmshtml:get_product_apps_by_type
								nameInSession="arrApps"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								type="ISSUANCE"
								productId="<%=Long.parseLong(productId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrApps" scope="request">
           <logic:iterate id="apps" name="arrApps" scope="request" >
		    <bean:define id='applicationId' name="apps"  property="applicationId" />
				<a href="../GetApplicationAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>">
									<bean:write name="apps" property="applicationName" /> </a>
									<br>
								</logic:iterate>
							</logic:present></td>
				   </tr>
				   	
				   	<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>" value="<%=""+productStatus%>" negated="false">			   
					   <tr>
							<td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=RISK">Add/Remove
									Application</a></td>
					        <td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=SUBMISSION">Add/Remove
									Application</a></td>
					        <td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=PROPOSAL">Add/Remove
									Application</a></td>
<td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=REQUEST_TO_BIND">Add/Remove
									Application</a></td>
									<td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=BINDER">Add/Remove
									Application</a></td>
<td align="center" class="sectionheadLink"><a
href="../product/LinkAppsToProduct.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(type)=ISSUANCE">Add/Remove
									Application</a></td>
					   </tr>
					</dmshtml:dms_isPresent>
				   
			   	</table>
		    </td>
		</tr>
		
		 <tr><td>&nbsp;</td></tr>
		    
		 <tr>
		 	<td>
		    	<table WIDTH="700px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">
		    		<tr>
						<td class="sectionheadLink" align="center" colspan="4">Documents Associated to the Product</td>
			       </tr>      
		    	   <tr>
				        <td class="sectionheadLink" align="center">Proposal Document</td>
				        <td class="sectionheadLink" align="center">Binder</td>
				        <td class="sectionheadLink" align="center">Issuance</td>
				        <td class="sectionheadLink" align="center">Application</td>
			       </tr>
		
					<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>" value="<%=""+productStatus%>" negated="false">
				       <tr>
							<td height="25%" align="center" class="sectionhead"><a href="/AssociatedDocumentListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=PROPOSAL&answer(Object::Product::Document::PrdVerId)=<%=productVerId%>&answer(Object::Product::Document::PrdId)=<%=productId%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%> ">Add/Remove Document</a></td>
					        <td height="25%" align="center" class="sectionhead"><a href="/AssociatedDocumentListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=BINDER&answer(Object::Product::Document::PrdVerId)=<%=productVerId%>&answer(Object::Product::Document::PrdId)=<%=productId%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%> ">Add/Remove Document</a></td>
					        <td height="25%" align="center" class="sectionhead"><a href="/AssociatedDocumentListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=ISSUANCE&answer(Object::Product::Document::PrdVerId)=<%=productVerId%>&answer(Object::Product::Document::PrdId)=<%=productId%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%> ">Add/Remove Document</a></td>
							<td height="25%" align="center" class="sectionhead"><a href="/AssociatedDocumentListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=APPLICATION&answer(Object::Product::Document::PrdVerId)=<%=productVerId%>&answer(Object::Product::Document::PrdId)=<%=productId%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%> ">Add/Remove Document</a></td>
					   </tr>
				   </dmshtml:dms_isPresent>
				   
				   <tr>
				   		
				   		<td class="SearchResult">		   		
			   			
			   			<dmshtml:getAssociatedDocumentList nameInSession="AssociatedProposalDocumentList"
			   						documentType="<%=new String[]{"PROPOSAL"}%>"
									productId="<%= ""+productId%>"
									productVersionId="<%= ""+productVerId%>"
									ownerId="<%= ""+ownerId%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							
							<logic:present name="AssociatedProposalDocumentList" scope="request">
					           <table width="100%">
					           <logic:iterate id="AssociatedProposalDocumentList" name="AssociatedProposalDocumentList" scope="request">
									<bean:define id='versionId' name="AssociatedProposalDocumentList" property="versionId"/>
									<bean:define id='documentId' name="AssociatedProposalDocumentList" property="documentId"/>
									<bean:define id='documentName' name="AssociatedProposalDocumentList" property="documentName"/>
									
										<tr>
											<td class="SearchResult">
												<a href="/EditDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>&answer(Object::Product::Document::Definition::DocId)=<%= documentId%>&answer(Object::Product::Document::Definition::VerId)=<%= versionId%>">
												<%= documentName %>
												</a>
											</td>
										</tr>
								</logic:iterate>
								</table>
							</logic:present>
						</td>
						
						
						<td class="SearchResult">
			   			
			   			<dmshtml:getAssociatedDocumentList nameInSession="AssociatedBinderDocumentList"
			   						documentType="<%=new String[]{"BINDER"}%>"
									productId="<%= ""+productId%>"
									productVersionId="<%= ""+productVerId%>"
									ownerId="<%= ""+ownerId%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							
							<logic:present name="AssociatedBinderDocumentList" scope="request">
					           <table width="100%">
					           <logic:iterate id="AssociatedBinderDocumentList" name="AssociatedBinderDocumentList" scope="request">
									<bean:define id='versionId' name="AssociatedBinderDocumentList" property="versionId"/>
									<bean:define id='documentId' name="AssociatedBinderDocumentList" property="documentId"/>
									<bean:define id='documentName' name="AssociatedBinderDocumentList" property="documentName"/>
									
										<tr>
											<td class="SearchResult">									
									<a href="/EditDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>&answer(Object::Product::Document::Definition::DocId)=<%= documentId%>&answer(Object::Product::Document::Definition::VerId)=<%= versionId%>">
										<%= documentName %>
									</a>
											</td>
										</tr>
								</logic:iterate>
								</table>
							</logic:present>
						</td>
				   		
				   		<td class="SearchResult">
			   			
			   			<dmshtml:getAssociatedDocumentList nameInSession="AssociatedIssuanceDocumentList"
			   						documentType="<%=new String[]{"ISSUANCE"}%>"
									productId="<%= ""+productId%>"
									productVersionId="<%= ""+productVerId%>"
									ownerId="<%= ""+ownerId%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							
							<logic:present name="AssociatedIssuanceDocumentList" scope="request">
								<table width="100%">
					           <logic:iterate id="AssociatedIssuanceDocumentList" name="AssociatedIssuanceDocumentList" scope="request">
									<bean:define id='versionId' name="AssociatedIssuanceDocumentList" property="versionId"/>
									<bean:define id='documentId' name="AssociatedIssuanceDocumentList" property="documentId"/>
									<bean:define id='documentName' name="AssociatedIssuanceDocumentList" property="documentName"/>
									
										<tr>
											<td class="SearchResult">									
									<a href="/EditDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>&answer(Object::Product::Document::Definition::DocId)=<%= documentId%>&answer(Object::Product::Document::Definition::VerId)=<%= versionId%>">
										<%= documentName %>
									</a>
											</td>
										</tr>
								</logic:iterate>
								</table>
							</logic:present>
						</td>
				   		
				   		<td class="SearchResult">
			   			
			   			<dmshtml:getAssociatedDocumentList nameInSession="AssociatedApplicationDocumentList"
			   						documentType="<%=new String[]{"APPLICATION"}%>"
									productId="<%= ""+productId%>"
									productVersionId="<%= ""+productVerId%>"
									ownerId="<%= ""+ownerId%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							
							<logic:present name="AssociatedApplicationDocumentList" scope="request">
								<table width="100%">
					           <logic:iterate id="AssociatedApplicationDocumentList" name="AssociatedApplicationDocumentList" scope="request">
									<bean:define id='versionId' name="AssociatedApplicationDocumentList" property="versionId"/>
									<bean:define id='documentId' name="AssociatedApplicationDocumentList" property="documentId"/>
									<bean:define id='documentName' name="AssociatedApplicationDocumentList" property="documentName"/>
									
										<tr>
											<td class="SearchResult">									
									<a href="/EditDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>&answer(Object::Product::Document::Definition::DocId)=<%= documentId%>&answer(Object::Product::Document::Definition::VerId)=<%= versionId%>">
										<%= documentName %>
									</a>
											</td>
										</tr>
								</logic:iterate>
								</table>
							</logic:present>
						</td>
				   		
				   </tr>
				   	
				   	<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>" value="<%=""+productStatus%>" negated="false">			   
					   <tr>
							<td height="25%" align="center" class="sectionhead"><a href="/AssociatedDocumentListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=PROPOSAL&answer(Object::Product::Document::PrdVerId)=<%=productVerId%>&answer(Object::Product::Document::PrdId)=<%=productId%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>">Add/Remove Document</a></td>
					        <td height="25%" align="center" class="sectionhead"><a href="/AssociatedDocumentListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=BINDER&answer(Object::Product::Document::PrdVerId)=<%=productVerId%>&answer(Object::Product::Document::PrdId)=<%=productId%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>">Add/Remove Document</a></td>
					        <td height="25%" align="center" class="sectionhead"><a href="/AssociatedDocumentListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=ISSUANCE&answer(Object::Product::Document::PrdVerId)=<%=productVerId%>&answer(Object::Product::Document::PrdId)=<%=productId%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>">Add/Remove Document</a></td>
							<td height="25%" align="center" class="sectionhead"><a href="/AssociatedDocumentListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=APPLICATION&answer(Object::Product::Document::PrdVerId)=<%=productVerId%>&answer(Object::Product::Document::PrdId)=<%=productId%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>">Add/Remove Document</a></td>
					   </tr>
					</dmshtml:dms_isPresent>
				   
			   	</table>
		    </td>
		</tr>
		<tr>
			<td><html:hidden property="answer(Object::Product::CurrentVerId)" value="<%=""+productVerId%>" />
			<hr size="1"  width="95%">
			</td>
		</tr>



		<tr>
			<td align="center"><dmshtml:dms_isPresent
				property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
				value="<%=""+productStatus%>" negated="false">
					<html:submit value="Save" property="answer(Save)"
					styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
					onmouseout="this.style.color='#0042B0';" />
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn"
					onmouseover="this.style.color='#FF0D25';"
					onmouseout="this.style.color='#0042B0';" />
			</dmshtml:dms_isPresent></td>
		</tr>



		<tr><td><html:hidden property="answer(Object::Product::ProductStartDate)"
			value="" styleId="ProductStartDate" />
		<html:hidden property="answer(Object::Product::ProductEndDate)"
			value="" styleId="ProductEndDate" /></td></tr>

		<bean:define id="productid" name='AddProduct'
			property='answer(Object::Product::ProductId)' />
		<tr><td><html:hidden property="answer(Object::Product::ProductId)"
			value="<%=""+productid%>" /></td></tr>
		<bean:define id="productverid" name='AddProduct'
			property='answer(Object::Product::ProductVerId)' />
		<tr><td><html:hidden property="answer(Object::Product::ProductVerId)"
			value="<%=""+productverid%>" />
		<html:hidden property="answer(Object::Product::OwnerId)"
			value="<%=""+ownerId%>" />
		<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" /></td></tr>

		<%if(readonly){ %> 
		<tr><td><html:hidden property="answer(Object::Product::FamilyId)" />
		<html:hidden property="answer(Object::Product::SellIndependent)" />
		<html:hidden property="answer(Object::Product::ProductStatus)" />
		<html:hidden property="answer(Object::Product::GroupId)" />
		<html:hidden property="answer(Object::Product::Active)" /></td></tr>
		<%}%>
		<bean:define id="userName"
			property="answer(Object::UserDetail::userName)" name="LoginPage"
			scope="session" />
		<tr><td><html:hidden property="answer(Object::Product::UpdatedBy)"
			value="<%=""+userName%>" />
		<!--  start need to be removed -->
		<html:hidden property="answer(Object::Product::CreatedBy)"
			value="<%=""+userName%>" />
		<!--  end need to be removed -->
		<html:hidden property="answer(Object::Product::dbName)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' /></td></tr>

</table>
</html:form>
</body>
<SCRIPT type="text/javascript">
<!--
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

//-->
</SCRIPT>



