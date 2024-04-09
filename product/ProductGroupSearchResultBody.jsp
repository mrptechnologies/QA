
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<html:form action="/FindProductGroup">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

<%java.util.ArrayList productGroupdetail=null;%>
<logic:present name="searchresultProductGroup" scope="request">
   <bean:define id="productGroup" name="searchresultProductGroup"    type="java.util.ArrayList" />
   <%productGroupdetail=productGroup;%>
  </logic:present>

			<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td colspan="3">

						

						<table WIDTH="1200px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">


							<tr>
								<td class="NewSectionHead" colspan="4" align="center">SEARCH PRODUCT GROUP RESULT</td>
							</tr>
							<tr><td  class="FormLabels" align="left" colspan="4"> &nbsp;</td></tr>
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

						</table>

					</td>
				</tr>
					
			</TABLE>


<%
if(productGroupdetail.size()>0){
%>
<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

<tr><td class="FormLabels">Number of search results found : <%=productGroupdetail.size()%></td></tr>

<tr><td>&nbsp;</td></tr>
</table>





<table width="90%" align="center" border="0" >
			
		
			<tr >	
				<td class="sectionhead" width="10%">ProductGroupId</td>
				<td class="sectionhead" width="20%">GroupName</td>
				<td class="sectionhead" width="20%">GroupDesc</td>
				<td class="sectionhead" width="20%">GroupStatus</td>
				<td class="sectionhead" width="10%">Active</td>
				
			</tr>


	

<%
	for(int i=0; i<productGroupdetail.size();i++)
	{
		
		com.dms.ejb.data.QuestionHashMap qmap_Temp = (com.dms.ejb.data.QuestionHashMap)productGroupdetail.get(i);
		%>
		
			<tr>
			<td class="SearchResult">
			<a href="../GetProductGroup.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(GroupId)=<%=qmap_Temp.getString("Object::ProductGroup::ProductGroupId")%>"><%=qmap_Temp.getString("Object::ProductGroup::ProductGroupId")%></a>
			
			</td>


			<td class="SearchResult">
			<a href="../GetProductGroup.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(GroupId)=<%=qmap_Temp.getString("Object::ProductGroup::ProductGroupId")%>"><%=qmap_Temp.getString("Object::ProductGroup::GroupName")%></a>
			
			</td>
			<td class="SearchResult"><%=qmap_Temp.getString("Object::ProductGroup::GroupDesc")%>
			</td>
			<td class="SearchResult"><%=qmap_Temp.getString("Object::ProductGroup::GroupStatus")%>
			</td>
			<td class="SearchResult"><%=qmap_Temp.getString("Object::ProductGroup::Active")%>
			</td>
			
		</tr>
		<%}
		%>
	

		</table>
		

<%}
else{
%>
<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td class="error">No records found</td></tr>
</table>
<%}%>

</html:form>
