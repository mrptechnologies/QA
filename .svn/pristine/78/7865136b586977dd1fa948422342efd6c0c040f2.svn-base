<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%response.setHeader("Cache-Control", "no-store");%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)"
	name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)"
	styleId="ownerId1" value='<%=""+ownerId %>' />
<%String isAppEnabled1 = ""; %>
<%if(request.getParameter("answer(appEnabled)") != null) {%>
<bean:parameter name="answer(appEnabled)" id="IsAppEnabled" />
<%isAppEnabled1 = ""+IsAppEnabled; %>
<%} %>

<%String newLocName="";
                 String locationSize="";
                 String locId1 = "";
                 String newSubQuoteVerId = "";
                 if(request.getAttribute("locationListArraySize")!=null){                
                	 locationSize = ""+request.getAttribute("locationListArraySize");
                 } if(request.getAttribute("SUBQUOTEVERID")!=null){                
                	 newSubQuoteVerId = ""+request.getAttribute("SUBQUOTEVERID");%>
<html:hidden property="answer(newSubQuoteVerId)"
	value='<%=""+newSubQuoteVerId%>' styleId="newSubQuoteVerId" />
<%}%>
<div align="center" id="Doc" style="display:block">
<table border="0" cellpadding="0" cellspacing="0" width="97%"
	align="center">
	<tr>
		<td>
		<table border="0" style="width:98%" align=center class="locformhead1">
			<tr>
				<td>
				<h2>Location Details</h2>
				</td>
			</tr>
		</table>
		<div align="left">&nbsp;</div>
		<logic:present name='locationListArray'>
			<bean:define id="locId"
				property="Object::Insured::Location::LocationId"
				name="locationListArray" />
			<bean:define id="newLocName1"
				property="Object::Insured::Location::LocationName"
				name="locationListArray" />
			<bean:define id="LocationAddress1" name="locationListArray"
				property="Object::Insured::Location::Address1" />
			<bean:define id="LocationAddress2" name="locationListArray"
				property="Object::Insured::Location::Address2" />
			<%String strLocationAddress1 =""+LocationAddress1; %>
			<%newLocName = ""+newLocName1; %>
			<%String strLocationAddress2 =""+LocationAddress2; %>
			<table align="left" style="width:65%">
				<!-- <div class="frlabel3 left"> -->
				<tr>
					<td class="frlabel3 left">Number:</td>
					<td class="frinfo3 left"
						style="font-weight:400;width:300px;text-align:left"><bean:write
						name="locationListArray"
						property="Object::Insured::Location::LocationNumber" /></td>
				</tr>
				<tr>
					<td class="frlabel3 left">Name:</td>
					<td class="frinfo3 left"
						style="font-weight:400;width:300px;text-align:left"><a
						href="javascript:void(0);"
						onclick="javascript:getEditLocationPopUp();"><bean:write property="Object::Insured::Location::LocationName" name="locationListArray" /></a></td>
				</tr>
				<tr>
					<td class="frlabel3 left">Description:</td>
					<td class="frinfo3 left"
						style="font-weight:400;width:300px;text-align:left"><bean:write
						name="locationListArray"
						property="Object::Insured::Location::LocationDescription" /></td>
				</tr>
				<tr>
					<td class="frlabel3 left">Address Line 1:</td>
					<td class="frinfo3 left"
						style="font-weight:400;width:300px;text-align:left"><bean:write  name="locationListArray"
				property="Object::Insured::Location::Address1" /></td>
				</tr>
				<tr>
					<td class="frlabel3 left">Address Line 2:</td>
					<td class="frinfo3 left"
						style="font-weight:400;width:300px;text-align:left"><bean:write name="locationListArray"
				property="Object::Insured::Location::Address2" /></td>
				</tr>
				<tr>
					<td class="frlabel3 left">City:</td>
					<td class="frinfo3 left"
						style="font-weight:400;width:300px;text-align:left"><bean:write
						name="locationListArray"
						property="Object::Insured::Location::City" /></td>
				</tr>
				<tr>
					<td class="frlabel3 left">State/Province:</td>
					<td class="frinfo3 left"
						style="font-weight:400;width:300px;text-align:left"><bean:write
						name="locationListArray"
						property="Object::Insured::Location::State" /></td>
				</tr>
				<tr>
					<td class="frlabel3 left">Country:</td>
					<td class="frinfo3 left"
						style="font-weight:400;width:300px;text-align:left"><bean:write
						name="locationListArray"
						property="Object::Insured::Location::Country" /></td>
				</tr>
				<tr>
					<td class="frlabel3 left">Use of Facility:</td>
					<td class="frinfo3 left"
						style="font-weight:400;width:300px;text-align:left"><bean:write
						name="locationListArray"
						property="Object::Insured::Location::FacilityUse" /></td>
				</tr>
				<tr>
					<td class="frlabel3 left">Ownership:</td>
					<td class="frinfo3 left"
						style="font-weight:400;width:300px;text-align:left"><bean:write
						name="locationListArray"
						property="Object::Insured::Location::QwnerType" /></td>
					&nbsp;
				</tr>
			</table>
			<!-- </div> 
				<div class="frinfo3 left" style="width:300px">
					<p align="left"><span style="font-weight: 400"><bean:write name="locationListArray" property="Object::Insured::Location::LocationNumber" /><br />
					<a href="javascript:void(0);" onclick="javascript:getEditLocationPopUp();";><%=""+newLocName1 %></a><br />
					<bean:write name="locationListArray" property="Object::Insured::Location::LocationDescription" /><br />
					<%=strLocationAddress1%><br />
					<%=strLocationAddress2%><br />
					<bean:write name="locationListArray" property="Object::Insured::Location::City" /><br />					
					<bean:write name="locationListArray" property="Object::Insured::Location::State" /><br />					
					<bean:write name="locationListArray" property="Object::Insured::Location::Country" />	<br />
					<bean:write name="locationListArray" property="Object::Insured::Location::FacilityUse" /><br />
					<bean:write name="locationListArray" property="Object::Insured::Location::QwnerType" /><br />&nbsp;															
				</span>
				</div>-->
			<html:hidden property="answer(locationId)" value='<%=""+locId%>'
				styleId="locIdUpdated" />
		</logic:present><span>
		<div class="frinfo3 left" style="width:350px;text-align:left">History of leaks or
		releases?<br>
		<bean:write name="locationListArray"
			property="Object::Insured::Location::HistoryLeaks" /></div>
		<div class="frinfo3 left" style="width:350px;text-align:left">Are there other tanks
		at this location that are not going to be scheduled on to this policy?<br>
		<bean:write name="locationListArray"
			property="Object::Insured::Location::TankNotScheduled" /></div>
		</span>
