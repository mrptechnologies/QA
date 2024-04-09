<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/YahooDragDown.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>

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

<bean:define id="locId" property="answer(Object::Location::LocationId)" name="AddRisk" />		
<bean:define id="IsApplicationDisabled" property="answer(IsApplicationDisabled)" name="AddRisk" />	
<bean:define id="groupId" property="answer(prdGroupId)" name="AddRisk" />		
<bean:define id="groupVerId" property="answer(prdGroupVerId)" name="AddRisk" />		
<bean:define id="productStatus" property="answer(productStatus)" name="AddRisk" />		
<bean:define id="productId" property="answer(productId)" name="AddRisk" />		
<bean:define id="productVerId" property="answer(productVerId)" name="AddRisk" />		
<bean:define id="customerId" property="answer(CustomerId)" name="AddRisk" />		
<bean:define id="subQuoteId" property="answer(subQuoteId)" name="AddRisk" />

<bean:define id="parentQuoteId" property="answer(ParentQuoteId)" name="AddRisk" />	
<bean:define id="parentQuoteVerId" property="answer(ParentQuoteVerId)" name="AddRisk" />		
<bean:define id="agencyId" property="answer(Object::Agency::AgencyId)" name="AddRisk" />		
<html:hidden property="answer(parentQuoteId)" value='<%=parentQuoteId+""%>' styleId="parentQuoteId" />
<html:hidden property="answer(parentQuoteVerId)" value='<%=parentQuoteVerId+""%>' styleId="parentQuoteVerId" />		
<html:hidden property="answer(productVerId)" value='<%=productVerId+""%>' styleId="productVerId" />		
<html:hidden property="answer(subQuoteId)" value='<%=subQuoteId+""%>' styleId="subQuoteId" />		
<html:hidden property="answer(customerId)" value='<%=customerId+""%>' styleId="customerId" />		
<html:hidden property="answer(productId)" value='<%=productId+""%>' styleId="productId" />
<html:hidden property="answer(groupId)" value='<%=groupId+""%>' styleId="groupId" />
<html:hidden property="answer(groupVerId)" value='<%=groupVerId+""%>' styleId="groupVerId" />
<html:hidden property="answer(productStatus)" value='<%=productStatus+""%>' styleId="productStatus" />		
<html:hidden property="answer(IsApplicationDisabled)" value='<%=IsApplicationDisabled+""%>' styleId="IsApplicationDisabled" />
<html:hidden property="answer(agencyId)" value='<%=agencyId+""%>' styleId="agencyId" />
<bean:define id="policyNumber" name="AddRisk" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="parentPolicyId" name="AddRisk" property="answer(Object::Policy::ParentPolicyId)" scope="request"/> 
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />

<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value='<%=policyVerId+""%>' styleId="policyVerId1" />
<html:hidden property="answer(Object::Policy::ParentPolicyId)" value='<%=parentPolicyId+""%>' styleId="parentPolicyId1" />		
<html:hidden property="answer(Object::Quote::PolicyNumber)" value='<%=policyNumber+""%>' styleId="policyNumber1" />
<%
	
	String ApplicationStatus = ""+IsApplicationDisabled;
	String applicationEnabled = "N";
	if(IsApplicationDisabled.equals("N")){
		applicationEnabled = "Y";
		
	}

%>
<html:hidden property="answer(Object::Location::LocationId)" value='<%=locId+""%>' styleId="locId" />		


	<table width="100%">
	
		
	
<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0" bgcolor="#C6DEEA">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" colspan=2>
			<table width="100%" align="left" border="0" >
				<tr>
					<td class="NewSectionHead" align="center">ENDORSEMENT DETAIL</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr height="5">
		<td></td>
	</tr>
	<tr>
		<td colspan="2">
		
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
					</jsp:include>
				</td>
	</tr>		
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
			<td align="left">
				<jsp:include page="../common/EndorsementQuoteHeader.jsp">
					<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
				</jsp:include>
			</td>
		</tr>
<tr>
<td>

<table width="100%" align="left" border="0">
							<tr>
									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC='../Images/wrong_small.jpg' BORDER='0' ALT='All Mandatory Field- NOT Filled'>&nbsp; -&nbsp; Incomplete Application. Needs further information. Please click on these tabs and complete the Application.
									</td>
								</tr>
								
								
								
								<tr>
									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC='../Images/right_small.jpg' BORDER='0' ALT='All Mandatory Field- Filled/No Mandatory Field'>&nbsp; - &nbsp;All mandatory questions are answered. Please click on these tabs to verify and confirm.
									</td>
								</tr>

 
 </table>

</td>
 </tr>
	<tr>
		<td>
		&nbsp;		
		</td>	
	</tr>		
	<tr>
		<td class="links">
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
		</td>
		<%-- <td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td> --%>
	</tr>		
	<tr>
		<td>
		&nbsp;		
		</td>	
	</tr>				
</table>
	<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
	objectVerId="0" objectName='<%="LOCATION"%>' applicationType="LOCATION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/savePolicyEILRiskApplicationAction.go?" isApplicationEnabled='<%="Y" %>'  showOneTabAtTime="N"/>
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
		
			<!-- <html:button styleId="showRiskPopup"  value="Add Tank" property="AddRisks" /> -->
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



