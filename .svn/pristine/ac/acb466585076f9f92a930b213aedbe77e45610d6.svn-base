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
<%
            response.setHeader("Pragma", "public");
            response.setHeader("Cache-Control", "max-age=0");
%>
<%@ page import="java.net.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
<bean:define id="pageTitle" property="answer(Page::Title)" name="LoginPage" scope="session" type="java.lang.String"/>
	<head>
		<title><%=""+pageTitle%></title>
		<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
		<link rel="stylesheet" href="../styles/structure.css" type="text/css">
		
		

<!-- Added Style Tag-->
<style type="text/css">
	.mainmenu2{color:#999999; font-family:Verdana, Arial, Helvetica font-size: 9pt; border-bottom:1px solid #999999; padding:5px 5px 5px 10px;  margin:0px 0px 0px 0px;}
</style>

<!-- ****** Infinite Menus Core CSS [Do Not Modify!] ****** -->
<style type="text/css">.imcm ul,.imcm li,.imcm div,.imcm span,.imcm a{text-align:left;vertical-align:top;padding:0px;margin:0;list-style:none ox13ide none;border-style:none;background-image:none;clear:none;float:none;display:block;position:static;overflow:visible;line-height:normal;}.imcm span{display:inline;}.imcm .imclear,.imclear{clear:both;height:0px;visibility:hidden;line-height:0px;}.imcm .imsc{position:absolute;}.imcm .imsubc{position:absolute;visibility:hidden;}.imcm li{list-style:none;font-size:1px;float:left;}.imcm ul ul li{width:100%;float:none !important;}.imcm a{display:block;position:relative;}.imcm ul .imsc,.imcm ul .imsubc {z-index:10;}.imcm ul ul .imsc,.imcm ul ul .imsubc{z-index:20;}.imcm ul ul ul .imsc,.imcm ul ul .imsubc{z-index:30;}.imde ul li:hover .imsubc{visibility:visible;}.imde ul ul li:hover  .imsubc{visibility:visible;}.imde ul ul ul li:hover  .imsubc{visibility:visible;}.imde li:hover ul  .imsubc{visibility:hidden;}.imde li:hover ul ul .imsubc{visibility:hidden;}.imde li:hover ul ul ul  .imsubc{visibility:hidden;}.imcm .imea{display:block;position:relative;left:0px;font-size:1px;line-height:0px;height:0px;float:right;}.imcm .imea span{display:block;position:relative;font-size:1px;line-height:0px;}.dvs,.dvm{border-width:0px}/*\*//*/.imcm .imclear,.imclear{font-size:1px;}.imcm .imsc{display:inline-block;position:relative;}/**/ </style><!--[if IE]><style type="text/css">.imcm .imclear,.imclear{display:none;}.imcm{zoom:1;} .imcm .imsc{position:relative;}.imcm li{curosr:pointer;} .imcm ul{zoom:1}.imcm a{zoom:1;}</style><![endif]--><!--[if gte IE 7]><style type="text/css">.imcm .imsubc{background-image:url(ie_css_fix);}</style><![endif]-->


<!-- ****** Infinite Menus CSS Styles ****** -->
<style type="text/css" id="ssimenus0">


	/* --[[ Main Expand Icons ]]-- */
	#imenus0 .imeam span,#imenus0 .imeamj span {background-image:url(../Images/sample14_main_expand_default.gif); width:13px; height:9px; left:0px; top:2px; background-repeat:no-repeat;background-position:top left;}
	#imenus0 li:hover .imeam span,#imenus0 li a.iactive .imeamj span {background-image:url(../Images/sample14_main_expand_on.gif); background-repeat:no-repeat;background-position:top left;}


	/* --[[ Sub Expand Icons ]]-- */
	#imenus0 ul .imeas span,#imenus0 ul .imeasj span {background-image:url(../Images/sample14_sub_expand_default.gif); width:4px; height:16px; left:0px; top:3px; background-repeat:no-repeat;background-position:top left;}
	#imenus0 ul li:hover .imeas span,#imenus0 ul li a.iactive .imeasj span {background-image:url(../Images/sample14_sub_expand_on.gif); background-repeat:no-repeat;background-position:top left;}


	/* --[[ Main Container ]]-- */
	#imouter0 {background-color:#336699; background-image:url(../Images/menugb1.jpg); border-style:double; border-color:#ffffff; border-width:0px; }


	/* --[[ Sub Container ]]-- */
	#imenus0 li ul {background-color:#336699; border-style:solid; border-color:#000000; border-width:1px; padding:1px; margin:4px 0px 0px; }


	/* --[[ Main Items ]]-- */
	#imenus0 li a {color:#fffff0; text-align:left; font-family:Verdana, Arial, Helvetica; font-size:11px; font-weight:bold; text-decoration:none; border-style:outset; border-color:#ffffcc; border-width:1px 2px 2px 1px; padding:4px 9px 4px 4px; }

		/* [hover] - These settings must be duplicated for IE compatibility.*/
		#imenus0 li:hover>a {background-color:#f1f1f1; color:#000000; }
		#imenus0 li a.ihover, .imde imenus0 a:hover {background-color:#f1f1f1; color:#000000; }

		/* [active] */
		#imenus0 li a.iactive {}


	/* --[[ Sub Items ]]-- */
	#imenus0 ul a {background-color:#336699; color:#fffff0; text-align:left; font-size:11px; font-weight:normal; text-decoration:none; border-style:none; border-color:#336699; border-width:1px; padding:2px 5px; }

		/* [hover] - These settings must be duplicated for IE comptatibility.*/
		#imenus0 ul li:hover>a {background-color:#f1f1f1; color:#000000; }
		#imenus0 ul li a.ihover {background-color:#f1f1f1; color:#000000; }

		/* [active] */
		#imenus0 ul li a.iactive {text-decoration:underline; }


</style>
		
	
		
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
	
	<logic:notPresent name="userObjDesc" scope="session">
		<jsp:forward page="./Default.jsp" />
	</logic:notPresent>
	<logic:present name="userLog" scope="session">
		<%
	                            ((com.dms.web.userlog.UserLog) session.getAttribute("userLog"))
	                            .setLastAccessedTime(session.getLastAccessedTime());
		%>	
	</logic:present>

	<body>


		<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0" style="height: 100%">


			<!-- Implementation for customisation of  company based logo, title and owner id stats-->

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
					<td width="200px" align="center" height="1%"  valign="middle"><IMG SRC="<%=PageLogo%>" WIDTH="168" BORDER="0" ALT=""></td>
				</tr>
			<%}else if((""+ownerId).equals("6")){ %>
				<tr>
					<td width="200px" align="center" height="1%"  valign="middle"><IMG SRC="<%=PageLogo%>" WIDTH="100" BORDER="0" ALT=""></td>
				</tr>
			<%}else if((""+ownerId).equals("9")){ %>
			<tr>
				<td width="200px" align="center" height="1%"  valign="middle"><IMG SRC="<%=PageLogo%>" WIDTH="100" BORDER="0" ALT=""></td>
			</tr>
			<%} else{ %>
				<tr>
					<td width="200px" align="center" height="1%"  valign="middle"><IMG SRC="<%=PageLogo%>" WIDTH="168" BORDER="0" ALT=""></td>
				</tr>
			<%} %>

			<!-- Implementation for customisation of  company based logo, title and owner id end-->

			<tr>
				<td colspan="3" height="1px" bgcolor="#999999"></td>
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
				<td colspan="3" height="1px" bgcolor="#999999"></td>
			</tr>

			<tr>
				<td width="200px" valign="top" bgcolor="#336799">
					<table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" style="height: 100%">
						<tr>
							<td valign="top"><template:get name='LeftMenuAdmin' /></td>
						</tr>
					</table>
				</td>

				<td bgcolor="#999999" width="1px"></td>
				<td valign="top" align="center" width="100%">
					<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
						<tr>
							<td valign="top" width="100%" style="{border-left:1px solid #999999;}"><template:get name='GeneralBody' /></td>
						</tr>
					</table>
				</td>
			</tr>


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
							%>

							<td align="right" class ="PageFooter" width="280px">
								<FONT SIZE="1" COLOR="#FFFFFF">	[DateTime:<%=""+timeStamp%>]&nbsp;<%=""+Double.toString(timeTakenInSec)%>&nbsp;(<%=""+timeTakeninMs%>)
								</FONT> 
							</td>
						</tr>
					</table>
				</td>
			</tr>
	</table>

</body>
</html:html>
