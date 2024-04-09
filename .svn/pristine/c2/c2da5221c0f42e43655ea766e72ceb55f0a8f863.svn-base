NumChars ="0123456789";
/* Function for showing and hiding elements that use 'display:none' to hide */
function toggleDisplay(targetId)
{
    if (document.getElementById) {
        target = document.getElementById(targetId);
    	if (target.style.display == "none"){
    		target.style.display = "";
    	} else {
    		target.style.display = "none";
    	}
    }
}

// toggle visibility 
function toggleVisibility(targetId) {
    if (document.getElementById) {
        target = document.getElementById(targetId);
    	if (target.style.visibility == "hidden"){
    		target.style.visibility = "visible";
    	} else {
    		target.style.visibility = "hidden";
    	}
    }
}



/* function isInteger(s)
{   var i;
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}*/

function isInteger(data)
{   
	var index;
	for (index = 0; index < data.length; index++)
    {   
        // Check that current character is number.
        var c = data.charAt(index);
        if (((c < "0") || (c > "9"))) {
      
       		if(c=="-") {
       			for(i=index+1;i < data.length;i++) {
       				
       				var e = data.charAt(i);
       				if (((e < "0") || (e > "9"))) {
       					return false;
       				}
       			}
       			break;
       			
       		} else {
  	 			return false;
  	 		}
       	 }
    }
    // All characters are numbers.
    return true;
}



function GoTOFindButton(){
    var formElement=document.forms[0];
    if(formElement.IsPopupEnabledAgencyFind.value=="true"){
      GoTOFindButtonPopup()
    }else{
    var customerid = formElement.CustomerID.value;
    	if(formElement.parentQuoteId != 'undefined' && formElement.parentQuoteId != null ){
    		var pQid = formElement.parentQuoteId.value;
    		//alert(pQid)
     	}else{
     	 var pQid ="";
     	// alert(pQid)
     	}
    var url ="../InsuredAgencySearchPage.do"; 
    parameter ="formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(IsPopupEnabledAgencyFind)=false&answer(Object::Customer::CustomerId)="+customerid+"&answer(parentQuoteId)="+pQid; 
    url = url+"?"+parameter;
    //alert(""+url);
    //alert(""+formElement.CustomerID.value);
   	formElement.action=url
	//alert("enterted");
    formElement.submit();
	return true;
	}
  }


function GoTOFindButtonPopup(){
   
    var customerid = document.forms[0].CustomerID.value;
    var agentId = document.getElementById('StyleAgentId').value;
    if(document.getElementById("parentQuoteId") != 'undefined' && document.getElementById("parentQuoteId")!= null){
    		var pQid = document.getElementById("parentQuoteId").value;
    		//alert(pQid)
     	}else{
     	 var pQid ="";
     	 //alert(pQid)
     	}
    var mywin;
    var url ="../InsuredAgencySearchPage.do"; 
    parameter ="formNameAgencyFind=AddCustomer&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(IsPopupEnabledAgencyFind)=true&answer(Object::Customer::CustomerId)="+customerid+"&answer(AgentId)="+agentId+"+&answer(parentQuoteId)="+pQid; 
    url = url+"?"+parameter;
	
	mywin = window.open(url,'Search_Agency_or_Agent','width=800, height=600, left=550, top=125, scrollbars=yes');
	mywin.focus();
	
	return false;
  }
  
  function GoTOFindButtonCL(){
    var formElement=document.forms[0];
    //alert("inside GoTOFindButtonCL");
    var customerid = formElement.CustomerID.value;
    var url ="../InsuredAgencySearchPageCL.do"; 
    parameter ="formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(Object::Customer::CustomerId)="+customerid; 
    url = url+"?"+parameter;
    //alert(""+url);
    //alert(""+formElement.CustomerID.value);
   	formElement.action=url
	//alert("enterted");
    formElement.submit();
	return true;
  }
  
  function GoTOFindButtonSubmissionInsured(){
    var formElement=document.forms[0];
    var customerid = formElement.CustomerID.value;
    var url ="../InsuredAgencySearchPageSubmission.do"; 
    parameter ="formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(Object::Customer::CustomerId)="+customerid; 
    url = url+"?"+parameter;
    formElement.action=url
    formElement.submit();
 	return true;
  }
  
  function GoTOSubmissionAgencyFind(){
    var formElement=document.forms[0];
    var customerid = formElement.CustomerID.value;
    var pageName = "";
    if(document.getElementById("pageName") != null && document.getElementById("pageName") != undefined) {
    	pageName = document.getElementById("pageName").value;	
    }
    var url ="../InsuredAgencySearchPageSubmission1.do"; 
    parameter ="formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(pageName)=" + pageName + "&answer(Object::Customer::CustomerId)="+customerid; 
    url = url+"?"+parameter;
    formElement.action=url
    formElement.submit();
 return true;
  }
  
  function GoTOFindButtonLIU(){
    var formElement=document.forms[0];
    var customerid = formElement.CustomerID.value;
    var url ="../InsuredAgencySearchPageLIU.do"; 
    parameter ="formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(Object::Customer::CustomerId)="+customerid; 
    url = url+"?"+parameter;
    formElement.action=url
    formElement.submit();
 return true;
  }

  function Zip(){
    var formElement=document.forms[0];
	formElement.action="../SearchZCC.do?formName=form::ZIPCODELOOKUP&answer(Object::UserDetail::ownerId)=2";
    formElement.submit();
	return true;
  }


