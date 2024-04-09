<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<style type="text/css">

BODY
{
    FONT-WEIGHT: normal;
    FONT-SIZE: 0px;
    MARGIN: 0px;
    WORD-SPACING: normal;
    TEXT-TRANSFORM: none;
    COLOR: #000000;
    FONT-FAMILY: Verdana, Helvetica, sans-serif;
    LETTER-SPACING: normal;
    BACKGROUND-COLOR: white
}

</style>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>

<script type="text/javascript">

var url1 = "/savePolicyEILRiskApplicationAction.go?";

</script>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />  
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />

<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script> 
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>

<script type="text/javascript" src="../Scripts/prototype.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/LocationTank/EndorsementQuoteLocationTank.js"></script>

<script type="text/javascript">
function conformRemoveAction(frm,thisBttn,actionName){
   var removeAction = window.confirm("Are you sure you want to continue?");
  if(removeAction){
  	if(removeObject!=null && removeObject!=undefined){
  		removeObject=true;
  		//alert(removeObject);
  		Ajaxsubmit(frm,'Remove',actionName);
  		
  		//YAHOO.example.container.dialog2.cancel();
  	}
   
  }
   
}
</script>
</head>
<bean:parameter id="custId" name="answer(Object::Customer::CustomerId)" />
<bean:parameter id="locationId" name="answer(Object::Location::LocationId)" />
<bean:parameter id="locationName" name="answer(Object::Location::LocationName)" />

<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=custId+""%>' styleId="custId" />
<html:hidden property="answer(Object::Location::LocationId)" value='<%=locationId+""%>' styleId="locationId" />
<html:hidden property="answer(Object::Location::LocationName)" value='<%=locationName+""%>' styleId="locationName" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=ownerId+""%>' styleId="ownerId" />
<html:hidden property="answer(Object::Activity::ownerId)" value='<%=ownerId+""%>' />
<html:hidden property="answer(Object::Activity::ActivityMsg)" value='<%="Added Location through Endorsement"%>' />
<html:hidden property="answer(Object::Activity::ActivityType)" value='<%="Location/Tank - Add/Remove"%>' />

<html:hidden property="answer(Object::Activity::CreatedBy)" value='<%=""+userId%>' />

<%	String isRenewal = "";
	if(request.getParameter("isRenewal") != null) {
		isRenewal = request.getParameter("isRenewal"); 
	}
%>

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
<bean:define id="FamilyId" name="AddRisk" property="answer(FamilyId)" scope="request"/>
<bean:define id="paretQuoteStatus" name="AddRisk" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="parentQuoteId" property="answer(ParentQuoteId)" name="AddRisk" />	
<bean:define id="parentQuoteVerId" property="answer(ParentQuoteVerId)" name="AddRisk" />		
<bean:define id="agencyId" property="answer(Object::Agency::AgencyId)" name="AddRisk" />		
<bean:define id="subQuoteVerId" property="answer(subQuoteVerId)" name="AddRisk" />		

<html:hidden property="answer(parentQuoteId)" value='<%=parentQuoteId+""%>' styleId="parentQuoteId" />
<html:hidden property="answer(subQuoteVerId)" value='<%=subQuoteVerId+""%>' styleId="subQuoteVerId" />
<html:hidden property="answer(FamilyId)" value='<%=FamilyId+""%>' styleId="FamilyId" />
<html:hidden property="answer(parentQuoteVerId)" value='<%=parentQuoteVerId+""%>' styleId="parentQuoteVerId" />		
<html:hidden property="answer(productVerId)" value='<%=productVerId+""%>' styleId="productVerId" />		
<html:hidden property="answer(productVerId2)" value='<%=productVerId+""%>' styleId="ProductVerId" />
<html:hidden property="answer(subQuoteId)" value='<%=subQuoteId+""%>' styleId="subQuoteId" />		
<html:hidden property="answer(customerId)" value='<%=customerId+""%>' styleId="customerId" />		
<html:hidden property="answer(productId)" value='<%=productId+""%>' styleId="productId" />
<html:hidden property="answer(groupId)" value='<%=groupId+""%>' styleId="groupId" />
<html:hidden property="answer(groupVerId)" value='<%=groupVerId+""%>' styleId="groupVerId" />
<html:hidden property="answer(productStatus)" value='<%=productStatus+""%>' styleId="productStatus" />	
<%
String paretQuoteStatus11 = ""+paretQuoteStatus;
if(paretQuoteStatus11.equals("In Progress") || paretQuoteStatus11.equals("Referred")){ %>
<html:hidden property="answer(IsApplicationDisabled)" value='<%="Y"%>' styleId="IsApplicationDisabled" />
<%}else{ %>
<html:hidden property="answer(IsApplicationDisabled)" value='<%="N"%>' styleId="IsApplicationDisabled" />
<% }%>

