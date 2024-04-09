<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%response.setHeader("Cache-Control", "no-store");%>
<%System.out.println("Entered"); %>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>
<bean:parameter name="answer(Object::Submission::SubmissionStatus)" id="SubmissionStatus" />
<%String subStatus = ""+SubmissionStatus; %>
<%String newLocName="";
                 String locationSize="";
                 String locId1 = "";
                 if(request.getAttribute("LocationListSize")!=null){                
                	 locationSize = ""+request.getAttribute("LocationListSize");
                 }%>
  	<div class="locformpage">
	<%if(subStatus.equals("In Progress")){ %>

		<div class="locformhead"><span class="step">1</span><span class="stepHd">Location Name and Address&nbsp;<a href="javascript:void(0);" onclick="getEditLocationPopUp()" title="<bean:message key='ToolTip.LocationsandTanks.EditLocation'/>">[Edit]</a> </span></div>
	<%}else{%>
		<div class="locformhead"><span class="step">1</span><span class="stepHd">Location Name and Address&nbsp;<a href="javascript:void(0);" onclick="getEditLocationPopUp()"></a> </span></div>
	<%}%>
	<div class="locformbox1">        
		<logic:present name='locationListArray'>
		   <logic:iterate id="locationListArray" name="locationListArray" >	
		   <bean:define id="newLocName1"  property="Object::Location::LocationName" name="locationListArray" />
			<div><a href="javascript:void(0);" onclick="getEditLocationPopUp()"></a>
			<div class="infobox left"><h3>Number</h3>
			<a href="javascript:void(0);" onclick="getEditLocationPopUp()" title="<bean:message key='ToolTip.LocationsandTanks.LocationNumber'/>">
			<bean:write name="locationListArray" property="Object::Location::LocationNumber" />
			</a>
			</div>
			<div class="infobox left"><h3>Location Name</h3>
			<a href="javascript:void(0);" onclick="getEditLocationPopUp()" title="<bean:message key='ToolTip.LocationsandTanks.LocationName'/>">
			
			<bean:write property="Object::Location::LocationName" name="locationListArray" />
			</a>
			</div>
			<bean:define id="LocationAddress1" name="locationListArray" property="Object::Location::LocationAddress1" />
			<bean:define id="LocationAddress2" name="locationListArray" property="Object::Location::LocationAddress2" />
			<%String strLocationAddress1 =""+LocationAddress1; %>
			<%String strLocationAddress2 =""+LocationAddress2; %>
			<div class="infobox2 left"><h3>Address Line 1</h3><bean:write  name="locationListArray" property="Object::Location::LocationAddress1" /></div>
			<div class="infobox2 left"><h3>Address Line 2</h3><bean:write name="locationListArray" property="Object::Location::LocationAddress2" /></div>
			<div class="infobox2 left"><h3>City</h3><bean:write name="locationListArray" property="Object::Location::LocationCity" /></div>
			<div class="infobox2 left"><h3>State</h3><bean:write name="locationListArray" property="Object::Location::LocationState" /></div>
			<div class="infobox2 left"><h3>Zip</h3><bean:write name="locationListArray" property="Object::Location::LocationZip" /></div>
			
			
			
			
		         
		          <bean:define id="NewlocId"  property="Object::Location::LocationId" name="locationListArray" />
		         <%locId1=""+NewlocId; %>
		          <%newLocName =""+newLocName1 ;%>
				<html:hidden property="answer(LocId)" value='<%=locId1 %>' styleId="LocationIdForPopUp"/>	                 
			</logic:iterate>
		</logic:present>
</div>
<br/>

<br class="clear" />
<div>

		
		<logic:present name='SpecificQuestionMap'>
		<%com.dms.ejb.data.QuestionHashMap specMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("SpecificQuestionMap");
			String spccInPlace = specMap.getString("Object::Submission::Location::SpecificQuestion::SpccPlanInPlace");
			String astTankAssociated = specMap.getString("Object::Submission::Location::SpecificQuestion::TankAssociated");
			
			String USTPlanToRemoveRisk = specMap.getString("Object::Submission::Location::SpecificQuestion::PlanRemoveRisk");
			String ASTTankAssociated = specMap.getString("Object::Submission::Location::SpecificQuestion::TankAssociated");
			
			if(!spccInPlace.equals("")){ %>
				
				<a href="javascript:void(0);" onclick="editSpecificQuestions('AST');" title="<bean:message key='ToolTip.LocationsandTanks.ASTQuestions'/>" class="locbutton3 left">View/Edit AST Specific Questions</a>
				
		<%	}
			if(!USTPlanToRemoveRisk.equals("")){%>
				<a href="javascript:void(0);" onclick="editSpecificQuestions('UST');" title="<bean:message key='ToolTip.LocationsandTanks.USTQuestions'/>" class="locbutton3 left">View/Edit UST Specific Questions</a>
				
		<%	}
		%>
		</logic:present>



