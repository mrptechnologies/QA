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
				<td class="NewSectionHead" colspan="4" align="center">UPDATE ALERT DEFINITION</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td><html:form action="/SaveAlertDefinitionAction.do"
					onsubmit="return validateFields()">

					<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0"
						CELLPADDING="2">
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Name *</td>
							<td class="links"><html:text property="answer(Object::Alert::Definition::AlertName)" styleId="AlertName"
								size="31" maxlength="40" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Type *</td>
							<td class="links">								
								<html:select property="answer(Object::Alert::Definition::AlertType)" styleId="AlertType" styleClass="txtbox">
									<html:option value ="">Select</html:option>
 									<html:option value ="Clearence Request">Clearence Request</html:option>
									<html:option value ="Bind Request">Bind Request</html:option>
									<html:option value ="Referrals">Referrals</html:option>
									<html:option value ="Subjectivity Review">Subjectivity Review</html:option>
									<html:option value ="Other">Other</html:option>
								</html:select></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Description </td>
							<td class="links"><html:textarea property="answer(Object::Alert::Definition::AlertDesc)" styleId="AlertDesc" rows="3" cols="30" styleClass="txtarea" />
							</td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Template </td>
							<td class="links"><html:textarea property="answer(Object::Alert::Definition::AlertTemplate)" styleId="AlertTemplate" rows="3" cols="30" styleClass="txtarea" />
							</td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Default Alert Message </td>
							<td class="links"><html:textarea property="answer(Object::Alert::Definition::DefaultAlertMessage)" styleId="DefaultAlertMessage" rows="3" cols="30" styleClass="txtarea" />
							</td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Expiration Type </td>
							<td class="links"><html:select property="answer(Object::Alert::Definition::ExpirationType)" styleId="ExpirationType" styleClass="txtbox">
									<html:option value ="" >Select</html:option>
 									<html:option value ="Year">Year</html:option>
									<html:option value ="Month">Month</html:option>
									<html:option value ="Day">Day</html:option>
									<html:option value ="Hour">Hour</html:option>
									<html:option value ="Minute">Minute</html:option>
									<html:option value ="Never">Never</html:option>
								</html:select></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Expiration Unit </td>
							<td class="links"><html:text property="answer(Object::Alert::Definition::ExpirationUnit)" styleId="ExpirationUnit"
								size="4" maxlength="10" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Severity </td>
							<td class="links"><html:text property="answer(Object::Alert::Definition::Severity)" styleId="Severity"
								size="4" maxlength="1" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Priority </td>
							<td class="links"><html:text property="answer(Object::Alert::Definition::Priority)" styleId="Priority"
								size="4" maxlength="1" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Object Type </td>
							<td class="links">
								<html:select property="answer(Object::Alert::Definition::ObjectType)" styleId="ObjectType" styleClass="txtbox">
									<html:option value ="" >Select</html:option>
 									<html:option value ="Insured">QUOTE</html:option>
									<html:option value ="Quote">POLICY</html:option>
									<html:option value ="Policy">BROKER</html:option>
									<html:option value ="Policy">BROKER_FIRM</html:option>
									<html:option value ="Policy">INSURED</html:option>
									<html:option value ="Policy">RISK</html:option>
									<html:option value ="Policy">SUBJECTIVITY</html:option>
								</html:select></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Object Status </td>
							<td class="links">
								<html:select property="answer(Object::Alert::Definition::ObjectStatus)" styleId="ObjectStatus" styleClass="txtbox">
									<html:option value ="">Select</html:option>
 									<html:option value ="InProgress">INPROGRESS</html:option>
									<html:option value ="ObjectStatus2">REFERRED</html:option>
									<html:option value ="ObjectStatus3">OFFERED</html:option>
									<html:option value ="InProgress">BIND_REQUEST</html:option>
									<html:option value ="ObjectStatus2">BOUND</html:option>
									<html:option value ="ObjectStatus3">ISSUED</html:option>
									<html:option value ="InProgress">CANCELLED</html:option>
									<html:option value ="ObjectStatus2">DECLINED</html:option>
									<html:option value ="ObjectStatus3">LAPSED</html:option>
								</html:select></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td align="left"><html:submit value="Update"
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
