
  var req;
  var obj;
  var tabId;
  var xmlHttp;
  var xmlHttp1;
  var ajaxCounter=0;
  //For modifying html pages
  function executeApplicationRule(ruleName,ruleGroupIds,SubApplId,SubApplVerId) {

  	if(!(document.getElementById("pagefrom")!=null && document.getElementById("pagefrom")!=undefined && ( document.getElementById("pagefrom").value=='CovLimit' || document.getElementById("pagefrom").value=='EndorsementCovLimit') &&  document.forms[0].IsOptionDisabled.value=='Y' )){
  	
    	if(ajaxCounter==0) {enableSpinner();}
	  	ajaxCounter++;
  	   //alert(ajaxCounter);
	  	//enableSpinner();
		url="/excecuteRulesAction.do";
		
		/**
		 * formElemnt get by form index is not good one.Those lines are commented.
		 * Insted of "setting rule name in form", rulename is passed as the paramater for the AJAX lookup.
		 * by Guru
		 */
		//var formElement=document.forms[0];
		//formElement.ruleName.value=ruleName;
		
		parameters= getFormAsString("Application");
		val1=escape(encodeURI(SubApplId));
		val2=escape(encodeURI(SubApplVerId));
		parameters="&answer(ruleName)="+ruleName+"&"+parameters+"answer(SubApplId)"+"="+val1+"&"+"answer(SubApplVerId)"+"="+val2+"&answer(ruleName)="+ruleName;
		for (var i = 0; i < ruleGroupIds.length; i++) {
			val=ruleGroupIds[i];
			parameters=parameters+"&answer(ruleGroupId"+i+")"+"="+val;
		}
		createXMLHttpRequest();
		getTheContent(url,parameters);
		contentIsReady();
	}
		
  }
  
  function refreshCoverageAndLimitWithDRLRules(ruleName,ruleGroupIds,SubApplId,SubApplVerId,objectType,objectName,specificValidationScript)
 {
 	
 	var frm = "";
 	
	if(document.forms[0].AJAX_Rating == undefined){

		frm = document.forms[1];
	}else{
		frm = document.forms[0];

 	}
	if(frm.IsOptionDisabled.value=='N'){
		
	 if(ajaxCounter==0) {enableSpinner();}
	  	ajaxCounter++;
	
	  //	enableSpinner();
		url="/AJAXRatingCoveragesAndLimitwithDRLV2.do";
		var formElement=frm;
		formElement.ruleName.value=ruleName;
	    
		parameters= getFormAsString("Application");
		val1=escape(encodeURI(SubApplId));
		val2=escape(encodeURI(SubApplVerId));
		parameters1="answer(SubApplId)"+"="+val1+"&"+"answer(SubApplVerId)"+"="+val2+"&answer(ruleName)="+ruleName+"&answer(Object::Rules::ObjectName)="+objectName+"&answer(Object::Rules::ObjectType)="+objectType+"&answer(Object::Rules::ObjectId)"+"="+SubApplId+"&"+"answer(Object::Rules::ObjectVerId)"+"="+SubApplVerId;
	
	   
	
		for (var i = 0; i < ruleGroupIds.length; i++) {
			val=ruleGroupIds[i];
	
			parameters1=parameters1+"&answer(ruleGroupId"+i+")"+"="+val;
		}
	   frm.AJAX_Rating.value="Y";
	   url=url+"?"+parameters1;
	   panel="OPTIONS_DIV";
	   //alert(ajaxCounter);
	   try {
	    autologout();
	    new Ajax.Updater(
	     panel,
	     url,
	     {
	       synchronous:true,  parameters:$(document.forms[0]).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';eval(specificValidationScript)},
	       onException:function(){disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';}
	     }
	    );
	   }catch(err) {
	    txt="There was an error on this page.\n\n";
	    txt+="Error description: " + err.description + "\n\n";
	    txt+="Click OK to continue.\n\n";
	  
	    alert(txt);
	   }
	  }
    return false;
 
  }
  
  function refreshCoverageAndLimitWithDRLRulesEIL(ruleName,ruleGroupIds,SubApplId,SubApplVerId,objectType,objectName,specificValidationScript)
 {
 	
 	var frm = "";
 	
	if(document.forms[0].IsOptionDisabled == undefined){

		frm = document.forms[1];
	}else{
		frm = document.forms[0];
	  	
 	}
	if(frm.IsOptionDisabled.value=='N'){
		
	 if(ajaxCounter==0) {enableSpinner();}
	  	ajaxCounter++;
	
	  //	enableSpinner();
		url="/AJAXRatingCoveragesAndLimitEILwithDRLV2.do";
		var formElement=frm;
		formElement.ruleName.value=ruleName;
	    
		parameters= getFormAsString("Application");
		val1=escape(encodeURI(SubApplId));
		val2=escape(encodeURI(SubApplVerId));
		parameters1="answer(SubApplId)"+"="+val1+"&"+"answer(SubApplVerId)"+"="+val2+"&answer(ruleName)="+ruleName+"&answer(Object::Rules::ObjectName)="+objectName+"&answer(Object::Rules::ObjectType)="+objectType+"&answer(Object::Rules::ObjectId)"+"="+SubApplId+"&"+"answer(Object::Rules::ObjectVerId)"+"="+SubApplVerId;
	
	   
	
		for (var i = 0; i < ruleGroupIds.length; i++) {
			val=ruleGroupIds[i];
	
			parameters1=parameters1+"&answer(ruleGroupId"+i+")"+"="+val;
		}
	   frm.AJAX_Rating.value="Y";
	   url=url+"?"+parameters1;
	   panel="OPTIONS_DIV";
	   //alert(ajaxCounter);
	   try {
	    autologout();
	    new Ajax.Updater(
	     panel,
	     url,
	     {
	       synchronous:true,  parameters:$(document.forms[1]).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';eval(specificValidationScript)},
	       onException:function(){disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';}
	     }
	    );
	   }catch(err) {
	    txt="There was an error on this page.\n\n";
	    txt+="Error description: " + err.description + "\n\n";
	    txt+="Click OK to continue.\n\n";
	  
	    alert(txt);
	   }
	  }
    return false;
 
  }
  function executeOptionRule(ruleName,ruleGroupIds,productId,productVerId,objectType,objectName) {

  	if(!(document.getElementById("pagefrom")!=null && document.getElementById("pagefrom")!=undefined && ( document.getElementById("pagefrom").value=='CovLimit' || document.getElementById("pagefrom").value=='EndorsementCovLimit') &&  document.forms[0].IsOptionDisabled.value=='Y' )){
  	
    	if(ajaxCounter==0) {enableSpinner();}
	  	ajaxCounter++;
  	   //alert(ajaxCounter);
	  	//enableSpinner();
		url="/excecuteDRLRulesAction.do";
		var formElement=document.forms[0];
		formElement.ruleName.value=ruleName;
		
		parameters= getFormAsString("Application");
		objectId=escape(encodeURI(productId));
		objectVerId=escape(encodeURI(productVerId));
		parameters=parameters+"answer(Object::Rules::ObjectName)="+objectName+"&answer(Object::Rules::ObjectType)="+objectType+"&answer(Object::Rules::ObjectId)"+"="+objectId+"&"+"answer(Object::Rules::ObjectVerId)"+"="+objectVerId+"&answer(ruleName)="+ruleName;
		for (var i = 0; i < ruleGroupIds.length; i++) {
			val=ruleGroupIds[i];
			parameters=parameters+"&answer(ruleGroupId"+i+")"+"="+val;
		}
		createXMLHttpRequest();
		getTheContent(url,parameters);
		contentIsReady();
	}
		
  }
  
  
  function executeOptionRule(ruleName,ruleGroupIds,productId,productVerId,objectType,objectName,optionVerId) {    
  	if(!(document.getElementById("pagefrom")!=null && document.getElementById("pagefrom")!=undefined && ( document.getElementById("pagefrom").value=='CovLimit' || document.getElementById("pagefrom").value=='EndorsementCovLimit') &&  document.forms[0].IsOptionDisabled.value=='Y' )){
  	
    	if(ajaxCounter==0) {enableSpinner();}
	  	ajaxCounter++;
  	   //alert(ajaxCounter);
	  	//enableSpinner();
		url="/excecuteDRLRulesAction.do";
		var formElement=document.forms[0];
		formElement.ruleName.value=ruleName;
		
		parameters= getFormAsString("Application");
		objectId=escape(encodeURI(productId));
		objectVerId=escape(encodeURI(productVerId));
		parameters=parameters+"answer(Object::Rules::ObjectName)="+objectName+"&answer(Object::Rules::ObjectType)="+objectType+"&answer(Object::Rules::ObjectId)"+"="+objectId+"&"+"answer(Object::Rules::ObjectVerId)"+"="+objectVerId+"&answer(ruleName)="+ruleName+"&answer(Object::Plan::OptionVerId)="+optionVerId;
		for (var i = 0; i < ruleGroupIds.length; i++) {
			val=ruleGroupIds[i];
			parameters=parameters+"&answer(ruleGroupId"+i+")"+"="+val;
		}
		createXMLHttpRequest();
		getTheContent(url,parameters);
		contentIsReady();
	}
		
  }
  


function enableSpinner(){
	
	if(document.getElementById("pagefrom")!=null && document.getElementById("pagefrom")!=undefined && ( document.getElementById("pagefrom").value=='CovLimit' || document.getElementById("pagefrom").value=='EndorsementCovLimit' )){
		document.body.style.cursor="wait";
		document.getElementById("ErrorContainer").style.display='inline';
		document.getElementById("ErrorContainer").value='please wait system is in progress';
		if(document.getElementById("loadercontent1")!=null && document.getElementById("loadercontent1")!=undefined) {
		  document.getElementById("loadercontent1").style.display="inline";
		  document.getElementById("loadercontent2").style.display="inline";	 

	 	// To disable Rate and Save buttons	 
	 	if(document.getElementById("RateTop")!=null && document.getElementById("RateTop")!=undefined ){
		 document.getElementById("RateTop").disabled = true;
		 }
		 if(document.getElementById("SaveTop")!=null && document.getElementById("SaveTop")!=undefined ){
		 document.getElementById("SaveTop").disabled = true;
		 }
		 if(document.getElementById("RateBottom")!=null && document.getElementById("RateBottom")!=undefined ){
		 document.getElementById("RateBottom").disabled = true;
		 }
		 document.getElementById("SaveBottom").disabled = true;
		}	 
	}
	
	 	
}

function disableSpinner(){
if(ajaxCounter > 0 ){
	ajaxCounter--; 
	}
	//alert("-- "+ajaxCounter);
	if(ajaxCounter==0){
		if(document.getElementById("pagefrom")!=null && document.getElementById("pagefrom")!=undefined && ( document.getElementById("pagefrom").value=='CovLimit' || document.getElementById("pagefrom").value=='EndorsementCovLimit' )) {
			document.getElementById("loadercontent1").style.display="none";
			document.getElementById("loadercontent2").style.display="none";		
					
			// To enable Rate and Save buttons					 
				if(document.getElementById("RateTop")!=null && document.getElementById("RateTop")!=undefined ){
					 document.getElementById("RateTop").disabled = false;
				 }
				 if(document.getElementById("SaveTop")!=null && document.getElementById("SaveTop")!=undefined ){
				 	document.getElementById("SaveTop").disabled = false;
				 }
				 if(document.getElementById("RateBottom")!=null && document.getElementById("RateBottom")!=undefined ){
					 document.getElementById("RateBottom").disabled = false;
				 }
				 document.getElementById("SaveBottom").disabled = false;		  		  
	
				document.body.style.cursor="default";
				document.getElementById("ErrorContainer").style.display='none';
				document.getElementById("ErrorContainer").value='';	
		}
	}
}

function divide_string(AttributesHtml) {
var attributeHtmlArr=AttributesHtml.split("$html$");
	for (var x = 0; x < attributeHtmlArr.length; x++) {
		attribute=attributeHtmlArr[x];
		attributeHtmlid=attribute.split("$id$");
		try{
			if(attributeHtmlid[1].indexOf("$HEAD$")!=-1) {
				attributeHead=attributeHtmlid[1].split("$HEAD$");
				document.getElementById("ATTRIBUTE"+attributeHtmlid[0]).innerHTML=attributeHead[1];
				document.getElementById("ATTRIBUTEHEAD"+attributeHtmlid[0]).innerHTML=attributeHead[0];
			} else {
				document.getElementById("ATTRIBUTE"+attributeHtmlid[0]).innerHTML=attributeHtmlid[1];
			}
		}catch(e){			
			//disableSpinner();		
		}
	}
	if(document.getElementById("pagefrom")!=null && document.getElementById("pagefrom")!=undefined && ( document.getElementById("pagefrom").value=='CovLimit' || document.getElementById("pagefrom").value=='EndorsementCovLimit') ){
		refreshCoverageAndLimit();
		if(document.forms[0].dirty !=null && document.forms[0].dirty !=undefined){
			document.forms[0].dirty.value='N';
		}else if(document.forms[1].dirty !=null && document.forms[1].dirty !=undefined){
			document.forms[1].dirty.value='N';
		}
	}
	disableSpinner();
	
}
var tooltipYOffsetfromPage;
var tooltipXOffsetfromPage
  //Exceuting the Rules and shoeing it to the user
  function executeRule(ruleName,obj1,attributeIdTOValidate,msgHolderXOffSet,msgHolderYOffSet) {

	if(msgHolderXOffSet !=null && msgHolderXOffSet != '' && msgHolderXOffSet !='undefined'){
		
			tooltipXOffset = parseInt(msgHolderXOffSet);
	}
	if(msgHolderYOffSet !=null && msgHolderYOffSet != '' && msgHolderYOffSet !='undefined'){
		
			tooltipYOffset = parseInt(msgHolderYOffSet);
	}
	if(tooltipXOffsetfromPage !=null && tooltipXOffsetfromPage != '' && tooltipXOffsetfromPage !='undefined'){
	
		tooltipXOffset = parseInt(tooltipXOffsetfromPage);
	
	}
	if(tooltipYOffsetfromPage !=null && tooltipYOffsetfromPage != '' && tooltipYOffsetfromPage !='undefined'){
	
		tooltipYOffset = parseInt(tooltipYOffsetfromPage);
		
	}

	//if(ajaxCounter==0) {enableSpinner();}
	//ajaxCounter++;
	//alert(ajaxCounter);
	obj=obj1;
	url="/excecuteRulesAction.do";
	var formElement= "";
	if(document.forms[0].ruleName == undefined){
	   formElement=document.forms[1];	
	}else{
	   formElement=document.forms[0];	
	}
	
	if(formElement.ruleName != null && formElement.ruleName != undefined){
		formElement.ruleName.value=ruleName;
	}	
	parameters=getFormAsString("Application");
	parameters=parameters+"answer(attributeIdTOValidate)="+attributeIdTOValidate+"&answer(ruleName)="+ruleName;
	createXMLHttpRequest1();
	getTheContent1(url,parameters);
	contentIsReadytoShow();

	
  }

  //Exceuting the Rules and shoeing it to the user
  function executeRepeatedApplicationRule(ruleName,obj1,attributeIdTOValidate) {

	obj=obj1;
	url="/excecuteRulesAction.do";
	var formElement=document.forms[0];
	parameters=getFormAsString("Application");
	parameters=parameters+"answer(attributeIdTOValidate)="+attributeIdTOValidate+"&answer(attributeNameWithPrimaryKey)="+obj.name+"&answer(ruleName)="+ruleName;
	createXMLHttpRequest();
	getTheContent1(url,parameters);
	contentIsReadytoShow();

	
  }

  //Exceuting the Rules and shoeing it to the user
  function validate(ruleName,obj1) {
	
	//if(ajaxCounter==0) {enableSpinner();}
	//ajaxCounter++;
	//alert("++ "+ajaxCounter);
	obj=obj1;
	url="/excecuteRulesAction.do";
	var formElement=document.forms[0];
	parameters=getFormAsString("Application")+"&answer(ruleName)="+ruleName;;
	createXMLHttpRequest1();
	getTheContent1(url,parameters);
	contentIsReadytoShow();
	document.forms[0].dirty.value='N';

	
  }

 function contentIsReadytoShow() {
    if (xmlHttp1.readyState == 4) { // Complete
      if (xmlHttp1.status == 200) { // OK response
    	  forwardToLoginPageIfInvalidSession(xmlHttp1.responseText);
	    showMessage(xmlHttp1.responseText,obj);
     } else {
      }

    }

  }
 function contentIsReadytoShowAtTop() {
    if (xmlHttp.readyState == 4) { // Complete
      if (xmlHttp.status == 200) { // OK response
    	  forwardToLoginPageIfInvalidSession(xmlHttp.responseText);
	    showMessageAtTop(xmlHttp.responseText,obj);
     } else {
      }

    }

  }

 /**
  * gets the contents of the form as a URL encoded String
  * suitable for appending to a url
  * @param formName to encode
  * @return string with encoded form values , beings with &
  */ 
 function getFormAsString(formName){
 	//Setup the return String
 	returnString ="";
	//Get the form values
	for(var fi=0;fi<10;fi++) {
		try {
			formElements=document.forms[fi].elements;
			
			if(formElements!=null){
			//loop through the array , building up the url
			//in the form /strutsaction.do&name=value
				for ( var i=formElements.length-1; i>=0; --i ){
					//we escape (encode) each value
					name=formElements[i].name;
					val=encodeURI(formElements[i].value);
					returnString=returnString+name+"="+val+"&";
				}
			}
		} catch(e){}
	}
 	//return the values
	
 	return returnString; 


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

function createXMLHttpRequest1(){
    autologout();
    xmlHttp1 = null;
    if(window.XMLHttpRequest){
	     xmlHttp1 = new XMLHttpRequest();
    }
    if(window.ActiveXObject){
		 try {
			xmlHttp1 = new ActiveXObject("Msxml2.XMLHTTP");
            
			
        }
        catch(e){
        try {
			xmlHttp1 = new ActiveXObject("Microsoft.XMLHTTP");
            
			
        }
        catch(e){
            try {
				xmlHttp1 = new ActiveXObject("MSXML2.XMLHTTP");
                
            }
            catch(e){
                try {
		            xmlHttp1 = new ActiveXObject("Msxml2.XMLHTTP.4.0");
                }
                catch(e){
                    xmlHttp1 = null;
                }
            }
        }
		}
    }
    return xmlHttp1;
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

function getTheContent1(URL,parameters){
	xmlHttp1.onreadystatechange = contentIsReadytoShow;
	xmlHttp1.open("POST", URL,true);
	xmlHttp1.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlHttp1.setRequestHeader("Content-length", parameters.length);
    xmlHttp1.setRequestHeader("Connection", "close");
    xmlHttp1.send(parameters);
}

function getTheContent2(URL,parameters){
	xmlHttp.onreadystatechange = contentIsReadytoShowAtTop;
	xmlHttp.open("POST", URL,true);
	xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlHttp.setRequestHeader("Content-length", parameters.length);
    xmlHttp.setRequestHeader("Connection", "close");
    xmlHttp.send(parameters);
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
			if(object !=null && object != undefined){
				object.style.background='#FFFFFF';
			}			
			//disableSpinner();
			return true;
		} else {
			box.style.visibility='visible';
			//disableSpinner();
			return false;
		}
		//disableSpinner();
}

function showMessageAtTop(text, object) {
		var box = document.getElementById('messageHolder');
		box.innerHTML = text;
		box.style.top=50;
		box.style.left=50;
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
	var i=0;
	var returnvalue;
	formSubmission = true;
	for(i=0; frm.elements[i]!=null; i++) {
		var ele = frm.elements[i]
		if(ele.type=='text' && ele.alt!='undefined' && ele.alt!='') {
			//alert("Hi = "+ele.id);
			returnvalue = call(ele);
			//alert(ele.id+"="+returnvalue);
			if(returnvalue==false) {
				ele.style.background='#FFCC33';
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
	//ssalert(returnvalue)
	formSubmission = false;
	enableFields();
	
	
	return returnvalue;
}

// to enable disabled fields
 function enableFields() {
  for(i=0; arr[i]!= null; i++ ) {
   var el = arr[i];
   el.disabled=false;
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
	var tooltipXOffset = 10;
	var tooltipYOffset = -13;

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
	function validateCoverages(formElement){
	
	if (ajaxCounter==0) {
		if(document.AddParentQuote.RateTop != null)
			document.AddParentQuote.RateTop.disabled=true;
		if(document.AddParentQuote.SaveTop !=null)	
			document.AddParentQuote.SaveTop.disabled=true;
		if(document.AddParentQuote.RateBottom !=null)	
			document.AddParentQuote.RateBottom.disabled=true;
		if((document.AddParentQuote.SaveBottom != null) && (document.AddParentQuote.SaveBottom != undefined))
			document.AddParentQuote.SaveBottom.disabled=true;
		var ruleName = formElement.ruleName.value;
		formElement.ruleName.value="OPTION_VALIDATION";
		return true;
	} else {
		formElement.ErrorContainer.style.display='inline';
		formElement.ErrorContainer.value='please wait system is in progress';		
		return false;
	}
}

function nextSubApplication(obj){
	var formElement=document.forms[0];
	if(document.forms[0].Navigation==null) {
		formElement=document.forms[1];
		formElement.Navigation.value="Next"
	} else {
		formElement=document.forms[0];
		formElement.Navigation.value="Next"
	}
    if(validateDynamicForm(formElement)) {
    	formElement.submit();
    }
	return true;
  }

  function previousSubApplication(){
    var formElement=document.forms[0];
	if(document.forms[0].Navigation==null) {
		formElement=document.forms[1];
		formElement.Navigation.value="Previous"
	} else {
		formElement=document.forms[0];
		formElement.Navigation.value="Previous"
	}
    if(validateDynamicForm(formElement)) {
    	formElement.submit();
    }
	return true;
  }
  
  function popUp(mylink, windowname) {
  
	if (! window.focus) {
		return true;
	}
	var mywin, href;
	if (typeof(mylink) == 'string') {
		href=mylink;
	} else {
		href=mylink.href;
	}
	var objvalue=0;
	if(document.getElementById("ownerIdfrmjsp") !=null && document.getElementById("ownerIdfrmjsp") !=undefined) {
 		objvalue=document.getElementById("ownerIdfrmjsp").value;
 	}
	href=href+'&answer(Object::ZipCode::PageNum)=0&answer(ownerId)='+objvalue;
	mywin = window.open(href,'PopUp','width=550, height=350, left=550, top=125, scrollbars=yes');
	mywin.focus();

	return false;
}

function refreshCoverageAndLimitWithRules(ruleName,ruleGroupIds,SubApplId,SubApplVerId)
 {

if(document.forms[0].IsOptionDisabled.value=='N'){
	
 if(ajaxCounter==0) {enableSpinner();}
  	ajaxCounter++;

  //	enableSpinner();
	url="/AJAXRatingCoveragesAndLimitV2.do";
	var formElement=document.forms[0];
	formElement.ruleName.value=ruleName;


	parameters= getFormAsString("Application");
	val1=escape(encodeURI(SubApplId));
	val2=escape(encodeURI(SubApplVerId));
	parameters1="answer(SubApplId)"+"="+val1+"&"+"answer(SubApplVerId)"+"="+val2+"&answer(ruleName)="+ruleName;

	for (var i = 0; i < ruleGroupIds.length; i++) {
		val=ruleGroupIds[i];

		parameters1=parameters1+"&answer(ruleGroupId"+i+")"+"="+val;
	}
   document.forms[0].AJAX_Rating.value="Y";
url=url+"?"+parameters1;
 panel="OPTIONS_DIV";
 //alert(ajaxCounter);
  try {
   autologout();
   new Ajax.Updater(
     panel,
     url,
     {
       synchronous:true,  parameters:$(document.forms[0]).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);disableSpinner();document.forms[0].AJAX_Rating.value="N";document.forms[0].dirty.value='N';},
       onException:function(){disableSpinner();document.forms[0].AJAX_Rating.value="N";document.forms[0].dirty.value='N';}
     }
    );
  }catch(err) {
   txt="There was an error on this page.\n\n";
   txt+="Error description: " + err.description + "\n\n";
   txt+="Click OK to continue.\n\n";
  
   alert(txt);
  }
  }
  return false;
 
 }
 

 function refreshCoverageAndLimit()
 {
 
	if(document.forms[0].IsOptionDisabled.value=='N'){
	if(ajaxCounter==0) {enableSpinner();}
  	ajaxCounter++;
  	
	    document.forms[0].AJAX_Rating.value="Y";
	    if(document.getElementById("pagefrom").value=='CovLimit' ){
	 		url="/InMemoryRate.do";
	 	}
	 	else{
	 		url="/EndorsementInMemoryRate.do";
	 	}
	 panel="OPTIONS_DIV";
	  try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(document.forms[0]).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);disableSpinner();document.forms[0].AJAX_Rating.value="N";document.forms[0].dirty.value='N';},
       onException:function(){disableSpinner();document.forms[0].AJAX_Rating.value="N";document.forms[0].dirty.value='N';}
	     }
	    );
	  }catch(err) {
	   txt="There was an error on this page.\n\n";
	   txt+="Error description: " + err.description + "\n\n";
	   txt+="Click OK to continue.\n\n";
	   alert(txt);
	  }
	  
	}
	
  return false;
 
 }
 
 
 /**
  *Save & Rate buttons - disabled while hit or save or rate in Cov and Limit Page
  */
 function goSubmit(element,action) {
	document.AddParentQuote.fc.value=action;
	return true;
}

function validateExpiryDate(submit){
	var frm = document.forms[0];
	var vardate = frm.CoveregeExpire.value
	var ddate = new Date(vardate);
	if(!isDate(vardate)){
		alert("Invalid Date")
		frm.CoveregeExpire.select();
		return false;
	}
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);
	
	if (vardate !=null || vardate!=""){
	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.CoveregeExpire.select();
		return false;
	}
	}
	/*var reqDate = new Date("01/01/2005");
	
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
	}*/
	return true;
}

