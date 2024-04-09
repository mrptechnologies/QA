
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/DeleteDependentConfirmAction">

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>

<tr><td class="MH">&nbsp;AGENT LIST</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td class="links">

</td></tr>

<tr><td colspan="4"><hr size="1" noshade ></td></tr>
<tr>
<td valign="top">
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

<tr>
<td colspan="6">
	
</td></tr>

<tr><td class="TextMatter" colspan="6"><b></td>
<logic:present name ='countSearchResult' scope ='session'>
Total Number of Agents &nbsp;&nbsp;<%=session.getAttribute("countSearchResult").toString()%></b>
</logic:present>
<tr><td height="6px" colspan="8" >&nbsp;</td></tr>
</td></tr> 
<tr WIDTH="100%" ><td class="FormLabels" colspan="8">

<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=a&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">A</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=b&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">B</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=c&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">C</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=d&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">D</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=e&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">E</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=f&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">F</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=g&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">G</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=h&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">H</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=i&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">I</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=j&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">J</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=k&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">K</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=l&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">L</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=m&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">M</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=n&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">N</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=o&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">O</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=p&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">P</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=q&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">Q</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=r&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">R</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=s&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">S</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=t&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">T</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=u&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT">U</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=v&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">V</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=w&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">W</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=x&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">X</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=y&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">Y</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=z&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">Z</A>&nbsp;
<A href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Entity::Like::FirstName)=&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&all=yes&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">ALL</A>&nbsp;
</td></tr>
<logic:notPresent name ='countSearchResult' scope ='session'>
<tr><td>&nbsp;</td></tr>
	<tr><td class="Error">No Matching Records Found.
</td></tr>

<tr><td>&nbsp;</td></tr>

</logic:notPresent>
<logic:present name ='searchresultnewDisplay' scope ='request'>
	<bean:define id="pagenum" name='pagenum' scope='request'/>
	<bean:define id="totpagenum" name='totpagenum' scope='request'/>
<tr><td height="6px" colspan="8" >&nbsp;</td></tr>

<tr>
		<td  class="links"  colspan="7">
		
		<logic:present name="prevEntity"  scope="request" >
		<a href="../AllAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>"><bean:message key="Common.Previous"/></a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="3">
		<logic:present name="moreEntity"  scope="request" >
		<a href="../AllAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>">Next&gt;&gt;</a>
		</logic:present>
		</td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr >
		
		<td class="sectionhead"  width="2%">No.</td>
		<td class="sectionhead" width="25%">First Name</td>
		<td class="sectionhead" width="10%">Middle Name</td>
		<td class="sectionhead" width="15%">Last Name</td>
		<td class="sectionhead" width="15%">City</td>
		<td class="sectionhead" width="5%">State</td>
		<td class="sectionhead" width="15%">E-mail</td>
		
</tr>

<% int i=0;%>

<%
String pageNum = (String)request.getAttribute("pagenum");
try{
    i=Integer.parseInt(pageNum);
		i = i * 20;
  }catch(NumberFormatException nfe)
  {
	  i=0;
  }

%>

<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request" >
<tr>
	<!-- <td class="SearchResult">
	<a href="../EditAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />&dbname=<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"><IMG SRC="../Images/submit.gif" WIDTH="30" HEIGHT="10" BORDER="0" ALT=""></a>

	</td> -->

	<td class="SearchResult">
	<a href="../EditAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"><%=++i%></a>
	
	</td>
		
	<td class="SearchResult" >
	<a href="../EditAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"><bean:write name="searchresultnewDisplay" property="answer(Object::Entity::FirstName)" /></a>
	&nbsp;
	</td>
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::middleName)" />
	&nbsp;
	</td>
		
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::LastName)" />
	&nbsp;
	</td>
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)" />
	&nbsp;
	</td>
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::State)" />
	&nbsp;
	</td>
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" />
	&nbsp;
	</td>
	
	</tr>		
		</logic:iterate>
		<% i=0;%>
		<!--%session.removeAttribute("FindAgents");%-->

<tr><td colspan="6" >&nbsp;</td></tr>
</logic:present>
<tr><td colspan="6" >&nbsp;</td></tr>
</logic:present>		

</table>
</td>
</tr>
<TABLE>


</TABLE>
<tr><td align="center">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</td></tr>

</table>

</html:form>
