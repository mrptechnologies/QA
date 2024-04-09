<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">



<table WIDTH="70%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
  	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
				<tr>
					<td class="NewSectionHead" colspan="4" align="center">
						Edit Loss History
					</td>
			</table>	
			<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
				<tr>
					<td class="altdisply">
						Date*
					</td>
					<td class="altdisply" width="5">
						<input type="text" name="answer(date)" size="" maxlength="" id="date" >
					</td>
				</tr>
				<tr>
					<td class="SearchResult">
						Type of Loss
					</td>
					<td class="SearchResult">
						<input type="text" name="answer(type)" size="" maxlength="" id="type" >
					</td>
				</tr>
				<tr>
					<td class="altdisply">
						Description*
					</td>
					<td class="altdisply">
						<input type="text" name="answer(cause)" size="" maxlength="" id="cause" >
					</td>
				</tr>
				<tr>
					<td class="SearchResult">
						Insurance Company Name
					</td>
					<td class="SearchResult">
						<input type="text" name="answer(company)" size="" maxlength="" id="company" >
					</td>
				</tr>
				<tr>
					<td class="altdisply">
						Amt Paid/Reserved*
					</td>
					<td class="altdisply">
						<input type="text" name="answer(amount)" size="" maxlength="" id="amount" >
					</td>
				</tr>
				
			
				<tr align="left">
					<td >
					<a href="javascript:window.close();"><img style="margin-right:20px;" src="../Images/button_close_window.gif" alt="Close Window" border="0" /></a>
					</td>
					<td align="Right">
						<html:button value="Update" property="answer(button)" styleClass="sbttn" onclick="submitToParent()" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
					</td>
				</tr>
			</table>		
		</td>
	</tr>
</table>
			



<%
String claimNumber = ""+request.getParameter("answer(claimNumer)");
System.out.println(claimNumber);
String lossDate="LossDate"+claimNumber; 
String lossType="LossType"+claimNumber; 
String lossCause="LossCause"+claimNumber;
String lossCompany="LossCompany"+claimNumber;
String lossAmount="LossAmount"+claimNumber;

%>

<script type="text/javascript">
<!--


document.getElementById("date").value=window.opener.document.forms[0].<%=lossDate%>.value
document.getElementById("type").value=window.opener.document.forms[0].<%=lossType%>.value
document.getElementById("cause").value=window.opener.document.forms[0].<%=lossCause%>.value
document.getElementById("company").value=window.opener.document.forms[0].<%=lossCompany%>.value
document.getElementById("amount").value=window.opener.document.forms[0].<%=lossAmount%>.value

function submitToParent() {
if(validateClaimDetail()) {
	window.opener.document.forms[0].<%=lossDate%>.value=document.getElementById("date").value
	window.opener.document.forms[0].<%=lossType%>.value=document.getElementById("type").value
	window.opener.document.forms[0].<%=lossCause%>.value=document.getElementById("cause").value
	window.opener.document.forms[0].<%=lossCompany%>.value=document.getElementById("company").value
	window.opener.document.forms[0].<%=lossAmount%>.value=document.getElementById("amount").value
	window.close();
}
}

function CloseWindow(){
top.opener.location.reload(true);
window.close();
}

/**
  *For Claim Validation
  */
  
  function validateClaimDetail() {
  	
   	if(document.getElementById("date") != null) {
  		var lossDate=document.getElementById("date").value;
  		if(lossDate == "") {
			alert("Please enter the LossDate");
			return false;
		} else {
		
			if(!isDate(lossDate)) {
				alert("Please enter the LossDate in 'MM/DD/YYYY' format");
				return false;
			} else {
				
				var date_array = lossDate.split("/");
				
				 if(date_array[0]>12 || date_array[0]==0) {
					alert("Please enter the valid Month in LossDate");
					return false;
				}
				 if(date_array[1]>31 || date_array[1]==0) {
					alert("Please enter the valid Date in LossDate");
					return false;
				}
				if(!validateLHyear(date_array[2])) {
					alert("Please enter the valid Year in LossDate");
					return false;
				} 
			}
					
		
		}
  	}
  	
  	if(document.getElementById("cause")!= null) {
	  	if(document.getElementById("cause").value == "") {
				alert("Please enter the Loss Description");
				return false;
			}
  	}
  	
  	if(document.getElementById("amount") !=null) {
  	
  		if(document.getElementById("amount").value == "") {
			alert("Please enter the AmountPaid/Reserved");
			return false;
		} else {
		
			if(!isAmount(document.getElementById("amount").value)) {
				alert("Please enter the valid AmountPaid/Reserved ");
				return false;
			}
		}
  	}
  	
  	return true;
  
  }

//For Date Validation(MM/DD/YYYY)
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

//For Year Validation
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
	   				   if(temp!=3 && temp!=7)
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
	    	 if(c!=1 && c!=2 && c!=3 && c!=4 && c!=5 && c!=6 && c!=7 && c!=8 && c!=9 && c!=0 && c!="$" && c!=",")
	     			 {	     				
	     				  return false;
	    			 }    	 
	  			  
	     		   temp++;
	    }
	    return true;
	}
	return false;
}

//-->
</script>


