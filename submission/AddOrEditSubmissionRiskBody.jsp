<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/container/assets/skins/sam/container.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>


<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>


<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
	
<bean:parameter id="custId" name="answer(Object::Customer::CustomerId)" />
<bean:define id="locationId" property="answer(Object::Location::LocationId)" name="AddRisk" />	
<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=custId+""%>' styleId="custId" />
<html:hidden property="answer(Object::Location::LocationId)" value='<%=locationId+""%>' styleId="locationId" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=ownerId+""%>' styleId="ownerId" />
<html:hidden property="answer(pagename)" value='<%="Edit Location"%>' styleId="ownerId" />

<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=ownerId+""%>' styleId="ownerIdfrmjsp" />
<dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							
<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>

<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>	
<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=custId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	    detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	%>
</logic:present>

<html:hidden property="answer(custState)" value='<%=detail.getCustomerState()%>' styleId="custState" />
<html:hidden property="answer(custCity)" value='<%=detail.getMCity()%>' styleId="custCity" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMCounty()%>' styleId="custCounty" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMZip()%>' styleId="custZip" />
<html:hidden property="answer(custStName)" value='<%=detail.getStreetName()%>' styleId="custStName" />
<html:hidden property="answer(custStNo)" value='<%=detail.getStreetNumber()%>' styleId="custStNo" />
<html:hidden property="answer(custAdd2)" value='<%=detail.getMAddress2()%>' styleId="custAdd2" />
<html:hidden property="answer(custAdd1)" value='<%=detail.getMAddress1()%>' styleId="custAdd1" />


<bean:define id="submissionInsuredId" property="answer(Object::Submission::InsuredId)" name="AddRisk" />	
<bean:define id="submissionId" property="answer(Object::Submission::SubmissionId)" name="AddRisk" />	
<bean:define id="submissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="AddRisk" />	
<bean:define id="agencyId" property="answer(Object::Agency::AgencyId)" name="AddRisk" />	

	
<html:hidden property="answer(Object::Submission::InsuredId)" value='<%=submissionInsuredId+""%>' styleId="submissionInsuredId" />		
<html:hidden property="answer(Object::Submission::SubmissionId)" value='<%=submissionId+""%>' styleId="submissionId" />		
<html:hidden property="answer(Object::Submission::SubmissionVerId)" value='<%=submissionVerId+""%>' styleId="submissionVerId" />		

		<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
		<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				
				<tr>
					<td valign="top">
						<table width="100%" align="Left" border="0"bgcolor="#C6DEEA" >
							<tr>
								<td>
									<jsp:include page="../common/SubmissionInsuredAgencyLinksPage.jsp" />
								</td>
							</tr>
						</table>
					</td>
				</tr>				
			</table>
			</logic:notEqual>												
			
			<table>
							<tr>
								<td align="left">
									&nbsp;
								</td>
							</tr>
			</table>
			
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
								
								<tr>
									<td class="NewSectionHead" colspan="4" align="center">EDIT LOCATION </td>
								</tr>
								
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								
								
							</table>
							
							<table>
							<%
								String submissionStatus =  "";
								String isAppEnabled="Y";
							 %>
							<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=custId.toString()%>" submissionId='<%=""+submissionId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
							<logic:present name="customerDetail1" scope="request">
 						
							<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
							<%		submissionStatus = customerDetailMap.getString("custStatus");
										
							%>
							<tr>
								<td  class="links" align="left">
									<a href="../GetSubmissionLocationList1.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)=<%=""+submissionId %>&answer(Object::Submission::SubmissionStatus)=<%=""+submissionStatus%>&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerId %>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Submission::InsuredId)=<%=""+custId %>&answer(requestForm)=Submission&customerId=<%=""+custId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=""+custId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+custId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""+detail.getCustomerState() %>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=""%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+custId%>&answer(Object::Submission::LOBId)=<%=""%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO"
										 title="Click here to Show all the Locations" />Locations</a>
	
								</td>
								<td  class="links" align="left">
									<a href="../GetSubmissionLocationList3.0.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)=<%=""+submissionId %>&answer(Object::Submission::SubmissionStatus)=<%=""+submissionStatus%>&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerId %>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Submission::InsuredId)=<%=""+custId %>&answer(requestForm)=Submission&customerId=<%=""+custId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=""+custId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+custId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""+detail.getCustomerState() %>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=""%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+custId%>&answer(Object::Submission::LOBId)=<%=""%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO"
										 title="Click here to Show all the Locations" />Locations 3.0</a>
	
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td class="links" align="right">
									
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								
			<% 
			
			if(submissionStatus.equalsIgnoreCase("Lapsed") || submissionStatus.equalsIgnoreCase("Declined")) {
				isAppEnabled="N";
			}%>
		
	</logic:present>
