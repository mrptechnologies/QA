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
	document.getElementById("ProductBrowseId").value = "Yes";
	url="/excecuteRulesAction.do";
	var formElement=document.forms[0];
	parameters= getFormAsString("Application");
	createXMLHttpRequest();
	getTheContent(url,parameters);
	contentIsReady();
	document.getElementById("ProductBrowseId").value = "NO";
  }


function divide_string(AttributesHtml) {
var attributeHtmlArr=AttributesHtml.split("$html$");
	for (var x = 0; x < attributeHtmlArr.length; x++) {
		attribute=attributeHtmlArr[x];
		attributeHtmlid=attribute.split("$id$");
		document.getElementById(attributeHtmlid[0]).innerHTML=attributeHtmlid[1];
	}

		getRiskListBTA();

}

function ProductBrowseEIL() {
		document.getElementById("isLoBChanged").value = 'Y';
	    ProductBrowse();
   		return true;
}


function getRiskListBTA(){
  var url="/BrowseBTARiskListAction.do";
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
 autologout();
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
      AttributesHtml=xmlHttp.responseText;
		divide_string(AttributesHtml);
        xmlHttp = null;
    }
}

function selectAllRisk(){
  //alert("tes");
  var riskCount = document.forms[0].SelectedRiskID.length;
  for (var count = 0;count<riskCount;count++){
  	document.forms[0].SelectedRiskID[count].checked = true;
  } 
}  

function validateEffectiveDateWhileSubmit(submit){

	var frm = document.forms[0];
	
	var vardate = frm.txtDate.value;
	var anniversarydate = frm.AnniversaryDate.value;
	var expiryDate = frm.ExpDate.value;
	
	var ddate = new Date(vardate);	
	var anniversarydate1 = new Date(anniversarydate);	
	var expiryDate1 = new Date(expiryDate);	

	if(!isDate(vardate)){
		alert("Invalid Effective Date")
		frm.txtDate.select();
		return false;
	}
	
	
	if(!isDate(expiryDate)){
		alert("Invalid Expiry Date")
		frm.ExpDate.select();
		return false;
	}
	if (vardate=="")
	{
		alert("Please enter the Effective Date");
		//frm.txtDate.focus();
		return false;
	}
	if (anniversarydate=="" && frm.IsAnniversaryDateRequiredY.checked==true)
	{
		alert("Please enter the Policy Anniversary Date");
		//frm.AnniversaryDate.focus();
		return false;
	}
	
	if (expiryDate=="")
	{
		alert("Please enter the Policy Expiry Date");
		//frm.ExpDate.focus();
		return false;
	}
	if(document.getElementById("HowLong").value == "" && document.getElementById("PersonHospitalisedY").checked == true)	
	{
		alert("Please enter how long the hospitalization is extended beyond the expiration date");
		document.forms[0].HowLong.focus();
		return false;		
	}
	
	if(document.getElementById("PersonHospitalisedY").checked == true && document.getElementById("HowLong").value < 3 || document.getElementById("HowLong").value > 12){
		alert("Extension period should be between 3 to 12 days");
		document.forms[0].HowLong.focus();
		return false;
		
	}
	var isHowLongNumeric = IsNumeric(document.getElementById("HowLong").value);
	if(!isHowLongNumeric){
		alert("How long should be whole number without decimals");
		document.forms[0].HowLong.focus();
		return false;
	}
	
	var isNumInsuredNumeric = IsNumeric(document.getElementById("NumberOfInsureds").value);
	//alert(document.getElementById("NumberOfInsureds").value)
	if(!isNumInsuredNumeric){
		alert("NumberOfInsureds should be whole number without decimals");
		document.forms[0].NumberOfInsureds.focus();
		return false;
	}
	
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);
	
	var dmonthAnniversaryDate = parseInt(anniversarydate.substring(0, 2), 10);
	var ddayAnniversaryDate = parseInt(anniversarydate.substring(3, 5), 10);
