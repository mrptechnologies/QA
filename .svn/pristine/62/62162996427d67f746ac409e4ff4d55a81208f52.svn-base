<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:form action="/LinkAgencytoCustomerAction">
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td>&nbsp;</td></tr>

		<tr><td><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>

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

		<tr>
			<td class="sectionhead"  align="center">
				page <%=(Integer.parseInt(""+pagenum)+1)%> of <%=(Integer.parseInt(""+totpagenum))%>
			</td>
		</tr>

		<tr>
			<td valign="top">
				<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td colspan="4">
							<logic:notPresent name ='searchresultnewDisplay' scope ='request'>
								<span class="Error">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Currently no Agents are listed</span>
								<table WIDTH="1200PX" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr><td>&nbsp;</td></tr>

								<tr >
									<td class="sectionhead" >No.</td>
	 								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
										<td class="sectionhead" >Agent Id</td>
									</dmshtml:dms_static_with_connector>
									<td class="sectionhead" >Agent First Name</td>
									<td class="sectionhead">Agent Last Name</td>
									<td class="sectionhead">Select</td>
								</tr>
								
								<tr>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
										<td class="SearchResult">
											<%="-1"%>
										</td> 
									</dmshtml:dms_static_with_connector>
								
									<td class="SearchResult">1</td>
										
									<td class="SearchResult" >None</td>
										
									<td class="SearchResult" >None</td>
								
									<td class="SearchResult">							
										<dmshtml:dms_radio property="answer(AgentId)" value="-1" >
										</dmshtml:dms_radio> 
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
						<td colspan="4" align="right" >
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
								<a href="../LinkAgenttoCustomerAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>"><bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						<td align="right" class="links" colspan="3">
							<logic:present name="moreEntity"  scope="request" >
								<a href="../LinkAgenttoCustomerAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>">Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>


					<tr>
						<td class="sectionhead">No.</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
							<td class="sectionhead" >Agent Id</td>
						</dmshtml:dms_static_with_connector>
						<td class="sectionhead">Agent First Name</td>
						<td class="sectionhead">Agent Last Name</td>
						<td class="sectionhead">Select</td>
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
	
					<% boolean checked=false; %>


					<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request" >
						<bean:define id='test' name="searchresultnewDisplay"  property="answer(Object::Entity::EntityId)" />
							<tr>
	   							<td class="SearchResult">
	   								<%=++i%>
									<bean:define id="agentSel" name="AddCustomer" property="answer(AgentId)" scope="session"/>

									<%	  
									if(Long.parseLong(agentSel.toString()) > 0)
									
									{
									    checked=false;
									}
									else{
									    if(i==1)
									        
									    {
									       checked=true ;
									    }
									}
									%>
								</td>
								
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
									<td class="SearchResult">
			
										<%	  
										if(  Long.parseLong(agentSel.toString()) ==Long.parseLong(test.toString()) )
										
										{
										    checked=false;
										}
										else{
										    if(i==1)
										        
										    {
										       checked=true ;
										    }
										}
										%>
	
										<%=test.toString()%>
									</td> 
								</dmshtml:dms_static_with_connector>
								
								<td class="SearchResult" >
									<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::FirstName)" />&nbsp;
								</td>
		
								<td class="SearchResult" >
									<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::LastName)" />&nbsp;
								</td>

		
								<td class="SearchResult">
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
						<td class="SearchResult">
							<%=(i+1)%>
						</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
							<td class="SearchResult"><%="-1"%></td> 
						</dmshtml:dms_static_with_connector>
		
						<td class="SearchResult" >None</td>
		
						<td class="SearchResult" >None</td>

						<td class="SearchResult" width="10">
							<dmshtml:dms_radio property="answer(AgentId)" value="-1" >
							</dmshtml:dms_radio> 
						</td>
						<% i=0;%>
					</tr>


					<tr>
						<td  class="links"  colspan="4">
							<logic:present name="prevEntity"  scope="request" >
								<a href="../LinkAgenttoCustomerAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>"><bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						<td align="right" class="links" colspan="3">
							<logic:present name="moreEntity"  scope="request" >
								<a href="../LinkAgenttoCustomerAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>">Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>
					
				</logic:present>

<!--  -->
					<tr>
						<td colspan="4" align="right" >&nbsp;</td>
					</tr>
					
					<tr>
						<td colspan="4" align="right" >
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