</div>
<br class="clear" />
<br class="clear" />

<div class="locformhead1"><span class="step">2</span><span class="stepHd">Tank List</span></div>
<div class="locformbox1"><br />

<%if(subStatus.equals("In Progress")){ %>
<a href="javascript:void(0);" onclick="document.getElementById('RiskSelection').value='';document.getElementById('tankname').value='';document.getElementById('LocationDescription').value='';document.getElementById('dialog1').style.display = 'block';YAHOO.example.container.dialog1.show();"  title="<bean:message key='ToolTip.LocationsandTanks.AddTank'/>" class="locbutton2">Add A Tank</a>
<%} %>

<table class="loctable" cellpadding="0" cellspacing="0">

<tr><th><a>Number</a></th><th><a>Tank Name</a></th><th><a>Type</a></th><th><a>Year Installed</a></th><th><a>Capacity</a></th><th><a>Construction</a></th><th><a>SW/DW</a></th><th><a>Contents</a></th></tr>
<tr><td colspan="8" height="25pt"><logic:notPresent name='tankListArray'>No tanks entered yet.Add atleast one tank for this location </logic:notPresent></td></tr>
 <logic:present name='tankListArray'>
 <%int i=0; %>
                 <logic:iterate id="tankListArray" name="tankListArray" >	
                 <bean:define id="TankRiskId" name="tankListArray" property="Object::Location::Tanks::StorageTankId" />
                 <bean:define id="RiskType" name="tankListArray" property="Object::Location::Tanks::RiskType" />
                 
                 <% String tankRiskId1 = ""+TankRiskId;;
                 String RiskType1=""+RiskType;
                 i++;                
                 %>           
                
               			<tr>
               	
                  <td>
                  <a href="javascript:void(0);" onclick="geteditRiskPopUp('<%=tankRiskId1%>','<%=RiskType1%>')"  title="<bean:message key='ToolTip.LocationsandTanks.TankNumber'/>"><bean:write name="tankListArray" property="Object::Location::Tanks::RiskNumber" /></a></td>
                 <td >
                 <a href="javascript:void(0);" onclick="geteditRiskPopUp('<%=tankRiskId1%>','<%=RiskType1%>')" title="<bean:message key='ToolTip.LocationsandTanks.TankName'/>">
                 <bean:write name="tankListArray" property="Object::Location::Tanks::RiskName" />
                 </a>
                 </td>
                 <td ><bean:write name="tankListArray" property="Object::Location::Tanks::RiskType" /></td>
                 <td ><bean:write name="tankListArray" property="Object::Location::Tanks::YearInstalled" /></td>
                 <td ><bean:write name="tankListArray" property="Object::Location::Tanks::TankCapacity" /></td>
                 <td ><table width="70%">
                 
                 <bean:define id="TankConstructionCoatedOrBareSteel" name="tankListArray" property="Object::Location::Tank::TankConstructionCoatedOrBareSteel" />
                 <%String TankConstructionCoatedOrBareSteel1 = ""+TankConstructionCoatedOrBareSteel ; 
                 	if(!TankConstructionCoatedOrBareSteel1.equals("")){%>
					<tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructionCoatedOrBareSteel" /></td></tr>
				<%} %>	
                 
                 <bean:define id="TankConstructioncladSteel" name="tankListArray" property="Object::Location::Tank::TankConstructioncladSteel" />
                 <%String TankConstructioncladSteel1 = ""+TankConstructioncladSteel ; 
                 	if(!TankConstructioncladSteel1.equals("")){%>
					<tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructioncladSteel" /></td></tr>
				<%} %>	
				<bean:define id="TankConstructionsteelTank_institute"  name="tankListArray" property="Object::Location::Tank::TankConstructionsteelTank_institute" />
                <%String TankConstructionsteelTank_institute1 = ""+TankConstructionsteelTank_institute;
                if(!TankConstructionsteelTank_institute1.equals("")){ %>
                 <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructionsteelTank_institute" /></td></tr>
                 <%} %>
                 <bean:define id="TankConstructionFiberReinforced" name="tankListArray" property="Object::Location::Tank::TankConstructionFiberReinforced" />
                 <%String TankConstructionFiberReinforced1 =""+TankConstructionFiberReinforced;
                 if(!TankConstructionFiberReinforced1.equals("")){%>
                 <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructionFiberReinforced" /></td></tr>
                 <%} 
                 %>
                 <bean:define id="TankConstructionCathodicallyProtected" name="tankListArray" property="Object::Location::Tank::TankConstructionCathodicallyProtected" />
                 <%String TankConstructionCathodicallyProtected1 = ""+TankConstructionCathodicallyProtected;
                 if(!TankConstructionCathodicallyProtected1.equals("")){%>
                  <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructionCathodicallyProtected" /></td></tr>
                  <%} %>
                  <bean:define id= "TankConstructionOther" name="tankListArray" property="Object::Location::Tank::TankConstructionOther" />
                  <%String TankConstructionOther1 = ""+TankConstructionOther;
                  if(!TankConstructionOther1.equals("")){%>
                  <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructionOther" /></td></tr>
                  <%} %>
                  <bean:define id="TankConstructionFiberGlass" name="tankListArray" property="Object::Location::Tank::TankConstructionFiberGlass" />
                  <%String  TankConstructionFiberGlass1 = ""+TankConstructionFiberGlass;
                  if(!TankConstructionFiberGlass1.equals("")){%>
                  <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructionFiberGlass" /></td></tr>
                  <%} %>
                  <bean:define id="TankConstructionWeldedSteel" name="tankListArray" property="Object::Location::Tank::TankConstructionWeldedSteel" />
                   <%String TankConstructionWeldedSteel1 = ""+TankConstructionWeldedSteel;
                   if(!TankConstructionWeldedSteel1.equals("")){%>
                   <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructionWeldedSteel" /></td></tr>
                   <%} %>
                   <bean:define id="TankConstructionPlastic" name="tankListArray" property="Object::Location::Tank::TankConstructionPlastic" />
                   <%String TankConstructionPlastic1=""+TankConstructionPlastic;
                   if(!TankConstructionPlastic1.equals("")){%>
                    <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructionPlastic" /></td></tr>
                    <%} %>
                    <bean:define id="TankConstructionVaulted" name="tankListArray" property="Object::Location::Tank::TankConstructionVaulted" />
                    <%String TankConstructionVaulted1= ""+TankConstructionVaulted;
                    if(!TankConstructionVaulted1.equals("")){%>
                     <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructionVaulted" /></td></tr>
                     <%} %>
 
                 </table> </td>
                 <td ><bean:write name="tankListArray" property="Object::Location::Tank::TankWallType" /></td>
                 <td ><table width="40%">
                 <bean:define id="TankContentsNewOil" name="tankListArray" property="Object::Location::Tank::TankContentsNewOil" />
                 <%String TankContentsNewOil1 = ""+TankContentsNewOil;
                 if(!TankContentsNewOil1.equals("")){%>
					<tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsNewOil" /></td></tr>
				<%} %>
				<bean:define id="TankContentsWasteOil" name="tankListArray" property="Object::Location::Tank::TankContentsWasteOil" />
				<%String TankContentsWasteOil1 = ""+TankContentsWasteOil;
				if(!TankContentsWasteOil1.equals("")){%>
                 <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsWasteOil" /></td></tr>
                 <%} %>
                 <bean:define id="TankContentsHeatingOil" name="tankListArray" property="Object::Location::Tank::TankContentsHeatingOil" />
                 <%String TankContentsHeatingOil1=""+TankContentsHeatingOil;
                 if(!TankContentsHeatingOil1.equals("")){%>
                 	<tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsHeatingOil" /></td></tr>
                 <%} %>
                 <bean:define id="Tank_contentsDeisel" name="tankListArray" property="Object::Location::Tank::Tank_contentsDeisel" />
                 <%String Tank_contentsDeisel1 = ""+Tank_contentsDeisel;
                 if(!Tank_contentsDeisel1.equals("")){ %>
                  <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::Tank_contentsDeisel" /></td></tr>
                  <%} %>
                  <bean:define id="TankContentsKerosene" name="tankListArray" property="Object::Location::Tank::TankContentsKerosene" />
                  <%String TankContentsKerosene1 = ""+TankContentsKerosene; 
                  if(!TankContentsKerosene1.equals("")){%>
                  <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsKerosene" /></td></tr>
                  <%} %>
                  <bean:define id="TankContentsPropene" name="tankListArray" property="Object::Location::Tank::TankContentsPropene" />
                 <%String TankContentsPropene1=""+TankContentsPropene;
                 if(!TankContentsPropene1.equals("")){%> 
                  <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsPropene" /></td></tr>
                  <%} %>
                  <bean:define id="TankContentsJetfuel" name="tankListArray" property="Object::Location::Tank::TankContentsJetfuel" />
                  <%String TankContentsJetfuel1= ""+TankContentsJetfuel;
                  if(!TankContentsJetfuel1.equals("")){%>
                   <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsJetfuel" /></td></tr>
                   <%} %>
                   <bean:define id="TankContentsAntifreeze" name="tankListArray" property="Object::Location::Tank::TankContentsAntifreeze" />
                   <%String TankContentsAntifreeze1 = ""+TankContentsAntifreeze;
                   if(!TankContentsAntifreeze1.equals("")){%>
                    <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsAntifreeze" /></td></tr>
                    <%} %>
                    <bean:define id="TankContentsOthers" name="tankListArray" property="Object::Location::Tank::TankContentsOthers" />
                    <%String TankContentsOthers1= ""+TankContentsOthers; 
                    if(!TankContentsOthers1.equals("")){%>
                     <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsOthers" /></td></tr>
                     <%} %>
                     <bean:define id="TankContentsUnleadedGas" name="tankListArray" property="Object::Location::Tank::TankContentsUnleadedGas" />
                     <%String TankContentsUnleadedGas1 = ""+TankContentsUnleadedGas;
                     if(!TankContentsUnleadedGas1.equals("")){%>
 					<tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsUnleadedGas" /></td></tr>
 					<%} %>
 					<bean:define id="TankContentsGasoline" name="tankListArray" property="Object::Location::Tank::TankContentsGasoline" />
 					<%String TankContentsGasoline1 = ""+TankContentsGasoline; 
 					if(!TankContentsGasoline1.equals("")){%>
                     <tr><td><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsGasoline" /></td></tr>
                     <%} %>
                 </table>
                 </td>
               </tr>
               </logic:iterate>
               </logic:present>

