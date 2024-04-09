<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/Common.js">
</script>

<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript">
function setDefault(frm){

	/**
     * To set the Address1
     */
    
	 if(frm.StreetName!=null && frm.StreetName!= undefined && frm.StreetNumber!=null && frm.StreetNumber!= undefined ) {
	        frm.Address1.value=frm.StreetNumber.value+" "+frm.StreetName.value;
	        
	        
	 }

	return true;
	
}
function conformRemoveAction(){
   
   var removeAction = window.confirm("Are you sure you want to continue?");
  if(removeAction){
   return true;
  }else {
   return false;
  }
   
}
</script>

<bean:define id="TabPanelName1" name="Application" property="answer(TabPanelName)" scope="request" />
<bean:define id="isApplicationEnabled" name="Application" property="answer(isApplicationEnabled)" scope="request" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="IsApplicationDisabled" name="Application" property="answer(IsApplicationDisabled)" />
<bean:define id="Customerid" name="Application" property="answer(Object::Customer::CustomerId)" /> 
<bean:define id="AgencyId" name="Application" property="answer(Agency::AgencyId)" /> 
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="ProposedEffectiveDate1" name="Application" property="answer(Object::Clearance::ProposedEffectiveDate1)" />
<bean:define id="ProposedEffectiveDate" name="Application" property="answer(Object::Clearance::ProposedEffectiveDate)" />
<bean:define property="answer(Object::UserDetail::ownerId)"  name="Application" id="ownerId" />
<bean:define property="answer(Object::Agency::AgencyId)"  name="Application" id="AgencyId" />
<bean:define property="answer(PrimaryKey_Object::Customer::CustomerId)"  name="Application" id="customerId" /><!--
<bean:define property="answer(Object::Risk::ComProperty::CustomerId)"  name="Application" id="Customerid" />
<bean:define property="answer(Object::Customer::CustomerId)"  name="Application"  id="Customerid" />-->


<%
String proposedEffDate= "";
String proposedEffDate1= "";
proposedEffDate = ""+ProposedEffectiveDate;
proposedEffDate1 = ""+ProposedEffectiveDate1;
if(proposedEffDate1.equals("")){
		java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("MM/dd/yyyy");
	  	java.util.Date date = new java.util.Date(); 
	  	proposedEffDate = ""+dateFormat.format(date);
	  	proposedEffDate1 = ""+dateFormat.format(date);
}
  
 %>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(TabPanelName)" value="<%=""+TabPanelName1%>" />
<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate1)" value="<%=""+proposedEffDate1%>" styleId="ProposedEffectiveDate1"/>
<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate)" value="<%=""+proposedEffDate1%>" styleId="ProposedEffectiveDate"/>

<html:hidden property="answer(Object::Clearance::RetroDateFlag)" value="" styleId="RetroDateModifiedFlag"/>
<%
String isApplicationEnabled1 = "N";
if(isApplicationEnabled.equals("N")){
	
	isApplicationEnabled1 = "Y";
}

%>


<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />

<div id='loadercontent1' style="display:none">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	Loading....
	</div>

<html:hidden property="answer(Object::Clearance::RetroDateFlag)" value="" styleId="RetroDateModifiedFlag"/>							
<div class="formpage01">
	<div class="content">							
		<div class="formhead"><h2 class="left">Coverage and Limits</h2></div>						
		<h3>Additional Submission Details</h3>
		<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
		objectVerId="0" objectName='<%="SUBMISSION_REQUESTED_COVERAGES"%>' constructFormAlone='<%=true%>' applicationType="SUBMISSION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveSubmissionRequestedCoveragesAppUI3.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
		<logic:present name="Application" scope="request">
		
		<bean:define id="htmlPage" name="Application"
				type="java.lang.StringBuffer" />
				<%out.println(htmlPage.toString());%>
		</logic:present>
		<logic:notPresent name="Application" scope="request">
		<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		
		
		</logic:notPresent>
		<span id="messageHoldernew" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
	
	
	</div>
</div>
<script type="text/javascript">
isSpecificValidationNeeded = false;
if (document.forms[0].Zip != null && document.forms[0].Zip != undefined){
var zipFromUI = document.forms[0].Zip.value;
}
 tooltipXOffset2 = '35';
 tooltipYOffset2 = '57';
</script>

<script type="text/javascript">
isSpecificValidationNeeded = false;
if (document.forms[0].Zip != null && document.forms[0].Zip != undefined){
var zipFromUI = document.forms[0].Zip.value;
}
if(document.getElementById("ProposedEffDate").value ==""){

	document.getElementById("ProposedEffDate").value = document.getElementById("ProposedEffectiveDate1").value
	
}

</script>