<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template'%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.net.*" %>
<logic:notPresent name="userObjDesc" scope="session">
		<jsp:forward page="./Default.jsp" />
</logic:notPresent>

<logic:present name="userLog" scope="session">
	<%
	((com.dms.web.userlog.UserLog) session.getAttribute("userLog"))
	.setLastAccessedTime(session.getLastAccessedTime());
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

<!-- Declaration for Dynamic Tab Index -->
<%
long panelIndex=0;
long Home_Panel=0;
long Submission_Panel=0;
long Insured_Panel=0;
long Quote_Panel=0;
long Policy_Panel=0;
long Search_Panel=0;
long Manage_Panel=0;

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
<bean:define id="pageTitle" property="answer(Page::Title)" name="LoginPage" scope="session" type="java.lang.String"/>
	<head>
		<title><%=""+pageTitle%></title>
		<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
		<link rel="stylesheet" href="../styles/structure.css" type="text/css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/dpSyntaxHighlighter.css">

<!--Script and CSS includes for YUI dependencies on this page-->

<!--Script and CSS includes for YUI dependencies on this page-->

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/button/assets/skins/sam/button.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo/yahoo-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/event/event-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/dom/dom-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<SCRIPT SRC="../Scripts/JScripts/HomePanel.js" type="text/javascript"> </SCRIPT>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>

<!--begin custom header content for this example-->

<style type="text/css">
.yui-navset button {
    position:absolute;
    top:0;
    right:0;
}
</style>

<!-- end of Tabs style definition -->

<!-- beging top nav menu -->

<!-- menu -->
        <meta http-equiv="content-type" content="text/html; charset=utf-8">

        <!-- Standard reset, fonts and grids -->

        <link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/reset-fonts-grids.css">


        <!-- CSS for Menu -->

        <link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">

        <!-- Dependency source files -->
  
       
        <script type="text/javascript" src="../Scripts/YUI/2.4.1/build/animation/animation-min.js"></script>
        <script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
       
        <!-- Menu source file -->
        <script type="text/javascript" src="../Scripts/YUI/2.4.1/build/menu/menu-min.js"></script>

        <!-- Page-specific script for dropdown menu-->
		<script type="text/javascript" src="../Scripts/solartis_menu.js"></script>

<!-- end of menu -->


<!-- end of top nav menu -->
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


		 -->
		 </script>
	</head>
				<%
					String tabName="";
					if ((String)request.getParameter("TabPanelName") != null){
						tabName=(String)request.getParameter("TabPanelName");
						request.setAttribute("TabPanelName",tabName);
						System.out.println("TabPanelName:"+tabName);
					}else{
						tabName=(String)request.getParameter("answer(TabPanelName)");
						request.setAttribute("TabPanelName",tabName);
						System.out.println("answer(TabPanelName):"+tabName);
					}
					if( tabName==null || tabName.length()==0 ) {
						System.out.println("*****NOT FOUND TabPanelName*************");
						tabName = "Home_Panel";
						request.setAttribute("TabPanelName",tabName);
					}	
					System.out.println(tabName+"*************FOUND TabPanelName*************");
				%>
				
	<%String insType = (String)session.getAttribute("InsType"); %>
	<body onresize="adjustPageWidth()" onload="{setTabFocus('<%=tabName%>');adjustPageWidth();}">				
	
		<body onload="setTabFocus('<%=tabName%>');">				
	

		<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0" style="height: 100%">


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

						//Setting page logo in session for default
						if(PageLogo==null || PageLogo.length()==0){	PageLogo=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DefaultInsuranceCompany.Logo-Small",null));
							session.setAttribute("PageLogo",PageLogo);
						}

					}

				}
				%>

			<%if((""+ownerId).equals("5")){ %>
				<tr>
					<td width="200px" align="left" height="1%"  valign="middle"><IMG SRC="<%=PageLogo%>"  BORDER="0" ALT=""></td>
				</tr>
			<%}else if((""+ownerId).equals("6")){ %>
				<tr>
					<td width="200px" align="left" height="1%"  valign="middle"><IMG SRC="<%=PageLogo%>" WIDTH="100" BORDER="0" ALT=""></td>
				</tr>
			<%}else if((""+ownerId).equals("9")){ %>
			<tr>
				<td width="200px" align="center" height="1%"  valign="middle"><IMG SRC="<%=PageLogo%>" ></td>
			</tr>
			<%}else if((""+ownerId).equals("12")){ %>
			<tr>
				<td width="200px" align="left" height="1%"  valign="left"><IMG SRC="<%=PageLogo%>" ></td>
			</tr>
			<%} else{ %>
				<tr>
					<td width="200px" align="left" height="1%"  valign="middle"><IMG SRC="<%=PageLogo%>" WIDTH="168" BORDER="0" ALT=""></td>
				</tr>			
			<%} %>

			<!-- Implementation for customisation of  company based logo, title and owner id end-->

			<tr>
				<td colspan="3" height="1px" bgcolor="#336699"></td>
			</tr>



			<tr>
				<td class="username" bgcolor="#336699" height="20px" align="right" colspan="3">
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



						&nbsp;&nbsp;&nbsp;&nbsp;
					</logic:present>
				</td>
			</tr>


