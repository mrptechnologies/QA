<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<html:form action="/SaveSubApplication" onsubmit="return storeDateValues()">

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

<bean:define id="subAppStatus" name='AddApplication'
			property='answer(Object::Application::SubApplicationStatus)' />
		<% 
	boolean readonly = false; %>
		<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED"}%>"
			value="<%=""+subAppStatus%>" negated="true">
			<% readonly = true;%>
		</dmshtml:dms_isPresent>

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
					<td class="NewSectionHead" align="center">SUB-APPLICATION SUMMARY</td>
				</tr>


				<tr>
					<td>&nbsp;</td>
				</tr>
				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />

<bean:define id="subApplicationId" name='AddApplication'
			property='answer(Object::Application::SubApplicationId)' scope="request" />
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
							SUB-APPLICATION DETAILS </td>

						</tr>

						<tr>
							<td class="links" align="left"><a
								href='../ListSubApplicationVersions.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(subApplicationId)=<%=subApplicationId.toString()%>'>List
							Sub Application Versions</a></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left" >Sub-Application Number</td>
								<td class="TextMatter" align="left"><html:text
								name='AddApplication'
								property="answer(Object::Application::SubApplicationNum)" size="30"
								maxlength="30" styleClass="txtbox" disabled="<%=readonly%>" /></td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Application Sub Number</td>
							<td class="TextMatter" align="left"><html:text
								name='AddApplication'
								property="answer(Object::Application::SubApplicationSubNum)" size="30"
								maxlength="30" styleClass="txtbox" disabled="<%=readonly%>"  /></td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Sub-Application Name</td>
							<td class="TextMatter" align="left"><html:text
								name='AddApplication' property="answer(Object::Application::SubApplicationName)"
								size="60" maxlength="120" styleClass="txtbox" disabled="<%=readonly%>"
								/></td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left">Description</td>
							<td class="TextMatter" align="left"><html:textarea cols="37" rows="4"
								name='AddApplication' property="answer(Object::Application::SubApplicationDesc)"
								styleClass="txtarea" disabled="<%=readonly%>" />
								</td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left">Type</td>
							<td class="TextMatter" align="left"><!--<html:text
								name='AddApplication'
								property="answer(Object::Application::SubApplicationType)" size="30"
								maxlength="30" styleClass="txtbox" disabled="<%=readonly%>" />-->
								<html:select property="answer(Object::Application::SubApplicationType)" name='AddApplication' styleClass="txtbox" disabled="<%=readonly%>" >
									<html:option value="Form">Form</html:option>
									<html:option value="RepetedForm">Repeted Form</html:option>
								</html:select>

							</td>

						</tr>		
						<tr>
								<td class="sectionhead1" align="left">If # of rows fixed(Applicable Only For Repeated Form)</td>
								<td class="TextMatter" align="left">
									<html:radio property="answer(Object::Application::FixedRows)" styleClass="txtbox" name='AddApplication' value="Y" disabled="<%=readonly%>" >Yes</html:radio>									
									<html:radio property="answer(Object::Application::FixedRows)" styleClass="txtbox" name='AddApplication' value="N" disabled="<%=readonly%>" >No</html:radio>
								</td>
							</tr>	
						<tr>
							<td class="sectionhead1" align="left"># of rows fixed(Applicable Only For Repeated Form)</td>
							<td class="TextMatter" align="left">
								<html:text name='AddApplication' property="answer(Object::Application::NoOfRowsToBeInserted)" size="4" maxlength="4" styleClass="txtbox" disabled="<%=readonly%>" />
							</td>
						</tr>										
						
						<tr>
							<td class="sectionhead1" align="left">Status</td>
							<td class="TextMatter" align="left"><html:select
								name="AddApplication"
								property="answer(Object::Application::SubApplicationStatus)"
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
								styleClass="txtbox" disabled="<%=readonly%>"> 
								<html:option value='Y'>Active</html:option>
								<html:option value='D'>Inactive</html:option>
							</html:select></td>

						</tr>



					</table>

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
<bean:define id="subApplicationId" name='AddApplication'
			property='answer(Object::Application::SubApplicationId)' />
<html:hidden property="answer(Object::Application::SubApplicationId)"
			value="<%=""+subApplicationId%>" />
			<html:hidden property="answer(Object::Application::UpdatedBy)"
			value="<%=""+subApplicationId%>" />
			<html:hidden property="answer(appType)" value="SUBAPPL" />
<html:hidden property="answer(Object::Application::OwnerId)" value="<%=""+ownerId%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>