function forwardAction(URL, frm) {
	frm.action=URL;
    frm.submit();
	return true;
}

 function refreshCoverageAndLimit(url)
 {	var frm = "";

 	if(document.forms[0].IsOptionDisabled == undefined){

 		frm = document.forms[1];
 	}else{
 		frm = document.forms[0];
 	
 	}
	if(frm.IsOptionDisabled.value=='N'){
	if(ajaxCounter==0) {enableSpinner();}
  	ajaxCounter++;  	
    frm.AJAX_Rating.value="Y";

	 panel="OPTIONS_DIV";
	  try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(frm).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';},
       onException:function(){disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';}
	     }
	    );
	  }catch(err) {
	   txt="There was an error on this page.\n\n";
	   txt+="Error description: " + err.description + "\n\n";
	   txt+="Click OK to continue.\n\n";
	   alert(txt);
	  }
	  
	}
	
  return false;
 
 }
 /**
  * Implemented by using prototype's ajax utility
  * Created for Dynamic URL
  * @author mohan
  */
 function executeOptionRulesURL(ruleName,ruleGroupIds,productId,productVerId,objectType,objectName,optionURL,refereshURL,specificValidationScript) {
	var frm = "";
  	if(document.forms[0].IsOptionDisabled == undefined){
  		
  		frm = document.forms[1];
  	}else{
  		frm = document.forms[0];
  	
 	}
  	if(!(document.getElementById("pagefrom")!=null && document.getElementById("pagefrom")!=undefined && ( document.getElementById("pagefrom").value=='CovLimit' || document.getElementById("pagefrom").value=='EndorsementCovLimit') &&  frm.IsOptionDisabled.value=='Y' )){

    	if(ajaxCounter==0) {enableSpinner();}
	  	ajaxCounter++;
	  	var formElement="";
	  	if(document.forms[0].IsOptionDisabled == undefined){
  		
  			formElement = document.forms[1];
	  	}else{
	  		formElement = document.forms[0];
	  	
	 	}
		formElement.ruleName.value=ruleName;
		var  objectId = "";
		var objectVerId ="";
		objectId=escape(encodeURI(productId));
		objectVerId=escape(encodeURI(productVerId));
		parameter= getFormAsString("Application");
		parameter=parameter+"&answer(Object::Rules::ObjectName)="+objectName+"&answer(Object::Rules::ObjectType)="+objectType+"&answer(Object::Rules::ObjectId)"+"="+objectId+"&"+"answer(Object::Rules::ObjectVerId)"+"="+objectVerId+"&answer(ruleName)="+ruleName;
		
		for (var i = 0; i < ruleGroupIds.length; i++) {
			val=ruleGroupIds[i];
			parameter=parameter+"&answer(ruleGroupId"+i+")"+"="+val;
		}
		autologout();
	  	new Ajax.Request(optionURL,{method: 'post',parameters:parameter,onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);eval(specificValidationScript)},onSuccess: function(transport){divide_string_url(transport.responseText,refereshURL)}});	  	  	  
	}
	
  }
  
  
 /**
  * Implemented by using prototype's ajax utility
  * Created for Dynamic URL
  * @author Mohan
  */
  
  
