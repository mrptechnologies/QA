
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/LinkAgenttoUser">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>	
<bean:define id="fName" property="answer(Entity::Like::FirstName)" name="AddUser" />	
<bean:define id="lName" property="answer(Entity::Like::LastName)" name="AddUser" />	

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td class="MH">&nbsp;AGENT LIST</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="links"></td>
		</tr>
		<tr>
			<td colspan="4">
			<hr size="1" noshade>
			</td>
		</tr>
		<tr>
			<td valign="top">
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
				CELLPADDING="0">

				<tr>
					<td colspan="6"></td>
				</tr>

				<tr>
					<td class="TextMatter" colspan="6"><b> <logic:present
						name='countSearchResult' scope='request'>
Total Number of Agents &nbsp;&nbsp;<%=request.getAttribute("countSearchResult").toString()%></b>
					</logic:present> <logic:notPresent name='countSearchResult' scope='request'>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="Error">No Matching Records Found.</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
						</tr>

					</logic:notPresent> <logic:present name='searchresultnewDisplay' scope='request'>


						<bean:define id="pagenum" name='pagenum' scope='request' />
						<bean:define id="totpagenum" name='totpagenum' scope='request' />
						<tr>
							<td height="6px" colspan="8">&nbsp;</td>
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
					
				
				<tr><td colspan="8" align="right" class="Links"><html:submit
					value="Select" styleClass="sbttn" /></td></tr>
				<tr>
					<td colspan="8">&nbsp;</td>
				</tr>
				<tr>
					<td class="links" colspan="6"><logic:present name="prevEntity"
						scope="request">
						<a
							href="../SearchAgentsForUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&answer(Entity::Like::FirstName)=<%=""+fName %>&answer(Entity::Like::LastName)=<%=lName %>&LimitSearch=yes&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>"><bean:message
							key="Common.Previous" /></a>
					</logic:present></td>
					<td align="right" class="links" colspan="2"><logic:present
						name="moreEntity" scope="request">
						<a
							href="../SearchAgentsForUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&answer(Entity::Like::FirstName)=<%=""+fName %>&answer(Entity::Like::LastName)=<%=lName %>&LimitSearch=yes&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>">Next&gt;&gt;</a>
					</logic:present></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>

					<td class="sectionhead" width="2%">No.</td>
					<td class="sectionhead" width="25%">First Name</td>
					<td class="sectionhead" width="10%">Middle Name</td>
					<td class="sectionhead" width="15%">Last Name</td>
					<td class="sectionhead" width="15%">City</td>
					<td class="sectionhead" width="5%">State</td>
					<td class="sectionhead" width="15%">E-mail</td>
					<td class="sectionhead" width="15%">Select</td>

				</tr>


				<logic:iterate id="searchresultnewDisplay"
					name="searchresultnewDisplay" scope="request">
					<tr>
						<!-- <td class="SearchResult">
	<a href="../EditAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />"><IMG SRC="../Images/submit.gif" WIDTH="30" HEIGHT="10" BORDER="0" ALT=""></a>

	</td> -->

						<td class="SearchResult"><a
							href="../EditAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />"><%=++i%></a>

						</td>

						<td class="SearchResult"><a
							href="../EditAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />"><bean:write
							name="searchresultnewDisplay"
							property="answer(Object::Entity::FirstName)" /></a> &nbsp;</td>
						<td class="SearchResult"><bean:write
							name="searchresultnewDisplay"
							property="answer(Object::Entity::middleName)" /> &nbsp;</td>

						<td class="SearchResult"><bean:write
							name="searchresultnewDisplay"
							property="answer(Object::Entity::LastName)" /> &nbsp;</td>
						<td class="SearchResult"><bean:write
							name="searchresultnewDisplay"
							property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)" />
						&nbsp;</td>
						<td class="SearchResult"><bean:write
							name="searchresultnewDisplay"
							property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::State)" />
						&nbsp;</td>
						<td class="SearchResult"><bean:write
							name="searchresultnewDisplay"
							property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" />
						&nbsp;</td>
						<bean:define id="AgentId" name="searchresultnewDisplay"
							property="answer(Object::Entity::EntityId)" />
						<td class="SearchResult" align="center"><dmshtml:dms_radio
							property="answer(Agent::AgentId)" value="<%=AgentId.toString()%>">
						</dmshtml:dms_radio></td>
					</tr>
				</logic:iterate>
				<% i=0;%>
				<!--%session.removeAttribute("FindAgents");%-->

				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>

				<tr>
					<td class="links" colspan="6"><logic:present name="prevEntity"
						scope="request">
						<a
							href="../SearchAgentsForUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&answer(Entity::Like::FirstName)=<%=""+fName %>&answer(Entity::Like::LastName)=<%=lName %>&LimitSearch=yes&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>"><bean:message
							key="Common.Previous" /></a>
					</logic:present></td>
					<td align="right" class="links" colspan="2"><logic:present
						name="moreEntity" scope="request">
						<a
							href="../SearchAgentsForUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&answer(Entity::Like::FirstName)=<%=""+fName %>&answer(Entity::Like::LastName)=<%=lName %>&LimitSearch=yes&answer(Entity::Equals::EntityType)=AGENT&entityType=AGENT&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>">Next&gt;&gt;</a>
					</logic:present></td>
				</tr>


				<!--/logic:present-->

				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>
				</logic:present>
				<tr>


					<td colspan="8" align="right" class="Links"><html:submit
						value="Select" styleClass="sbttn" /></td>

				</tr>
			</table>
			</td>
		</tr>
		
		<tr>
			<td align="center"><html:hidden property="answer(dbname)"
				value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
			</td>
		</tr>

	</table>
	
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
