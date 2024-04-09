<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<SCRIPT type="text/JavaScript">
<!--
function storeDateValues()
{
var formElement=document.forms[0];
formElement.AppVerStatus.value=formElement.AppStatus.value;
}

//-->
</SCRIPT>

<html:form action="/AddApplication" onsubmit="return storeDateValues()" >

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />

	<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td>&nbsp;
		</td>
	</tr>
	<tr>
		<td valign="top" align="left">
			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<logic:present name="staleDataSubmissionMsg"  scope="request">
				<tr>
					<td class="Error" >
						<bean:message key="error.staleDataSubmissionMsg"/>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				</logic:present>

				<tr>
					<td colspan="3">
						<table WIDTH="760px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
							<tr>
								<td valign="top">
									<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												Application Name
											</td>								
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table WIDTH="770px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td  class="FormLabels" align="left" colspan="4">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="NewSectionHead" colspan="4" align="center">	
									ADD/EDIT PARENT APPLICATION
								</td>
							</tr>
							<tr>
								<td  class="FormLabels" align="left" colspan="4"> 
									&nbsp;
								</td>
							</tr>
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
						</table>
					</td>
				</tr>	
				<tr>
					<td align="left" colspan="2">
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td colspan="2" align="center" class="sectionhead">
									APPLICATION DETAILS
								</td>
							</tr>
							<tr>
								<td colspan="2">
								</td>
							</tr>
							<tr>
								<td colspan="2">
								</td>
							</tr>
							<tr>
								<td colspan="2">
								</td>
							</tr>
							
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
							<tr>
								<td class="FormLabels" align="left">
									Application Number
								</td>
								<td class="links">
									<html:text  name='AddApplication' property ="answer(Object::Application::ApplicationNum)"  size="30" maxlength="30" styleClass="txtbox"/>
								</td>
							</tr> 

							<tr>
								<td width="30%" class="FormLabels" align="left">
									Application Sub Number
								</td>
								<td class="links">
									<html:text  name='AddApplication' property ="answer(Object::Application::ApplicationSubNum)"  size="30" maxlength="30" styleClass="txtbox"/>
								</td>
							</tr>
	
							<tr>
								<td width="30%" class="FormLabels" align="left">
									Application Name
								</td>
								<td class="links">
									<html:text  name='AddApplication' property ="answer(Object::Application::ApplicationName)"  size="30" maxlength="30" styleClass="txtbox"/>
								</td>
							</tr>

							<tr>
								<td width="30%" class="FormLabels" align="left">
									Description
								</td>
								<td class="links">
									<html:textarea
								name='AddApplication' rows="4" cols="37"
								property="answer(Object::Application::ApplicationDesc)"
								styleClass="txtarea"  />
								</td>
							</tr>

								<tr>
								<td width="30%" class="FormLabels" align="left">
									Type
								</td>
								<td class="links">
											<dmshtml:get_parent_app_types nameInSession="arrAppTypes" ownerId="<%=Long.parseLong(""+ownerId)%>"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
								<html:select property="answer(Object::Application::ApplicationType)" name="AddApplication"
				styleClass="TextField">
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

								<td class="FormLabels" align="left">
									Status
								</td>
								<td class="links" style="Class: txtbox">
									<html:select name="AddApplication" property="answer(Object::Application::ApplicationStatus)" styleClass="txtbox" styleId="subAppStatus">
									    <html:option value ='DEVELOPMENT'>Development</html:option>
									    <html:option value ='RELEASED'>Released</html:option>
										<html:option value ='QA'>QA</html:option>
									</html:select>
								</td>
							</tr>


							<tr>
								<td class="FormLabels" align="left">
									Active
								</td>
								<td class="links" style="Class: txtbox">
									<html:select name='AddApplication' property="answer(Object::Application::Active)" styleClass="txtbox" styleId="State">
									    <html:option value ='Y'>Active</html:option>
									    <html:option value ='D'>Inactive</html:option>
									</html:select>
								</td>
							</tr>
						</table>
					</td>
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

		<td align="center">

			<html:submit value="Save" property="amswer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
			&nbsp;&nbsp;&nbsp;
			<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
		</td>
	</tr>
</table>



<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 

   <html:hidden property="answer(Object::Application::CreatedBy)" value="<%=userName.toString()%>" /> 
   <html:hidden property="answer(Object::Application::UpdatedBy)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Application::VerActive)" value="Y" />
   <html:hidden property="answer(Object::Application::ApplicationVerNum)" value="1.0" />
<html:hidden property="answer(Object::Application::dbName)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
   <html:hidden property="answer(Object::Application::OwnerId)" value="<%=ownerId.toString()%>" />
	 <html:hidden  property="answer(Object::Application::ApplicationVerStatus)" value="" styleId="AppVerStatus"/>	
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
 </html:form>

