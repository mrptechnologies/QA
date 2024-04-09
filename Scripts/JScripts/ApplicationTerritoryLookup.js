function getTerritory() {  
   var formElement = document.Property;
   var State = formElement.State.value;
   var County = formElement.County.value
    var city = formElement.City.value
   var zipCode = formElement.Zip.value;
   var errorHandlerElement = document.getElementById("ErrorHandler");
   var objName = document.getElementsByName('answer(objectName)')[0].value;
   
   if(zipFromUI!=zipCode) {
   if(zipCode!="") {
   	formElement.RatingTerritory.value='';
   }
   zipFromUI=zipCode;
	   if(	((State=='GA')&&  (County=='BRYAN')) ||
		    ((State=='GA')&& (County=='CAMDEN')) ||
		    ((State=='GA')&& (County=='CHATHAM'))||
		    ((State=='GA')&& (County=='GLYNN'))||
		    ((State=='GA')&& (County=='LIBERTY'))||
		    ((State=='GA')&& (County=='MCINTOSH')))
		{
		
			if(objName=='PRODUCT') 
			{executeApplicationRule('GET_SUB_QUESTION',new Array('112'),105,134);
			}else{
			executeApplicationRule('GET_SUB_QUESTION',new Array('112'),104,104);
			}
			
		
		}else if(State=='DE'&& County=='SUSSEX')
		{
			if(objName=='PRODUCT') {	
			executeApplicationRule('GET_SUB_QUESTION',new Array('111'),105,134);
			}else{
			executeApplicationRule('GET_SUB_QUESTION',new Array('111'),104,104);
			}
			
		}
		
		if(formElement.Zip.value!=""){
			territorylookup();	
		}
	} else {
		if(County!="" && zipCode!="" && city !="") {
			errorHandlerElement.value="";
	    	errorHandlerElement.style.display='none';
		}
	}
   
}

function territorylookup() {
	
   var formElement = document.Property;
   formElement.RatingTerritory.value='';
   formElement.RatingTerritoryName.value='';
   formElement.Zone.value='';
   var Rule_GA='Beach_Territory_NO';
   var Rule_DE='Route_113_EAST'
   var zipCode = formElement.Zip.value;
   var state = formElement.State.value
   var city = formElement.City.value
   var county = formElement.County.value
   if(formElement.RuleNameGA != null) {
   	Rule_GA=formElement.RuleNameGA.value;
   }
   if(formElement.RuleNameDE != null) {
   	Rule_DE=formElement.RuleNameDE.value;
   }
   
   url="/AddNewRisk.do";
   parameters="answer(Object::Risk::ResProperty::Zip)="+escape(zipCode)+"&answer(Object::Risk::ResProperty::City)="+escape(city)+"&answer(Object::Risk::ResProperty::CountyName)="+escape(county)+"&answer(Object::Risk::ResProperty::State)="+escape(state)+
                                              "&answer(Object::Risk::ResProperty::RuleNameGA)="+Rule_GA+"&answer(Object::Risk::ResProperty::RuleNameDE)="+Rule_DE+"&answer(Object::Risk::ResProperty::RuleCheck)=AddY";
   createXMLHttpRequestForTerritory();
   getTheContentForTerritory(url,parameters);
   //territoryContentIsReady(formElement);
} 

function getTheContentForTerritory(URL,parameters){
	xmlHttpReq.onreadystatechange = territoryContentIsReady;
	xmlHttpReq.open("POST", URL,true);
	xmlHttpReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlHttpReq.setRequestHeader("Content-length", parameters.length);
    xmlHttpReq.setRequestHeader("Connection", "close");
    xmlHttpReq.send(parameters);
}

