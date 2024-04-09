<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>
<%@ page import = "javax.servlet.http.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>

<%HttpSession session1 =null; %>
<%session1 = request.getSession(false); 
if(session1 != null){

 if (session1.getAttribute("userObjDesc") != null) { 
	System.out.println("userObjDesc  : "+session1.getAttribute("userObjDesc"));
	response.sendRedirect("./GoHome.do?");
}
}
	%>
<head>
<link href="styles/Styles.css" rel="stylesheet" type="text/css">



<title>Welcome to Council of Smaller Enterprises </title>
<!-- <html:base/> -->

</head>
<body>

<html:form  action="/logon.go" focus="answer(Object::UserDetail::userName)">


<!-- <html:hidden property="answer(dbname)" value='<%=org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DMS.dbname",null)%>'/> -->
		


<table WIDTH="100%" style="height:100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
	
	<td width="60%" align="center" valign="middle"><IMG SRC="Images/COSELogo.png" BORDER="0" ALT=""></td>


		<td bgcolor=#8A0808 align="center" >

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
								<!-- 
								<tr>
									<TD align="right" class="FormLabels">
									<b>
									UI
									</b>&nbsp;
									</TD>
									<td align="justify">
										<select name="solartisTabView"  >
											<option value="UI_1.0">UI 1.0</option>
											<option value="UI_2.0" selected="selected">UI 2.0</option>
 										</select>
									</td>
									<td colspan="2">&nbsp;
									</td>
								</tr>
								 -->
								 <tr>
								 	<td>
								 		<input type="hidden" name="solartisTabView" value="UI_3.1" >
								 	</td>
								 </tr>
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
		 session.setAttribute("ownerId","11");
		 session.setAttribute("dbname","java:/jdbc/coseds");
		 session.setAttribute("ReadDS","java:/jdbc/coseds");
		 session.setAttribute("WriteDS","java:/jdbc/coseds");
		 session.setAttribute("LookupDS","java:/jdbc/LookupDBName");
		 session.setAttribute("ProductionMonitoringDS","java:/jdbc/ProductionMonitoringDS");
		%>
	 
	<tr>
	   <td>
		<!-- <td colspan="2" align="center"><input type="submit" value="Log In1" class="sbttn"></td> -->
		<INPUT name="answer(Object::UserDetail::siteId)" type=hidden value="11"/>
		<INPUT name="answer(Object::UserDetail::ownerId)" type=hidden value="11"/>
		<INPUT name="answer(dbname)" type=hidden value="java:/jdbc/coseds"/>
		<INPUT name=ownerId type=hidden value="11"/>
		<INPUT name=formName type=hidden value="form::LoginMICACARE"/>
		<INPUT name=page type=hidden value="1"/>
		<INPUT name=page type=hidden value="1"/>
		<INPUT name="answer(INSURANCE_TYPE)" type=hidden value="Health"/>
		<INPUT name="answer(Page::Title)" type=hidden value="Council of Smaller Enterprises"/>
		<INPUT name="answer(PageLogo)" type=hidden value="../Images/COSELogo.png"/>


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