<!--
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
-->

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template'%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
	<%
    response.setHeader("Pragma", "public");
    response.setHeader("Cache-Control", "max-age=0");
	%>
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
	/** if call from AJAX requestion ignore the template ***/
	boolean bNoTemplate = false;
	String	ajaxRequest =(String)request.getParameter("AJAX_REQUEST");   
	
		System.out.println("AJAX_REQUEST::"+ajaxRequest);
		System.out.println("getQueryString() ::"+(String)request.getQueryString() );
		System.out.println("getParameter(AJAX_REQUEST)::"+(String)request.getParameter("AJAX_REQUEST"));

	if ( ajaxRequest!=null && ajaxRequest.length()>=0 && ajaxRequest.equals("YES") ) {
		System.out.println("AJAX Request FOUND:::::requestParameter");
		bNoTemplate = true;
	}
	else
		System.out.println("AJAX Request NOT found");
		if ( !bNoTemplate ) {System.out.println("IF");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html locale="true">
<bean:define id="pageTitle" property="answer(Page::Title)" name="LoginPage" scope="session" type="java.lang.String"/>
<head>
		<title><%=""+pageTitle%></title>
		<link rel="stylesheet" href="../styles/style.css" type="text/css">
<!-- Ajax declarations -->

<script type="text/javascript">

	function loadPageScript(scriptFilename)
	 {
	  try {
	  alert("loading script="+scriptFilename);

	   Load (scriptFilename);
	  }catch(err) {
	   txt="There was an error on this page.\n\n";
	    txt+="Error description: " + err.description + "\n\n";
	    txt+="Click OK to continue.\n\n";
	    alert(txt);
	  }
	 }

	 function refreshAjaxTabPost(panel, url, form, jsFilename)
	 {
	  loadPageScript(jsFilename);
	  retVal = refreshTabPost(panel, url, form);
	  return retVal;
	 }

	 function refreshAjaxTabGet(panel, url, jsFilename)
	 {
	  loadPageScript(jsFilename);
	  retVal = refreshTabGet(panel, url);

	  return retVal;
	 }

	

	function refreshTabPost(panel, url, form)
	{
		setFocusTowTabView(panel);
		try {
			new Ajax.Updater(
				panel,
				url,
				{asynchronous:true, parameters:$(form).serialize(this)}
				);
		}catch(err) {
		 txt="There was an error on this page.\n\n";
		  txt+="Error description: " + err.description + "\n\n";
		  txt+="Click OK to continue.\n\n";
		  alert(txt);
		}
		return false;
	}

	function refreshTabGet(panel, url)
	{
		setFocusTowTabView(panel);
		try {
			new Ajax.Updater(
				panel,
				url,
				{
					method: "get",
					onComplete: function(){
						//Do something
					}
				}
			);
		}catch(err) {
		 txt="There was an error on this page.\n\n";
		  txt+="Error description: " + err.description + "\n\n";
		  txt+="Click OK to continue.\n\n";
		  alert(txt);
		}
	}
	
	function loadHomePage(panel, url, filename, filetype) {
		// load the js/css files
		// loadjscssfile(filename,filetype);
		
		new Ajax.Updater(
			panel,
				url,
				{
				method: "get",
				onComplete: function(){
					//Do something
				}
				}
		);
	}
	
	function loadjscssfile(filename, filetype){
		if (filetype=="js"){ //if filename is a external JavaScript file
  			var fileref=document.createElement('script');
  			fileref.setAttribute("type","text/javascript");
  			fileref.setAttribute("src", filename);
 		}
 		else if (filetype=="css"){ //if filename is an external CSS file
  			var fileref=document.createElement("link");
  			fileref.setAttribute("rel", "stylesheet");
  			fileref.setAttribute("type", "text/css");
  			fileref.setAttribute("href", filename);
 		}
 		if (typeof fileref!="undefined"){
  			document.getElementsByTagName("head")[0].appendChild(fileref);
  		}	
	}

</script>

<!-- end of AJAX declarations -->




		<html:base />

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
			  clearInterval (timeOut);
			  clearInterval (popupTimeOut);
			  <%/*Alert the user about the timeout one minute earlier.*/%>
			  popupTimeOut = setTimeout("notify()",timeOutValue-70000);
			  <%/*Logging off at timeout.*/%>
			  timeOut = setTimeout("logout()",timeOutValue);
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

function resetTimerRequest(){

    var url="/ResetTimer.do" 
    var panel="EmptyDivForResetTimer";
   
   try {     
     new Ajax.Updater(panel,url,{synchronous:true});
    }catch(err) {
     txt="There was an error on this page.\n\n";
     txt+="Error description: " + err.description + "\n\n";
     txt+="Click OK to continue.\n\n";
    } 
 
  
   return false; 
 
 }

		 -->
</script>

<script language="JavaScript" type="text/javascript">
<!--
//v1.7
// Flash Player Version Detection
// Detect Client Browser type
// Copyright 2005-2008 Adobe Systems Incorporated.  All rights reserved.
var isIE  = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
var isWin = (navigator.appVersion.toLowerCase().indexOf("win") != -1) ? true : false;
var isOpera = (navigator.userAgent.indexOf("Opera") != -1) ? true : false;
function ControlVersion()
{
	var version;
	var axo;
	var e;
	// NOTE : new ActiveXObject(strFoo) throws an exception if strFoo isn't in the registry
	try {
		// version will be set for 7.X or greater players
		axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
		version = axo.GetVariable("$version");
	} catch (e) {
	}
	if (!version)
	{
		try {
			// version will be set for 6.X players only
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");

			// installed player is some revision of 6.0
			// GetVariable("$version") crashes for versions 6.0.22 through 6.0.29,
			// so we have to be careful.

			// default to the first public version
			version = "WIN 6,0,21,0";
			// throws if AllowScripAccess does not exist (introduced in 6.0r47)
			axo.AllowScriptAccess = "always";
			// safe to call for 6.0r47 or greater
			version = axo.GetVariable("$version");
		} catch (e) {
		}
	}
	if (!version)
	{
		try {
			// version will be set for 4.X or 5.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
			version = axo.GetVariable("$version");
		} catch (e) {
		}
	}
	if (!version)
	{
		try {
			// version will be set for 3.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
			version = "WIN 3,0,18,0";
		} catch (e) {
		}
	}
	if (!version)
	{
		try {
			// version will be set for 2.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
			version = "WIN 2,0,0,11";
		} catch (e) {
			version = -1;
		}
	}

	return version;
}
// JavaScript helper required to detect Flash Player PlugIn version information
function GetSwfVer(){
	// NS/Opera version >= 3 check for Flash plugin in plugin array
	var flashVer = -1;

	if (navigator.plugins != null && navigator.plugins.length > 0) {
		if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]) {
			var swVer2 = navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "";
			var flashDescription = navigator.plugins["Shockwave Flash" + swVer2].description;
			var descArray = flashDescription.split(" ");
			var tempArrayMajor = descArray[2].split(".");
			var versionMajor = tempArrayMajor[0];
			var versionMinor = tempArrayMajor[1];
			var versionRevision = descArray[3];
			if (versionRevision == "") {
				versionRevision = descArray[4];
			}
			if (versionRevision[0] == "d") {
				versionRevision = versionRevision.substring(1);
			} else if (versionRevision[0] == "r") {
				versionRevision = versionRevision.substring(1);
				if (versionRevision.indexOf("d") > 0) {
					versionRevision = versionRevision.substring(0, versionRevision.indexOf("d"));
				}
			}
			var flashVer = versionMajor + "." + versionMinor + "." + versionRevision;
		}
	}
	// MSN/WebTV 2.6 supports Flash 4
	else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.6") != -1) flashVer = 4;
	// WebTV 2.5 supports Flash 3
	else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.5") != -1) flashVer = 3;
	// older WebTV supports Flash 2
	else if (navigator.userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 2;
	else if ( isIE && isWin && !isOpera ) {
		flashVer = ControlVersion();
	}
	return flashVer;
}
// When called with reqMajorVer, reqMinorVer, reqRevision returns true if that version or greater is available
function DetectFlashVer(reqMajorVer, reqMinorVer, reqRevision)
{
	versionStr = GetSwfVer();
	if (versionStr == -1 ) {
		return false;
	} else if (versionStr != 0) {
		if(isIE && isWin && !isOpera) {
			// Given "WIN 2,0,0,11"
			tempArray         = versionStr.split(" "); 	// ["WIN", "2,0,0,11"]
			tempString        = tempArray[1];			// "2,0,0,11"
			versionArray      = tempString.split(",");	// ['2', '0', '0', '11']
		} else {
			versionArray      = versionStr.split(".");
		}
		var versionMajor      = versionArray[0];
		var versionMinor      = versionArray[1];
		var versionRevision   = versionArray[2];
        	// is the major.revision >= requested major.revision AND the minor version >= requested minor
		if (versionMajor > parseFloat(reqMajorVer)) {
			return true;
		} else if (versionMajor == parseFloat(reqMajorVer)) {
			if (versionMinor > parseFloat(reqMinorVer))
				return true;
			else if (versionMinor == parseFloat(reqMinorVer)) {
				if (versionRevision >= parseFloat(reqRevision))
					return true;
			}
		}
		return false;
	}
}
function AC_AddExtension(src, ext)
{
  if (src.indexOf('?') != -1)
    return src.replace(/\?/, ext+'?');
  else
    return src + ext;
}
function AC_Generateobj(objAttrs, params, embedAttrs)
{
  var str = '';
  if (isIE && isWin && !isOpera)
  {
    str += '<object ';
    for (var i in objAttrs)
    {
      str += i + '="' + objAttrs[i] + '" ';
    }
    str += '>';
    for (var i in params)
    {
      str += '<param name="' + i + '" value="' + params[i] + '" /> ';
    }
    str += '</object>';
  }
  else
  {
    str += '<embed ';
    for (var i in embedAttrs)
    {
      str += i + '="' + embedAttrs[i] + '" ';
    }
    str += '> </embed>';
  }
  document.write(str);
}
function AC_FL_RunContent(){
  var ret =
    AC_GetArgs
    (  arguments, ".swf", "movie", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
     , "application/x-shockwave-flash"
    );
  AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
}
function AC_SW_RunContent(){
  var ret =
    AC_GetArgs
    (  arguments, ".dcr", "src", "clsid:166B1BCA-3F9C-11CF-8075-444553540000"
     , null
    );
  AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
}
function AC_GetArgs(args, ext, srcParamName, classid, mimeType){
  var ret = new Object();
  ret.embedAttrs = new Object();
  ret.params = new Object();
  ret.objAttrs = new Object();
  for (var i=0; i < args.length; i=i+2){
    var currArg = args[i].toLowerCase();
    switch (currArg){
      case "classid":
        break;
      case "pluginspage":
        ret.embedAttrs[args[i]] = args[i+1];
        break;
      case "src":
      case "movie":
        args[i+1] = AC_AddExtension(args[i+1], ext);
        ret.embedAttrs["src"] = args[i+1];
        ret.params[srcParamName] = args[i+1];
        break;
      case "onafterupdate":
      case "onbeforeupdate":
      case "onblur":
      case "oncellchange":
      case "onclick":
      case "ondblclick":
      case "ondrag":
      case "ondragend":
      case "ondragenter":
      case "ondragleave":
      case "ondragover":
      case "ondrop":
      case "onfinish":
      case "onfocus":
      case "onhelp":
      case "onmousedown":
      case "onmouseup":
      case "onmouseover":
      case "onmousemove":
      case "onmouseout":
      case "onkeypress":
      case "onkeydown":
      case "onkeyup":
      case "onload":
      case "onlosecapture":
      case "onpropertychange":
      case "onreadystatechange":
      case "onrowsdelete":
      case "onrowenter":
      case "onrowexit":
      case "onrowsinserted":
      case "onstart":
      case "onscroll":
      case "onbeforeeditfocus":
      case "onactivate":
      case "onbeforedeactivate":
      case "ondeactivate":
      case "type":
      case "codebase":
      case "id":
        ret.objAttrs[args[i]] = args[i+1];
        break;
      case "width":
      case "height":
      case "align":
      case "vspace":
      case "hspace":
      case "class":
      case "title":
      case "accesskey":
      case "name":
      case "tabindex":
        ret.embedAttrs[args[i]] = ret.objAttrs[args[i]] = args[i+1];
        break;
      default:
        ret.embedAttrs[args[i]] = ret.params[args[i]] = args[i+1];
    }
  }
  ret.objAttrs["classid"] = classid;
  if (mimeType) ret.embedAttrs["type"] = mimeType;
  return ret;
}
// -->
</script>
</head>
	<%String insType = (String)session.getAttribute("InsType"); %>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<!-- Implementation for customisation of  company based logo, title and owner id stats -->

			<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
			<bean:define id="PageLogo" property="answer(PageLogo)" name="LoginPage" scope="session" type="java.lang.String"/>
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
							//	session.setAttribute("PageLogo",PageLogo);
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
							//	session.setAttribute("PageLogo",PageLogo);
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
							//	session.setAttribute("PageLogo",PageLogo);
							}
						}


					}
					else{


						//Setting page title in session for default
						if(PageTitle==null || PageTitle.length()==0){	PageTitle=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DefaultInsuranceCompany.Name",null));
							session.setAttribute("PageTitle",PageTitle);
						}

						//Setting page logo in session for default
						if(PageLogo==null || PageLogo.length()==0){	PageLogo=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DefaultInsuranceCompany.Logo-Small",null));
						//	session.setAttribute("PageLogo",PageLogo);
						}

					}

				}
				%>
	<%String userName = ""; %>
			<!-- Implementation for customisation of  company based logo, title and owner id end-->