<tr>

<!-- Tabs Definition Begins here -->
<td valign="top" colspan="3" width="100%" id="yahoo-com" class="yui-skin-sam" bgcolor="#EDF5FF">
	<!-- Tabs Definition -->
	<div id="solartisTabs" class="yui-navset">
	
	
    <ul class="yui-nav">    
     <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"HOME_MENU"}%>' connector='or' negated="true">  			
        	<li class="selected"><a href="#home"><em>Home</em></a></li>
        	<%Home_Panel = panelIndex; 
        	  panelIndex=Home_Panel;
              panelIndex = panelIndex + 1;
        	%>
     </dmshtml:dms_static_with_connector>
      <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU"}%>' connector='or' negated="true">  			
        	<li class="selected"><a href="#submission"><em>Submission</em></a></li>
        	<%
        		Submission_Panel=panelIndex;
        	  	panelIndex=Submission_Panel;
        	  	panelIndex = panelIndex + 1;
        	%>
     </dmshtml:dms_static_with_connector>
        	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">  	
        	<%if(insType.equals("PC")|| insType.equals("Professional Liability")) {%>           		
        		<li><a href="#insured"><em>Insured</em></a></li> 
        		<%
        		Insured_Panel=panelIndex;
        	  	panelIndex=Insured_Panel;
        	  	panelIndex = panelIndex + 1;
        		%>
        	<%}else if(insType.equals("Health")){%>
        		<li><a href="#insured"><em>Employer Groups</em></a></li>        	
        	<%
        		Insured_Panel=panelIndex;
        	  	panelIndex=Insured_Panel;
        	  	panelIndex = panelIndex + 1;
        	}
        	%>  	
        	</dmshtml:dms_static_with_connector>
        	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
        	<% if(insType.equals("Professional Liability")){%>
        	<li><a href="#quote"><em>Enrollment</em></a></li> 
        		<%
        			Quote_Panel=panelIndex; 
        			panelIndex=Quote_Panel;
        			panelIndex = panelIndex + 1;
        		%>
        	
        	<%}else{ %>
        	<li><a href="#quote"><em>Quote</em></a></li> 
        		<%
        			Quote_Panel=panelIndex; 
        			panelIndex=Quote_Panel;
        			panelIndex = panelIndex + 1;
        		%>
        	<%} %>
        		
        	</dmshtml:dms_static_with_connector> 
        	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUICK_QUOTE_DISABLED"}%>' connector='or' negated="true">
        	<% if(insType.equals("Professional Liability")){%>
        	<li><a href="#quote"><em>Enrollment</em></a></li> 
        		<%
        			Quote_Panel=panelIndex; 
        			panelIndex=Quote_Panel;
        			panelIndex = panelIndex + 1;
        		%>
        	
        	<%}else{ %>
        	<li><a href="#quote"><em>Quote</em></a></li> 
        		<%
        			Quote_Panel=panelIndex; 
        			panelIndex=Quote_Panel;
        			panelIndex = panelIndex + 1;
        		%>
        	<%} %>
        		
        	</dmshtml:dms_static_with_connector> 
     	    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_MENU"}%>' connector='or' negated="true">
     	   		<li><a href="#policy"><em>Policy</em></a></li>
        		<%
        			Policy_Panel=panelIndex; 
        			panelIndex=Policy_Panel;
        			panelIndex = panelIndex + 1;
        		%>
        	</dmshtml:dms_static_with_connector>
        	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CERTIFICATE_MENU"}%>' connector='or' negated="true">
     	    	<li><a href="#policy"><em>Certificate</em></a></li>
        		<%
        			Policy_Panel=panelIndex; 
        			panelIndex=Policy_Panel;
        			panelIndex = panelIndex + 1;
        		%>
        	</dmshtml:dms_static_with_connector>        	
        	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SEARCH_MENU"}%>' connector='or' negated="true">   
        		<li><a href="#search"><em>Search</em></a></li>
        		<%
	        		Search_Panel=panelIndex; 
	        		panelIndex=Search_Panel;
	        		panelIndex = panelIndex + 1;
	        	%>
        	</dmshtml:dms_static_with_connector>
        	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MANAGE_MENU"}%>' connector='or' negated="true">
       	   		 <li><a href="#manage"><em>Manage</em></a></li>
       	    	<%
       	    		Manage_Panel=panelIndex; 
       	    		panelIndex=Manage_Panel;
       	    		
       	    	%>
       	    </dmshtml:dms_static_with_connector>
    </ul>
    <%String panelTabName = ""; %>
    <div class="yui-content">

		<!-- Home Tab Definition -->
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"HOME_MENU"}%>' connector='or' negated="true">  	        
        
        <div id="home_tab">
        	
        	<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #336699;}">
					
						<div id="Home_Panel">
						<jsp:include page="../common/Home_Tab_Menu.jsp" />
						<jsp:include page="../HomePanel/HomePanelsContainer.jsp" />							
						</div>
					</td>							
				</tr>												 
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Home_Panel"> 
							
						</div>
					</td>
				</tr>
			</table>
        </div>
        </dmshtml:dms_static_with_connector>
        
        
        
        <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU"}%>' connector='or' negated="true"> 	
		<!-- Insured & Exposure Tab Definition -->
        <div id="submission_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #336699;}">
						<jsp:include page="../common/Submission_Tab_Menu.jsp" />
					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Submission_Panel">
							<%
								panelTabName =(String)request.getAttribute("TabPanelName");
								if 	( panelTabName!=null && panelTabName.length()>0 && panelTabName.equals("Submission_Panel") ) {
									System.out.println("****************Submission_Panel FOUND********");
							%>

									<template:get name='GeneralBody' />
							<%
								}
							%>
						</div>
					</td>
				</tr>
			</table>
        </div>
        </dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true"> 	
		<!-- Insured & Exposure Tab Definition -->
        <div id="insured_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #336699;}">
						<jsp:include page="../common/Insured_Tab_Menu.jsp" />
					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Insured_Panel">
							<%
								panelTabName =(String)request.getAttribute("TabPanelName");
								if 	( panelTabName!=null && panelTabName.length()>0 && panelTabName.equals("Insured_Panel") ) {
									System.out.println("****************Insured_Panel FOUND********");
							%>

									<template:get name='GeneralBody' />
							<%
								}
							%>
						</div>
					</td>
				</tr>
			</table>
        </div>
		</dmshtml:dms_static_with_connector>
		<!-- Quote & Shop Tab Definition -->
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
        <div id="quote_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #999999;}">
						<jsp:include page="../common/Quote_Tab_Menu.jsp" />
					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Quote_Panel">
							<%
								panelTabName =(String)request.getAttribute("TabPanelName");
								if 	( panelTabName!=null && panelTabName.length()>0 && panelTabName.equals("Quote_Panel") ) {
									System.out.println("****************Quote_Panel FOUND********");
							%>

									<template:get name='GeneralBody' />
							<%
								}
							%>
						</div>
					</td>
				</tr>
			</table>
        </div>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUICK_QUOTE_DISABLED"}%>' connector='or' negated="true">
        <div id="quote_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #999999;}">
						<jsp:include page="../common/Quote_Tab_Menu.jsp" />
					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Quote_Panel">
							<%
								panelTabName =(String)request.getAttribute("TabPanelName");
								if 	( panelTabName!=null && panelTabName.length()>0 && panelTabName.equals("Quote_Panel") ) {
									System.out.println("****************Quote_Panel FOUND********");
							%>

									<template:get name='GeneralBody' />
							<%
								}
							%>
						</div>
					</td>
				</tr>
			</table>
        </div>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_MENU"}%>' connector='or' negated="true">
		<%if((insType.equals("PC"))) {%>
        
		<!-- Policy Tab Definition -->
        <div id="policy_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #999999;}">
							<jsp:include page="../common/Policy_Tab_Menu.jsp" />
					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Policy_Panel">
							<%
								panelTabName =(String)request.getAttribute("TabPanelName");
								if 	( panelTabName!=null && panelTabName.length()>0 && panelTabName.equals("Policy_Panel") ) {
									System.out.println("****************Policy_Panel FOUND********");
							%>

									<template:get name='GeneralBody' />
							<%
								}
							%>
						</div>
					</td>
				</tr>
			</table>
        </div>
        
         <%}else if(insType.equals("Health")){%>
         
         <%} %>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CERTIFICATE_MENU"}%>' connector='or' negated="true">
        
		<!-- Policy Tab Definition -->
        <div id="policy">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #999999;}">
							<jsp:include page="../common/Policy_Tab_Menu.jsp" />
					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Policy_Panel">
							<%
								panelTabName =(String)request.getAttribute("TabPanelName");
								if 	( panelTabName!=null && panelTabName.length()>0 && panelTabName.equals("Policy_Panel") ) {
									System.out.println("****************Policy_Panel FOUND********");
							%>

									<template:get name='GeneralBody' />
							<%
								}
							%>
						</div>
					</td>
				</tr>
			</table>
        </div>
        </dmshtml:dms_static_with_connector>
        
		<!-- Search Tab Definition -->
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SEARCH_MENU"}%>' connector='or' negated="true">
		<div id="search_tab">
			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #999999;}">
							<jsp:include page="../common/Search_Tab_Menu.jsp" />
					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Search_Panel">
							<%
								panelTabName =(String)request.getAttribute("TabPanelName");
								if 	( panelTabName!=null && panelTabName.length()>0 && panelTabName.equals("Search_Panel") ) {
									System.out.println("****************Search_Panel FOUND********");
							%>

									<template:get name='GeneralBody' />
							<%
								}
							%>
						</div>
					</td>
				</tr>
			</table>
        </div>
        </dmshtml:dms_static_with_connector>

		<!-- Manage Tab Definition -->
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MANAGE_MENU"}%>' connector='or' negated="true">
        <div id="manage_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #999999;}">
						<jsp:include page="../common/Manage_Tab_Menu.jsp" />
					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Manage_Panel">
							<%
								panelTabName =(String)request.getAttribute("TabPanelName");
								if 	( panelTabName!=null && panelTabName.length()>0 && panelTabName.equals("Manage_Panel") ) {
									System.out.println("****************Manage_Panel FOUND********");
							%>

									<template:get name='GeneralBody' />
							<%
								}
							%>
						</div>
					</td>
				</tr>
			</table>
        </div>
        </dmshtml:dms_static_with_connector>				
    </div>
