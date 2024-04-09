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
				<td class="NewSectionHead" colspan="4" align="center">UPDATE ALERT </td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td><html:form action="/SaveAlertAction.do"
					onsubmit="return validateFields()">

					<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0"
						CELLPADDING="2">
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Id *</td>
							<td class="links"><html:text property="answer(Object::Alert::AlertId)" styleId="AlertId"
								size="31" maxlength="10" styleClass="txtbox" /></td>
						</tr>	
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Name *</td>
							<td class="links"><html:text property="answer(Object::Alert::AlertName)" styleId="AlertName"
								size="31" maxlength="40" styleClass="txtbox" /></td>
						</tr>						
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Description </td>
							<td class="links"><html:textarea property="answer(Object::Alert::AlertDesc)" styleId="AlertDesc" rows="3" cols="30" styleClass="txtarea" />
							</td>
						</tr>						
						<tr>
							<td width="35%" class="FormLabels" align="left">Alert Message </td>
							<td class="links"><html:textarea property="answer(Object::Alert::AlertMessage)" styleId="AlertMessage" rows="3" cols="30" styleClass="txtarea" />
							</td>
						</tr>						
						<tr>
							<td width="35%" class="FormLabels" align="left">Expiration Date Time </td>
							<td class="links"><html:text property="answer(Object::Alert::ExpirationDateTime)" styleId="ExpirationDateTime"
								size="31" maxlength="25" styleClass="txtbox" />(YYYY-MM-DD HH:MM:SS.mmm)</td>
						</tr>						
						<tr>
							<td width="35%" class="FormLabels" align="left">Object Type </td>
							<td class="links">
								<html:select property="answer(Object::Alert::ObjectType)" styleId="ObjectType" styleClass="txtbox">
									<html:option value ="" >Select</html:option>
 									<html:option value ="Quote">QUOTE</html:option>
									<html:option value ="Policy">POLICY</html:option>
									<html:option value ="Broker">BROKER</html:option>
									<html:option value ="Broker_Firm">BROKER_FIRM</html:option>
									<html:option value ="Insured">INSURED</html:option>
									<html:option value ="Risk">RISK</html:option>
									<html:option value ="Subjectivity">SUBJECTIVITY</html:option>
								</html:select></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Object Id </td>
							<td class="links"><html:text property="answer(Object::Alert::ObjectId)" styleId="ObjectId"
								size="31" maxlength="10" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Object Ver Id </td>
							<td class="links"><html:text property="answer(Object::Alert::ObjectVerId)" styleId="ObjectVerId"
								size="31" maxlength="10" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Object Status </td>
							<td class="links">
								<html:select property="answer(Object::Alert::ObjectStatus)" styleId="ObjectStatus" styleClass="txtbox">
									<html:option value ="">Select</html:option>
 									<html:option value ="InProgress">INPROGRESS</html:option>
									<html:option value ="Referred">REFERRED</html:option>
									<html:option value ="Offered">OFFERED</html:option>
									<html:option value ="Bind_Request">BIND_REQUEST</html:option>
									<html:option value ="Bound">BOUND</html:option>
									<html:option value ="Issued">ISSUED</html:option>
									<html:option value ="Cancelled">CANCELLED</html:option>
									<html:option value ="Declined">DECLINED</html:option>
									<html:option value ="Lapsed">LAPSED</html:option>
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
					
					<html:hidden property="answer(Object::Alert::CreatedBy)"  value='<%=""+userName%>'/>
					<html:hidden property="answer(Object::Alert::UpdatedBy)"  value='<%=""+userName%>'/>
					<html:hidden property="answer(Object::Alert::OwnerId)"  value='<%=""+ownerId%>'/>			

				</html:form></td>
			</tr>

		</table>
		</td>
	</tr>
</table>