<html:hidden property="answer(agencyId)" value='<%=agencyId+""%>' styleId="agencyId" />
<html:hidden property="answer(paretQuoteStatus)" value='<%=paretQuoteStatus+""%>' styleId="parentQuoteStatus1" />

<bean:define id="policyNumber" name="AddRisk" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="parentPolicyId" name="AddRisk" property="answer(Object::Policy::ParentPolicyId)" scope="request"/> 
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />

<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value='<%=policyVerId+""%>' styleId="policyVerId1" />
<html:hidden property="answer(Object::Policy::ParentPolicyId)" value='<%=parentPolicyId+""%>' styleId="parentPolicyId1" />		
<html:hidden property="answer(Object::Quote::PolicyNumber)" value='<%=policyNumber+""%>' styleId="policyNumber1" />
<html:hidden property="answer(Object::Quote::QuoteStatus)" value='<%=""+paretQuoteStatus%>' styleId="paretQuoteStatus" />

<%String applicationEnabled = "N"; %>
	<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
	<%applicationEnabled = "Y";%>
	</dmshtml:dms_isPresent>
<html:hidden property="answer(Object::Location::LocationId)" value='<%=locId+""%>' styleId="locId" />		
<%String paretQuoteStatus1 = ""+paretQuoteStatus; %>
<%if(paretQuoteStatus1.equals("")){
	
	applicationEnabled = "Y";
}%>
	<table width="100%">
	
		
	
<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0" bgcolor="#C6DEEA">
				<tr>
					<td>
						<div id="QuoteInsuerdAgencyAgentHeader">
							<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
							<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
							</jsp:include>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" colspan=2>
			<table width="100%" align="left" border="0" >
				<tr>
				<%if(isRenewal.equals("true")) { %>
					<td class="NewSectionHead" align="center">RENEWAL DETAIL</td>
				<%} else { %>
					<td class="NewSectionHead" align="center">ENDORSEMENT DETAIL</td>
				<%} %>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr height="5">
		<td></td>
	</tr>
	<tr>
		<td colspan="2">
				<%if(isRenewal.equals("true")) { %>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
					</jsp:include>
				<%} else { %>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
					</jsp:include>
				<%} %>
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
</td>
 </tr>
	<tr>
		<td>
		&nbsp;		
		</td>	
	</tr>		
	<tr>
		<td class="links">
			<%if(isRenewal.equalsIgnoreCase("true")) { %>
				<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Return to Renewal Quote Summary</a>
			<%} else { %>
				<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Return to Endorsement Quote Summary</a>
			<%} %>
		</td>
	</tr>		
	<tr>
		<td>
		&nbsp;		
		</td>	
	</tr>				
</table>
<div class="container">


<div>&nbsp;</div>
<div>&nbsp;</div>
<div class="EndorsementPage">

<div align="right">
<table border="0"  width="99%" id="table11"  cellspacing="0" cellpadding="0">
	<tr>
		<td>
	     <table border="0" cellpadding="0" cellspacing="0" id="table12">
	     <dmshtml:dms_isPresent negated="true" property="<%=new String[]{"In Progress","Referred"}%>" value="<%=paretQuoteStatus.toString()%>">														
	       <tr id="divide11" align="right">
	        <a href="javascript:void(0);" class="button2" style="width:100px" onclick="javascript:appendtable();">Add Location</a>
			</tr>
		</dmshtml:dms_isPresent>
		</table>
	   </td>        
	</tr>
</table>
</div>
<%String bgcolor = "";
if(request.getParameter("answer(bgcolor)") !=null){
	 bgcolor = ""+request.getParameter("answer(bgcolor)");
}


