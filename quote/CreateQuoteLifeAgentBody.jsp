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
<script type="text/javascript">
function disableButton(frm){
var returnValue = false;
returnValue = validateFields(frm);
	if(returnValue){
		document.getElementById("CreateQuoteSubmit").disabled = true;
	}
return returnValue;
}
</script>

<html:form action="/NewHealthinsQuoteAction.do" styleId="frm" onsubmit="return disableButton(this);">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="fname" property="answer(Object::UserDetail::UserFirstName)" name="LoginPage" scope="session"/>
<bean:define id="lname" property="answer(Object::UserDetail::UserLastName)" name="LoginPage" scope="session"/>


<bean:define id="State" property="answer(State)" name="AddParentQuote" scope="request"/>
<bean:define id="RiskState" property="answer(Object::Risk::ResProperty::State)" name="AddParentQuote" scope="request"/>
<bean:define id="RiskType" property="answer(Object::Risk::ResProperty::RiskType)" name="AddParentQuote" scope="request"/>
<bean:define id="formName" property="answer(formname)" name="AddParentQuote" scope="request"/>

<bean:define id="riskId" name ="AddParentQuote" property="answer(Object::Plan::PLResRiskPropertyId)"/>
<bean:define id="insuranceTypeId" property="answer(Object::Risk::InsuranceTypeId)" name="AddParentQuote" scope="request"/>
<bean:define id="companyId" property="answer(Object::InsuranceType::CompanyId)" name="AddParentQuote" scope="request"/>
<bean:define id="productGroupVerId" property="answer(Object::ProductGroup::ProductGroupVerId)" name="AddParentQuote" scope="request"/>

<bean:define id="arrProductGroups" name="PRODUCT_GROUPS_DETAILS" type="java.util.ArrayList"/>

<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)"/>
<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />

<html:hidden  property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>