</div>

<script>
(function() {
    var tabView = new YAHOO.widget.TabView('solartisTabs');
})();
</script>
<!-- Tabs Definition Ends here -->


	<!--END SOURCE CODE FOR EXAMPLE =============================== -->


</td>
</tr>

<!-- end of Tab definition -->

<!-- footer begins here -->

			<tr>
				<td colspan="3" bgcolor="#999999" height="2px"></td>
			</tr>

			<tr>
				<td colspan="3" height="1%">
					<table border="0">
						<tr>
							<td align="left" width="300px">
								<img src="../Images/Poweredby.gif" alt="Powered By Solartis">
							</td>

							<td align="center" class ="PageFooter" width="450px">
								<bean:message key="logon.copyright"/>
							</td>

							<%
							long timeTakeninMs=0;
							double timeTakenInSec=0.0;
							java.util.Date date= new java.util.Date();
							if (session.getAttribute("startTime")!=null) {
								String stTime=(String)session.getAttribute("startTime");				
								SimpleDateFormat formatter=  new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
							    Date convertedDate = formatter.parse(stTime); 
							    long lgstTime =convertedDate.getTime();				 
							    long lgendTime=date.getTime();
								timeTakeninMs=(lgendTime-lgstTime);
								timeTakenInSec=timeTakeninMs/1000;
							}
							String timeStamp = com.dms.util.Format.getCurrentDate("-");
							String ipAddress = ""+session.getAttribute("IpAddress");
							%>

							<td align="right" class ="PageFooter" width="280px">
								<FONT SIZE="1" COLOR="#FFFFFF">	[DateTime:<%=""+timeStamp%>]&nbsp;<%=""+Double.toString(timeTakenInSec)%>&nbsp;(<%=""+timeTakeninMs%>)&nbsp;[<%=""+ipAddress %>]
								</FONT>								
							</td>
							<td align="right">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font color="#808080"><bean:message key="Release.Number" /></font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
