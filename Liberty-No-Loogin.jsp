<!-- forwardToLoginPageIfInvalidSession -->
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>
<%response.setHeader("Cache-Control", "no-store");%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
<link href="../styles/Styles.css" rel="stylesheet" type="text/css">



<title>Welcome to Liberty International Underwriters </title>
<!-- <html:base/> -->

</head>
<body>

<html:form  action="/logon.go" focus="answer(Object::UserDetail::userName)">


<!-- <html:hidden property="answer(dbname)" value='<%=org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DMS.dbname",null)%>'/> -->

<!-- forwardToLoginPageIfInvalidSession -->



<table WIDTH="100%" style="height:100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>

	<td width="60%" align="center" valign="middle"><IMG SRC="../Images/liu-big.jpg" BORDER="0" ALT=""></td>


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
											<TD COLSPAN="2" class="Error" style="font-size: 12">
												<%="LIU system is currently under maintenance and will be available in 1-2 hours"%>
												<br/>
												<br/>
											</TD>
										</TR>
										<TR>
											<TD COLSPAN="2" class="Error" style="font-size: 12">
												<%="Please try again later."%>
												<br/>
												<br/>
												
											</TD>
										</TR>
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
		 session.setAttribute("ownerId","12");
		 session.setAttribute("dbname","java:/jdbc/libertyds");
		 session.setAttribute("ReadDS","java:/jdbc/libertyds");
		 session.setAttribute("WriteDS","java:/jdbc/libertyds");
		 session.setAttribute("ProductionMonitoringDS","java:/jdbc/ProductionMonitoringDS");		 
		 session.setAttribute("LookupDS","java:/jdbc/LookupDBName");
		%>

	<tr>
	   <td>
		<!-- <td colspan="2" align="center"><input type="submit" value="Log In1" class="sbttn"></td> -->
		<INPUT name="answer(Object::UserDetail::siteId)" type=hidden value="12"/>
		<INPUT name="answer(Object::UserDetail::ownerId)" type=hidden value="12"/>
		<INPUT name="answer(dbname)" type=hidden value="java:/jdbc/libertyds"/>
		<INPUT name=ownerId type=hidden value="12"/>
		<INPUT name=formName type=hidden value="form::LoginMICACARE"/>
		<INPUT name=page type=hidden value="1"/>
		<INPUT name=page type=hidden value="1"/>
		<INPUT name="answer(INSURANCE_TYPE)" type=hidden value="PC"/>
		<INPUT name="answer(Page::Title)" type=hidden value="Liberty International Underwriters"/>
		<INPUT name="answer(PageLogo)" type=hidden value="../Images/liu.jpg"/>


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