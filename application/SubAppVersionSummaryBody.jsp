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
<html:form action="/SaveSubApplicationVersion" onsubmit="return storeDateValues()" >


<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	
	<tr>
		<td>
		<bean:define id="parentApplicationStatus" name='AddApplication' property='answer(Object::Application::SubApplicationStatus)'  type="java.lang.String" />
	<bean:define id="subAppVerStatus" name='AddApplication' property='answer(Object::Application::SubApplicationVerStatus)' />
	<% 
		boolean readonly = false; 
	%>
	<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED"}%>"
		value="<%=""+subAppVerStatus%>" negated="true">
		<% readonly = true;%>
	</dmshtml:dms_isPresent>
		
		
		<html:hidden property="answer(dbname)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
			<html:hidden property="versionNum" value="1.0" />
			<bean:define id="subAppId"
					property="answer(Object::Application::SubApplicationId)" name="AddApplication"
					scope="request" />
				<bean:define id="subAppVerId"
					property="answer(Object::Application::SubApplicationVerId)"
					name="AddApplication" scope="request" />
		</td>
	</tr>

		<%
				String subApplVerId="";
				String subApplId="";
				if(request.getParameter("answer(SubApplicationVerId)")!= null) {
		subApplVerId=request.getParameter("answer(SubApplicationVerId)").toString();
}

				if(request.getParameter("answer(SubApplicationId)")!= null) {
		subApplId=request.getParameter("answer(SubApplicationId)").toString();
}
%>
	
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
					<td class="NewSectionHead" align="center">SUB-APPLICATION VERSION SUMMARY</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>
				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />
			

				<tr>
					<td>
					<hr size="1" noshade>
					</td>
				</tr>
				
				<tr>
					<td align="center">

						<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td align="center" class="sectionhead" colspan="2">&nbsp;SUB-APPLICATION VERSION DETAILS</td>
							</tr>
							
							<tr>
								<td>&nbsp;</td>
							</tr>

							
							<tr>
								<td class="sectionhead1" align="left">Version Number</td>
								<td class="TextMatter" align="left"><html:text
									name='AddApplication'
									property="answer(Object::Application::SubApplicationVerNum)" size="15"
									maxlength="20" styleClass="txtbox" styleId="versionNumber" disabled="<%=readonly%>" /></td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Name</td>
								<td class="TextMatter" align="left"><html:text
									name='AddApplication'
									property="answer(Object::Application::SubApplicationName)" size="60"
									maxlength="120" styleClass="txtbox" disabled="<%=readonly%>" />	
								</td>	
							</tr>						
						
							<tr>
								<td class="sectionhead1" align="left">Description</td>
								<td class="TextMatter" align="left"><html:textarea rows="2"
									name='AddApplication'
									property="answer(Object::Application::SubApplicationDesc)" cols="37" 
									styleClass="txtarea"  styleId="desc" disabled="<%=readonly%>"/>
								</td>
							</tr>

								<tr>
								<td class="sectionhead1" align="left">Status</td>
								<td class="TextMatter" align="left">
									<% if(parentApplicationStatus.equalsIgnoreCase("RELEASED")){%>
										<html:select
											name="AddApplication"
											property="answer(Object::Application::SubApplicationVerStatus)"
											styleClass="txtbox" disabled="<%=readonly%>"  styleId="subAppVerStatus" >
											<html:option value='RELEASED'>Released</html:option>
											<html:option value='DEVELOPMENT'>Development</html:option>
											<html:option value='QA'>QA</html:option>
										</html:select>
									<% }else if(parentApplicationStatus.equalsIgnoreCase("QA")){ %>
										<html:select
											name="AddApplication"
											property="answer(Object::Application::SubApplicationVerStatus)"
											styleClass="txtbox" disabled="<%=readonly%>"  styleId="subAppVerStatus" >
											<html:option value='DEVELOPMENT'>Development</html:option>
											<html:option value='QA'>QA</html:option>
										</html:select>
									<% }else if(parentApplicationStatus.equalsIgnoreCase("DEVELOPMENT")){ %>
										<html:select
											name="AddApplication"
											property="answer(Object::Application::SubApplicationVerStatus)"
											styleClass="txtbox" disabled="<%=readonly%>"  styleId="subAppVerStatus" >	
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
						value="<%=""+subAppVerStatus%>" negated="false">
						<html:submit value="Save" property="answer(submit)"
							styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
							onmouseout="this.style.color='#0042B0';"  />			</dmshtml:dms_isPresent> 		
							<dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED"}%>"
						value="<%=""+subAppVerStatus%>" negated="true">
							<html:submit value="Create Version" property="answer(submit)"
							styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
							onmouseout="this.style.color='#0042B0';"  />
								</dmshtml:dms_isPresent> 		
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


							

								<td class="sectionhead" align="center">Associated Attributes</td>
						</tr>
	<dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED"}%>"
						value="<%=""+subAppVerStatus%>" negated="false">
						<tr>
				<td align="center" class="sectionheadLink">
			<a href="../application/LinkAttrToSubAppVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Application::SubApplicationVerId)=<%=subAppVerId%>&answer(Object::Application::SubApplicationId)=<%=subAppId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
								Attributes</a></td></tr>
			
</dmshtml:dms_isPresent> 
<tr>
							<td class="SearchResult" width="33%" valign="top">
							<table width="100%">
					
		<dmshtml:get_sub_app_ver_attrs nameInSession="arrAttrs" ownerId="<%=Long.parseLong(""+ownerId)%>" 
subAppVerId="<%=Long.parseLong(""+subAppVerId)%>"
dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
								<logic:present name="arrAttrs" scope="request">
									<logic:iterate id="attrs" name="arrAttrs" scope="request">
										 <tr> 
													 <td class="SearchResult">
													  <bean:define id='attributeId' name="attrs"  property="attributeId" />
   		   <bean:define id='attributeName' name="attrs"  property="attributeName" />
				 	<a href="/GetAppAttributeAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::ApplicationAttr::AttributeId)=<%=attributeId.toString()%>&answer(Object::Application::SubApplicationVerId)=<%=subAppVerId%>&answer(attrName)=<%=attributeName.toString()%>&answer(level)=appVerLevel&answer(AttributeId)=<%=attributeId.toString()%>&answer(Object::Application::SubApplicationId)=<%=subAppId%>">
		       <%=attributeName.toString()%></a>
													 </td> 
												 </tr> 
									</logic:iterate>
								</logic:present>
							</table>
							</td>
				<dmshtml:dms_isPresent
						property="<%=new String[]{"RELEASED"}%>"
						value="<%=""+subAppVerStatus%>" negated="false">				</tr>

	<tr>
								<td align="center" class="sectionheadLink">	<a href="../application/LinkAttrToSubAppVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Application::SubApplicationVerId)=<%=subAppVerId%>&answer(Object::Application::SubApplicationId)=<%=subAppId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">Add/Remove
								Attributes</a></td></tr>
				
				</dmshtml:dms_isPresent> 

						
					</table>
					</td>
				</tr>



	
	
			
				<tr>
					<td>	<html:hidden property="answer(Object::Application::SubApplicationId)"
						value="<%=""+subAppId%>" />
					</td>
				</tr>
				
		<bean:define id="appName" name='AddApplication'
					property='answer(Object::Application::SubApplicationName)' />
					<bean:define id="appDesc" name='AddApplication'
					property='answer(Object::Application::SubApplicationDesc)' />
			
				<tr>	
					<td>	<html:hidden property="answer(Object::Application::SubApplicationVerId)"
						value="<%=""+subAppVerId%>" />
						<html:hidden property="answer(Object::Application::OwnerId)"
						value="<%=""+ownerId%>" />
						<html:hidden property="answer(Object::Application::SubApplicationVerNum)" styleId="prevVersionNum" />
					<html:hidden property="answer(Object::Application::SubApplicationName)"
						value="<%=""+appName%>" />
						<html:hidden property="answer(Object::Application::SubApplicationDesc)"
						value="<%=""+appDesc%>" />
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
								<html:hidden property='answer(Object::Application::SubApplicationStatus)' value="<%=""+parentApplicationStatus%>" />
							<html:hidden property="answer(appType)" value="SUBAPPL" />
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					</td>
				</tr>				
			</table>
		</td>
	</tr>
</table>			
</html:form>