function territoryContentIsReady() {
	var formElement=document.Property;	
	
	/**
	 * To Process the result when server response with result.(Ready state = 4)
	 */
	if(xmlHttpReq && xmlHttpReq.readyState == 4){        
	    
	    /**
	     * Variable Declaration
	     */
	    var territoryResult = xmlHttpReq.responseText;
	    var errorHandlerElement = document.getElementById("ErrorHandler");
	    var territoryresults = territoryResult.split('::');
	    var territoryScuuess = territoryresults[0];
	    var canReplaceCityCountyStae=territoryresults[7];	    
	   
	    /**
	     * To Process Result, while territorySuccess flag is true
	     */
	    if(territoryScuuess=="TRUE") {
	    	formElement.RatingTerritory.value=territoryresults[1];
	    	var territoryElement=document.getElementsByName("answer(teritory)");
	    	var territoryElementApp=document.getElementsByName("answer(riskTerritory)");
	    	var territoryNameElement=document.getElementsByName("answer(territoryName)");
	    	var zoneElement=document.getElementsByName("answer(zone)");
	    	if(territoryElement.length>0){
	    		territoryElement[0].value=territoryresults[1];
	    	}else if(territoryElementApp.length>0) {
	    		territoryElementApp[0].value=territoryresults[1];
	    	}
	    	if(zoneElement.length>0){
	    		zoneElement[0].value=territoryresults[9];
	    	}
	    	if(territoryNameElement.length>0){
	    		territoryNameElement[0].value=territoryresults[8];
	    	}
	    }else {
	    	formElement.City.value = '';
		   	formElement.County.value='';
		   	formElement.RatingTerritory.value='';
		   	formElement.Zone.value='';
		   	formElement.RatingTerritoryName.value='';
	    }
	    
	    /**
	     * Replace the city,county & state to UI when, canReplaceCityCountyStae flag set as Yes 
	     */
	    if(canReplaceCityCountyStae=="YES") {
	    	formElement.City.value = territoryresults[3];
		   	formElement.County.value=territoryresults[4];
		   	formElement.State.value=territoryresults[5];
	    }
	    var stateElement=document.getElementsByName("answer(state)");
	    var stateElementApp=document.getElementsByName("answer(State)");	    
	    
	    /**
	     *Replace the State, AJAX response with state
	     */
	    if(stateElement.length>0) {
	    	stateElement[0].value=territoryresults[5];
	    } else if(stateElementApp.length>0) {
	    	stateElementApp[0].value=territoryresults[5];
	    }   
	    
	    /**
	     * To show the alert message while multiple county,city found for same zipcode
	     */	    
	    var multipleZip = territoryresults[2];
	    if(multipleZip=="YES") {
	    	formElement.State.value=territoryresults[5];
	    	errorHandlerElement.style.display='inline';
			var errorMsg="Multiple Zipcode Found.Please Select the City/County/ZIP";
			errorHandlerElement.value=errorMsg;
	    }else if(canReplaceCityCountyStae=="EMPTY" && territoryScuuess=="TRUE") {
	    	formElement.City.value = territoryresults[3];
		   	formElement.County.value=territoryresults[4];
		   	formElement.State.value=territoryresults[5];
		   	errorHandlerElement.style.display='inline';
			var errorMsg="Multiple Zipcode Found.Please Select the City/County/ZIP";
			errorHandlerElement.value=errorMsg;
	    } else {
	    	errorHandlerElement.value="";
	    	errorHandlerElement.style.display='none';
	    }	
	    var territoryName = territoryresults[8];
	    var zone = territoryresults[9];
	    if(territoryName != null && zone != null && territoryName != "" && zone != "")    {
	    	formElement.Zone.value=zone;
	    	formElement.RatingTerritoryName.value=territoryName;
	    	
	    }
	    
	    var objName = document.getElementsByName('answer(objectName)')[0].value;
	    if (formElement.State.value=="FL"){	    
	    	if(objName=='PRODUCT') {	
			executeApplicationRule('GET_SUB_QUESTION',new Array('160'),105,134);
			}else{
			executeApplicationRule('GET_SUB_QUESTION',new Array('160'),104,104);
			}
		}else {
			if(objName=='PRODUCT') {	
			executeApplicationRule('GET_SUB_QUESTION',new Array('138'),105,134);
			}else{
			executeApplicationRule('GET_SUB_QUESTION',new Array('138'),104,104);
			}
		}
	}	
}

var xmlHttpReq;
/**
 *To create the XML REQUEST
 */
 function createXMLHttpRequestForTerritory(){
 	autologout();
    xmlHttpReq = null;
    if(window.XMLHttpRequest){
	     xmlHttpReq = new XMLHttpRequest();
    }
    if(window.ActiveXObject){
		 try {
			xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
            
			
        }
        catch(e){
        try {
			xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
            
			
        }
        catch(e){
            try {
				xmlHttpReq = new ActiveXObject("MSXML2.XMLHTTP");
                
            }
            catch(e){
                try {
		            xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP.4.0");
                }
                catch(e){
                    xmlHttpReq = null;
                }
            }
        }
		}
    }
    return xmlHttpReq;
}

