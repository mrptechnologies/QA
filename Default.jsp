<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
<%
String strDomainName="";
String PageTitle="";
String PageLogo="";
String httpsUrl="";
strDomainName=""+request.getServerName();
String loginPage = "";
if(request.getParameter("answer(Login::Page)") != null) {
	loginPage = request.getParameter("answer(Login::Page)");
}
%>
<META HTTP-EQUIV="Refresh" CONTENT="<%="0;URL=https://"+strDomainName%>">
<link href="styles/Styles.css" rel="stylesheet" type="text/css">
<%
	if(strDomainName.indexOf("tps")>=0){
		%>

		 <jsp:forward page="HealthIns.jsp" />

		<%
		}
	else if(strDomainName.indexOf("cose")>=0){
		%>
		<jsp:forward page="Cose.jsp" />
		<%
	}else if(strDomainName.indexOf("liu")>=0 || (strDomainName.indexOf("liberty")>=0) || (loginPage.indexOf("Liberty") >= 0)){
	%>
	 <jsp:forward page="Liberty.jsp" />
	<%}else if(strDomainName.indexOf("cv")>=0 || (strDomainName.indexOf("cvs")>=0)){
		%>
		 <jsp:forward page="CVStarr.jsp" />
		<%}
	else if(strDomainName.indexOf("treiber")>=0){
	%>

		 <jsp:forward page="Treiber.jsp" />

	<%
	}
	else if(strDomainName.indexOf("seneca")>=0){%>
		  <jsp:forward page="Seneca.jsp" />
	<%
	}
	else if(strDomainName.indexOf("profliab")>=0){
		%>

			 <jsp:forward page="LifeAgent.jsp" />

		<%
		}
	else if(strDomainName.indexOf("ppgregistration")>=0){
		%>

			 <jsp:forward page="BoswellRegistration.jsp" />

		<%
		}

		else if((strDomainName.indexOf("benicorp")>=0) || (strDomainName.indexOf("mica")>=0) || (strDomainName.indexOf("demo.solartis")>=0)){


		if(strDomainName.indexOf("benicorp")>=0){
		PageTitle=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"BenicorpInsuranceCompany.Name",null));

		PageLogo=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"BenicorpInsuranceCompany.Logo-Big",null));


	}



		if(strDomainName.indexOf("mica")>=0){

		PageTitle=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"MicaInsuranceCompany.Name",null));

		PageLogo=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"MicaInsuranceCompany.Logo-Big",null));
		}


		if(strDomainName.indexOf("demo.solartis")>=0){

		PageTitle=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"SolartisInsuranceCompany.Name",null));

		PageLogo=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"SolartisInsuranceCompany.Logo-Big",null));
		}


	}
	else{

		PageTitle=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"BenicorpInsuranceCompany.Name",null));

		PageLogo=""+(org.apache.struts.util.RequestUtils.message(pageContext,null,null,"BenicorpInsuranceCompany.Logo-Big",null));


	}%>



<title>Welcome to <%=PageTitle%></title>
<!-- <html:base/> -->

</head>
<body>

<html:form  action="/logon.go" focus="answer(Object::UserDetail::userName)">


<!-- <html:hidden property="answer(dbname)" value='<%=org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DMS.dbname",null)%>'/> -->





