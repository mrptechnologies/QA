<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddDocument.js"></SCRIPT>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2"
	CELLPADDING="0">

	<tr>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td>
		<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td class="NewSectionHead" colspan="4" align="center">DELETE ALERT DEFINITION</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>
			
			

			<tr>
				<td><html:form action="/DeleteAlertDefinitionAction.do"
					onsubmit="return validateFields()">

					<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0"
						CELLPADDING="2">
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Name *</td>
							<td class="links"><html:text property="answer(Object::Alert::Definition::AlertName)" styleId="AlertName"
								size="30" maxlength="60" styleClass="txtbox" /></td>
						</tr>
						
						
						
						<tr>
							<td>&nbsp;</td> 
							<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:submit value="Delete"
								property="answer(button)" /> <html:reset value="Reset"
								property="answer(button)" /></td>
						</tr>
					</table>
					
					<html:hidden property="answer(Object::Alert::Definition::CreatedBy)"  value='<%=""+userName%>'/>
					<html:hidden property="answer(Object::Alert::Definition::UpdatedBy)"  value='<%=""+userName%>'/>
					<html:hidden property="answer(Object::Alert::Definition::OwnerId)"  value='<%=""+ownerId%>'/>			

				</html:form></td>
			</tr>

		</table>
		</td>
	</tr>
</table>
