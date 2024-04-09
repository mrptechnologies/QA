<!--
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
-->
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/LinkAgencytoEditAgent.do">
<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">

<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td class="MH">AGENCIES FOUND IN SEARCH</td></tr>


<tr><td><hr size="1" noshade ></td></tr>

<logic:present name ='searchresultnewDisplay' scope ='request'>
<bean:define id="pagenum" name='pagenum' scope='request'/>
<bean:define id="totpagenum" name='totpagenum' scope='request'/>
<tr><td>
<table WIDTH="75%" ALIGN="center" cellspacing=0 cellpadding="2">


<tr><td colspan="2" >&nbsp;</td></tr>
<tr>
		<td align="Left" class="links" colspan="3">
		
		<logic:present name="prevAgency"  scope="request" >
		<a href="../AgencyForEditAgentSearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>"><bean:message key="Common.Previous"/></a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="3">
		<logic:present name="moreAgency"  scope="request" >

		<a href="../AgencyForEditAgentSearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>">Next&gt;&gt;</a>
		</logic:present>
		</td>
	</tr>
	<tr >
      <td class="sectionhead" width="8%">
      <bean:message key="CustomerSearchResult.SlNo"/>
	  </td>
	  <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
	  <td class="sectionhead" width="25%">
		Agency Id</td>
		</dmshtml:dms_static_with_connector>
		<td class="sectionhead" width="50%">
		Agency Name</td>
		<td class="sectionhead" width="10%">
		Select</td>
		
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
<logic:iterate id="qmap" name="searchresultnewDisplay" scope="request" type="com.dms.ejb.data.QuestionHashMap">
	<tr>
	   <td class="SearchResult">
	 <%=++i%>
	   </td>
	   <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
		<td class="SearchResult">
		<%=qmap.getString("Object::AGENCY::AGENCYID")%>
		</td> 
		</dmshtml:dms_static_with_connector>
	<td class="SearchResult" >
				 <%=qmap.getString("Object::AGENCY::BUSINESSNAME")%>
		</td>
 
		 <td class="SearchResult" align="center" >
	<dmshtml:dms_radio property="answer(Agency::AgencyId)" value="<%=qmap.getString("Object::AGENCY::AGENCYID")%>" >
	</dmshtml:dms_radio> 

		</td>
		
		
		
	</tr>
		</logic:iterate>
<tr>
		<td align="Left" class="links" colspan="3">
		
		<logic:present name="prevAgency"  scope="request" >
		<a href="../AgencyForEditAgentSearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>"><bean:message key="Common.Previous"/></a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="3">
		<logic:present name="moreAgency"  scope="request" >

		<a href="../AgencyForEditAgentSearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>">Next&gt;&gt;</a>
		</logic:present>
		</td>
	</tr>		
		
		<tr><td colspan="2" >&nbsp;</td></tr>
<tr>
		<td align="left" class="links" colspan="3">
		
		
		</td>
		<td align="right" class="links" colspan="3">
		
		</td>
	</tr>
 	
</table>
</td></tr>



<tr><td align="center"><html:submit value="Select" property="answer(Select)" styleClass="sbttn"/>&nbsp;&nbsp;<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/></td><tr>

</logic:present>

<logic:notPresent name ='searchresultnewDisplay' scope ='request'>
<tr>
	<td class="Error" >No Agency Found</td></tr>
	<tr><td align="center"><dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/></td></tr>
</logic:notPresent>



</table>
 
 <html:hidden property="LimitSearch" value="yes" />
<html:hidden styleId="inpPageNum" property="answer(Object::Agency::PageNum)" value="0"/>
<html:hidden styleId="orderby" property="answer(Agency::orderBy)" value="DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID "/>
 <html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
