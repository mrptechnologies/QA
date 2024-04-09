
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<TABLE WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">
						<table WIDTH="770px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td class="NewSectionHead" colspan="4" align="center"> PRODUCT GROUP VERSIONS</td>
							</tr>
							<tr><td  class="FormLabels" align="left" colspan="4"> &nbsp;</td></tr>
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
						</table>
					</td>
				</tr>
			</TABLE>

<logic:present name="searchresultnewDisplay" scope="request">
<logic:present name="groupVerSize" scope="request">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="prdSize" name='groupVerSize' scope='request'/>
	<table>
	<tr><td class="FormLabels">Number of search results found : <%=""+prdSize%></td></tr>
	<tr><td>&nbsp;</td></tr>
	</table>
</logic:present>



<table width="90%" align="center" border="0" >
			
		
			<tr >					
				<td class="sectionhead" width="5%">SrNo.</td>
				<td class="sectionhead" width="30%">Group Name</td>
				<td class="sectionhead" width="30%">Group Desc</td>
				<td class="sectionhead" width="30%">Version Number</td>								
			</tr>

<%int count=0;%>
	
<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request" >		
		<tr>
			<td class="SearchResult">
			<a href="../GetProductGroupVersion.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(GroupId)=<bean:write name="searchresultnewDisplay" property="answer(Object::ProductGroup::ProductGroupId)" />&answer(GroupVerId)=<bean:write name="searchresultnewDisplay" property="answer(Object::ProductGroup::GroupVerId)" />"><%=++count%></a>	
			</td>
			<td class="SearchResult">
			<a href="../GetProductGroupVersion.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(GroupId)=<bean:write name="searchresultnewDisplay" property="answer(Object::ProductGroup::ProductGroupId)" />&answer(GroupVerId)=<bean:write name="searchresultnewDisplay" property="answer(Object::ProductGroup::GroupVerId)" />"><bean:write name="searchresultnewDisplay" property="answer(Object::ProductGroupVer::GroupName)" /></a>			
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::ProductGroupVer::GroupDesc)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::ProductGroupVer::GroupVersionNum)" />
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
