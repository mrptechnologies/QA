<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CoseEmployer</title>
</head>
 <body bgcolor="#ffffff">
<script type="text/javascript">
function scrollUp() {
   window.scroll(0,0);  
}
function scrolltoPosition(x,y) {
   window.scroll(x,y);  
}
function showLegand(){
	document.getElementById("legandContainer").style.display="inline";
}
function getLoginRole(){
	var role = document.getElementById("role").value;
	//alert(role);
	return role;
}
</script>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="screenWidth" property="answer(screenWidth)" name="LoginPage" scope="session" />
<bean:define id="screenHeight" property="answer(screenHeight)" name="LoginPage" scope="session" />
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
<html:hidden styleId="role" property="answer(Object::UserDetail::roleName)" value="<%=""+roleName%>"  />

<%
String custEmail="";
if(request.getParameter("answer(Object::Customer::EMailAddress)")!=null){
%>
<bean:parameter id="custEmail1" name="answer(Object::Customer::EMailAddress)" />
<% 
custEmail = ""+custEmail1;
} %>
<table WIDTH="744" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

<%-- <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			<jsp:include page="../common/EmployerHeader.jsp"/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>	
		<td class="links">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="../QuickAllEmployeeCencus.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&customerId=<%=""+request.getParameter("answer(Object::Customer::CustomerId)")%>&SearchObjectId=<%=""+request.getParameter("answer(Object::Customer::CustomerId)")%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+request.getParameter("answer(Object::Customer::CustomerId)")%>&answer(Object::Agency::AgencyId)=<%=""+request.getParameter("answer(Object::Agency::AgencyId)")%>&answer(Object::Employee::PageNum)=0"
							title="Click to go to Show All Employees/Add Employee" />Census</a>	
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href='../EmployerApplListPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=EMPLOYER_GROUP&answer(applicationType)=EMPLOYER&answer(applicationSubType)=<%=""%>&answer(state)=<%=""%>&answer(teritory)=<%=""%>&answer(CustomerBeanInvocation)=YES&answer(isPreview)=false&customerId=<%=""+request.getParameter("answer(Object::Customer::CustomerId)")%>&SearchObjectId=<%=""+request.getParameter("answer(Object::Customer::CustomerId)")%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+request.getParameter("answer(Object::Customer::CustomerId)")%>&answer(Object::Agency::AgencyId)=<%=""+request.getParameter("answer(Object::Agency::AgencyId)")%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::EMailAddress)=<%=""+custEmail %>' target="_new">
			<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Employer Application PDF</a>
							
		
		</td>
	</tr>
	<tr><td></td></tr>	
</table>--%>

<!-- <tr id="legandContainer" style="display:none">
<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="../Images/wrong.jpg" width="15" height="15"  border="0" alt="" /> Information is incomplete/missing, requires to enter further information
	<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="../Images/right.jpg" width="15" height="15"  border="0" alt="" /> All mandatory information is entered.
	<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    <b><i> Bold / Italics </i></b>data entry fields are mandatory; requires user to enter information
</td>
</tr> -->
<%--<bean:parameter id="sHeight" name="answer(applHeight)" />
<bean:parameter id="sWidth" name="answer(applWidth)" />--%>
<%
String scrWidth = ""+screenWidth;
String scrHeight= ""+screenHeight;
String applWidth="";
String applHeight="";
if(scrWidth.equals("1024") && scrHeight.equals("768")){
	applWidth = "100%";
	applHeight= "88%";
}else if(scrWidth.equals("1280")&& scrHeight.equals("768")){
	applWidth = "1160px";
	applHeight= "930px";
}else if(scrWidth.equals("800") && scrHeight.equals("600")){
	applWidth = "99%";
	applHeight= "68%";
}

else if(scrWidth.equals("1152") && scrHeight.equals("864")){
	applWidth = "99%";
	applHeight= "88%";
}else if(scrWidth.equals("1280") && scrHeight.equals("600")){
	applWidth = "1160px";
	applHeight= "930px";
}else if(scrWidth.equals("1280") && scrHeight.equals("720")){
	applWidth = "1160px";
	applHeight= "930px";
}else if(scrWidth.equals("1280") && scrHeight.equals("800")){
	applWidth = "1160px";
	applHeight= "930px";
}else if(scrWidth.equals("1280") && scrHeight.equals("960")){
	applWidth = "1160px";
	applHeight= "930px";
}else if(scrWidth.equals("1280") && scrHeight.equals("1024")){
	applWidth = "1160px";
	applHeight= "930px";
}else if(scrWidth.equals("1280")){
	applWidth = "1160px";
	applHeight= "930px";
}else if(scrWidth.equals("800")){
	applWidth = "99%";
	applHeight= "68%";
}else{
	applWidth = "1160px";
	applHeight= "930px";
}


%>
	<tr>

		<td align="center" width="744">
		<table WIDTH="744" HEIGHT="1950" align="left" border="0"
			CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td width="744" align="center"><!--url's used in the movie--> <!--text used in the movie-->
				<!-- saved from url=(0013)about:internet --> <object
					classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="764"
					height="2000" id="CoseEmployer" align="middle">
					<param name="allowScriptAccess" value="always" />
					<param name="movie" value="../Employer/CoseEmployer.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="#ffffff" />
					<embed src="../Employer/CoseEmployer.swf" textfocus=""
						quality="high" bgcolor="#ffffff" width="764" height="2000"
						name="CoseEmployer" align="middle" allowScriptAccess="sameDomain"
						type="application/x-shockwave-flash"
						pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
<script language="javascript">
window.document.CoseEmployer.focus();
</script>