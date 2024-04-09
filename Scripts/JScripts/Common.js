var formSubmission = false;
var removeObject=false;
var formSubmitType='Update';
var updateElement='Update';
var deleteElement='Delete';
var addElement='Add';

function setDefaultFocus()
{
	// Script Courtsy - javascript.internet.com/forms/form-focus.html

	/*
	 * Sets focus on the first editable field in the web page
	 */

	if (document.forms.length > 0) {
	var field = document.forms[0];
	for (i = 0; i < field.length; i++) {
	if (((field.elements[i].type == "text") || (field.elements[i].type == "textarea") || (field.elements[i].type.toString().charAt(0) == "s"))&&(field.elements[i].disabled!=true)) {
	document.forms[0].elements[i].focus();
	break;
			}
		}
	}
}

function checkMail(emailStr)
{
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(emailStr))
	{
		return false;
	}
	else
	{
		return true;
	}
}

//Some date Functions
// http://www.apriori-it.co.uk/FormatDate.asp

var defaultDateFormat = "mm/dd/yyyy";
function isDate(DateToCheck){
	if(DateToCheck==""){return true;}

	var m_strDate = FormatDate(DateToCheck);
	//alert("Formatted Date"+m_strDate);

	if(m_strDate==""){
	return false;
	}

	var m_arrDate = m_strDate.split("/");
	var m_DAY = m_arrDate[1];
	var m_MONTH = m_arrDate[0];
	var m_YEAR = m_arrDate[2];
	if(m_YEAR.length > 4){return false;}
	m_strDate = m_MONTH + "/" + m_DAY + "/" + m_YEAR;
	var testDate=new Date(m_strDate);
	if(testDate.getMonth()+1==m_MONTH){
	return true;
	}
	else{
	return false;
	}
}//end function

function getFormattedDate(input, saparator) {
	var txt = input;
	if(txt.length>0 && saparator!=null) {
		var m_arrDate = txt.split(saparator);
		var m_DAY = m_arrDate[2];
		var m_MONTH = m_arrDate[1];
		var m_YEAR = m_arrDate[0];
		txt=m_MONTH+"/"+m_DAY+"/"+m_YEAR;
	}
	return txt;
}


function FormatDate(DateToFormat,FormatAs){
	if(DateToFormat==""){return"";}
	if(!FormatAs){FormatAs=defaultDateFormat;}

	var strReturnDate;
	FormatAs = FormatAs.toLowerCase();
	DateToFormat = DateToFormat.toLowerCase();
	var arrDate
	var arrMonths = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
	var strMONTH;
	var Separator;

	while(DateToFormat.indexOf("st")>-1){
	DateToFormat = DateToFormat.replace("st","");
	}

	while(DateToFormat.indexOf("nd")>-1){
	DateToFormat = DateToFormat.replace("nd","");
	}

	while(DateToFormat.indexOf("rd")>-1){
	DateToFormat = DateToFormat.replace("rd","");
	}

	while(DateToFormat.indexOf("th")>-1){
	DateToFormat = DateToFormat.replace("th","");
	}

	if(DateToFormat.indexOf(".")>-1){
	Separator = ".";
	}

	if(DateToFormat.indexOf("-")>-1){
	Separator = "-";
	}


	if(DateToFormat.indexOf("/")>-1){
	Separator = "/";
	}

	if(DateToFormat.indexOf(" ")>-1){
	Separator = " ";
	}

	arrDate = DateToFormat.split(Separator);
	DateToFormat = "";
		for(var iSD = 0;iSD < arrDate.length;iSD++){
			if(arrDate[iSD]!=""){
			DateToFormat += arrDate[iSD] + Separator;
			}
		}
	DateToFormat = DateToFormat.substring(0,DateToFormat.length-1);
	arrDate = DateToFormat.split(Separator);

	if(arrDate.length < 3){
	return "";
	}

	var DAY = arrDate[0];
	var MONTH = arrDate[1];
	var YEAR = arrDate[2];




	if(parseFloat(arrDate[1]) > 12){
	DAY = arrDate[1];
	MONTH = arrDate[0];
	}

	if(parseFloat(DAY) && DAY.toString().length==4){
	YEAR = arrDate[0];
	DAY = arrDate[2];
	MONTH = arrDate[1];
	}


	for(var iSD = 0;iSD < arrMonths.length;iSD++){
	var ShortMonth = arrMonths[iSD].substring(0,3).toLowerCase();
	var MonthPosition = DateToFormat.indexOf(ShortMonth);
		if(MonthPosition > -1){
		MONTH = iSD + 1;
			if(MonthPosition == 0){
			DAY = arrDate[1];
			YEAR = arrDate[2];
			}
		break;
		}
	}

	var strTemp = YEAR.toString();
	if(strTemp.length==2){

		if(parseFloat(YEAR)>40){
		YEAR = "19" + YEAR;
		}
		else{
		YEAR = "20" + YEAR;
		}

	}


		if(parseInt(MONTH)< 10 && MONTH.toString().length < 2){
		MONTH = "0" + MONTH;
		}
		if(parseInt(DAY)< 10 && DAY.toString().length < 2){
		DAY = "0" + DAY;
		}
		switch (FormatAs){
		case "dd/mm/yyyy":
		return DAY + "/" + MONTH + "/" + YEAR;
		case "mm/dd/yyyy":
		return MONTH + "/" + DAY + "/" + YEAR;
		case "dd/mmm/yyyy":
		return DAY + " " + arrMonths[MONTH -1].substring(0,3) + " " + YEAR;
		case "mmm/dd/yyyy":
		return arrMonths[MONTH -1].substring(0,3) + " " + DAY + " " + YEAR;
		case "dd/mmmm/yyyy":
		return DAY + " " + arrMonths[MONTH -1] + " " + YEAR;
		case "mmmm/dd/yyyy":
		return arrMonths[MONTH -1] + " " + DAY + " " + YEAR;
		}

	return DAY + "/" + strMONTH + "/" + YEAR;;

} //End Function



