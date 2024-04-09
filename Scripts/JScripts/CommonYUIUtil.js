
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
					val=encodeURIComponent(formElements[i].value);
					returnString=returnString+name+"="+val+"&";
				}
			}
		} catch(e){}
	}
 	//return the values
	
 	return returnString; 


 }
 
/**
  *This method is used to generate the Request which is used to attach the post body of DataSource
  *author Sathiyaseelan M
  */
  var generateRequest = function(oState, oSelf) {
        // Get states or use defaults
        oState = oState || { pagination: null, sortedBy: null };
        var sort = (oState.sortedBy) ? oState.sortedBy.key : "id";
        var dir = (oState.sortedBy && oState.sortedBy.dir === YAHOO.widget.DataTable.CLASS_DESC) ? "desc" : "asc";
        var startIndex = (oState.pagination) ? oState.pagination.recordOffset : 0;
        var results = (oState.pagination) ? oState.pagination.rowsPerPage : 25;

	//Get form elements
       	var parameters=getFormAsString(document.forms[0]); 
     	parameters = parameters.replace(/\+/g,'%2B');

        // Build custom request
        return  parameters+"&sort=" + sort +
                "&dir=" + dir +
                "&startIndex=" + startIndex +
                "&results=" + (startIndex + results);
    };

