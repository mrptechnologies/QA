<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<table width="900px">
	
	<tr>
	<td width="40%" rowspan="1">
		<div id="RiskPopUp" style="display:none;">
			<div class="hd" id="containerheading">UST Specific Questions</div>
			<div class="formhead" align="right"><h2 class="right"></h2>
		
			</div>      
				<div class="Applicationpage2" style="overflow:scroll; height:40em;">
			<div class="bd" id="RiskPopUpBody">
			</div>
			</div>
			<a class="container-close" href="javascript:void(0);" id="closeIcon3"></a>
		</div>
	
		</td>
	</tr>
</table>
<%response.setHeader("Cache-Control", "no-store");%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>
<%String isAppEnabled1 = ""; %>
<%if(request.getParameter("answer(appEnabled)") != null) {%>
<bean:parameter name="answer(appEnabled)" id="IsAppEnabled"/>
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
                	 <html:hidden property="answer(newSubQuoteVerId)" value='<%=""+newSubQuoteVerId%>' styleId="newSubQuoteVerId"/>
                <%}%>
<div align="center" id="Doc" style="display:block">
<table border="0" cellpadding="0" cellspacing="0" width="97%"  align="center">
   <tr>
     <td>                 
<table border="0" style="width:98%" align=center class="locformhead1">
	<tr><td><h2>Location Details</h2></td></tr>
</table>
			<div align="left" >&nbsp;</div>
		<logic:present name='locationListArray'>
		<bean:define id="locId" property="Object::Quote::Location::LocationId"  name="locationListArray"  />
		<bean:define id="newLocName1"  property="Object::Quote::Location::LocationName" name="locationListArray" />
		<bean:define id="LocationAddress1" name="locationListArray" property="Object::Quote::Location::Address1" />
		<bean:define id="LocationAddress2" name="locationListArray" property="Object::Quote::Location::Address2" />
		<%String strLocationAddress1 =""+LocationAddress1; %>
		<%newLocName = ""+newLocName1; %>
			<%String strLocationAddress2 =""+LocationAddress2; %>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
							  <td align="left" width="20%">
							  
							  Number
							  </td>
							  <td>
							  :<bean:write name="locationListArray" property="Object::Quote::Location::LocationNumber" />
							  </td>
							  </tr>
							
							<tr>
							  <td align="left">
							  Name</td>
							  <td>
							  :<a href="javascript:void(0);" onclick="javascript:getEditLocationPopUp();"><bean:write   property="Object::Quote::Location::LocationName" name="locationListArray" /></a>
							  </td>
							</tr>
							
							<tr>
							  <td align="left">
							  Description
							  </td>
							  <td>
							  :<bean:write name="locationListArray" property="Object::Quote::Location::LocationDescription" />
							  </td>
							</tr>			
							
							
							<tr>
							  <td align="left">
							  Address Line 1
							  </td>
							  <td>:<bean:write name="locationListArray" property="Object::Quote::Location::Address1" />
							  </td>				
							</tr>
							
							
							<tr>
							  <td align="left">
							  Address Line 2
							  </td>
							  <td>:<bean:write name="locationListArray" property="Object::Quote::Location::Address2" />
							  </td>				
							</tr>
							
														
							<tr>
							  <td align="left">
							  City
							  </td>
							  <td>:<bean:write name="locationListArray" property="Object::Quote::Location::City" />
							  </td>				
							</tr>
							
							<tr>
							  <td align="left">
							   State/Province
							  </td>
							  <td>:<bean:write name="locationListArray" property="Object::Quote::Location::State" />
							  </td>				
							</tr>
							
							
							<tr>
							  <td align="left">
							   Country
							  </td>
							  <td>:<bean:write name="locationListArray" property="Object::Quote::Location::Country" />
							  </td>				
							</tr>
						
						   <tr>
						   	  <td align="left">
							    Use of Facility
							  </td>
							  <td>:<bean:write name="locationListArray" property="Object::Quote::Location::FacilityUse" />
							  </td>				
							</tr>
							
							<tr>
						   	  <td align="left">
							     Ownership 
							  </td>
							  <td>:<bean:write name="locationListArray" property="Object::Quote::Location::QwnerType" />
							  </td>				
							</tr>
						</table>
							</td>
							
							
					
					<td width="50%" valign="top">
						<table>
						
							<tr>
								<td align="left">
								<%String historyOfLeaks = "";
								String islocationScheduled= "";%>
								<bean:define id="historyOfLeaks1" name="locationListArray" property="Object::Quote::Location::HistoryLeaks" />
								<bean:define id= "islocationScheduled1" name="locationListArray" property="Object::Quote::Location::TankNotScheduled" />
								<%
								historyOfLeaks = ""+historyOfLeaks1;
								islocationScheduled = ""+islocationScheduled1;
								if(historyOfLeaks.equals("N")){
									historyOfLeaks = "NO";
								}else{
									historyOfLeaks = "Yes";
									
								}
								if(islocationScheduled.equals("N")){
									islocationScheduled = "No";								
								}else{
									islocationScheduled = "Yes";
								}
								%>
								History of leaks or releases? : &nbsp; <%=""+historyOfLeaks %>
								</td>
							
							</tr>
							<tr>
								<td align="left">
								Are there other tanks at this location that are not going to be scheduled on to this policy?&nbsp; <%=""+islocationScheduled %>
								</td>
							
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<html:hidden property="answer(locationId)" value='<%=""+locId%>' styleId="locIdUpdated" />
		</logic:present>