<bean:parameter id="primaryEntityId" name="answer(Object::Quote::primaryEntityId)"/>
 

	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr>
			<td >
				<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<logic:notPresent name="RISK_INURED_IN_REQUEST" scope="request">
						<tr>
							<td>
								<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
							</td>
						</tr>
					</logic:notPresent>
				</table>
			</td>
		</tr>		
		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td height="5">
			</td>
		</tr>
		<tr>
			<td class="NewSectionHead" align="center" colspan="5">BEGIN NEW ENROLLMENT</td>
		</tr>
		<tr>
			<td class="FormLabelsApplication">&nbsp;
			</td>
		</tr>
		<tr>
			<td class="FormLabelsApplication">&nbsp;
			</td>
		</tr>
	
		<tr>
			<td height="5">
			</td>
		</tr>
		
		<tr>
			<td>
				<table>
		 			<tr>
						<td class=links>
							You are applying for enrollment under a Master Policy that is effective from &nbsp;
						</td>
						<td class="InfoPageSH">
						<%
								java.util.ArrayList arrProductGroupsList = (java.util.ArrayList)arrProductGroups;
								java.util.ArrayList  arrEffDateList = (java.util.ArrayList)arrProductGroupsList.get(arrProductGroupsList.size()-1);
									com.dms.ejb.data.QuestionHashMap effDetailMap = (com.dms.ejb.data.QuestionHashMap)arrEffDateList.get(0);
							%><%=effDetailMap.getString("Object::ProductGroup::EffectiveDate")%>
						<!--
							10/1/2008 to 10/1/2009. 
						--></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="FormLabelsApplication">&nbsp;
			</td>
		</tr>
		<tr>
			<td class="links">
				You can enroll mid-term at a pro-rated premium. Please select your enrollment date.
			</td>
		</tr>
		<tr>
			<td class="FormLabelsApplication">&nbsp;
			</td>
		</tr>
		<tr>
			<td class="links">Be careful not to have a gap in coverage if you have existing expiring coverage.&nbsp;</td>
		</tr>
		<tr>
			<td class="FormLabelsApplication">&nbsp;
			</td>
	</tr>
	
	 <tr>
		<td colspan="2" >
		</td>
	</tr>
	<tr>
		<td colspan="2">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<table width="75%" border="0" align="center">
				<tr>
					<td>&nbsp;
					</td>
				</tr>
					<%
							com.dms.ejb.data.QuestionHashMap qmapArea =   new com.dms.ejb.data.QuestionHashMap(10);				
							qmapArea.put("ownerId", ""+ownerId);
							qmapArea.put("dbname", ""+com.dms.web.util.DbUtils.getWriteDS(pageContext));
							qmapArea.put("Object::Customer::CustomerId", ""+customerId);					
							qmapArea.put("Object::Quote::AgencyId", ""+agencyIdTemp);
							
					%>
		 
				 <tr>
					<td width="32%" align="left" class="FormLabels">
						Enrollment Date - Expiration Date
						&nbsp;
					</td>
					<td class="sectionhead1">
						<html:select property="answer(Object::Quote::QuoteStartDate)" styleId="txtDate" styleClass='txtbox' >
												
							<%								
								for(int index = 0; index < arrEffDateList.size(); index++) {
									effDetailMap = (com.dms.ejb.data.QuestionHashMap)arrEffDateList.get(index);
							%>
								<html:option value ='<%=effDetailMap.getString("Object::ProductGroup::EffectiveDateValue")%>'><%=effDetailMap.getString("Object::ProductGroup::EffectiveDate")%></html:option>
							<% } %>
						</html:select>
						<html:hidden property="answer(Object::Quote::QuoteEndDate)" value="10/01/2009" />
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>	
				<tr>
					<td class="FormLabels" align="left" width="30%">
						Select Plan
					</td>
					<td>						
						<span id="insPrdSelection">
							<html:select property="answer(Object::Quote::ProductGroupVerId)" styleClass='txtbox' styleId="selectGroup" >
			
								<%	arrProductGroupsList = (java.util.ArrayList)arrProductGroups;
									for(int i=0;i<(arrProductGroupsList.size()-1);i++) {
										com.dms.ejb.data.QuestionHashMap productMap=(com.dms.ejb.data.QuestionHashMap)(arrProductGroupsList.get(i));	
									%>
								
									<html:option value ='<%=productMap.getString("Object::ProductGroup::ProductGroupVerId")%>'>
									<%=productMap.getString("Object::ProductGroup::GroupName")%></html:option>
									<%}%>
							</html:select>
							</span>
							
					</td>
				</tr>	
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>	
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>	
								
				<TR>
					<td align="Center" width="30%">
						<input type="submit" value="Select" class="sbttn" id="CreateQuoteSubmit" readonly>&nbsp;
					</td>
				</TR>
			
				<tr>
					<td>
						<% String riskTypeId = ""; %>
							<dmshtml:GetRiskTypeId nameInSession="riskTypeIds" riskType="<%=""+RiskType%>" ownerId='<%=""+ownerId%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="riskTypeIds" scope="request">
									<bean:define id="riskTypeId1" name="riskTypeIds"/>
							<!-- <%riskTypeId = ""+riskTypeId1;%><%= "riskTypeId1 >> "+riskTypeId1%><%="RiskType>>"+RiskType%><%="ownerId>>"+ownerId%>  -->
								</logic:present>		
							<!--<dmshtml:getRiskInfoByInsuredId nameInSession="arrRiskTypes" insuredId="<%=customerId.toString()%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
								<logic:present name="arrRiskTypes" scope="request">
								<bean:define id="arrRiskTypes" name="arrRiskTypes" type="java.util.ArrayList"/>
			
									<%com.dms.ejb.data.QuestionHashMap riskMap=(com.dms.ejb.data.QuestionHashMap)arrRiskTypes.get(0);	 %>
					                <html:hidden property="answer(Object::Plan::PLResRiskPropertyId)" value="<%= riskMap.getString("Object::Risk::ResProperty::ResPropertyId")%>" />
								</logic:present>		
								
					
					  	--><html:hidden property="answer(Object::Quote::CompositeRate)" value="No" />
			    
						<html:hidden property="answer(Object::Quote::HelthHra)" value="No" />
	
						<html:hidden property="answer(Object::Quote::QuoteType)" value="NEW_BUSINESS"/>			
						<html:hidden name="AddParentQuote" property="answer(Object::Quote::AreaNetWorkKey)" value=""/>
						<html:hidden name="AddParentQuote" property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
	
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
						
						<html:hidden property="answer(Object::Risk::InsuranceTypeId)" value="20"/>
						<html:hidden property="answer(Object::InsuranceType::CompanyId)" value="22"/><!--
						<html:hidden property="answer(Object::Quote::ProductGroupVerId)" value="<%=productGroupVerId.toString() %>"/>
						
						--><html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
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
						<html:hidden property="answer(Object::Quote::NewQuote)" name="AddParentQuote"/>
						<html:hidden property="answer(Plan::PlanNumber)" value="1" />
						<html:hidden name="AddQuote" property="answer(Object::Quote::GroupOutOfSync)" value="N"/>
						<html:hidden name="AddQuote" property="answer(Object::Quote::CensusOutOfSync)" value="N"/>
						<html:hidden name="AddQuote" property="answer(Object::Quote::ProductOutOfSync)" value="N"/>
						
						<html:hidden property="answer(Object::Quote::CustomerState)" value="TN" />
						<html:hidden property="answer(Object::Risk::ResProperty::State)" value="<%=RiskState.toString() %>" />
						<html:hidden property="answer(Object::Plan::PLResRiskPropertyId)" value="0" />
						<html:hidden property="answer(Object::Risk::Teritory)" value="0" />
						
						<html:hidden property="answer(optionGroupId)" value=""/>
						<html:hidden property="answer(Option::DefaultValue)" value="Yes"/>
						
						
						<html:hidden property="answer(Object::Risk::RiskId)" value="<%=""+riskTypeId%>"/>
						<html:hidden property="answer(ProductBrowse)" value="Yes"/>
						
						<span id="hiddenElement">
						</span>	
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>			
	
</html:form>
