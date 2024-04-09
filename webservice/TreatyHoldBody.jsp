<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>
<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css">
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CreateEndorsementQuote.js"></SCRIPT>


<html:form action="/SetTreatyHold.do" onsubmit="return TreatyDatevalidationScript()" >
<%SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
String date=formatter.format(new Date());%>
<bean:define id="defaultDate" property="answer(Object::TreatyHold::defaultDate)" value="<%=date%>"/>

<bean:define name="TreatyHold" id="activeTransactionType" property="answer(Object::TreatyHold::TransactionType)"/>
<bean:define name="TreatyHold" id="activeHoldStatus" property="answer(Object::TreatyHold::HoldStatus)"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<div><font color="blue">Last Activity :  Treaty Hold is <%=""+activeHoldStatus%> for <%=""+activeTransactionType%> transaction.</font></div>

<div class="formpage01">
<div class="content">
<div class="formheadnew"><h2 class="left">Invoke Treaty Hold</h2></div>
<div>&nbsp;</div>
</div>
<div  style="margin-left:339px">Treaty Hold:
<html:select property="answer(Object::TreatyHold::HoldStatus)" styleClass="txtbox" style="width:60px" styleId="TreatyHold" onchange="TreatyButtonScript();TreatyDateScript();">
			<html:option value ="On">On</html:option>
			<html:option value ="Off">Off</html:option>			
</html:select>
</div>
<div id="TreatyStart">
<table style="margin-left:280px">
<tr>			
<td width="40%"  align="left" height="25" >Treaty Hold Start Date:</td>
<td  align="left">
<div id="policyEffectiveDate1">
</div>
     <jsp:include page="../common/ExtDateField.jsp">
          <jsp:param name="inputDateField" value="StartDate1"/>
           <jsp:param name="panelDiv" value="policyEffectiveDate1" />
           <jsp:param name="minimumDate" value="" />
           <jsp:param name="maximumDate" value="" />
           <jsp:param name="allowBlank" value="false"/>           
       	   <jsp:param name="setDefaultToday" value="true"/>
       	   <jsp:param name="TodayDate" value="<%=defaultDate%>"/>
      </jsp:include>
 
   <html:hidden property="answer(Object::TreatyHold::startDate)" styleId="TreatyDate1" />
   <html:hidden property="answer(Object::UserDetail::userName)" value= '<%=""+userId%>'/>
   
 </td>					
</tr>
</table>
</div>
<div id="TreatyEnd">
<table style="margin-left:283px">
<tr>			
<td width="40%"  align="left" height="25">Treaty Hold End Date:</td>
<td  align="left">
<div id="policyEffectiveDate2" ></div>
     <jsp:include page="../common/ExtDateField.jsp" >
          <jsp:param name="inputDateField" value="StartDate2" />
           <jsp:param name="panelDiv" value="policyEffectiveDate2" />
           <jsp:param name="minimumDate" value="" />
           <jsp:param name="maximumDate" value="" />
           <jsp:param name="allowBlank" value="false"/>           
       	   <jsp:param name="setDefaultToday" value="true"/>
       	   <jsp:param name="TodayDate" value="<%=defaultDate%>"/>
      </jsp:include>
 <html:hidden property="answer(Object::TreatyHold::EndDate)" styleId="TreatyDate2" />
 </td>						
</tr>
</table>
</div>
<div class="field" style="width:520px">Transaction Type :
<html:select  property="answer(Object::TreatyHold::TransactionType)" styleClass="txtbox" style="width:110px">
		<html:option value="All">All</html:option>
		<html:option value="QuoteUpdate">QuoteUpdate</html:option>
		<html:option value="TakeUp">TakeUp</html:option>
		<html:option value="PolicyCancel">PolicyCancel</html:option>
		<html:option value="PolicyReinstate">PolicyReinstate</html:option>
		<html:option value="Policy Update">PolicyUpdate</html:option>
		<html:option value="Endorsement">Endorsement</html:option>
		<html:option value="Renewal">PolicyRenewal</html:option>
		
</html:select>
</div>

<div>&nbsp;</div>