<dmshtml:DisplayApplicationObjectList nameInSession="Application1"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName='<%=""%>' applicationType="RISK" applicationSubType="" objectType='<%="RISK" %>' isSubApplicationCoveredByForm="Yes"  actionName="/savePolicyEILRiskApplicationAction.go?TabPanelName=Quote_Panel" isApplicationEnabled='<%="Y"%>'  showOneTabAtTime="N"/>
<logic:present name="Application1" scope="request">

<bean:define id="htmlPage1" name="Application1"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage1.toString());%>
</logic:present>
<logic:notPresent name="Application1" scope="request">
<!-- <html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		
-->
</logic:notPresent>



<!-- Div for Pop-up -->

<div id="dialog1">
<div class="hd">Please enter Tank Tnformation</div>
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
	 
	 	YAHOO.example.container.dialog1.cancel();
	 	
	 })
	 
}

YAHOO.util.Event.onDOMReady(init);
</script>

<script>
var addIndex;
function addRisk(){

	
	var labelText = document.getElementById("tankname").value;	
	var objectId = 0;
	var objectVerId =0;
	var repeatedSubApplicationID = 159;
	var objectName = document.getElementById("RiskSelection").value;
	var objectType = 'QUOTE_RISK';
	var applicationType = 'RISK';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	var ComPropertyId = -1;
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("custId").value;
	var atsSpecId = -1;
	var AppType = 'YUI'
	var actionName = '/savePolicyEILRiskApplicationAction.go?TabPanelName=Quote_Panel';
	//var BusinessTypeSelection = document.getElementById("BusinessTypeSelection").value;
	var locationId=document.getElementById("locId").value;
	var recalculateneed = 'recalculate'
	var objAppType = "QUOTE_APPLICATION";
	var RiskName = document.getElementById("tankname").value;
	
	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	var productStatus = document.getElementById("productStatus").value;
	var productId     = document.getElementById("productId").value;
	var groupId       = document.getElementById("groupId").value;
	var groupVerId    = document.getElementById("groupVerId").value;
	var custId        = document.getElementById("customerId").value;
	var subQuoteId    = document.getElementById("subQuoteId").value;
	var productVerId  = document.getElementById("productVerId").value;
	var policyId = document.getElementById("parentPolicyId1").value;
	var policyVerId = document.getElementById("policyVerId1").value;
	var policyNumber = document.getElementById("policyNumber1").value;
	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var agencyId = document.getElementById("agencyId").value;
	if(addIndex == undefined || addIndex == null){
	addIndex = 0;
	}
	var panelName = 'Quote_Panel';
	labelText = objectName+"-"+labelText;
	 addIndex = addIndex+1;
	//alert("addIndex"+addIndex)
	createTabView(addIndex);
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(repeatedSubApplicationID_ToLoad)='+repeatedSubApplicationID+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+applicationSubType+
	'&answer(IsSubApplicationCoveredByForm)='+IsSubApplicationCoveredByForm+'&answer(State)='+State+'&answer(riskTerritory)='+riskTerritory+
	'&answer(zone)='+zone+'&answer(Object::Risk::RiskId)='+ComPropertyId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+
	'&addedAppIndex='+addIndex+'&answer(Object::Risk::ComProperty::CustomerId)='+custId+'&answer(Object::Application::ApplicationType)='+objAppType+
	'&answer(TabPanelName)='+panelName+'&answer(recalculateneeded)='+recalculateneed+'&answer(IsApplicationDisabled)='+IsApplicationDisabled+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(prdGroupId)='+groupId+'&answer(prdGroupVerId)='+groupVerId+'&answer(productStatus)='+productStatus+'&answer(productId)='+productId+'&answer(productVerId)='+productVerId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+customerId+'&answer(SubQuoteId)='+subQuoteId+
	'&answer(Object::AST::SpecificQuestion::ASTSpecificQuestionId)='+atsSpecId+'&answer(SystemGeneratedNumber_Object::AST::TankNo__DMS_PROP_QUOTE_VER_PLAN_RISK_STORAGETANK_DETAIL~RISK_NUM)= '+
	'&answer(Object::Risk::RiskName__DMS_PROP_QUOTE_VER_PLAN_RISK_STORAGETANK_DETAIL~RISK_NAME)='+RiskName+'&answer(Object::Risk::RiskType__DMS_PROP_QUOTE_VER_PLAN_RISK_STORAGETANK_DETAIL~RISK_TYPE)='+objectName+
	'&answer(Object::UST::TankContents__DMS_PROP_QUOTE_VER_PLAN_RISK_STORAGETANK_DETAIL~TANK_CONTENTS)=Diesel'+'&answer(PrimaryKey_ParentQuoteId)='+parentQuoteId+'&answer(APP_TAB_TYPE)='+AppType+
	'&answer(PrimaryKey_Object::Location::LocationId)='+locationId+'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Policy::ParentPolicyVerId)='+policyVerId+'&answer(Object::Policy::ParentPolicyId)='+policyId+'&answer(Object::Quote::PolicyNumber)='+policyNumber+
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
	
	ApplicationForScript.addTab( new YAHOO.widget.Tab({ label: labelText,content:data.responseText,cacheData: false,active:true}) );
}
  
</script>





<!-- <SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/RiskApplication.js">
</script> -->