		<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
	    <%@ page import="java.util.*" %>
	    <%@ page import="java.text.SimpleDateFormat" %>

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

	<table width="1020px" cellspacing="0" cellpadding="0" border="0" align="center">
				
				<tr>
					<td width="10%" align="right">
						<img alt="Powered By Solartis" src="../Images/Poweredby.gif" height="1%"/>
					</td>
					<td class="footerLegal center" width="82%">
						<FONT SIZE="1" ><bean:message key="logon.copyright"/></FONT> 
					</td>
					<td class="footerLegal" align="right" width="8%">
						<FONT SIZE="1"><bean:message key="Release.Number"/></FONT> 
					</td>
				</tr>
	</table>

<div class="footerServer right">
	<FONT SIZE="1" >
		[<%=""+ipAddress %>][<%=""+ipAddress %>][DateTime:<%=""+timeStamp%>]&nbsp;<%=""+Double.toString(timeTakenInSec)%>;(<%=""+timeTakeninMs%>)
	</FONT>
</div>
