<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="com.dms.common.ObjectDescriptor" %>
<html:html>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<head>
<title><%=session.getAttribute("PageTitle")%> - Find Customers</title>

</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<html:form action="/XMLGeneratorAction" >
<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td class="MH">EMPLOYER GROUP LIST</td></tr>
<br>

<tr><td><hr size="1" noshade ></td><tr>




<tr><td>
<table WIDTH="90%" ALIGN="Left" cellspacing=0 cellpadding="2">
<tr><td>


<tr >
		<td class="sectionhead"  width="20%">Sl No</td>
		<td class="sectionhead"  width="20%">Zip Code</td>
		<td class="sectionhead"  width="20%">City</td>
		<td class="sectionhead" width="20%">City1</td>
		<td class="sectionhead" width="20%">County</td>
		<td class="sectionhead" width="20%">State</td>
		

	
</tr>

	<bean:define id="ansmap" name="AddCustomer" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
	
	<logic:iterate id="element" name="ansmap">
	<%long no=1;%>
	<bean:define id="requiredkey" name="element" property="key" />
	<logic:equal name="requiredkey" value="ZipCodeLookUp">
			<bean:define id="arrList" name="element" property="value" type="java.util.ArrayList"/>
				<logic:iterate id="qmap" name="arrList" type="com.dms.ejb.data.QuestionHashMap">
<tr>
	<td class="SearchResult">
		<%=no++%>
	</td>
	<td class="SearchResult">
					<%=qmap.getString("LOOKUP_KEY1")%>
	</td>
	<td class="SearchResult">
					<%=qmap.getString("LOOKUP_KEY2")%>
	</td>
	<td class="SearchResult">
					<%=qmap.getString("LOOKUP_KEY3")%>
	</td>
	<td class="SearchResult">
					<%=qmap.getString("LOOKUP_KEY4")%>
	</td>
	<td class="SearchResult">
					<%=qmap.getString("LOOKUP_KEY5")%>
	</td>
				</logic:iterate>
	</logic:equal>	
	</logic:iterate>

</td></tr>
</table>
</table>

</html:form>
</body>
</html:html>
