
  var req;
  var obj;
  var tabId;
  var xmlHttp;
  var xmlHttp1;
  var ajaxCounter=0;


function executeApplicationListRule(ruleName,ruleGroupIds,SubApplId,SubApplVerId,form){
	
	var parameters = "";
	val1=escape(encodeURI(SubApplId));
	val2=escape(encodeURI(SubApplVerId));
	parameters="&answer(ruleName)="+ruleName+"&"+parameters+"answer(SubApplId)"+"="+val1+"&"+"answer(SubApplVerId)"+"="+val2+"&answer(ruleName)="+ruleName;
	
	for (var i = 0; i < ruleGroupIds.length; i++) {
		val=ruleGroupIds[i];
		parameters=parameters+"&answer(ruleGroupId"+i+")"+"="+val;
	}
	
	var url = "/excecuteRulesAction.do?"+parameters;
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){getQuestion(transport,form);enableSubmitButton();}});	

}

/**
 * Added this API to enable the submit button in Coverages and Limits page while creating the submission. 
 * Added for Bug# 14854
 * @author Rajeshkumar P
 * Created on 02-May-2011
 */
function enableSubmitButton() {
	
	if(document.getElementById("submitButton") != null && document.getElementById("submitButton") != undefined) {
		document.getElementById("submitButton").disabled = false;
	}
}

 function executeOptionRule(ruleName,ruleGroupIds,productId,productVerId,objectType,objectName,form) {

  	if(!(document.getElementById("pagefrom")!=null && document.getElementById("pagefrom")!=undefined && ( document.getElementById("pagefrom").value=='CovLimit' || document.getElementById("pagefrom").value=='EndorsementCovLimit') &&  document.forms[0].IsOptionDisabled.value=='Y' )){
  	
    	if(ajaxCounter==0) {enableSpinner();}
	  	ajaxCounter++;
  	   //alert(ajaxCounter);
	  	//enableSpinner();
		
		
		form.ruleName.value=ruleName;
		
		
		objectId=escape(encodeURI(productId));
		objectVerId=escape(encodeURI(productVerId));
		parameters=parameters+"answer(Object::Rules::ObjectName)="+objectName+"&answer(Object::Rules::ObjectType)="+objectType+"&answer(Object::Rules::ObjectId)"+"="+objectId+"&"+"answer(Object::Rules::ObjectVerId)"+"="+objectVerId+"&answer(ruleName)="+ruleName;
		for (var i = 0; i < ruleGroupIds.length; i++) {
			val=ruleGroupIds[i];
			parameters=parameters+"&answer(ruleGroupId"+i+")"+"="+val;
		}
		var url="/excecuteDRLRulesAction.do?"+parameters;
		autologout();
		new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){getQuestion(transport,form);}});
	}
		
  }

/**
  * Implemented by using prototype's ajax utility
  * Created for Dynamic URL
  * @author Dineshkumar.R
  */
 function executeApplicationOptionRulesURLVer2(ruleName,ruleGroupIds,productId,productVerId,objectType,objectName,optionURL,form,value) {
	
		objectId=escape(encodeURI(productId));
		objectVerId=escape(encodeURI(productVerId));
		var parameter="";
		parameter="&answer(Object::Rules::ObjectName)="+objectName+"&answer(Object::Rules::ObjectType)="+objectType+"&answer(Object::Rules::ObjectId)"+"="+objectId+"&"+"answer(Object::Rules::ObjectVerId)"+"="+objectVerId+"&answer(ruleName)="+ruleName+"&answer(Object::Quote::ProductVerId)="+productVerId+"&answer(Object::Plan::AggregateLimit)="+value;
		
		for (var i = 0; i < ruleGroupIds.length; i++) {
			val=ruleGroupIds[i];
			parameter=parameter+"&answer(ruleGroupId"+i+")"+"="+val;
		}			 
		optionURL = optionURL+"?"+parameter; 
		autologout();
	  	new Ajax.Request(optionURL,{method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){getQuestion(transport,form);}});	  	  	  
	
	
  }

