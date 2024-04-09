<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>



<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/prototype.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/YahooDragDown.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>


<link rel="stylesheet" type="text/css"
	href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css"
	href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"
	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css"
	href="../styles/yahoo/2.4.1/build/container/assets/skins/sam/ModifiedContainer.css" />

<script type="text/javascript"
	src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript"
	src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>

<script type="text/javascript">
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
</head>
<bean:parameter id="custId" name="answer(Object::Customer::CustomerId)" />
<bean:parameter id="locationId" name="answer(Object::Location::LocationId)" />

<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=custId+""%>' styleId="custId" />
<html:hidden property="answer(Object::Location::LocationId)" value='<%=locationId+""%>' styleId="locationId" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=ownerId+""%>' styleId="ownerId" />

<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=ownerId+""%>' styleId="ownerIdfrmjsp" />
<dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />

<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>

<bean:define id="locId" property="answer(Object::Location::LocationId)" name="AddRisk" />	
<bean:define id="agencyId" property="answer(Object::Agency::AgencyId)" name="AddRisk" />	
	
<html:hidden property="answer(Object::Location::LocationId)" value='<%=locId+""%>' styleId="locId" />	
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


	
	<table WIDTH="880px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				<tr>
					<td valign="top">
						<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
							<tr>
								<td>
									<jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
						
						<table WIDTH="880px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				<tr>
					<td valign="top">
						
					</td>
				</tr>
			</table>
			
			<table>
							<tr>
								<td align="left">
									&nbsp;
								</td>
							</tr>
			</table>
			
			<table WIDTH="1000px" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
								<tr>
								
								<tr>
									<td class="NewSectionHead" colspan="4" align="center">EDIT LOCATION</td>
								</tr>
								
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								
								
							</table>
							
							<table>
							<tr>
									<td>
										<a href="../GetAllQuotes.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::Customer::State)=<%=""%>" title="Click to go to Quotes" />Quotes</a> 
									</td>
								</tr>
								
								
								
								

 
 </table>
	
<!-- <table>
	<tr>
		
	</tr>
</table> -->

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
										&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
								
								<tr>
									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC='../Images/right_small.jpg' BORDER='0' ALT='All Mandatory Field- Filled/No Mandatory Field'>&nbsp; - &nbsp; all mandatory questions are answered. Please click on these tabs to verify and confirm.
									</td>
								</tr>
						<tr>
						<td>
						
							<html:button styleId="showRiskPopup" onclick="document.getElementById('tankname').value=''"  value="Add Tank" property="AddRisks" />
						</td>
						</tr>
 
 </table>
</div>

<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName='<%="LOCATION"%>' applicationType="LOCATION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveEILRiskApplicationAction.go?" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>
<logic:notPresent name="Application" scope="request">
<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

</logic:notPresent>
<form name="form1" id="formid1">
<table>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<html:button styleId="showRiskPopup"  value="Add Tank" property="AddRisks" /> 
		</td>
	</tr>
	
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
objectVerId="0" objectName='<%=""%>' applicationType="RISK" applicationSubType="" objectType='<%="RISK" %>' isSubApplicationCoveredByForm="Yes"  actionName="/saveEILRiskApplicationAction.go?TabPanelName=Insured_Panel" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
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
		
		<td><select class="txtbox" name="answer(Object::Risk::RiskType__DMS_RISK~RISK_TYPE)" id="RiskSelection" >	
							
 									
								
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
		  <input type="textbox" name="answer(Object::Risk::RiskName__DMS_RISK~RISK_NAME)" size="60" id="tankname" />
		</td>
	</tr>
	<tr>	
	<td>
	&nbsp;
	</td>
	</tr>
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
								      { text:"Cancel", handler:handleCancel } ]
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
	 	if(document.getElementById("tankname").value == "") {
	 		alert("Plaese Enter Tank Name")
	 	}
	 	else{
	 		addRisk();
	 		document.getElementById("tankname").value="" ;
	 		YAHOO.example.container.dialog1.cancel();
	 	}
	 	
	 	
	 	
	 })
	 //Event for Cancel risk
	 Event.on('CancelRisk', 'click', function(e) {
	 	document.getElementById("tankname").value="" ;
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
	var objectType = 'RISK';
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
	var actionName = '/saveEILRiskApplicationAction.go?TabPanelName=Insured_Panel';
	var BusinessTypeSelection = "";
	var BusinessTypeSelection = document.getElementById("BusinessTypeSelection").value;
	alert("BusinessTypeSelection"+BusinessTypeSelection)
	var locationId=document.getElementById("locId").value;
	labelText = objectName+"-"+labelText;
	
	var panelName = 'Insured_Panel';
	var RiskName = encodeURIComponent(document.getElementById("tankname").value);
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
	'&addedAppIndex='+addIndex+'&answer(Object::Risk::ComProperty::CustomerId)='+custId+
	'&answer(Object::Risk::BusinessType__DMS_RISK~BUSINESS_TYPE)='+BusinessTypeSelection+
	'&answer(Object::AST::SpecificQuestion::ASTSpecificQuestionId)='+atsSpecId+'&answer(SystemGeneratedNumber_Object::AST::TankNo__DMS_RISK~RISK_NUM)= '+
	'&answer(Object::Risk::RiskName__DMS_RISK~RISK_NAME)='+RiskName+'&answer(Object::Risk::RiskType__DMS_RISK~RISK_TYPE)='+objectName+
	'&answer(Object::UST::TankContents__DMS_RISK_STORAGE_TANK~TANK_CONTENTS)=Diesel'+'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(APP_TAB_TYPE)='+AppType+
	'&answer(PrimaryKey_Object::Location::LocationId)='+locationId+'&answer(Object::Location::LocationId)='+locationId+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(actionName)='+actionName+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;
	
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
  
</script>


<script type="text/javascript" src="../Scripts/JScripts/AddTank.js"></script>


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

<!-- <SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/RiskApplication.js">
</script> -->