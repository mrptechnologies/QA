
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			<TABLE WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">
						<table WIDTH="1200px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td class="NewSectionHead" colspan="4" align="center">SEARCH PRODUCT RESULT</td>
							</tr>
							<tr><td  class="FormLabels" align="left" colspan="4"> &nbsp;</td></tr>
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
						</table>
					</td>
				</tr>
			</TABLE>

<logic:present name="searchresultnewDisplay" scope="request">
<logic:present name="productsSize" scope="request">
<bean:define id="prdSize" name='productsSize' scope='request'/>
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
				<td class="sectionhead" width="10%">ProductNum</td>
				<td class="sectionhead" width="20%">ProductType</td>
				<td class="sectionhead" width="20%">ProductStatus</td>
				<td class="sectionhead" width="10%">VerNumber</td>
				<td class="sectionhead" width="10%">SellIndependent</td>
				<td class="sectionhead" width="5%">Active</td>
			</tr>

<%int count=0;%>
	
<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request" >

	
		
			<tr>
			<td class="SearchResult">
			<%=++count%>
			</td>
			<td class="SearchResult">
			<a href="../GetProductAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<bean:write name="searchresultnewDisplay" property="answer(Object::Product::ProductId)" />"><bean:write name="searchresultnewDisplay" property="answer(Object::Product::ProductName)" /></a>			
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::Product::ProductDesc)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::Product::ProductNum)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::Product::ProductType)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::Product::ProductStatus)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::Product::VerNumber)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::Product::SellIndependent)" />
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::Product::Active)" />
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