%>
<div align="left" >
	<table border="0"   width="99%"  id="table2" cellspacing="0" cellpadding="0">
		<tr>
			<td>
     <table border="0"  cellpadding="0" cellspacing="0" id="table6">
       <tr id="divide1" align="left">
         <td   border="0" width="150px" cellspacing="0" cellpadding="0" class="todotab_active" height=35 id="LocationSchedule" onclick="javascript:showLocationList(this.id);">Location Schedule 
					(<%="0"%>)
		</td>
				</tr>
			</table>
         </td>
        
        
       </tr>
     </table>
 	<div id="LocList"  align="left" >
		<table border="0" width="99%"  id="table2" cellspacing="0" cellpadding="0">
		<tr>
			<td class="todotab_yellowbox tab_yellowborder" >

<div>&nbsp;</div>
			<table border="0" cellpadding="5" cellspacing="0"  width="98%" class="datadispborder" align=center id="Loc3TableData" >
               <tr>
                 
                 <td>
                 	<div id="LocationList1" class="locformbox1"></div>
                 </td>
                 
                 
               </tr>
               </table>
               
			<p>&nbsp;
			</td>
		</tr>
		</table>
		</div>
		
	<div id="AddLocationDiv" style="display:none;">
	
			<div class="formpage1">
          	<div class="content">
				<div class="formhead"><h2 class="left">Add Location</h2></div>      
  					<h3>Location Information</h3>

				<div id="AddLocationDiv1"  ></div>
			</div>
			</div>
		
	</div>

	<div id="LocationAndTanksList" style="display:none;" class="todotab_yellowbox tab_yellowborder"></div>
</div>
</div>
</div>

<form name="form1" id="formid1">
<div id="addTankDiv">
	<table>
		<tr>
			<td>
				&nbsp;
			</td>
		</tr>
	
			<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
			
			<tr>
				<td>
				
				
				</td>
			</tr>
		
			
			</dmshtml:dms_isPresent>
		</table>
</div>
	<table>
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
		<td>
	
 				<p>	<span id="messageHoldernew1" style="{z-index: 1000; background:red; color:white; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span></p>
		
		</td>
	</tr>
</table>
<div id="AddTankDialog" style="display:none;">
	<div class="hd">Please enter Tank Information

	</div>
	<div class="bd">

	<table>
	
		<tr>
	
			<td class="FormLabels" align="left">Tank Type</td>
			
			<td>
				<select class="txtbox" name="answer(Object::Risk::RiskType__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_TYPE)" id="RiskSelection" >	
					<option value =''>Select</option>	
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
			<td class="FormLabels" align="left"> 
			  Tank Name
			</td>
			<td>
			  <input type="textbox" name="answer(Object::Risk::RiskName__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_NAME)" size="60" id="tankname" />
			</td>
			
			
		</tr>
		
		<td class="FormLabels" align="left"> 
			  Tank Description
			</td>
			<td>
			 <textarea rows="4" cols="50" 
			 id="LocationDescription" height="4" width="30" maxlength="100" 
			 name="answer(Object::Location::LocationDescription__DMS_SUBMISSION_LOCATION~LOCATION_DESCRIPTION)" >
			 </textarea>
			</td>
		<tr>
		<td class="Links">
		&nbsp;&nbsp;<html:button  property="answer()" styleId="SubmitRisk" onclick="AddRisk1();" value="Add Tank"/>
		</td>
		<td class="Links">
		&nbsp;<html:button  property="answer()" styleId="CancelRisk" value="Cancel"/>
		</td>
	
		</tr>
	</table>
</div>
<a class="container-close" href="javascript:void(0);" id="closeIcon1"></a>