<div>&nbsp;</div>
<div>&nbsp;</div>
<table border="0" cellpadding="5" cellspacing="0" width="98%" class="" align=center id="table4" >
	<tr>
		<td>
		<logic:present name='ASTSpecQuestionMap'>
		<%com.dms.ejb.data.QuestionHashMap specMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("ASTSpecQuestionMap");
			String spccInPlace = specMap.getString("Object::Quote::Location::AST::SpccPlanInPlance");
			String astTankPresent = specMap.getString("Object::Quote::Location::AST::ASTTankPresent");
			
						
			if(astTankPresent.equals("Y")){ %>
				
				<a href="javascript:void(0);" onclick="editSpecificQuestions('AST');" class="locbutton3 left">View AST Specific Questions</a>
				<html:hidden property="answer(ASTSpecQuestion)" value='Y' styleId="ASTSpecQuestionAdded" />
		<%	}%>
		</logic:present>
		</td>
	</tr>	
	<tr>
		<td>
		
			<logic:present name='USTSpecQuestionMap'>
		<%com.dms.ejb.data.QuestionHashMap specMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("USTSpecQuestionMap");
			
			String USTPlanToRemoveRisk = specMap.getString("Object::Quote::Location::UST::PlanRemoveRisk");%>
				
		<%	
			if(!USTPlanToRemoveRisk.equals("")){%>
				<a href="javascript:void(0);" onclick="editSpecificQuestions('UST');" class="locbutton3 left">View UST Specific Questions</a>
				<html:hidden property="answer(USTSpecQuestion)" value='Y' styleId="USTSpecQuestionAdded" />
		<%	}%>
		</logic:present>
		</td>
	
	</tr>
	</table>
<table border="0" style="width:98%" align=center class="locformhead1">
	<tr>
	<%if(!isAppEnabled1.equals("N")){ %>
		<td>
				<a href="javascript:void(0);" onclick="document.getElementById('RiskSelection').value='';document.getElementById('tankname').value='';document.getElementById('LocationDescription').value='';document.getElementById('AddTankDialog').style.display = 'block';YAHOO.example.container.AddTankDialog.show();" class="locbutton2">Add A Tank</a>
		</td>
		<%} %>
	</tr>
	<tr><td><h2>Tank List</h2></td></tr>
