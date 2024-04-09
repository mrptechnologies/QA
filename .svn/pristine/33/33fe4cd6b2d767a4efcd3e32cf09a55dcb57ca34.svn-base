<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="AppStatus" name='AddApplication'
			property='answer(Object::Application::ApplicationStatus)' />
		<% 
	boolean readonly = false; %>
		<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED"}%>"
			value="<%=""+AppStatus%>" negated="true">
			<% readonly = true;%>
		</dmshtml:dms_isPresent>

<html:form action="/SaveApplication" onsubmit="return storeDateValues()">

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">



		<tr><td><html:hidden property="answer(dbname)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

		<tr>
			<td>
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2"
				CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<logic:present name="staleDataSubmissionMsg" scope="request">
					<tr>
						<td class="Error"><bean:message
							key="error.staleDataSubmissionMsg" /></td>
					</tr>
				</logic:present>



				<tr>
					<td height="5"></td>
				</tr>

				<tr>
					<td class="NewSectionHead" align="center">APPLICATION SUMMARY</td>
				</tr>


				<tr>
					<td>&nbsp;</td>
				</tr>
				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />

<bean:define id="applicationId" name='AddApplication'
			property='answer(Object::Application::ApplicationId)' scope="request" />
				<tr>
					<td>
					<hr size="1" noshade>
					</td>
				</tr>
				<tr>
					<td align="center">

					<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"
						CELLPADDING="2">
						<tr>
							<td align="center" class="sectionhead" colspan="2">&nbsp;
							APPLICATION DETAILS </td>

						</tr>

						<tr>
							<td class="links" align="left"><a
								href='../ListApplicationVersions.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ApplicationId)=<%=applicationId.toString()%>'>List
							Application Versions</a></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left" >Application Number</td>
								<td class="TextMatter" align="left"><html:text
								name='AddApplication'
								property="answer(Object::Application::ApplicationNum)" size="30"
								maxlength="30" styleClass="txtbox" disabled="<%=readonly%>"  /></td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Application Sub Number</td>
							<td class="TextMatter" align="left"><html:text
								name='AddApplication'
								property="answer(Object::Application::ApplicationSubNum)" size="30"
								maxlength="30" styleClass="txtbox" disabled="<%=readonly%>"  /></td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Application Name</td>
							<td class="TextMatter" align="left"><html:text
								name='AddApplication' property="answer(Object::Application::ApplicationName)"
								size="30" maxlength="30" styleClass="txtbox" disabled="<%=readonly%>"
								/></td>
						</tr>

						
						<tr>
							<td class="sectionhead1" align="left">Description</td>
							<td class="TextMatter" align="left">
							<html:textarea
								name='AddApplication' rows="4" cols="37"
								property="answer(Object::Application::ApplicationDesc)"
								styleClass="txtarea" disabled="<%=readonly%>" />
							
</td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left">Type</td>
								<td class="TextMatter" align="left">
							<dmshtml:get_parent_app_types nameInSession="arrAppTypes" ownerId="<%=Long.parseLong(""+ownerId)%>"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
								<html:select property="answer(Object::Application::ApplicationType)" name="AddApplication"
				styleClass="txtbox" disabled="<%=readonly%>">
							<logic:present name="arrAppTypes" scope="request">
           <bean:define id="appTypes" name="arrAppTypes" type="java.util.ArrayList"/>
					 					 <%for(int i=0;i<appTypes.size();i++) {
										%> 
											<html:option value ='<%=appTypes.get(i).toString()%>'>
										<%=appTypes.get(i).toString()%></html:option>
										<%}%>
					</logic:present>
		</html:select>
							</td>
						</tr>
						
							<tr>
							<td class="sectionhead1" align="left">Status</td>
							<td class="TextMatter" align="left"><html:select
								name="AddApplication"
								property="answer(Object::Application::ApplicationStatus)"
								styleClass="txtbox" disabled="<%=readonly%>">
								<html:option value='RELEASED'>Released</html:option>
								<html:option value='DEVELOPMENT'>Development</html:option>
								<html:option value='QA'>QA</html:option>
							</html:select></td>

						</tr>
	

						<tr>
							<td class="sectionhead1" align="left">Active</td>
							<td class="TextMatter" align="left"><html:select
								name='AddApplication' property="answer(Object::Application::Active)"
								styleClass="txtbox" disabled="<%=readonly%>"  >
								<html:option value='Y'>Active</html:option>
								<html:option value='D'>Inactive</html:option>
							</html:select></td>

						</tr>



					</table>

				<tr>
					<td align="center">&nbsp;</td>
				</tr>




				<tr>
					<td align="center" class="SearchResult">
					<table WIDTH="360px" ALIGN="center" BORDER="0"
						style="{border-width:1px; border-style:solid; border-color: #999999;}">

						<!-- Add/Remove Links Starts-->
						<tr>


							

								<td class="sectionhead" align="center">Associated Sub Applications</td>
						</tr>
<dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED"}%>"
						value="<%=""+AppStatus%>" negated="false">
						<tr>
								<td align="center" class="sectionheadLink"><a
									href="../application/LinkAppToSubapp.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Application::ApplicationId)=<%=applicationId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
								SubApplication</a></td></tr>
			</dmshtml:dms_isPresent> 
						<tr>
							<td class="SearchResult" width="33%" valign="top">
							<table width="100%">
								<dmshtml:get_app_subapps
						nameInSession="arrAppSubApps"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
applicationId="<%=Long.parseLong(""+applicationId)%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />

								<logic:present name="arrAppSubApps" scope="request">
									<logic:iterate id="subApps" name="arrAppSubApps" scope="request">
										<tr>
											<td class="SearchResult" align="center"><bean:define id='subApplicationId'
												name="subApps" property="subApplicationId" />
										<a href="../GetSubAppDetail.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(SubApplicationId)=<%=subApplicationId.toString()%>&answer(applicationId)=<%=applicationId.toString()%>&subApplicationId=<%=subApplicationId.toString()%>&applicationId=<%=applicationId.toString()%>&subAppDetail=subAppDetail&answer(subApplicationName)=<bean:write name="subApps" property="subApplicationName" />">
							<bean:write name="subApps" property="subApplicationName" /></a></td>
										</tr>
									</logic:iterate>
								</logic:present>
							</table>
							</td>
							</tr>
<dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED"}%>"
						value="<%=""+AppStatus%>" negated="false">
<tr>
								<td align="center" class="sectionheadLink"><a
									href="../application/LinkAppToSubapp.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Application::ApplicationId)=<%=applicationId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
								SubApplication</a></td></tr>

				</dmshtml:dms_isPresent> 
				

						
					</table>
					</td>
				</tr>





				<tr>
					<td align="center">&nbsp;</td>
				</tr>

				
			</table>
			</td>
		</tr>

		<tr>
			<td>
			<hr size="1" noshade width="95%">
			</td>
		</tr>

	<tr>
					<td align="center">&nbsp;</td>
				</tr>
					<tr>
					<td align="center">&nbsp;</td>
				</tr>

		<tr>
			<td align="center">
				<html:submit value="Save" property="answer(button)"
					styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
					onmouseout="this.style.color='#0042B0';" />
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn"
					onmouseover="this.style.color='#FF0D25';"
					onmouseout="this.style.color='#0042B0';" />
			</td>
		</tr>



		<tr><td>
		
		
</table>
<bean:define id="applicationId" name='AddApplication'
			property='answer(Object::Application::ApplicationId)' />
<html:hidden property="answer(Object::Application::ApplicationId)"
			value="<%=""+applicationId%>" />
			<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 

   <html:hidden property="answer(Object::Application::CreatedBy)" value="<%=userName.toString()%>" /> 
   <html:hidden property="answer(Object::Application::UpdatedBy)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Application::OwnerId)" value="<%=""+ownerId%>" />
   <html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>