<div class="formcontent" style="width:50%;" align="center" id="TreatyOn"><center>
<input type="submit" value="Treaty Hold On" class="covbutton" style="width:140px;">	</center>
</div>
<div class="formcontent" style="width:50%;" align="center" id="TreatyOff"><center>
<input type="submit" value="Treaty Hold Off" class="covbutton" style="width:140px;">	</center>
</div>
<table>
		<tr>
		<td>&nbsp;</td>
		<td colspan=5></td>
		<tr>
		<td>&nbsp;</td>
		<td align="left">

</td>
</tr>
</table>



</div>


<script type="text/javascript">
function TreatyButtonScript()
{
	if(document.getElementById('TreatyHold').value== "Off")
	{
		document.getElementById('TreatyOff').style.display = 'block';
		document.getElementById('TreatyOn').style.display = 'none';
	}
	else
	{
		document.getElementById('TreatyOff').style.display = 'none';
		document.getElementById('TreatyOn').style.display = 'block';
	}
}

function loadscriptdef()
	{
		document.getElementById('TreatyOff').style.display = 'none';
		document.getElementById('TreatyEnd').style.display = 'none';
		var currentTime = new Date((new Date()).setHours(0, 0, 0, 0))
		var start = new Date()
		var month = currentTime.getMonth() + 1
		var day = currentTime.getDate()
		var year = currentTime.getFullYear()	
		var today = month + "/" + day + "/" + year;
		document.forms[0].TreatyDate1.value = today;
		document.forms[0].TreatyDate2.value = today;
					
	}


function TreatyDateScript()
{
	if(document.getElementById('TreatyHold').value== "Off")
	{
		document.getElementById('TreatyEnd').style.display = 'block';
		document.getElementById('TreatyStart').style.display = 'none';
	}
	else
	{
		document.getElementById('TreatyEnd').style.display = 'none';
		document.getElementById('TreatyStart').style.display = 'block';
	}
}


function TreatyDatevalidationScript()
{
	var currentTime = new Date((new Date()).setHours(0, 0, 0, 0))
	var start = new Date()
	var month = currentTime.getMonth() + 1
	var day = currentTime.getDate()
	var year = currentTime.getFullYear()	
	var today = month + "/" + day + "/" + year;
	start = document.getElementById("StartDate1").value;
	end = document.getElementById("StartDate2").value;
	var confirmValue = false;
	
	if(document.getElementById('TreatyHold').value== "On")
	{
	if(currentTime > new Date(start))
	{
		alert("Please select Current or Future Date");
		return false;
	}
	else
	{	
	if(document.getElementById('TreatyHold').value== "On")
		{
	 		 confirmValue = confirm("Confirm Treaty Hold On?");
			 return confirmValue;
		}
	else
		{
	 		confirmValue = confirm("Confirm Treaty Hold Off?");
			return confirmValue;
		}
	}
	}
	
	else
	{
	
	if(currentTime > new Date(end))
	{
		alert("Please select Current or Future Date");
		return false;
	}
	else
	{	
	if(document.getElementById('TreatyHold').value== "On")
		{
	 		confirmValue = confirm("Confirm Treaty Hold On?");
			return confirmValue;
		}
	else
		{
	 		confirmValue = confirm("Confirm Treaty Hold Off?");
			return confirmValue;
		}
	}
	
	}
	
	
}

function callOnLoadFunctions(){
	loadscriptdef();
	TreatyButtonScript();
	TreatyDateScript();
}

window.onload=callOnLoadFunctions;

</script>

<script type="text/javascript">
Ext.onReady(function(){ 

var blurHandlerStartDate = function() {
	if(document.getElementById('StartDate1')!=null && document.getElementById('StartDate1')!=undefined){
		var strDate = document.getElementById('StartDate1').value;
		document.forms[0].TreatyDate1.value = strDate;		
		}
		
}

var blurHandlerEndDate = function() {
	if(document.getElementById('StartDate2')!=null && document.getElementById('StartDate2')!=undefined){
		var strDate = document.getElementById('StartDate2').value;
		document.forms[0].TreatyDate2.value = strDate;
		}
		
}



Ext.EventManager.on('StartDate1', 'blur', blurHandlerStartDate); 
Ext.EventManager.on('StartDate2', 'blur', blurHandlerEndDate); 

});



</script>
</html:form>