<html:hidden property="answer(Object::Submission::SubmissionStatus)" value='<%=submissionStatus+"" %>' styleId="submissionStatus1"/>
				<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=""+submissionStatus%>" negated="true" >
													
																							
								<td colspan="20" class="links" >	<a href="../submissioninsured/RegisterSubmission.jsp?answer(state)=<%=""+detail.getCustomerState() %>&answer(TabPanelName)=Submission_Panel&answer(Object::Submission::LOBId)=<%=""%>&answer(Object::Submission::SubmissionId)=<%=""+submissionId %>&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerId %>&answer(Object::Submission::InsuredId)=<%=""+custId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%> " id="Submit_Comp_Application"/>
										<html:button styleClass="linkButtonBig" property="answer(submitComp)" value="Submit Completed Application" onclick="window.location=document.getElementById('Submit_Comp_Application')"/>
									</a>
								</td>
								</dmshtml:dms_isPresent>
								<td>
								</td>
							</tr>
								
								
								
								

 
 </table>
	
 <table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp;
		</td>
		<td>
			&nbsp;
		</td>
		<td>
			&nbsp;
		</td>
	</tr>
</table>

<!-- <table>
	<tr>
		<td class="error">
			<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="MultipleZipError" disabled="disabled" property="answer(temp)" value="Test Error Message Fro Zip Code" styleClass="txtbox" readonly="true" size="60" maxlength="60" />
		</td>
	</tr>
</table> -->
<div id="MadatoryApplicationDiv" style="display:block">
<table>
							<tr>
									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;<IMG id = "wrongImg" SRC='../Images/wrong_small.jpg' BORDER='0' ALT='All Mandatory Field- NOT Filled'>&nbsp; -&nbsp; Incomplete Application. Needs further information. Please click on these tabs and complete the Application.
									</td>
								</tr>
								
								
								<tr>
									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC='../Images/right_small.jpg' BORDER='0' ALT='All Mandatory Field- Filled/No Mandatory Field'>&nbsp; - &nbsp; All mandatory questions are answered. Please click on these tabs to verify and confirm.
									</td>
								</tr>

 
 </table>
</div>
<form name="form1" id="formid1">
<table>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<dmshtml:dms_isPresent property="<%=new String[]{"Declined","Lapsed"}%>" value="<%=""+submissionStatus %>" negated="false" >
	<dmshtml:get_all_business_types nameInSession="businessTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />							
	<bean:define id="businessTypeList" name="businessTypeList" type="java.util.ArrayList"/>
	<tr>
	
	<td>
		<div id="BusinessType" style="display: none;">
		<select class="txtbox" name="answer(Object::Risk::BusinessType__DMS_RISK~BUSINESS_TYPE)" id="BusinessTypeSelection" >	
				<%
				if(businessTypeList!=null){
					for(int i=0;i<businessTypeList.size();i++) {
						com.dms.ejb.data.QuestionHashMap businessTypeMap=(com.dms.ejb.data.QuestionHashMap)businessTypeList.get(i);	
						
				%>
					<%String businessType=businessTypeMap.getString("Object::Risk::BusinessTypeName");%>
					<option value ='<%=businessType%>'></option>											
					<%}
				}%>	 																																				
			</select>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<html:button styleId="showRiskPopup" onclick="document.getElementById('tankname').value=''"  value="Add Tank" property="AddRisks" />
		</td>
	</tr>
	</dmshtml:dms_isPresent>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	
	<tr>
		<td>
	
 <p>	<span id="messageHoldernew" style="{z-index: 1000; background:red; color:white; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span></p>
		
		</td>
	</tr>
