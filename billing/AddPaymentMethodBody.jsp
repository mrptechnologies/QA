<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)"
	name="LoginPage" scope="session" />
<bean:define id="userName"
	property="answer(Object::UserDetail::userName)" name="LoginPage"
	scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)"
	name="LoginPage" scope="session" />

<SCRIPT type="text/javascript">
	function validateFields(){
		var formElement=document.forms[0];
	
		if(formElement.PaymentMethodName.value=="")
		{
			alert("Please enter the Payment Method name");
			return false;
		}
		if(formElement.PaymentMethodDesc.value=="")
		{
			alert("Please enter the Payment Method Description");
			return false;
		}
		if(formElement.PaymentMethodGatewayName.value=="")
		{
			alert("Please enter the Payment Method Gateway Name");
			return false;
		}
		if(formElement.PaymentMethodGatewayType.value=="")
		{
			alert("Please enter the Payment Method Gateway Type");
			return false;
		}	
		if(formElement.PaymentMethodGatewayBean.value=="")
		{
			alert("Please enter the Payment Method Gateway Bean");
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
				PAYMENT METHOD</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td width="100%" align="center" class="sectionhead">PAYMENT METHOD
				DETAILS</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<logic:present name="AddPaymentMethodFailed" scope="request">
				<tr>
					<td class="Error">Payment Method Detail Added Failed</td>
				</tr>
			</logic:present>

			<% boolean readOnly = false;%>
			<logic:present name="AddPaymentMethodSuccess" scope="request">
				<tr>
					<td class="Error">Payment Method Detail Added Successfully</td>
				</tr>
				<% readOnly = true; %>
			</logic:present>
			<logic:present name="EditPaymentMethodSuccess" scope="request">
				<tr>
					<td class="Error">Payment Method Detail Updated Successfully</td>
				</tr>
				<% readOnly = true; %>
			</logic:present>
			<logic:present name="LoadPaymentMethodSuccess" scope="request">
				<% readOnly = true; %>
			</logic:present>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td><html:form action="/AddPaymentMethodAction.do" onsubmit="return validateFields()">

					<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0"
						CELLPADDING="0">
						<tr>
							<td class="TextMatter1">

							<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0"
								CELLPADDING="2">


								<tr>
									<td width="35%" class="FormLabels" align="left">Payment Method
									Name</td>
									<td class="links"><html:text name="AddPaymentMethod"
										property="answer(Object::ProductPaymentMethod::PaymentMethod)"
										styleId="PaymentMethodName"  readonly="<%=readOnly%>" size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Payemnt Method
									Description</td>
									<td class="links"><html:textarea name="AddPaymentMethod"
										property="answer(Object::ProductPaymentMethod::PaymentDescription)"
										styleId="PaymentMethodDesc" rows="3" cols="29"
										styleClass="txtarea" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Payemnt Method
									Gateway Name</td>
									<td class="links"><html:text name="AddPaymentMethod"
										property="answer(Object::ProductPaymentMethod::PaymentGatewayName)"
										styleId="PaymentMethodGatewayName" size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Payemnt Method
									Gateway Type</td>
									<td class="links"><html:text name="AddPaymentMethod"
										property="answer(Object::ProductPaymentMethod::PaymentGatewayType)"
										styleId="PaymentMethodGatewayType" size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Payemnt Method
									Gateway Bean</td>
									<td class="links"><html:text name="AddPaymentMethod"
										property="answer(Object::ProductPaymentMethod::PaymentGatewayBean)"
										styleId="PaymentMethodGatewayBean" size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Active</td>
									<td class="links"><html:select name="AddPaymentMethod"
										property="answer(Object::ProductPaymentMethod::Active)"
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
										property="answer(Object::ProductPaymentMethod::OwnerId)"
										value="<%= ""+ownerId %>" /> <html:hidden
										property="answer(Object::ProductPaymentMethod::CreatedBy)"
										value="<%=userName.toString()%>" /> <html:hidden
										property="answer(Object::ProductPaymentMethod::UpdatedBy)"
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