</table>

</div>
</div>
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
		
		<logic:present name='LocationListSize'>
		<html:hidden property="answer(locationSize)" value='<%=""+locationSize%>' styleId="locationSizeUpdated" />
		<html:hidden property="answer(locationId)" value='<%=""+locId1%>' styleId="locIdUpdated" />
		
		</logic:present>
		
		<logic:present name='SpecificQuestionMap'>
		<%com.dms.ejb.data.QuestionHashMap specMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("SpecificQuestionMap");
			String spccInPlace = specMap.getString("Object::Submission::Location::SpecificQuestion::SpccPlanInPlace");
			String astTankAssociated = specMap.getString("Object::Submission::Location::SpecificQuestion::TankAssociated");
			
			String USTPlanToRemoveRisk = specMap.getString("Object::Submission::Location::SpecificQuestion::PlanRemoveRisk");
			String ASTTankAssociated = specMap.getString("Object::Submission::Location::SpecificQuestion::TankAssociated");
			
			if(!spccInPlace.equals("")){ %>
				
				<html:hidden property="answer(ASTSpecQuestion)" value='Y' styleId="ASTSpecQuestionAdded" />
				
		<%	}
			if(!USTPlanToRemoveRisk.equals("") && ! ASTTankAssociated.equals("")){%>
				<html:hidden property="answer(USTSpecQuestion)" value='Y' styleId="USTSpecQuestionAdded" />
				
		<%	}
		%>
		</logic:present>
		