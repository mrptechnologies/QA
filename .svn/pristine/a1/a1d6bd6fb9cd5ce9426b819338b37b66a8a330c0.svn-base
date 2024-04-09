<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

	<html:form action="/UpdateSubApp">


<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
	CELLPADDING="0">


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


					<%if(request.getParameter("answer(SubApplicationId)")!= null) {
														%>
	<tr><TD>
	<html:hidden property="answer(subApplicationId)"
		value="<%=request.getParameter("answer(SubApplicationId)").toString()%>" />
		
		</TD></tr>

	<%
}
%>
<%if(request.getParameter("answer(applicationId)")!= null) {%>
	<tr><td>
	<html:hidden property="answer(Object::Application::ApplicationId)" 
	value="<%=request.getParameter("answer(applicationId)").toString()%>" />
<html:hidden property="answer(ApplicationId)" 
	value="<%=request.getParameter("answer(applicationId)").toString()%>" />
	
		
		</td></tr>

	<%
}
%>
<%if(request.getParameter("answer(subApplicationName)")!= null) {%>
	<tr><td><html:hidden property="answer(subApplicationName)"
		value="<%=request.getParameter("answer(subApplicationName)").toString()%>" /></td></tr>

	<%
}
%>


				<tr>
					<td height="5"></td>
			</tr>
	
				<tr>
					<td class="NewSectionHead" align="center">UPDATE SUB APPLICATION DETAILS</td>
				</tr>


				<tr>
					<td>&nbsp;</td>
				</tr>

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
							SUB APPLICATION DETAILS </td>

						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr><td class="links">
						<%if (!request.getParameter("answer(SubApplicationId)").toString().equals(""))
						{
						%>

						<a href="../GetSubApplicationAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&SubApplicationId=<%=request.getParameter("answer(SubApplicationId)").toString()%>">
	<%=request.getParameter("answer(subApplicationName)").toString()%></a>
<%} %>

	</td></tr>
	<tr>
							<td>&nbsp;</td>
						</tr>

						
						<tr>
				<td class="FormLabels" align="left">Repeatable</td>

	<td class="TextMatter">
			<dmshtml:dms_radio name='AddApplication' property = "answer(Object::Application::repeatable)" value="Y" >
			Yes
			</dmshtml:dms_radio>
			&nbsp;&nbsp;&nbsp;
			<dmshtml:dms_radio name='AddApplication' property = "answer(Object::Application::repeatable)" value="N" >
			No
			</dmshtml:dms_radio>
		</td>
		</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td align="center" colspan="2"><html:submit value="Save"
								property="answer(button)" styleClass="sbttn"
								onmouseover="this.style.color='#FF0D25';"
								onmouseout="this.style.color='#0042B0';" /> &nbsp;&nbsp;&nbsp;
							</td>
						</tr>

					</table>
					</td></tr>
					</table>
					</td>
					</tr>
		<bean:define id="userName"
			property="answer(Object::UserDetail::userName)" name="LoginPage"
			scope="session" />
		<tr><td><html:hidden property="answer(Object::Application::UpdatedBy)"
			value="<%=""+userName%>" /></td></tr>

					</table>
					<html:hidden property="answer(appType)" value="SUBAPPLDETAIL"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
											</html:form>
					