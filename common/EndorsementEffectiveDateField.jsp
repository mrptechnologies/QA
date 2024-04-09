<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<bean:parameter id="dateInputID" name="inputDateField" />
<bean:parameter id="dateFieldPanel" name="panelDiv" />
<bean:parameter id="minDate" name="minimumDate" />
<bean:parameter id="maxDate" name="maximumDate" />
<bean:parameter id="trueOrFalse" name="allowBlank" />
<bean:parameter id="setDefaultToday" name="setDefaultToday" />

<script type="text/javascript">

    var myDatePanel = new Ext.Panel({
    applyTo:'<%=dateFieldPanel%>',
    hideLabels:true,
    width:120,
    autoHeight:true,
	bodyBorder : false,
    border : false,
    frame:false,
    items:[{
      xtype:'datefield',
      name:'endorsementdate',
      id:'<%=dateInputID%>',
      width:120,
      ref:'dateFieldRef',
      allowBlank:<%=trueOrFalse%>,
      minValue:'<%=minDate%>',
      maxValue:'<%=maxDate%>'
    }]
  });


var clickHandler = function() {
	
	if(document.getElementById("EndorsementQuoteStartDate")!= null){
	 if(document.getElementById('<%=dateInputID%>').value!=""){
	    if(isDate(document.getElementById('<%=dateInputID%>').value)) {
			var thisDate = new Date(document.getElementById('<%=dateInputID%>').value);
			var minDate = myDatePanel.dateFieldRef.minValue;
			var maxDate = myDatePanel.dateFieldRef.maxValue;
			
			if(minDate!="" && maxDate!="") {
				if(thisDate < minDate || thisDate > maxDate) {
	      	        alert("Please enter  Effective date between Policy Effective date and the Policy Expiry Date" );
				    document.getElementById('<%=dateInputID%>').value = myDatePanel.dateFieldRef.minValue.format("m/d/Y");
					document.getElementById("txtDate").value=document.getElementById('<%=dateInputID%>').value;
				    document.getElementById("EndorsementQuoteStartDate").value=document.getElementById('<%=dateInputID%>').value;
				}else {
				    document.getElementById("txtDate").value=document.getElementById('<%=dateInputID%>').value;
			        document.getElementById("EndorsementQuoteStartDate").value=document.getElementById('<%=dateInputID%>').value;
				}
			}else if(minDate!="" && maxDate=="") {
				if(thisDate < minDate) {
				    alert("Please enter  Effective date between Policy Effective date and the Policy Expiry Date" );
				    document.getElementById('<%=dateInputID%>').value = myDatePanel.dateFieldRef.minValue.format("m/d/Y");
					document.getElementById("txtDate").value=document.getElementById('<%=dateInputID%>').value;
				    document.getElementById("EndorsementQuoteStartDate").value=document.getElementById('<%=dateInputID%>').value;
				}else {
				    document.getElementById("txtDate").value=document.getElementById('<%=dateInputID%>').value;
			        document.getElementById("EndorsementQuoteStartDate").value=document.getElementById('<%=dateInputID%>').value;
				}
			}
		}else {
		    document.getElementById('<%=dateInputID%>').value ="";
		    document.getElementById("txtDate").value = "";
		    document.getElementById("EndorsementQuoteStartDate").value = "";
		}
	 }
	}
	
};


if(document.getElementById("EndorsementQuoteStartDate")!= null){ 
 if(document.getElementById("txtDate").value!="") {
    document.getElementById('<%=dateInputID%>').value = document.getElementById("txtDate").value;
 }else if(document.getElementById("txtDate").value=="") {
   document.getElementById('<%=dateInputID%>').value ='<%=minDate%>';
   document.getElementById("txtDate").value = '<%=minDate%>';
 }
}

Ext.EventManager.on('<%=dateInputID%>', 'blur', clickHandler);

function isDate(dateStr) {

	var datePat = /^(\d{1,2})(\/)(\d{1,2})(\/)(\d{4})$/;
	var matchArray = dateStr.match(datePat); // is the format ok?
	
	if (matchArray == null) {
		alert("Please enter valid date as mm/dd/yyyy.");
		return false;
	}
	
	month = matchArray[1]; // parse date into variables
	day = matchArray[3];
	year = matchArray[5];
	
	if (month < 1 || month > 12) { // check month range
		alert("Month must be between 1 and 12.");
		return false;
	}
	
	if (day < 1 || day > 31) {
		alert("Day must be between 1 and 31.");
		return false;
	}
	
	if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		alert("Month "+month+" doesn`t have 31 days!")
		return false;
	}
	
	if (month == 2) { // check for february 29th
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		if (day > 29 || (day==29 && !isleap)) {
			alert("February " + year + " doesn`t have " + day + " days!");
			return false;
		}
	}
	return true; // date is valid
}


</script>