<table WIDTH="100%" style="height:100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>

	<td width="60%" align="center" valign="middle"><IMG SRC="/Images/allrisk_logo_large.gif" BORDER="0" ALT="" ></td>


		<td bgcolor="#336699" align="center" >

			<TABLE WIDTH="75%" ALIGN=center  BORDER=0 CELLSPACING=0 CELLPADDING=4 >

			<!-- <tr>
				<td align="center" valign="middle"><img SRC="Images/SC-Logo.gif" WIDTH="150" HEIGHT="50">
				</td>
			</tr> -->

			<TR>
				<TD align="center" class="WhiteMsg" style="height:35%">
				&nbsp;<br><br><br><br><br><br><br><br><br>
				</TD>
			</TR>


			<TR>
				<TD align="center" class="WhiteMsg">
				Please use your User Name and Password to Log into the application.
				</TD>
			</TR>

			<!--	<tr>
				<td align="center">&nbsp;</td>
			</tr>-->

			<TR>
				<TD align="center" valign="middle">

					<TABLE WIDTH="90%" ALIGN="center" BORDER=1 CELLSPACING=0 CELLPADDING=0 bgcolor="#f1f1f1">
						<TR>
							<TD>&nbsp;
								<TABLE WIDTH="90%" ALIGN="center" BORDER=0 CELLSPACING=0 CELLPADDING=2>
								<TR>
									<TD COLSPAN="2" class="Error">
										<td align="center" class="Error" colspan="2">
									</TD>
								</TR>
								<TR>
									<TD width="45%" align="right" class="FormLabels">
									<b>
									User Name
									</b>&nbsp;
									</TD>
									<TD width="45%" >&nbsp;
									<input type="text" name="answer(Object::UserDetail::userName)" maxlength="40" size="15" tabindex="1" value="" class="txtbox">
									</TD>
								</TR>
								<TR>
									<TD align="right" class="FormLabels">
									<b>
									Password
									</b>&nbsp;
									</TD>
									<TD>&nbsp;
									<input type="password" name="answer(Object::UserDetail::passWord)" maxlength="40" size="15" value="" class="txtbox" autocomplete="off">
									</TD>
								</TR>
								<TR>

									<td colspan="2" align="center">
										<input type="submit" value="Log In" class="sbttn">
									</td>
								</TR>
								<tr>
									<td colspan="2">&nbsp;
									</td>
								</tr>

								</TABLE>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<!--<TR>
				<TD align="center" class="WhiteMsg">
				<bean:message key="prompt.ForgotPass"/>
				</TD>
			</TR>
			<tr>
				<td align="center">&nbsp;
				</td>
			</tr>
			<tr>
				<td align="center" class="WhiteMsg">
				<bean:message key="prompt.ProductLicence"/>
				</td>
			</tr>
			<tr>
				<td align="center"><img SRC="images/Licence2.jpg" >
				</td>
			</tr>-->
			<!-- <tr><td align="center" class="WhiteMsg"><a href="./AppointmentAction.go"><IMG SRC="Images/RFALine.jpg" WIDTH="250" HEIGHT="25" color="white" BORDER="2" ALT="Click here to Goto Appointment Request Page"></a></td></tr> -->
			<tr>
				<td align="center" >&nbsp;<br><br><br><br><br><br><br><br><br>
				</td>
			</tr>




			<tr>
				<td align="center" class="WhiteMsg">
				<bean:message key="prompt.CopyRight"/>
				</td>
			</tr>
		</TABLE>

	</td>
</tr>
	 <%
	 session.setAttribute("InsType","PC");
	 session.setAttribute("ownerId","5");
	 session.setAttribute("dbname","java:/jdbc/solartisds");
	 session.setAttribute("ReadDS","java:/jdbc/solartisds");
	 session.setAttribute("WriteDS","java:/jdbc/solartisds");
	 session.setAttribute("ProductionMonitoringDS","java:/jdbc/ProductionMonitoringDS");
	 %>
	<tr>
	   <td>
		<!-- <td colspan="2" align="center"><input type="submit" value="Log In1" class="sbttn"></td> -->
		<INPUT name="answer(Object::UserDetail::siteId)" type=hidden value="5"/>
		<INPUT name="answer(Object::UserDetail::ownerId)" type=hidden value="5"/>
		<INPUT name="answer(dbname)" type=hidden value="java:/jdbc/solartisds"/>
		<INPUT name=ownerId type=hidden value="5"/>
		<INPUT name=formName type=hidden value="form::LoginMICACARE"/>
		<INPUT name=page type=hidden value="1"/>
		<INPUT name="answer(INSURANCE_TYPE)" type=hidden value="PC"/>
		<INPUT name="answer(Page::Title)" type=hidden value="AllRisks Insurance System"/>
		<INPUT name="answer(PageLogo)" type=hidden value="../Images/allrisk_logo_small.gif" />
		<INPUT name="solartisTabView" type=hidden value="UI_3.0"/>
          
        <INPUT name="InsType"	type=hidden value="PC"/>
		<INPUT name="ownerId"	type=hidden value="5"/>
		<INPUT name="dbname"	type=hidden value="java:/jdbc/solartisds"/>
		<INPUT name="ReadDS"	type=hidden value="java:/jdbc/solartisds"/>
		<INPUT name="WriteDS"	type=hidden value="java:/jdbc/solartisds"/>
          </td>
	</tr>
</table>

</html:form>
<!-- <html:javascript formName="DataForm"
        dynamicJavascript="true"
         staticJavascript="false"/>
<script language="Javascript1.1" src="staticJavascript.jsp"></script> -->
</body>
</html:html>