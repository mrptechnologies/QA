

  var req;
  var obj;
  var tabId;
  var xmlHttp;
  //For modifying html pages
  function ProductBrowse() {
	url="/excecuteRulesAction.do";
	var formElement=document.forms[0];
	parameters= getFormAsString("Application");
	createXMLHttpRequest();
	getTheContent(url,parameters);
	contentIsReady();
  }


function divide_string(AttributesHtml) {
var attributeHtmlArr=AttributesHtml.split("$html$");
	for (var x = 0; x < attributeHtmlArr.length; x++) {
		attribute=attributeHtmlArr[x];
		attributeHtmlid=attribute.split("$id$");
		document.getElementById(attributeHtmlid[0]).innerHTML=attributeHtmlid[1];
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
	formElements=document.forms[0].elements;
 	//loop through the array , building up the url
 	//in the form /strutsaction.do&name=value
 	for ( var i=formElements.length-1; i>=0; --i ){
		//we escape (encode) each value
		name=formElements[i].name;
	    val=escape(encodeURI(formElements[i].value));
		returnString=returnString+name+"="+val+"&";
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