var DivSelected=0;
var GroupSelected=0;
var IndusSelected=0;
var GroupContainsVa=0;
var IndusContainsVa=0;
var A = new Array(20); 
	for (var i = 0; i < A.length; ++ i)
	A [i] = new Array(20);
	for (var i = 0; i < A.length; ++ i)
	for (var j = 0; j < A.length; ++ j)
	A [i][j] = new Array(20);
	for (var i = 0; i < A.length; ++ i)
	for (var j = 0; j < A.length; ++ j)
	for (var k = 0; k < A.length; ++ k)
	A [i][j][k] = new Array(20);

function setSiccode(sic){	
var formElement=document.forms[0];
	IndusSelected=sic.options[sic.selectedIndex].value;
	//SicIndustry
	formElement.hideSicInd.value=sic.options[sic.selectedIndex].text;
	
	if((GroupContainsVa==1)&&(IndusContainsVa==1))
	{
	formElement.elements[11].value=	A[DivSelected][GroupSelected][IndusSelected][1];
	}
	else if((GroupContainsVa==1)&&(IndusContainsVa==0))
	{
	formElement.elements[11].value=	A[DivSelected][GroupSelected][0][1];
	}
	else if((GroupContainsVa==0))
	{
	formElement.elements[11].value=	A[DivSelected][0][0][1];
	}
	
	}


function setIndustry(group){	
var formElement=document.forms[0];
	GroupSelected=group.options[group.selectedIndex].value;
	//SicGroup
	formElement.hideSicGrp.value=group.options[group.selectedIndex].text;
	formElement.elements[11].value="";
	var j=1;
	var count = 1;
	var sicIndusField = formElement.sicIndus;
	sicIndusField.length = 1;

		while(A[DivSelected][GroupSelected][j][0]!=null)
			{
			IndusContainsVa=1;
			sicIndusField.length++;
			sicIndusField[count].value = count;
			sicIndusField[count].text = A[DivSelected][GroupSelected][j][0];
			j=j+1;
			count++;
			}
		
	}


function setGroup(division){
	
	var formElement=document.forms[0];
	DivSelected=division.options[division.selectedIndex].value;
	//SicDivision
	formElement.hideSicDiv.value=division.options[division.selectedIndex].text;
	formElement.elements[11].value="";
	var j=1;
	var count = 1;
	var sicGroupField = formElement.sicGroup;
	sicGroupField.length = 1;
	formElement.elements[14].options[0].selected=true;
		while(A[DivSelected][j][0][0]!=null)
			{
			GroupContainsVa=1;
			sicGroupField.length++;
			sicGroupField[count].value = count;
			sicGroupField[count].text = A[DivSelected][j][0][0];
			
			j=j+1;
			count++;
			}


	}
