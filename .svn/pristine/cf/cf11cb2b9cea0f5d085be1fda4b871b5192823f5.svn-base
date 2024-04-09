<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddResPropertyRisk.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/TerritoryLookup.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></SCRIPT>


<html:hidden property="answer(dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="insuredAdd1" property="answer(Object::Customer::Address1)" name="AddCustomer" scope="session" />
<bean:define id="insuredAdd2" property="answer(Object::Customer::Address2)" name="AddCustomer" scope="session" />
<bean:define id="insuredCity" property="answer(Object::Customer::City)" name="AddCustomer" scope="session" />
<bean:define id="insuredCounty" property="answer(Object::Customer::County)" name="AddCustomer" scope="session" />
<bean:define id="insuredZip" property="answer(Object::Customer::Zip)" name="AddCustomer"scope="session" />
<bean:define id="insuredState" property="answer(Object::Customer::State)" name="AddCustomer" scope="session" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="customerId" name="AddRisk" property="answer(Object::Customer::CustomerId)"></bean:define>
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddRisk"/>

<html:form action="/AddNewRisk.do" scope="request" focus="riskName" onsubmit="return validate()">
<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				<tr>
					<td valign="top">
						<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
							<tr>
								<td>
									<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
	
			<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td  class="FormLabels" align="left" colspan="4">
					&nbsp;
				</td>
				</tr>
				<tr>
					<td class="NewSectionHead" colspan="4" align="center">
						ADD NEW RISK
					</td>
				</tr>
				<tr>
					<td  class="FormLabels" align="left" colspan="4">
					&nbsp;
				</td>
				<tr>
					<td  class="Error">
						<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="MultipleZipError" disabled="disabled" property="answer(temp)" value="" styleClass="txtbox" readonly="true" size="60" maxlength="60" />		
					</td>
				</tr>
			</table>
			
			<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">	
				<tr>
					<td class="links" width="50%" align="left">
						<a href= "/GetList.do?answer(TabPanelName)=Insured_Panel&&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>"> Risks </a>
					</td>
					<td align="right">
						<html:submit value="Save" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
					</td>
					
				</tr>
			</table>
			
			<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td align="left" colspan="2">
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td colspan="2" align="center" class="sectionhead">
									RESIDENTIAL PROPERTY  DETAILS
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td class="TextMatter1">
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							
							<tr>
								<td width="46%" class="FormLabels" align="left">Risk Name*</td>
								<td class="links">
									
									<html:text property="answer(Object::Risk::ResProperty::RiskName)" styleId="riskName" size="20" maxlength="20" styleClass="txtbox" onfocus="isOther(this.form, this.document);checkTerritoryValue(this.form, this.document)"/>
								</td>
							</tr>
							
							<tr>
								<td width="46%" class="FormLabels" align="left">Risk Number</td>
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::RiskNumber)" maxlength="8" size="8" styleId="riskNumber" styleClass="txtbox" />
								</td>
							</tr>
	<% String state=""+insuredState;
	if(state.equals("DE") ||state.equals("DC") ||state.equals("GA") ||state.equals("MD") ||state.equals("NJ") ||state.equals("NC") ||state.equals("PA") ||state.equals("SC") ||state.equals("VA") ){ %>						
							<tr>
								<td width="46%" class="FormLabels">
									Is address the same as insured mailing address 
								</td>
								<td class="TextMatter1">
									<html:radio value="YES" property="answer(Object::Risk::ResProperty::SameInsuredAddress)" onclick="addressSelect(this.form, this.document)">Yes</html:radio>
									<html:radio value="NO" property="answer(Object::Risk::ResProperty::SameInsuredAddress)">No</html:radio>		
								</td>
							</tr>
 	<%} %>
							
							<tr>
								<td width="46%" class="FormLabels" align="left">Address1</td>
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::Address1)" styleId="riskAdd1" maxlength="60" size="30" styleClass="txtbox" />
								</td>
							</tr>	
							
							<tr>
								<td width="46%" class="FormLabels" align="left">Address2</td>
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::Address2)" styleId="riskAdd2" maxlength="60" size="30" styleClass="txtbox" />
								</td>
							</tr>
							
							 <tr>
        						<td width="42%" class="FormLabels" align="left">City</td>
        						<td class="links"><html:text  property="answer(Object::Risk::ResProperty::City)" styleId="City" size="20" maxlength="20" styleClass="txtbox" /></td>
       						</tr>
       
       						<tr>
      						  	<td width="42%" class="FormLabels" align="left">County</td>
       						 	<td class="links"><html:text property="answer(Object::Risk::ResProperty::CountyName)" styleId="County" size="20" maxlength="20" styleClass="txtbox"/></td>
      						 </tr>
        
       						<tr>
						        <td width="42%" class="FormLabels" align="left">State*</td>
						        
						        <td>
							         <html:select name="AddRisk" property="answer(Object::Risk::ResProperty::State)" styleClass="txtbox" styleId="State" >
										<html:option value ="">Select</html:option>
										<html:option value ="DE">Delaware</html:option>
										<html:option value ="DC">District of Columbia</html:option>
										<html:option value ="GA">Georgia</html:option>
										<html:option value ="MD">Maryland</html:option>
										<html:option value ="NJ">New Jersey</html:option>
										<html:option value ="NC">North Carolina</html:option>
										<html:option value ="PA">Pennsylvania</html:option>
										<html:option value ="SC">South Carolina</html:option>
										<html:option value ="VA">Virginia</html:option>
									</html:select>
						        </td>
      						 </tr>

       						<tr>
						        <td width="42%" class="FormLabels" align="left">Zip Code*</td>
						        <td class="links">
       								  <html:text property="answer(Object::Risk::ResProperty::Zip)" onblur="checkRules(this.form, this.document);territoryLookup(this.form, this.document);" styleId="Zip" size="10" maxlength="10" styleClass="txtbox"/>
       								  <a href="../SearchZipCode.do?answer(Object::ZipCode::PageNum)=0&FormName=AddRisk&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');"/><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
      							</td>
      							
          					</tr>
          							
							<tr>
								<td class="FormLabels">
								<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;" styleId="Q1" disabled="disabled" property="answer(Object::Risk::ResProperty::RuleQuestion)" value="Are you in Beach Territory" styleClass="txtbox" size="35" maxlength="35" readonly="true"/>
								</td>
								<td class="TextMatter1">
								<html:select property="answer(Object::Risk::ResProperty::RuleNameGA)" onchange="territoryLookpupForRules(this.form, this.document);" style="display:none;" disabled="disabled" styleClass="txtbox" styleId="Rulename1">
									<html:option value="Beach_Territory_NO">No</html:option>	
									<html:option value="Beach_Territory_YES">Yes</html:option>										
								</html:select>
								</td>
							</tr>
							<tr>
								<td class="FormLabels">
								<html:text style="display:none;border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;" styleId="Q2" disabled="disabled" property="answer(Object::Risk::ResProperty::RuleQuestion)" value="Which Side of the Route 113" styleClass="txtbox" size="35" maxlength="35" readonly="true"/>
								</td>
								<td class="TextMatter1">
								<html:select property="answer(Object::Risk::ResProperty::RuleNameDE)" onchange="territoryLookpupForRules(this.form, this.document);" style="display:none;" disabled="disabled" styleClass="txtbox" styleId="Rulename2">
									<html:option value="">Select</html:option>
									<html:option value="Route_113_EAST">East</html:option>
									<html:option value="Route_113_WEST">West</html:option>		
								</html:select>
								</td>
							</tr>
							<tr>
								<td class="FormLabels" >Rating Territory*</td>
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::RatingTerritory)" styleClass="txtbox" size="5" maxlength="5" styleId ="RatingTerritory" readonly="true"/><IMG SRC="../Images/spinner1.gif" style="display:none;"  BORDER="0" align="top" id="territorySpinner">
									
								</td> 
								
									
								
							</tr>
							<tr>
								<logic:present name="getTerritoryFailedMsg"  scope="request">
									<td class="Error" colspan="2">
										Territory not found - Please click Find button to enter correct ZipCode details
									</td>												
								</logic:present>
								<logic:present name="moreThanOneZip"  scope="request">
									<td class="Error" >
										Please click find button to select city & county details
									</td>												
								</logic:present>
									
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
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td colspan="2" align="left" class="sectionhead">
									Property Information
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >Year Built*</td>
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::DateBuilt)" styleId="YearBuilt" size="4" maxlength="4" styleClass="txtbox" />
								</td>
							</tr>
							
							<tr>
								<td width="42%" class="FormLabels" align="left">Construction Type*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::ConstructionType)" styleId="constructionType" styleClass="txtbox" onchange="isOther(this.form,this.document)">
										<html:option styleClass="txtbox" value="">Select</html:option>
										<html:option value="Brick">Brick</html:option>
										<html:option value="Frame">Frame</html:option>
										<html:option value="Other">Other</html:option>
									</html:select>
								</td>
								<td class="links">
									<html:text styleId="constructionOther" property="answer(Object::Risk::ResProperty::ConstructionTypeOthers)" styleClass="txtbox" onfocus="othersClear(this.form,this.document)"></html:text>	
								</td>
							</tr>
							
							<tr>
								<td>
									 
								</td>			
							</tr>
						
													
							<tr>
								<td width="42%" class="FormLabels" align="left">Protection Class*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::ProtectionClass)" styleId="ProtectionClass" styleClass="txtbox">
										<html:option styleClass="txtbox" value="">Select</html:option>
										<html:option value="1">1</html:option>
										<html:option value="2">2</html:option>
										<html:option value="3">3</html:option>
										<html:option value="4">4</html:option>
										<html:option value="5">5</html:option>
										<html:option value="6">6</html:option>
										<html:option value="7">7</html:option>
										<html:option value="8">8</html:option>
										<html:option value="9">9</html:option>
										<html:option value="10">10</html:option>
									</html:select>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >Sq. Ft.</td>
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::SquareFeet)" styleClass="txtbox" styleId="SFeet" size="8" maxlength="8" />
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >Market Value</td>
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::MarketValue)" styleClass="txtbox" styleId="MarketValue" size="10" maxlength="10" onkeyup="checkMarketValue(this.form,this.document)" />
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >Distance to Fire Hydrant</td>
								<td class="TextMatter1">
									<html:text property="answer(Object::Risk::ResProperty::FireHydrantDistance)" size="6" maxlength="6" styleId="FireHydrant" styleClass="txtbox" />&nbsp;feet
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >Distance to Fire Station</td>
								<td class="TextMatter1">
									<html:text property="answer(Object::Risk::ResProperty::FireStationDistance)" size="6" maxlength="6" styleId="FireStation" styleClass="txtbox" />&nbsp;miles
								</td>
 							</tr>
 							
 							<tr>
 								<td class="FormLabels" ># of Families*</td>
 								<td class="links">
	 								<html:select property="answer(Object::Risk::ResProperty::NumberOfFamilies)" styleId="NoOfFamiles" styleClass="txtbox">
										<html:option value="1">1</html:option>
										<html:option value="2">2</html:option>
										<html:option value="3">3</html:option>
										<html:option value="4">4</html:option>
										<html:option value="5">5+</html:option>	
	 								</html:select>
 								</td>
 							</tr>
 							
 							<tr>
 								<td class="FormLabels" >Primary Source of Heat*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::HeatSource)" styleId="heatSourceType" styleClass="txtbox" onchange="isOther(this.form,this.document)">
										<html:option value="Electrical">Electrical</html:option>
										<html:option value="Oil">Oil</html:option>
										<html:option value="Natural Gas">Natural Gas</html:option>
										<html:option value="Wood">Wood</html:option>
										<html:option value="Wood/Pellet/Kerosene/Coal Burning Stove">Wood/Pellet/Kerosene/Coal Burning Stove</html:option>
										<html:option value="Space heater">Space heater</html:option>
										<html:option value="Other">Other</html:option>
									</html:select>	
								</td>
								<td class="links">
									<html:text styleId="heatSourceOther" property="answer(Object::Risk::ResProperty::HeatSourceOthers)" styleClass="txtbox" style="hidden" onfocus="othersClear(this.form,this.document)"></html:text>
								</td>
								
							</tr>
							
							<tr>
								<td class="FormLabels" >Electric Service Type</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::ElectricSerciveType)" styleClass="txtbox">
										
										<html:option value="Circuit Breaker">Circuit Breaker</html:option>
										<html:option value="Fuses">Fuses</html:option>
									</html:select>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >Occupancy*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::Occupancy)" styleId="occupancyType" styleClass="txtbox" onchange="isOther(this.form,this.document)">
										<html:option styleClass="txtbox" value="">Select</html:option>
										<html:option value="Owner">Owner</html:option>
										<html:option value="Tenant">Tenant</html:option>
										<html:option value="Vacant">Vacant</html:option>
										<html:option value="Builders Risk">Builders Risk</html:option>
										<html:option value="Other">Other</html:option>
									</html:select>
								</td>
								<td class="links">
									<html:text styleId="occupancyOther" property="answer(Object::Risk::ResProperty::OccupancyOther)" styleClass="txtbox" style="hidden" onfocus="othersClear(this.form,this.document)"></html:text>
								</td>
							</tr>	
							
							<tr>
								<td class="FormLabels">Type of Residence*?</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::ResType)" styleId="ResidenceType" styleClass="txtbox">
										<html:option styleClass="txtbox" value="">Select</html:option>
										<html:option value="Primary">Primary</html:option>
										<html:option value="Secondary">Secondary</html:option>
										<html:option value="Seasonal">Seasonal</html:option>
									</html:select>		
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >Fire Alarm</td>
							</tr>
							
							<tr>
								<td class="FormLabels">&nbsp;&nbsp;Central Station</td>
								<td class="TextMatter1" >
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::FireAlarmCentral)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::FireAlarmCentral)">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels">&nbsp;&nbsp;Local</td>
								<td class="TextMatter1" >
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::FireAlarmLocal)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::FireAlarmLocal)">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >Burglary Alarm</td>
							</tr>
							
							<tr>
								<td class="FormLabels">&nbsp;&nbsp;Central Station</td>
								<td class="TextMatter1" >
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::BurglaryAlarmCentral)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::BurglaryAlarmCentral)">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels">&nbsp;&nbsp;Local</td>
								<td class="TextMatter1" >
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::BurglaryAlarmLocal)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::BurglaryAlarmLocal)">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels">Eligibile For Wind Pool</td>
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::WindPoolEligibility)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::WindPoolEligibility)">No</html:radio>
								</td>
							</tr>
								
								
							<tr>
								<td class="FormLabels" >Hurricane Shutters</td>
								<td class="TextMatter1" >
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::HurricaneShutter)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::HurricaneShutter)">No</html:radio>
								</td>
							</tr>
							
							<tr id="CostalWaterTemp1" style="display:inline">
								<td class="FormLabels" width="50%">Distance to Coastal Waters* </td>
								<td class="links">	
									<html:select property="answer(Object::Risk::ResProperty::CostalWaterDistance1)" styleId="CostalWaterDistanceTemp1" styleClass="txtbox">
										<html:option styleClass="txtbox" value="">Select</html:option>
										<html:option value="500">Within 1000 feet</html:option>
										<html:option value="4000">1001 ft - 1 mile</html:option>
										<html:option value="20000">> 1 mile - 5 miles</html:option>
										<html:option value="30000">5+ miles</html:option>
									</html:select>
								</td>	
							</tr>
							
							
							<tr id="CostalWaterTemp2" style="display:none">
								<td class="FormLabels" width="50%">Distance to Coastal Waters* </td>
								<td class="links">	
									<html:select property="answer(Object::Risk::ResProperty::CostalWaterDistance2)" styleId="CostalWaterDistanceTemp2" styleClass="txtbox">
										<html:option styleClass="txtbox" value="">Select</html:option>
										<html:option value="25000">< 5 miles</html:option>
										<html:option value="50000">5-10 miles</html:option>
										<html:option value="100000">1st tier county >10 miles</html:option>
										<html:option value="-1">2nd tier county</html:option>
									</html:select>
								</td>	
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">			
							
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" width="100%">
									If dwelling was built in 1950 or earlier, then answer the following two questions:
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
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">				
							<tr>
								<td class="FormLabels" width="40%">
									 i) Has the wiring, heating, and plumbing <br>been fully updated in the past years?
								 </td>
								 <td class="TextMatter1" align="left">
								 	<html:radio value="Y" property="answer(Object::Risk::ResProperty::IsWiringUpdated)" onclick="wiringEnable(this.form,this.document)">Yes</html:radio>
								 	<html:radio value="N" property="answer(Object::Risk::ResProperty::IsWiringUpdated)" onclick="wiringDisable(this.form,this.document)" styleId="wiringUpdatedNo">No</html:radio>
								 </td>
							</tr>
														
							<tr>
								<td class="FormLabels" align="left" width="39%">&nbsp;&nbsp;a)&nbsp;Wiring</td>
								<td class="links" align="left">
									<html:text property="answer(Object::Risk::ResProperty::WiringUpdated)" styleId="WiringUpdated" size="4" maxlength="4" styleClass="txtbox" />
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" width="39%">&nbsp;&nbsp;b)&nbsp;Heating</td>
								<td class="links" width="46%">
									<html:text property="answer(Object::Risk::ResProperty::HeatingUpdated)" styleId="heatingUpdated" size="4" maxlength="4" styleClass="txtbox"  />
								</td>
							</tr>
														
							<tr>
								<td class="FormLabels" align="left" width="39%">&nbsp;&nbsp;c)&nbsp;Plumbing</td>
								<td class="links" width="46%">
									<html:text property="answer(Object::Risk::ResProperty::PlumbingUpdated)" styleId="plumbingUpdated" size="4" maxlength="4" styleClass="txtbox" />
								</td>
							</tr>	
							
							<tr>
								<td width="40%" class="FormLabels" width="39%">
									 ii) The roof been updated in the last 25 years?
								 </td>
								 <td class="TextMatter1" align="left">
								 	<html:radio value="Y" property="answer(Object::Risk::ResProperty::IsRoofUpdated)" onclick="roofEnable(this.form,this.document)">Yes</html:radio>
								 	<html:radio value="N" property="answer(Object::Risk::ResProperty::IsRoofUpdated)" onclick="roofDisable(this.form,this.document)" styleId="roofUpdatedNo">No</html:radio>
								 </td>
							</tr>
														
							<tr>
								<td class="FormLabels" align="l" width="39%">&nbsp;&nbsp;a)&nbsp;Roof</td> 
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::RoofUpdated)" styleId="roofUpdated" size="4" maxlength="4" styleClass="txtbox"  />
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
		
			<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td align="left" colspan="2">
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td colspan="2" align="left" class="sectionhead">
									Additional Information
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td class="TextMatter1">
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							
							<tr>
								<td width="46%" class="FormLabels" align="left">
									Is any child care business conducted on the premises*?
								</td>
								
								<td class="TextMatter1" >
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::ChildCareBusiness)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::ChildCareBusiness)" styleId="childradio">No</html:radio>
								</td>
							</tr>
						
							<tr>
								<td class="FormLabels" >
									Is any other business conducted on the premises*? 
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::OtherBusiness)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::OtherBusiness)" styleId="otherbusiness">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >
									If yes, please explain the type of business conducted:
								</td>
								
								<td class="FormLabels">
									<html:text property="answer(Object::Risk::ResProperty::BusinessType)" styleClass="txtbox"  size="30" maxlength="30" />
								</td>
							</tr>
						
							<tr>
								<td class="FormLabels" >
									Does any part of the premises consist of a "mobile home"*?
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::MobileHome)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::MobileHome)" styleId="mobileHome">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >
									Is there a swimming pool on the premises, and if so is it fenced*?
								</td>
								
								<td class="FormLabels">
									<html:select property="answer(Object::Risk::ResProperty::SwimmingPoolAnfFenceType)" styleClass="txtbox">
										<html:option value="No">No</html:option>
										<html:option value="Yes/Not Fully Fenced">Yes/Not Fully Fenced</html:option>
										<html:option value="Yes/Fully Fenced">Yes/Fully Fenced</html:option>
									</html:select>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels">In the last five years has the applicant been involved with a :</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >
									&nbsp;&nbsp;Bankruptcy 
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::bankruptcy)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::bankruptcy)" styleId="bankruptcy">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >
									&nbsp;&nbsp;Repossession
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::reposession)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::reposession)" styleId="repossession">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >
									&nbsp;&nbsp;Foreclosure(open or closed)
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::foreclosure)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::foreclosure)" styleId="foreclosure">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >
									Is there a trampoline on the premises*? 
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::Trampoline)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::Trampoline)" styleId="trampoline">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >
									Are there any animals on the premises*?
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::Animals)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::Animals)" styleId="animals">No</html:radio>
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >
									Is any of the animals one of the following breeds of dog - Chow, Pit Bull, Doberman, Rottweiler, Wolf Hybrid, Akita, Bull Mastiff?
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::DogBreeds)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::DogBreeds)" styleId="DogBreeds">No</html:radio>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" >
									For all animals on premises describe their type, breed and bite history:
								</td>
							</tr>
								
							<tr>
								<td class="FormLabels">
									<html:textarea property="answer(Object::Risk::ResProperty::AnimalsTypeAndBreedsHistory)" rows="6" cols="60"/>
								</td>
							</tr>							
						</table>
					</td>
				</tr>
			</table>
			<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td align="left" colspan="2">
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td >
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="46%" colspan="2" align="left" class="sectionhead">
									Claims
								</td>
								<td class="links">
									Claim Details
								</td>
							</tr>					
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td class="FormLabels" width="46%" align="left">
									# of claims in the past 3 years
								</td>
								<td class="links">&nbsp;
									<html:text property="answer(Object::Risk::ResProperty::NumberOfClaims)" size="5" maxlength="5" styleClass="txtbox"  />
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">
									Any 1 claim > $10,000?
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::ClaimGTAmount)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::ClaimGTAmount)" styleId="ClaimGTAmount">No</html:radio>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td align="left" colspan="2">
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td >
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="46%" colspan="2" align="left" class="sectionhead">
									Additional Interest
								</td>
								<td class="links">
									Additional Interest Details
								</td>
							</tr>					
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td class="FormLabels" width="46%" align="left">
									Are there any additional interest?
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" property="answer(Object::Risk::ResProperty::AdditionalInterest)">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Risk::ResProperty::AdditionalInterest)" styleId="AdditionalInterest">No</html:radio>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<table WIDTH="60%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="left">
						<html:submit value="Save" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
					</td>
					<td align="left">
						<html:button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"  onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td> 
						<html:hidden property="answer(Object::Risk::ResProperty::CustomerId)" value="<%= customerId.toString() %>"/>
						<html:hidden property="answer(Object::Risk::ResProperty::CostalWaterDistance)" styleId="CostalWaterDistance" />										
						<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString() %>"/>
						<html:hidden property="answer(Object::Agency::AgencyId)" value="<%= id.toString() %>"/>
						<html:hidden property="answer(Object::Risk::ResProperty::RiskType)" value="Residential"/>
						<html:hidden property="answer(Object::Risk::ResProperty::CreatedBy)" value="<%=usernameId.toString()%>" />
						<html:hidden property="answer(Object::Risk::ResProperty::UpdatedBy)" value="<%=usernameId.toString()%>" />
						<html:hidden property="answer(insuredAdd1)" styleId="add1" value="<%=insuredAdd1.toString()%>" />
						<html:hidden property="answer(insuredAdd2)" styleId="add2" value="<%=insuredAdd2.toString()%>" />
						<html:hidden property="answer(insuredcity)" styleId="inscity" value="<%=insuredCity.toString()%>" />
						<html:hidden property="answer(insuredcounty)" styleId="inscounty" value="<%=insuredCounty.toString()%>" />
						<html:hidden property="answer(insuredzip)" styleId="inszip" value="<%=insuredZip.toString()%>" />
						<html:hidden property="answer(insuredstate)" styleId="insstate" value="<%=insuredState.toString()%>" />
						<html:hidden property="answer(Object::Risk::ResProperty::RuleCheck)" styleId="ruleCheck" value="AddN"/>
						<html:hidden property="answer(Object::Risk::ResProperty::Zip)" styleId="zipChange"/>
						<html:hidden property="answer(Object::Risk::ResProperty::PageRefresh)" styleId="pageRefreshCheck" value='N'/> 
						<html:hidden property="answer(Object::Risk::ResProperty::Active)" value="Y"/>
						<html:hidden property="answer(cityCountyEmpty)" styleId="cityCountyEmpty" value="<%=""+request.getAttribute("cityCountyEmpty")%>"/>
						<html:hidden property="answer(MultipleZIP)" styleId="reqVal" value="NO"/>
						<html:hidden property="answer(FromRiskJsp)" value="YES"/>
						<html:hidden property="TabPanelName" value="Insured_Panel"/>
						
					</td>
				</tr>
			</table>
		</td>
	</tr> 
</table>
</html:form>