/**
  * 
  * 
  * @author Dineshkumar.R
  */
 function executeApplicationListRuleForDynamicSelectElement(ruleName,ruleGroupIds,SubApplId,SubApplVerId,form){
	document.getElementById("submitButton").disabled = true;
	document.getElementById("loadercontent1").style.display =  "block";
	var parameters = "";
	val1=escape(encodeURI(SubApplId));
	val2=escape(encodeURI(SubApplVerId));
	parameters="&answer(ruleName)="+ruleName+"&"+parameters+"answer(SubApplId)"+"="+val1+"&"+"answer(SubApplVerId)"+"="+val2+"&answer(ruleName)="+ruleName+"&answer(DynamicSelectElement)=Yes";
	
	for (var i = 0; i < ruleGroupIds.length; i++) {
		val=ruleGroupIds[i];
		parameters=parameters+"&answer(ruleGroupId"+i+")"+"="+val;
	}
	
	var url = "/excecuteRulesAction.do?"+parameters;
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){
	forwardToLoginPageIfInvalidSession(transport.responseText);
	document.getElementById("submitButton").disabled = false;
	document.getElementById("loadercontent1").style.display =  "none";
	},onSuccess: function(transport){getQuestion(transport,form);}});

}
	function getQuestion(transport,form){

		//alert("getQuestion")
		 AttributesHtml=transport.responseText;		 
		 setSubQuestions(AttributesHtml,form);

	}

	function setSubQuestions(AttributesHtml,form) {
	
		var attrArr = AttributesHtml.split("$TABLEID$");
		
		if(attrArr[1] !=null && attrArr[1] != 'undefined'){
		
			var headingArr = attrArr[1].split("$TABLEIDS$");
			
			for(var x1 = 0; x1 < headingArr.length; x1++){
			
			var styleId = headingArr[x1].replace(/^\s*/, "").replace(/\s*$/, "");
			
			if(document.getElementById(styleId) !=null && document.getElementById(styleId)!='undefined'){
				
				document.getElementById(styleId).style.display = "block";
			}
			
			}
		}
		
		if(attrArr[0] ==null || attrArr[0] == 'undefined'){
		
			var attributeHtmlArr=attrArr.split("$html$");;
		}else{
	
			var attributeHtmlArr=attrArr[0].split("$html$");
		}
		
		var listNo = form.applicationIndex.value;
		var displayType = "";
		for (var x = 0; x < attributeHtmlArr.length; x++) {
			
			attribute=attributeHtmlArr[x];
			attributeHtmlid=attribute.split("$id$");
			try{
			
				if(attributeHtmlid[1].indexOf("$HEAD$")!=-1) {
					attributeHead=attributeHtmlid[1].split("$HEAD$");
					
					
					if(attributeHead[1].indexOf("type='hidden'")!=-1 && attributeHead[1].indexOf("type='Checkbox'") == -1){
					
						//displayType = 'none';
						displayTypeRow = 'none';
						//document.getElementById(listNo+"_ATTRIBUTEHEAD"+attributeHtmlid[0]).parentNode.className = "field";
						//alert(listNo+"_ATTRIBUTEHEAD"+attributeHtmlid[0]).offsetParent.className);
						
					}else{
						//displayType = 'inline';
						displayTypeRow = '';
					//	document.getElementById(listNo+"_ATTRIBUTEHEAD"+attributeHtmlid[0]).parentNode.className = "fieldHidden";
					}
					document.getElementById(listNo+"_ATTRIBUTE"+attributeHtmlid[0]).style.display = displayType;
					if(document.getElementById(listNo+"_ATTRIBUTE_TableData"+attributeHtmlid[0]) != null && document.getElementById(listNo+"_ATTRIBUTE_TableData"+attributeHtmlid[0])!='undefined'){
						document.getElementById(listNo+"_ATTRIBUTE_TableData"+attributeHtmlid[0]).style.display = displayType;					
					}
					if(document.getElementById(listNo+"_ATTRIBUTE_TableRow"+attributeHtmlid[0]) != null && document.getElementById(listNo+"_ATTRIBUTE_TableRow"+attributeHtmlid[0])!= 'undefined'){
						document.getElementById(listNo+"_ATTRIBUTE_TableRow"+attributeHtmlid[0]).style.display = displayTypeRow;
					}
					if(document.getElementById(listNo+"_ATTRIBUTEHEAD_TableData"+attributeHtmlid[0]) != null && document.getElementById(listNo+"_ATTRIBUTEHEAD_TableData"+attributeHtmlid[0]) != 'undefined'){
						document.getElementById(listNo+"_ATTRIBUTEHEAD_TableData"+attributeHtmlid[0]).style.display = displayType;
					}
					document.getElementById(listNo+"_ATTRIBUTE"+attributeHtmlid[0]).innerHTML=attributeHead[1];
					document.getElementById(listNo+"_ATTRIBUTEHEAD"+attributeHtmlid[0]).style.display = displayType;
					document.getElementById(listNo+"_ATTRIBUTEHEAD"+attributeHtmlid[0]).innerHTML=attributeHead[0];
					
				} else {
					if(attributeHtmlid[1].indexOf("type='hidden'")!=-1 && attributeHtmlid[1].indexOf("type='Checkbox'") == -1){					
						displayType = 'none';
						//document.getElementById(listNo+"_ATTRIBUTE"+attributeHtmlid[0]).parentNode.className = "fieldHidden";
						
					}else{
						displayType = 'inline';
						//document.getElementById(listNo+"_ATTRIBUTE"+attributeHtmlid[0]).parentNode.className = "field";
					}
					document.getElementById(listNo+"_ATTRIBUTE"+attributeHtmlid[0]).style.display = displayType;					
					document.getElementById(listNo+"_ATTRIBUTE"+attributeHtmlid[0]).innerHTML=attributeHtmlid[1];
				}
			}catch(e){}
	}
	if(document.getElementById("pagefrom")!=null && document.getElementById("pagefrom")!=undefined && ( document.getElementById("pagefrom").value=='CovLimit' || document.getElementById("pagefrom").value=='EndorsementCovLimit') ){
		refreshCoverageAndLimit();
		document.forms[0].dirty.value='N';
	}
	disableSpinner();
	
}


  function refreshCoverageAndLimit(url)
 {	var frm = "";
 	
 	if(document.forms[0].AJAX_Rating == undefined){
 		
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
 
 function disableSpinner(){
	ajaxCounter--; 
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

  //Exceuting the Rules and showing it to the user
  function executeListRule(ruleName,obj1,attributeIdTOValidate,form) {
	
	//if(ajaxCounter==0) {enableSpinner();}
	//ajaxCounter++;
	//alert(ajaxCounter);
	obj=obj1;
	var parameters ='';
	//var formElement=document.forms[0];
	if(form.ruleName != null && form.ruleName != undefined){
		form.ruleName.value=ruleName;
	}	
	//parameters=getFormAsString("Application");
	parameters=parameters+"answer(attributeIdTOValidate)="+attributeIdTOValidate+"&answer(ruleName)="+ruleName;
	url="/excecuteRulesAction.do?"+parameters;
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){getResult(transport.responseText,obj,form);}});
	
	//createXMLHttpRequest1();
	//getTheContent1(url,parameters);
	//contentIsReadytoShow();

	
  }
  
  
  
  
    //Exceuting the Rules and showing it to the user
  function executeDRLRule(ruleName,obj1,attributeIdTOValidate,form,yOffSet) {
	
	//if(ajaxCounter==0) {enableSpinner();}
	//ajaxCounter++;
	//alert(ajaxCounter);
	obj=obj1;
	objectValue = obj.value;
	//alert("objectValue"+objectValue)
	var parameters ='';
	//var formElement=document.forms[0];
	if(form.ruleName != null && form.ruleName != undefined){
		form.ruleName.value=ruleName;
	}	
	//parameters=getFormAsString("Application");
	parameters=parameters+"answer(attributeIdTOValidate)="+attributeIdTOValidate+"&answer(ruleName)="+ruleName+"&answer(attributeValue)="+objectValue;
	url="/excecuteRulesAction.do?"+parameters;
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){getResult(transport.responseText,obj,form,yOffSet);}});
	
	//createXMLHttpRequest1();
	//getTheContent1(url,parameters);
	//contentIsReadytoShow();

	
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
	var tooltipYOffset = -53;
	var tooltipXOffset2;
	var tooltipYOffset2;
 	function getResult(text,object,form,yOffSet){
 		
		var box = document.getElementById('messageHoldernew');
		
		box.innerHTML = text;
		if(object !=null) {
		
			var toolTipBoxWidth = getPropertyValue('messageHoldernew', 'offsetWidth',form);
			var toolTipBoxHeight = getPropertyValue('messageHoldernew', 'offsetHeight',form);
		
			var linkPosX = getRealPos(object,'x') + tooltipXOffset+138;
			if(yOffSet !=null && yOffSet != 'undefined'){
				var yOffSet1 = yOffSet;
				tooltipYOffset = yOffSet;
				tooltipYOffset = parseInt(tooltipYOffset);
				
			}
			
			if(tooltipXOffset2 !=null && tooltipXOffset2 !='' && tooltipXOffset2 != 'undefined'){
				tooltipXOffset = parseInt(tooltipXOffset2);
			}
			
			if(tooltipYOffset2 !=null && tooltipYOffset2 !='' && tooltipYOffset2 != 'undefined'){
				tooltipYOffset = parseInt(tooltipYOffset2);
			}
			
			var linkPosY = getRealPos(object,'y') - toolTipBoxHeight + tooltipYOffset-50;
			var linkposy1 =  - toolTipBoxHeight + tooltipYOffset-50;
			//alert("linkPosY"+linkPosY)
			//alert("linkPosX"+linkPosX)
			//Account for page scrolling. Reposition tooltip as neccesary
			if((getScrollX() + document.body.clientWidth) < (linkPosX + toolTipBoxWidth)){
			
			var tempOffset = (linkPosX + toolTipBoxWidth) - (getScrollX() + document.body.clientWidth);
			linkPosX -= tempOffset + 6;
			}
			//alert("tempOffset"+tempOffset+"linkPosX"+linkPosX)
			if(getScrollY() > linkPosY){
			
			var tempName = document.getElementById("messageHoldernew");
			var tempOffset = tempName.offsetHeight;
			//alert("toolTipBoxHeight>"+toolTipBoxHeight+"tooltipYOffset>"+tooltipYOffset+"tempOffset>"+tempOffset)
			//linkPosY += toolTipBoxHeight - (2*tooltipYOffset) + tempOffset + 4;
			
			}
			//allow for manual positioning override
			
			linkPosX += xOffsetArray[lastToolNum];
			linkPosY += yOffsetArray[lastToolNum];
			
			//Make it happen
			var linkPosXString = linkPosX + "px";
			var linkPosYString = linkPosY + "px";
			

			box.style.top=linkPosYString;
			box.style.left=linkPosXString;
		}
		box.style.visibility='visible';
		box.style.display='block';

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
	
	function getPropertyValue(objectID, propertyName,form){
		return document.getElementById(objectID)[propertyName];
	}
 
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
	
	
	/**
	 * To execute the primary data vaidation rule 
	 * @author Guru	 
	 */
	 function executePrimaryDataValidationRule(ruleName,form,attrObj,attributeIdTOValidate,attrvalidationName,successJavaScript,yOffSet){
	 
	 successJavaScript = successJavaScript.replace(/__/g,"'");
	 	 	 	 
	 	 url="/excecuteRulesAction.do?"+"answer(attributeIdTOValidate)="+attributeIdTOValidate+"&answer(ruleName)="+ruleName+"&answer(attributeValidationName)="+attrvalidationName;
	 	 
	 	 if(form.ruleName != null && form.ruleName != undefined){
	 	 	form.ruleName.value = ruleName;
	 	 }
	 	 autologout();
	 	 new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){getResult(transport.responseText,attrObj,form,yOffSet);if(transport.responseText==""){eval(successJavaScript)}}});		 
	 }
	/**
  	* To set the value for check box
  	* @author Daniel K
  	*/
	function executeHiddenCheckBoxRule(attr,hiddenElement){
 	
	 if(attr.checked){
	 
		 hiddenElement.value = attr.value
 	}else if(!(attr.checked)){
 	
  		hiddenElement.value ="";
 	}
	}
