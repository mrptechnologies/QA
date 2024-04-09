<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript">
<!--
 function y2k(number) { return (number < 1000) ? number + 1900 : number; }
function storeDateValues()
{
var formElement=document.forms[0]; 
if((formElement.prdmm.value!="")&&(formElement.prddd.value!="")&&(formElement.prdyy.value!="")) {
formElement.ProductRelaseDate.value=formElement.prdmm.value+"/"+formElement.prddd.value+"/"+formElement.prdyy.value;
}

if((formElement.psdmm.value!="")&&(formElement.psddd.value!="")&&(formElement.psdyy.value!="")) {
formElement.ProductStartDate.value=formElement.psdmm.value+"/"+formElement.psddd.value+"/"+formElement.psdyy.value;
}

if((formElement.pedmm.value!="")&&(formElement.peddd.value!="")&&(formElement.pedyy.value!="")) {
formElement.ProductEndDate.value=formElement.pedmm.value+"/"+formElement.peddd.value+"/"+formElement.pedyy.value;
}

if((formElement.verStatus.value!="") && (formElement.verStatus.value=="Create Version"))
{
if((formElement.versionNumber.value!="") && (formElement.versionNumber.value <= formElement.prevVersionNum.value))
{
alert("Version Number has to be greater than "+formElement.prevVersionNum.value);
return false;
}

if((formElement.desc.value!="") && (formElement.desc.value == formElement.prevVersionDesc.value))
{
alert("Please enter another description ");
return false;
}
}

var startdate = new Date(formElement.psdyy.value-0,formElement.psdmm.value-1,formElement.psddd.value-0);
var enddate = new Date(formElement.pedyy.value-0,formElement.pedmm.value-1,formElement.peddd.value-0);
var reldate=new Date(formElement.prdyy.value-0,formElement.prdmm.value-1,formElement.prddd.value-0);

	starttime = Date.UTC(y2k(startdate.getYear()),startdate.getMonth(),startdate.getDate(),0,0,0);
	endtime = Date.UTC(y2k(enddate.getYear()),enddate.getMonth(),enddate.getDate(),0,0,0);
	reltime=Date.UTC(y2k(reldate.getYear()),reldate.getMonth(),reldate.getDate(),0,0,0);

     if (starttime <= reltime & reltime <= endtime ) {
    return true
    }
    else {
        alert('Release Date should be between start date and end date');
        return false;
    }

return true;
}

