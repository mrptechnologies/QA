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
<script type="text/javascript" src="../Scripts/JScripts/CreateQuote.js"></SCRIPT>

<html:form action="/NewHealthinsQuoteAction.do" styleId="frm" onsubmit="return validateFields(this);">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="fname" property="answer(Object::UserDetail::UserFirstName)" name="LoginPage" scope="session"/>
<bean:define id="lname" property="answer(Object::UserDetail::UserLastName)" name="LoginPage" scope="session"/>

<%String state=""; %>
<bean:define id="State" property="answer(State)" name="AddParentQuote" scope="request"/>
<% state = ""+State; 
if(state.equals("")){%>
<bean:define id="State" property="answer(Object::Quote::State)" name="AddParentQuote" scope="request"/>
<%} %>


<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)"/>
<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />

 <html:hidden  property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>

 <bean:parameter id="primaryEntityId" name="answer(Object::Quote::primaryEntityId)"/>
 

	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td >
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
<tr>
	<td>&nbsp;</td>
</tr>

<tr><td height="5"></td></tr>
<tr>
	<td class="NewSectionHead" align="center" colspan="5">CREATE NEW QUOTE</td>
</tr>

<tr><td height="5"></td></tr>
<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td class="SectionHead" align="center" colspan="5">Select Product</td>
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
				
				<logic:present name="isQuoteEffDateValid" scope="request" >
					<tr>
						<td>
							<table border="0" width="100%">
								<tr>
									<td class="Error">Please Enter a Valid Effective Date</td>
								</tr>
							</table>
						</td>
					</tr>
				
				</logic:present>

<!-- [1] Done -->


	<tr>
	<td colspan="2" >
	</td>
	<tr><td colspan="2"></td></tr>
	<tr>
		<td colspan="2">
		<table width="75%" border="0" align="center">
		<tr>
			<td>&nbsp;</td></tr>
			<%
					com.dms.ejb.data.QuestionHashMap qmapArea =   new com.dms.ejb.data.QuestionHashMap(10);				
					qmapArea.put("ownerId", ""+ownerId);
					qmapArea.put("dbname", ""+com.dms.web.util.DbUtils.getWriteDS(pageContext));
					qmapArea.put("Object::Customer::CustomerId", ""+customerId);					
					qmapArea.put("Object::Quote::AgencyId", ""+agencyIdTemp);
					
			%>

			<dmshtml:getRiskHeaderInfoByInsuredId nameInSession="arrRiskTypes" insuredId="<%=customerId.toString()%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			
			
	<tr>
			<td width="30%" align="left" class="FormLabels">
			Effective Date
			&nbsp;</td>
			<td class="sectionhead1"><html:text   property="answer(Object::Quote::QuoteStartDate)" size="30" maxlength="30" styleId="txtDate" styleClass='txtbox' onchange="return validateDate('submit');" /></td>
		</tr>
	<tr>		
	<dmshtml:dms_static_with_connector ruleName='privilage'
		property='<%=new String[]{"CREATE_QUOTE_ALLPRODUCTSTATUS"}%>' connector='or'
		negated="true">
		
			<td width="30%" align="left" class="FormLabels">
			Select Product Status
			&nbsp;</td>
			<td class="sectionhead1">
				<html:select property="answer(Object::Quote::ProductStatus)" styleClass='txtbox' onchange="return ProductBrowse()">
					<html:option value ='RELEASED'>Released</html:option>
					<html:option value ='DEVELOPMENT'>Development</html:option>
					<html:option value ='QA'>QA</html:option>
				</html:select>
			</td>
	</dmshtml:dms_static_with_connector>
	<dmshtml:dms_static_with_connector ruleName='privilage'
		property='<%=new String[]{"CREATE_QUOTE_RESTRICTED_RELEAS"}%>' connector='or'
		negated="true">
		
			<td width="30%" align="left" class="FormLabels">
			Select Product Status
			&nbsp;</td>
			<td class="sectionhead1">
				<html:select property="answer(Object::Quote::ProductStatus)"  styleClass='txtbox' onchange="return ProductBrowse()">
					<html:option value ='RELEASED'>Released</html:option>
					<html:option value ='RESTRICTED'>Restricted</html:option>
				</html:select>
			</td>
	</dmshtml:dms_static_with_connector>
		</tr>
	



	

		

	<bean:define id="riskId" name ="AddParentQuote" property="answer(Object::Plan::PLResRiskPropertyId)"/>

<bean:define id="arrRiskInsuranceType" name="RISK_INSURANCE_TYPES" type="java.util.ArrayList"/>
			<tr>
		<td width="30%" align="left" class="FormLabels">
			Select Type Of Insurance
			&nbsp;</td>
			<td class="sectionhead1">
			<span id="insTypeSelection">
				<html:select property="answer(Object::Risk::InsuranceTypeId)" styleClass='txtbox' styleId="InsuranceType" onchange="return ProductBrowse()">
					<html:option value ='0'>Select</html:option>

				<%for(int i=0;i<arrRiskInsuranceType.size();i++) {
					com.dms.ejb.data.QuestionHashMap riskInsuranceTypeMap=(com.dms.ejb.data.QuestionHashMap)arrRiskInsuranceType.get(i);	
					%>
				
					<html:option value ='<%=riskInsuranceTypeMap.getString("Object::Risk::InsuranceTypeId")%>'>
					<%=riskInsuranceTypeMap.getString("Object::Risk::InsuranceTypeName")%></html:option>
					<%}%>
				</html:select>
				</span>
		</td> </tr>

