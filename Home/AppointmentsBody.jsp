
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/DeleteConfirmAction">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">APPOINTMENT REQUEST LOG</td></tr>
		<tr><td class="TextMatter">
			<bean:message key="Appointment.ModDesc"/>
		</td></tr>
		<tr><td><hr size="1" noshade ></td></tr>
		
		<tr>
			<td valign="top">
				<table WIDTH="580px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td colspan="6">
							<logic:notPresent name ='searchresultnewDisplay' scope ='session'>
								<span class="Error">Currently no appointment requests submitted by agents.</span>
							</logic:notPresent>
						</td>
					</tr>
					<tr>
						<td class="TextMatter" colspan="6">
							<b><logic:present name ='countSearchResult' scope ='session'>
									Total Number of Appointment Requests &nbsp;&nbsp;<%=session.getAttribute("countSearchResult").toString()%>
							</logic:present></b>
						</td>
					</tr>

					<logic:present name ='searchresultnewDisplay' scope ='session'>
						<tr>
							<td height="6px" colspan="6" >&nbsp;</td>
						</tr>
						
						<tr>
							<td  class="links"  colspan="3">
								<logic:present name="minimumValueEntity"  scope="session" >
									<a href="../NavigateEntitySearchResultAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=de&index=<bean:write name='minRangeEntity' scope='session'/>">
										<bean:message key="Common.Previous"/>
									</a>
								</logic:present>
							</td>
							<td align="right" class="links" colspan="3">
								<logic:present name="maxRangeEntity"  scope="session" >
									<a href="../NavigateEntitySearchResultAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=incre&index=<bean:write name='maxRangeEntity' scope='session'/>">
										<bean:message key="Common.Next"/></a>
								</logic:present>
							</td>
						</tr>
	
						<tr>
							<td colspan="6" >&nbsp;</td>
						</tr>
						
						<tr>
							<td colspan="6" align="center" class="Error" ><bean:message key="Appointments.existing"/></td>
						</tr>
					
						<tr>
							<td colspan="6" >&nbsp;</td>
						</tr>
					
						<tr>							
					    	<td class="display" width="8%"><bean:message key="Appointments.SlNo"/></td>
							<td width="25%" class="display">First Name</td>
	  						<td width="20%" class="display">Last Name</td>
	 						<td width="20%" class="display">Submission Date</td>
	 						<td width="15%" class="display" align="center">Status</td>
	  		                <td class="display" width="10%" align="center">Select</td>
						</tr>
						<% int i=1;%>
							<logic:present name="minimumValueEntity"  scope="session" >
								<bean:define id="slno" name='minRangeEntity' scope='session'/>
								<%
									try{
   										i=Integer.parseInt(slno.toString());
										if(i!=1){
											i++;
										}
  									}catch(NumberFormatException nfe)
  									{
	 									i=1;
 									}
								%>
							</logic:present>
	

							<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="session" >
								<tr>
	   								<td class="SearchResult">
	  									<%=i%>
										<% i++; %>
	   								</td>
									<td class="SearchResult" >
										<a href="../EditAppointment.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />&formName=MicacareEntity::AddAppointment">
		 									<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::FirstName)" />
		 								</a>
									</td>	
		
									<td class="SearchResult" >		
										<a href="../EditAppointment.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />&formName=MicacareEntity::AddAppointment">
										 	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::LastName)" />
										</a>
									</td>
									
									<td class="SearchResult" >		
					 					<a href="../EditAppointment.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />&formName=MicacareEntity::AddAppointment">
											<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::CreatedDate)" />
										</a>
									</td>
									
									<td class="SearchResult" >		
										 <a href="../EditAppointment.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />&formName=MicacareEntity::AddAppointment">
											 <bean:write  name='searchresultnewDisplay' property='answer(Object::EntityAdditional::Status)'/>
											 	 &nbsp;</a>
									</td>
									
									<td class="SearchResult" align="center">
										<bean:define id='test' name="searchresultnewDisplay"  property="answer(Object::Entity::EntityId)" />
											<dmshtml:dms_multibox property="answer(Object::Entity::Id)" value = "<%=test.toString() %>" >
											</dmshtml:dms_multibox> 
								   	</td>
								</tr>		
							</logic:iterate>
							
							<% i=0;%>		
							<tr><td colspan="6" >&nbsp;</td></tr>
								
							<tr>
								<td colspan="6" align="right">
									<html:submit value="Delete" styleClass="sbttn"/>
								</td>
							</tr>&nbsp;&nbsp;
							
							<tr><td colspan="6" >&nbsp;</td></tr>
					</logic:present>
				</table>
			</td>
		</tr>
	</table>
	
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
	<html:hidden property="answer(entityType)" value="AGENT" />
	<html:hidden property="answer(objectType)" value="ENTITY" />
	
</html:form>


