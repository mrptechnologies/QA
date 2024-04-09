<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
		<bean:define id="agencyId" name="QuickQuote" property="answer(Agency::AgencyId)" scope="request"/>
		
<html:form action="/LinkAgencttoCustomerActionForQuickQuote.do">

	<table WIDTH="760PX" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td>&nbsp;</td></tr>

		<tr><td height="5"> </td></tr>
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">AGENT LIST</td>
		</tr>


		<tr><td>&nbsp;</td></tr>

		<bean:define id="pagenum" name='pagenum' scope='request'/>
		<bean:define id="totpagenum" name='totpagenum' scope='request'/>
		<%String strcnt="";%>
		<logic:present name ='countSearchResult' scope ='request'>
			<bean:define id="countSearchResult1" name="countSearchResult" scope="request"/>
			<%strcnt=""+countSearchResult1;%>
		</logic:present>


		<tr>
			<td class="sectionhead" >
				<b>Total Number of Agent(s) Found &nbsp;&nbsp;<%=strcnt%></b>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td class="sectionhead"  align="center">
				Page <%=(Integer.parseInt(""+pagenum)+1)%> of <%=(Integer.parseInt(""+totpagenum))%>
			</td>
		</tr>

		<tr>
			<td valign="top">
				<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="2">
					<tr>
						<td colspan="4">
							<logic:notPresent name ='searchresultnewDisplay' scope ='request'>
								<span class="Error">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Currently no Agents are listed</span>
								<table WIDTH="760PX" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="2">
								<tr><td>&nbsp;</td></tr>

								<tr>
									<td class="sectionhead" >No.</td>
	 								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
										<td class="sectionhead" >Agent/Broker Contact Id</td>
									</dmshtml:dms_static_with_connector>
									<td class="sectionhead" >Agent First Name</td>
									<td class="sectionhead">Agent Last Name</td>
									<td class="sectionhead">E-MailID</td>
									<td class="sectionhead">Select</td>
								</tr>
								
								<tr><td></td></tr>
								
								<tr>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
										<td class="altdisply">
											<%="1"%>
										</td> 
									</dmshtml:dms_static_with_connector>
								
									<td class="altdisply">-1</td>
										
									<td class="altdisply" >None</td>
										
									<td class="altdisply" >None</td>
									<td class="altdisply" >  </td>
								
									<td class="altdisply">							
										<input type="radio" name="answer(AgentId)" value="-1" checked="checked" >
									</td>
								</tr></table>		
							</logic:notPresent>

						</td>
					</tr>

					<tr><td>&nbsp;</td></tr>
 

				<logic:present name ='searchresultnewDisplay' scope ='request'>


					<bean:define id="pagenum" name='pagenum' scope='request'/>
					<bean:define id="totpagenum" name='totpagenum' scope='request'/>

	<!--  -->
					<tr>
						<td colspan="5" align="right" >
							<html:submit value="Select" styleClass="sbttn"/>
						</td>
					</tr>
					
					<tr>
						<td colspan="4" align="right" >&nbsp;</td>
					</tr>
	<!--  -->

					<tr>
						<td  class="links"  colspan="4">
							<logic:present name="prevEntity"  scope="request" >
								<a href="../FindAgenttoQuickQuoteAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(Entity::Equals::EntityType)=<%="Agent"%>&answer(Agency::AgencyId)=<%=(Integer.parseInt(""+agencyId))%>&answer(Entity::Equals::SearchObjectId)=<%=(Integer.parseInt(""+agencyId))%>&answer(Entity::Equals::SearchObjectType)=<%="AGENCY"%>&answer(Entity::orderBy)=<%="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID"%>"><bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						<td align="right" class="links" colspan="3">
							<logic:present name="moreEntity"  scope="request" >
								<a href="../FindAgenttoQuickQuoteAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(Entity::Equals::EntityType)=<%="Agent"%>&answer(Agency::AgencyId)=<%=(Integer.parseInt(""+agencyId))%>&answer(Entity::Equals::SearchObjectId)=<%=(Integer.parseInt(""+agencyId))%>&answer(Entity::Equals::SearchObjectType)=<%="AGENCY"%>&answer(Entity::orderBy)=<%="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID"%>">Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>


					<tr>
						<td class="sectionhead">No.</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
							<td class="sectionhead">Agent/Broker Contact Id</td>
						</dmshtml:dms_static_with_connector>
						<td class="sectionhead">Agent First Name</td>
						<td class="sectionhead">Agent Last Name</td>
						<td class="sectionhead">E-MailID</td>
						<td class="sectionhead">Select</td>
					</tr>

					<% int i=0;%>
					<% int count=0; %>
					
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
	
					<% boolean checked=false; %>


					<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request" >
						<% count++; %>
						<%int pageCount =Integer.parseInt(""+pagenum); %>
						<% 		
							String styleClass="";
							if(count%2==0){
								styleClass = "altdisply";
							}
							else{
								styleClass = "SearchResult";	
							}
						%>
						<bean:define id='test' name="searchresultnewDisplay"  property="answer(Object::Entity::EntityId)" />
							<tr>
	   							<td class=<%= styleClass %>>
	   								<%=++i%>
									<bean:define id="agentSel" name="QuickQuote" property="answer(AgentId)" scope="request"/>

									
								</td>
								
											
										<%	  
										
										%>
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
									<td class=<%= styleClass %>>
	
										<%=test.toString()%>
									</td> 
								</dmshtml:dms_static_with_connector>
								
								<td class=<%= styleClass %>>
									<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::FirstName)" />&nbsp;
								</td>
		
								<td class=<%= styleClass %>>
									<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::LastName)" />&nbsp;
								</td>
								
								<td class=<%= styleClass %>>
									<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" />&nbsp;
								</td>

		
								<td class=<%= styleClass %>>
									<%
							       			if(checked){ 
							                %> 
									<input type="radio" name="answer(AgentId)" value="<%=test.toString()%>" checked="checked" >
							                <%
							                        }else{
							                %> 
									<html:radio property="answer(AgentId)" value="<%=test.toString()%>" >
									</html:radio>
							                <%
							                        }
							                %>
								
								</td>
							</tr>		
					</logic:iterate>
					<tr>
						<td class="altdisply">
							<%=(i+1)%>
						</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
							<td class="altdisply"><%="-1"%></td> 
						</dmshtml:dms_static_with_connector>
		
						<td class="altdisply" >None</td>
		
						<td class="altdisply" >None</td>
						
						<td class="altdisply" ></td>

						<td class="altdisply" width="10">
							<dmshtml:dms_radio property="answer(AgentId)" value="-1" >
							</dmshtml:dms_radio> 
						</td>
						<% i=0;%>
					</tr>


					<tr>
						<td  class="links"  colspan="4">
							<logic:present name="prevEntity"  scope="request" >
								<a href="../FindAgenttoQuickQuoteAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(Entity::Equals::EntityType)=<%="Agent"%>&answer(Agency::AgencyId)=<%=(Integer.parseInt(""+agencyId))%>&answer(Entity::Equals::SearchObjectId)=<%=(Integer.parseInt(""+agencyId))%>&answer(Entity::Equals::SearchObjectType)=<%="AGENCY"%>&answer(Entity::orderBy)=<%="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID"%>"><bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						<td align="right" class="links" colspan="3">
							<logic:present name="moreEntity"  scope="request" >
								<a href="../FindAgenttoQuickQuoteAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(Entity::Equals::EntityType)=<%="Agent"%>&answer(Agency::AgencyId)=<%=(Integer.parseInt(""+agencyId))%>&answer(Entity::Equals::SearchObjectId)=<%=(Integer.parseInt(""+agencyId))%>&answer(Entity::Equals::SearchObjectType)=<%="AGENCY"%>&answer(Entity::orderBy)=<%="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID"%>">Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>
					
				</logic:present>

<!--  -->
					<tr> 
						<td colspan="4" align="right" >&nbsp;</td>
					</tr>
					
					<tr>
						<td colspan="5" align="right" >
							<html:hidden property="answer(Agency::AgencyId)" value='<%=""+agencyId%>'/>
							<html:submit value="Select" styleClass="sbttn"/>
						</td>
					</tr>
<!--  -->
				</table>
			</td>
		</tr>
	</table>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

</html:form>

