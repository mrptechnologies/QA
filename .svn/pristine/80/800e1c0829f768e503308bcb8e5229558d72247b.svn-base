<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript">
<!--
function storeDateValues()
{
var formElement=document.forms[0];
if((formElement.verStatus.value!="") && (formElement.verStatus.value=="Create Version"))
{
if((formElement.versionNumber.value!="") && (formElement.versionNumber.value <= formElement.prevVersionNum.value))
{
alert("Version Number has to be greater than "+formElement.prevVersionNum.value);
return false;
}
return true;
}
//-->
</SCRIPT>
<html:form action="/SaveApplicationVersion" onsubmit="return storeDateValues()" >


<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	
	<tr>
		<td>

				<bean:define id="parentApplicationStatus" name='AddApplication' property='answer(Object::Application::ApplicationStatus)'  type="java.lang.String" />
	<bean:define id="AppVerStatus" name='AddApplication' property='answer(Object::Application::ApplicationVerStatus)' />
	<% 
		boolean readonly = false; 
	%>
	<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED"}%>"
		value="<%=""+AppVerStatus%>" negated="true">
		<% readonly = true;%>
	</dmshtml:dms_isPresent>
		
		<html:hidden property="answer(dbname)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
			<html:hidden property="versionNum" value="1.0" />
		</td>
	</tr>
	
	<tr>
		<td>
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
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
					<td class="NewSectionHead" align="center">APPLICATION VERSION SUMMARY</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>
				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />
				<bean:define id="applicationId"
					property="answer(Object::Application::ApplicationId)" name="AddApplication"
					scope="request" />
				<bean:define id="applicationVerId"
					property="answer(Object::Application::ApplicationVerId)"
					name="AddApplication" scope="request" />
				<bean:define id="applicationName" 
					name="AddApplication" property="answer(Object::Application::ApplicationName)"
					scope="request" />
				<tr>
					<td>
					<hr size="1" noshade>
					</td>
				</tr>
				
				<tr>
					<td align="center">

						<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td align="center" class="sectionhead" colspan="2">&nbsp;APPLICATION VERSION DETAILS</td>
							</tr>
							
							<tr>
								<td>&nbsp;</td>
							</tr>

							
							<tr>
								<td class="sectionhead1" align="left">Version Number</td>
								<td class="TextMatter" align="left"><html:text
									name='AddApplication'
									property="answer(Object::Application::ApplicationVerNum)" size="15"
									maxlength="20" styleClass="txtbox" styleId="versionNumber" disabled="<%=readonly%>" /></td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Name</td>
								<td class="TextMatter" align="left"><html:text
									name='AddApplication'
									property="answer(Object::Application::ApplicationName)" size="30"
									maxlength="30" styleClass="txtbox" disabled="<%=readonly%>"/>	
								</td>	
							</tr>						
						
							<tr>
								<td class="sectionhead1" align="left">Description</td>
								<td class="TextMatter" align="left"><html:textarea rows="2"
									name='AddApplication'
									property="answer(Object::Application::ApplicationDesc)" cols="37" 
									styleClass="txtarea"  styleId="desc" disabled="<%=readonly%>"/>
								</td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Status</td>
								<td class="TextMatter" align="left">
									<% if(parentApplicationStatus.equalsIgnoreCase("RELEASED")){%>
										<html:select
											name="AddApplication"
											property="answer(Object::Application::ApplicationVerStatus)"
											styleClass="txtbox" disabled="<%=readonly%>"  styleId="AppVerStatus" >
											<html:option value='RELEASED'>Released</html:option>
											<html:option value='DEVELOPMENT'>Development</html:option>
											<html:option value='QA'>QA</html:option>
										</html:select>
									<% }else if(parentApplicationStatus.equalsIgnoreCase("QA")){ %>
										<html:select
											name="AddApplication"
											property="answer(Object::Application::ApplicationVerStatus)"
											styleClass="txtbox" disabled="<%=readonly%>"  styleId="AppVerStatus" >
											<html:option value='DEVELOPMENT'>Development</html:option>
											<html:option value='QA'>QA</html:option>
										</html:select>
									<% }else if(parentApplicationStatus.equalsIgnoreCase("DEVELOPMENT")){ %>
										<html:select
											name="AddApplication"
											property="answer(Object::Application::ApplicationVerStatus)"
											styleClass="txtbox" disabled="<%=readonly%>"  styleId="AppVerStatus" >	
											<html:option value='DEVELOPMENT'>Development</html:option>		
										</html:select>
									<% } %>
								</td>	
							</tr>


	
							
							<tr>
								<td class="sectionhead1" align="left">Active</td>
								<td class="TextMatter" align="left"><html:select
									name='AddApplication' property="answer(Object::Application::VerActive)"
									styleClass="txtbox" styleId="State" disabled="<%=readonly%>" >
									<html:option value='Y'>Active</html:option>
									<html:option value='D'>Inactive</html:option>
									</html:select> 
								</td>
							</tr>
							
					</table>
				</td>
				</tr>

				<tr>
					<td align="center">&nbsp;</td>
				</tr>

				<tr>
					<td align="center" class="SearchResult">
						<table WIDTH="360px" ALIGN="center" BORDER="0"
							style="{border-width:1px; border-style:solid; border-color: #999999;}">

							<!-- Add/Remove Links Starts-->
							<tr>	
								<td align="center" class="sectionhead">Associated SubApplication Versions</td>
							</tr>
								<dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED"}%>"
						value="<%=""+AppVerStatus%>" negated="false">
							<tr>
								<td align="center" class="sectionheadLink">
									<a
										href="../application/LinkSubAppVerToAppVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Application::ApplicationId)=<%=applicationId.toString()%>&answer(Object::Application::ApplicationVerId)=<%=applicationVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
									Sub Application Ver</a>
								</td>
							</tr>
</dmshtml:dms_isPresent> 
				<tr>
							<td class="SearchResult" width="33%" valign="top">
							<table width="100%">
								<dmshtml:get_app_ver_subapps nameInSession="arrApps" ownerId="<%=Long.parseLong(""+ownerId)%>" 
	appVerId="<%=Long.parseLong(applicationVerId.toString())%>" 
dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>

								<logic:present name="arrApps" scope="request">
									<logic:iterate id="subApps" name="arrApps" scope="request">
										 <tr> 
													 <td class="SearchResult"> <bean:define id='subApplicationName'
														name="subApps" property="subApplicationName" />
														  <bean:define id='subApplicationId' name="subApps"  property="subApplicationId" />
   		    <bean:define id='subApplicationVerId' name="subApps"  property="subApplicationVerId" />
   		   <bean:define id='subApplicationName' name="subApps"  property="subApplicationName" />
  		   <bean:define id='subApplicationVerNum' name="subApps"  property="subApplicationVerNum" />
				 <!-- <a href="../GetSubApplicationVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(SubApplicationId)=<%=subApplicationId.toString()%>&answer(SubApplicationVerId)=<%=subApplicationVerId.toString()%>">
   		       <%=subApplicationName.toString()+ subApplicationVerNum.toString()%></a>-->
		  	<a href="../GetSubApplicationToAppLinkDetail.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ApplicationId)=<%=""+applicationId %>&answer(ApplicationVerId)=<%=""+applicationVerId %>&answer(Object::Application::ApplicationVerId)=<%=applicationVerId.toString()%>&answer(Object::Application::SubApplicationVerId)=<%=subApplicationVerId.toString()%>&answer(ApplicationName)=<%=applicationName%>&answer(SubApplicationName)=<%=subApplicationName.toString()+ subApplicationVerNum.toString()%>&answer(SubApplicationId)=<%=subApplicationId.toString()%>">
   		       <%=subApplicationName.toString()+ subApplicationVerNum.toString()%></a>
													 </td> 
												 </tr> 
									</logic:iterate>
								</logic:present>
							</table>
							</td>
							</tr>

<dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED"}%>"
						value="<%=""+AppVerStatus%>" negated="false">
		<tr>
								<td align="center" class="sectionheadLink">
									<a
										href="../application/LinkSubAppVerToAppVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Application::ApplicationId)=<%=applicationId.toString()%>&answer(Object::Application::ApplicationVerId)=<%=applicationVerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
									Sub Application Ver</a>
								</td>
							</tr>
</dmshtml:dms_isPresent> 
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<hr size="1" noshade width="95%">
					</td>
				</tr>
				
				<tr>
					<td align="center">
<dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED"}%>"
						value="<%=""+AppVerStatus%>" negated="false">
					<html:submit value="Save" property="answer(submit)"
							styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
							onmouseout="this.style.color='#0042B0';"  /></dmshtml:dms_isPresent>
<dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED"}%>"
						value="<%=""+AppVerStatus%>" negated="true">
						<html:submit value="Create Version" property="answer(submit)"
							styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
							onmouseout="this.style.color='#0042B0';"  /></dmshtml:dms_isPresent>
					</td>					
				</tr>

	

				<bean:define id="appId" name='AddApplication'
					property='answer(Object::Application::ApplicationId)' />
					
				<tr>
					<td>	<html:hidden property="answer(Object::Application::ApplicationId)"
						value="<%=""+appId%>" />
					</td>
				</tr>
				
				<bean:define id="appVerId" name='AddApplication'
					property='answer(Object::Application::ApplicationVerId)' />
						<bean:define id="appName" name='AddApplication'
					property='answer(Object::Application::ApplicationName)' />
					<bean:define id="appDesc" name='AddApplication'
					property='answer(Object::Application::ApplicationDesc)' />
				<tr>	
					<td>	<html:hidden property="answer(Object::Application::ApplicationVerId)"
						value="<%=""+appVerId%>" />
						<html:hidden property="answer(Object::Application::ApplicationName)"
						value="<%=""+appName%>" />
						<html:hidden property="answer(Object::Application::ApplicationDesc)"
						value="<%=""+appDesc%>" />
						<html:hidden property="answer(Object::Application::OwnerId)"
						value="<%=""+ownerId%>" />
						<html:hidden property="answer(Object::Application::VerNumber)" styleId="prevVersionNum" />
					
					</td>
				</tr>
				<bean:define id="userName"
					property="answer(Object::UserDetail::userName)" name="LoginPage"
					scope="session" />
				<tr>
					<td><html:hidden property="answer(Object::Application::UpdatedBy)"
							value="<%=""+userName%>" />
						<!--  start need to be removed -->
						<html:hidden property="answer(Object::Application::CreatedBy)"
							value="<%=""+userName%>" />
						<!--  end need to be removed -->
						<html:hidden property="answer(Object::Application::dbName)"
							value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
									<html:hidden property='answer(Object::Application::ApplicationStatus)' value="<%=""+parentApplicationStatus%>" />
									<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					</td>
				</tr>				
			</table>
		</td>
	</tr>
</table>			
</html:form>