//	var dyearAnniversaryDate = parseInt(anniversarydate.substring(6, 10), 10);
	
	var dmonthExpiryDate = parseInt(expiryDate.substring(0, 2), 10);
	var ddayExpiryDate = parseInt(expiryDate.substring(3, 5), 10);
	var dyearExpiryDate = parseInt(expiryDate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter Effective date in 'MM/DD/YYYY' format");
		frm.txtDate.select();
		return false;
	}
	if(frm.IsAnniversaryDateRequiredY.checked==true){
		if (isNaN(dmonthAnniversaryDate) || dmonthAnniversaryDate < 1 || dmonthAnniversaryDate > 12 || isNaN(ddayAnniversaryDate) || ddayAnniversaryDate < 1 || ddayAnniversaryDate > 31 || anniversarydate.substring(2, 3)!="/")
		{
			alert("Please enter Anniversary date in 'MM/DD/YYYY' format");
			frm.AnniversaryDate.select();
			return false;
		}
	}
	
	if (isNaN(dmonthExpiryDate) || dmonthExpiryDate < 1 || dmonthExpiryDate > 12 || isNaN(ddayExpiryDate) || ddayExpiryDate < 1 || ddayExpiryDate > 31 || isNaN(dyearExpiryDate) || expiryDate.substring(2, 3)!="/" || expiryDate.substring(5, 6)!="/")
	{
		alert("Please enter Anniversary date in 'MM/DD/YYYY' format");
		frm.AnniversaryDate.select();
		return false;
	}

	var reqDate = new Date("01/01/2005");

	if (ddate < reqDate)
	{
	
		alert("Effective Date cannot be prior to Jan 1, 2005");
		frm.txtDate.select();
		//frm.txtDate.focus();
		return false;
	}

	if(anniversarydate1 < ddate  ){
		alert("Anniversay Date is less than Effective date");
		frm.txtDate.select();
		//frm.txtDate.focus();
		return false;
	
	}

	if(expiryDate1 < ddate  ){
		alert("Expiry Date is less than Effective date");
		frm.txtDate.select();
		//frm.txtDate.focus();
		return false;
	
	}

	var res = validateAnniversaryDate(submit);
	if(res==false){
		return false;
	}	
	document.getElementById('CreateQuoteSubmit').disabled='true';
	return true;
}


