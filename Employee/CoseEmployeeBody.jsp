<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CoseEmployee</title>
<style type="text/css">
	p { color: #2E2E2E; font-family: arial; font-size:12px; padding: 1px 2px 1px 5px;  }
	.pagehead{ font-family: Garamond ,Helvatica, Arial, MS Sans Serif, Verdana; font-size: 30pt; font-weight:100; color: #E41B23;margin:-50 0 0 0px;}
	#main { float: left; width: 770px; font-family: Verdana, Arial, sans-serif; color: #000000;font-size: 10pt; background: #fff;  }
</style>
</head>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="screenWidth" property="answer(screenWidth)" name="LoginPage" scope="session" />
<bean:define id="screenHeight" property="answer(screenHeight)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<html:hidden styleId="userId" property="answer(Object::UserDetail::userName)" value='<%=""+userId%>' />
<body bgcolor="#ffffff" onLoad="window.document.CoseEmployee.focus();">
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript">

function getUserId(){

var userId  = document.getElementById("userId").value;
return userId;
}
function isBrowserSessionValid(){
var isBrowserSessionValid = "false";
	var url = "../checkIsValidSession.do";
	 new Ajax.Request(url, {method: 'post',asynchronous:true,
	 onComplete:function(transport){
	 	 alert("111")
		 isBrowserSessionValid = ""+transport.responseText;
		 returnSession(isBrowserSessionValid);
		 },
		 onException:function(){
		 alert("222")
		 isBrowserSessionValid = "false";
		 },
		 onSuccess: function(transport){
		 if(transport.responseText!=""){
		 alert("333")
		 isBrowserSessionValid = ""+transport.responseText;
		  returnSession(isBrowserSessionValid);
		 }else{
		 
		 }}});
		 
return isBrowserSessionValid;		 
}


function returnSession(isBrowserSessionValid1){
alert(isBrowserSessionValid1+" : returnSession")
return isBrowserSessionValid1;
}
function scrollUp() {
   window.scroll(0,0);  
}

function scrolltoPosition(x,y) {
   window.scroll(x,y);  
}
function showLegand(){
	document.getElementById("legandContainer").style.display="inline";
}

</script>
<%
String employeeId="";
if(request.getParameter("answer(Object::Employee::EmployeeId)")!=null){ %>
	<bean:parameter id="EmployeeId" name="answer(Object::Employee::EmployeeId)" />
<%
employeeId=""+EmployeeId;
}else if(request.getAttribute("answer(Object::Employee::EmployeeId)") != null){

	employeeId=""+request.getAttribute("answer(Object::Employee::EmployeeId)");

}%>
<%
String custid="";
if(request.getParameter("answer(Object::Customer::CustomerId)")!=null){ %>
	<bean:parameter id="custid1" name="answer(Object::Customer::CustomerId)" />	
<%
custid=""+custid1;
}else if(request.getAttribute("Object::Customer::CustomerId")!=null){
	custid=""+request.getAttribute("Object::Customer::CustomerId");
}
long customerId = Long.parseLong(custid);
long ownerID = Long.parseLong(""+ownerId);
%>
<%-- <p align="right">										
	<a href='../EmployeeApplListPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=EMPLOYEE&answer(applicationType)=EMPLOYEE&answer(applicationSubType)=<%=""%>&answer(state)=<%=""%>&answer(teritory)=<%=""%>&answer(CustomerBeanInvocation)=YES&answer(isPreview)=false&customerId=<%=custid.toString()%>&SearchObjectId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Employee::EmployeeId)=<%=""+employeeId%>' target="_new">
	<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Employee Application PDF</a>
</p>--%>
<table WIDTH="744" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<%--<tr><td>
  <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			<jsp:include page="../common/EmployerHeader.jsp"/>
		</td>
	</tr>
	<tr>
			<td valign="top" align="left">
				
					<jsp:include page="../common/EmployeeHeader.jsp">
						<jsp:param name="employeeId" value="<%=""+employeeId %>" />
						<jsp:param name="heading" value="<%="EMPLOYEE DETAILS "%>" />
					</jsp:include>
				
		    </td>
	</tr>
	
	<tr><td></td></tr>
</table>
</td></tr> --%>
<!-- <tr id="legandContainer" style="display:none">
			<td width="10%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="../Images/wrong.jpg" width="15" height="15"  border="0" alt="" /> Information is incomplete/missing, requires to enter further information
				<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="../Images/right.jpg" width="15" height="15"  border="0" alt="" /> All mandatory information is entered.
				<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    <b><i> Bold / Italics </i></b>data entry fields are mandatory; requires user to enter information
			</td>
</tr> -->

<%
String scrWidth = ""+screenWidth;
String scrHeight = ""+screenHeight;
String applWidth="";
String applHeight="";

if(scrWidth.equals("1024") && scrHeight.equals("768")){
	applWidth = "100%";
	applHeight= "90%";
}else if(scrWidth.equals("1280") && scrHeight.equals("768")){
	applWidth = "1150px";
	applHeight= "1250px";
}else if(scrWidth.equals("800") && scrHeight.equals("600")){
	applWidth = "99%";
	applHeight= "68%";
}

else if(scrWidth.equals("1152") && scrHeight.equals("864")){
	applWidth = "1100px";
	applHeight= "1200px";
}else if(scrWidth.equals("1280") && scrHeight.equals("600")){
	applWidth = "1150px";
	applHeight= "1250px";
}else if(scrWidth.equals("1280") && scrHeight.equals("720")){
	applWidth = "1160px";
	applHeight= "1250px";
}else if(scrWidth.equals("1280") && scrHeight.equals("800")){
	applWidth = "1160px";
	applHeight= "1250px";
}else if(scrWidth.equals("1280") && scrHeight.equals("960")){
	applWidth = "1160px";
	applHeight= "1250px";
}else if(scrWidth.equals("1280") && scrHeight.equals("1024")){
	applWidth = "1160px";
	applHeight= "1250px";
}else if(scrWidth.equals("1280")){
	applWidth = "1160px";
	applHeight= "1250px";
}else if(scrWidth.equals("800")){
	applWidth = "99%";
	applHeight= "68%";
}else{
	applWidth = "1150px";
	applHeight= "1250px";
}

%>

	<td align="left" width="744">
	   <dmshtml:get_no_of_eligible_employees_under_a_customer nameInSession="NoOfEmployees" customerId="<%=customerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
	   <logic:greaterEqual  name="NoOfEmployees" value="20">
		<table WIDTH="764" HEIGHT="1800" align="left" border="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td width="764" align="left">
					<!--url's used in the movie-->
					<!--text used in the movie-->
					<!-- saved from url=(0013)about:internet -->
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="764" height="1900" id="CoseEmployee" align="middle">
					<param name="allowScriptAccess" value="always" />
					<param name="movie" value="../Employee_20/CoseEmployee_20.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="#ffffff" />
					<embed src="../Employee_20/CoseEmployee_20.swf" quality="high" bgcolor="#ffffff" width="744" height="1900" name="CoseEmployee" align="left" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>
				</td>
			</tr>
		</table>
		</logic:greaterEqual>
		<logic:lessThan name="NoOfEmployees" value="20">
		<table WIDTH="744" HEIGHT="1900" align="left" border="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td width="764" align="left">
					<!--url's used in the movie-->
					<!--text used in the movie-->
					<!-- saved from url=(0013)about:internet -->
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="764" height="1900" id="CoseEmployee" align="middle">
					<param name="allowScriptAccess" value="always" />
					<param name="allowScriptAccess" value="always" />
					<param name="movie" value="../Employee/CoseEmployee.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="#ffffff" />
					<embed src="../Employee/CoseEmployee.swf" quality="high" bgcolor="#ffffff" width="744" height="1900" name="CoseEmployee" align="left" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>
				</td>
			</tr>
		</table>	
		</logic:lessThan>
	</td>
</tr>
</table>
</body>
</html>
<script language="javascript">
window.document.CoseEmployee.focus();
</script>