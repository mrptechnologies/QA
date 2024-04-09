function validateFields(formElement){

	/*To check - plan association with the product status
	 *by gnanaguru_g@solartis.net
	 */
	if(formElement.prdStatus!=null && formElement.prdStatus != undefined) {
		var productStatus= formElement.prdStatus.value;
		var planObj = document.getElementsByName("answer(Object::Quote::ProductGroupVerId)");
		if(productStatus=='RESTRICTED' && planObj.length==0) {
			alert("No Plans under the Restricted Product");
			return false;
		}
	}

	if (formElement.InsuranceType!=null || formElement.InsuranceType!=undefined) {
	 
		if(formElement.InsuranceType.value==0){
			alert("Please select a Insurance Type");
			return false;	
		}
	}
	
	if(formElement.selectGroup != undefined){
		alert("::: Please select the Plan");
	}
	
	if(document.getElementById("selectGroup")!=null) {
	if(formElement.selectGroup!=null || formElement.selectGroup!=undefined) {
		if(formElement.selectGroup.value==0){
			alert("Please select the Plan");
			return false;	
		}
	}}
	
	if(formElement.selectRiskType!=null || formElement.selectRiskType!=undefined) {
		if(formElement.selectRiskType.value==""){
			alert("Please select a risk");
			return false;	
		}
	}
	
	if (formElement.Company!=null ) {
		if(formElement.Company.value==""){
			alert("Please select a Company");
			return false;	
		}
	}
	
		if (formElement.selectTerm!=null ) {
		if(formElement.selectTerm.value==0){
			alert("Please select a term");
			return false;	
		}
	}

	if(validateDate()==false) {
		return false;
	}
	
	if (formElement.HealthRAYes!=null && formElement.HealthRANo!=null)
	{
		if((!formElement.HealthRAYes.checked)&&(!formElement.HealthRANo.checked))
		{
			alert("Please select HRA");
			return false;
		}
	}	
	
	if (!(frm.selPPO == null || frm.selPPO == undefined) && frm.selPPO.value == "") {
		alert("Please select a PPO");
		return false;
	}

	/* Occupancy Rules - START */
	if(formElement.Occupancy!=null) {
		if(formElement.Occupancy.value=="Vacant") {
			alert("Vacant Occupancy cannot be rated.");
			return false;
		}
	}
	/* Occupancy Rules - END */

	/* Exceptional Rating Territories - START */	
	// NJ-3
	if(formElement.RatingState!=null && formElement.RatingTerritory){
		if(formElement.RatingState.value=="NJ" && formElement.RatingTerritory.value == "3" ) {
			/*if(!(/^\$?(DP.?3)$/.test(formElement.selectGroup.options[formElement.selectGroup.selectedIndex].text))) {
				alert("Only DP-3 quotes can be created for NJ territory 3.");
				return false;
			}*/
			alert("No rates available for NJ Territory 3.");
			return false;
		}
	}
	/* Exceptional Rating Territories - END */	
	return true;
}

function validateFieldsPlanChange(){
	var formElement=document.forms[0];
	
	/*To check - plan association with the product status
	 *by gnanaguru_g@solartis.net
	 */
	var productStatus= formElement.prdStatus.value;
	var planObj = document.getElementsByName("answer(Object::Quote::ProductGroupVerId)");
	if(productStatus=='RESTRICTED' && planObj.length==0) {
		alert("No Plans under the Restricted Product");
		return false;
	}
	
	if (formElement.InsuranceType!=null ) {
		if(formElement.InsuranceType.value==0){
			alert("Please select a Insurance Type");
			return false;	
		}
	}
	
	if(formElement.selectGroup.value==0){
		alert("Please select the Plan");
		return false;	
	}

	if(validateDatePlanChange()==false) {
		return false;
	}
	
	if (formElement.HealthRAYes!=null && formElement.HealthRANo!=null)
	{
		if((!formElement.HealthRAYes.checked)&&(!formElement.HealthRANo.checked))
		{
			alert("Please select HRA");
			return false;
		}
	}	
	
	if (!(frm.selPPO == null || frm.selPPO == undefined) && frm.selPPO.value == "") {
		alert("Please select a PPO");
		return false;
	}
	
	/* Occupancy Rules - START */
	if(formElement.Occupancy!=null) {
		if(formElement.Occupancy.value=="Vacant") {
			alert("Vacant Occupancy cannot be rated.");
			return false;
		}
	}
	/* Occupancy Rules - END */

	/* Exceptional Rating Territories - START */	
	// NJ-3
	if(formElement.RatingState!=null && formElement.RatingTerritory){
		if(formElement.RatingState.value=="NJ" && formElement.RatingTerritory.value == "3" ) {
			/*if(!(/^\$?(DP.?3)$/.test(formElement.selectGroup.options[formElement.selectGroup.selectedIndex].text))) {
				alert("Only DP-3 quotes can be created for NJ territory 3.");
				return false;
			}*/
			alert("No rates available for NJ Territory 3.");
			return false;
		}
	}
	/* Exceptional Rating Territories - END */	
	return true;
}