//To generate the google map for given address
function MapPopup(mylink) {

 var riskAddress1, riskAddress2, city, state, zipCode;
 var formElement=document.Property,href="";
 riskAddress1=formElement.StreetNumber.value+' '+formElement.StreetName.value;
 riskAddress2=formElement.Address2.value;
 city=formElement.City.value;
 state=formElement.State.value;
 zipCode=formElement.Zip.value;  
 
  if(riskAddress1!="") {
    href=riskAddress1;
   }
    if(riskAddress2!="" && href!="")  {
         href=href+", "+riskAddress2;
       } else {
       href=href+riskAddress2;
    }
    if(city!="" && href!="")    {
       href=href+", "+city;
    } else {
       href=href+city;
    }
    if(state!="" && href!="")    {
       href=href+", "+state;
    } else {
       href=href+state;
    }
    if(zipCode!="" && href!="")    {
       href=href+", "+zipCode;
    } else {
       href=href+zipCode;
    }

 href='http://www.google.com/maps?q='+href+'&amp;hl=en';
 window.open(href, "MapWindow", "width=850,height=800,left=350,top=125,resizable=1,scrollbars=yes");
}

function validateNewRepeatedSubApp(frm) {
	if(frm.name=='LossHistory') {		
		var dateElement =document.getElementsByName('answer(Object::Risk::ResProperty::LossHistory::LossDate__DMS_RISK_RES_PROPERTY_LOSS_HISTORY~LOSS_DATE@-1)')[0];
		var date=dateElement.value;
		var lossType=document.getElementsByName('answer(Object::Risk::ResProperty::LossHistory::LossType__DMS_RISK_RES_PROPERTY_LOSS_HISTORY~LOSS_TYPE@-1)')[0].value;
		var descElement=document.getElementsByName('answer(Object::Risk::ResProperty::LossHistory::LossCause__DMS_RISK_RES_PROPERTY_LOSS_HISTORY~LOSS_CAUSE@-1)')[0];
		var desc=descElement.value;
		var insComp=document.getElementsByName('answer(Object::Risk::ResProperty::LossHistory::InsCompanyName__DMS_RISK_RES_PROPERTY_LOSS_HISTORY~INS_COMPANY_NAME@-1)')[0].value;
		var amtElement = document.getElementsByName('answer(Object::Risk::ResProperty::LossHistory::AmountPaidReceived__DMS_RISK_RES_PROPERTY_LOSS_HISTORY~AMT_PAID_RESERVED@-1)')[0];
		var amt=amtElement.value;
		if(date!='' || lossType!='' || desc!='' || insComp!='' || amt) {
			if(date ==""){
				alert('Please Enter the Loss Date');
				setFocus(dateElement);
				return false;
			}		
			if(desc ==""){
				alert('Please Enter the Loss Description');
				setFocus(descElement);
				return false;
			}
			if(amt ==""){
				alert('Please Enter the valid Amount Paid/Reserved');
				setFocus(amtElement);
				return false;
			}
		}
	
	} else if(frm.name=='AdditionalInterests') {
		
		var addInterest=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::InterestType__DMS_RISK_RES_PROPERTY_ADDITIONAL_INTEREST~ADDITIONAL_INTEREST_TYPE@-1)')[0].value;
		var nameElement =document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::InterestCompanyName__DMS_RISK_RES_PROPERTY_ADDITIONAL_INTEREST~ADDITIONAL_INTEREST_COMPANY_NAME@-1)')[0];
		var name=nameElement.value;
		var loanNumber=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::LoanNumber__DMS_RISK_RES_PROPERTY_ADDITIONAL_INTEREST~LOAN_NUMBER@-1)')[0].value;
		var add1=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::Address1__DMS_RISK_RES_PROPERTY_ADDITIONAL_INTEREST~ADDRESS_1@-1)')[0].value;
		var add2=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::Address2__DMS_RISK_RES_PROPERTY_ADDITIONAL_INTEREST~ADDRESS_2@-1)')[0].value;
		var city=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::City__DMS_RISK_RES_PROPERTY_ADDITIONAL_INTEREST~CITY@-1)')[0].value;
		var state=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::State__DMS_RISK_RES_PROPERTY_ADDITIONAL_INTEREST~STATE@-1)')[0].value;
		var zipCode=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::Zip__DMS_RISK_RES_PROPERTY_ADDITIONAL_INTEREST~ZIP@-1)')[0].value;
		
		if(addInterest!=''|| name!=''|| loanNumber!=''|| add1!=''|| add2!=''|| city!=''|| state!=''|| zipCode!='') {
			
			if(name ==""){
				alert('Please Enter the Name');
				setFocus(nameElement);
				return false;
			}
		}
	}
	return true;
}