function calcAge(dd, mm, yy){
  var t, mon, day, year, DD, MM, YY, age;
  var MTB = new makeDaysOfMonth();
  YY   = parseInt(yy);	// year of birth (4 digits)
  MM   = parseInt(mm);	// month of birth (1-12)
  DD   = parseInt(dd);	// date of birth (1-31)
  if (MTB[MM] < DD || DD < 1) return -1;
  t    = new Date();	// get current date
  year = t.getFullYear();	// get year of current
  mon  = t.getMonth() + 1;	// get month of current
  day  = t.getDate();	// get date of current
  if (MM == 2 && DD == 29){	// check leap year
    if (!(((YY % 4 == 0) && (YY % 100 != 0)) || (YY % 400 == 0))){
      alert("The year " +YY+ " ends at 28th of "+MM+" month\nPlease check the date.");
      return -1;
    }
  }
  age = year - YY;
  if ((MM > mon) || (MM == mon && day < DD)) age --;

  return age;
}

function makeDaysOfMonth(){
  var i = 0;
  this[i++] = 0; // dummy
  this[i++] = 31;
  this[i++] = 29;
  this[i++] = 31;
  this[i++] = 30;
  this[i++] = 31;
  this[i++] = 30;
  this[i++] = 31;
  this[i++] = 31;
  this[i++] = 30;
  this[i++] = 31;
  this[i++] = 30;
  this[i  ] = 31;
  this.length = i;
}

function call(object) {
		//alert('hi = '+object.alt);
		return eval(object.alt);
}
function showMessage(text, object) {
		var box = document.getElementById('messageHolder');
		box.innerHTML = text;
		if(object !=null) {
			var toolTipBoxWidth = getPropertyValue('messageHolder', 'offsetWidth')
			var toolTipBoxHeight = getPropertyValue('messageHolder', 'offsetHeight');

			var linkPosX = getRealPos(object,'x') + tooltipXOffset;
			var linkPosY = getRealPos(object,'y') - toolTipBoxHeight + tooltipYOffset;
			//Account for page scrolling. Reposition tooltip as neccesary
			if((getScrollX() + document.body.clientWidth) < (linkPosX + toolTipBoxWidth)){
			var tempOffset = (linkPosX + toolTipBoxWidth) - (getScrollX() + document.body.clientWidth);
			linkPosX -= tempOffset + 6;
			}
			if(getScrollY() > linkPosY){
			var tempName = document.getElementById("messageHolder");
			var tempOffset = tempName.offsetHeight;
			linkPosY += toolTipBoxHeight - (2*tooltipYOffset) + tempOffset + 4;
			}
			//allow for manual positioning override
			linkPosX += xOffsetArray[lastToolNum];
			linkPosY += yOffsetArray[lastToolNum];
			//Make it happen
			var linkPosXString = linkPosX + "px";
			var linkPosYString = linkPosY + "px";
			//alert("linkPosXString = "+linkPosXString+"linkPosYString = "+linkPosYString);

			box.style.top=linkPosYString;
			box.style.left=linkPosXString;
		}
		box.style.visibility='visible';
		if(text=='') {
			box.style.visibility='hidden';
			object.style.background='#FFFFFF';
			return true;
		} else {
			box.style.visibility='visible';
			return false;
		}
}

var arr = [];
function validateDynamicForm(frm){
	if(setDefault(frm)) {
		if(validateDynfrm(frm)){
			if(submit_form ()) {
				enableState(frm);
				return true;
			} else {
				return false;
			}
		}else{
			return false;
		}

	} else {
  		return false;
 	}
}

function Ajaxsubmit(frm,submitBttn,actionName){
 var remove =  removeObject;

 var validate = eval(validateDynamicForm1(frm));
 if(validate){
 if(submitBttn !=null && submitBttn != undefined && submitBttn!='Remove' ){
 	submitBttn.disabled = true;
 }
 if(frm.RemoveButtonForPopUp != null && frm.RemoveButtonForPopUp!=undefined && remove == false){
 	//frm.RemoveButtonForPopUp.value="";
 	frm.RemoveButtonForPopUp.disabled = true;

 	}
 	 if(frm.RemoveButton != null && frm.RemoveButton!=undefined &&  remove == false ){
 			 	frm.RemoveButton.value="";

 	}

 	var isSubmit = newCheckSubmit1();
 	if(isSubmit){
 	var url1="";
 	if(url1 == undefined){
 		 url1 = "/saveSubmissionRisk1.do?";
 	}else{}
 		autologout();
 		url1 = actionName;
	 	new Ajax.Request(url1, {method: 'post',parameters:$(frm).serialize(this),
	 	onLoading: function() {
		document.getElementById("loadercontent1").style.display ="block";document.getElementById("loadercontent2").style.display ="block";
		},onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);checkcount = false;doSpecificCompleteAction(transport);},onSuccess: function(transport){doSpecificSuccessAction(transport);}});
	}
 }

}