</table>
<script>
function showFormName(formname){
alert(formname.id)

}

</script>
</form>
<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName='<%="LOCATION"%>' applicationType="LOCATION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveSubmissionLocationApplicationAction.go?" isApplicationEnabled='<%=""+isAppEnabled %>'  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>
<logic:notPresent name="Application" scope="request">
<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

</logic:notPresent>

<%
if(locationId!=null){
	if((""+locationId).length()>0){
		com.dms.ejb.data.QuestionHashMap applicationMap= new com.dms.ejb.data.QuestionHashMap();		
		applicationMap.put("Object::Location::LocationId",""+locationId);
		request.setAttribute("PrimaryKeyMap",applicationMap);
	}
}
%>

<dmshtml:DisplayApplicationObjectList nameInSession="Application1"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName='<%=""%>' applicationType="RISK" applicationSubType="" objectType='<%="SUBMISSION"%>' isSubApplicationCoveredByForm="Yes"  actionName="/saveSubmissionRiskApplicationAction.go?TabPanelName=Submission_Panel" isApplicationEnabled='<%=""+isAppEnabled %>'  showOneTabAtTime="N"/>
<logic:present name="Application1" scope="request">

<bean:define id="htmlPage1" name="Application1"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage1.toString());%>
</logic:present>
<logic:notPresent name="Application1" scope="request">
<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

</logic:notPresent>




<!-- Div for Pop-up -->

<div id="dialog1">
<div class="hd">Please enter Tank Information</div>
<div class="bd">


<table>

	<tr>

		<td width="42%" class="FormLabels" align="left">Tank Type</td>
		
		<td><select class="txtbox" name="answer(Object::Risk::RiskType__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_TYPE)" id="RiskSelection" >	
							
 									
								
										<%
										if(riskTypeList!=null){
											for(int i=0;i<riskTypeList.size();i++) {
												com.dms.ejb.data.QuestionHashMap riskTypeMap=(com.dms.ejb.data.QuestionHashMap)riskTypeList.get(i);	
										%>
														
											<%String riskType=riskTypeMap.getString("Object::Risk::RiskTypeName");%>
											<%String riskTypeDesc=riskTypeMap.getString("Object::Risk::RiskTypeDesc");%>
											<option value ='<%=riskType%>'><%=riskTypeDesc %></option>											
											<%}
										}%>	 																												
								</select>
		
		
		
		</td>
		<td>
		
  </td>

		
	</tr>
	<tr>
		
		<td>
		  &nbsp;
		</td>
	</tr>
	<tr>
		<td width="42%" class="FormLabels" align="left"> 
		  Tank Name
		</td>
		<td>
		  <input type="textbox" name="answer(Object::Risk::RiskName__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_NAME)" size="60" id="tankname" />
		</td>
	</tr>
	<tr>	
	<td>
	&nbsp;
	</td>
	</tr>
	<tr>
	<td class="Links">
	&nbsp;&nbsp;<html:button  property="answer()" styleId="SubmitRisk" value="Add Tank"/>
	</td>
	<td class="Links">
	&nbsp;<html:button  property="answer()" styleId="CancelRisk" value="Cancel"/>
	</td>
	
	
	</tr>
</table>

</div>
</div>





<script>
YAHOO.namespace("example.container");

