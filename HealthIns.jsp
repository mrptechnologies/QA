<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
<link href="styles/Styles.css" rel="stylesheet" type="text/css">



<title>Welcome to Total Plan Services, Inc.</title>
<!-- <html:base/> -->

</head>
<body>

<html:form  action="/logon.go" focus="answer(Object::UserDetail::userName)">


<!-- <html:hidden property="answer(dbname)" value='<%=org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DMS.dbname",null)%>'/> -->
		




<table WIDTH="100%" style="height:100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
	
	<td width="60%" align="center" valign="middle"><IMG SRC="Images/tpsi_logo_revised.gif" WIDTH="135" HEIGHT="135" BORDER="0" ALT=""></td>


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
									<input type="password" name="answer(Object::UserDetail::passWord)" maxlength="40" size="15" value="" class="txtbox">
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
		 session.setAttribute("InsType","Health");
		 session.setAttribute("ownerId","6");
		 session.setAttribute("dbname","java:/jdbc/newtpsds");
		 session.setAttribute("ReadDS","java:/jdbc/newtpsds");
		 session.setAttribute("WriteDS","java:/jdbc/newtpsds");
		 session.setAttribute("PageTitle","Total Plan Services, Inc.");
		%>
	 
	<tr>
	   <td>
		<!-- <td colspan="2" align="center"><input type="submit" value="Log In1" class="sbttn"></td> -->
		<INPUT name="answer(Object::UserDetail::siteId)" type=hidden value="6"/>
		<INPUT name="answer(Object::UserDetail::ownerId)" type=hidden value="6"/>
		<INPUT name="answer(dbname)" type=hidden value="java:/jdbc/newtpsds"/>
		<INPUT name=ownerId type=hidden value="6"/>
		<INPUT name=formName type=hidden value="form::LoginMICACARE"/>
		<INPUT name=page type=hidden value="1"/>
		<INPUT name=page type=hidden value="1"/>
		<INPUT name="answer(INSURANCE_TYPE)" type=hidden value="Health"/>
		<INPUT name="answer(Page::Title)" type=hidden value="Total Plan Services, Inc."/>
		<INPUT name="answer(PageLogo)" type=hidden value="../Images/tpsi_logo_revised.gif"/>
	<INPUT name="solartisTabView" type=hidden value="UI_2.0"/>

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