function validateInsuredSummary(){

	var intph1 = isInteger(document.forms[0].PhoneNumber1.value);
	var intph2 = isInteger(document.forms[0].PhoneNumber2.value);
	var intph3 = isInteger(document.forms[0].PhoneNumber3.value);

	var intfx1 = isInteger(document.forms[0].FaxNumber1.value);
	var intfx2 = isInteger(document.forms[0].FaxNumber2.value);
	var intfx3 = isInteger(document.forms[0].FaxNumber3.value);
	
	if(document.forms[0].Agenname!=null && document.forms[0].Agenname!=undefined){
		if(document.forms[0].Agenname.value=="")
		{
			alert("Please enter the Agency Name");
			document.forms[0].Agenname.focus();
			return false;
		}
	}
	
	if(document.forms[0].OneSourceKey.value=="") {
 	     alert("Please Enter one Source key");
  	     document.forms[0].OneSourceKey.focus();
  	     return false;
	     }
	if(!IsNumeric(document.forms[0].OneSourceKey.value)){
  	     alert("Please Enter the Numeric value for one Source key");
  	     document.forms[0].OneSourceKey.focus();
  	     return false;
	     } 
	
	     
if(document.forms[0].InsuredName.value=="")
	{
		alert("Please enter the Insured Name");
		document.forms[0].InsuredName.focus();
		return false;
	}
	
	if(document.forms[0].NameType.value=="Person")
	{
		if(document.forms[0].InsuredName2.value==""){
			alert("Please enter the Insured Last Name");
			document.forms[0].InsuredName2.focus();
			return false;
		}
	}

/*if(document.forms[0].InsuredName.value!="")
	{
		var strArr = new Array(); 
		strArr = document.forms[0].InsuredName.value.split(" ");
		for(var j = 0; j < strArr .length ; j++) 
		{ 
			if(strArr  [j] == "")
 			{ 
			 	flag=1;               
 				alert("Please enter the Insured Name");
 				return false; 
			} 
		}  
		
 	} */
 
 if(document.forms[0].Address1.value=="") {
	 alert("Please enter the Address Line 1");
	 document.forms[0].Address1.focus();
	return false;
 }
 	
 if(document.forms[0].City.value=="")
	{
		alert("Please enter the City Name");
		document.forms[0].City.focus();
		return false;
	}	        
if(document.forms[0].State.value=="")
	{
		alert("Please select your state");
		document.forms[0].State.focus();
		return false;
	}	
if(document.forms[0].Zip.value=="")
	{
		alert("Please enter your Zip Code");
		document.forms[0].Zip.focus();
		return false;
	}	
if((document.forms[0].Zip.value.length!=5)||(document.forms[0].Zip.value<=0))
	{
		alert("Please enter a valid Zip Code");
		document.forms[0].Zip.focus();
		return false;
	}	
if(!isInteger(document.forms[0].Zip.value))
	{
		alert("Please enter a valid Zip Code");
		document.forms[0].Zip.focus();
		return false;
	}
	
	if(!checkEmailAddress(document.forms[0])){
		return false;
	}

if((!(intph1))||(!(intph2))||(!(intph3))){
	alert("Phone# should be numeric");
		return false;
	}		

if((!(intfx1))||(!(intfx2))||(!(intfx3))){
	alert("Fax# should be numeric");
		return false;
	}	
		
else{	
		//City
		//alert("formElement::"+formElement);
		//alert("City :: "+formElement.City.value);
		if(document.forms[0].hideCity !=undefined){
		document.forms[0].hideCity.value=document.forms[0].City.value;
		}
		//State
		if(document.forms[0].hideState !=undefined){
		document.forms[0].hideState.value=document.forms[0].State.value;
		}
		//ZIP
		if(document.forms[0].hideCustZip !=undefined){
		
		document.forms[0].hideCustZip.value=document.forms[0].Zip.value;
		}
		//Address1
		if(document.forms[0].hideCustAdd1 != undefined){
		document.forms[0].hideCustAdd1.value=document.forms[0].Address1.value;
		}
		//Address2
		if(document.forms[0].hideCustAdd2 != undefined){
		document.forms[0].hideCustAdd2.value=document.forms[0].Address2.value;
		}
	}
	if(document.forms[0].MailingAddressSameAsBusinessAddress_Y !=undefined && document.forms[0].MailingAddressSameAsBusinessAddress_Y !=null){
		if(document.forms[0].MailingAddressSameAsBusinessAddress_Y.checked==true) {
	         
		     document.forms[0].MailingAddress1.value=document.forms[0].Address1.value;
		     if(document.forms[0].Address2.value!="") {
			     document.forms[0].MailingAddress2.value=document.forms[0].Address2.value;
			     document.forms[0].MailingAddress3.value=document.forms[0].City.value + ", " + document.forms[0].State.value + " " + document.forms[0].Zip.value;
			 }
		     else {
		        document.forms[0].MailingAddress2.value = document.forms[0].City.value + ", " + document.forms[0].State.value + " " + document.forms[0].Zip.value;
		     }
		     document.forms[0].MailingAddress4.value="";
		     document.forms[0].MailingAddress5.value="";
		     
	      }
      }
     if(document.forms[0].MailingAddressSameAsBusinessAddress_N !=undefined &&  document.forms[0].MailingAddressSameAsBusinessAddress_N !=null){
	     if(document.forms[0].MailingAddressSameAsBusinessAddress_N.checked==true) {
	        if(document.forms[0].MailingAddress1.value=="") {
	          alert("Please enter value for Genius Address 1");
	          document.forms[0].MailingAddress1.focus();
	          return false;
	        }
	        if(document.forms[0].MailingAddress2.value=="") {
	          alert("Please enter value for Genius Address 2");
	          document.forms[0].MailingAddress2.focus();
	          return false;
	        }
	     }
     }     
	return newchecksubmitcount();	
}

