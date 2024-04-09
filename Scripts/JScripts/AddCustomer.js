
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
	formElement.action="../AgencySearchPage.do?formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1";
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
var formElement=document.getElementById("EmployerGroup");
	IndusSelected=sic.options[sic.selectedIndex].value;
	//SicIndustry
	formElement.hideSicInd.value=sic.options[sic.selectedIndex].text;
	
	if((GroupContainsVa==1)&&(IndusContainsVa==1))
	{
	formElement.sicCode.value=	A[DivSelected][GroupSelected][IndusSelected][1];
	}
	else if((GroupContainsVa==1)&&(IndusContainsVa==0))
	{
	formElement.sicCode.value=	A[DivSelected][GroupSelected][0][1];
	}
	else if((GroupContainsVa==0))
	{
	formElement.sicCode.value=	A[DivSelected][0][0][1];
	}
	
	}


function setIndustry(group){	
var formElement=document.forms[0];
	IndusSelected=0;
	GroupSelected=group.options[group.selectedIndex].value;	
	
	//To set the SICGroup drop down While page loading
	if(GroupSelected=="" || GroupSelected==undefined || GroupSelected==null){
	GroupSelected=formElement.hidSicGrp3.value;
	IndusSelected=formElement.hideSicInd.value;
	}
	formElement.sicGroup.options[GroupSelected].selected=true;	
	
	//SicGroup
	formElement.hideSicGrp.value=group.options[group.selectedIndex].text;
	//formElement.elements[12].value="";
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
			
    // To set SICIndustry while page loading			
	formElement.sicIndus.options[IndusSelected].selected=true;
		
	}


function setGroup(division){
	
	var formElement=document.forms[0];
	DivSelected=division.options[division.selectedIndex].value;	
	//SicDivision
	formElement.hideSicDiv.value=division.options[division.selectedIndex].text;
	//formElement.elements[11].value="";    
	var j=1;
	var count = 1;
	var sicGroupField = formElement.sicGroup;
	sicGroupField.length = 1;
	formElement.sicDiv.options[division.selectedIndex].selected=true;	
	
	if(!DivSelected=="") {
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
//To reset the SicIndustry drop down
formElement.sicIndus.options[0].selected=true;
	}

function validateFields(){
	var formElement=document.forms[0];
	
	var intnum = isInteger(formElement.InsuredNumber.value);
	
	var intph1 = isInteger(formElement.PhoneNumber1.value);
	var intph2 = isInteger(formElement.PhoneNumber2.value);
	var intph3 = isInteger(formElement.PhoneNumber3.value);

	var intfx1 = isInteger(formElement.FaxNumber1.value);
	var intfx2 = isInteger(formElement.FaxNumber2.value);
	var intfx3 = isInteger(formElement.FaxNumber3.value);
		
if(formElement.InsuredName.value=="")
	{
		alert("Please enter the Insured Name");
		return false;
	}
if(formElement.State.value=="")
	{
		alert("Please select your state");
		return false;
	}	
if(formElement.Zip.value=="")
	{
		alert("Please enter your Zip Code");
		return false;
	}	

if(!isInteger(formElement.Zip.value))
	{
		alert("Please enter a valid Zip Code");
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
		formElement.hideCity.value=formElement.City.value;
		//State
		formElement.hideState.value=formElement.State.value;
		//ZIP
		formElement.hideCustZip.value=formElement.Zip.value;
		//Address1
		formElement.hideCustAdd1.value=formElement.Address1.value;
		//Address2
		formElement.hideCustAdd2.value=formElement.Address2.value;
	}
	return newchecksubmitcount();	
}

function setvalue()
{
var formElement = document.getElementById("EmployerGroup");
var siccode = formElement.sicCode.value;
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
			formElement.sicDiv.options[i+1].selected=true;
			sicGroupField.length = 1;
			sicGroupField.length++;
			sicGroupField[1].value = 1;
			sicGroupField[1].text = A[i][j][0][0];
			formElement.sicGroup.options[1].selected=true;
			
			sicIndusField.length = 1;
			sicIndusField.length++;
			sicIndusField[1].value = 1;
			sicIndusField[1].text = A[i][j][k][0];
			formElement.sicIndus.options[1].selected=true;
			break;
			}
		}
	}
}

 //to Validate the SIC Code
 /////////////////////////////////////////////////////////////////////////
 function validateSICCode(){ 
 	
   var sicCode=document.getElementById("sicCode").value;	
      var ownerId=document.getElementById("hidOwnerId").value;
     var url = '/SICCodeLookup.do?answer(sicCode)='+sicCode+'&answer(ownerId)='+ownerId;	                                       			
	 panel="ERROR_CONTAINER";
	  try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(document.forms[0]).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);disableIndicator();},
       onException:function(){disableIndicator();}
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
  
function displayErrorMsg(transport){
	if(transport.responseText=='false'){
	 alert("please enter valid SIC Code");
	 document.getElementById("sicCode").focus();
	 }
	 else{
	 setvalue(); 
	 }
}