function checkFields()
{
	var formElement=document.forms[0];
	if (formElement.compositeRateNo!=null && formElement.HealthRANo!=null)
	{
		formElement.compositeRateNo.checked=true;
		formElement.HealthRANo.checked=true;
	}
}


function submitPlanName()
{
	if(validateDate()==false) {
		return false;
	}
	var formElement=document.forms[0];		formElement.action="../GetAreaNetworkFatorsKey.do?formName=form::GETAREANETWORKFATORSKEY";
	formElement.submit();
	return true;
}

function getProductGroups()
{
	if(validateDate()==false) {
		return false;
	}
	ProductBrowse();
	return true;
}

function getGroupsInStatus()
{
	var formElement=document.forms[0];
	if(validateDate()==false) {
		return false;
	}
	ProductBrowse();
	return true;
}

function submitPlanNamePlanChange()
{
	if(validateDatePlanChange()==false) {
		return false;
	}
	var formElement=document.forms[0];		formElement.action="../PlanChangeGetAreaNetworkFatorsKey.do?formName=form::GETAREANETWORKFATORSKEY";
	formElement.submit();
	return true;
}

function getPlanChangeProductGroups()
{
	if(validateDatePlanChange()==false) {
		return false;
	}
	var formElement=document.forms[0];		formElement.action="../GetPlanChangeProductGroupsAction.do";
	formElement.submit();
	submitPlanNamePlanChange();
	return true;
}

function getPlanChangeGroupsInStatus()
{
	var formElement=document.forms[0];
	if(validateDatePlanChange()==false) {
		return false;
	}
	formElement.action="../GetPlanChangeProductGroupsAction.do";
	formElement.submit();
	submitPlanNamePlanChange();
	return true;
}
	
function validateDate(submit){
	var frm = document.forms[0];
	var vardate = frm.txtDate.value
	var ddate = new Date(vardate);	
	if(!isDate(vardate)){
		alert("Invalid Date")
		frm.txtDate.select();
		return false;
	}
	if (vardate=="")
	{
		alert("Please enter the Effective Date");
		frm.txtDate.focus();
		return false;
	}
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.txtDate.select();
		return false;
	}
	///alert(dmonth);
	//alert(dday);
	//alert(dyear);

	//alert(ddate);
	var reqDate = new Date("01/01/2005");
	///alert(reqDate);

	
	if (ddate < reqDate)
	{
	
		alert("Effective Date cannot be prior to Jan 1, 2005");
		frm.txtDate.select();
		frm.txtDate.focus();
		return false;
	}

	if(submit!=null && submit=="submit") {
		if(frm.selectGroup!=null) {
			frm.selectGroup.value=0;
		}
		ProductBrowse();
	}
	if(frm.effDatefrmRequest!=null && frm.effDatefrmRequest!=undefined ){
		frm.effDatefrmRequest.value=vardate;
		//alert(frm.effDatefrmRequest.value);
	}
	return true;
}



function validateDatePlanChange(submit){
	var frm = document.forms[0];
	var vardate = frm.txtDate.value
	var ddate = new Date(vardate);
	if(!isDate(vardate)){
		alert("Invalid Date")
		frm.txtDate.select();
		return false;
	}
	if (vardate=="")
	{
		alert("Please enter the Effective Date");
		frm.txtDate.focus();
		return false;
	}
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.txtDate.select();
		return false;
	}
	///alert(dmonth);
	//alert(dday);
	//alert(dyear);

	//alert(ddate);
	var reqDate = new Date("01/01/2005");
	///alert(reqDate);

	
	if (ddate < reqDate)
	{
	
		alert("Effective Date cannot be prior to Jan 1, 2005");
		frm.txtDate.select();
		return false;
	}

	if(submit!=null && submit=="submit") {
		if(frm.selectGroup!=null) {
			frm.selectGroup.value=0;
		}
		frm.action="../GetPlanChangeProductGroupsAction.do";
		frm.submit();
	}
	return true;
}

//validate date function - this is specifically for Binder