</table>
<div>&nbsp;</div>
<div>&nbsp;</div>
			<table border="0" cellpadding="5" cellspacing="0" width="98%" class="datadispborder" align=center id="table4" >
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
                 <logic:iterate id="tankListArray" name="tankListArray" >	
                 <bean:define id="TankRiskId" name="tankListArray" property="Object::Quote::Location::Tank::RiskId" />
                 <bean:define id="RiskType" name="tankListArray" property="Object::Quote::Location::Tank::RiskType" />
                 
                 <% String tankRiskId1 = ""+TankRiskId;;
                 String RiskType1=""+RiskType;
                 i++;                
                 %>           
                
               		<tr>
               	
                  <td class="ColValue" width="7%">
                  <a href="javascript:void(0);" onclick="geteditRiskPopUp('<%=tankRiskId1%>','<%=RiskType1%>')"><bean:write name="tankListArray" property="Object::Quote::Location::Tank::RiskNum" /></a></td>
                 <td class="ColValue" width="15%">
                 <a href="javascript:void(0);" onclick="geteditRiskPopUp('<%=tankRiskId1%>','<%=RiskType1%>')">
                 <bean:write name="tankListArray" property="Object::Quote::Location::Tank::RiskName" />
                 </a>
                 </td>
                 <td class="ColValue" width="7%"><bean:write name="tankListArray" property="Object::Quote::Location::Tank::RiskType" /></td>
                 <td class="ColValue" width="15%"><bean:write name="tankListArray" property="Object::Quote::Location::Tank::YearInstalled" /></td>
                 <td class="ColValue" width="12%"><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankCapacity" /></td>
                 <td class="ColValue" width="15%"><table width="70%">
                 
                 <bean:define id="TankConstructionCoatedOrBareSteel" name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionCoatedBaresteel" />
                 <%String TankConstructionCoatedOrBareSteel1 = ""+TankConstructionCoatedOrBareSteel ; 
                 	if(!TankConstructionCoatedOrBareSteel1.equals("")){%>
					<tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionCoatedBaresteel" /></td></tr>
				<%} %>	
                 
                 <bean:define id="TankConstructioncladSteel" name="tankListArray" property="Object::Quote::Location::Tank::TankConstructioncladSteel" />
                 <%String TankConstructioncladSteel1 = ""+TankConstructioncladSteel ; 
                 	if(!TankConstructioncladSteel1.equals("")){%>
					<tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankConstructioncladSteel" /></td></tr>
				<%} %>	
				<bean:define id="TankConstructionsteelTank_institute"  name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionsteelTank_institute" />
                <%String TankConstructionsteelTank_institute1 = ""+TankConstructionsteelTank_institute;
                if(!TankConstructionsteelTank_institute1.equals("")){ %>
                 <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionsteelTank_institute" /></td></tr>
                 <%} %>
                 <bean:define id="TankConstructionFiberReinforced" name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionFiberReinforced" />
                 <%String TankConstructionFiberReinforced1 =""+TankConstructionFiberReinforced;
                 if(!TankConstructionFiberReinforced1.equals("")){%>
                 <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionFiberReinforced" /></td></tr>
                 <%} 
                 %>
                 <bean:define id="TankConstructionCathodicallyProtected" name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionCathodicallyProtected" />
                 <%String TankConstructionCathodicallyProtected1 = ""+TankConstructionCathodicallyProtected;
                 if(!TankConstructionCathodicallyProtected1.equals("")){%>
                  <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionCathodicallyProtected" /></td></tr>
                  <%} %>
                  <bean:define id= "TankConstructionOther" name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionOther" />
                  <%String TankConstructionOther1 = ""+TankConstructionOther;
                  if(!TankConstructionOther1.equals("")){%>
                  <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionOther" /></td></tr>
                  <%} %>
                  <bean:define id="TankConstructionFiberGlass" name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionFiberGlass" />
                  <%String  TankConstructionFiberGlass1 = ""+TankConstructionFiberGlass;
                  if(!TankConstructionFiberGlass1.equals("")){%>
                  <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionFiberGlass" /></td></tr>
                  <%} %>
                  <bean:define id="TankConstructionWeldedSteel" name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionWeldedSteel" />
                   <%String TankConstructionWeldedSteel1 = ""+TankConstructionWeldedSteel;
                   if(!TankConstructionWeldedSteel1.equals("")){%>
                   <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionWeldedSteel" /></td></tr>
                   <%} %>
                   <bean:define id="TankConstructionPlastic" name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionPlastic" />
                   <%String TankConstructionPlastic1=""+TankConstructionPlastic;
                   if(!TankConstructionPlastic1.equals("")){%>
                    <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionPlastic" /></td></tr>
                    <%} %>
                    <bean:define id="TankConstructionVaulted" name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionVaulted" />
                    <%String TankConstructionVaulted1= ""+TankConstructionVaulted;
                    if(!TankConstructionVaulted1.equals("")){%>
                     <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankConstructionVaulted" /></td></tr>
                     <%} %>
 
                 </table> </td>
                 <td class="ColValue" width="7%"><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankWallType" /></td>
                 <td class="ColValue" width="15%"><table width="40%">
                 <bean:define id="TankContentsNewOil" name="tankListArray" property="Object::Quote::Location::Tank::TankContentsNewOil" />
                 <%String TankContentsNewOil1 = ""+TankContentsNewOil;
                 if(!TankContentsNewOil1.equals("")){%>
					<tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankContentsNewOil" /></td></tr>
				<%} %>
				<bean:define id="TankContentsWasteOil" name="tankListArray" property="Object::Quote::Location::Tank::TankContentsWasteOil" />
				<%String TankContentsWasteOil1 = ""+TankContentsWasteOil;
				if(!TankContentsWasteOil1.equals("")){%>
                 <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankContentsWasteOil" /></td></tr>
                 <%} %>
                 <bean:define id="TankContentsHeatingOil" name="tankListArray" property="Object::Quote::Location::Tank::TankContentsHeatingOil" />
                 <%String TankContentsHeatingOil1=""+TankContentsHeatingOil;
                 if(!TankContentsHeatingOil1.equals("")){%>
                 	<tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankContentsHeatingOil" /></td></tr>
                 <%} %>
                 <bean:define id="Tank_contentsDeisel" name="tankListArray" property="Object::Quote::Location::Tank::Tank_contentsDeisel" />
                 <%String Tank_contentsDeisel1 = ""+Tank_contentsDeisel;
                 if(!Tank_contentsDeisel1.equals("")){ %>
                  <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::Tank_contentsDeisel" /></td></tr>
                  <%} %>
                  <bean:define id="TankContentsKerosene" name="tankListArray" property="Object::Quote::Location::Tank::TankContentsKerosene" />
                  <%String TankContentsKerosene1 = ""+TankContentsKerosene; 
                  if(!TankContentsKerosene1.equals("")){%>
                  <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankContentsKerosene" /></td></tr>
                  <%} %>
                  <bean:define id="TankContentsPropene" name="tankListArray" property="Object::Quote::Location::Tank::TankContentsPropene" />
                 <%String TankContentsPropene1=""+TankContentsPropene;
                 if(!TankContentsPropene1.equals("")){%> 
                  <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankContentsPropene" /></td></tr>
                  <%} %>
                  <bean:define id="TankContentsJetfuel" name="tankListArray" property="Object::Quote::Location::Tank::TankContentsJetfuel" />
                  <%String TankContentsJetfuel1= ""+TankContentsJetfuel;
                  if(!TankContentsJetfuel1.equals("")){%>
                   <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankContentsJetfuel" /></td></tr>
                   <%} %>
                   <bean:define id="TankContentsAntifreeze" name="tankListArray" property="Object::Quote::Location::Tank::TankContentsAntifreeze" />
                   <%String TankContentsAntifreeze1 = ""+TankContentsAntifreeze;
                   if(!TankContentsAntifreeze1.equals("")){%>
                    <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankContentsAntifreeze" /></td></tr>
                    <%} %>
                    <bean:define id="TankContentsOthers" name="tankListArray" property="Object::Quote::Location::Tank::TankContentsOthers" />
                    <%String TankContentsOthers1= ""+TankContentsOthers; 
                    if(!TankContentsOthers1.equals("")){%>
                     <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankContentsOthers" /></td></tr>
                     <%} %>
                     <bean:define id="TankContentsUnleadedGas" name="tankListArray" property="Object::Quote::Location::Tank::TankContentsUnleadedGas" />
                     <%String TankContentsUnleadedGas1 = ""+TankContentsUnleadedGas;
                     if(!TankContentsUnleadedGas1.equals("")){%>
 					<tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankContentsUnleadedGas" /></td></tr>
 					<%} %>
 					<bean:define id="TankContentsGasoline" name="tankListArray" property="Object::Quote::Location::Tank::TankContentsGasoline" />
 					<%String TankContentsGasoline1 = ""+TankContentsGasoline; 
 					if(!TankContentsGasoline1.equals("")){%>
                     <tr><td><bean:write name="tankListArray" property="Object::Quote::Location::Tank::TankContentsGasoline" /></td></tr>
                     <%} %>
                 </table>
                 </td>
                 </tr>
               </logic:iterate>
               </logic:present>
               
               
               </table>
			<p>&nbsp;</td>
		</tr>
	</table>
	</div>
	</td>
	</tr>
	</table>
	
