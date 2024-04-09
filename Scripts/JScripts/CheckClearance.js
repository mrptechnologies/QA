function showPersonInformation(formElement)
{
		var nameType = formElement.NameType.value;
		//alert(nameType);
		if(nameType == 'Company'){
			document.getElementById('company_legal_name1').style.display='inline'
			document.getElementById('company_legal_name2').style.display='inline'
			document.getElementById('insureddba').style.display='inline'
			document.getElementById('personfirstname').style.display='none'
			document.getElementById('personlastname').style.display='none'
			
			
		}
		else if(nameType == 'Person'){	
			document.getElementById('company_legal_name1').style.display='none'
			document.getElementById('company_legal_name2').style.display='none'
			document.getElementById('insureddba').style.display='none'
			document.getElementById('personfirstname').style.display='inline'
			document.getElementById('personlastname').style.display='inline'		
		}
		else if(nameType == '')
		{	
			document.getElementById('company_legal_name1').style.display='inline'
			document.getElementById('company_legal_name2').style.display='inline'
			document.getElementById('insureddba').style.display='inline'
			document.getElementById('personfirstname').style.display='none'
			document.getElementById('personlastname').style.display='none'		
		}			
} 

function showPersonInformationUI3(formElement)
{
		var nameType = formElement.NameType.value;
		//alert(nameType);
		if(nameType == 'Company'){
			document.getElementById('divCompany').style.display='inline'
			document.getElementById('divPerson').style.display='none'		
			
		}
		else if(nameType == 'Person'){	
			document.getElementById('divCompany').style.display='none'
			document.getElementById('divPerson').style.display='inline'		
		}
		else if(nameType == '')
		{	
			document.getElementById('divCompany').style.display='inline'
			document.getElementById('divPerson').style.display='none'		
		}			
} 		
function isInteger(data){   
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
function Validate(){
		var formElement=document.forms[0]; 
  		if(formElement.AgencyName != null && formElement.AgencyName != undefined)
  		 if(formElement.AgencyName.value=="")
		 {
				alert("Please enter the Agency Name");
				formElement.AgencyName.focus();
				return false;
		 }
		if(formElement.NameType.value=="Company")
		{
		  		formElement.FirstName.value="";
		  		// formElement.LastName.value="";		  		
		  		if(formElement.LegalName1.value=="")
				{
				alert("Please enter the Legal Name ");
				formElement.LegalName1.focus();
				return false;
				}		
				if(formElement.LegalName1.value!="")
				{
				var strArr = new Array(); 
				//strArr = formElement.LegalName1.value.split(" ");
				//for(var j = 0; j < strArr .length ; j++) 
				//{ 
				//	if(strArr  [j] == "")
 				//	{ 
			 	//		flag=1;               
 				//		alert("Please enter the Legal Name 1");
 				//		formElement.LegalName1.focus();
 				//		return false; 
				//	} 
				//}  
				}		
		}
		if(formElement.NameType.value=="Person")
		{
		formElement.FirstName.value=formElement.LegalName1.value;
				//formElement.LegalName1.value="";
		  		//formElement.LegalName2.value="";
		  		 // formElement.DBA.value="";
				if(formElement.LegalName1.value=="")
				{
				alert("Please enter the First Name1");
				formElement.FirstName.focus();
				return false;
				}
				if(formElement.FirstName.value!="")
				{
				var strArr = new Array(); 
			//	strArr = formElement.FirstName.value.split(" ");
			//	for(var j = 0; j < strArr .length ; j++) 
			//	{ 
			//		if(strArr  [j] == "")
 			//		{ 
			 //			flag=1;               
 			//			alert("Please enter the First Name");
 			//			formElement.FirstName.focus();
 			//			return false; 
			//		} 
			//	}  
				}					
		}		
		if(formElement.SubmissionType.value=="")
		{
			alert("Please Select the Submission Type");
			formElement.SubmissionType.focus();
			return false;
		}
		if((formElement.SubmissionType != undefined) && (formElement.SubmissionType != null)) {
			if((formElement.SubmissionType.value=="RENEWAL")){
				var renewalPolicyNum = formElement.RenewingPolicy.value;

				renewalPolicyNum = renewalPolicyNum.replace(/\s/g,"");

    	        if(!renewalPolicyNum.length > 0){
					alert("Please Enter the Renewing Policy Number");
					formElement.RenewingPolicy.focus();
					return false;
				}
    	        if( /[^a-zA-Z0-9]/.test( renewalPolicyNum ) ) {
    	            alert('Please enter the Policy Number with Alphanumeric characters');
    	            return false;
    	        }
			}
		}
		if(formElement.Zip.value=="")
		{
			alert("Please enter the Zip Code");
			formElement.Zip.focus();
			return false;
		}

		if((formElement.Zip.value.length!=5)||(formElement.Zip.value<=0))
	{
		alert("Please enter a valid Zip Code");
		return false;
	}
		if(!isInteger(formElement.Zip.value))
		{
			alert("Please enter a valid Zip Code");
			formElement.Zip.focus();
			return false;
		}
		/*var ProEffDD=formElement.csddd.value;
		var ProEffMM=formElement.csdmm.value;
		var ProEffyy=formElement.csdyy.value;			
			if(ProEffMM =="" || ProEffMM < 1 || ProEffMM > 12){
				alert("month should be 1-12");
				formElement.csdmm.focus();
				return false;
			}			
			if(ProEffDD =="" || ProEffDD < 1 || ProEffDD > 31){
				alert("date should be 1-31");
				formElement.csddd.focus();
				return false;
			}			
			if(ProEffyy ==""){
				alert("Please Enter a Valid Year");
				formElement.csdyy.focus();
				return false;
			}
			if(ProEffyy<1900){
				alert("Please enter a Year After 1900");
				formElement.csdyy.focus();
				return false;
			}					
			if(isNaN(ProEffMM)){
					alert("Month should be numeric.");
					formElement.csdmm.focus();
					return false;					
			}
			if(!(isInteger(ProEffMM)))
			{
					alert("Month should be numeric.");
					formElement.csdmm.focus();
					return false;	
			}					
			
			if(isNaN(ProEffDD)){
					alert("Date should be numeric.");
					formElement.csddd.focus();
					return false;					
			}
			if(!(isInteger(ProEffDD)))
			{
					alert("Date should be numeric.");
					formElement.csddd.focus();
					return false;	
			}		
			if(isNaN(ProEffyy)){
					alert(" Year should be numeric.");
					formElement.csdyy.focus();
					return false;					
			}
			if(!(isInteger(ProEffyy)))
			{
					alert(" Year should be numeric.");
					formElement.csdyy.focus();
					return false;	
			}							
			if((ProEffMM!="")&&(ProEffDD!="")&&(ProEffyy!="")) {
			formElement.ProposedEffectiveDate.value=ProEffyy+"-"+ProEffMM+"-"+ProEffDD;
			formElement.ProposedEffectiveDate1.value=ProEffMM+"/"+ProEffDD+"/"+ProEffyy;
			}	
			//alert(formElement.ProposedEffectiveDate.value); */

			if(document.getElementById('csdmm')!=null ){
			   var dmonth=document.getElementById('csdmm').value;
			   if(dmonth==""){
			   		alert("Please Enter the Valid Month");
				    document.getElementById('csdmm').focus();
		   			return false;
			   }
			   
			   var dday=document.getElementById('csddd').value;
			   if(dday==""){
			   		alert("Please Enter the Valid Date");
				    document.getElementById('csddd').focus();
		   			return false;
			   }
			   
			   var dyear=document.getElementById('csdyy').value; 
			   if(dyear==""){
			   		alert("Please Enter the Valid Year");
				    document.getElementById('csdyy').focus();
		   			return false;
			   }
			   
			   var vardate=dmonth+'/'+dday+'/'+dyear;    
			   var result=isDate(vardate);

			   if(!result){
			   alert("Please enter valid proposed effective date");
			   return false;
			   }		   
				document.forms[0].ProposedEffectiveDate1.value =vardate;
			}	
			setHiddenValues();		
} 
function isInteger(s){
var i;
for (i = 0; i < s.length; i++){   
// Check that current character is number.
var c = s.charAt(i);         
if ((c < "0") || (c > "9")) return false;
}
// All characters are numbers.
return true;
} 	
function GoTOFindButton(){
	var formElement=document.forms[0];
	//var customerid = formElement.CustomerID.value;
	var url ="../InsuredAgencySearchPage.do"; 
    parameter ="formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(Object::Customer::CustomerId)="; 
    url = url+"?"+parameter;
   	formElement.action=url
    formElement.submit();
	return true;
} 

function GoTOFindButtonLIU(){
	var formElement=document.forms[0];
	//var customerid = formElement.CustomerID.value;
	//var url ="../InsuredAgencySearchPageLIU.do"; 
	var url ="../InsuredAgencySearchPageSubmission.do"; 
    parameter ="formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(forwardKey)=SubmissionAgencySuccess&answer(PageType)=SubmissionAgency&answer(Object::Customer::CustomerId)="; 
    url = url+"?"+parameter;
   	formElement.action=url
    formElement.submit();
	return true;
}  
function GoToSubmission()
{
		
		var flag = document.forms[0].flag.value;	
		//alert(document.forms[0].flag.value);
		if(flag =="In Progress")
		{
			document.forms[0].action="../GoToSubmission.do";
		}
		else if( flag == "Blocked")
		{
			document.forms[0].action="../SaveInsuredSubmissionClearanceAction.do";		
		}
		document.forms[0].submit();
}
	
function validateDateField(val,obj,desc)
{	

	if(obj.value>val || isNaN(obj.value)) 
	{
		obj.value='';
		obj.focus();
		alert("Please Enter the Valid "+desc);
		return false;
	}	
}

function setHiddenValues()
{
    var formElement=document.forms[0];

    if(formElement.NameType.value == 'Company')
    {
    	formElement.customerName1.value = formElement.LegalName1.value;
    //	formElement.customerName2.value = formElement.LegalName2.value;
    }
    else if(formElement.NameType.value == 'Person')
    {
    	formElement.customerName1.value = formElement.FirstName.value+" "; // +formElement.LastName.value;
   
    }    
    formElement.HNameType.value = formElement.NameType.value;
    formElement.HZip.value = formElement.Zip.value;
   // formElement.HDBA.value = formElement.DBA.value;    
}