function init() {
	
	// Define various event handlers for Dialog
	var handleSubmit = function() {
		alert("Inside the handleSubmit");
		this.cancel();
		
			
	};
	var handleCancel = function() {
		this.cancel();
	};
	var handleSuccess = function(o) {
		var response = o.responseText;
		response = response.split("<!")[0];
		document.getElementById("resp").innerHTML = response;
	};
	var handleFailure = function(o) {
		alert("Submission failed: " + o.status);
	};

	// Instantiate the Dialog
	YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("dialog1", 
							{ width : "40em",
							  fixedcenter : true,
							  visible : false, 
							  constraintoviewport : true,
							  buttons : [ { text:"Submit", handler:handleSubmit },
								      { text:"Cancel", handler:handleCancel } ],
								      close: true,modal:true
							});

	// Validate the entries in the form to require that both first and last name are entered
	YAHOO.example.container.dialog1.validate = function() {
		var data = this.getData();
		if (data.tankname == "" ) {
			alert("Please enter the Tank Name");
			return false;
		} else {
			return true;
		}
	};

	// Wire up the success and failure handlers
	YAHOO.example.container.dialog1.callback = { success: handleSuccess,
						     failure: handleFailure };
	
	// Render the Dialog
	YAHOO.example.container.dialog1.render();

	YAHOO.util.Event.addListener("showRiskPopup", "click", YAHOO.example.container.dialog1.show, YAHOO.example.container.dialog1, true);
	YAHOO.util.Event.addListener("hide", "click", YAHOO.example.container.dialog1.hide, YAHOO.example.container.dialog1, true);
	
	 Event = YAHOO.util.Event;
	 //Event for submit risk
	 Event.on('SubmitRisk', 'click', function(e) {
	 	
	 	
	 	
		var data =  document.getElementById("tankname").value;	
		if (data == "" ) {
			alert("Please enter the Tank Name");
			
		} else {
		addRisk();
			YAHOO.example.container.dialog1.cancel();
		}
		 	
	 	
	 })
	 //Event for Cancel risk
	 Event.on('CancelRisk', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog1.cancel();
	 	
	 })
	 
}

YAHOO.util.Event.onDOMReady(init);
</script>