</table>
<div>&nbsp;</div>
<div>&nbsp;</div>
<table border="0" cellpadding="0" cellspacing="0" width="97%"
	align="center">
		<table border="0" cellpadding="5" cellspacing="0" width="98%" class=""
			align="center" id="table4">
			<tr>
				<td><logic:present name='ASTSpecQuestionMap'>
					<%com.dms.ejb.data.QuestionHashMap specMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("ASTSpecQuestionMap");
			String spccInPlace = specMap.getString("Object::Insured::Location::AST::SpccPlanInPlance");
			String astTankAssociated = specMap.getString("Object::Insured::Location::AST::TankAssociated");
			
						
			if(!spccInPlace.equals("")){ %>

					<a href="javascript:void(0);"
						onclick="editSpecificQuestions('AST');" class="locbutton3 left">View
					AST Specific Questions</a>
					<html:hidden property="answer(ASTSpecQuestion)" value='Y'
						styleId="ASTSpecQuestionAdded" />
					<%	}%>
				</logic:present></td>
			</tr>
			<tr>
				<td><logic:present name='USTSpecQuestionMap'>
					<%com.dms.ejb.data.QuestionHashMap specMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("USTSpecQuestionMap");
			
			String USTPlanToRemoveRisk = specMap.getString("Object::Insured::Location::UST::PlanRemoveRisk");%>

					<%	
			if(!USTPlanToRemoveRisk.equals("")){%>
					<a href="javascript:void(0);"
						onclick="editSpecificQuestions('UST');" class="locbutton3 left">View
					UST Specific Questions</a>
					<html:hidden property="answer(USTSpecQuestion)" value='Y'
						styleId="USTSpecQuestionAdded" />
					<%	}%>
				</logic:present></td>

			</tr>
		</table>
		<table border="0" style="width:98%" align=center class="locformhead1">
			<tr>
				<%if(!isAppEnabled1.equals("N")){ %>
				<td><!--  				<a href="javascript:void(0);" onclick="document.getElementById('RiskSelection').value='';document.getElementById('tankname').value='';document.getElementById('LocationDescription').value='';document.getElementById('AddTankDialog').style.display = 'block';YAHOO.example.container.AddTankDialog.show();" class="locbutton2">Add A Tank</a>-->
				</td>
				<%} %>
			</tr>
			<tr>
				<td>
				<h2>Tank List</h2>
				</td>
			</tr>
		</table>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
		<table border="0" cellpadding="5" cellspacing="0" width="98%"
			class="datadispborder" align=center id="table4">
			<tr>
				<td class="datadispcolhead" width="7%"><a>Number</a></td>
				<td class="datadispcolhead" width="15%"><a>Tank Name</a></td>
				<td class="datadispcolhead" width="7%"><a>Type</a></td>
				<td class="datadispcolhead" width="15%"><a>Year Installed</a></td>
				<td class="datadispcolhead" width="12%"><a>Capacity</a></td>
				<td class="datadispcolhead" width="15%"><a>Construction</a></td>
				<td class="datadispcolhead" width="7%"><a>SW/DW</a></td>
				<td class="datadispcolhead" width="15%"><a>Contents</a></td>

			</tr>


			<logic:present name='tankListArray'>
				<%int i=0; %>
				<logic:iterate id="tankListArray" name="tankListArray">
					<bean:define id="TankRiskId" name="tankListArray"
						property="Object::Insured::Location::Tank::RiskId" />
					<bean:define id="RiskType" name="tankListArray"
						property="Object::Insured::Location::Tank::RiskType" />

					<% String tankRiskId1 = ""+TankRiskId;;
                 String RiskType1=""+RiskType;
                 i++;                
                 %>

					<tr>

						<td class="ColValue" width="7%"><a href="javascript:void(0);"
							onclick="geteditRiskPopUp('<%=tankRiskId1%>','<%=RiskType1%>')"><bean:write
							name="tankListArray"
							property="Object::Insured::Location::Tank::RiskNum" /></a></td>
						<td class="ColValue" width="15%"><a href="javascript:void(0);"
							onclick="geteditRiskPopUp('<%=tankRiskId1%>','<%=RiskType1%>')">
						<bean:write name="tankListArray"
							property="Object::Insured::Location::Tank::RiskName" /> </a></td>
						<td class="ColValue" width="7%"><bean:write name="tankListArray"
							property="Object::Insured::Location::Tank::RiskType" /></td>
						<td class="ColValue" width="15%"><bean:write name="tankListArray"
							property="Object::Insured::Location::Tank::YearInstalled" /></td>
						<td class="ColValue" width="12%"><bean:write name="tankListArray"
							property="Object::Insured::Location::Tank::TankCapacity" /></td>
						<td class="ColValue" width="15%">
						<table width="70%">

							<bean:define id="TankConstructionCoatedOrBareSteel"
								name="tankListArray"
								property="Object::Insured::Location::Tank::TankConstructionCoatedBaresteel" />
							<%String TankConstructionCoatedOrBareSteel1 = ""+TankConstructionCoatedOrBareSteel ; 
                 	if(!TankConstructionCoatedOrBareSteel1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankConstructionCoatedBaresteel" /></td>
							</tr>
							<%} %>

							<bean:define id="TankConstructioncladSteel" name="tankListArray"
								property="Object::Insured::Location::Tank::TankConstructioncladSteel" />
							<%String TankConstructioncladSteel1 = ""+TankConstructioncladSteel ; 
                 	if(!TankConstructioncladSteel1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankConstructioncladSteel" /></td>
							</tr>
							<%} %>
							<bean:define id="TankConstructionsteelTank_institute"
								name="tankListArray"
								property="Object::Insured::Location::Tank::TankConstructionsteelTank_institute" />
							<%String TankConstructionsteelTank_institute1 = ""+TankConstructionsteelTank_institute;
                if(!TankConstructionsteelTank_institute1.equals("")){ %>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankConstructionsteelTank_institute" /></td>
							</tr>
							<%} %>
							<bean:define id="TankConstructionFiberReinforced"
								name="tankListArray"
								property="Object::Insured::Location::Tank::TankConstructionFiberReinforced" />
							<%String TankConstructionFiberReinforced1 =""+TankConstructionFiberReinforced;
                 if(!TankConstructionFiberReinforced1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankConstructionFiberReinforced" /></td>
							</tr>
							<%} 
                 %>
							<bean:define id="TankConstructionCathodicallyProtected"
								name="tankListArray"
								property="Object::Insured::Location::Tank::TankConstructionCathodicallyProtected" />
							<%String TankConstructionCathodicallyProtected1 = ""+TankConstructionCathodicallyProtected;
                 if(!TankConstructionCathodicallyProtected1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankConstructionCathodicallyProtected" /></td>
							</tr>
							<%} %>
							<bean:define id="TankConstructionOther" name="tankListArray"
								property="Object::Insured::Location::Tank::TankConstructionOther" />
							<%String TankConstructionOther1 = ""+TankConstructionOther;
                  if(!TankConstructionOther1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankConstructionOther" /></td>
							</tr>
							<%} %>
							<bean:define id="TankConstructionFiberGlass" name="tankListArray"
								property="Object::Insured::Location::Tank::TankConstructionFiberGlass" />
							<%String  TankConstructionFiberGlass1 = ""+TankConstructionFiberGlass;
                  if(!TankConstructionFiberGlass1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankConstructionFiberGlass" /></td>
							</tr>
							<%} %>
							<bean:define id="TankConstructionWeldedSteel"
								name="tankListArray"
								property="Object::Insured::Location::Tank::TankConstructionWeldedSteel" />
							<%String TankConstructionWeldedSteel1 = ""+TankConstructionWeldedSteel;
                   if(!TankConstructionWeldedSteel1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankConstructionWeldedSteel" /></td>
							</tr>
							<%} %>
							<bean:define id="TankConstructionPlastic" name="tankListArray"
								property="Object::Insured::Location::Tank::TankConstructionPlastic" />
							<%String TankConstructionPlastic1=""+TankConstructionPlastic;
                   if(!TankConstructionPlastic1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankConstructionPlastic" /></td>
							</tr>
							<%} %>
							<bean:define id="TankConstructionVaulted" name="tankListArray"
								property="Object::Insured::Location::Tank::TankConstructionVaulted" />
							<%String TankConstructionVaulted1= ""+TankConstructionVaulted;
                    if(!TankConstructionVaulted1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankConstructionVaulted" /></td>
							</tr>
							<%} %>

						</table>
						</td>
						<td class="ColValue" width="7%"><bean:write name="tankListArray"
							property="Object::Insured::Location::Tank::TankWallType" /></td>
						<td class="ColValue" width="15%">
						<table width="40%">
							<bean:define id="TankContentsNewOil" name="tankListArray"
								property="Object::Insured::Location::Tank::TankContentsNewOil" />
							<%String TankContentsNewOil1 = ""+TankContentsNewOil;
                 if(!TankContentsNewOil1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankContentsNewOil" /></td>
							</tr>
							<%} %>
							<bean:define id="TankContentsWasteOil" name="tankListArray"
								property="Object::Insured::Location::Tank::TankContentsWasteOil" />
							<%String TankContentsWasteOil1 = ""+TankContentsWasteOil;
				if(!TankContentsWasteOil1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankContentsWasteOil" /></td>
							</tr>
							<%} %>
							<bean:define id="TankContentsHeatingOil" name="tankListArray"
								property="Object::Insured::Location::Tank::TankContentsHeatingOil" />
							<%String TankContentsHeatingOil1=""+TankContentsHeatingOil;
                 if(!TankContentsHeatingOil1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankContentsHeatingOil" /></td>
							</tr>
							<%} %>
							<bean:define id="Tank_contentsDeisel" name="tankListArray"
								property="Object::Insured::Location::Tank::Tank_contentsDeisel" />
							<%String Tank_contentsDeisel1 = ""+Tank_contentsDeisel;
                 if(!Tank_contentsDeisel1.equals("")){ %>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::Tank_contentsDeisel" /></td>
							</tr>
							<%} %>
							<bean:define id="TankContentsKerosene" name="tankListArray"
								property="Object::Insured::Location::Tank::TankContentsKerosene" />
							<%String TankContentsKerosene1 = ""+TankContentsKerosene; 
                  if(!TankContentsKerosene1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankContentsKerosene" /></td>
							</tr>
							<%} %>
							<bean:define id="TankContentsPropene" name="tankListArray"
								property="Object::Insured::Location::Tank::TankContentsPropene" />
							<%String TankContentsPropene1=""+TankContentsPropene;
                 if(!TankContentsPropene1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankContentsPropene" /></td>
							</tr>
							<%} %>
							<bean:define id="TankContentsJetfuel" name="tankListArray"
								property="Object::Insured::Location::Tank::TankContentsJetfuel" />
							<%String TankContentsJetfuel1= ""+TankContentsJetfuel;
                  if(!TankContentsJetfuel1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankContentsJetfuel" /></td>
							</tr>
							<%} %>
							<bean:define id="TankContentsAntifreeze" name="tankListArray"
								property="Object::Insured::Location::Tank::TankContentsAntifreeze" />
							<%String TankContentsAntifreeze1 = ""+TankContentsAntifreeze;
                   if(!TankContentsAntifreeze1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankContentsAntifreeze" /></td>
							</tr>
							<%} %>
							<bean:define id="TankContentsOthers" name="tankListArray"
								property="Object::Insured::Location::Tank::TankContentsOthers" />
							<%String TankContentsOthers1= ""+TankContentsOthers; 
                    if(!TankContentsOthers1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankContentsOthers" /></td>
							</tr>
							<%} %>
							<bean:define id="TankContentsUnleadedGas" name="tankListArray"
								property="Object::Insured::Location::Tank::TankContentsUnleadedGas" />
							<%String TankContentsUnleadedGas1 = ""+TankContentsUnleadedGas;
                     if(!TankContentsUnleadedGas1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankContentsUnleadedGas" /></td>
							</tr>
							<%} %>
							<bean:define id="TankContentsGasoline" name="tankListArray"
								property="Object::Insured::Location::Tank::TankContentsGasoline" />
							<%String TankContentsGasoline1 = ""+TankContentsGasoline; 
 					if(!TankContentsGasoline1.equals("")){%>
							<tr>
								<td><bean:write name="tankListArray"
									property="Object::Insured::Location::Tank::TankContentsGasoline" /></td>
							</tr>
							<%} %>
						</table>
						</td>
					</tr>
				</logic:iterate>
			</logic:present>


		</table>
		<p>&nbsp;
		</td>
	</tr>
