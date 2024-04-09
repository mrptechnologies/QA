<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template'%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%@ page import="java.net.*" %>
<logic:notPresent name="userObjDesc" scope="session">
		<jsp:forward page="./Default.jsp" />
</logic:notPresent>

<logic:present name="userLog" scope="session">
	<%
		((com.dms.web.userlog.UserLog) session.getAttribute("userLog")).setLastAccessedTime(session.getLastAccessedTime());
	%>
</logic:present>

<%
	String cacheControl = null;
 	String previousPageCacheControl = "";
	/** if call from AJAX requestion ignore the template ***/
	boolean bNoTemplate = false;
	String	ajaxRequest =(String)request.getParameter("AJAX_REQUEST");

	System.out.println("AJAX_REQUEST::"+ajaxRequest);
	System.out.println("getQueryString() ::"+(String)request.getQueryString() );

	if ( ajaxRequest!=null && ajaxRequest.length()>=0 && ajaxRequest.equals("YES") ) {
		bNoTemplate = true;
	}
	if(request.getHeader("Cache-Control") != null) {
		cacheControl = request.getHeader("Cache-Control");
	}
	if(session.getAttribute("previousPage::Cache-Control") != null) {
		previousPageCacheControl = "" + session.getAttribute("previousPage::Cache-Control");
	}
	session.setAttribute("previousPage::Cache-Control", cacheControl);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html locale="true">
<script type="text/javascript" src="../Scripts/detectbackButton-min.js"></script>
<script type="text/javascript">
		 <!--
			 var submitcount = 0;
			 function checksubmitcount()
			 {
			 	submitcount++;
			 	if (1 == submitcount )
			 	{
			 		document.forms[0].submit();
			 	}else
				 {
					return false;
				 }
			 }
			function newchecksubmitcount()
			 {
				submitcount++;
			 	if (1 == submitcount )
			 	{
			 		return true;
			 	}else
				 {
					return false;
				 }
			 }
			 //

			 var form_submitted = false;
			 function submit_form ( )
			 {
			   if ( form_submitted )
			   {
			     return false;
			   }
			   else
			   {
			     form_submitted = true;
			     return true;
			   }
			 }
			 
			 var timeOut=0;
			 var popupTimeOut=0;
			 var timeOutValue=<%=session.getMaxInactiveInterval()%>;
			 timeOutValue=timeOutValue*1000;
			 <%/*timeOutValue holds the value of the maximum time(in milliseconds) the server can stay idle before it Logs off.*/%>
			 function autologout() {
			  <%/*To reset the session timer.*/%>
			  //clearInterval (timeOut);
			  //clearInterval (popupTimeOut);
			  <%/*Alert the user about the timeout one minute earlier.*/%>
			  //popupTimeOut = setTimeout("notify()",timeOutValue-70000);
			  <%/*Logging off at timeout.*/%>
			  //timeOut = setTimeout("logout()",timeOutValue-10000);
			 }
			 function logout(){
				document.location="/LoginOutAction.do";
			 }
			 function notify(){
			  var popWin;
			  var url="../common/AutoLogOutNotification.jsp"
              popWin = window.open(url,'AutoLogOutNotification','width=610, height=290, left=550, top=125, menubar=no, location=no, resizable=no, toolbar=no, status=no');
			  popWin.focus();			 
			 }
			 autologout();

			 bajb_backdetect.OnBack = function()
			 {
				alert('Back Button is not allowed from this page');		
			 }