function setFocus(ele) {
ele.style.background='#FFCC33';
ele.focus();
}

function validateNewRepeatedQuoteSubApp(frm) {
	if(frm.name=='LossHistory') {		
		var dateElement =document.getElementsByName('answer(Object::Risk::ResProperty::LossHistory::LossDate__DMS_QUOTE_RISK_RES_PROPERTY_LOSS_HISTORY_ITEM_DETAIL~LOSS_DATE@-1)')[0];
		var date=dateElement.value;
		var lossType=document.getElementsByName('answer(Object::Risk::ResProperty::LossHistory::LossType__DMS_QUOTE_RISK_RES_PROPERTY_LOSS_HISTORY_ITEM_DETAIL~LOSS_TYPE@-1)')[0].value;
		var descElement=document.getElementsByName('answer(Object::Risk::ResProperty::LossHistory::LossCause__DMS_QUOTE_RISK_RES_PROPERTY_LOSS_HISTORY_ITEM_DETAIL~LOSS_CAUSE@-1)')[0];
		var desc=descElement.value;
		var insComp=document.getElementsByName('answer(Object::Risk::ResProperty::LossHistory::InsCompanyName__DMS_QUOTE_RISK_RES_PROPERTY_LOSS_HISTORY_ITEM_DETAIL~INS_COMPANY_NAME@-1)')[0].value;
		var amtElement = document.getElementsByName('answer(Object::Risk::ResProperty::LossHistory::AmountPaidReceived__DMS_QUOTE_RISK_RES_PROPERTY_LOSS_HISTORY_ITEM_DETAIL~AMT_PAID_RESERVED@-1)')[0];
		var amt=amtElement.value;
		if(date!='' || lossType!='' || desc!='' || insComp!='' || amt) {
			if(date ==""){
				alert('Please Enter the Loss Date');
				setFocus(dateElement);
				return false;
			}		
			if(desc ==""){
				alert('Please Enter the Loss Description');
				setFocus(descElement);
				return false;
			}
			if(amt ==""){
				alert('Please Enter the valid Amount Paid/Reserved');
				setFocus(amtElement);
				return false;
			}
		}
	
	} else if(frm.name=='AdditionalInterests') {
		
		var addInterest=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::InterestType__DMS_QUOTE_RISK_RES_PROPERTY_ADDITIONAL_INTEREST_ITEM_DETAIL~ADDITIONAL_INTEREST_TYPE@-1)')[0].value;
		var nameElement =document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::InterestCompanyName__DMS_QUOTE_RISK_RES_PROPERTY_ADDITIONAL_INTEREST_ITEM_DETAIL~ADDITIONAL_INTEREST_COMPANY_NAME@-1)')[0];
		var name=nameElement.value;
		var loanNumber=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::LoanNumber__DMS_QUOTE_RISK_RES_PROPERTY_ADDITIONAL_INTEREST_ITEM_DETAIL~LOAN_NUMBER@-1)')[0].value;
		var add1=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::Address1__DMS_QUOTE_RISK_RES_PROPERTY_ADDITIONAL_INTEREST_ITEM_DETAIL~ADDRESS_1@-1)')[0].value;
		var add2=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::Address2__DMS_QUOTE_RISK_RES_PROPERTY_ADDITIONAL_INTEREST_ITEM_DETAIL~ADDRESS_2@-1)')[0].value;
		var city=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::City__DMS_QUOTE_RISK_RES_PROPERTY_ADDITIONAL_INTEREST_ITEM_DETAIL~CITY@-1)')[0].value;
		var state=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::State__DMS_QUOTE_RISK_RES_PROPERTY_ADDITIONAL_INTEREST_ITEM_DETAIL~STATE@-1)')[0].value;
		var zipCode=document.getElementsByName('answer(Object::Risk::ResProperty::AdditionalInterest::Zip__DMS_QUOTE_RISK_RES_PROPERTY_ADDITIONAL_INTEREST_ITEM_DETAIL~ZIP@-1)')[0].value;
		
		if(addInterest!=''|| name!=''|| loanNumber!=''|| add1!=''|| add2!=''|| city!=''|| state!=''|| zipCode!='') {
			
			if(name ==""){
				alert('Please Enter the Name');
				setFocus(nameElement);
				return false;
			}
		}
	}
	return true;
}