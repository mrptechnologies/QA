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

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="20"></td></tr>
<tr>
	<td class="NewSectionHead" align="center">OPTION VALUES</td></tr>
<tr>
	<td height="8px"></td></tr>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="false">	
<tr>
	<td class="sectionhead">
		You Don't Have the Privilage to Access This Page. Please Contact Administrator.</td></tr>
</dmshtml:dms_static_with_connector>


<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="true">

	
<tr>
	<td align="center">
	
			
	
	<table border="0" width="100%" cellspacing="2" cellpadding="2" style="{border-width:1px; border-style:solid; border-color: #999999;}">
	
			
	<tr>
		<td class="sectionhead"  width="2%" align="Left">No.</td>
		<td class="sectionhead" width="10%" align="Left">Display Value</td>
		<td class="sectionhead" width="10%" align="Left">Value</td>
		<td class="sectionhead" width="5%" align="Left">Sequence</td>
	</tr>
	<%System.out.println("aaddd"); %>
	
	<bean:define id="ansmap" name="UploadOptions"
							property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
							
	<%System.out.println("aaddd"); %>
	
		<%
		java.util.ArrayList OptionVerValues=(java.util.ArrayList)ansmap.get("Object::ProductOptions::OptionVerValues");
		for(int i=0;i<OptionVerValues.size();i++) { %>
			<tr>
			<td class="SearchResult">
			<%=i+1%>
			</td>

				<td class="SearchResult" >
				<%=ansmap.getString("Object::ProductOptions::DisplyValue"+i)%>
			</td>
			<td class="SearchResult" >
				<%=ansmap.getString("Object::ProductOptions::Value"+i)%>
			</td>
			<td class="SearchResult" >
				<%=ansmap.getString("Object::ProductOptions::Sequence"+i)%>
			</td>
				</tr>	
			<%} %>
	
	
	</table>
	</td>
</tr>


</dmshtml:dms_static_with_connector>
</table>