<br class="clear" />

		 
		 <dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />						
		<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>
	

		 <% if(request.getAttribute("SubmissionVerIdUpdated")!=null){

				String submissionVerId = ""+request.getAttribute("SubmissionVerIdUpdated"); %>
				<html:hidden property="answer(Object::Submission::SubmissionVerId)" value='<%=""+submissionVerId%>' styleId="newSubmissionVerId" />
		<% }%>
		
		<logic:present name='locationListArray'>
		
		<html:hidden property="answer(NewLocatiomName)" value='<%=""+newLocName%>' styleId="newLocationNameAssigned" />
		</logic:present>
		
		<logic:present name='locationListArraySize'>
		<html:hidden property="answer(locationSize)" value='<%=""+locationSize%>' styleId="locationSizeUpdated" />
		<html:hidden property="answer(locationId)" value='<%=""+locId1%>' styleId="locIdUpdated" />
		
		</logic:present>
		
		<logic:present name='ASTSpecQuestionMap'>
		<%com.dms.ejb.data.QuestionHashMap specMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("ASTSpecQuestionMap");
			String spccInPlace = specMap.getString("Object::Quote::Location::AST::SpccPlanInPlance");
			String astTankAssociated = specMap.getString("Object::Quote::Location::AST::TankAssociated");
						
			if(!spccInPlace.equals("") && !astTankAssociated.equals("")){ %>
				
				<html:hidden property="answer(ASTSpecQuestion)" value='Y' styleId="ASTSpecQuestionAdded" />
				
		<%	} %>
			
		</logic:present>
		
		<logic:present name='USTSpecQuestionMap'>
		<%com.dms.ejb.data.QuestionHashMap specMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("USTSpecQuestionMap");
						
			String USTPlanToRemoveRisk = specMap.getString("Object::Quote::Location::UST::PlanRemoveRisk");
			String USTTankRemoved = specMap.getString("Object::Quote::Location::UST::TankRemoved");

			if(!USTPlanToRemoveRisk.equals("") && USTTankRemoved.equals("")){%>
				<html:hidden property="answer(USTSpecQuestion)" value='Y' styleId="USTSpecQuestionAdded" />
				
		<%	}
		%>
		</logic:present>
		</div>