<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<html:html>
<body>

<html:form action="/TestTreiberLogin">      
                    <TABLE WIDTH="90%" ALIGN="center" BORDER=0 CELLSPACING=0 CELLPADDING=2>
									<tr>
										<td class="FormLabels" align="left">UserName</td>
										<td class="FormLabels" align="left">
										<input  name="UserName" id="username" value="UserName" maxlength="40" size="15" class="txtbox">
										</td>
									</tr>
									 <!-- <tr>
										<td class="FormLabels" align="left">BrokerContactId</td>
										<td class="FormLabels" align="left">
										<input  name="BrokerContactId" id="brokercontactid" maxlength="40" size="15" value="0" class="txtbox">
										</td>
									</tr> -->
									
									<tr>
										<td class="FormLabels" align="left">BrokerId</td>
										<td class="FormLabels" align="left">
										<input type="text" name="BrokerId" id="brokerid" maxlength="40" size="15" value="6" class="txtbox">
										</td>
									</tr>
									
									<tr>
										<td class="FormLabels" align="left">SSOKey</td>
										<td class="FormLabels" align="left">
										<input type="text" name="SSOKey" id="ssokey" size="60" value="TREIBER#ACC09$SSOLOGIN@NOW" class="txtbox">
										</td>
									</tr>
									
									<tr>
									   <td class="FormLabels" align="left">UserRole</td>
									   <td class="FormLabels" align="left">
									   <select name="UserRole" >
									        <option value=''>Select</option>
										   	<option value='SSO_AGENCY'>SSO_AGENCY</option>
									
									   </select>
									
									
								<tr>
								<tr>
										<td class="FormLabels" align="left">OwnerID</td>
									    <td class="FormLabels" align="left"> 
										<INPUT name="OwnerId" id="ownerid" type=text value="9"/>
										</td>
										
								</tr>
								
								<tr>
										<td class="FormLabels" align="left">LogOffURL</td>
									    <td class="FormLabels" align="left"> 
										<INPUT name="LogOffURL" id="logoffurl" type=text value="http://www.etreiber.com/"/>
										</td>
										
								</tr>	
								<%
										java.util.Calendar currentDateTime = java.util.Calendar.getInstance();
										String requestedTime = currentDateTime.get(java.util.Calendar.YEAR)+"-"+(currentDateTime.get(java.util.Calendar.MONTH)+1)+"-"+currentDateTime.get(java.util.Calendar.DATE)+":"+currentDateTime.get(java.util.Calendar.HOUR_OF_DAY)+":"+currentDateTime.get(java.util.Calendar.MINUTE)+":"+currentDateTime.get(java.util.Calendar.SECOND);  
										java.util.Date date = new java.util.Date();
										java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss z");
										requestedTime = sdf.format(date);	
								%>
								<tr>
									<td class="FormLabels" align="left">SSODateTimeStamp</td>
									    <td class="FormLabels" align="left"> 
										<input name = "SSODateTimeStamp" type=text id="SSODateTimeStamp" value="<%=requestedTime%>" />
									</td>
								</tr>	
									
								<tr>
									<TD align="center" class="WhiteMsg"> 
									  <input type="submit" value="Create EncryptedURL"  styleClass="sbttn" /> 
									</TD>
								</tr>
								</TABLE>
								
								

							
								
				<%  
				com.util.dbCon dbCon = new com.util.dbCon();
				java.sql.Connection con = dbCon.getConnection("java:/jdbc/Treiberds");
				 String originalURL = "UserName="+request.getParameter("UserName")+"&BrokerId="+request.getParameter("BrokerId")+
	                 				 "&SSOKey="+request.getParameter("SSOKey")+"&OwnerId="+request.getParameter("OwnerId")+"&LogOffURL="+request.getParameter("LogOffURL")+"&UserRole="+request.getParameter("UserRole")+
				  					 "&SSODateTimeStamp="+request.getParameter("SSODateTimeStamp");
      		    String key = com.dms.util.OwnerUtility.getParameter(9,"SSO_PRESHARED_KEY",con);
		        String seed = com.dms.util.OwnerUtility.getParameter(9,"SSO_PRESHARED_SEED",con);
        		com.dms.util.security.AESSymmentricAlgorithm aesEncyDecy = new com.dms.util.security.AESSymmentricAlgorithm();
   				String encryptedString = aesEncyDecy.encrypt(key,originalURL);
				String originalString = aesEncyDecy.decrypt(key,encryptedString);
				String url = "https://"+request.getServerName()+"//TreiberLogin.go?agent_id="+java.net.URLEncoder.encode(encryptedString,"US-ASCII");
				String cleanURL = "https://"+request.getServerName()+"//TreiberLogin.go?agent_id="+originalURL;
				con.close();
	          %>
			
			<%	
			if(request.getParameter("BrokerId") != null){ %>	 
             		Encrypted URL: <a id ="link" href="<%=url%>"><%=url%></a>				

			    <br>
			    <br>
			    Plain Text URL (before encryption): <%=cleanURL%>
			    <br>
		    <%}%>
		    
		    
		    
		  
		    
	
</html:form>
<br>
<br>
<br>
<br>
<html:form action="/TestTreiberLogin">      
	<TABLE WIDTH="90%" ALIGN="center" BORDER=0 CELLSPACING=0 CELLPADDING=2>
			<tr>
				<td class="FormLabels" align="left">Encrypted Text</td>
				<td class="FormLabels" align="left">
				<textarea  name="encryptedText" cols="60" rows="10"></textarea>
				</td>
			</tr>

			<tr>
				<TD align="center" class="WhiteMsg"> 
				  <input type="submit" value="Decrypt"  styleClass="sbttn" /> 
				</TD>
			</tr>
	</TABLE>
</html:form>
<%
	String encryptText = request.getParameter("encryptedText");
	if (encryptText!=null && encryptText.length()>0 ) {
		com.util.dbCon dbCon = new com.util.dbCon();
		java.sql.Connection con = dbCon.getConnection("java:/jdbc/Treiberds");
		String key = com.dms.util.OwnerUtility.getParameter(9,"SSO_PRESHARED_KEY",con);
		String seed = com.dms.util.OwnerUtility.getParameter(9,"SSO_PRESHARED_SEED",con);
		com.dms.util.security.AESSymmentricAlgorithm aesEncyDecy = new com.dms.util.security.AESSymmentricAlgorithm();
		encryptText = URLDecoder.decode(encryptText, "US-ASCII");					
		encryptText = aesEncyDecy.decrypt(key,encryptText);
		con.close();
	}

%>
			
			<%	
			if(encryptText!=null && encryptText.length()>0 ) { %>	 
			    <br>
			    <br>
			    Decrypted Text : <%=encryptText%>
			    <br>
		    <%}%>
		    


</body>
</html:html>





 

 