</div>
<script>
function showFormName(formname){


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



<!-- Div for Pop-up -->





<script>
YAHOO.namespace("example.container");

YAHOO.util.Event.onDOMReady(init);
function init() {

	//NULL implementation to fix a javascript error
}
</script>

<script>
var addIndex;

 function createTabView(addIndex){
 
 var AddApplicationScript = new YAHOO.widget.TabView('AddApplicationScript'+addIndex);
 
 }

  
</script>

<script>

locationNamePresent=true;

	isSpecificValidationNeeded = true;
	
function doSpecificValidation(frm){
	if(frm.name == "Location"){
		if(frm.Use_of_Facility.value==""){
  
  			alert("Please select Use Of Facility");
			return false;
  
  		}
	
		if(!frm.Owner_Type[0].checked && !frm.Owner_Type[1].checked){
			alert('Please select Owned or Leased');
			return false;
		}
		
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

/* Commented for bug #14571
 var location = ""+document.getElementById("locationName").value;
if(location.toString()!="NO"){
	
	getQuoteTanksinLocation();
	
}else if(location.toString()=="NO"){
	appendtable();
}*/

	
	loadEndorsementQuoteLocationList1();
	getLocationListSize();
	loadTankPopUp();
	function getLocationListSize(){
	
			var subQuoteId1 = document.getElementById("subQuoteId").value;
       	var subQuoteVerId1 = document.getElementById("subQuoteVerId").value;
       	
      	var riskTerritory1 = "";
      	var customerId1 = document.getElementById("custId").value;
      	var agencyId1 = document.getElementById("agencyId").value;
      	var prodId1 = document.getElementById("productId").value;
      	var productVerId1 = document.getElementById("productVerId").value;
      	var GroupId1 = document.getElementById("groupId").value
      	
      	var ownerId1 = document.getElementById("ownerId").value;
      	var GroupVerId1 = document.getElementById("groupVerId").value;
      	var parentQuoteId1 = document.getElementById("parentQuoteId").value;
      	var productStatus1 = document.getElementById("productStatus").value;
      	var CustomerState1 = document.getElementById("custState").value;

      	var ProductFamilyId1 = document.getElementById("FamilyId").value;

      	var parentQuoteVerId1 = document.getElementById("parentQuoteVerId").value;
		
      	autologout();       
		var url = "/getEndorsementQuoteLocationListUI3.do"
		var pars2 = "customerId="+customerId1+
        "&answer(Object::Customer::CustomerId)="+customerId1+
        "&answer(Object::Agency::AgencyId)="+agencyId1+
        "&answer(prdGroupVerId)="+GroupVerId1+
        "&answer(productStatus)="+productStatus1+
        "&answer(Object::Risk::ComProperty::CustomerId)="+customerId1+
        "&answer(parentQuoteId)="+parentQuoteId1+
        "&parentQuoteId="+parentQuoteId1+
        "&answer(subQuoteId)="+subQuoteId1+
        "&answer(QuoteId)="+subQuoteId1+
        "&answer(Object::Customer::CustomerId)="+customerId1+"&answer(Object::Agency::AgencyId)="+agencyId1+
        "&answer(FamilyId)="+ProductFamilyId1+"&answer(parentQuoteVerId)="+parentQuoteVerId1+
        "&answer(Object::Quote::PrevSubQuoteVerId)="+subQuoteVerId1;
        
        new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){
	 
	 },onSuccess: function(transport){
	 
	 	document.getElementById("LocationSchedule").innerHTML = "Location Schedule("+transport.responseText+")";
	 	var location = ""+document.getElementById("locationName").value;
	 	if(location.toString()!="NULL"){
	 		
	 		getQuoteTanksinLocation();
	 		
	 	}else if(location.toString()=="NULL"){
	 		appendtable();
	 	}
	 }});
        
        
	
	}
	 function getQuoteTanksinLocation(){
		 var locName =""+document.getElementById("locationName").value+"";
		 var locId = document.getElementById("locationId").value;
			var locString = new String(locName);
			locString = locString.replace(/ /g,"%20");
			locString = locString.replace(/'/g,"___");
						
			getQuoteTanksWithLocation(locId,locString);
	 }
	
	
	function loadEndorsementQuoteLocationList1(){

 	    YAHOO.example.XHR_Text = function() {
    
	 var formatUrl = function(elCell, oRecord, oColumn, sData) {        
	 			var locName = "'"+oRecord.getData("LocationName")+"'";
	 			var locString = new String(locName);
	 			locString = locString.replace(/ /g,"%20");
	 			locString = locString.replace(/&#39;/g,"___");
	 			var onclickscript = "getQuoteTanksWithLocation("+oRecord.getData("LocationId")+","+locString+")";
             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";             
             
        };
        
	   var moreColumnDefs = [
            {key:"Number", resizable:"true",width:40,sortable:true},
            {key:"Location Name", resizable:"true", formatter:formatUrl,width:100,sortable:true},
            {key:"Address Line 1",  resizable:"true",width:80},
            {key:"Address Line 2", resizable:"true",width:80},
            {key:"City", resizable:"true",width:90},
            {key:"State",  resizable:"true",width:70},
            {key:"Zip",  resizable:"true",width:70},
            {key:"UST",  resizable:"true",width:40,sortable:true},
            {key:"AST",  resizable:"true",width:40,sortable:true}
        ];
        
       	var subQuoteId1 = document.getElementById("subQuoteId").value;
       	var subQuoteVerId1 = document.getElementById("subQuoteVerId").value;
       	
      	var riskTerritory1 = "";
      	var customerId1 = document.getElementById("custId").value;
      	var agencyId1 = document.getElementById("agencyId").value;
      	var prodId1 = document.getElementById("productId").value;
      	var productVerId1 = document.getElementById("productVerId").value;
      	var GroupId1 = document.getElementById("groupId").value
      	
      	var ownerId1 = document.getElementById("ownerId").value;
      	var GroupVerId1 = document.getElementById("groupVerId").value;
      	var parentQuoteId1 = document.getElementById("parentQuoteId").value;
      	var productStatus1 = document.getElementById("productStatus").value;
      	var CustomerState1 = document.getElementById("custState").value;
      	
      	var ProductFamilyId1 = document.getElementById("FamilyId").value;
      	
      	var parentQuoteVerId1 = document.getElementById("parentQuoteVerId").value;
		var parameters="answer(IsApplicationDisabled)=Y&customerId="+customerId1+
	        "&answer(Object::UserDetail::ownerId)="+ownerId1+
	        "&answer(Object::Customer::CustomerId)="+customerId1+
	        "&answer(Object::Agency::AgencyId)="+agencyId1+
	        "&answer(objectId)="+prodId1+
	        "&answer(objectVerId)="+productVerId1+
	        "&answer(objectName)=PRODUCT&answer(prdGroupId)="+GroupId1+
	        "&answer(prdGroupVerId)="+GroupVerId1+
	        "&answer(productStatus)="+productStatus1+
	        "&answer(teritory)=&answer(riskTerritory)="+riskTerritory1+
	        "&answer(territoryName)=&answer(zone)=&answer(state)=&answer(showOnetTab)=Y&tabNo=0&answer(Object::Customer::State)="+CustomerState1+
	        "&answer(Object::Risk::ComProperty::CustomerId)="+customerId1+
	        "&answer(parentQuoteId)="+parentQuoteId1+
	        "&parentQuoteId="+parentQuoteId1+
	        "&answer(subQuoteId)="+subQuoteId1+
	        "&answer(QuoteId)="+subQuoteId1+
	        "&answer(Object::Customer::CustomerId)="+customerId1+"&answer(Object::Agency::AgencyId)="+agencyId1+
	        "&answer(FamilyId)="+ProductFamilyId1+"&answer(parentQuoteVerId)="+parentQuoteVerId1+
	        "&answer(Object::Quote::PrevSubQuoteVerId)="+subQuoteVerId1;
      autologout();       
       var anotherDataSource = new YAHOO.util.DataSource("../getQuoteLocationListUI3.do");
       anotherDataSource.connMethodPost=true;
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Number","Location Name","Address Line 1","Address Line 2","City","State","Zip","UST","AST","LocationId","LocationName"]
        };

        
        // Configuration for Pagination
        var myConfigs = {   
                initialRequest:parameters,
                generateRequest:parameters,
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  	
        
        var myDataTableY = new YAHOO.widget.DataTable("LocationList1", moreColumnDefs,anotherDataSource,myConfigs);  
	
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
 
 
 }		
	
		
</script>
<script type="text/javascript" src="../Scripts/JScripts/AddTank.js"></script>

<script type="text/javascript">
	var a = document.getElementById('priorpolicyheadernav');
	if((a != null) && (a != undefined))
		a.id = 'policyheadernav';
</script>

<!-- <SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/RiskApplication.js">
</script> -->