<div id="container">
<div id="header">
<div id="logoffbg" align="left">
<div style="float:left; padding:100px 0px 0px 240px;">
<b>
			<bean:message key="GeneralTemplate.welcome" />
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
						<%userName = ""+userId; %>
						<bean:define id="fname"
							property="answer(Object::UserDetail::UserFirstName)"
							name="LoginPage" scope="session" />
						<bean:define id="lname"
							property="answer(Object::UserDetail::UserLastName)" name="LoginPage"
							scope="session" /> 

						<%
						if (fname == null && lname == null || fname.equals("") && lname.equals("")) {
						%>

						<bean:write property="answer(Object::UserDetail::userName)"
							name="LoginPage" />
						<%
						} else {
						%>

						<%=fname%>
						<%=" "%>
						<%=lname%>

						<%
						}
						%>
					</logic:present>
					</b></div>
					
					<div style="float:right; padding:100px 30px 0px 0px;">
					<a  href="../GoHome.do">Home</a>|
<!--<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER_HOME"}%>' connector='or' negated="true">
<a  href="../customer/CoseEnrollmentApplication.jsp">Home</a>|
</dmshtml:dms_static_with_connector> 
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_COSEAGENT_HOME"}%>' connector='or' negated="true">
<a  href="../Home/AgentHome.jsp">Home</a>|
</dmshtml:dms_static_with_connector>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_SYSADMIN_HOME"}%>' connector='or' negated="true">
<a  href="../Home/AdminHome.jsp">Home</a>| 
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYEE_HOME"}%>' connector='or' negated="true">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER_HOME"}%>' connector='or' negated="false">
<a href="/GetEmployerHome.do?showEmployeePDFLink=YES" title="Click to fill up Other Employer Group Information">Home</a>| 
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector> -->
<%
String custid="";
if(request.getParameter("answer(Object::Customer::CustomerId)")!=null){ %>
	<bean:parameter id="custid1" name="answer(Object::Customer::CustomerId)" />	
<%
custid=""+custid1;
}else if(request.getAttribute("Object::Customer::CustomerId")!=null){
	custid=""+request.getAttribute("Object::Customer::CustomerId");
}
%>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_COSEAGENT_HOME"}%>' connector='or' negated="true">
<% if(custid!=""){ %>
<a href="../GetCustomerAction.do?customerId=<%=custid%>&forwardTag=HEALTH_INS_EMPGROUP_DETAIL_SUCCESS" >Employer Home</a>|
<%} %>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_PASSWORD"}%>' connector='or' negated="true">
			<a href="../EditMyUserInfoCose.do?TabPanelName=Manage_Panel&entityId=<%=strPrimObjId%>&objectType=<%=strPrimObjType%>&userId=<%=userName%>">Change My User Information</a>| 