function AjaxsubmitFromPopUp(frm){

 var validate = eval(validateDynamicForm1(frm));

 if(validate){
 frm.RemoveButton.value="";
 	var url = "/saveSubmissionRisk1.do";
 	autologout();
 	new Ajax.Request(url, {method: 'post',parameters:$(frm).serialize(this),
 	onLoading: function() {
	document.getElementById("loadercontent1").style.display ="block";document.getElementById("loadercontent2").style.display ="block";
	},onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);doSpecificOnCompleteAcionForPopUp();
 	},onSuccess: function(transport){doSpecificSuccessActionForPopUp();
 	}});


 }

}




var elemtsForRepeatedForm;
function validateDynamicForm(frm) {
//alert('hi');
var i=0;
	var returnvalue=true;
	formSubmission = true;
	for(i=0; frm.elements[i]!=null; i++) {
		var ele = frm.elements[i]
		//alert(ele);
		if(ele.type=='text' && ele.alt!=undefined && ele.alt!='') {
			//alert("Hi = "+ele.id);
			//alert("alt :"+ele.alt);
			elemtsForRepeatedForm=ele;
			returnvalue = call(ele);
			//alert(ele.id+"="+returnvalue);
			if(returnvalue==false) {
				ele.style.background='#FFCC33';
				ele.focus();
				var x = getRealPos(ele,'x');
				var xoff = (window.innerWidth)/2;
				var y = getRealPos(ele,'y');
				var yoff = (window.innerHeight)/2;
				scroll(x - xoff, y - yoff);
				break;
			} else {
				ele.style.background='#FFFFFF';
			}
		}
	}
	//alert(returnvalue)
	formSubmission = false;
	enableFields();
	return returnvalue;


}

function validateDynamicForm1(frm) {

if(doValidateApplicationVersion2(frm)) {

	var i=0;
		var returnvalue=true;
		formSubmission = true;
		for(i=0; frm.elements[i]!=null; i++) {
			var ele = frm.elements[i]
			//alert(ele.type);
			if(ele.type=='text' && ele.alt!=undefined && ele.alt!='') {
				//alert("Hi = "+ele.id);
				//alert("alt :"+ele.alt);
				elemtsForRepeatedForm=ele;
				returnvalue = call(ele);
				//alert(ele.id+"="+returnvalue);
				if(returnvalue==false) {
					ele.style.background='#FFCC33';
					ele.focus();
					var x = getRealPos(ele,'x');
					var xoff = (window.innerWidth)/2;
					var y = getRealPos(ele,'y');
					var yoff = (window.innerHeight)/2;
					scroll(x - xoff, y - yoff);
					break;
				} else {
					ele.style.background='#FFFFFF';
				}
			}
		}


		formSubmission = false;
		enableFields();

		if(returnvalue == true){
			if(isSpecificValidationNeeded){
				returnvalue = validateTextAreaElement(frm);
			}
		}
		if(returnvalue){

			if(isSpecificValidationNeeded){

				if(!doSpecificValidation(frm)){

					return false;
				}else {
					//isSpecificValidationNeeded = false;
					return true;
				}

			}
		}else {
			return returnvalue;
		}

	}
	//return newCheckSubmit1();
	return true;
}
	var checkcount =false;
 function newCheckSubmit1(){

 	 if(!checkcount){
 	 //alert(checkcount)
 	 	checkcount = true;
 	 	return true;
 	 }else{
 	 	return false;
 	 }

 }

function doValidateApplicationVersion2(frm){

	if(removeObject){
		removeObject=false;
		return false
	}
	return true;
}

// to enable disabled fields
 function enableFields() {
  for(i=0; arr[i]!= null; i++ ) {
   var el = arr[i];
   el.disabled=false;
  }
 }

function enableState(frm) {
	if(frm.name=='Property'){
		frm.State.disabled=false;
	}
}

