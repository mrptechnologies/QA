<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)"
	name="LoginPage" scope="session" />
<bean:define id="userName"
	property="answer(Object::UserDetail::userName)" name="LoginPage"
	scope="session" />

<SCRIPT type="text/javascript">
	function validateFields(){
		var formElement=document.forms[0];
	
		if(formElement.InstallmentType.value=="")
		{
			alert("Please enter the Installment Type");
			return false;
		}
		if(formElement.InstallmentTypeDesc.value=="")
		{
			alert("Please enter the Installment Type Desc");
			return false;
		}
		if(formElement.InstallmentFee.value=="")
		{
			alert("Please enter the Installment Fee");
			return false;
		}
		if(formElement.InstallmentFeeMethod.value=="")
		{
			alert("Please enter the Installment Fee Method");
			return false;
		}
		if(formElement.InstallmentFeeType.value=="")
		{
			alert("Please enter the Installment Fee Type");
			return false;
		}
		if(formElement.NumberOfInstallments.value=="")
		{
			alert("Please enter the Number Of Installments");
			return false;
		}
		if(formElement.InitialPaymentPercentage.value=="")
		{
			alert("Please enter the Initial Payment Percentage");
			return false;
		}				
	}
</SCRIPT>

<table WIDTH="95%" ALIGN="center" border="0" CELLSPACING="2"
	CELLPADDING="0">

	<tr>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td>
		<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT
				INSTALLMENT TYPE</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td width="100%" align="center" class="sectionhead">INSTALLMENT TYPE
				DETAILS</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<logic:present name="AddInstallmentTypeFailed" scope="request">
				<tr>
					<td class="Error">Installment Type Detail Added Failed</td>
				</tr>
			</logic:present>

			<% boolean readOnly = false;%>
			<logic:present name="AddInstallmentTypeSuccess" scope="request">
				<tr>
					<td class="Error">Installment Type Detail Added Successfully</td>
				</tr>
				<% readOnly = true; %>
			</logic:present>
			<logic:present name="EditInstallmentTypeSuccess" scope="request">
				<tr>
					<td class="Error">Installment Type Detail Updated Successfully</td>
				</tr>
				<% readOnly = true; %>
			</logic:present>
			<logic:present name="LoadInstallmentTypeSuccess" scope="request">
				<% readOnly = true; %>
			</logic:present>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td><html:form action="/AddInstallmentTypeAction.do" onsubmit="return validateFields()">

					<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0"
						CELLPADDING="0">
						<tr>
							<td class="TextMatter1">

							<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0"
								CELLPADDING="2">


								<tr>
									<td width="35%" class="FormLabels" align="left">Installment
									Type Name</td>
									<td class="links"><html:text name="AddInstallmentType"
										property="answer(Object::ProductInstallmentType::InstallmentType)"
										styleId="InstallmentTypeName" readonly="<%=readOnly%>" size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Installment
									Type Description</td>
									<td class="links"><html:textarea name="AddInstallmentType"
										property="answer(Object::ProductInstallmentType::InstallmentTypeDesc)"
										styleId="InstallmentTypeDesc" rows="3" cols="29"
										styleClass="txtarea" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Number Of
									Installments</td>
									<td class="links"><html:text name="AddInstallmentType"
										property="answer(Object::ProductInstallmentType::NumberOfInstallments)"
										styleId="NumberOfInstallments"  size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>
								
								<tr>
									<td width="35%" class="FormLabels" align="left">Initial Payment Percentage</td>
									<td class="links"><html:text name="AddInstallmentType"
										property="answer(Object::ProductInstallmentType::InitialPaymentPercentage)"
										styleId="InitialPaymentPercentage"  size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>
								
								
								<tr>
									<td width="35%" class="FormLabels" align="left">Installment Fee</td>
									<td class="links"><html:text name="AddInstallmentType"
										property="answer(Object::ProductInstallmentType::InstallmentFee)"
										styleId="InstallmentFee" maxlength="60" size="30" styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Installment Fee
									Method</td>
									<td class="links"><html:text name="AddInstallmentType"
										property="answer(Object::ProductInstallmentType::InstallmentFeeMethod)"
										styleId="InstallmentFeeMethod" size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Installment Fee
									type</td>
									<td class="links"><html:text name="AddInstallmentType"
										property="answer(Object::ProductInstallmentType::InstallmentFeeType)"
										styleId="InstallmentFeeType" size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Active</td>
									<td class="links"><html:select name="AddInstallmentType"
										property="answer(Object::ProductInstallmentType::Active)"
										styleId="Active" styleClass="txtbox">
										<html:option value="Y">Active</html:option>
										<html:option value="D">InActive</html:option>
									</html:select></td>
								</tr>

								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>

								<tr>
								
								<%if(!readOnly){%>
								<td>&nbsp;</td>
									<td align="left"><html:submit value="Save"
										property="answer(buttonName)" styleClass="sbttn"
										onmouseover="this.style.color='#FF0D25';"
										onmouseout="this.style.color='#0042B0';" />
								<%} else {%>
								<td>&nbsp;</td>
									<td align="left"><html:submit value="Update"
										property="answer(buttonName)" styleClass="sbttn"
										onmouseover="this.style.color='#FF0D25';"
										onmouseout="this.style.color='#0042B0';" />
								<%}%>
								
									&nbsp;&nbsp;&nbsp;
									<html:reset value="Reset" styleClass="sbttn"
										onmouseover="this.style.color='#FF0D25';"
										onmouseout="this.style.color='#0042B0';" /></td>
								</tr>
								<tr>
									<td><html:hidden
										property="answer(Object::ProductInstallmentType::OwnerId)"
										value="<%= ""+ownerId %>" /> <html:hidden
										property="answer(Object::ProductInstallmentType::CreatedBy)"
										value="<%=userName.toString()%>" /> <html:hidden
										property="answer(Object::ProductInstallmentType::UpdatedBy)"
										value="<%=userName.toString()%>" /> <html:hidden
										property="TabPanelName"
										value="<%=""+request.getParameter("TabPanelName") %>" /></td>
								</tr>

							</table>
							</td>
						</tr>
					</table>

				</html:form></td>
			</tr>

		</table>
		</td>
	</tr>
</table>