</dmshtml:dms_static_with_connector>
<%
String employeeId="";
if(request.getParameter("answer(Object::Employee::EmployeeId)")!=null){ %>
	<bean:parameter id="EmployeeId" name="answer(Object::Employee::EmployeeId)" />
<%
employeeId=""+EmployeeId;
}else if((""+session.getAttribute("PRIMARY_OBJECT_TYPE")).equalsIgnoreCase("EMPLOYEE")) { 
    if(session.getAttribute("PRIMARY_OBJECT_ID")!=null) { 
    	employeeId=""+session.getAttribute("PRIMARY_OBJECT_ID");
    }
   }
%>
<%--
<%
if(request.getParameter("showEmployeePDFLink")!=null){ %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYEE_HOME"}%>' connector='or' negated="true">									
	<a href='../EmployeeApplListPdf.go?answer(DocumentType)=EMPLOYEE&answer(applicationType)=EMPLOYEE&answer(applicationSubType)=<%=""%>&answer(state)=<%=""%>&answer(teritory)=<%=""%>&answer(CustomerBeanInvocation)=YES&answer(isPreview)=false&customerId=<%=custid.toString()%>&SearchObjectId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Employee::EmployeeId)=<%=""+employeeId%>' target="_new">
	<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Print My Application</a> |
</dmshtml:dms_static_with_connector>
<% } %>
Bug No 10824 Fixed.
Modified by rajeshkumar_p@solartis.net on 07/15/2010 --%>
<%
if(request.getParameter("showEmployeePDFLink")!=null){ %>
<dmshtml:dms_user_object_connector objectId="<%=""+employeeId%>" objectType="<%="EMPLOYEE"%>" negated="true">
	<a href='../EmployeeApplListPdf.go?answer(DocumentType)=EMPLOYEE&answer(applicationType)=EMPLOYEE&answer(applicationSubType)=<%=""%>&answer(state)=<%=""%>&answer(teritory)=<%=""%>&answer(CustomerBeanInvocation)=YES&answer(isPreview)=false&customerId=<%=custid.toString()%>&SearchObjectId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Employee::EmployeeId)=<%=""+employeeId%>' target="_new">
	<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Print My Application</a> |
</dmshtml:dms_user_object_connector>
<% } %>
<%
if(request.getParameter("showEmployerPDFLink")!=null){ %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER_HOME"}%>' connector='or' negated="true">
<bean:define id="custEmail" property="answer(Object::Customer::EMailAddress)" name="AddCustomer"/>
<a href='../EmployerApplListPdf.go?answer(DocumentType)=EMPLOYER_GROUP&answer(applicationType)=EMPLOYER&answer(applicationSubType)=<%=""%>&answer(state)=<%=""%>&answer(teritory)=<%=""%>&answer(CustomerBeanInvocation)=YES&answer(isPreview)=false&customerId=<%=custid.toString()%>&SearchObjectId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::EMailAddress)=<%=""+custEmail %>' target="_new">
				<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Print My Application</a> |
</dmshtml:dms_static_with_connector>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_COSEAGENT_HOME"}%>' connector='or' negated="true">
<bean:define id="custEmail" property="answer(Object::Customer::EMailAddress)" name="AddCustomer"/>
<a href='../EmployerApplListPdf.go?answer(DocumentType)=EMPLOYER_GROUP&answer(applicationType)=EMPLOYER&answer(applicationSubType)=<%=""%>&answer(state)=<%=""%>&answer(teritory)=<%=""%>&answer(CustomerBeanInvocation)=YES&answer(isPreview)=false&customerId=<%=custid.toString()%>&SearchObjectId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::EMailAddress)=<%=""+custEmail %>' target="_new">
				<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Print Application</a> |
</dmshtml:dms_static_with_connector>
<% } %>
<a href="/LoginOutAction.do">Logoff</a>
</div>
</div>
</div>
<div style="float:left;width:1150px;padding-left:200px;">
<div id="main_bg">
<div id="main_second_bg">
<div style="float:left;width:784px;padding:0 0 0 19px">
<div id="main">
<%if(request.getAttribute("SessionExistsMessage")!=null){
	String userId = ""+((com.dms.ejb.user.UserDetail) request.getSession(false).getAttribute("userDetailObject")).getId();
	String sameSessionMultipleLoginMsg = ""+userId+" is already logged in from another tab in this browser. Cannot login as two different users from the same browser.  To login as another user, click on Logoff link above to log off and then login back as a new user.";
	%>
<p style="font-weight:bold;color:red;margin:10px 0 0 20px;padding:0;">	<%=sameSessionMultipleLoginMsg%> </p>
<%}%>
<p style="margin:0;padding:0;">&nbsp;</p>
	<div class=" yui-skin-sam">
		<template:get name='GeneralBody'/>
 	</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
    </div><!--end of division #main -->
