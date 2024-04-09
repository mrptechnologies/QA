<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
<link href="styles/Styles.css" rel="stylesheet" type="text/css">

<%
String strDomainName="";
String PageTitle="";
String PageLogo="";

strDomainName=""+request.getServerName();

	if(strDomainName.indexOf("tps")>=0){
		%> 
		 
		 <jsp:forward page="HealthIns.jsp" /> 
		 
		<%
		}
	else if(strDomainName.indexOf("cose")>=0){
		%>
		<jsp:forward page="Cose.jsp" /> 
		<%
	}
	else if(strDomainName.indexOf("treiber")>=0){
	%> 
	 
		 <jsp:forward page="Treiber.jsp" /> 
		 
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

<html:form  action="/SSOLogin.go" focus="answer(Object::UserDetail::userName)">


<!-- <html:hidden property="answer(dbname)" value='<%=org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DMS.dbname",null)%>'/> -->
		




<table WIDTH="100%" style="height:100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
	
	<td width="60%" align="center" valign="middle"><IMG SRC="/Images/allrisk_logo_small.gif" BORDER="0" ALT="" WIDTH="282" HEIGHT="108"></td>


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
									<tr>
										<td class="FormLabels" align="left">UserName</td>
										<td class="FormLabels" align="left">
										<input  name="UserName" maxlength="40" size="15" class="txtbox">
										</td>
									</tr>
									<tr>
										<td class="FormLabels" align="left">BrokerContactId</td>
										<td class="FormLabels" align="left">
										<input  name="BrokerContactId" maxlength="40" size="15" value="" class="txtbox">
										</td>
									</tr>
									
									<tr>
										<td class="FormLabels" align="left">BrokerId</td>
										<td class="FormLabels" align="left">
										<input type="text" name="BrokerId" maxlength="40" size="15" value="" class="txtbox">
										</td>
									</tr>
									
									<tr>
										<td class="FormLabels" align="left">SSOKey</td>
										<td class="FormLabels" align="left">
										<input type="text" name="SSOKey" maxlength="40" size="15" value="" class="txtbox">
										</td>
									</tr>
									
									<tr>
									   <td class="FormLabels" align="left">UserRole</td>
									   <td class="FormLabels" align="left">
									   <select name="UserRole" >
										   	<option value=''>Select</option>
										   	<option value='AGENT'>Agent</option>
									
									   </select>
									
									
								<tr>
								<tr>
										<td class="FormLabels" align="left">OwnerID</td>
									    <td class="FormLabels" align="left"> 
										<INPUT name="OwnerId" type=text value="5"/>
										</td>
										
								</tr>
								
								<tr>
										<td class="FormLabels" align="left">UserInitial</td>
									    <td class="FormLabels" align="left"> 
										<INPUT name="UserInitial" type=text value=""/>
										</td>
										
								</tr>
								
								<tr>
										<td class="FormLabels" align="left">LogOffURL</td>
									    <td class="FormLabels" align="left"> 
										<INPUT name="LogOffURL" type=text value=""/>
										</td>
										
								</tr>	
								<tr>
								 <td class="FormLabels" align="left">UI Version</td>
								<td align="justify">
										<select name="solartisTabView"  >
											<option value="UI_1.0">UI 1.0</option>
											<option value="UI_2.0">UI 2.0</option>
 										</select>
								</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">SSODateTimeStamp</td>
									    <td class="FormLabels" align="left"> 
										<input name = "SSODateTimeStamp" type=text id="SSODateTimeStamp" value="" />
									</td>
								</tr>	
									
								<tr>
									<TD align="center" class="WhiteMsg"> 
										<html:submit value="Login" property="answer(submit)" styleClass="sbttn"> </html:submit>
									</TD>
								</tr>
								
								<tr>
									<TD class="Error" align="center" class="WhiteMsg"> 
										<logic:present name="SSOFailure" scope="request">
										  <%=""+request.getAttribute("SSOFailure") %>
										 </logic:present>
									</TD>
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

				
			</tr>
		</TABLE>
	</td>
</tr>
	 	

</table>

</html:form>
<!-- <html:javascript formName="DataForm"
        dynamicJavascript="true"
         staticJavascript="false"/>
<script language="Javascript1.1" src="staticJavascript.jsp"></script> -->
</body>
<script type="text/javascript">

	var currentTime = new Date();
 	var month = currentTime.getMonth() + 1;
	var day = currentTime.getDate();
	var year = currentTime.getFullYear();
	var hours = currentTime.getHours();
	var min = currentTime.getMinutes();
	var sec = currentTime.getSeconds();
	var time = hours+':'+min+':'+sec;
	document.getElementById("SSODateTimeStamp").value = year+'-'+month+'-'+day+" "+time;
	alert(document.getElementById("SSODateTimeStamp").value);
</script>	
	




</html:html>