function divide_string_url(AttributesHtml,refereshURL) {
	var attributeHtmlArr=AttributesHtml.split("$html$");
	for (var x = 0; x < attributeHtmlArr.length; x++) {
		attribute=attributeHtmlArr[x];
		attributeHtmlid=attribute.split("$id$");
		try{
			if(attributeHtmlid[1].indexOf("$HEAD$")!=-1) {
				attributeHead=attributeHtmlid[1].split("$HEAD$");
				document.getElementById("ATTRIBUTE"+attributeHtmlid[0]).innerHTML=attributeHead[1];
				document.getElementById("ATTRIBUTEHEAD"+attributeHtmlid[0]).innerHTML=attributeHead[0];
			} else {
				document.getElementById("ATTRIBUTE"+attributeHtmlid[0]).innerHTML=attributeHtmlid[1];
			}
		}catch(e){			
			disableSpinner();		
		}
	}		
	//disableSpinner();
	refreshCoverageAndLimit(refereshURL);
}

function refreshCoverageAndLimitWithRulesVer1(ruleName,ruleGroupIds,SubApplId,SubApplVerId)
  {
 	var frm = "";
  	if(document.forms[0].AJAX_Rating == undefined){
  		
  		frm = document.forms[1];
  	}else{
  		frm = document.forms[0];
  	
 	}
  	

 	
  if(ajaxCounter==0) {enableSpinner();}
   	ajaxCounter++;
 
   //	enableSpinner();
 	url="/AJAXRatingCoveragesAndLimitV2.do";
 	var formElement=frm;
 	formElement.ruleName.value=ruleName;
 
 
 	parameters= getFormAsString("Application");
 	val1=escape(encodeURI(SubApplId));
 	val2=escape(encodeURI(SubApplVerId));
 	parameters1="answer(SubApplId)"+"="+val1+"&"+"answer(SubApplVerId)"+"="+val2+"&answer(ruleName)="+ruleName;
 
 	for (var i = 0; i < ruleGroupIds.length; i++) {
 		val=ruleGroupIds[i];
 
 		parameters1=parameters1+"&answer(ruleGroupId"+i+")"+"="+val;
 	}
    frm.AJAX_Rating.value="Y";
 url=url+"?"+parameters1;
  panel="OPTIONS_DIV";
  //alert(ajaxCounter);
   try {
    autologout();
    new Ajax.Updater(
      panel,
      url,
      {
        synchronous:true,  parameters:$(frm).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';setCoveragesDetail2();},
        onException:function(){disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';setCoveragesDetail2();}
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

function refreshCoverageAndLimit(url,specificValidationScript)
{	var frm = "";

	if(document.forms[0].IsOptionDisabled == undefined){

		frm = document.forms[1];
	}else{
		frm = document.forms[0];
	
	}
	if(frm.IsOptionDisabled.value=='N'){
	if(ajaxCounter==0) {enableSpinner();}
 	ajaxCounter++;  	
   frm.AJAX_Rating.value="Y";

	 panel="OPTIONS_DIV";
	  try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(frm).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';eval(specificValidationScript);},
      onException:function(){disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';}
	     }
	    );
	  }catch(err) {
	   txt="There was an error on this page.\n\n";
	   txt+="Error description: " + err.description + "\n\n";
	   txt+="Click OK to continue.\n\n";
	   alert(txt);
	  }
	  
	}
	
 return false;

}