var nameofForm;
 function popUpForList(mylink, windowname) {
   nameofForm = windowname.id;
   
 
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
	href=href+'&answer(Object::ZipCode::PageNum)=0&answer(ownerId)='+objvalue+'&FormName='+nameofForm;
	
	var url = "../common/CheckForSessionExpired.jsp";
 	var isInvalidSession = 0;
 	autologout();
	new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
			isInvalidSession = forwardToLoginPageIfInvalidSession(transport.responseText);
			if(isInvalidSession == 0) {
				mywin = window.open(href,'PopUp','width=550, height=350, left=550, top=125, scrollbars=yes');
				mywin.focus();
		 	}
		},
		onSuccess: function(transport){}});

	return false;
}

function MapPopupVer2(mylink,formElement) {
 var riskAddress1='', riskAddress2='', city='', state='', zipCode='';
 href="";
  
if(formElement.StreetNumber!=null && formElement.StreetNumber!=undefined){
	 riskAddress1=formElement.StreetNumber.value+' '+formElement.StreetName.value;
}else {
riskAddress1 = formElement.Address1.value;
}
if(formElement.Address2!=null && formElement.Address2!=undefined){
 riskAddress2=formElement.Address2.value;
}
 city=formElement.City.value;
 if(formElement.State!=null && formElement.State!=undefined){
 state=formElement.State.value;
 }else if(formElement.StateForList!=null && formElement.StateForList!=undefined){
  state=formElement.StateForList.value;
 }
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
	
	var url = "../common/CheckForSessionExpired.jsp";
 	var isInvalidSession = 0;
 	autologout();
	new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
			isInvalidSession = forwardToLoginPageIfInvalidSession(transport.responseText);
			if(isInvalidSession == 0) {
				mywin = window.open(href,'PopUp','width=600, height=450, left=550, top=125, scrollbars=yes');
				mywin.focus();
		 	}
		},
		onSuccess: function(transport){}});

	return false;
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
	if(ajaxCounter > 0){
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
	  	var formElement=frm;
	  	
	  	if(formElement.ruleName == undefined){
	  		formElement = document.forms[1];
	  	}
	  	
		formElement.ruleName.value=ruleName;
		var objectId = "";
		var objectVerId = "";
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


 
 
   function refreshCoverageAndLimitWithDRLRules(ruleName,ruleGroupIds,SubApplId,SubApplVerId,objectType,objectName,specificValidationScript)
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
 	       synchronous:true,  parameters:$(frm).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);disableSpinner();frm.AJAX_Rating.value="N";frm.dirty.value='N';eval(specificValidationScript)},
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

  