//-->
</SCRIPT>
<body leftmargin="0" rightmargin="0" topmargin="0" onLoad="return popDateFields()">
<html:form action="/SaveProductVersion" onsubmit="return storeDateValues()">

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	
	<bean:define id="parentProductStatus" name='AddProduct' property='answer(Object::Product::ProductStatus)'  type="java.lang.String" />
	<bean:define id="productStatus" name='AddProduct' property='answer(Object::ProductVer::ProductVerStatus)' />
	<% 
		boolean readonly = false; 
	%>
	<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
		value="<%=""+productStatus%>" negated="true">
		<% readonly = true;%>
	</dmshtml:dms_isPresent>
	
	<tr>
		<td><html:hidden property="answer(dbname)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
			<html:hidden property="versionNum" value="1.0" />
		</td>
	</tr>
	
	<tr>
		<td>
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
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
					<td class="NewSectionHead" align="center">PRODUCT VERSION SUMMARY</td>
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
					property="answer(Object::ProductVer::ProductVerId)"
					name="AddProduct" scope="request" />

				<tr>
					<td>
					<hr size="1" noshade>
					</td>
				</tr>
				
				<tr>
					<td align="center">

						<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td align="center" class="sectionhead" colspan="2">&nbsp;PRODUCT VERSION DETAILS</td>
							</tr>
							
							<tr>
								<td>&nbsp;</td>
							</tr>

							<tr>
							<td class="links"><a
								href='../GetProductPolicyNum.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>'>Policy Number Details </a>&nbsp;&nbsp;&nbsp; <a
								href='../billing/PRDBillingAndPaymentDetails.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>'>Billing and Payment Details </a></td>
							</tr>
							
							<tr>
							<td class="sectionhead1" align="left">Product Ver Id</td>
							<td class="TextMatter" align="left"><html:text
								name='AddProduct' property="answer(Object::ProductVer::ProductVerId)"
								size="10" maxlength="10" styleClass="txtbox"
								readonly="<%=readonly%>" /></td>
						</tr>
							

							<tr>
								<td class="sectionhead1" align="left" WIDTH="40%">Family</td>
								<td class="TextMatter" align="left" WIDTH="40%"><dmshtml:get_product_family
									nameInSession="arProductFamily"
									ownerId="<%=Long.parseLong(""+ownerId)%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
	
									<html:select property="answer(Object::ProductVer::FamilyId)"
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
									</html:select>
								</td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left">Version Number</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::VerNumber)" size="15"
									maxlength="20" styleClass="txtbox" styleId="versionNumber" /></td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Name</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::ProductName)" size="30"
									maxlength="40" styleClass="txtbox" readonly="<%=readonly%>" />	
								</td>	
							</tr>						
						
							<tr>
								<td class="sectionhead1" align="left">Description</td>
								<td class="TextMatter" align="left"><html:textarea rows="4"
									name='AddProduct'
									property="answer(Object::ProductVer::ProductVerDesc)" cols="37" 
									styleClass="txtarea"  styleId="desc"/>
								</td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Status</td>
								<td class="TextMatter" align="left">
									<% if(parentProductStatus.equalsIgnoreCase("RELEASED")|| parentProductStatus.equalsIgnoreCase("RESTRICTED")){%>
										<html:select
											name="AddProduct"
											property="answer(Object::ProductVer::ProductVerStatus)"
											styleClass="txtbox" disabled="<%=readonly%>"  styleId="ProductVerStatus" >
											<html:option value='RELEASED'>Released</html:option>
											<html:option value='RESTRICTED'>Restricted</html:option>
											<html:option value='DEVELOPMENT'>Development</html:option>
											<html:option value='QA'>QA</html:option>
										</html:select>
									<% }else if(parentProductStatus.equalsIgnoreCase("QA")){ %>
										<html:select
											name="AddProduct"
											property="answer(Object::ProductVer::ProductVerStatus)"
											styleClass="txtbox" disabled="<%=readonly%>"  styleId="ProductVerStatus" >
											<html:option value='DEVELOPMENT'>Development</html:option>
											<html:option value='QA'>QA</html:option>
										</html:select>
									<% }else if(parentProductStatus.equalsIgnoreCase("DEVELOPMENT")){ %>
										<html:select
											name="AddProduct"
											property="answer(Object::ProductVer::ProductVerStatus)"
											styleClass="txtbox" disabled="<%=readonly%>"  styleId="ProductVerStatus" >	
											<html:option value='DEVELOPMENT'>Development</html:option>		
										</html:select>
									<% } %>
								</td>	
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Product Release Date</td>
								<td class="TextMatter" align="left"><html:text
									property="answer(Month)" size="2" maxlength="2"
									styleClass="txtbox"
									onkeyup="if(this.value.length==2) {document.forms[0].prddd.focus()}"
									styleId="prdmm" readonly="<%=readonly%>" />&nbsp; <html:text
									property="answer(Date)" size="2" maxlength="2"
									styleClass="txtbox"
									onkeyup="if(this.value.length==2) {document.forms[0].prdyy.focus()}"
									styleId="prddd" readonly="<%=readonly%>" />&nbsp; <html:text
									property="answer(Year)" size="4" maxlength="4"
									styleClass="txtbox"
									onkeyup="if(this.value.length==4) {document.forms[0].psdmm.focus()}"
									styleId="prdyy" readonly="<%=readonly%>" />&nbsp;(MM/DD/YYYY)
								</td>	
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
									styleId="psdyy" />&nbsp;(MM/DD/YYYY)
								</td>	
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
									property="answer(Object::ProductVer::ProdVerQuoteLookUpName)" size="30"
									maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />	
								</td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Plan LookUpName</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::ProdVerPlanLookUpName)" size="30"
									maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />	
								</td>	
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Rate LookUpName</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::ProdVerRateLookUpName)" size="30"
									maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />	
								</td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Ratesheet LookUpName</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::ProdVerRatesheetLookUpName)" size="30"
									maxlength="100" styleClass="txtbox" readonly="<%=readonly%>" />	
								</td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left">RulesEngine Name</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::RulesEngine)" size="30"
									maxlength="30" styleClass="txtbox" readonly="<%=readonly%>" />	
								</td>
							</tr>
							<tr>
								<td class="sectionhead1" align="left">Messaging LookUpName</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::ProdVerMessagingLookUpName)" size="30"
									maxlength="30" styleClass="txtbox" readonly="<%=readonly%>" />	
								</td>
							</tr>
							<tr>
								<td class="sectionhead1" align="left">Default BillingType</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::DefaultBillingType)" size="30"
									maxlength="30" styleClass="txtbox" readonly="true" />	
								</td>
							</tr>
							<tr>
								<td class="sectionhead1" align="left">Default PaymentMethod</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::DefaultPaymentMethod)" size="30"
									maxlength="30" styleClass="txtbox" readonly="true" />	
								</td>
							</tr>
							<tr>
								<td class="sectionhead1" align="left">Default InstallmentType</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::DefaultInstallmentType)" size="30"
									maxlength="30" styleClass="txtbox" readonly="true" />	
								</td>
							</tr>
							<tr>
								<td class="sectionhead1" align="left">Default BillingCurrency</td>
								<td class="TextMatter" align="left"><html:text
									name='AddProduct'
									property="answer(Object::ProductVer::DefaultBillingCurrency)" size="30"
									maxlength="30" styleClass="txtbox" readonly="true" />	
								</td>
							</tr>
							<tr>
								<td class="sectionhead1" align="left">Active</td>
								<td class="TextMatter" align="left"><html:select
									name='AddProduct' property="answer(Object::ProductVer::Active)"
									styleClass="txtbox" styleId="State" >
									<html:option value='Y'>Active</html:option>
									<html:option value='D'>Inactive</html:option>
									</html:select> 
								</td>
							</tr>
							
					</table>
				</td>
				</tr>

				<tr>
					<td align="center">&nbsp;</td>
				</tr>

				<tr>
					<td align="center" class="SearchResult">
						<table WIDTH="760px" ALIGN="center" BORDER="0"
							style="{border-width:1px; border-style:solid; border-color: #999999;}">

							<!-- Add/Remove Links Starts-->
							<tr>	
								<td align="center" class="sectionhead">Option VerSions</td>
								<td align="center" class="sectionhead">Available Factor Versions</td>
							</tr>
							
							<tr>
								<td align="center" class="sectionheadLink"><dmshtml:dms_isPresent
									property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
									value="<%=""+productStatus%>" negated="false">
									<a
										href="../product/LinkOptionsVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
									Option Ver</a>
									</dmshtml:dms_isPresent>
								</td>
	
								<td align="center" class="sectionheadLink"><dmshtml:dms_isPresent
									property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
									value="<%=""+productStatus%>" negated="false">
									<a
										href="../product/LinkFactorVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
									Factor Versions</a>
									</dmshtml:dms_isPresent>
								</td>	
								
								
							</tr>
							
						<!-- Add/Remove Links End -->

							<tr>
								<td class="SearchResult" valign="top">
									<table>
										<dmshtml:get_product_ver_options nameInSession="arrProdOptions"
											ownerId="<%=Long.parseLong(""+ownerId)%>"
											productVerId="<%=Long.parseLong(productVerId.toString())%>"
											dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<logic:present name="arrProdOptions" scope="request">
											<logic:iterate id="prodOptions" name="arrProdOptions"
												scope="request">
												<tr>
													<td class="SearchResult"><bean:define id='optionVerName'
														name="prodOptions" property="optionVerName" /> <bean:define
														id='optionVerNum' name="prodOptions" property="optionVerNum" />
														<bean:define id='optionId' name="prodOptions"
														property="optionId" />
														<bean:define id='optionVerId' name="prodOptions"
														property="optionVerId" /> 
		<a href="/GetProductOptionsDetail.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(ProductOptions::Equals::OptionId)=<%=optionId%>&answer(ProductOptions::Equals::OptionVerId)=<%=optionVerId%>&answer(optionName)=<%=optionVerName.toString()%>"><%=optionVerName.toString()+" "+optionVerNum.toString() %></a>
								
													</td>
												</tr>
											</logic:iterate>
										</logic:present>
									</table>
								</td>

								<td class="SearchResult" valign="top">
									<table>
										<dmshtml:get_product_ver_factors nameInSession="arrProdFactors"
											ownerId="<%=Long.parseLong(""+ownerId)%>"
											productId="<%=Long.parseLong(productId.toString())%>"
											productVerId="<%=Long.parseLong(productVerId.toString())%>"
											dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<logic:present name="arrProdFactors" scope="request">
											<logic:iterate id="prodFactors" name="arrProdFactors"
												scope="request">
												  <tr> 
													 <td class="SearchResult"> <bean:define id='factorVerName'
														name="prodFactors" property="factorVerName" /> <bean:define
														id='factorVerNum' name="prodFactors"
														property="versionNumber" /> <bean:define id='factorVerId'
														name="prodFactors" property="factorVerId" />
														<bean:define id='factorId' name="prodFactors" property="factorId" />
														<bean:define id='factorVerId' name="prodFactors" property="factorVerId" />
															<A HREF="../GetFactor.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductFactors::Equals::FactorId)=<%=""+factorId%>&answer(ProductFactors::Equals::FactorVerId)=<%=""+factorVerId%>"><%=factorVerName.toString()+" "+factorVerNum.toString() %></A>
													 </td> 
												 </tr> 
											</logic:iterate>
										</logic:present>
									</table>
								</td>
								</tr>


						<!-- Add/Remove Links Starts-->
							<tr>	
								<td align="center" class="sectionheadLink"><dmshtml:dms_isPresent
									property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
									value="<%=""+productStatus%>" negated="false">
									<a
										href="../product/LinkOptionsVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
									Option Ver</a>
									</dmshtml:dms_isPresent>
								</td>	
	
								<td align="center" class="sectionheadLink"><dmshtml:dms_isPresent
									property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
									value="<%=""+productStatus%>" negated="false">
									<a
										href="../product/LinkFactorVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
									Factor Versions</a>
									</dmshtml:dms_isPresent>
								</td>	
							</tr>
						<!-- Add/Remove Links End -->
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<hr size="1" noshade width="95%">
					</td>
				</tr>

					<tr>
					<td align="center">&nbsp;</td>
				</tr>

				<tr>
					<td>
												<table WIDTH="500px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">						
							<tr>
								<td class="sectionhead" align="left">Available States</td>
								<td class="sectionhead" align="left">Available Fees</td>
								<td class="sectionhead" align="left">Available Tax</td>
								<td class="sectionhead" align="left">Available Endorsement Versions</td>
							</tr>
	
							<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
								value="<%=""+productStatus%>" negated="false">
							<tr>
								<td align="center" class="sectionheadLink"><a
	href="../product/LinkStatesToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
								State</a></td>
								<td align="center" class="sectionheadLink"><a