<script>
var addIndex;
function addRisk(){

	
	var labelText = document.getElementById("tankname").value;	
	
	var wrongImg = document.getElementById("wrongImg").innerHtml;
	//labelText = labelText+wrongImg;
	var objectId = 0;
	var objectVerId =0;
	var repeatedSubApplicationID = 159;
	var objectName = document.getElementById("RiskSelection").value;
	var objectType = 'SUBMISSION';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'RISK';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	//var SelectedRiskType = 'COMMERCIAL AUTO';
	var ComPropertyId = -1;
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("custId").value;
	var atsSpecId = -1;
	var AppType = 'YUI'
	var actionName = '/saveSubmissionRiskApplicationAction.go?TabPanelName=Submission_Panel';
	var BusinessTypeSelection = "";
	var BusinessTypeSelection = document.getElementById("BusinessTypeSelection").value;
	//alert("BusinessTypeSelection"+BusinessTypeSelection)
	var locationId=document.getElementById("locationId").value;
	var submissionStatus = document.getElementById("submissionStatus1").value;
	if(document.Location.LocationId.value==null || document.Location.LocationId.value==undefined ) {
		if(document.Location.LocationId.length>0) {
			
			if(document.Location.LocationId[0].value!=-1){
			locationId =document.Location.LocationId[0].value;
			} else if(document.Location.LocationId[1].value!=-1){
				locationId =document.Location.LocationId[1].value;
			}
		}
	}else{
	
		
		locationId = document.Location.LocationId.value;
	}
	if(document.getElementById("locationId").value =="-1" || document.getElementById("locationId").value=="" || document.getElementById("locationId").value=="0"){
		document.getElementById("locationId").value=locationId;
	}
	
	labelText = objectName+"-"+labelText;
	var submissionInsuredId = document.getElementById("submissionInsuredId").value;
	var submissionId = document.getElementById("submissionId").value;
	
	if(document.Location.SubmissionId.value==null || document.Location.SubmissionId.value==undefined ) {
		if(document.Location.SubmissionId.length>0) {
			
			if(document.Location.SubmissionId[0].value!=-1){
			submissionId =document.Location.SubmissionId[0].value;
			} else if(document.Location.SubmissionId[1].value!=-1){
				submissionId =document.Location.SubmissionId[1].value;
			}
		}
	}else{
	
		
		submissionId = document.Location.SubmissionId.value;
	}
	if(document.getElementById("submissionId").value =="-1" || document.getElementById("submissionId").value=="" || document.getElementById("submissionId").value=="0"){
		document.getElementById("submissionId").value=submissionId;
	}
	var submissionVerId = document.getElementById("submissionVerId").value;

	var panelName = 'Submission_Panel';
	var RiskName = encodeURIComponent(document.getElementById("tankname").value);
	var storageTankId ='-1';
	if(addIndex == undefined || addIndex == null){
	addIndex = 0;
	}
	 addIndex = addIndex+1;
	//alert("addIndex"+addIndex)
	createTabView(addIndex);
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(repeatedSubApplicationID_ToLoad)='+repeatedSubApplicationID+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+applicationSubType+
	'&answer(IsSubApplicationCoveredByForm)='+IsSubApplicationCoveredByForm+'&answer(State)='+State+'&answer(riskTerritory)='+riskTerritory+
	'&answer(zone)='+zone+'&answer(Object::Risk::RiskId)='+ComPropertyId+'&answer(TabPanelName)='+panelName+
	'&addedAppIndex='+addIndex+'&answer(Object::Submission::InsuredId)='+submissionInsuredId+
	'&answer(Object::Risk::BusinessType__DMS_SUBMISSION_RISK_STORAGE_TANK~BUSINESS_TYPE)='+BusinessTypeSelection+
	'&answer(Object::AST::SpecificQuestion::ASTSpecificQuestionId)='+atsSpecId+'&answer(SystemGeneratedNumber_Object::AST::TankNo__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_NUM)= '+
	'&answer(Object::Risk::RiskName__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_NAME)='+RiskName+'&answer(Object::Risk::RiskType__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_TYPE)='+objectName+
	'&answer(Object::UST::TankContents__DMS_SUBMISSION_RISK_STORAGE_TANK~TANK_CONTENTS)=Diesel'+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+submissionInsuredId+'&answer(APP_TAB_TYPE)='+AppType+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+
	'&answer(PrimaryKey_Object::Location::LocationId)='+locationId+'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+'&answer(Object::Submission::SubmissionVerId)='+submissionVerId+'&answer(Object::Customer::SubmissionVerId)='+submissionVerId+
	'&answer(Object::Location::Risk::StorageTankId)='+storageTankId+'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus;
	
	//alert(pars1);
	var url = '../addTabApplication.do?'+pars1;	
		
	 new Ajax.Request(url, {method: 'post',onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){showTab(transport,labelText);}});


}

 function createTabView(addIndex){
 
 var AddApplicationScript = new YAHOO.widget.TabView('AddApplicationScript'+addIndex);
 
 }
function showTab(data,labelText,addIndex){

	//alert("done"+data.responseText)
	
	ApplicationForScript.addTab( new YAHOO.widget.Tab({ label: labelText,content:data.responseText,cacheData: false,active: true }) );
}

function conformRemoveAction(){
   var removeAction = window.confirm("Are you sure you want to continue?");
  if(removeAction){
  	if(removeObject!=null && removeObject!=undefined){
  		removeObject=true;
  	}
   return true;
  }else {
   return false;
  }
   
}
  
</script>


<script>
	
	isSpecificValidationNeeded = true;
	
	function doSpecificValidation(frm){
		if(document.Location.Use_of_Facility.value==""){
  
  			alert("Please select Use Of Facility");
			return false;
  
  		}
	
		if(!document.Location.Owner_Type[0].checked && !document.Location.Owner_Type[1].checked){
			alert('Please select Owned or Leased');
			return false;
		}
		
				
			if(frm.name!="Location"){		
			if(doValidateTank(frm)){
				return true;
			}else{
				return false;
			}
		}
		
		
		return true;
	}

		
</script>

<script type="text/javascript" src="../Scripts/JScripts/AddTank.js"></script>
<!-- <SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/RiskApplication.js">
</script> -->