</table>
</div>
</td>
</tr>
</table>

<br class="clear" />


<dmshtml:get_all_risk_types nameInSession="riskTypeList"
	ownerId='<%=ownerId+""%>'
	dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
<bean:define id="riskTypeList" name="riskTypeList"
	type="java.util.ArrayList" />


<% if(request.getAttribute("SubmissionVerIdUpdated")!=null){

				String submissionVerId = ""+request.getAttribute("SubmissionVerIdUpdated"); %>
<html:hidden property="answer(Object::Submission::SubmissionVerId)"
	value='<%=""+submissionVerId%>' styleId="newSubmissionVerId" />
<% }%>

<logic:present name='locationListArray'>

	<html:hidden property="answer(NewLocatiomName)"
		value='<%=""+newLocName%>' styleId="newLocationNameAssigned" />
</logic:present>

<logic:present name='locationListArraySize'>
	<html:hidden property="answer(locationSize)"
		value='<%=""+locationSize%>' styleId="locationSizeUpdated" />
	<html:hidden property="answer(locationId)" value='<%=""+locId1%>'
		styleId="locIdUpdated" />

</logic:present>

<logic:present name='ASTSpecQuestionMap'>
	<%com.dms.ejb.data.QuestionHashMap specMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("ASTSpecQuestionMap");
			String spccInPlace = specMap.getString("Object::Insured::Location::AST::SpccPlanInPlance");
			String astTankAssociated = specMap.getString("Object::Insured::Location::AST::TankAssociated");
						
			if(!spccInPlace.equals("") && !astTankAssociated.equals("")){ %>

	<html:hidden property="answer(ASTSpecQuestion)" value='Y'
		styleId="ASTSpecQuestionAdded" />

	<%	} %>

</logic:present>

<logic:present name='USTSpecQuestionMap'>
	<%com.dms.ejb.data.QuestionHashMap specMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("USTSpecQuestionMap");
						
			String USTPlanToRemoveRisk = specMap.getString("Object::Insured::Location::UST::PlanRemoveRisk");
			String USTTankRemoved = specMap.getString("Object::Insured::Location::UST::TankRemoved");

			if(!USTPlanToRemoveRisk.equals("") && USTTankRemoved.equals("")){%>
	<html:hidden property="answer(USTSpecQuestion)" value='Y'
		styleId="USTSpecQuestionAdded" />

	<%	}
		%>
</logic:present>