<!-- footer end here -->

	</table>
	
<script type="text/javascript">			
	
	function setTabFocus(tabName) {
		if(tabName !=null && tabName != "") {
			setFocusTowTabView(tabName);
		}
		else {
			setFocusTowTabView('Home_Panel');
		}
	}

	function setFocusTowTabView(panelName) {
		var tabIndex = 0; // default tab index
		if ( panelName!="" )
		{
			if ( panelName=="Home_Panel" ) {
				tabIndex = <%=Home_Panel%> // set focus to Home tab
			}
			else if ( panelName=="Submission_Panel" ) {
				tabIndex = <%=Submission_Panel%>; // set focus to Submission tab
			}
			else if ( panelName=="Insured_Panel" ) {
				tabIndex = <%=Insured_Panel%>; // set focus to Insured tab
			}
			else if ( panelName=="Quote_Panel" ) {
				tabIndex = <%=Quote_Panel%>; // set focus to Quote tab
			}
			else if ( panelName=="Policy_Panel" ) {
				tabIndex = <%=Policy_Panel%>; // set focus to Policy tab
			}
			else if ( panelName=="Search_Panel" ) {
				tabIndex = <%=Search_Panel%>; 
				// set focus to Search tab
			}
			else if ( panelName=="Manage_Panel" ) {
				tabIndex = <%=Manage_Panel%>; // set focus to Manage tab
			}
			var myTabs = new YAHOO.widget.TabView('solartisTabs', { activeIndex: tabIndex } ); // make tab at position 1 active
			myTabs.set('activeIndex', tabIndex); // make tab at index 0 active
		}
		else
			alert ("No Panel...");
	}
	
</script>

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
