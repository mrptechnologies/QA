
function isOther(formElement,document) {
	
	var type = formElement.constructionType.value
	var ruleValue1 = formElement.Rulename1.value
	var ruleValue2 = formElement.Rulename2.value
	checkRules(formElement, document);
	
	dynamicCostalwaterDistance(formElement,document);
	if(type=="Other") {
		
		formElement.constructionOther.style.visibility='visible';
		var value1 = formElement.constructionOther.value
		
		if(value1=='') {
		
			formElement.constructionOther.value='If Other';
		} else {
		
			formElement.constructionOther.value=value1;	
		}
		
	} else {
		formElement.constructionOther.style.visibility='hidden';
		formElement.constructionOther.value='';
		
	}
	
	var heatType = formElement.heatSourceType.value
	
	if(heatType=="Other") {
		
		formElement.heatSourceOther.style.visibility='visible';
		var value2 = formElement.heatSourceOther.value
		
		if(value2=='') {
		
			formElement.heatSourceOther.value='If Other';
		} else {
		
			formElement.heatSourceOther.value=value2;	
		}
		
	} else {
		formElement.heatSourceOther.style.visibility='hidden';
		formElement.heatSourceOther.value='';
	}
	
	
	var occupancyType = formElement.occupancyType.value
	
	if(occupancyType=="Other") {
		
		formElement.occupancyOther.style.visibility='visible';
		var value3 = formElement.occupancyOther.value
		
		if(value3=='') {
		
			formElement.occupancyOther.value='If Other';
		} else {
		
			formElement.occupancyOther.value=value3;	
		}
		
	} else {
		formElement.occupancyOther.style.visibility='hidden';
		formElement.occupancyOther.value='';
	}
	
	var cityCountyValue = formElement.cityCountyEmpty.value
	
	if(cityCountyValue=="YES") {
	
		formElement.State.focus();
		var mylink =window.open("../SearchZipCode.do?answer(Object::ZipCode::PageNum)=0&FormName=AddRisk&HomeFlag=Business&clear=yes",'Zipcode', 'width=550, height=350, left=550, top=125, scrollbars=yes');
		mylink.focus();
		
		return false;
	}
	
	var ziplookup = formElement.reqVal.value	
		
	if(ziplookup=="YES") {
	
		formElement.State.focus();
		var mylink =window.open("../SearchZipCode.do?answer(Object::ZipCode::PageNum)=0&FormName=AddRisk&HomeFlag=Business&clear=yes",'Zipcode', 'width=400, height=260, left=400, top=150, scrollbars=yes');
		mylink.focus();
		
		return false;
	}
	
	if(formElement.wiringUpdatedNo.checked) {
		
		formElement.WiringUpdated.readOnly=true;
		formElement.heatingUpdated.readOnly=true;
		formElement.plumbingUpdated.readOnly=true;
		formElement.WiringUpdated.value='';
		formElement.heatingUpdated.value='';
		formElement.plumbingUpdated.value='';
	}
	
	if(formElement.roofUpdatedNo.checked) {
		
		formElement.roofUpdated.readOnly=true;
		formElement.roofUpdated.value='';
	}
	
	
	
}


/*To assign the insured mailing address to risk mailing address */
function addressSelect(formElement,document) {
	
	var add1 = formElement.add1.value
	var add2 = formElement.add2.value
	var city = formElement.inscity.value
	var county = formElement.inscounty.value
	var zip = formElement.inszip.value
	var state = formElement.insstate.value
	
	formElement.riskAdd1.value=add1;
	formElement.riskAdd2.value=add2;
	formElement.City.value=city;
	formElement.County.value=county;
	formElement.Zip.value=zip;
	formElement.State.value=state;
	formElement.Zip.focus();

}

/*To clear the mailing address of risk */
function addressClear(formElement,document) {
	
	formElement.riskAdd1.value='';
	formElement.riskAdd2.value='';
	formElement.City.value='';
	formElement.County.value='';
	formElement.Zip.value='';
	formElement.State.value=''
	formElement.riskAdd1.focus();

}

function othersClear(formElement,document) {

	var value1 =formElement.constructionOther.value
	
	if(value1=='If Other') {

		formElement.constructionOther.value='';
	} else {
	
		formElement.constructionOther.value=value1;
	}
	
	var value2 =formElement.heatSourceOther.value
	
	if(value2=='If Other') {

		formElement.heatSourceOther.value='';
	} else {
	
		formElement.heatSourceOther.value=value2;
	}
	
	var value3 =formElement.occupancyOther.value
	
	if(value3=='If Other') {

		formElement.occupancyOther.value='';
	} else {
	
		formElement.occupancyOther.value=value3;
	}
	
}

function roofDisable(formElement,document) {
	
	formElement.roofUpdated.readOnly=true;
	formElement.roofUpdated.value='';
}