<bean:define id="arrInsuranceComp" name="INSURANCE_COMPANIES" type="java.util.ArrayList"/>
		<tr>
		<td width="30%" align="left" class="FormLabels">
			 Select Company
			&nbsp;</td>
			<td class="sectionhead1">
			<span id="insCompSelection">
				<html:select property="answer(Object::InsuranceType::CompanyId)" styleClass='txtbox' styleId="Company" onchange="return ProductBrowse()">
					<html:option value ='0'>Select</html:option>

				<%for(int i=0;i<arrInsuranceComp.size();i++) {
					com.dms.ejb.data.QuestionHashMap insuranceCompMap=(com.dms.ejb.data.QuestionHashMap)arrInsuranceComp.get(i);	
					%>
				
					<html:option value ='<%=insuranceCompMap.getString("Object::InsuranceType::CompanyId")%>'>
					<%=insuranceCompMap.getString("Object::InsuranceType::CompanyName")%></html:option>
					<%}%>
				</html:select>
				</span>
		</td> </tr>

			<tr>



			<td class="FormLabels" align="left" width="30%">Select Plan**</td>
			<td class="links">	
			
				<bean:define id="arrProductGroups" name="PRODUCT_GROUPS" type="java.util.ArrayList"/>
				<span id="insPrdSelection">
				<html:select property="answer(Object::Quote::ProductGroupVerId)" styleClass='txtbox' styleId="selectGroup" onchange="return ProductBrowse()">
					<html:option value ='0'>Select</html:option>

				<%for(int i=0;i<arrProductGroups.size();i++) {
					com.dms.ejb.data.QuestionHashMap productMap=(com.dms.ejb.data.QuestionHashMap)arrProductGroups.get(i);	
					%>
				
					<html:option value ='<%=productMap.getString("Object::ProductGroup::ProductGroupVerId")%>'>
					<%=productMap.getString("Object::ProductGroup::GroupName")%></html:option>
					<%}%>
				</html:select>
				</span>
			
			</td></tr>
			
			<bean:define id="arrPolicyTerms" name="PRODUCT_TERMS" type="java.util.ArrayList"/>
		<tr>
		<td width="30%" align="left" class="FormLabels">
			 Select Policy Term
			&nbsp;</td>
			<td class="sectionhead1">
			<span id="insPrdTermSelection">
				<!--select name="answer(Object::Plan::TermInMonths)" Id="selectTerm" >
					<option value ='0'>Select</option>

				<%for(int i=0;i<arrPolicyTerms.size();i++) {
					com.dms.ejb.data.QuestionHashMap termMap=(com.dms.ejb.data.QuestionHashMap)arrPolicyTerms.get(i);	
					String period=termMap.getString("Object::Plan::TermInMonths");
					String selected=""; 
						if(period.equals("6")){selected="SELECTED";}
					%>
					<option value ='<%=period%>' <%=selected%> >
					<%=period%> <%=termMap.getString("Object::Quote::PolicyPeriodType")%></option>
					<%}%>
				</select-->
				</span>
		</td> </tr>
				<bean:define id="ansmap" name="AddParentQuote" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
		    
			<%--<html:hidden property="answer(Object::Quote::HelthHra)" value="No" />--%>

			
			<html:hidden name="AddParentQuote" property="answer(Object::Quote::AreaNetWorkKey)" value=""/>
			

	<dmshtml:dms_static_with_connector ruleName='privilage'
		property='<%=new String[]{"CREATE_QUOTE_ALLPRODUCTSTATUS","CREATE_QUOTE_RESTRICTED_RELEAS"}%>' connector='or'
		negated="false">
		<html:hidden   property="answer(Object::Quote::ProductStatus)"  value="RELEASED" />
	</dmshtml:dms_static_with_connector>
			
		<tr><td colspan="2" >&nbsp;&nbsp;</td></tr>
		</table>
		</td></tr>
	<TR>
		<td colspan="2" align="Center">&nbsp;&nbsp;&nbsp;
			<html:hidden   property="answer(Object::Quote::QuoteType)"  value="NEW_BUSINESS" />
			
			<input type="submit" value="Select" class="sbttn" id="CreateQuoteSubmit" readonly>&nbsp;</td>
	</TR>

	</table>	
	
	</td></tr>
</table>






<SCRIPT type="text/javascript">

checkFields();


</SCRIPT>


  <html:hidden property="answer(Object::Quote::PolicyPeriodType)" value="months"/>
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

<bean:define id="QuoteNumber" name="AddParentQuote" property="answer(Object::Quote::QuoteNumber)" scope="request"/>
<html:hidden property="answer(Object::Quote::QuoteNumber)" value="<%=QuoteNumber.toString()%>" />
<html:hidden property="answer(Plan::PlanNumber)" value="1" />
<html:hidden name="AddQuote" property="answer(Object::Quote::GroupOutOfSync)" value="N"/>
<html:hidden name="AddQuote" property="answer(Object::Quote::CensusOutOfSync)" value="N"/>
<html:hidden name="AddQuote" property="answer(Object::Quote::ProductOutOfSync)" value="N"/>



<html:hidden property="answer(optionGroupId)" value=""/>
<html:hidden property="answer(Option::DefaultValue)" value="Yes"/>
<html:hidden property="answer(Object::Risk::Teritory)" value="0"/>
<html:hidden property="answer(Object::Quote::State)" value="<%=""+State%>"/>
<html:hidden property="answer(Object::Risk::RiskId)" value="5"/>
<html:hidden property="answer(ProductBrowse)" value="Yes"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<span id="hiddenElement">
</span>




</html:form>