function IsNumeric(Data) {
	var It = true;
      var c;
      for (var x = 0; x < Data.length; x++)
      if (It) {
      c = Data.charAt(x);
      It = ( NumChars.indexOf(c) != -1);
     }
    return It;
  }

function setvalue()
{
var formElement=document.forms[0];
var siccode=formElement.elements[11].value;
var sicGroupField = formElement.sicGroup;
var sicIndusField = formElement.sicIndus;
	if(siccode!=null)
	{
		for(var i=0;i<14;++i)
		for(var j=1;j<17;++j)
		for(var k=1;k<17;++k)
		{
		if(((A[i][j][k][1])==siccode)||((siccode <= parseInt(A[i][j][k][2]))&&(siccode >= parseInt(A[i][j][k][1]))))
			{
			formElement.elements[12].options[i+1].selected=true;
			sicGroupField.length = 1;
			sicGroupField.length++;
			sicGroupField[1].value = 1;
			sicGroupField[1].text = A[i][j][0][0];
			formElement.elements[13].options[1].selected=true;
			
			sicIndusField.length = 1;
			sicIndusField.length++;
			sicIndusField[1].value = 1;
			sicIndusField[1].text = A[i][j][k][0];
			formElement.elements[14].options[1].selected=true;
			break;
			}
		}
	}
}