function resetTimerRequest(){

    var url="/ResetTimer.do" 
    var panel="EmptyDivForResetTimer";
   
   try {     
     new Ajax.Updater(panel,url,{synchronous:true,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);}});
    }catch(err) {
     txt="There was an error on this page.\n\n";
     txt+="Error description: " + err.description + "\n\n";
     txt+="Click OK to continue.\n\n";
    } 
 
  
   return false; 
 
 }

		/*
		 * forwardToLoginPageIfInvalidSession is used to forward to Login Page, during following four places, if session is expired
		 * Ajax.Request, Ajax.Updater, XMLHttpRequest(createXMLHttpRequest methods) and while using Datatable(via Ajax calls)
		 * Created by Rajeshkumar P on 08-November-2011 for Bug# 16558
		 */
		function forwardToLoginPageIfInvalidSession(ajaxResponseText) {

			var returnValue = 0;
			var searchText = "<";
			searchText = searchText + "!-- forwardToLoginPageIfInvalidSession --";
			//starsWith is a function written in Common.js
			if(ajaxResponseText.startsWith(searchText)) {
				document.location = "<%= "https://"+ request.getServerName() %>";
				returnValue = 1;				
			} else if(ajaxResponseText.indexOf(searchText) > 0) {
				document.location = "<%= "https://"+ request.getServerName() %>";
				returnValue = 1;	
			}
			return returnValue;
		}
		
			
		 -->
		 </script>
	<bean:define id="pageTitle" property="answer(Page::Title)" name="LoginPage" scope="session" type="java.lang.String"/>

	<head>
		<title><%=""+pageTitle%></title>

		<link rel="stylesheet" type="text/css" href="../styles/ui3.0/style.css" />
		<link rel="stylesheet" type="text/css" href="../styles/ui3.0/menu.css" />
		<link rel="stylesheet" type="text/css" href="../styles/ui3.0/CoolMenu4Style.css" />
		
		<script type="text/javascript" src="../Scripts/ui3.0/menu.js"></script>
		<link rel="stylesheet" href="../styles/Styles.css" type="text/css">


	<html:base />
	</head>

	<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
	<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
	<%String insType = (String)session.getAttribute("InsType"); %>

	<div class="generalpagecenter">
	<body onload="anylinkcssmenu.init('anchorclass')">
	<html:hidden property="answer(Cache-Control)" styleId="cacheControl" value='<%="" + cacheControl %>'/>
	<html:hidden property="answer(PreviousPage::Cache-Control)" styleId="previousPageCacheControl" value='<%="" + previousPageCacheControl %>'/>
	
	<!-- Implementation for customisation of  company based logo, title and owner id stats -->
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<bean:define id="PageLogo" property="answer(PageLogo)" name="LoginPage" scope="session" type="java.lang.String"/>
	<bean:define id="FormLogo" property="answer(FormLogo)" name="LoginPage" scope="session" type="java.lang.String"/>
	<bean:define id="ClientLogo" property="answer(ClientLogo)" name="LoginPage" scope="session" type="java.lang.String"/>
	<%
		String DomainName="";
		String PageTitle="";

		DomainName=(String)session.getAttribute("DomainName");
		PageTitle=(String)session.getAttribute("PageTitle");

		if(DomainName==null || DomainName.length()==0){
			DomainName=(""+request.getServerName());
			session.setAttribute("DomainName",DomainName);
		}

		if(PageTitle==null || (PageTitle.length()==0) || PageLogo==null || (PageLogo.length()==0)){

			if(((DomainName.indexOf("benicorp")>=0) || (DomainName.indexOf("mica")>=0) || (DomainName.indexOf("demo.solartis")>=0)) && (Integer.parseInt(""+ownerId)==2)){

				if(DomainName.indexOf("benicorp")>=0){

					//Setting page title in session for Benicorp
					if(PageTitle==null || PageTitle.length()==0){
						PageTitle=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"BenicorpInsuranceCompany.Name",null));
						session.setAttribute("PageTitle",PageTitle);
					}

					//Setting page logo in session for Benicorp
					if(PageLogo==null || PageLogo.length()==0){
						PageLogo=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"BenicorpInsuranceCompany.Logo-Small",null));
						session.setAttribute("PageLogo",PageLogo);
					}
				}

				if(DomainName.indexOf("mica")>=0){

					//Setting page title in session for Mica
					if(PageTitle==null || PageTitle.length()==0){
						PageTitle=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"MicaInsuranceCompany.Name",null));
						session.setAttribute("PageTitle",PageTitle);
					}

					//Setting page logo in session for Mica
					if(PageLogo==null || PageLogo.length()==0){	PageLogo=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"MicaInsuranceCompany.Logo-Small",null));
						session.setAttribute("PageLogo",PageLogo);
					}
				}

				if(DomainName.indexOf("demo.solartis")>=0){

					//Setting page title in session for Mica
					if(PageTitle==null || PageTitle.length()==0){
						PageTitle=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"SolartisInsuranceCompany.Name",null));
						session.setAttribute("PageTitle",PageTitle);
					}

					//Setting page logo in session for Mica
					if(PageLogo==null || PageLogo.length()==0){	PageLogo=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"SolartisInsuranceCompany.Logo-Small",null));
						session.setAttribute("PageLogo",PageLogo);
					}
				}
			}
			else{
				//Setting page title in session for default
				if(PageTitle==null || PageTitle.length()==0){	PageTitle=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DefaultInsuranceCompany.Name",null));
					session.setAttribute("PageTitle",PageTitle);
				}
				if(FormLogo == null|| FormLogo.length()==0){
					
					
				}
				//Setting page logo in session for default
				if(PageLogo==null || PageLogo.length()==0){	PageLogo=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DefaultInsuranceCompany.Logo-Small",null));
					session.setAttribute("PageLogo",PageLogo);
				}
			}
		}
	%>

<%	/* Header begins here */ %>