function validateEndorsementIns(formElement)
{

//	var formElement=document.forms[0];
	var phoneNumber1 = isInteger(formElement.PhoneNumber1.value);
	var phoneNumber2 = isInteger(formElement.PhoneNumber2.value);
	var phoneNumber3 = isInteger(formElement.PhoneNumber3.value);
	
	var faxNumber1 = isInteger(formElement.FaxNumber1.value);
	var faxNumber2 = isInteger(formElement.FaxNumber2.value);
	var faxNumber3 = isInteger(formElement.FaxNumber3.value);
	
	
	if(formElement.InsuredName.value=="")
	{
		alert("Please enter the Insured Name");
		return false;
	}
	
	if(formElement.Address1.value=="")
	{
		alert("Please enter the Address Line1");
		return false;
	}	
	
	if(formElement.City.value=="")
	{
		alert("Please enter the City");
		return false;
	}	
	
	if(formElement.State !=null && formElement.State != 'undefined') {
	if(formElement.State.value=="")
	{
		alert("Please select your state");
		return false;
	}	
	}
	if(formElement.Zip !=null && formElement.Zip != 'undefined'){
	if(formElement.Zip.value=="")
	{
		alert("Please enter your Zip Code");
		return false;
	}	
	
	if(!isInteger(formElement.Zip.value))
	{
		alert("Please enter a valid Zip Code");
		return false;
	}
	}
	if((!(phoneNumber1))||(!(phoneNumber2))||(!(phoneNumber3))){
	alert("Phone# should be numeric");
		return false;
	}		

	if((!(faxNumber1))||(!(faxNumber2))||(!(faxNumber3))){
	alert("Fax# should be numeric");
		return false;
	}
	if(formElement.MailingAddressSameAsBusinessAddress_Y != null && formElement.MailingAddressSameAsBusinessAddress_Y != undefined){
		if(formElement.MailingAddressSameAsBusinessAddress_Y.checked==true) {
	         
		     formElement.MailingAddress1.value=formElement.Address1.value;
		     if(formElement.Address2.value!="") {
			     formElement.MailingAddress2.value=formElement.Address2.value;
			     formElement.MailingAddress3.value=formElement.City.value + ", " + formElement.State.value + " " + formElement.Zip.value;
			 }
		     else {
		        formElement.MailingAddress2.value = formElement.City.value + ", " + formElement.State.value + " " + formElement.Zip.value;
		        formElement.MailingAddress3.value = "";
		     }
		     formElement.MailingAddress4.value="";
		     formElement.MailingAddress5.value="";
		     
	      }
	      
	     if(formElement.MailingAddressSameAsBusinessAddress_N.checked==true) {
	        if(formElement.MailingAddress1.value=="") {
	          alert("Please enter value for Genius Address 1");
	          formElement.MailingAddress1.focus();
	          return false;
	        }
	        if(formElement.MailingAddress2.value=="") {
	          alert("Please enter value for Genius Address 2");
	          formElement.MailingAddress2.focus();
	          return false;
	        }
	     }
		}	
	return newchecksubmitcount();
}

// To Validate Mandatory Fields in Add Insured and Modify Insured Endorsement for SENECA
function validateCLEndorsementIns(formElement)
{
	
	if(formElement.InsuredName.value=="")
	{
		alert("Please enter the Insured Name");
		return false;
	}
	
	if(formElement.State.value=="")
	{
		alert("Please select your state");
		return false;
	}	
	if(formElement.Zip.value=="")
	{
		alert("Please enter your Zip Code");
		return false;
	}	

	if(!isInteger(formElement.Zip.value))
	{
		alert("Please enter a valid Zip Code");
		return false;
	}
		
	return newchecksubmitcount();
}

function validateEmployerGroupFields(formElement)
{
var formElement=document.forms[0];

if(formElement.BusinessName.value=="")
	{
		alert("Please enter the Business Name");
		return false;
	}
	
	if(formElement.sicDiv.value=="")
	{
		alert("Please Select SIC Division");
		return false;
	}	
	
	if(formElement.sicGroup.value=="")
	{
		alert("Please Select SIC Group");
		return false;
	}	
	if(formElement.sicIndus.value=="")
	{
		alert("Please Select SIC Industry");
		return false;
	}	

		if(formElement.State.value=="")
	{
		alert("Please enter State");
		return false;
	}
		if(formElement.Zip.value=="")
	{
		alert("Please enter a valid Zip Code");
		return false;
	}
		if(formElement.sicCode.value=="")
	{
		alert("Please enter SIC Code");
		return false;
	}
	if(formElement.NoOfEmployees.value < formElement.NoOfEligibleEmp.value)
	{
		alert("No of Eligible Employees greater than No of Employees");
		return false;	
	}	
	
	if(document.getElementById("ERROR_CONTAINER").innerHTML!="") {
 		alert(document.getElementById("ERROR_CONTAINER").innerHTML);
 		return false;
 	}

}
