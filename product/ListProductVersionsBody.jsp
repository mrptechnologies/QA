
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
								<td class="NewSectionHead" colspan="4" align="center">SEARCH PRODUCT VERSIONS RESULT</td>
							</tr>
							<tr><td  class="FormLabels" align="left" colspan="4"> &nbsp;</td></tr>
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
						</table>
					</td>
				</tr>
			</TABLE>

<logic:present name="searchresultnewDisplay" scope="request">
<logic:present name="productVerSize" scope="request">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="prdSize" name='productVerSize' scope='request'/>
	<table>
	<tr><td class="FormLabels">Number of search results found : <%=""+prdSize%></td></tr>
	<tr><td>&nbsp;</td></tr>
	</table>
</logic:present>



<table width="90%" align="center" border="0" >
			
		
			<tr >					
				<td class="sectionhead" width="5%">SrNo.</td>
				<td class="sectionhead" width="20%">ProductName</td>
				<td class="sectionhead" width="20%">ProductDesc</td>
				<td class="sectionhead" width="10%">VerNumber</td>				
				<td class="sectionhead" width="20%">ProductStatus</td>				
				<td class="sectionhead" width="10%">ReleaseDate</td>
				<td class="sectionhead" width="10%">StartDate</td>
				<td class="sectionhead" width="10%">EndDate</td>
			</tr>

<%int count=0;%>
	
<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request" >		
		<tr>
			<td class="SearchResult">
			<%=++count%>
			</td>
			<td class="SearchResult">
			<a href="../GetProductVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<bean:write name="searchresultnewDisplay" property="answer(Object::ProductVer::ProductId)" />&answer(ProductVerId)=<bean:write name="searchresultnewDisplay" property="answer(Object::ProductVer::ProductVerId)" />"><bean:write name="searchresultnewDisplay" property="answer(Object::ProductVer::ProductName)" /></a>			
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::ProductVer::ProductDesc)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::ProductVer::ProductVerNum)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::ProductVer::ProductStatus)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::ProductVer::ProductReleaseDate)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::ProductVer::ProductStartDate)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::ProductVer::ProductEndDate)" />
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