function validateEndorsementIns(formElement)
{

//	var formElement=document.forms[0];
	var phone = isInteger(formElement.phone.value);
	var fax = isInteger(formElement.fax.value);
	
	if(formElement.InsuredName.value=="")
	{
		alert("Please enter the Insured Name");
		formElement.InsuredName.focus();
		return false;
	}
	if(formElement.State.value=="")
	{
		alert("Please select your state");
		formElement.State.focus();
		return false;
	}	
	if(formElement.Zip.value=="")
	{
		alert("Please enter your Zip Code");
		formElement.Zip.focus();
		return false;
	}	

	if(!isInteger(formElement.Zip.value))
	{
		alert("Please enter a valid Zip Code");
		formElement.Zip.focus();
		return false;
	}
	if(!phone)
	{
		alert("Phone# should be numeric");
		return false;
	}
	if(!fax)
	{
		alert("Fax# should be numeric");
		return false;
	}
	return newchecksubmitcount();

}

function GoTOFindPLButton(){
    var formElement=document.forms[0];
    var customerid = formElement.CustomerID.value;
    var url ="../InsuredAgencyPLSearchPage.do"; 
    parameter ="formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(Object::Customer::CustomerId)="+customerid; 
    url = url+"?"+parameter;
    //alert(""+url);
    //alert(""+formElement.CustomerID.value);
   	formElement.action=url
	//alert("enterted");
    formElement.submit();
	return true;
  }
  
  
  function validateAddInsuredCLFields(){
	var formElement=document.forms[0];	
		
	if(formElement.InsuredName.value=="")
		{
			alert("Please enter the Insured Name");
			formElement.InsuredName.focus();
			return false;
		}
	if(formElement.State.value=="")
		{
			alert("Please select your state");
			formElement.State.focus();
			return false;
		}	
	if(formElement.Zip.value=="")
		{
			alert("Please enter your Zip Code");
			formElement.Zip.focus();
			return false;
		}	
	
	if(!isInteger(formElement.Zip.value))
		{
			alert("Please enter a valid Zip Code");
			formElement.Zip.focus();
			return false;
		}
		if(formElement.BillingState.value=="")
		{
			alert("Please select your BillingState");
			formElement.BillingState.focus();
			return false;
		}	
	if(formElement.BillingZip.value=="")
		{
			alert("Please enter your BillingZip Code");
			formElement.BillingState.focus();
			return false;
		}	
	
	if(!isInteger(formElement.BillingZip.value))
		{
			alert("Please enter a valid BillingZip Code");
			formElement.BillingState.focus();
			return false;
		}	
		
	
			
	
		return newchecksubmitcount();	
}


function showCompanyInformation(formElement){
		var nameType = formElement.NameType.value;
		var FormOfBusiness = formElement.FormOfBusiness.value;
		//alert(nameType);

		if(nameType == 'Person'){
		       	document.getElementById('CompanywebsiteBlock').style.display='none'
			document.getElementById('FOBBlock').style.display='none'
			document.getElementById('otherFOBBlock').style.display='none'
			document.getElementById('CompanyInfmnBlock').style.display='none'
			document.getElementById('DBABlock').style.display='none'			
			document.getElementById('InsName1').innerHTML ='<font color="red">* First Name:</font>';
			document.getElementById('InsName2').innerHTML ='<font color="red">* Last Name:</font>';
			
		}else{		
			if((document.getElementById('InsName1') != null) && (document.getElementById('InsName1') != undefined) ) {
					document.getElementById('InsName1').innerHTML ='<font color="red">* Legal Name1:</font>';
			}
			if((document.getElementById('InsName2') != null) && (document.getElementById('InsName2') != undefined) ) {
				document.getElementById('InsName2').innerHTML ='Legal Name2:';
			}
			document.getElementById('CompanywebsiteBlock').style.display='';
			document.getElementById('FOBBlock').style.display='';
			document.getElementById('DBABlock').style.display='';
			document.getElementById('CompanyInfmnBlock').style.display='';
			if(FormOfBusiness == 'Other'){
				document.getElementById('otherFOBBlock').style.display='';
			}else{
				document.getElementById('otherFOBBlock').style.display='none';
			}
		}	
	}	
	function showOtherFOBInformation(formElement){
		var nameType = formElement.NameType.value;
		var FormOfBusiness = formElement.FormOfBusiness.value;
		//alert(nameType);

		if(FormOfBusiness == 'Other'){
				document.getElementById('otherFOBBlock').style.display='block';
		}else{
				document.getElementById('otherFOBBlock').style.display='none';
		}	
	}		
		
	function maxLengthTextArea() {
	var field = document.forms[0].OtherBusiness;
	if ( field.value.length > 240 )
  	{
  	
    	field.value = field.value.substring( 0, 240 );
    	alert( "Only 240 characters is allowed." );
    	return false;
  	}   	
}	

 function checkEmailAddress(formElement) {
	 var address = formElement.emailID.value;
 	var filter  = /(([a-zA-Z0-9\-?\.?]+)@(([a-zA-Z0-9\-_]+\.)+)([a-z]{2,3})(\W?[,;]\W?(?!$))?)+$/i;
	 if(address!=""){
		 if (!filter.test(address)){
		  alert("Invalid EmailID");
	      formElement.emailID.focus();	  
	      return false;
		 }else{
		    return true;
		 }
	 }
 	return true;
}
 
