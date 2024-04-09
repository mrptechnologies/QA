var xmlHttp;

function territoryLookup(formElement, document)
{
	
	var zipCode = formElement.Zip.value
	var state = formElement.State.value
	var ruleCheck = formElement.ruleCheck.value	
	var zipChange = formElement.zipChange.value
	var pageRefreshWithRules = formElement.pageRefreshCheck.value
	var city = formElement.City.value
	var county = formElement.County.value
	var Rule_GA=formElement.Rulename1.value
	var Rule_DE=formElement.Rulename2.value
		
	if(city != "" && county!="") { 
		formElement.MultipleZipError.style.display='none';
		formElement.MultipleZipError.value="";
	}
	
	dynamicCostalwaterDistance(formElement,document);
	
	if(isInteger(zipCode))
	{
		
		if(zipCode!='' && zipChange!=zipCode){
		
			if(ruleCheck=='AddN')
			{
				document.getElementById("territorySpinner").style.display='inline';
				formElement.zipChange.value=zipCode;
				url="/AddNewRisk.do";
 				parameters="answer(Object::Risk::ResProperty::Zip)="+zipCode+"&answer(Object::Risk::ResProperty::City)="+city+"&answer(Object::Risk::ResProperty::CountyName)="+county+"&answer(Object::Risk::ResProperty::State)="+state+"&answer(Object::Risk::ResProperty::RuleCheck)=AddY";
 				createXMLHttpRequest();
 				getTheContent(url,parameters);
 				contentIsReady(formElement);
			}
			else
			{
				document.getElementById("territorySpinner").style.display='inline';
				formElement.zipChange.value=zipCode;
				url="/AddNewRisk.do";
 				parameters="answer(Object::Risk::ResProperty::Zip)="+zipCode+"&answer(Object::Risk::ResProperty::City)="+city+"&answer(Object::Risk::ResProperty::CountyName)="+county+"&answer(Object::Risk::ResProperty::State)="+state+"&answer(Object::Risk::ResProperty::RuleCheck)=EditY";
 				createXMLHttpRequest();
 				getTheContent(url,parameters);
 				contentIsReady(formElement);
			}	
		}
		
		if((zipCode!='' && zipChange==zipCode && pageRefreshWithRules=='Y') ||
			(zipCode!='' && zipChange!=zipCode && pageRefreshWithRules=='Y')){ 
				
			if(ruleCheck=='AddN')
			{
				url="/AddNewRisk.do";
 				parameters="answer(Object::Risk::ResProperty::Zip)="+zipCode+"&answer(Object::Risk::ResProperty::City)="+city+"&answer(Object::Risk::ResProperty::CountyName)="+county+"&answer(Object::Risk::ResProperty::State)="+state+"&answer(Object::Risk::ResProperty::RuleNameGA)="+Rule_GA+"&answer(Object::Risk::ResProperty::RuleNameDE)="+Rule_DE+"&answer(Object::Risk::ResProperty::RuleCheck)=AddY";
 				createXMLHttpRequest();
 				getTheContent(url,parameters);
 				contentIsReady(formElement);
			}
			else
			{
				url="/AddNewRisk.do";
 				parameters="answer(Object::Risk::ResProperty::Zip)="+zipCode+"&answer(Object::Risk::ResProperty::City)="+city+"&answer(Object::Risk::ResProperty::CountyName)="+county+"&answer(Object::Risk::ResProperty::State)="+state+"&answer(Object::Risk::ResProperty::RuleNameGA)="+Rule_GA+"&answer(Object::Risk::ResProperty::RuleNameDE)="+Rule_DE+"&answer(Object::Risk::ResProperty::RuleCheck)=EditY";
 				createXMLHttpRequest();
 				getTheContent(url,parameters);
 				contentIsReady(formElement);
			}	
		}
		
		
	}else{
		alert("Please enter a numeric value for zipcode");
		formElement.Zip.focus();
	}
}

function checkRules(formElement, document)
{
	var State = formElement.State.value
	var County = formElement.County.value
	var ruleValue1 = formElement.Rulename1.value
	var ruleValue2 = formElement.Rulename2.value
	var ruleQuestion1 = formElement.Q1.value
	var ruleQuestion2 = formElement.Q2.value
		
	if(State=='' && County=='')
	{
		formElement.Rulename1.style.display='none';
		formElement.Q1.style.display='none';
		formElement.Rulename2.style.display='none';
		formElement.Q2.style.display='none';
		ruleValue2='';
		ruleValue1='';
	}else{
		formElement.State.value=State;
		formElement.County.value=County;
	}
		
	if(	((State=='GA')&&  (County=='BRYAN')) ||
	    ((State=='GA')&& (County=='CAMDEN')) ||
	    ((State=='GA')&& (County=='CHATHAM'))||
	    ((State=='GA')&& (County=='GLYNN'))||
	    ((State=='GA')&& (County=='LIBERTY'))||
	    ((State=='GA')&& (County=='MCINTOSH')))
	{		
		formElement.Q2.style.display='none';
		formElement.Rulename2.style.display='none';
		ruleValue2='';
		formElement.Q1.style.display='inline';
		formElement.Rulename1.style.display='inline';
		formElement.pageRefreshCheck.value='Y'
	
	}
	else if(State=='DE'&& County=='SUSSEX')
	{
		formElement.Q1.style.display='none';
		formElement.Rulename1.style.display='none';
		ruleValue1='';
		formElement.Q2.style.display='inline';
		formElement.Rulename2.style.display='inline';	
		formElement.pageRefreshCheck.value='Y'
	}
	else
	{
		formElement.Q1.style.display='none';
		formElement.Rulename1.style.display='none';
		formElement.Q2.style.display='none';
		formElement.Rulename2.style.display='none';
		ruleValue1='';
		ruleValue2='';
	}		
}