// Script for dynamic positioning of message box
	function getRealPos(ele,dir)
	{
		(dir=="x") ? pos = ele.offsetLeft : pos = ele.offsetTop;
		tempEle = ele.offsetParent;
		while(tempEle != null)
		{
			pos += (dir=="x") ? tempEle.offsetLeft : tempEle.offsetTop;
			tempEle = tempEle.offsetParent;
		}
		return pos;
	}
	//TOOLTIP OFFSET
	var xOffsetArray = new Array();
	xOffsetArray[0] = 0;
	var yOffsetArray = new Array();
	yOffsetArray[0] = 0;
	//TOOLTIP BOX DEFAULT WIDTH
	var toolTipDefaultWidth = 276;

	var hideID = 0;
	var lastToolNum = 0;
	var tooltipXOffset = 40;
	var tooltipYOffset = -53;

	function getScrollY(){
		if(window.pageYOffset != null) {
			return window.pageYOffset;
		} else {
			return document.body.scrollTop;
		}
	}

	function getScrollX(){
		if(window.pageXOffset != null){
			return window.pageXOffset;
		} else {
			return document.body.scrollLeft;
		}
	}

	function getPropertyValue(objectID, propertyName){
		return document.getElementById(objectID)[propertyName];
	}


	/**
	 *For Dynamic Validation
	 */
	var test;
AlphaChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
NumChars = "0123456789";
AlphaNumChars = AlphaChars + NumChars;
HexaChars = "ABCDEFabcdef";
	function TextIsEmpty(champ)

	{
	alert("isTextEmpty"+champ.value)
	if (champ.value=="")
	  {return true;}
	  else
	  {alert(champ.value)
	  return false;}
	}

	function IsTextEmpty(champ)

	{
	alert("isTextEmpty"+champ.value)
	if (champ.value=="")
	  {return false;}
	  else
	  {alert(champ.value)
	  return true;}
	}

	function TextIsNumeric(champ)
	{
	  if (TextIsEmpty(champ))
	  { return true;}
	  else
	  {
	    val = champ.value;
	    if (IsNumeric(val))
	    {return false;}
	    else
	    {return true;}
	  }
	}

	function IsValidYear(champ) {
	 if (TextIsEmpty(champ))
	 { return true;}
	  else
	  {
	    val = champ.value;
	    if (validateyear(val))
	    {return false;}
	    else
	    {return true;}
	  }
	}
	function IsValidRiskYear(champ) {
	 if (TextIsEmpty(champ))
	 { return true;}
	  else
	  {
	    val = champ.value;
	    if (validateRiskYear(val))
	    {return false;}
	    else
	    {return true;}
	  }
	}
	function validateRiskYear(data) {
			var dat = new Date();
			var currentyear = dat.getFullYear();
			var yearBuilt=data;
			var isValid= IsNumeric(yearBuilt);
			if(!isValid) {

				return false;
			} else {
				if(yearBuilt>currentyear || yearBuilt==0 || yearBuilt<1900) {
					return false;
				} else {
					if(yearBuilt.length<4) {
						return false;
					}
				}
			}
			return true;
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

		function isAmount(data)
		{
		 var len=data.length;
		 var temp=0;

		 if (len>0)
		 {
		  for (index = len-1; index >-1; index--)
		     {
		       var c = data.charAt(index);

		        if(c=="," )
		         {
		         if(index==0)
		         {
		         return false;
		         }
		           if(temp!=3 && temp!=7 &&
		                 temp!=10 && temp!=6 )
		            {
		             return false;
		           }
		       }
		      if(c=="$")
		           {
		            if(index!=0)
		            {
		               return false;
		           }
		        }

		        if(c=="."){
		        	if(index!=(len-3)) {
		        		return false;
		        	}
		        }

		       if(c!=1 && c!=2 && c!=3 && c!=4 && c!=5 && c!=6 && c!=7 && c!=8 && c!=9 && c!=0 && c!="$" && c!="," && c!=".")
		          {
		            return false;
		         }

		           temp++;
		     }
		     return true;
		 }
		 return false;
		}

	function IsDecimal(Data) {
			var It = true;
			var virgule = false;
			var c;
			c = Data.charAt(0);
			It = ( (NumChars.indexOf(c) != -1) || (c == "+") || (c=="-") );
			for (var x = 1; x < Data.length; x++)
				if (It) {
					c = Data.charAt(x);
					if ( (c==".") || (c == ",") )
						if (virgule)
							It = false;
						else {
							It = true;
							virgule = true;
						}
					else
						It = (NumChars.indexOf(c) != -1);
				}
			return It;
		}

		function validateyear(data) {
			var dat = new Date();
			var currentyear = dat.getFullYear();
			var yearBuilt=data;
			var isValid= IsNumeric(yearBuilt);
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

	var dataObj;
	/**
	 *For Dynamic Validation
	 */

	 function IsEmpty()
	{
	var objValue=elemtsForRepeatedForm.name;
	var primarykey=objValue.substring(objValue.indexOf('@')+1,objValue.length-1);
	if((formSubmitType=='Update' && primarykey !='-1' ) ||
		      formSubmitType=='Add' && primarykey =='-1')
	if (elemtsForRepeatedForm.value=="")
	  {return true;}
	  else
	  {return false;}
	}

	function isAmountAlowEmpty(value) {
		if(value=="") {
			return true;
		}else {

			return isAmount(value);
		}
	}

	function IsValidAmount()
	{
	var objValue=elemtsForRepeatedForm.name;
	var primarykey=objValue.substring(objValue.indexOf('@')+1,objValue.length-1);
	  if (IsEmpty())
	  { return true;}
	  else
	  {
	  if((formSubmitType=='Update' && primarykey !='-1' ) ||
		      formSubmitType=='Add' && primarykey =='-1') {
	    val = elemtsForRepeatedForm.value;
		    if (isAmount(val))
		    {return false;}
		    else
		    {return true;}
		  }
		}
	}

	// To validate the Effective and Expiration date of the Underlying policy information.

	function validateDate(date){
		var frm = document.forms[0];
		var vardate = date.value
		var ddate = new Date(vardate);
		if(!isDate(vardate)){
			date.select();
			return false;
		}
		if (vardate=="")
		{
			date.focus();
			return false;
		}
		var dmonth = parseInt(vardate.substring(0, 2), 10);
		var dday = parseInt(vardate.substring(3, 5), 10);
		var dyear = parseInt(vardate.substring(6, 10), 10);

		if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/" || dyear < 1990 || dyear > 2100 )
		{
			date.select();
			return false;
		}

	return true;
}

/**
 * Validation for Application ver 1.0
 * @author Guru
 */
 function validatePrimaryData(data,dataType,min,max,isEmptyAllowed,attrValidationName) {
  	data = elemtsForRepeatedForm.value;
		if(data!=""){
     		if(dataType == "mm/dd/yyyy" || dataType == "yyyy/mm/dd"){
     			var str = data.replace(/^\s+|\s+$/g, '');
     				if(!isValidDate1(str,dataType)) {
     					if(attrValidationName.length != 0){
     					alert("Please Enter valid "+attrValidationName+" date, the date format should be "+dataType);
     					return false;
     					}else{
     						alert("Please Enter a valid date, the date format should be "+dataType);
     						return false;
     					}
     				}else {

     					if(min !="" && max !="") {
    	 					var minDate = new Date();
    	 					var maxDate = new Date();
    	 					var dateToBeChecked = new Date();
    	 					var mind = min.split("/");
    	 					var maxd = max.split("/");
    	 					var dateCheck = data.split("/");
    	 					//alert("mind::"+mind+"::maxd"+maxd+"dateCheck"+dateCheck)

    	 				if(max == 'CurrentDay'){
     						var date = new Date();
							var currentyear = date.getFullYear();
							var currentmonth = date.getMonth()+1;
							var currentDate= date.getDate();
							var maxd1 = currentmonth+"/"+currentDate+"/"+currentyear;
							maxd = maxd1.split("/");
							var currentDate1 = ""+currentDate;
							var currentMonth1 = ""+currentmonth;
							if(currentDate1.length == 1 ){
								currentDate1 = "0"+currentDate1;
							}
							if(currentMonth1.length ==1){
								currentMonth1 = "0"+currentMonth1;
							}
							max = currentMonth1+"/"+currentDate1+"/"+currentyear;
						}
    	 					minDate.setFullYear(mind[2],mind[0],mind[1]);
    	 					maxDate.setFullYear(maxd[2],maxd[0],maxd[1]);
    	 					dateToBeChecked.setFullYear(dateCheck[2],dateCheck[0],dateCheck[1]);

    	 					if(dateToBeChecked < minDate || dateToBeChecked>maxDate) {
    	 						if(attrValidationName.length != 0){
    	 							alert("Entered "+attrValidationName+" should be between "+min +" and "+max);
    	 							return false;
    	 						}else{
	    	 						alert("Entered value should be between "+min +" and "+max);
	    	 						return false;
    	 						}
    	 					}
    	 				}
     				}
     			}else if(dataType == "yyyy-mm-dd") {

	     			/**
	     			 * This else if block is added to validate the date in the format "yyyy-mm-dd"
	     			 * Added by Rajeshkumar P on 01-November-2010
	     			 */
	     			 var str = data.replace(/^\s+|\s+$/g, '');
     				 if(!isValidDate1(str,dataType)) {
     					if(attrValidationName.length != 0){
     					alert("Please Enter valid "+attrValidationName+" date, the date format should be "+dataType);
     					return false;
     					}else{
     						alert("Please Enter a valid date, the date format should be "+dataType);
     						return false;
     					}
     				 }else {

     					if(min !="" && max !="") {
    	 					var minDate = new Date();
    	 					var maxDate = new Date();
    	 					var dateToBeChecked = new Date();
    	 					var mind = min.split("-");
    	 					var maxd = max.split("-");
    	 					var dateCheck = data.split("-");
    	 					//alert("mind::"+mind+"::maxd"+maxd+"dateCheck"+dateCheck)

	    	 				if(max == 'CurrentDay'){
	     						var date = new Date();
								var currentyear = date.getFullYear();
								var currentmonth = date.getMonth()+1;
								var currentDate= date.getDate();
								var maxd1 = currentmonth+"-"+currentDate+"-"+currentyear;
								maxd = maxd1.split("-");
								var currentDate1 = ""+currentDate;
								var currentMonth1 = ""+currentmonth;
								if(currentDate1.length == 1 ){
									currentDate1 = "0"+currentDate1;
								}
								if(currentMonth1.length ==1){
									currentMonth1 = "0"+currentMonth1;
								}
								max = currentMonth1+"-"+currentDate1+"-"+currentyear;
							}
    	 					minDate.setFullYear(mind[2],mind[0],mind[1]);
    	 					maxDate.setFullYear(maxd[2],maxd[0],maxd[1]);
    	 					dateToBeChecked.setFullYear(dateCheck[2],dateCheck[0],dateCheck[1]);

    	 					if(dateToBeChecked < minDate || dateToBeChecked>maxDate) {
    	 						if(attrValidationName.length != 0){
    	 							alert("Entered "+attrValidationName+" should be between "+min +" and "+max);
    	 							return false;
    	 						}else{
	    	 						alert("Entered value should be between "+min +" and "+max);
	    	 						return false;
    	 						}
    	 					}
    	 				}
     				}
     			}else if(dataType == "USCurrencyDecimal") {
     				if(isUSCurrency(data)){
     					if(min !="" && max !="") {
    	 					 data = data.replace(/\$/g,"");
    	 					 data = data.replace(/\,/g,"");
    	 					 var min1 = min;
    	 					 min1 = min1.replace(/,/g,"");
    	 					 min1 = min1.replace(/,/g,"");
    	 					 var max1 = max;
    	 					 max1 = max1.replace(/,/g,"");
    	 					 max1 = max1.replace(/,/g,"");
    	 					 data = parseFloat(data);
    	 					 if(data >= 0)
    	 					 {
	    	 					 if(data<min1 || data >max1){
	    	 					 	if(attrValidationName.length != 0){
	    	 					 	max = FormatCurrency(max);
	    	 					 	min = FormatCurrency(min);

		    	 					 	alert("Entered "+attrValidationName+" Should be between "+min+" and "+max);
		    	 					 	return false;
	    	 					 	}else{
	    	 					 		alert("Entered Currency Should be between "+min+" and "+max);
	    	 					 		return false;
	    	 					 	}
	    	 					 }
    	 					 }else{
    	 					 	alert("Please enter the valid currency");
    	 					 	return false;
    	 					 }
    	 					}

     				}else {
     				if(attrValidationName.length != 0){
     					alert("Please enter the valid "+attrValidationName);
     					return false;
     					}else{
     						alert("Please enter the valid Currency");
     					return false;
     					}
     				}
     			}else if(dataType == "Numeric") {

     				if(IsNumeric(data)) {

     				data = parseInt(data);
     				if(max == 'CurrentYear'){
     						var date = new Date();
							var currentyear = date.getFullYear();
							max = currentyear;
						}

					if(min=="" && max !=""){
						if(data > max) {
						if(attrValidationName.length != 0){
     							alert("Entered "+attrValidationName+" Should be prior to "+max);
    	 					 	return false;
     						}else{
     							alert("Entered Numeric value Should be prior to "+max);
    	 					 	return false;
     						}
					}
					}
     				if(min !="" && max !="") {
     						if(data < min || data > max) {
     						if(attrValidationName.length != 0){
     							alert("Entered "+attrValidationName+" Should be between "+min+" and "+max);
    	 					 	return false;
     						}else{
     							alert("Entered Numeric value Should be between "+min+" and "+max);
    	 					 	return false;
     						}

     					}
     				}

     			}else{
     			  alert("Entered "+attrValidationName+" value should be numeric");
     			  return false;
     			}
     			}else if(dataType == "Decimal") {
     				if(IsDecimal(data)) {
     					if(min !="" && max !="") {
     						if(data < min || data > max) {
     						if(attrValidationName.length != 0){
     							alert("Entered "+attrValidationName+" Should be between "+min+" and "+max);
    	 					 	return false;
     						}else{
     							alert("Entered Decimal value Should be between "+min+" and "+max);
    	 					 	return false;
     						}
     					}
     				} else {
     					alert("Please enter the valid Decimal value");
    	 				return false;
     				}
     		}
     	}
     	} else {
     		 	if(isEmptyAllowed=="N"){


	     			if(dataType == "mm/dd/yyyy" || dataType == "yyyy/mm/dd" || dataType == "yyyy-mm-dd"){
	     				if(attrValidationName.length != 0){
     						alert("Please Enter a  "+attrValidationName+" date, the date format should be "+dataType);
     						return false;
     					}else{
		    	 			alert("Please Enter a  date, the date format should be "+dataType);
		    	 			return false;
	    	 			}
	    	 		}else if(dataType == "USCurrencyDecimal") {
	    	 		if(attrValidationName.length != 0){
	    	 			alert("Please enter the  "+attrValidationName);
	    	 			return false;
	    	 		}else{
	    	 			alert("Please enter the  Currency");
	    	 			return false;
	    	 		}
	    	 		} else if(dataType == "Numeric") {
	    	 			if(attrValidationName.length != 0){
	    	 			alert("Please enter the  "+attrValidationName);
	    	 			return false;
	    	 			}else{
	    	 				alert("Please enter the  Numeric value");
	    	 				return false;
	    	 			}
	    	 		}else if(dataType == "Decimal") {
	    	 			alert("Please enter the  Decimal value");
	    	 			return false;
	    	 		}else if(dataType == "String") {
	    	 			if(attrValidationName.length != 0){
	    	 			alert("Please enter the "+attrValidationName);
	    	 			return false;
	    	 			}else{
	    	 			alert("Please enter the value");
	    	 			return false;
	    	 			}
	    	 		}
     		 	}
     		}

 	return true;
 }



/**
 * Date and its Format Validation
 */
function isValidDate1(date_string, format) {

//alert("Came primary data validation asasasa");
   var days = [31,28,31,30,31,30,31,31,30,31,30,31];
   var year;
   var month;
   var day;
   var date_parts = null;
   var rtrn = true;
    if (/^m{2}[./-]d{2}[./-]y{4}$/.test(format)) {
       //US Long Date
       date_parts = date_string.match(/^(\d{1,2})[./-](\d{1,2})[./-](\d{4})$/);
       if (date_parts) {
           month = date_parts[1];
           day = date_parts[2];
           year = date_parts[3];
          // alert(month+"::"+day+"::"+year);
       }
   } else if (/^y{4}[./-]m{2}[./-]d{2}/.test(format)) {
       //EU Long Date
       date_parts = date_string.match(/^(\d{4})[./-](\d{1,2})[./-](\d{1,2})$/);
       if (date_parts) {
           year = date_parts[1];
           month = date_parts[2];
           day = date_parts[3];
       }
   } else {
       rtrn = false;
   }
   if (date_parts) {
       if (1 <= month && month <= 12) {
           if (month == 2) {
              if (year % 4 != 0 ? false : ( year % 100 != 0? true: (year % 1000 != 0? false : true))) {
                   rtrn = (1 <= day && day <= 29);
               } else {
                   rtrn = (1 <= day && day <= 28);
               }
           } else {
               rtrn = (1 <= day && day <= days[month -1]);
           }
       }else {
           rtrn = false;
       }
   } else {
       rtrn = false;
   }
   return rtrn;
}

/**
 * US Currency and its Format Validation
 */
function isUSCurrency (data) {
  return RegExp(/^-?\$?[0-9\,]+(\.\d{1,5})?$/).test(String(data).replace(/^\s+|\s+$/g, ""));
}

/**
* To compare the Expiring policy Expiration Date with the Proposed effective date (for Retro Date)
*/
function compareDate(){
	var strEffectiveDate=document.getElementById('ProposedEffDate').value
	var strExpirationDate=document.getElementById('ExpDate').value
	var RetroDateModifiedFlag=document.getElementById('RetroDateModifiedFlag').value

if(strEffectiveDate!="" && strExpirationDate!="" && RetroDateModifiedFlag!='Y'){
	var effDate = new Date();
	var expDate = new Date();

	var splittedEffDate = strEffectiveDate.split('/');
	var splittedExpDate= strExpirationDate.split('/');

	effDate.setFullYear(splittedEffDate[2],splittedEffDate[0],splittedEffDate[1]);
	expDate.setFullYear(splittedExpDate[2],splittedExpDate[0],splittedExpDate[1]);

	if(effDate <= expDate){
		//alert('effdate is smaller')
		//document.getElementById("RetroDate").value="";
	}else{
		document.getElementById("RetroDate").value=strEffectiveDate;
	}
}
}

function compareDates(){

	var strEffectiveDate=document.getElementById('EffDate').value;
	var strExpirationDate=document.getElementById('ExpDate').value;


if(strEffectiveDate!="" && strExpirationDate!=""){
	var effDate = new Date();
	var expDate = new Date();

	var splittedEffDate = strEffectiveDate.split('/');
	var splittedExpDate= strExpirationDate.split('/');

	effDate.setFullYear(splittedEffDate[2],splittedEffDate[0],splittedEffDate[1]);
	expDate.setFullYear(splittedExpDate[2],splittedExpDate[0],splittedExpDate[1]);

	//if(effDate <= expDate){
		//alert('effdate is smaller')
		//document.getElementById("RetroDate").value="";
	if(effDate >= expDate){

		return false
	}else
	return true
}
}

function compareRetroDate(){

	var strPropEffectiveDate=document.getElementById('ProposedEffDate').value;
	var strExpirationDate=document.getElementById('ExpDate').value;
	var RetroDateModifiedFlag=document.getElementById('RetroDateModifiedFlag').value

if(strPropEffectiveDate!="" && strExpirationDate!="" && RetroDateModifiedFlag!='Y'){
	var effDate = new Date();
	var expDate = new Date();

	var splittedEffDate = strPropEffectiveDate.split('/');
	var splittedExpDate= strExpirationDate.split('/');

	effDate.setFullYear(splittedEffDate[2],splittedEffDate[0],splittedEffDate[1]);
	expDate.setFullYear(splittedExpDate[2],splittedExpDate[0],splittedExpDate[1]);

	//if(effDate <= expDate){
		//alert('effdate is smaller')
		//document.getElementById("RetroDate").value="";
	if(effDate > expDate){
		document.getElementById("RetroDate").value=strPropEffectiveDate;
	}
}
}

function FormatCurrency(objNum)
      {
            var num = objNum;

            if (num != '' )
            {
                  num = MoneyToNumber(num);



                              objNum = "$"+AddCommas(num.split('.')[0])+".00";



            }
            return objNum;
      }

      function MoneyToNumber(num)
      {
            return (num.replace(/,/g, ''));

      }

      function AddCommas(number)
      {
            number = '' + number;
            if (number.length > 3)
            {
                  var mod = number.length % 3;
                  var output = (mod > 0 ? (number.substring(0,mod)) : '');
                  for (i=0 ; i < Math.floor(number.length / 3); i++)
                  {
                        if ((mod == 0) && (i == 0))
                        {
                              output += number.substring(mod + (3 * i), mod + (3 * (i + 1)));
                        }
                        else
                        {
                        output += ',' + number.substring(mod + (3 * i), mod + (3 * (i + 1)));
                        }
                  }
                  return (output);
            }
            else
            {
                  return (number);
            }
      }

      function trim(value)
      {
      	var leftIndex = 0;
      	var rightIndex = value.length - 1;
      	while(leftIndex < value.length && value[leftIndex] == ' ')
      	{
      		leftIndex++;
      	}
      	while(rightIndex > leftIndex && value[rightIndex] == ' ')
      	{
      		rightIndex -= 1;
      	}
      	return value.substring(leftIndex, rightIndex + 1);
      }

      /**
       * convertSpecialCharactersToAsciiValue is used to convert the special characters to its corresponding ascii code
       * @param inputString  with special characters
       * @return inputString with special Characters converted to ascii code
       * @author Rajeshkumar P
       */
 function convertSpecialCharactersToAsciiValue(inputString) {

    	  inputString = inputString.replace(/“/g,"&#8220;");
    	  inputString = inputString.replace(/”/g,"&#8221;");
    	  inputString = inputString.replace(/_/g,"&#95;");
    	  inputString = inputString.replace(/–/g,"&#8211;");
    	  inputString = inputString.replace(/§/g,"&#167;");
    	  inputString = inputString.replace(/’/g,"&#8217;");
    	  inputString = inputString.replace(/‘/g,"&#8216;");
		  inputString = inputString.replace(/‐/g,"&#45;");

    	  return inputString;
  	  }

      /**
       * startsWith is used to find whether a string starts with the given input string.
       * @author Rajeshkumar P
       * Created on 08-November-2011
       */
      String.prototype.startsWith = function(str)
		{return (this.match("^"+str)==str)}

      /**
       * loadJsCssFile is used to load a js file or css file using Javascript
       * @param filename - Name of the file to be loaded
       * @param filetype - File type js or css
       * @author Rajeshkumar P
       * Created on 01-December-2011
       */
      function loadJsCssFile(filename, filetype){
      	 if (filetype=="js"){
      		 var fileref=document.createElement('script');
      		 fileref.setAttribute("type","text/javascript");
      		 fileref.setAttribute("src", filename);
      	 }
      	 else if (filetype=="css"){
      		 var fileref=document.createElement("link");
      		 fileref.setAttribute("rel", "stylesheet");
      		 fileref.setAttribute("type", "text/css");
      		 fileref.setAttribute("href", filename);
      	 }
      	 if (typeof fileref!="undefined") {
      		  document.getElementsByTagName("head")[0].appendChild(fileref);
      	 }
      }

      /**
       * validateNumberOfDecimalPlaces is used to validate the number of decimal places allowed for the decimal number
       * @param decimalNumber - The Decimal Number to be checked
       * @param numberOfDecimalPlacesAllowed - Number of Decimal Places allowed
       * @parem alertMsg - Alert Message to show
       * @author Rajeshkumar P
       * Created on 01-December-2011
       */
      function validateNumberOfDecimalPlaces(decimalNumber, numberOfDecimalPlacesAllowed, alertMsg) {
          var decimalValue = decimalNumber.split('.',numberOfDecimalPlacesAllowed);
          if(decimalValue[1] != null && decimalValue[1] != undefined) {
    		  if(decimalValue[1].length > numberOfDecimalPlacesAllowed) {
    			alert(alertMsg);
    			return false;
    		  }
    	  }
          return true;
      }

	  /**
       * validateFileType - To check the file type extension whether it is allowed or not
       * @param fileElementId
       * @returns {Boolean}
       *
       * @author Baskar K
       * @created 29-May-2013
       */
      function validateFileType(fileElementId)
      {
      	var inputFile = document.getElementById(fileElementId);
      	var fileName = inputFile.value;
      	var supportedFileList = ["exe", "dll", "js", "bat", "com", "ade", "adp", "chm", "cmd", "cpl", "hta", "ins", "isp", "jse", "lib", "mde", "msc", "msp", "mst", "pif", "scr", "sct", "shb", "sys", "vb", "vbe", "vbs", "vxd", "wsc", "wsf", "wsh", "aspx", "shell", "msi"];

      	var ext = fileName.substring(fileName.lastIndexOf('.') + 1);

      	for (var loop=0 ; loop < supportedFileList.length ; loop++ ) {
			supportedExt = supportedFileList[loop];
      		if(supportedExt == ext)
      		{
				alert("The File type is Restricted to attach! Try a valid Document file");
				inputFile.focus();
				document.getElementById(fileElementId).parentNode.innerHTML = document.getElementById(fileElementId).parentNode.innerHTML;
      			return false;
      		}
          }
      	return true;
      }



