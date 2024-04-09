<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/EditAgency.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<Script type="text/javascript">
function displayMailingAddressBlock() {
 document.getElementById("MailingAddressBlock").style.display="block";
}
function hiddenMailingAddressBlock() {
 document.getElementById("MailingAddressBlock").style.display="none";
}
</Script>
<html:form action="/EditAgency">
<div class="SubjectivityPage">									
<div class="content">
<%String AgencyId="";%>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::UserName)" name="LoginPage" scope="session"/>
<bean:define id="cusId"  property="answer(Object::Customer::CustomerId)"name="AddAgency" scope="session"/>
<bean:define id="contractDateStart" property="answer(Object::Agency::StartDate)"  name="AddAgency" />
<bean:define id="contractDateEnd" property="answer(Object::Agency::EndDate)"  name="AddAgency" />
<%
	String stMonth="";
	String stDate="";
	String stYear="";
	String edMonth="";
	String edDate="";
	String edYear="";
	String arrofContractStartDate[]=null;
	String arrofContractEndDate[]=null;
	
	String contractStartDate=""+contractDateStart;
	String contractEndDate=""+contractDateEnd;
	
		 
	if(contractStartDate.contains("/")){
	  arrofContractStartDate = contractStartDate.split("/");
	  if(arrofContractStartDate.length == 3){
			 stMonth = arrofContractStartDate[0];
			 stDate = arrofContractStartDate[1];
			 stYear = arrofContractStartDate[2];
		 }
	}
	
	if(contractStartDate.contains("-")){
		arrofContractStartDate = contractStartDate.split("-");
		if(arrofContractStartDate.length == 3){
             stYear = arrofContractStartDate[0];
			 stMonth = arrofContractStartDate[1];
			 stDate = arrofContractStartDate[2];
	    }
	}		
	
	if(contractEndDate.contains("/")){
		arrofContractEndDate = contractEndDate.split("/");
		 if(arrofContractEndDate.length == 3){
			 edYear = arrofContractEndDate[0];
			 edMonth = arrofContractEndDate[1];
			 edDate = arrofContractEndDate[2];
		}
	}
	
	if(contractEndDate.contains("-")){
			arrofContractEndDate = contractEndDate.split("-");
			 if(arrofContractEndDate.length == 3){
				 edYear = arrofContractEndDate[0];
				 edMonth = arrofContractEndDate[1];
				 edDate = arrofContractEndDate[2];
			 }
	}		
	 
	
	
	
%>

<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
			<td valign="top" align="left" width="100%" colspan="2">
				<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr><td class="Subjectivityformhead" ><h2 class="left">EDIT AGENCIES </h2> </td>
					<tr><td>&nbsp;</td></tr>
				    <tr><td class="TextMatter"><bean:message key="Agency.Description"/></td></tr>
		
					<logic:present name="message" scope="request">
						<tr><td class="Error">The information is added/edited successfully.</td></tr>
					</logic:present>
					<logic:present name="msgInfo" scope="request">
					<tr>
						<td class="Error">
							<%=request.getAttribute("msgInfo")%>
						</td>
					</tr>
					</logic:present>
					<TR>
						<TD COLSPAN="1" class="Error">
							<html:errors/>
						</TD>
					</TR>
					<tr>
						<td>&nbsp;</td>
					</tr>
	
					<tr>
						<td class="links" align="left" width="1%">
							<bean:define id='AgencyId1'  name="AddAgency" property="answer(Object::Agency::AgencyIdTemp)" />
							<%AgencyId=AgencyId1.toString();%>