href="../product/LinkFeesToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
								Fees</a></td>
								<td align="center" class="sectionheadLink"><a
href="../product/LinkTaxToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
								Tax</a></td>
								<td align="center" class="sectionheadLink"><a
href="../product/LinkEndorsementToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
								Endorsement Versions</a></td>
							
							</tr>

							</dmshtml:dms_isPresent>

						<tr>

							<td class="links" align="left"><dmshtml:get_prodVer_states
								nameInSession="arrStates"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								productVerId="<%=Long.parseLong(productVerId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							<logic:present name="arrStates" scope="request">
								<logic:iterate id="states" name="arrStates" scope="request">
									<bean:define id='state' name="states" property="state" />
									<a
href="../product/LinkStateToProductVerOptionVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(Object::Product::State)=<%=state.toString()%>">
									<bean:write name="states" property="stateCode" /></a>
									<br>
								</logic:iterate>
							</logic:present></td>

	<td class="links" align="left"><dmshtml:get_prodVer_fees
								nameInSession="arrFees"
								ownerId="<%=Long.parseLong(""+ownerId)%>" productId="<%=Long.parseLong(productId.toString())%>"
								productVerId="<%=Long.parseLong(productVerId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							<logic:present name="arrFees" scope="request">
							<bean:define id="arrayFees" name="arrFees" type="java.util.ArrayList"/>
							<%
							for(int i=0; i<arrayFees.size();i++)
	{
		com.dms.ejb.data.QuestionHashMap feeMap = (com.dms.ejb.data.QuestionHashMap)arrayFees.get(i);
%>								
			<%=feeMap.getString("feeName")%>_<%=feeMap.getString("state")%>_<%=feeMap.getString("territory")%>
			<%}%>
									<br>
							</logic:present></td>


								<td class="links" align="left"><dmshtml:get_prodVer_tax
								nameInSession="arrTax"
								ownerId="<%=Long.parseLong(""+ownerId)%>" productId="<%=Long.parseLong(productId.toString())%>"
								productVerId="<%=Long.parseLong(productVerId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							<logic:present name="arrTax" scope="request">
								<bean:define id="arrayTax" name="arrTax" type="java.util.ArrayList"/>
									<%
							for(int i=0; i<arrayTax.size();i++)
	{
		com.dms.ejb.data.QuestionHashMap taxMap = (com.dms.ejb.data.QuestionHashMap)arrayTax.get(i);
%>								
			<%=taxMap.getString("taxName")%>_<%=taxMap.getString("state")%>_<%=taxMap.getString("territory")%>_<%=taxMap.getString("appliedTo")%>
			<%}%>
									<br>
							</logic:present></td>

															<td class="links" align="left"><dmshtml:get_prod_ver_endorsements
								nameInSession="arrProducts"
								productVerId="<%=Long.parseLong(productVerId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							<logic:present name="arrProducts" scope="request">
           <logic:iterate id="products" name="arrProducts" scope="request" >
									<bean:define id='endorsementVerId' name="products"  property="productVerId" />
									<bean:define id='prodId' name="products"  property="productId" />
									<a