function setzipDetails(cityName,countyName,stateCode) {
    var formElement=document.forms[0];	
    var comma =", ";
    if(cityName=="" || countyName==""){
    	comma=" ";
    }
    document.getElementById("City1").innerHTML=cityName+comma+countyName+comma+stateCode;    
    formElement.City.value=cityName;
    formElement.County.value=countyName;
    formElement.State.value=stateCode;
}

function territoryLookup(formElement, document) {
	setzipDetails(formElement.City.value,formElement.County.value,formElement.State.value);	
}
function getCityState(form){
	territoryLookup(form, document)
}
 function validateFields(){

    var intph1 = isInteger(document.forms[0].PhoneNumber1.value);
	var intph2 = isInteger(document.forms[0].PhoneNumber2.value);
	var intph3 = isInteger(document.forms[0].PhoneNumber3.value);

	var intfx1 = isInteger(document.forms[0].FaxNumber1.value);
	var intfx2 = isInteger(document.forms[0].FaxNumber2.value);
	var intfx3 = isInteger(document.forms[0].FaxNumber3.value);
	
		 
if(document.forms[0].InsuredName.value=="")
	{
		alert("Please enter the Insured Name");
		document.forms[0].InsuredName.focus();
		return false;
	}
	
	if(document.forms[0].NameType.value=="Person")
	{
		if(document.forms[0].InsuredName2.value==""){
			alert("Please enter the Insured Last Name");
			document.forms[0].InsuredName2.focus();
			return false;
		}
	}

/*if(document.forms[0].InsuredName.value!="")
	{
		var strArr = new Array(); 
		strArr = document.forms[0].InsuredName.value.split(" ");
		for(var j = 0; j < strArr .length ; j++) 
		{ 
			if(strArr  [j] == "")
 			{ 
			 	flag=1;               
 				alert("Please enter the Insured Name");
 				return false; 
			} 
		}  
		
 	} */
 
if(document.forms[0].IndustryName != null && document.forms[0].IndustryName != undefined) {
 if(document.forms[0].IndustryName.value=="") {
	 alert("Please select Industry Name");
	document.forms[0].IndustryName.focus();
	return false;
 }
}
 
 if(document.forms[0].Address1.value=="") {
	 alert("Please enter the Address Line 1");
	 document.forms[0].Address1.focus();
	return false;
 }
 	
 if(document.forms[0].City.value=="")
	{
		alert("Please enter the City Name");
		document.forms[0].City.focus();
		return false;
	}	        
if(document.forms[0].State.value=="")
	{
		alert("Please select your state");
		document.forms[0].State.focus();
		return false;
	}	
if(document.forms[0].Zip.value=="")
	{
		alert("Please enter your Zip Code");
		document.forms[0].Zip.focus();
		return false;
	}	
if((document.forms[0].Zip.value.length!=5)||(document.forms[0].Zip.value<=0))
	{
		alert("Please enter a valid Zip Code");
		document.forms[0].Zip.focus();
		return false;
	}	
if(!isInteger(document.forms[0].Zip.value))
	{
		alert("Please enter a valid Zip Code");
		document.forms[0].Zip.focus();
		return false;
	}
	
	if(!checkEmailAddress(document.forms[0])){
		return false;
	}

if((!(intph1))||(!(intph2))||(!(intph3))){
	alert("Phone# should be numeric");
		return false;
	}		

if((!(intfx1))||(!(intfx2))||(!(intfx3))){
	alert("Fax# should be numeric");
		return false;
	}	
		
else{	
		//City
		//alert("formElement::"+formElement);
		//alert("City :: "+formElement.City.value);
		if(document.forms[0].hideCity !=undefined){
		document.forms[0].hideCity.value=document.forms[0].City.value;
		}
		//State
		if(document.forms[0].hideState !=undefined){
		document.forms[0].hideState.value=document.forms[0].State.value;
		}
		//ZIP
		if(document.forms[0].hideCustZip !=undefined){
		
		document.forms[0].hideCustZip.value=document.forms[0].Zip.value;
		}
		//Address1
		if(document.forms[0].hideCustAdd1 != undefined){
		document.forms[0].hideCustAdd1.value=document.forms[0].Address1.value;
		}
		//Address2
		if(document.forms[0].hideCustAdd2 != undefined){
		document.forms[0].hideCustAdd2.value=document.forms[0].Address2.value;
		}
	}
	if(document.forms[0].MailingAddressSameAsBusinessAddress_Y !=undefined && document.forms[0].MailingAddressSameAsBusinessAddress_Y !=null){
		if(document.forms[0].MailingAddressSameAsBusinessAddress_Y.checked==true) {
	         
		     document.forms[0].MailingAddress1.value=document.forms[0].Address1.value;
		     if(document.forms[0].Address2.value!="") {
			     document.forms[0].MailingAddress2.value=document.forms[0].Address2.value;
			     document.forms[0].MailingAddress3.value=document.forms[0].City.value + ", " + document.forms[0].State.value + " " + document.forms[0].Zip.value;
			 }
		     else {
		        document.forms[0].MailingAddress2.value = document.forms[0].City.value + ", " + document.forms[0].State.value + " " + document.forms[0].Zip.value;
		        document.forms[0].MailingAddress3.value = "";
		     }
		     document.forms[0].MailingAddress4.value="";
		     document.forms[0].MailingAddress5.value="";
		     
	      }
      }
     if(document.forms[0].MailingAddressSameAsBusinessAddress_N !=undefined &&  document.forms[0].MailingAddressSameAsBusinessAddress_N !=null){
	     if(document.forms[0].MailingAddressSameAsBusinessAddress_N.checked==true) {
	        if(document.forms[0].MailingAddress1.value=="") {
	          alert("Please enter value for Genius Address 1");
	          document.forms[0].MailingAddress1.focus();
	          return false;
	        }
	        if(document.forms[0].MailingAddress2.value=="") {
	          alert("Please enter value for Genius Address 2");
	          document.forms[0].MailingAddress2.focus();
	          return false;
	        }
	     }
     }     
	return newchecksubmitcount();	
}

  function GoTOInsuredAgencyFind(){
    var formElement=document.forms[0];
    var customerid = formElement.CustomerID.value;
    var pageName = "";
    if(document.getElementById("pageName") != null && document.getElementById("pageName") != undefined) {
    	pageName = document.getElementById("pageName").value;	
    }
    var url ="../InsuredAgencySearchPageInsured.do"; 
    parameter ="formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(pageName)=" + pageName + "&answer(Object::Customer::CustomerId)="+customerid; 
    url = url+"?"+parameter;
    formElement.action=url
    formElement.submit();
 return true;
  }