</div>
    </div><!-- End of Main Second Background-->
    </div><!-- End of Main Background -->
    <div id="bottom_border">
    	<p align="center" class="footertxt" > <font color="white">COSE - Small Business Partner of the <a target="_blank" href="http://www.gcpartnership.com/" style="text-decoration:underline;">Greater Cleveland Partnership</a></font></p>
	<p align="center" class="footertxt">100 Public Square, Suite 210, Cleveland, Ohio 44113-2291 &nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;(216) 592-2222 &nbsp;&nbsp;&nbsp;(866) 553-5427</p>
<p align="center" class="footercopyrights"><font color="white">Copyright 2010 COSE All Right Reserved &nbsp;&nbsp;-&nbsp;&nbsp; <a target="_blank" href="http://cose.org/Privacy.aspx">Privacy Notice</a> &nbsp;|&nbsp; <a target="_blank" href="http://cose.org/Terms.aspx">Terms of Use</a>&nbsp; |&nbsp; <a target="_blank" href="http://cose.org/About%20COSE/Careers.aspx">Careers</a></font></p>
<div id="footer_solartis"><p align="center">Powered by Solartis Inc. All Rights Reserved.</p> </div>
    </div>
</div>
</div><!--end of division #container -->
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER_HOME"}%>' connector='or' negated="true">
<div style="top: 32px; left: 0px; position:absolute; z-index: 1;">

    <script language="JavaScript" type="text/javascript">
	AC_FL_RunContent(
		'width', '204',
		'height', '454',
		'src', '../Images/Avatar',
		'quality', 'high',
		'pluginspage', 'http://www.adobe.com/go/getflashplayer',
		'align', 'middle',
		'play', 'true',
		'loop', 'false',
		'scale', 'showall',
		'wmode', 'transparent',
		'devicefont', 'false',
		'id', 'Avatar',
		'bgcolor', '#000000',
		'name', 'Avatar',
		'menu', 'true',
		'allowFullScreen', 'false',
		'allowScriptAccess','sameDomain',
		'movie', '../Images/Avatar',
		'salign', ''
		); //end AC code
    </script>
    <noscript>
	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="204" height="454" id="Avatar" align="middle">
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="allowFullScreen" value="false" />
	<param name="movie" value="../Images/Avatar.swf" /><param name="loop" value="false" /><param name="quality" value="high" /><param name="wmode" value="transparent" /><param name="bgcolor" value="#000000" />	<embed src="../Images/Avatar.swf" loop="false" quality="high" wmode="transparent" bgcolor="#000000" width="204" height="454" name="Avatar" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer" />
	</object>
    </noscript>