<div class="container">
	<div class="head">
			<%	/* Put customer specific logo and text here */ %>
			<%if((""+ownerId).equals("5")){ /* All Risks */ %>
				<div class="clientlogo left">Liberty International Underwriters</div>
				<h1 class="formlogo left">Storage Tank Policy Quote System</h1>
			<%}else if((""+ownerId).equals("6")){ /* All Risks */ %>
				<div class="clientlogo left">Liberty International Underwriters</div>
				<h1 class="formlogo left">Storage Tank Policy Quote System</h1>
			<%}else if((""+ownerId).equals("9")){ %>
				<div class="clientlogo left">Liberty International Underwriters</div>
				<h1 class="formlogo left">Storage Tank Policy Quote System</h1>
			<%}else if((""+ownerId).equals("12")){ /* LIU */ %>
				<div class="clientlogo left">Liberty International Underwriters</div>
				<h1 class="formlogo left">Storage Tank Policy Quote System</h1>
			<%}else if((""+ownerId).equals("14")){ 
					
				if(FormLogo == null|| FormLogo.length()!=0){%>
				<div class='<%=""+ClientLogo %>'></div>
				<h1 class='<%=""+FormLogo%>'></h1>
				<%}else{ %>
					<div class="clientlogoCVStar left">CV Star</div>
					<h1 class="formlogoCVStar left">CV Star</h1>
				<%} }
			else{ /* Solartis */ 
					
			%>
				<div class="clientlogo left">Liberty International Underwriters</div>
				<h1 class="formlogo left">Storage Tank Policy Quote System</h1>
			<%} %>

	<logic:present name="LoginPage" scope="session">
		<bean:define id="ObjectId"
			property="answer(Object::UserDetail::PrimaryObjectId)"
			name="LoginPage" scope="session" />
		<bean:define id="ObjectType"
			property="answer(Object::UserDetail::PrimaryObjectType)"
			name="LoginPage" scope="session" />

		<bean:define id="userId"
			property="answer(Object::UserDetail::userName)" name="LoginPage"
			scope="session" />

		<bean:define id="fname"
			property="answer(Object::UserDetail::UserFirstName)"
			name="LoginPage" scope="session" />
		<bean:define id="lname"
			property="answer(Object::UserDetail::UserLastName)" name="LoginPage"
			scope="session" />

		<div class="signin right">
			<b>Signed in as:</b>
			<%
			if (fname == null && lname == null || fname.equals("") && lname.equals("")) {
			%>

			<bean:write property="answer(Object::UserDetail::userName)"
				name="LoginPage" />
			<%
			} else {
			%>
			<bean:write property="answer(Object::UserDetail::UserFirstName)"
				name="LoginPage" /><%=" "%><bean:write property="answer(Object::UserDetail::UserLastName)"
				name="LoginPage" />
			<%
			}
			%>
						
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UNDERWRITER_AGENT_LOGIN"}%>' connector='or' negated="true"> 
			<a href="../ChangePassword.do?entityId=<%=strPrimObjId%>&objectType=<%=strPrimObjType%>">My Account</a>
			<a href="../LoginOutAction.do">Logout</a>
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYSADMIN_ADMIN_LOGIN"}%>' connector='or' negated="true"> 
			<a href="../ChangePassword.do?entityId=<%=strPrimObjId%>&objectType=<%=strPrimObjType%>">My Account</a>
			<a href="../LoginOutAction.do">Logout</a>
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_LOGIN"}%>' connector='or' negated="true"> 
			<%if(strPrimObjType.equals("ENTITY")){%>
			<a href="../ChangePassword.do?entityId=<%=strPrimObjId%>&objectType=<%=strPrimObjType%>">My Account</a>
			<%}else{%>
			<a href="../AgencyMyAccountV2.do?entityId=<%=strPrimObjId%>&objectType=<%=strPrimObjType%>">My Account</a>
			<%}%>
			<a href="../LoginOutAction.do">Logout</a>
			</dmshtml:dms_static_with_connector>			
			
		</div>
	</logic:present>
</div>
<%	/* Header ENDS here */  %>

<%	/* Adding Tabs & Menus */ %>
<div class="nav">
</div>


<%	/* Adding template definition for 3 Headers; these header jsp should be added at each .jsp page */ %>
<template:get name='Header1' />
<template:get name='Header2' />
<template:get name='Header3' />

<%	/* Adding template definition for a progress bar; progress bar jsp should be added at each .jsp page */ %>
<div class="content">
	<template:get name='ProgressBar' />
</div>

<%	/* Adding template definition for a body content; appropriate body should be added at each .jsp page */ %>


<div class="container">
 <div class="formpagenew">
 
 		<div class=" yui-skin-sam">
  				<template:get name='GeneralBody'/>
 	 	</div>
 	 	<div id="success" style="display: none;"></div>
 
 </div>
</div>
<br class="clear" />


<%	/* Adding the footer */ %>
		 <script language="JavaScript1.2" src="../Scripts/ui3.0/coolmenus4.js"></script>
		 <script language="JavaScript1.2" src="../common/BuildMenu1.0.jsp"></script>


</div>
<div style="display:none" id="EmptyDivForResetTimer"></div>
</body>
</div>
<jsp:include page="../common/footer.jsp" />

</html:html>
<script type="text/javascript">
if(document.getElementById("cacheControl") != null && document.getElementById("cacheControl") != undefined) {
	if(document.getElementById("previousPageCacheControl") != null && document.getElementById("previousPageCacheControl") != undefined) {
		if(document.getElementById("cacheControl").value == "no-cache" || document.getElementById("previousPageCacheControl").value == "no-cache") {
			bajb_backdetect.Initialise();
		}
	}
}
</script>