function roofEnable(formElement,document) { 
	
	formElement.roofUpdated.readOnly=false;
	formElement.roofUpdated.value='';
}

function wiringDisable(formElement,document) {
	
	formElement.WiringUpdated.readOnly=true;
	formElement.heatingUpdated.readOnly=true;
	formElement.plumbingUpdated.readOnly=true;
	formElement.WiringUpdated.value='';
	formElement.heatingUpdated.value='';
	formElement.plumbingUpdated.value='';
}

function wiringEnable(formElement,document) {
	
	formElement.WiringUpdated.readOnly=false;
	formElement.heatingUpdated.readOnly=false;
	formElement.plumbingUpdated.readOnly=false;
	formElement.WiringUpdated.value='';
	formElement.heatingUpdated.value='';
	formElement.plumbingUpdated.value='';
}

/*Validation for add or edit risk */

function validate(){

	var formElement=document.forms[0];
	
	var riskName = formElement.riskName.value
	if(riskName=="") {
	
		alert("Please Enter the RiskName");	
		return false;
	}
	
	/*var riskNumber = formElement.riskNumber.value
	if(riskNumber=="") {
	
		alert("Please Enter the RiskNumber");	
		return false;
	}*/
	
	var state = formElement.State.value
	if(state=="") {
	
		alert("Please Select any State");	
		return false;
	}
	
	var zip = formElement.Zip.value
	if(zip=="") {
	
		alert("Please Enter the Zip Code");	
		return false;
	}
	
	var yearbuilt = formElement.YearBuilt.value
	if(yearbuilt=="") {
	
		alert("Please Enter the Year Built");	
		return false;
	} 
	if(!validateyear(formElement)) {
		alert("Please Enter Valid Year");
		return false;
	}
	
	var constructionType = formElement.constructionType.value
	if(constructionType=="") {
	
		alert("Please Enter the Construction Type");	
		return false;
	} 

	var protectionClass = formElement.ProtectionClass.value
	if(protectionClass=="") {
	
		alert("Please Enter the Protection Class");	
		return false;
	} 
	
	var familes = formElement.NoOfFamiles.value
	if(familes=="") {
	
		alert("Please Enter the # of Families");	
		return false;
	}
	
	var heatSource = formElement.heatSourceType.value
	if(heatSource=="") {
	
		alert("Please Enter the Primary Heat Source");	
		return false;
	}
	
	var occupancy = formElement.occupancyType.value
	if(occupancy=="") {
	
		alert("Please Enter the Occupancy");	
		return false;
	}
	
	var residenceType = formElement.ResidenceType.value
	if(residenceType=="") {
	
		alert("Please Enter the Type of Residence");	
		return false;
	}
	
	var costalWaterDistance1 = formElement.CostalWaterDistanceTemp1.value
	var costalWaterDistance2 = formElement.CostalWaterDistanceTemp2.value
	if(costalWaterDistance1=="" && costalWaterDistance2=="") {
	
		alert("Please Enter the CoastalWaterDistance");	
		return false;
	} 
	
	if(costalWaterDistance1!="") {
		formElement.CostalWaterDistance.value=costalWaterDistance1;
		
	}
	
	if(costalWaterDistance2!="") {
		formElement.CostalWaterDistance.value=costalWaterDistance2;
	}
	
	var marketValue = formElement.MarketValue.value
	if(marketValue!="") {
		if(!isDecimalforMarketValue(marketValue)) {
		alert("Please Enter Valid amount for Market Value.");
		return false;
		} 
	}
	
	var sfeet = formElement.SFeet.value
	if(sfeet!="") {
		if((!isInteger(sfeet) ||sfeet==0 )) {
			alert("Please Enter Valid Sq.Ft");
			return false;	
		}
	}
	
    var FireHydrant = formElement.FireHydrant.value
	if(FireHydrant!="") {
		if(!isDecimal(FireHydrant)) {
			alert("Please Enter Valid FireHydrant Distance");
			return false;	
		} 
	} 
	
	var FireStation = formElement.FireStation.value
	if(FireStation!="") {
		if(!isDecimal(FireStation)) {
			alert("Please Enter Valid FireStation Distance");
			return false;	
		}
	}
	
	var isValidYear = formElement.isValidZip.value;
	if(isValidYear=="NO") {
	
		alert("Please Enter Valid ZipCode");	
		return false;
	}
	
		
	return newchecksubmitcount();
}

function validateyear(formElement) {

	var dat = new Date();
	
	var currentyear = dat.getFullYear();
	
	var yearBuilt=formElement.YearBuilt.value
	
	var isValid= isInteger(yearBuilt);
	
	if(!isValid) {
	
		
		return false;
	} else {
	
		if(yearBuilt>currentyear || yearBuilt==0) {
		
			
			return false;
		} else {
		
			if(yearBuilt.length<4) {
			
				
				return false;
			} 
		
		}
	
	}
	return true;
}