href="../GetProductVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<%=""+prodId%>&answer(ProductVerId)=<%=endorsementVerId.toString()%>">
									<bean:write name="products" property="MProductName" />
									<bean:write name="products" property="MProductVerNumber" />
									</a>
									<br>
								</logic:iterate>
							</logic:present></td>
							</tr>

							
							<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
								value="<%=""+productStatus%>" negated="false">
								<tr>
									<td align="center" class="sectionheadLink"><a
										href="../product/LinkStatesToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
									State</a></td>
									<td align="center" class="sectionheadLink"><a
										href="../product/LinkFeesToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
									Fees</a></td>
									<td align="center" class="sectionheadLink"><a
										href="../product/LinkTaxToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
									Tax</a></td>
									<td align="center" class="sectionheadLink"><a
href="../product/LinkEndorsementToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
							Endorsement Versions</a></td>
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
				        <td class="sectionheadLink" align="center" colspan="4">Application Versions Associated to the Product Version</td>
			       </tr>      
		    	   <tr>
				        <td class="sectionhead" align="center">Risk/Quote</td>
				        <td class="sectionhead" align="center">Submission</td>
				        <td class="sectionhead" align="center">Proposal</td>
				        <td class="sectionhead" align="center">Request To Bind</td>
				        <td class="sectionhead" align="center">Binder</td>
				        <td class="sectionhead" align="center">Issuance</td>
			       </tr>
			       
				   <dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>" value="<%=""+productStatus%>" negated="false">
				       <tr>
					        <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=RISK">Add/Remove
									Application Versions</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=SUBMISSION">Add/Remove
									Application Versions</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=PROPOSAL">Add/Remove
									Application Versions</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=REQUEST_TO_BIND">Add/Remove
									Application Versions</a></td>
									  <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=BINDER">Add/Remove
									Application Versions</a></td>
									  <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=ISSUANCE">Add/Remove
									Application Versions</a></td>
					   </tr>
				   </dmshtml:dms_isPresent>
				   
				   <tr>
				   		<td align="left" class="SearchResult">

				   		<dmshtml:get_product_ver_apps_by_type nameInSession="arrApps"
											ownerId="<%=Long.parseLong(""+ownerId)%>"
											productVerId="<%=Long.parseLong(productVerId.toString())%>"
											type="RISK"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<logic:present name="arrApps" scope="request">
											<logic:iterate id="apps" name="arrApps"
												scope="request">
												  
										<bean:define id='applicationName'
														name="apps" property="applicationName" /> <bean:define
														id='applicationVerNum' name="apps"
														property="applicationVerNum" /> <bean:define id='applicationVerId'
														name="apps" property="applicationVerId" />
														<bean:define id='applicationId' name="apps" property="applicationId" />
							<A HREF="../GetApplicationVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>&answer(ApplicationVerId)=<%=applicationVerId.toString()%>">
							<%=applicationName.toString()+" "+applicationVerNum.toString() %></A>
													<br>
											</logic:iterate>
										</logic:present>
						</td>
						
				   		<td align="left" class="SearchResult">
	<dmshtml:get_product_ver_apps_by_type nameInSession="arrApps"
											ownerId="<%=Long.parseLong(""+ownerId)%>"
											productVerId="<%=Long.parseLong(productVerId.toString())%>"
											type="SUBMISSION"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<logic:present name="arrApps" scope="request">
											<logic:iterate id="apps" name="arrApps"
												scope="request">
												
										<bean:define id='applicationName'
														name="apps" property="applicationName" /> <bean:define
														id='applicationVerNum' name="apps"
														property="applicationVerNum" /> <bean:define id='applicationVerId'
														name="apps" property="applicationVerId" />
														<bean:define id='applicationId' name="apps" property="applicationId" />
							<A HREF="../GetApplicationVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>&answer(ApplicationVerId)=<%=applicationVerId.toString()%>">
							<%=applicationName.toString()+" "+applicationVerNum.toString() %></A>
												<br>
											</logic:iterate>
										</logic:present>
				   	
						</td>						
				   		
				   		<td align="left" class="SearchResult">
	<dmshtml:get_product_ver_apps_by_type nameInSession="arrApps"
											ownerId="<%=Long.parseLong(""+ownerId)%>"
											productVerId="<%=Long.parseLong(productVerId.toString())%>"
											type="PROPOSAL"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<logic:present name="arrApps" scope="request">
											<logic:iterate id="apps" name="arrApps"
												scope="request">
												 
										<bean:define id='applicationName'
														name="apps" property="applicationName" /> <bean:define
														id='applicationVerNum' name="apps"
														property="applicationVerNum" /> <bean:define id='applicationVerId'
														name="apps" property="applicationVerId" />
														<bean:define id='applicationId' name="apps" property="applicationId" />
							<A HREF="../GetApplicationVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>&answer(ApplicationVerId)=<%=applicationVerId.toString()%>">
							<%=applicationName.toString()+" "+applicationVerNum.toString() %></A>
													<br>
											</logic:iterate>
										</logic:present>						</td>
						
				   		<td align="left" class="SearchResult">
	<dmshtml:get_product_ver_apps_by_type nameInSession="arrApps"
											ownerId="<%=Long.parseLong(""+ownerId)%>"
											productVerId="<%=Long.parseLong(productVerId.toString())%>"
											type="REQUEST_TO_BIND"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<logic:present name="arrApps" scope="request">
											<logic:iterate id="apps" name="arrApps"
												scope="request">
												 
										<bean:define id='applicationName'
														name="apps" property="applicationName" /> <bean:define
														id='applicationVerNum' name="apps"
														property="applicationVerNum" /> <bean:define id='applicationVerId'
														name="apps" property="applicationVerId" />
														<bean:define id='applicationId' name="apps" property="applicationId" />
							<A HREF="../GetApplicationVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>&answer(ApplicationVerId)=<%=applicationVerId.toString()%>">
							<%=applicationName.toString()+" "+applicationVerNum.toString() %></A>
													<br>
											</logic:iterate>
										</logic:present>
						</td>		
						
						   		<td align="left" class="SearchResult">
	<dmshtml:get_product_ver_apps_by_type nameInSession="arrApps"
											ownerId="<%=Long.parseLong(""+ownerId)%>"
											productVerId="<%=Long.parseLong(productVerId.toString())%>"
											type="BINDER"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<logic:present name="arrApps" scope="request">
											<logic:iterate id="apps" name="arrApps"
												scope="request">
												
										<bean:define id='applicationName'
														name="apps" property="applicationName" /> <bean:define
														id='applicationVerNum' name="apps"
														property="applicationVerNum" /> <bean:define id='applicationVerId'
														name="apps" property="applicationVerId" />
														<bean:define id='applicationId' name="apps" property="applicationId" />
							<A HREF="../GetApplicationVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>&answer(ApplicationVerId)=<%=applicationVerId.toString()%>">
							<%=applicationName.toString()+" "+applicationVerNum.toString() %></A>
												<br>
											</logic:iterate>
										</logic:present>
						</td>		

						   		<td align="left" class="SearchResult">
	<dmshtml:get_product_ver_apps_by_type nameInSession="arrApps"
											ownerId="<%=Long.parseLong(""+ownerId)%>"
											productVerId="<%=Long.parseLong(productVerId.toString())%>"
											type="ISSUANCE"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<logic:present name="arrApps" scope="request">
											<logic:iterate id="apps" name="arrApps"
												scope="request">
											
										<bean:define id='applicationName'
														name="apps" property="applicationName" /> <bean:define
														id='applicationVerNum' name="apps"
														property="applicationVerNum" /> <bean:define id='applicationVerId'
														name="apps" property="applicationVerId" />
														<bean:define id='applicationId' name="apps" property="applicationId" />
							<A HREF="../GetApplicationVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ApplicationId)=<%=applicationId.toString()%>&answer(ApplicationVerId)=<%=applicationVerId.toString()%>">
							<%=applicationName.toString()+" "+applicationVerNum.toString() %></A>
													<br>
											</logic:iterate>
										</logic:present>
						</td>		
						
				   </tr>
 <dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>" value="<%=""+productStatus%>" negated="false">
				       <tr>
					        <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=RISK">Add/Remove
									Application Versions</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=SUBMISSION">Add/Remove
									Application Versions</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=PROPOSAL">Add/Remove
									Application Versions</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=REQUEST_TO_BIND">Add/Remove
									Application Versions</a></td>
									  <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=BINDER">Add/Remove
									Application Versions</a></td>
									  <td height="25%" align="center" class="sectionheadLink"><a
										href="../product/LinkAppVerToProductVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=productId.toString()%>&answer(Object::Product::ProductVerId)=<%=productVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(type)=ISSUANCE">Add/Remove
									Application Versions</a></td>
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
				        <td class="sectionheadLink" align="center" colspan="4">Documents Associated to the Product Version</td>
			       </tr>      
		    	   <tr>
				        <td class="sectionhead" align="center">Proposal Document</td>
				        <td class="sectionhead" align="center">Binder</td>
				        <td class="sectionhead" align="center">Issuance</td>
				        <td class="sectionhead" align="center">Application</td>
			       </tr>
			       
				   <dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>" value="<%=""+productStatus%>" negated="false">
				       <tr>
					        <td height="25%" align="center" class="sectionheadLink"><a href="/AssociatedDocumentVersionListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=PROPOSAL&answer(Object::Product::Document::PrdId)=<%=productId.toString()%>&answer(Object::Product::Document::PrdVerId)=<%=productVerId.toString()%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId.toString()%>">Add/Remove Document Version</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a href="/AssociatedDocumentVersionListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=BINDER&answer(Object::Product::Document::PrdId)=<%=productId.toString()%>&answer(Object::Product::Document::PrdVerId)=<%=productVerId.toString()%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId.toString()%>" >Add/Remove Document Version</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a href="/AssociatedDocumentVersionListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=ISSUANCE&answer(Object::Product::Document::PrdId)=<%=productId.toString()%>&answer(Object::Product::Document::PrdVerId)=<%=productVerId.toString()%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId.toString()%> ">Add/Remove Document Version</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a href="/AssociatedDocumentVersionListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=APPLICATION&answer(Object::Product::Document::PrdId)=<%=productId.toString()%>&answer(Object::Product::Document::PrdVerId)=<%=productVerId.toString()%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId.toString()%>">Add/Remove Document Version</a></td>
					   </tr>
				   </dmshtml:dms_isPresent>
				   
				   <tr>
				   		<td align="left" class="SearchResult">

				   			<dmshtml:getAssociatedDocumentList nameInSession="AssociatedProposalDocumentVersionList"
			   						documentType="<%=new String[]{"PROPOSAL"}%>"
									productId="<%= ""+productId%>"
									productVersionId="<%= ""+productVerId%>"
									ownerId="<%= ""+ownerId%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							
							<logic:present name="AssociatedProposalDocumentVersionList" scope="request">

					           <logic:iterate id="AssociatedProposalDocumentVersionList" name="AssociatedProposalDocumentVersionList" scope="request">
									<bean:define id='versionId' name="AssociatedProposalDocumentVersionList" property="versionId"/>
									<bean:define id='documentId' name="AssociatedProposalDocumentVersionList" property="documentId"/>
									<bean:define id='versionName' name="AssociatedProposalDocumentVersionList" property="versionName"/>
									
									<a href="/GetDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>&answer(Object::Product::Document::Definition::DocId)=<%= documentId%>&answer(Object::Product::Document::Definition::VerId)=<%= versionId%>">
										<%= versionName %>
									</a><br>

								</logic:iterate>
							</logic:present>
						</td>
						
				   		<td align="left" class="SearchResult">

				   			<dmshtml:getAssociatedDocumentList nameInSession="AssociatedBinderDocumentVersionList"
			   						documentType="<%=new String[]{"BINDER"}%>"
									productId="<%= ""+productId%>"
									productVersionId="<%= ""+productVerId%>"
									ownerId="<%= ""+ownerId%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							
							<logic:present name="AssociatedBinderDocumentVersionList" scope="request">

					           <logic:iterate id="AssociatedBinderDocumentVersionList" name="AssociatedBinderDocumentVersionList" scope="request">
									<bean:define id='versionId' name="AssociatedBinderDocumentVersionList" property="versionId"/>
									<bean:define id='documentId' name="AssociatedBinderDocumentVersionList" property="documentId"/>
									<bean:define id='versionName' name="AssociatedBinderDocumentVersionList" property="versionName"/>
									
									<a href="/GetDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>&answer(Object::Product::Document::Definition::DocId)=<%= documentId%>&answer(Object::Product::Document::Definition::VerId)=<%= versionId%>">
										<%= versionName %>
									</a><br>

								</logic:iterate>
							</logic:present>
						</td>						
				   		
				   		<td align="left" class="SearchResult">

				   			<dmshtml:getAssociatedDocumentList nameInSession="AssociatedIssuanceDocumentVersionList"
			   						documentType="<%=new String[]{"ISSUANCE"}%>"
									productId="<%= ""+productId%>"
									productVersionId="<%= ""+productVerId%>"
									ownerId="<%= ""+ownerId%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							
							<logic:present name="AssociatedIssuanceDocumentVersionList" scope="request">

					           <logic:iterate id="AssociatedIssuanceDocumentVersionList" name="AssociatedIssuanceDocumentVersionList" scope="request">
									<bean:define id='versionId' name="AssociatedIssuanceDocumentVersionList" property="versionId"/>
									<bean:define id='documentId' name="AssociatedIssuanceDocumentVersionList" property="documentId"/>
									<bean:define id='versionName' name="AssociatedIssuanceDocumentVersionList" property="versionName"/>
									
									<a href="/GetDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>&answer(Object::Product::Document::Definition::DocId)=<%= documentId%>&answer(Object::Product::Document::Definition::VerId)=<%= versionId%>">
										<%= versionName %>
									</a><br>

								</logic:iterate>
							</logic:present>
						</td>
						
				   		<td align="left" class="SearchResult">

				   			<dmshtml:getAssociatedDocumentList nameInSession="AssociatedApplicationDocumentVersionList"
			   						documentType="<%=new String[]{"APPLICATION"}%>"
									productId="<%= ""+productId%>"
									productVersionId="<%= ""+productVerId%>"
									ownerId="<%= ""+ownerId%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							
							<logic:present name="AssociatedApplicationDocumentVersionList" scope="request">

					           <logic:iterate id="AssociatedApplicationDocumentVersionList" name="AssociatedApplicationDocumentVersionList" scope="request">
									<bean:define id='versionId' name="AssociatedApplicationDocumentVersionList" property="versionId"/>
									<bean:define id='documentId' name="AssociatedApplicationDocumentVersionList" property="documentId"/>
									<bean:define id='versionName' name="AssociatedApplicationDocumentVersionList" property="versionName"/>
									
									<a href="/GetDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>&answer(Object::Product::Document::Definition::DocId)=<%= documentId%>&answer(Object::Product::Document::Definition::VerId)=<%= versionId%>">
										<%= versionName %>
									</a><br>

								</logic:iterate>
							</logic:present>
						</td>						
						
				   </tr>
				   <dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>" value="<%=""+productStatus%>" negated="false">
					   <tr>
					        <td height="25%" align="center" class="sectionheadLink"><a href="/AssociatedDocumentVersionListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=PROPOSAL&answer(Object::Product::Document::PrdId)=<%=productId.toString()%>&answer(Object::Product::Document::PrdVerId)=<%=productVerId.toString()%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId.toString()%>">Add/Remove Document Version</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a href="/AssociatedDocumentVersionListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=BINDER&answer(Object::Product::Document::PrdId)=<%=productId.toString()%>&answer(Object::Product::Document::PrdVerId)=<%=productVerId.toString()%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId.toString()%>" >Add/Remove Document Version</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a href="/AssociatedDocumentVersionListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=ISSUANCE&answer(Object::Product::Document::PrdId)=<%=productId.toString()%>&answer(Object::Product::Document::PrdVerId)=<%=productVerId.toString()%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId.toString()%> ">Add/Remove Document Version</a></td>
					        <td height="25%" align="center" class="sectionheadLink"><a href="/AssociatedDocumentVersionListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=APPLICATION&answer(Object::Product::Document::PrdId)=<%=productId.toString()%>&answer(Object::Product::Document::PrdVerId)=<%=productVerId.toString()%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId.toString()%>">Add/Remove Document Version</a></td>
					   </tr>
				   </dmshtml:dms_isPresent>
			   	</table>
		    </td>
		</tr>
		<tr>
			<td>
			<hr size="1" noshade width="95%">
			</td>
		</tr>

				
				<tr>
					<td align="center"><dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
						value="<%=""+productStatus%>" negated="true">
						<html:submit value="Create Version" property="answer(submit)"
							styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
							onmouseout="this.style.color='#0042B0';"  />
						</dmshtml:dms_isPresent> 					

						<html:submit value="Save" property="answer(submit)"
							styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
							onmouseout="this.style.color='#0042B0';"  />
					</td>					
				</tr>

				<tr>
					<td>	<html:hidden
						property="answer(Object::ProductVer::ProductVerReleaseDate)"
						value="" styleId="ProductRelaseDate" />
						<html:hidden
						property="answer(Object::ProductVer::ProductVerStartDate)" value=""
						styleId="ProductStartDate" />
						<html:hidden
						property="answer(Object::ProductVer::ProductVerEndDate)" value=""
						styleId="ProductEndDate" />
					</td>
				</tr>

				<bean:define id="productid" name='AddProduct'
					property='answer(Object::Product::ProductId)' />
					
				<tr>
					<td>	<html:hidden property="answer(Object::Product::ProductId)"
						value="<%=""+productid%>" />
					</td>
				</tr>
				
				<bean:define id="productverid" name='AddProduct'
					property='answer(Object::ProductVer::ProductVerId)' />
			
				<tr>	
					<td>	<html:hidden property="answer(Object::ProductVer::ProductVerId)"
						value="<%=""+productverid%>" />
						<html:hidden property="answer(Object::Product::OwnerId)"
						value="<%=""+ownerId%>" />
						<html:hidden property="answer(Object::ProductVer::VerNumber)" styleId="prevVersionNum" />
						<html:hidden property="answer(Object::ProductVer::ProductVerDesc)" styleId="prevVersionDesc" />
						<%if(readonly){ %>
						<html:hidden property="answer(Object::ProductVer::FamilyId)" />
						<!--html:hidden  property="answer(Object::Product::SellIndependent)"  /-->
						<html:hidden property="answer(Object::ProductVer::ProductVerStatus)" />
						<!--html:hidden  property="answer(Object::Product::GroupId)"  /-->
						<html:hidden property="answer(Object::ProductVer::Active)" />
						<%}%>
						<html:hidden property='answer(Object::Product::ProductStatus)' value="<%=""+parentProductStatus%>" />
					</td>
				</tr>
				<bean:define id="userName"
					property="answer(Object::UserDetail::userName)" name="LoginPage"
					scope="session" />
				<tr>
					<td><html:hidden property="answer(Object::Product::UpdatedBy)"
							value="<%=""+userName%>" />
						<!--  start need to be removed -->
						<html:hidden property="answer(Object::Product::CreatedBy)"
							value="<%=""+userName%>" />
						<!--  end need to be removed -->
						<html:hidden property="answer(Object::Product::dbName)"
							value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
					</td>
				</tr>				
			</table>
		<!-- /td>
	</tr>
</table -->			
</html:form>
</body>
<SCRIPT type="text/javascript">
	var formElement=document.forms[0];
	
	var vPrdRelDate="<bean:write name='AddProduct' property='answer(Object::ProductVer::ProductVerReleaseDate)' />";
	var vPrdstrartDate="<bean:write name='AddProduct' property='answer(Object::ProductVer::ProductVerStartDate)' />";
	var vPrdendDate="<bean:write name='AddProduct' property='answer(Object::ProductVer::ProductVerEndDate)' />";
		
	if(vPrdRelDate!=""){
		formElement.prdmm.value = vPrdRelDate.substring(0,2);
		formElement.prddd.value = vPrdRelDate.substring(3,5);
		formElement.prdyy.value = vPrdRelDate.substring(6,10);
	}
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
 </SCRIPT>