<%String insType = (String)session.getAttribute("InsType"); %>							
<%if(insType.equals("PC")) {%>							
							<a href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(ownerId)=<%=""+ownerId %>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(1*Customer::Equals::SearchObjectId)=<%=""+AgencyId1%>&answer(Object::Customer::PageNum)=0&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME">Insured</a>
<%} else if(insType.equals("Health")){%>							
							<a href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(ownerId)=<%=""+ownerId %>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(1*Customer::Equals::SearchObjectId)=<%=""+AgencyId1%>&answer(Object::Customer::PageNum)=0&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME">Employer Group</a>
<%} %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
							<a href="../AgentList.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&answer(1*Entity::Equals::SearchObjectType)=AGENCY&entityType=AGENT&answer(1*Entity::Equals::SearchObjectId)=<%=""+AgencyId1%>&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">Agents</a>
						
						
					<dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' 			
		connector='or' negated="true">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="../SearchActivityManagerAction2.do?TabPanelName=Quote_Panel&answer(Object::Activity::OwnerId)=<%=""+ownerId%>&answer(Object::Activity::CreatedBy)=<%=userId.toString()%>&answer(Object::Activity::PageNum)=0&answer(Object::Activity::ActivityType)=<%= "Agency Management" %>&answer(Object::Activity::ObjectType)=<%="Agency" %>&answer(Object::Activity::ObjectId)=<%=""+AgencyId1%>">Activity Log </a>