</div>
</dmshtml:dms_static_with_connector>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYEE_HOME"}%>' connector='or' negated="true">
<div style="top: 32px; left: 0px; position:absolute; z-index: 1;">

    <script language="JavaScript" type="text/javascript">
	AC_FL_RunContent(
		'width', '204',
		'height', '454',
		'src', '../Images/Avatar',
		'quality', 'high',
		'pluginspage', 'http://www.adobe.com/go/getflashplayer',
		'align', 'middle',
		'play', 'true',
		'loop', 'false',
		'scale', 'showall',
		'wmode', 'transparent',
		'devicefont', 'false',
		'id', 'Avatar',
		'bgcolor', '#000000',
		'name', 'Avatar',
		'menu', 'true',
		'allowFullScreen', 'false',
		'allowScriptAccess','sameDomain',
		'movie', '../Images/Avatar',
		'salign', ''
		); //end AC code
    </script>
    <noscript>
	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="204" height="454" id="Avatar" align="middle">
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="allowFullScreen" value="false" />
	<param name="movie" value="../Images/Avatar.swf" /><param name="loop" value="false" /><param name="quality" value="high" /><param name="wmode" value="transparent" /><param name="bgcolor" value="#000000" />	<embed src="../Images/Avatar.swf" loop="false" quality="high" wmode="transparent" bgcolor="#000000" width="204" height="454" name="Avatar" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer" />
	</object>
    </noscript>

</div>
</dmshtml:dms_static_with_connector>

</body>
</html:html>

<%
	} //  end if ( !bNoTemplate )
	else {System.out.println("ELSE");
%>

	<template:get name='GeneralBody' />

<%
	}
%>
