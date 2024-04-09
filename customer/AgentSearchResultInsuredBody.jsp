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
<script type="text/javascript" src="../Scripts/JScripts/AgencyFindPopup.js"></script>
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
		<%String formName= "" + request.getParameter("formNameAgencyFind") ;
		 String agencyId="" + request.getParameter("answer(Agency::AgencyId)") ;
		 String businessName="" + request.getParameter("Object::AGENCY::BUSINESSNAME") ;
		 String businessNameEncoded=businessName.replaceAll("'","\\\\'");
		 System.out.println("businessNameEncoded::"+businessNameEncoded);
		 String agentFunctionNone="setAgencyAgentInfo('','','','','','"+agencyId+"','"+businessNameEncoded+"','','','');";
		 System.out.println("business agentFunctionNone::"+agentFunctionNone);
		%>
 

<html:form action="/LinkAgencytoInsuredAction.go" onsubmit="submitToParent()">
<bean:define id="parentQuoteID" name="AddCustomer" property="answer(parentQuoteId)" />

	<table WIDTH="760PX" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td>&nbsp;</td></tr>

		<%if(parentQuoteID != null && parentQuoteID != "") {%>
		<td>
				<div id="QuoteInsuerdAgencyAgentHeader">
												<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
												<jsp:param name="parentQuoteId" value="<%=""+parentQuoteID%>" />
												<jsp:param name="paretQuoteStatus" value="<%="Issued"%>" />
												</jsp:include>
											</div>
			</td>
			<%}else{%>

		<tr><td  height="0"><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>
		<%} %>

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
				<table WIDTH="100%" ALIGN="left" CELLSPACING="2" CELLPADDING="2">
					<tr>
						<td colspan="4">
							<logic:notPresent name ='searchresultnewDisplay' scope ='request'>
								<span class="Error">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Currently no Agents are listed</span>
								<table WIDTH="760PX" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="2">
								<tr><td>&nbsp;</td></tr>

								<tr >
									<td class="sectionhead" >No.</td>
	 								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
										<td class="sectionhead" >Agent/Broker Contact Id</td>
										<td class="sectionhead" >Agent Number</td>
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
										<td class="altdisply">-1</td>
									</dmshtml:dms_static_with_connector>
								
									<td class="altdisply">-1</td>
										
									<td class="altdisply" >None</td>
										
									<td class="altdisply" >None</td>
									
									<td class="altdisply" >  </td>
								
									<td class="altdisply">												
										<input type="radio" name="answer(AgentId)" value="-1" checked="checked" >
									 <script type="text/javascript">
												<%=agentFunctionNone%>
											</script>
									</td>
								</tr></table>		
							</logic:notPresent>

						</td>
					</tr>

					<tr><td>&nbsp;</td></tr>
 

				<logic:present name ='searchresultnewDisplay' scope ='request'>


					<bean:define id="pagenum" name='pagenum' scope='request'/>
					<bean:define id="totpagenum" name='totpagenum' scope='request'/>
					<tr>
						<td colspan="5" align="right" >
							<html:submit value="Select" styleClass="sbttn"/>
						</td>
					</tr>
					
					<tr>
						<td colspan="4" align="right" >&nbsp;</td>
					</tr>

					<tr>
						<td  class="links"  colspan="4">
							<logic:present name="prevEntity"  scope="request" >
								<a href="../LinkAgenttoInsuredAction.do?answer(IsPopupEnabledAgencyFind)=<%=""+request.getParameter("answer(IsPopupEnabledAgencyFind)")%>&formNameAgencyFind=<%=""+request.getParameter("formNameAgencyFind")%>&TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&Object::AGENCY::BUSINESSNAME=<%=""+businessName.replaceAll("&","%26") %>&answer(Agency::AgencyId)=<%=""+agencyId%>&answer(Agency::AgencyId)=<%=""+agencyId%>"><bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						<td align="right" class="links" colspan="3">
							<logic:present name="moreEntity"  scope="request" >
								<a href="../LinkAgenttoInsuredAction.do?answer(IsPopupEnabledAgencyFind)=<%=""+request.getParameter("answer(IsPopupEnabledAgencyFind)")%>&formNameAgencyFind=<%=""+request.getParameter("formNameAgencyFind")%>&TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&Object::AGENCY::BUSINESSNAME=<%=""+businessName.replaceAll("&","%26")%>&answer(Agency::AgencyId)=<%=""+agencyId%>">Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>


					<tr>
						<td class="sectionhead">No.</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
							<td class="sectionhead">Agent/Broker Contact Id</td>
							<td class="sectionhead">Agent Number </td>
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
	
					<% boolean checked=true; %>

					
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
							<bean:define id='agentId' name="searchresultnewDisplay"  property="answer(Object::Entity::EntityId)" />
							<bean:define id='agentFirstName' name="searchresultnewDisplay" property="answer(Object::Entity::FirstName)" />
							<bean:define id='agentMiddleName' name="searchresultnewDisplay" property="answer(Object::Entity::MiddleName)" />
							<bean:define id='agentLastName' name="searchresultnewDisplay" property="answer(Object::Entity::LastName)" />
							<bean:define id='agentNumber' name="searchresultnewDisplay" property="answer(Object::Entity::EntityNum)" /> 
							<bean:define id="StyleAgentBusinessID" name="searchresultnewDisplay" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)"></bean:define>
							<bean:define id="StyleAgentPhone" name="searchresultnewDisplay" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)"></bean:define>
							<bean:define id="StyleAgentFax" name="searchresultnewDisplay" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::Fax)"></bean:define>
							<!--<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" name="searchresultnewDisplay"  styleId="StyleAgentBusinessID"/> -->
							<% 
							String agentFunction="setAgencyAgentInfo('"+agentId+"','"+agentNumber+"','"+(""+agentFirstName).replaceAll("'","\\\\'") +"','"+(""+agentMiddleName).replaceAll("'","\\\\'") +"','"+(""+agentLastName).replaceAll("'","\\\\'")+"','"+agencyId+"','"+(""+businessName).replaceAll("'","\\\\'")+"','"+StyleAgentBusinessID+"','"+StyleAgentPhone+"','"+StyleAgentFax+"');";  
							%>
							
						
							<tr>
	   							<td class=<%= styleClass %>>
	   								<%=++i%>
									<bean:define id="agentSel" name="AddCustomer" property="answer(AgentId)" scope="session" />
									<%	  agentSel="";
									  if(agentSel!=null && !agentSel.toString().equals("")){
										if(Long.parseLong(agentSel.toString()) > 0){
									    	checked=false;
										}
										else{
									   	 if(i==1 || i == ((pageCount*20)+1)){
									       checked=true ;
									     }
										}
									  }
									%>
								</td>
										<%	
										  if(agentSel!=null && !agentSel.toString().equals("")){		
											if(  Long.parseLong(agentSel.toString()) ==Long.parseLong(agentId.toString()) )
											
											{
											    checked=false;
											}
											else{
											    if(i==1 || i == ((pageCount*20)+1))
											        
											    {
											       checked=true ;
											    }
											}
										  }
										%>
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
									<td class=<%= styleClass %>>
										<%=agentId.toString()%>
									</td> 
									<td class=<%= styleClass %>>
									<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::EntityNum)" />&nbsp;
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
							                
									<input type="radio" name="answer(AgentId)" value="<%=""+count%>" checked="checked" onclick="<%=agentFunction%>" >
							              <script type="text/javascript">
												<%=agentFunction%>
											</script>
							                <%checked=false;
							                        }else{
							                %> 
									<html:radio property="answer(AgentId)" value="<%=""+count%>" onclick="<%=agentFunction%>" >
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
								<td class="altdisply"><%="-1"%></td> 
						</dmshtml:dms_static_with_connector>
		
						<td class="altdisply" >None</td>
		
						<td class="altdisply" >None</td>
						
						<td class="altdisply" ></td>

						<td class="altdisply" width="10">
							<dmshtml:dms_radio property="answer(AgentId)" value="-1" onclick="<%=agentFunctionNone%>">
							</dmshtml:dms_radio> 
						</td>
						<% i=0;%>
					</tr>


					<tr>
						<td  class="links"  colspan="4">
							<logic:present name="prevEntity"  scope="request" >
								<a href="../LinkAgenttoInsuredAction.do?answer(IsPopupEnabledAgencyFind)=<%=""+request.getParameter("answer(IsPopupEnabledAgencyFind)")%>&formNameAgencyFind=<%=""+request.getParameter("formNameAgencyFind")%>&TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&Object::AGENCY::BUSINESSNAME=<%=""+businessName.replaceAll("&","%26")%>&answer(Agency::AgencyId)=<%=""+agencyId%>"><bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						<td align="right" class="links" colspan="3">
							<logic:present name="moreEntity"  scope="request" >
								<a href="../LinkAgenttoInsuredAction.do?answer(IsPopupEnabledAgencyFind)=<%=""+request.getParameter("answer(IsPopupEnabledAgencyFind)")%>&formNameAgencyFind=<%=""+request.getParameter("formNameAgencyFind")%>&TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&Object::AGENCY::BUSINESSNAME=<%=""+businessName.replaceAll("&","%26")%>&answer(Agency::AgencyId)=<%=""+agencyId%>">Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>
					
				</logic:present>
					<tr>
						<td colspan="4" align="right" >&nbsp;</td>
					</tr>
					
					<tr>
						<td colspan="5" align="right" >
							<html:submit value="Select" styleClass="sbttn"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />





</html:form>