function hideRule(formElement, document)
{
	
	formElement.Q1.style.display='none';
	formElement.Rulename1.style.display='none';
	formElement.Q2.style.display='none';
	formElement.Rulename2.style.display='none';
	ruleValue1='';
	ruleValue2='';
}

function checkTerritoryValue(formElement, document)
{
	var territoryValue = formElement.RatingTerritory.value;
	var zipCode = formElement.Zip.value;
	
	if(territoryValue==0)
	{
		formElement.RatingTerritory.value='';
	}else{
		formElement.RatingTerritory.value=territoryValue;
	}
	if(zipCode==0)
	{
		formElement.Zip.value='';
	}else{
		formElement.Zip.value=zipCode;
	}

}

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

function territoryLookpupForRules(formElement, document)
{
	formElement.pageRefreshCheck.value ='Y';
	formElement.Zip.focus();
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
    var formElement=document.forms[0];
    var city = formElement.City.value;
	var county = formElement.County.value;
    
    if(xmlHttp && xmlHttp.readyState == 4){
    
    	//alert(xmlHttp.responseXML);
    	var territoryResult = xmlHttp.responseText;
    	
    	var territoryCode ="";
    	if(territoryResult!="") {
    		
    		var territoryresults = territoryResult.split('::');
    		
    		var territoryScuuess = territoryresults[0];
    		var replaceCityCounty=territoryresults[7];
    		
    		if(territoryScuuess=="TRUE") {
    			
    			territoryCode = territoryresults[1];
    			formElement.MultipleZipError.style.display='none';
    			formElement.MultipleZipError.value="";
    			formElement.isValidZip.value="YES";
    			
    		}else if(territoryresults[6]=="NO"){
    		 	formElement.MultipleZipError.style.display='inline';
    			formElement.MultipleZipError.value="Invalid Zipcode.Please Enter the Valid Zip Code";	
    			formElement.isValidZip.value="NO";
    			
      		}else {
    		 	formElement.MultipleZipError.style.display='inline';
    			formElement.MultipleZipError.value="Territory Not Found";
    		}
    		formElement.RatingTerritory.value=territoryCode;
    		var multipleZip = territoryresults[2];
    		
    		if(multipleZip=="YES") {
    			formElement.isValidZip.value="YES";
    			formElement.MultipleZipError.style.display='inline';
    			formElement.MultipleZipError.value="Multiple Zipcode Found. Please Select City/County/ZIP";
    			formElement.State.focus();
				var mylink =window.open("../SearchZipCode.do?answer(Object::ZipCode::PageNum)=0&FormName=AddRisk&HomeFlag=Business&clear=yes",'Zipcode', 'width=550, height=350, left=550, top=125, scrollbars=yes');
				mylink.focus();
		
    		} else if(multipleZip=="NO" && replaceCityCounty=="YES" && territoryScuuess=="TRUE") {
    			
    			formElement.isValidZip.value="YES";
    			formElement.City.value = territoryresults[3];
	    		formElement.County.value=territoryresults[4];
	    		formElement.State.value=territoryresults[5];
    			
    		}else if(replaceCityCounty=="EMPTY" && territoryScuuess=="TRUE") { 
    		
    			formElement.isValidZip.value="YES";
    			formElement.City.value = territoryresults[3];
	    		formElement.County.value=territoryresults[4];
	    		formElement.State.value=territoryresults[5];
	    		formElement.MultipleZipError.style.display='inline';
				var errorMsg="Multiple Zipcode Found.Please Select the Correct City/County/ZIP";				
    			formElement.MultipleZipError.value=errorMsg;
    		
    		}else if((multipleZip=="NO" && territoryScuuess=="TRUE")) {
    			
    			formElement.isValidZip.value="YES";
    			if(city == "" && county=="") {
	    			formElement.City.value = territoryresults[3];
	    			formElement.County.value=territoryresults[4];
	    			formElement.State.value=territoryresults[5];
	    			
    			}
    		}      		    				    	
    		
    	}
    	dynamicCostalwaterDistance(formElement,document);
    	document.getElementById("territorySpinner").style.display='none';
    }
    
}
