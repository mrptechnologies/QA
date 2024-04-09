
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>


			<TABLE WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td class="NewSectionHead" colspan="4" align="center">SEARCH APPLICATION VERSIONS RESULT</td>
							</tr>
							<tr><td  class="FormLabels" align="left" colspan="4"> &nbsp;</td></tr>
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						</table>
					</td>
				</tr>
			</TABLE>

<logic:present name="searchresultnewDisplay" scope="request">
<logic:present name="appVerSize" scope="request">
<bean:define id="appSize" name='appVerSize' scope='request'/>
	<table>
	<tr><td class="FormLabels">Number of search results found : <%=""+appSize%></td></tr>
	<tr><td>&nbsp;</td></tr>
	</table>
</logic:present>



<table width="90%" align="center" border="0" >
			
		
			<tr >					
				<td class="sectionhead" width="5%">SrNo.</td>
				<td class="sectionhead" width="20%">ApplicationName</td>
				<td class="sectionhead" width="20%">ApplicationDescriiption</td>
				<td class="sectionhead" width="10%">VerNumber</td>				
				<td class="sectionhead" width="20%">Active</td>				
			</tr>

<%int count=0;%>
	
<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request" >		
		<tr>
			<td class="SearchResult">
			<%=++count%>
			</td>
			<td class="SearchResult">
			<a href="../GetApplicationVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ApplicationId)=<bean:write name="searchresultnewDisplay" property="answer(Object::Application::ApplicationId)" />&answer(ApplicationVerId)=<bean:write name="searchresultnewDisplay" property="answer(Object::Application::ApplicationVerId)" />"><bean:write name="searchresultnewDisplay" property="answer(Object::Application::ApplicationName)" /></a>			
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::Application::ApplicationDesc)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::Application::ApplicationVerNum)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::Application::VerActive)" />
			</td>
		</tr>		
</logic:iterate>		
</table>		


</logic:present>
<logic:notPresent name="searchresultnewDisplay" scope="request">
	<table>
	<tr><td class="FormLabels">No records found</td></tr>
	</table>
</logic:notPresent>
