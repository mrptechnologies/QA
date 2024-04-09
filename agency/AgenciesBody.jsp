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
<!--<html:html>-->
<!-- <link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<head>
<title><%=session.getAttribute("PageTitle")%> - Agencies</title>

</head>-->
<!-- <body>-->
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">

	<tr><td>&nbsp;</td></tr>
	<tr><td class="MH">
			AGENCIES
	</td></tr>
	<tr><td class="TextMatter">
		<bean:message key="Agencies.ModDesc"/><br>
	</td></tr>
	<tr><td><hr size="1" noshade ></td></tr>
	<logic:present name="msgInfo" scope="request">
	<tr>
		<td class="Error">
		<%=request.getAttribute("msgInfo")%>
		</td>
	</tr>
	</logic:present>
	<tr><td>&nbsp;</td></tr>

	<tr><td>
		<table WIDTH="85%" ALIGN="center" cellspacing=0 cellpadding="4">
			<tr><td class="links" colspan="3"><img SRC="../Images/rtg_rate.gif"  alt="">&nbsp;&nbsp;<a href="../AgencyLink.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&clear=yes"><bean:message key="Agencies.AddAgency"/></a></td></tr>
 			<logic:notPresent name="searchresultnewDisplay" scope="request"> 
  				<tr><td class="Error" colspan="3">Currently no Agencies have been added.</td></tr>
  				<tr><td colspan="3" >&nbsp;</td></tr>
  			</logic:notPresent>

		 
			<logic:present name="searchresultnewDisplay" scope="request">
				<bean:define id="pagenum" name='pagenum' scope='request'/>
				<bean:define id="totpagenum" name='totpagenum' scope='request'/>
	  			<tr><td colspan="3" class="Error" align="center"><bean:message key="Agencies.ExistingAgencies"/></td></tr>
				<logic:present name="countSearchResult" scope="session">
					<bean:define id="agencySize1" name="countSearchResult" scope="session"/>
					<tr><td class="FormLabels" colspan="3">No of Agencies Found:&nbsp;<%=agencySize1.toString()%></td><tr>
				</logic:present>
				<tr><td>&nbsp;</td></tr>



		    <tr>
				<td align="Left" class="links" colspan="3">
				<logic:present name="prevAgency"  scope="request" >
					<a href="../ListOfAgency.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>"><bean:message key="Common.Previous"/></a>
				</logic:present>
				</td>
				<td align="right" class="links" colspan="3">
				<logic:present name="moreAgency"  scope="request" >
					<a href="../ListOfAgency.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>">Next&gt;&gt;</a>
				</logic:present>
				</td>
	  	 </tr>
		 <tr><td>&nbsp;</td></tr>
		 <tr>
      		<td class="sectionhead" width="10%">
      			<bean:message key="GeneralAgencies.SlNo"/>
	  		</td>
			<td class="sectionhead" width="70%">
				<bean:message key="Agencies.Name"/>
			</td>
			<td class="sectionhead" width="15%">
				State
			</td>
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
  			<td class="SearchResult" >
				<a href="../EditAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&agencyId=<%=qmap.getString("Object::AGENCY::AGENCYID")%>&primaryObjectId=<%=qmap.getString("Object::AGENCY::AGENCYID")%>&primaryObjectType=AGENCY"><%=qmap.getString("Object::AGENCY::BUSINESSNAME")%></a>
	
			</td>
	 			<td class="SearchResult"><%=qmap.getString("Object::AGENCY::AddressState")%>
	 		</td>
	  </tr>
	</logic:iterate>
	</logic:present>
	<tr><td colspan="3">&nbsp;</td></tr>

 	
	</table>
  </td></tr>
  <tr><td>&nbsp;</td></tr>

</table>
  <html:hidden property="answer(1*Entity::Equals::SearchObjectType)" value="AGENCY" />
   
  <html:hidden property="entityType" value="AGENT" />
  <html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" />	

	<html:hidden property="LimitSearch" value="yes" />
	<html:hidden styleId="inpPageNum" property="answer(Object::Agency::PageNum)" value="0"/>
	<html:hidden styleId="orderby" property="answer(Agency::orderBy)" value="DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID "/>
  <html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<!-- </body>-->
<!--</html:html>-->