function isInteger(data)
{   var index;
    for (index = 0; index < data.length; index++)
    {   
        // Check that current character is number.
        var c = data.charAt(index);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function isDecimal(data)
{   var index;
    for (index = 0; index < data.length; index++)
    {   
        // Check that current character is number.
        var c = data.charAt(index);
        if (((c < "0") || (c > "9"))) {
      
       		if(c==".") {
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

function dynamicSelect(formElement) {
	
	var state =formElement.State.value
	var territory = formElement.RatingTerritory.value
	
	if((state=='NC' && territory=='4') || (state=='SC' && territory=='2')) {
		
		dynamicOption(formElement);
	}
}

function dynamicOption(c) {

	var count;
	var option =formElement.CostalWaterDistance.options.length
    for (count = 0 ; count < option ; count++){
    formElement.CostalWaterDistance.remove(count);

    }
          
    var optn1 = document.createElement ("OPTION");
	optn1.text = "Select";
	optn1.value = '';
	formElement.CostalWaterDistance[0] = optn1;
	
	var optn2 = document.createElement ("OPTION");
	optn2.text = "< 5 miles";
	optn2.value = '<5 miles';
	formElement.CostalWaterDistance[1] = optn2;
	
	var optn3 = document.createElement ("OPTION");
	optn3.text = "5-10 miles";
	optn3.value = '5-10 miles';
	formElement.CostalWaterDistance[2] = optn3;
	
	var optn4 = document.createElement ("OPTION");
	optn4.text = "1st tier county >10 miles";
	optn4.value ='1st tier county >10 miles';
	formElement.CostalWaterDistance[3] = optn4;
	
	var optn5 = document.createElement ("OPTION");
	optn5.text = "2nd tier county";
	optn5.value = '2nd tier county';
	formElement.CostalWaterDistance[4] = optn5;
}

function validateLHyear(data) {

	var dat = new Date();
	
	var currentyear = dat.getFullYear();
	
	var year=data;
	
	if(year>currentyear || year==0) {
			
		return false;
	} else {
		
		return true;
	}
}

function isDate(data)
{   var index;
    
    if(data.length==10) {
	    for (index = 0; index < data.length; index++)
	    {   
	        // Check that current character is number.
	        var c = data.charAt(index);
	        if (((c < "0") || (c > "9"))) {
	      
	       		if(index=='2' || index=='5') {
		       		if(c!="/") {
		       			return false;
		  	 		}
		       	 } else {
		       	 	return false;
		       	 }
		     }
	    }
	    // All characters are numbers.
	    return true;
	} else {
	
		return false;
	}
}

function checkMarketValue(formElement,document) {

	var marketvalue = formElement.MarketValue.value;
	var dot = "true";
	
	if(marketvalue.length==7) { 
		
		for(index=0;index<marketvalue.length;index++){ 
			if(marketvalue.charAt(index)=='.') {
				dot ="false";
			}  
		}
		if(dot=="true"){
		
			marketvalue=marketvalue+'.';
			formElement.MarketValue.value =marketvalue;
		}
	}
	
	
}

function isDecimalforMarketValue(data)
{   var index;
    for (index = 0; index < data.length; index++)
    {   
        // Check that current character is number.
        var c = data.charAt(index);
        if (((c < "0") || (c > "9"))) {
      
       		if((c=="." && index<="7")) {
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

function dynamicCostalwaterDistance(formElement,document) {
	
	var state =formElement.State.value
	var territory = formElement.RatingTerritory.value
	
	if((state=='NC' && territory=='4') || (state=='SC' && territory=='2')) {
		
		dynamicOptionforCostalWater(formElement,document);
	} else {
		
		document.getElementById("CostalWaterTemp1").style.display='inline';
		document.getElementById("CostalWaterTemp2").style.display='none';
	
		var  costalValue= formElement.CostalWaterDistance.value;
	
		if(costalValue!=25000 && costalValue!=50000 && costalValue!=100000 && costalValue!=-1 && costalValue !="") {
			
			formElement.CostalWaterDistanceTemp1.value=costalValue;
			formElement.CostalWaterDistanceTemp2.value="";
		} else {
		
			formElement.CostalWaterDistanceTemp1.value="";
			formElement.CostalWaterDistanceTemp2.value="";
		}
	
	}
}

function dynamicOptionforCostalWater(formElement,document) {
	
	document.getElementById("CostalWaterTemp1").style.display='none';
	document.getElementById("CostalWaterTemp2").style.display='inline';
	
	var  costalValue= formElement.CostalWaterDistance.value;

	if(costalValue!=500 && costalValue!=4000 && costalValue!=20000 && costalValue!=30000 && costalValue !="") {
		formElement.CostalWaterDistanceTemp2.value=costalValue;
		formElement.CostalWaterDistanceTemp1.value="";
	} else {
		formElement.CostalWaterDistanceTemp2.value="";
		formElement.CostalWaterDistanceTemp1.value="";
	}
}