</td>
		
	</dmshtml:dms_static_with_connector> 
					</tr>

					<%java.util.ArrayList LiceArr = new java.util.ArrayList();%>

					<dmshtml:Get_LicenceDetail_ByObjectType nameInSession="LicenceDetailArr" ownerId="5" objectId="<%=AgencyId%>" objectType="AGENCY" objectTypeName="AGENCY" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
	
					<logic:present name="LicenceDetailArr" scope="request">
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td> <h3> 
							List of Appointed States :&nbsp;
							<% LiceArr= (java.util.ArrayList)request.getAttribute("LicenceDetailArr");
		
								for (int i=0; i<LiceArr.size(); i++)  {
        						 com.dms.ejb.licence.DMSLicenceDetail LicDetail=(com.dms.ejb.licence.DMSLicenceDetail) LiceArr.get(i);
	 						%>
	
							<%=LicDetail.getLicenceScope()%>
	
							<%}%></h3>
						</td>
					</tr>				
					</logic:present>	
					
					<tr><td>&nbsp;</td></tr>
					<tr><td align="center">
						<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td>
									<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2"> 
										<tr>
											<td align="left" colspan="3"><h3>AGENCY INFORMATION</h3></td>
										</tr>
										
			 							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
																connector='or' negated="true">	
										<tr>
											<td class="field" align="right" width="35%">Agency Id</td>
											<td width="2%">&nbsp;</td>
											<td class="TextMatter" WIDTH="63%"><%=AgencyId%></td>
										</tr>
										</dmshtml:dms_static_with_connector>
			
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="Agencies.Agencyname" />*</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text styleId="BusinessName" property="answer(Object::Agency::BusinessName)" size="50" maxlength="50" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" width="35%" align="right">Agency Name code</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left">
												<html:text property="answer(Object::Agency::AgencyCode)" size="26" maxlength="50" styleClass="txtbox"/>
											</td>
										</tr>
										
										<tr>
											<td class="field" width="35%" align="right">List Name</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left">
												<html:text property="answer(Object::Agency::ExternalSystemCode)" size="26" maxlength="50" styleClass="txtbox"/>
											</td>
										</tr>
			                            
			                            <tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.GeneralAgency" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><dmshtml:get_general_agencies nameInSession="arListgeneralagencies"  parentAgencyId="-1" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
													  <html:select styleId="GeneralAgency" property="answer(Object::Agency::ParentAgencyId)" styleClass="txtbox">
													  <html:option value ="">Select</html:option>
													  <html:option value ="0">None</html:option>
													  <logic:present name="arListgeneralagencies" scope="session">
													  <logic:iterate id="details" name="arListgeneralagencies" scope="session" >
					    							  <bean:define id='test' name="details"  property="answer(Object::Agency::AgencyIdTemp)" />
					   								  <html:option value ='<%=test.toString()%>'>
					       									<bean:write name="details" property="answer(Object::Agency::BusinessName)" />
					   								 </html:option>
													 </logic:iterate>
													 </logic:present>
													 </html:select>
											</td>
										</tr>
			
										<TR>
											<td class="field" align="right" width="35%" >
												Assigned Underwriter
											</td>
											<td width="2%">&nbsp;</td>
											<!-- -->											
											<bean:define id="ansmap" name="AddAgency" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>											
											<%																
												ansmap.put("ownerId", ""+ownerId);
												String uwNameCode = "";
											%>
											<dmshtml:execute_rules nameInSession="GETOBJECTIDBYAGENCYID"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"  formName="form::GETOBJECTIDBYAGENCYID"  answerMap="<%=ansmap%>"  processInstance="preprocess" />
											<%
												com.dms.ejb.data.QuestionHashMap qMapALLENTITIES =   new com.dms.ejb.data.QuestionHashMap(10);				
												qMapALLENTITIES.put("ownerId", ""+ownerId);
												qMapALLENTITIES.put("dbname", ""+com.dms.web.util.DbUtils.getReadDS(pageContext));
												qMapALLENTITIES.put("Object::Entity::EntityType", "UNDERWRITER");			
											%>
											<html:hidden property="answer(Object::Agency::LinkedEntityType)" value="UNDERWRITER" />
											<dmshtml:execute_rules nameInSession="GETALLENTITIESBYTYPE"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"  formName="form::GETALLUW"  answerMap="<%=qMapALLENTITIES%>"  processInstance="preprocess" />
											<logic:present name ='GETALLENTITIESBYTYPE' scope ='request'>
											<%
												if(qMapALLENTITIES.containsKey("ALLENTITIES_BYTYPE"))
												{
			                 						 java.util.ArrayList arrList=null;
			                 						 Object objList=qMapALLENTITIES.get("ALLENTITIES_BYTYPE");
			                  						 if((objList!=null) &&(objList instanceof java.util.ArrayList))
												{
											%>
											<td align="left" width="63%">
											<bean:define id="assignedUWID" property="answer(Object::Agency::LinkedEntityId)" name="AddAgency"/>												
												<html:select property="answer(Object::Agency::LinkedEntityId)" styleClass="txtbox">
												<html:option value ="">Select</html:option>
												<%
			                  					    arrList=(java.util.ArrayList)objList;
								 					 for (int i=0; i<arrList.size(); i++)  
													{ 
													   com.dms.ejb.data.QuestionHashMap arrEntitiesQMap=(com.dms.ejb.data.QuestionHashMap)arrList.get(i);
												%>
												<html:option value ='<%=arrEntitiesQMap.getString("ENTITY_ID")%>'>
													<%=arrEntitiesQMap.getString("ENTITY_FNAME") + " " + arrEntitiesQMap.getString("ENTITY_LNAME")%>
												</html:option>												
												<%
												if((""+assignedUWID).equals(arrEntitiesQMap.getString("ENTITY_ID"))){
													uwNameCode = arrEntitiesQMap.getString("ENTITY_NUM");
												}
													}
												%>
												</html:select>
											</td>
											<%
														}
												}
											%>
											</logic:present>
											<!-- -->
										</TR>
										<logic:present name ='GETALLENTITIESBYTYPE' scope ='request'>
										<tr>
											<td class="field" width="35%" align="right">Underwriter Name code</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left">
												<font color="black"><%=""+uwNameCode.replaceAll("<","&lt;").replaceAll(">","&gt;") %></font>
											</td>
										</tr>
										</logic:present>
			 							<tr>
											<td class="field" align="right" width="35%">Agency Commission</td>
											<td width="2%">&nbsp;</td>
											<td class="FormLabels" width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::AgencyCommission)" name="AddAgency"   size="6" maxlength="6" styleClass="txtbox" styleId="AgencyCommission"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%">Tax Id</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::TaxId)" size="20" maxlength="20" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%">State License #</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::StateLicenseNumber)" size="20" maxlength="20" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%">License #</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::LicenseNumber)" size="20" maxlength="20" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%">Licensee Name</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::LicenseeName)" size="20" maxlength="30" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%">Status</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left">
												<html:select property="answer(Object::Agency::Status)" styleClass="txtbox">
													<html:option value ="">Select</html:option>
													<html:option value="A">Account Current</html:option>
													<html:option value="N1">NO BUSINESS - BAD PAY</html:option>
													<html:option value="N2">NO BUSINESS - INACTIVE</html:option>
													<html:option value="N3">NO BUSINESS - OUT OF BUSINESS</html:option>
													<html:option value="N4">NO BUSINESS - CROSS-REFERENCED</html:option>
													<html:option value="N5">NO BUSINESS - INSUFFICIENT VOLUME</html:option>
													<html:option value="C1">CASH WITH APP</html:option>
													<html:option value="C2">FAXED AGREEMENT- ACQUIRED</html:option>
													<html:option value="H">HOLD - SEE ACCOUNTING</html:option>
													<html:option value="P">PENDING - NEED BRKR AGREE. TO BIND</html:option>
													<html:option value="R">RENEWALS ONLY - NO NEW BUSINESS</html:option>
													<html:option value="R1">RENEWALS ONLY - CASH WITH APP</html:option>
													<html:option value="X2">AcelaRate</html:option>													
												</html:select>
											</td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%">Contract Start Date</td>
											<td width="2%">&nbsp;</td>
											<td class="links" width="63%" align="left">
												<html:text  property ="answer(Month)" value="<%=""+stMonth%>" size="2" maxlength="2" styleClass="txtbox" styleId="StartMonth" onkeyup="if(this.value.length==2) {document.forms[0].StartDate.focus()}" />&nbsp;
												<html:text  property ="answer(Date)"  value="<%=""+stDate%>" size="2" maxlength="2" styleClass="txtbox" styleId="StartDate" onkeyup="if(this.value.length==2) {document.forms[0].StartYear.focus()}" />&nbsp;
												<html:text  property ="answer(Year)" value="<%=""+stYear%>" size="4" maxlength="4" styleClass="txtbox" styleId="StartYear" />&nbsp;(MM/DD/YYYY)
											</td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%">Contract End Date</td>
											<td width="2%">&nbsp;</td>
											<td class="links" width="63%" align="left">
												<html:text  property ="answer(Month)" value="<%=""+edMonth%>"  size="2" maxlength="2" styleClass="txtbox" styleId="EndMonth" onkeyup="if(this.value.length==2) {document.forms[0].EndDate.focus()}" />&nbsp;
												<html:text  property ="answer(Date)" value="<%=""+edDate%>" size="2" maxlength="2" styleClass="txtbox" styleId="EndDate" onkeyup="if(this.value.length==2) {document.forms[0].EndYear.focus()}" />&nbsp;
												<html:text  property ="answer(Year)" value="<%=""+edYear%>"  size="4" maxlength="4" styleClass="txtbox" styleId="EndYear" />&nbsp;(MM/DD/YYYY)
											</td>
										</tr>
										
										<!--  
										<tr>
											<td class="FormLabels" align="left" width="35%">&nbsp;&nbsp;Dcco1</td>
											<td><html:text property="answer(Object::AgencyAdditional::Dcco1)" size="23" maxlength="23" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="FormLabels" align="left" width="35%">&nbsp;&nbsp;Dcco2</td>
											<td><html:text property="answer(Object::AgencyAdditional::Dcco2)" size="23" maxlength="23" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="FormLabels" align="left" width="35%">&nbsp;&nbsp;Dcco3</td>
											<td><html:text property="answer(Object::AgencyAdditional::Dcco3)" size="23" maxlength="23" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="FormLabels" align="left" width="35%">&nbsp;&nbsp;Prioity Code1</td>
											<td><html:text property="answer(Object::AgencyAdditional::BRPrioity1)" size="10" maxlength="10" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="FormLabels" align="left" width="35%">&nbsp;&nbsp;Prioity Code2</td>
											<td><html:text property="answer(Object::AgencyAdditional::BRPrioity2)" size="10" maxlength="10" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="FormLabels" align="left" width="35%">&nbsp;&nbsp;Prioity Code3</td>
											<td><html:text property="answer(Object::AgencyAdditional::BRPrioity3)" size="10" maxlength="10" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="FormLabels" align="left" width="35%">&nbsp;&nbsp;Prioity Code4</td>
											<td><html:text property="answer(Object::AgencyAdditional::BRPrioity4)" size="10" maxlength="10" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="FormLabels" align="left" width="35%">&nbsp;&nbsp;Prioity Code5</td>
											<td><html:text property="answer(Object::AgencyAdditional::BRPrioity5)" size="10" maxlength="10" styleClass="txtbox"/></td>
										</tr>-->
										
										<tr>
											<td height="8px"></td>
										</tr>
										<tr>
											<td  align="left" colspan="3"><h3>PRINCIPAL BUSINESS ADDRESS</h3></td>
										</tr>
										<tr>
											<td height="8px"></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%">Address 1</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address1)"  styleId="Address1" size="30" maxlength="50"/></td>
										</tr>
			
										<tr>
											<td class="field" align="right" width="35%">Address 2</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address2)" styleId="Address2" size="30" maxlength="50"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.city" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::City)" size="30" maxlength="30" styleClass="txtbox" styleId="City"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.state" />*</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
													  <html:select property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::State)" styleClass="txtbox" styleId="State">
													  <html:option value ="">Select</html:option>
			        								  <logic:present name="arStates" scope="request">
			           								  <logic:iterate id="details" name="arStates" scope="request" >
					    								<bean:define id='test' name="details"  property="typeDesc" />
					    								<html:option value ='<%=test.toString()%>'>
					       									<bean:write name="details" property="dmsType" />
					    								</html:option>
													  </logic:iterate>
													  </logic:present>
													  </html:select>
											</td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.zip" />*</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Zip)" size="10" maxlength="10" styleClass="txtbox" styleId="Zip"/>
												<!--Zipcode lookup start -->
												<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddAgency&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" ><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County." ></a>
											</td>
												<!--  end-->
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.country" /></td>
											<td width="2%">&nbsp;</td>
											<td  width="63%" align="left">&nbsp;
												<dmshtml:dms_radio property = "answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="US" /><bean:message key="GeneralAgency.us"/>&nbsp;&nbsp;&nbsp;
												<dmshtml:dms_radio property ="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="Canada" /><bean:message key="GeneralAgency.canada"/>
											</td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.phone" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::WorkPhone)" size="30" maxlength="30" styleId="BusinessPhoneNum" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.fax" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Fax)" size="30" maxlength="30" styleId="BusinessFaxNum" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%">Web Site</td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Url)" size="30" maxlength="30" styleId="BusinessContactUrl" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td height="8px"></td>
										</tr>
										<tr>
							   <td  align="left" colspan="3"><h3>MAILING ADDRESS </h3> </td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td class="field" align="right" width="35%">
									Is Mailing Address same as Business?
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
								   	 <html:radio  property ="answer(Object::Agency::MailingAddressSameAsBusiness)" value="Y" styleId="MailingAddressSameAsBusiness_Y" onclick="hiddenMailingAddressBlock()" />Yes
									 <html:radio  property ="answer(Object::Agency::MailingAddressSameAsBusiness)" value="N" styleId="MailingAddressSameAsBusiness_N" onclick="displayMailingAddressBlock()" />No&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
							<td colspan="3">
							<div id="MailingAddressBlock" style="display:none;">
                             <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
                             <tr>
                             <td class="field" align="right" width="35%">
								&nbsp;&nbsp;Mailing Address 1
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
								   <html:text  property="answer(Object::Agency::MailingAddress1)" styleId="MailingAddress1" styleClass="txtbox" maxlength="50" size="30"  />
								</td>
								</tr>
								<tr>
								<td class="field" align="right" width="35%">
									&nbsp;&nbsp;Mailing Address 2
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"> 
									<html:text   property="answer(Object::Agency::MailingAddress2)" styleId="MailingAddress2" styleClass="txtbox" maxlength="50" size="30"/>
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">
									Mailing Address 3
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									<html:text  property="answer(Object::Agency::MailingAddress3)" styleId="MailingAddress3" styleClass="txtbox" maxlength="50" size="30"  />
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">
									Mailing Address 4
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									<html:text  property="answer(Object::Agency::MailingAddress4)" styleId="MailingAddress4" styleClass="txtbox" maxlength="50" size="30" />
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">
									Mailing Address 5
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									<html:text  property="answer(Object::Agency::MailingAddress5)" styleId="MailingAddress5" styleClass="txtbox" maxlength="50" size="30"  />
								</td>
							</tr>
							   </table>
								</div>
							</td>
							</tr>
						    <tr><td>&nbsp;</td></tr>
										<tr>
											<td  align="left" colspan="3"><h3>PERSONAL INFORMATION FOR AGENCY ADMINISTRATIVE USER</h3></td>
										</tr>
										<tr>
											<td height="8px"></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.firstname" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::firstname)" styleId="FirstName" size="30" maxlength="30" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.lastname" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::lastname)" styleId="LastName" size="30" maxlength="30" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.middlename" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::middlename)" size="5" maxlength="5" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.jobtitle" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::jobtitle)" size="50" maxlength="50" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.jobfunction" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::jobfunction)" size="50" maxlength="50" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.phone" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::HomePhone)" size="30" maxlength="30" styleId="HomePhoneNum" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.fax" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::Fax)" size="30" maxlength="30" styleId="HomeFaxNum" styleClass="txtbox"/></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.email" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::EMailAddress)" size="40" maxlength="90" styleId="contactEmail" styleClass="txtbox"/></td>
										</tr>
			
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BRANCH_INFORMATION_AVALIBLE"}%>' connector='or' negated="true">
											<tr><td>&nbsp;</td></tr>
											
											<tr><td colspan="3" align="left" ><h3>BRANCH INFORMATION</h3></td></tr>
											
											<tr><td>&nbsp;</td></tr>
											
											<tr>
												<td class="field" align="right" width="35%">Branch Name*</td>
												<td width="2%">&nbsp;</td>
												<td class="links" style="Class:txtbox" width="63%" align="left">&nbsp;
													<html:select property="answer(Object::Agency::BranchName)" styleClass="txtbox" styleId="BranchName">
														<html:option value ="">Select</html:option>
														<html:option value ="Toronto">Toronto</html:option>
														<html:option value ="Calgary">Calgary</html:option>							
														<html:option value ="Puerto Rico">Puerto Rico</html:option>
														<html:option value ="Boston">Boston</html:option>
														<html:option value ="Miami">Miami</html:option>
														<html:option value ="New York">New York</html:option>
														<html:option value ="San Francisco">San Francisco</html:option>
														<html:option value ="Denver">Denver</html:option>
														<html:option value ="Los Angeles">Los Angeles</html:option>	
											            <html:option value ="Houston">Houston</html:option>		
											            <html:option value ="Chicago">Chicago</html:option>																									
													</html:select>
												</td>
											</tr> 
										</dmshtml:dms_static_with_connector>
										
										<tr><td>&nbsp;</td></tr>
			
										<tr>
											<td  align="left" colspan="3"><h3>REMARKS/COMMENTS</h3></td>
										</tr>
										<tr>
											<td height="8px"></td>
										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.comments" /></td>
											<td width="2%">&nbsp;</td>
											<td width="63%" align="left"><dmshtml:dms_textarea property="answer(Object::AgencyAdditional::comments)" rows="3" cols="30"/></td>
										</tr>
										<tr>
											<td height="8px"></td>
										</tr>
										<tr>
											<td  align="left" colspan="3"><h3>USER ACCOUNT</h3></td>
										</tr>
										<tr>
											<td height="8px"></td>
										</tr>
			
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.username" /></td>
					                         <td width="2%">&nbsp;</td>
											<td class="FormLabels" width="63%" align="left"><bean:define id="UserName" name='AddAgency' property='answer(Object::UserDetail::userName)'/>
												<dmshtml:dms_is_string_empty ruleName="areStringsSame" property="<%=UserName.toString()%>" > 
													<bean:write  name='AddAgency' property='answer(Object::UserDetail::userName)' />&nbsp;&nbsp;<A HREF="../ChangePasswordForAgencyUsers.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&userId=<bean:write  name='AddAgency' property='answer(Object::UserDetail::userName)' />" onClick="return ZipCodePopup(this, 'ChangeAgencyPassword');"><IMG SRC="../Images/GoButton.jpg" WIDTH="30" HEIGHT="16" BORDER="0" ALT=""></A>
												</dmshtml:dms_is_string_empty>
												<dmshtml:dms_is_string_empty ruleName="areStringsSame" property="<%=UserName.toString()%>" negated="true"> 
													<html:text property="answer(Object::UserDetail::userName)" size="15" maxlength="15" styleClass="txtbox"/>
											</td>
										</tr>	
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.password" /></td>
											<td width="2%">&nbsp;</td>

											<td width="63%" align="left">
												<input type="password" name="answer(Object::UserDetail::passWord)" maxlength="15" size="15" class="txtbox" autocomplete="off" value="">
											</td>

										</tr>
										<tr>
											<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.confirmpassword" /></td>
											<td width="2%">&nbsp;</td>

											<td width="63%" align="left">
												<input type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="15" size="15" class="txtbox" autocomplete="off" value="">
											</td>

										</tr>
											</dmshtml:dms_is_string_empty>
										
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 
													connector='or' negated="true">	
										<tr>
											<td class="field" align="right"  width="35%">Active</td>
											<td width="2%">&nbsp;</td>
											<td class="TextMatter" width="63%" align="left">
												<html:select property="answer(Object::Agency::Active)" name='AddAgency' styleClass="txtbox">
													 <html:option value ='Y'>Yes</html:option>
													 <html:option value ='D'>No</html:option>
												</html:select>
											</td>
										</tr>
										</dmshtml:dms_static_with_connector>
										
									</table>
								</td>
							</tr>
				        </table>
                    </td></tr>	
				</table>
		    </td>
		</tr>

	   <tr><td colspan="2">&nbsp;</td></tr>
				<%Object readOnly1=request.getAttribute("ReadOnly"); 
					String readOnly="No";
					if(readOnly1!=null)
					{
						readOnly=(String)readOnly1;
					}
				%>
				<%if(!(readOnly.equals("Yes"))) {%>
	    <tr>
	    <td width="40%" align="right">
			<html:button value="Save" property="answer(submit)" styleClass="covbutton" onclick="return validateFields()"/>
		</td>
		<td width="60%" align="left">			
			<html:reset value="Reset" styleClass="covbutton"/>
	    </td>
	    </tr>
				<%}%>
	    <tr><td colspan="2">&nbsp;</td></tr>
	    <tr><td colspan="2">&nbsp;</td></tr>
    </table>
		
	<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>
	<html:hidden property="answer(Object::UserDetail::roleName)" value=""/>
	<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
	<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 

	<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="" />
	<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="" />
	<html:hidden property="page" value="6" />

	<html:hidden property="answer(Object::Agency::SiteId)" value="1"  />
	<html:hidden property="answer(Object::Agency::ObjectType)" value="agency"   />
		
 	<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
	<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
	<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />
    <html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />

	<html:hidden property="answer(Object::Agency::OwnerId)" value="<%=""+ownerId %>" />

	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />
    <html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
    <html:hidden property="answer(Object::UserDetail::User)" value="<%=userName.toString()%>" />
    <html:hidden property="answer(Object::Agency::UpdatedBy)" value="<%=userName.toString()%>" />
 	<html:hidden  property="answer(rule_execution_staus)" value=""/>
    <html:hidden property="formName" value="Agency::AddAgency" />
    <html:hidden property="answer(form::ForwordControl)" value="success"/>

	<!-- Code to Prevent the back Button Issue-->
	
	<%if(! AgencyId.equals("")) {%>
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=AgencyId%>"  />
	<%} %>

	<bean:define id="ParAgencyId" name="AddAgency" property="answer(Object::Agency::ParentAgencyId)"/> 
	<%if(! ParAgencyId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::ParentAgencyId)" value="<%=ParAgencyId.toString()%>"  />
	<%} %>


	<!-- Passing Agency Address ID -->
	<bean:define id="AgencyPrimaryAddressId" name="AddAgency" property="answer(Object::Agency::PrimaryAddressId)"/> 

	<%if(AgencyPrimaryAddressId==null) {%>
	<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="0"  />
	<%} else if(! AgencyPrimaryAddressId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="<%=AgencyPrimaryAddressId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="0"  />
	<%}%>
	<!-- Passing Agency BUSINESS Address ID -->
	<bean:define id="AgencyBusinessAddressId" name="AddAgency" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)"/> 

	<%if(AgencyBusinessAddressId==null) {%>
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
	<%} else if(! AgencyBusinessAddressId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="<%=AgencyBusinessAddressId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
	<%}%>

	<!-- Passing Agency HOME Address ID -->
	<bean:define id="AgencyHomeAddressId" name="AddAgency" property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)"/> 

	<%if(AgencyHomeAddressId==null) {%>
	<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="0"  />
	<%} else if(! AgencyHomeAddressId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="<%=AgencyHomeAddressId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="0"  />
	<%}%>



	<!-- Passing Primary Agency Contact ID -->
	<bean:define id="AgencyPrimaryContactId" name="AddAgency" property="answer(Object::Agency::PrimaryContactId)"/> 

	<%if(AgencyPrimaryContactId==null) {%>
	<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="0"  />
	<%} else if(! AgencyPrimaryContactId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="<%=AgencyPrimaryContactId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="0"  />
	<%}%>

	<!-- Passing BUSINESS Agency Contact ID -->
	<bean:define id="AgencyBusSinessContactId" name="AddAgency" property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)"/> 

	<%if(AgencyBusSinessContactId==null) {%>
	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
	<%} else if(! AgencyBusSinessContactId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="<%=AgencyBusSinessContactId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
	<%}%>
	<!-- Passing HOME Agency Contact ID -->
	<bean:define id="AgencyHomeContactId" name="AddAgency" property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)"/> 

	<%if(AgencyHomeContactId==null) {%>
	<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
	<%} else if(! AgencyHomeContactId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="<%=AgencyHomeContactId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
	<%}%>
	<html:hidden property="answer(Object::Agency::User)" value="<%=userName.toString()%>" />
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::County)"  styleId="County"/>
	<html:hidden property="answer(Object::AgencyAdditional::Dcco1)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::Dcco2)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::Dcco3)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::BRPrioity1)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::BRPrioity2)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::BRPrioity3)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::BRPrioity4)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::BRPrioity5)" value=""/>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=""+ownerId%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=""+ownerId%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Agency"%>"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Agency Management"%>"/>
	<html:hidden property="answer(Object::Activity::ObjectId)" value="<%=""+AgencyId1%>"/>
	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+cusId%>" />
	<html:hidden property="answer(Object::Agency::StartDate)"  styleId="contractDateStart"/>
	<html:hidden property="answer(Object::Agency::EndDate)"  styleId="contractDateEnd"/>
	</div>
	</div>

 </html:form>

<SCRIPT type="text/JavaScript">
if(document.getElementById("MailingAddressSameAsBusiness_N").checked==true){
 document.getElementById("MailingAddressBlock").style.display="block";
 }
 </Script>