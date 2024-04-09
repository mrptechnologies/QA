<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type="text/javascript" src="../Scripts/JScripts/Common.js">
</script>

<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>





<bean:define id="TabPanelName1" name="Application" property="answer(TabPanelName)" scope="request" />
<bean:define id="isApplicationEnabled" name="Application" property="answer(isApplicationEnabled)" scope="request" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="IsApplicationDisabled" name="Application" property="answer(IsApplicationDisabled)" />
<bean:define id="Customerid" name="Application" property="answer(Object::Customer::CustomerId)" /> 
<bean:define id="AgencyId" name="Application" property="answer(Agency::AgencyId)" /> 
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>


<bean:define property="answer(Object::UserDetail::ownerId)"  name="Application" id="ownerId" />
<bean:define property="answer(Object::Agency::AgencyId)"  name="Application" id="AgencyId" />
<bean:define property="answer(PrimaryKey_Object::Customer::CustomerId)"  name="Application" id="customerId" />
<html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />


<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(TabPanelName)" value="<%=""+TabPanelName1%>" />
<%
String isApplicationEnabled1 = "N";
if(isApplicationEnabled.equals("N")){
	
	isApplicationEnabled1 = "Y";
}

%>


	<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>
	
<html:hidden property="answer(Object::Submission::ClearanceStatus)" name="AddCustomer" /> 
<html:hidden property="answer(Object::Submission::Status)" name="AddCustomer" /> 

<div class="formpage01">
	<div class="content">							
		<div class="formhead"><h2 class="left">General Questions</h2></div>						
		<h3>Additional Submission Details</h3>
	

<dmshtml:DisplayApplication nameInSession="Application" constructFormAlone='<%=true%>'   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName='<%="GENERAL QUESTION SUBMISSION"%>' applicationType="SUBMISSION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveSubmissionGeneralQuestionAppUI3.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
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
	isSpecificValidationNeeded = true;
	
	 function doSpecificValidation(frm){
	 	if(frm.name !="RequestedCoverages"){
	 	   
	 	   if(validateGeneralQuestions(frm)){
					return true;
				}else{
					return false;
				}	    
	 	}
	 	return true;
	 	}
 
if (document.forms[0].Zip != null && document.forms[0].Zip != undefined){
var zipFromUI = document.forms[0].Zip.value;
}
</script>

<script type="text/javascript" src="../Scripts/JScripts/AddTank.js"></script>