function validateDateBinder(submit){
	var frm = document.forms[0];
	var vardate = frm.txtDate.value
	var ddate = new Date(vardate);
	if(!isDate(vardate)){
		alert("Invalid Date")
		frm.txtDate.select();
		return false;
	}
	if (vardate=="")
	{
		alert("Please enter the Effective Date");
		frm.txtDate.focus();
		return false;
	}
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.txtDate.select();
		return false;
	}
	///alert(dmonth);
	//alert(dday);
	//alert(dyear);

	//alert(ddate);
	var reqDate = new Date("01/01/2005");
	///alert(reqDate);

	
	if (ddate < reqDate)
	{
	
		alert("Effective Date cannot be prior to Jan 1, 2005");
		frm.txtDate.select();
		frm.txtDate.focus();
		return false;
	}

	if(submit!=null && submit=="submit") {
		if(frm.selectGroup!=null) {
			frm.selectGroup.value=0;
		}
	
	}
	return true;
}


////////////////////////////////////////Product Browse///////////////////////////////////
 var req;
  var obj;
  var tabId;
  var xmlHttp;
  //For modifying html pages
  function ProductBrowse() {
	document.getElementById("CreateQuoteSubmit").disabled = true;
	url="/excecuteRulesAction.do";
	var formElement=document.forms[0];
	parameters= getFormAsString("Application");
	createXMLHttpRequest();
	getTheContent(url,parameters);
	contentIsReady();
  }


function divide_string(AttributesHtml) {
var attributeHtmlArr=AttributesHtml.split("$html$");
	for (var x = 0; x < attributeHtmlArr.length; x++) {
		attribute=attributeHtmlArr[x];
		attributeHtmlid=attribute.split("$id$");
		document.getElementById(attributeHtmlid[0]).innerHTML=attributeHtmlid[1];
	}
}
 


 /**
  * gets the contents of the form as a URL encoded String
  * suitable for appending to a url
  * @param formName to encode
  * @return string with encoded form values , beings with &
  */ 
 function getFormAsString(formName){
 
 	//Set default InsuranceType
 	setInsuranceType();
 	
 	//Setup the return String
 	returnString ="";
	//Get the form values
	formElements=document.forms[0].elements;
 	//loop through the array , building up the url
 	//in the form /strutsaction.do&name=value
 	for ( var i=formElements.length-1; i>=0; --i ){
		//we escape (encode) each value
		name=formElements[i].name;
	    //val=escape(encodeURI(formElements[i].value));
	    
	    val=escape(formElements[i].value);
		returnString=returnString+name+"="+val+"&";
	}
 	//return the values
	
 	return returnString; 


 }

function setInsuranceType() {

	var formElement=document.forms[0];
	var InsuranceTypeValue =document.getElementsByName("answer(Object::Risk::InsuranceTypeId)") //formElement.InsuranceType.value;	
	
	
	if(InsuranceTypeValue[0].value==0) {
		
		InsuranceTypeValue[0].value=1;
	}
}



 function createXMLHttpRequest(){
    xmlHttp = null;
    if(window.XMLHttpRequest){
	     xmlHttp = new XMLHttpRequest();
    }
    if(window.ActiveXObject){
		 try {
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            
			
        }
        catch(e){
        try {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            
			
        }
        catch(e){
            try {
				xmlHttp = new ActiveXObject("MSXML2.XMLHTTP");
                
            }
            catch(e){
                try {
		            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP.4.0");
                }
                catch(e){
                    xmlHttp = null;
                }
            }
        }
		}
    }
    return xmlHttp;
}

function getTheContent(URL,parameters){
	xmlHttp.onreadystatechange = contentIsReady;
	xmlHttp.open("POST", URL,true);
	xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlHttp.setRequestHeader("Content-length", parameters.length);
    xmlHttp.setRequestHeader("Connection", "close");
    xmlHttp.send(parameters);
}

function contentIsReady(){

    if(xmlHttp && xmlHttp.readyState == 4){
    forwardToLoginPageIfInvalidSession(xmlHttp.responseText);
      AttributesHtml=xmlHttp.responseText;
		divide_string(AttributesHtml);
        xmlHttp = null;
    }
}
function getRiskListByLocation(){
  var url="/BrowseRiskListAction.do";
  var panel="RiskListPanel";
  var form=document.forms[0];  
  try {
    autologout();
    new Ajax.Updater(
    panel,
    url,
    {
     synchronous:true,
     parameters:$(document.forms[0]).serialize(this),
     onComplete: function(){
    	if(document.getElementById(panel) != null && document.getElementById(panel) != undefined) {
    		forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);
    	}
      //Do something
     }
    }
   );
   }catch(err) {
    txt="There was an error on this page.\n\n";
    txt+="Error description: " + err.description + "\n\n";
    txt+="Click OK to continue.\n\n";
    alert(txt);
   }   
 
  return false; 
 
 }