function validateEffectiveDate(submit){
	var frm = document.forms[0];
	
	var vardate = frm.txtDate.value;
	var anniversarydate = frm.AnniversaryDate.value;
	var expiryDate = frm.ExpDate.value;
	
	var ddate = new Date(vardate);	
	var anniversarydate1 = new Date(anniversarydate);	
	var expiryDate1 = new Date(expiryDate);	
	

	if(!isDate(vardate)){
		alert("Invalid Effective Date")
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
	
	var dmonthAnniversaryDate = parseInt(anniversarydate.substring(0, 2), 10);
	var ddayAnniversaryDate = parseInt(anniversarydate.substring(3, 5), 10);
	//var dyearAnniversaryDate = parseInt(anniversarydate.substring(6, 10), 10);
	
	var dmonthExpiryDate = parseInt(expiryDate.substring(0, 2), 10);
	var ddayExpiryDate = parseInt(expiryDate.substring(3, 5), 10);
	var dyearExpiryDate = parseInt(expiryDate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter Effective date in 'MM/DD/YYYY' format");
		frm.txtDate.select();
		return false;
	}

	var reqDate = new Date("01/01/2005");

	if (ddate < reqDate)
	{
	
		alert("Effective Date cannot be prior to Jan 1, 2005");
		frm.txtDate.select();
		frm.txtDate.focus();
		return false;
	}


	return true;
}
	function validateAnniversaryDate(submit){
	var frm = document.forms[0];
	
	var vardate = frm.txtDate.value;
	var anniversarydate = frm.AnniversaryDate.value;
	var expiryDate = frm.ExpDate.value;
	
	var ddate = new Date(vardate);	
	var anniversarydate1 = new Date(anniversarydate);	
	var expiryDate1 = new Date(expiryDate);	
	

	if(!isDate(vardate)){
		alert("Invalid Effective Date")
		frm.txtDate.select();
		return false;
	}
	if(!isDate(anniversarydate)){
		alert("Invalid Anniversary Date")
		frm.AnniversaryDate.select();
		return false;
	}
	
	
	
	
	if (anniversarydate=="" && frm.IsAnniversaryDateRequiredY.checked==true)
	{
		alert("Please enter the Policy Anniversary Date");
		frm.AnniversaryDate.focus();
		return false;
	}
	
	
	
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);
	
	var dmonthAnniversaryDate = parseInt(anniversarydate.substring(0, 2), 10);
	var ddayAnniversaryDate = parseInt(anniversarydate.substring(3, 5), 10);
	//var dyearAnniversaryDate = parseInt(anniversarydate.substring(6, 10), 10);


	
	if(frm.IsAnniversaryDateRequiredY.checked==true){
		if (isNaN(dmonthAnniversaryDate) || dmonthAnniversaryDate < 1 || dmonthAnniversaryDate > 12 || isNaN(ddayAnniversaryDate) || ddayAnniversaryDate < 1 || ddayAnniversaryDate > 31  || anniversarydate.substring(2, 3)!="/" || anniversarydate.substring(5, 6)!="/")
		{
			alert("Please enter Anniversary date in 'MM/DD/YYYY' format");
			frm.AnniversaryDate.select();
			return false;
		}
	}
	
	

	var reqDate = new Date("01/01/2005");

	

	if(anniversarydate1 < ddate  ){
		alert("Anniversay Date is less than Effective date");
		frm.txtDate.select();
		frm.txtDate.focus();
		return false;
	
	}

	
	
	
	
	return true;
}

	function validateExpiryDate(submit){
		var frm = document.forms[0];
		
		var vardate = frm.txtDate.value;
		frm.AnniversaryDate.value = document.getElementById("policyAnniversaryDate").value;
		var anniversarydate = frm.AnniversaryDate.value;
		var expiryDate = frm.ExpDate.value;
		
		var ddate = new Date(vardate);	
		var anniversarydate1 = new Date(anniversarydate);	
		var expiryDate1 = new Date(expiryDate);	
		
	
	
		
		if(!isDate(expiryDate)){
			alert("Invalid Expiry Date")
			frm.ExpDate.select();
			return false;
		}
	
		if (expiryDate=="")
		{
			alert("Please enter the Policy Expiry Date");
			frm.ExpDate.focus();
			return false;
		}
	
		var dmonth = parseInt(vardate.substring(0, 2), 10);
		var dday = parseInt(vardate.substring(3, 5), 10);
		var dyear = parseInt(vardate.substring(6, 10), 10);
		
		var dmonthAnniversaryDate = parseInt(anniversarydate.substring(0, 2), 10);
		var ddayAnniversaryDate = parseInt(anniversarydate.substring(3, 5), 10);
//		var dyearAnniversaryDate = parseInt(anniversarydate.substring(6, 10), 10);
		
		var dmonthExpiryDate = parseInt(expiryDate.substring(0, 2), 10);
		var ddayExpiryDate = parseInt(expiryDate.substring(3, 5), 10);
		var dyearExpiryDate = parseInt(expiryDate.substring(6, 10), 10);
	
	
		if (isNaN(dmonthExpiryDate) || dmonthExpiryDate < 1 || dmonthExpiryDate > 12 || isNaN(ddayExpiryDate) || ddayExpiryDate < 1 || ddayExpiryDate > 31 || isNaN(dyearExpiryDate) || expiryDate.substring(2, 3)!="/" || expiryDate.substring(5, 6)!="/")
		{
			alert("Please enter Anniversary date in 'MM/DD/YYYY' format");
			frm.AnniversaryDate.select();
			return false;
		}
	
		var reqDate = new Date("01/01/2005");
	
	
		if(expiryDate1 < ddate  ){
			alert("Expiry Date is less than Effective date");
			frm.txtDate.select();
			frm.txtDate.focus();
			return false;
		
		}
		
		
		
		return true;
}

  function DisplayIsDefferedDateApplies(val){
  
  	if(val == "Y"){
  	
  		document.getElementById("EligiblePerson").style.display = "";
  		document.getElementById("MultipleClass").style.display = "";
  		//document.getElementById("InsuredDependent").style.display = "block";
  		
  	}
  	if(val == "N"){
  	
  		document.getElementById("EligiblePerson").style.display = "none";
  		document.getElementById("MultipleClass").style.display = "none";
  		document.getElementById("InsuredDependent").style.display = "none";
  		document.getElementById("IsIsInsuredUnderMultipleClassesN").checked = true;
  		document.getElementById("IsIsInsuredDependentN").checked = true;
  	}
  }
  
  
  function DisplayIsAnniversaryDateRequired(val){
  	if(val =="N"){
  		document.getElementById("policyAnniversaryDate").style.display = "none";
  		document.getElementById("polAnniversaryDateLabel").style.display = "none";  		
  		document.getElementById("policyAnniversaryDate").value = "";
  		document.getElementById("AnniversaryDate").value = "";
  	}
  	if(val =="Y"){
  		document.getElementById("policyAnniversaryDate").style.display = "inline";
  		document.getElementById("polAnniversaryDateLabel").style.display = "inline";
  		document.getElementById("policyAnniversaryDate").value = document.getElementById("txtDate").value;
  		document.getElementById("AnniversaryDate").value = document.getElementById("txtDate").value;
  	}
  	}
  	
  	function PersonHospitalised(val){
  	if(val == "N"){
  		document.getElementById("howLongid").style.display = "none";
  	}
  	else{
  		document.getElementById("howLongid").style.display = "";
  	}
  	
  	}
  	function DisplayIsPersonInsured(val){
		if(val =="N"){
  			document.getElementById("InsuredDependent").style.display = "none";
  			
  		}
  		else{
  			document.getElementById("InsuredDependent").style.display = "";
  		}
  	}	
  			 
  
 function showDependentInsured(val){
 
 if(val == 'N'){
 
 	document.getElementById("InsuredDependent").style.display = "";
 
 }else{
 	document.getElementById("InsuredDependent").style.display = "none";
 
 }
 
 }
 function showStateDependentQuestion(stateCode){
	 if(stateCode == "DE"){
		 document.getElementById("DETrustTr").style.display='';	
		 document.getElementById("DETrustN").value='N';
		 document.getElementById("DETrustY").value='Y';
	 }else{
		 document.getElementById("DETrustTr").style.display='none';
		 document.getElementById("DETrustN").value='';
		 document.getElementById("DETrustY").value='';
	 }
 }
 function showRenewalNumber(quoteType){
	 if(quoteType == "RENEWAL"){
		 document.getElementById("RenewalNumbertr").style.display='';		 
	 }else{
		 document.getElementById("RenewalNumbertr").style.display='none';
		 document.getElementById("RenewalPolicyNumber").value='';
	 }
 }
 