
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:form action="/DeleteDependentConfirmAction">

<%String agencyId="";%>
<%if (request.getParameter("answer(1*Entity::Equals::SearchObjectId)")!= null) {
agencyId=request.getParameter("answer(1*Entity::Equals::SearchObjectId)");
}%>


<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td>&nbsp;</td></tr>

	<tr><td class="NewSectionHead" align="center">&nbsp;AGENT LIST</td></tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr><td class="links">

	</td></tr>
<%if (!agencyId.equals("")) { %>
<tr><td class="links" align="left" colspan="2"><a href="../AddAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&clear=yes&agencyIdtoLink=<%=agencyId.toString()%>">Add Agent</a>
</td>
</tr>
<%}%>
<tr><td colspan="4"><hr size="1" noshade ></td></tr>
<tr>
<td valign="top">
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

<tr>
<td colspan="6">
	
</td></tr>

<tr><td class="TextMatter" colspan="6"><b>
<logic:present name ='countSearchResult' scope ='request'>
Total Number of Agents &nbsp;&nbsp;<%=request.getAttribute("countSearchResult").toString()%></b>
</logic:present>

<logic:notPresent name ='countSearchResult' scope ='request'>
<tr><td>&nbsp;</td></tr>
	<tr><td class="Error">No Matching Records Found.
</td></tr>

<tr><td>&nbsp;</td></tr>

</logic:notPresent>
<logic:present name ='searchresultnewDisplay' scope ='request'>


<bean:define id="pagenum" name='pagenum' scope='request'/>
<bean:define id="totpagenum" name='totpagenum' scope='request'/>



<bean:define id="entityId" name='SearchAgents' property='answer(Entity::Equals::EntityId)' scope='request'/>
<bean:define id="entityId" name='SearchAgents' property='answer(Entity::Equals::EntityNum)' scope='request'/>
<bean:define id="fname"  name='SearchAgents'  property='answer(Entity::Like::FirstName)' scope='request'/>
<bean:define id="lname"  name='SearchAgents'  property='answer(Entity::Like::LastName)' scope='request'/>
<bean:define id="TotalRec"  name='SearchAgents'  property='answer(Object::Entity::TotalRec)' scope='request'/>
<bean:define id="type"  name='SearchAgents'  property='answer(Entity::Equals::EntityType)' scope='request' />
<bean:define id="active"  name='SearchAgents'  property='answer(Entity::Equals::Active)' scope='request' />



<%
	String encodedType = java.net.URLEncoder.encode(""+type);
%>



<tr><td height="6px" colspan="8" >&nbsp;</td>
<td><html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID " />
</td></tr>
<tr>
		<td  class="links"  colspan="7">		
		<logic:present name="prevEntity"  scope="request" >
		<a href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&answer(1*Entity::Equals::SearchObjectType)=AGENCY&entityType=AGENT&answer(1*Entity::Equals::SearchObjectId)=<%=""+agencyId%>&LimitSearch=yes&answer(Entity::Equals::EntityId)=<%=entityId%>&answer(Entity::Like::FirstName)=<%=fname%>&answer(Entity::Like::LastName)=<%=lname%>&answer(Object::Entity::TotalRec)=<%=TotalRec%>&answer(Entity::Equals::EntityType)=<%=encodedType%>&answer(Entity::Equals::Active)=<%=active%>&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID"><bean:message key="Common.Previous"/></a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="3">
		<logic:present name="moreEntity"  scope="request" >
		<a href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&answer(1*Entity::Equals::SearchObjectType)=AGENCY&entityType=AGENT&answer(1*Entity::Equals::SearchObjectId)=<%=""+agencyId%>&LimitSearch=yes&answer(Entity::Equals::EntityId)=<%=entityId%>&answer(Entity::Like::FirstName)=<%=fname%>&answer(Entity::Like::LastName)=<%=lname%>&answer(Object::Entity::TotalRec)=<%=TotalRec%>&answer(Entity::Equals::EntityType)=<%=encodedType%>&answer(Entity::Equals::Active)=<%=active%>&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">Next&gt;&gt;</a>
		</logic:present>
		</td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr >
		
		<td class="sectionhead"  width="2%">No.</td>
		 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
      <td class="sectionhead" width="20%">
      Agent Id
	  </td>
	  
	  <td class="sectionhead" width="20%">
      Agent Number
	  </td>

</dmshtml:dms_static_with_connector>
		<td class="sectionhead" width="15%">Agency Number</td>
		<td class="sectionhead" width="15%">First Name</td>
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
	<a href="../EditAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />"><IMG SRC="../Images/submit.gif" WIDTH="30" HEIGHT="10" BORDER="0" ALT=""></a>

	</td> -->

	<td class="SearchResult">
	<a href="../EditAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />"><%=++i%></a>
	
	</td>
	
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
<td class="SearchResult">
			<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />
			</td>
			<td class="SearchResult">
			<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityNum)' />
			</td>
</dmshtml:dms_static_with_connector>

	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::AgencyId)" />
	&nbsp;
	</td>

	<td class="SearchResult" >
	<a href="../EditAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />"><bean:write name="searchresultnewDisplay" property="answer(Object::Entity::FirstName)" /></a>
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
		<!--%request.removeAttribute("FindAgents");%-->
<tr><td colspan="6" >&nbsp;</td></tr>


<tr>
		<td  class="links"  colspan="7">		
		<logic:present name="prevEntity"  scope="request" >
		<a href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&answer(1*Entity::Equals::SearchObjectType)=AGENCY&entityType=AGENT&answer(1*Entity::Equals::SearchObjectId)=<%=""+agencyId%>&LimitSearch=yes&answer(Entity::Equals::EntityId)=<%=entityId%>&answer(Entity::Like::FirstName)=<%=fname%>&answer(Entity::Like::LastName)=<%=lname%>&answer(Object::Entity::TotalRec)=<%=TotalRec%>&answer(Entity::Equals::EntityType)=<%=encodedType%>&answer(Entity::Equals::Active)=<%=active%>&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID"><bean:message key="Common.Previous"/></a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="3">
		<logic:present name="moreEntity"  scope="request" >
		<a href="../SearchAgents.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&answer(1*Entity::Equals::SearchObjectType)=AGENCY&entityType=AGENT&answer(1*Entity::Equals::SearchObjectId)=<%=""+agencyId%>&LimitSearch=yes&answer(Entity::Equals::EntityId)=<%=entityId%>&answer(Entity::Like::FirstName)=<%=fname%>&answer(Entity::Like::LastName)=<%=lname%>&answer(Object::Entity::TotalRec)=<%=TotalRec%>&answer(Entity::Equals::EntityType)=<%=encodedType%>&answer(Entity::Equals::Active)=<%=active%>&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">Next&gt;&gt;</a>	
		</logic:present>
		</td>
</tr>

<tr>
	<td><html:hidden property="answer(Entity::Equals::EntityType)" value="AGENT" />
	<html:hidden property="entityType" value="AGENT" />
	<html:hidden property="LimitSearch" value="yes" />
	<html:hidden property="answer(Object::Entity::PageNum)" value="<%=""+pagenum%>"/>
	</td>
</tr>

</logic:present>
<tr><td colspan="6" >&nbsp;</td></tr>
<!-- /logic:present-->		

</table>
</td>
</tr>

<tr><td align="center">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>


<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />

</td></tr>

</table>


</html:form>
