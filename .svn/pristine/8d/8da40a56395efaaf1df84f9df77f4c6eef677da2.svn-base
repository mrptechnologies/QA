<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)"
	name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" 
	name="LoginPage" scope="session" />

<SCRIPT type="text/javascript">
	function validateFields(){
		var formElement=document.forms[0];
	
		if(formElement.BillingCurrencyCode.value=="")
		{
			alert("Please enter the Billing Currency Code");
			return false;
		}
		if(formElement.BillingCurrencyName.value=="")
		{
			alert("Please enter the Billing Currency Name");
			return false;
		}
		if(formElement.BillingCurrencyRate.value=="")
		{
			alert("Please enter the Billing Currency Rate");
			return false;
		}
		if(formElement.BillingCurrencyCountryName.value=="")
		{
			alert("Please enter the Billing Currency Name");
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
				BILLING CURRENCY</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td width="100%" align="center" class="sectionhead">BILLING CURRENCY
				DETAILS</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<logic:present name="AddBillingCurrencyFailed" scope="request">
				<tr>
					<td class="Error">Billing Currency Detail Added Failed</td>
				</tr>
			</logic:present>
			<% boolean readOnly = false;%>
			<logic:present name="AddBillingCurrencySuccess" scope="request">
				<tr>
					<td class="Error">Billing Currency Detail Added Successfully</td>
				</tr>
				<% readOnly = true; %>
			</logic:present>
			<logic:present name="EditBillingCurrencySuccess" scope="request">
				<tr>
					<td class="Error">Billing Currency Detail Updated Successfully</td>
				</tr>
				<% readOnly = true; %>
			</logic:present>
			<logic:present name="loadBillingCurrencySuccess" scope="request">
				<% readOnly = true; %>
			</logic:present>
			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td><html:form action="/AddBillingCurrencyAction.do"
					onsubmit="return validateFields()">

					<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0"
						CELLPADDING="0">
						<tr>
							<td class="TextMatter1">

							<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0"
								CELLPADDING="2">


								<tr>
									<td width="35%" class="FormLabels" align="left">Billing
									Currency Code</td>
									<td class="links"><html:text name="AddBillingCurrency"
										property="answer(Object::ProductBillingCurrency::BillingCurrencyCode)"
										styleId="BillingCurrencyCode" readonly="<%=readOnly%>"
										size="30" maxlength="60" styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Billing
									Currency Name</td>
									<td class="links"><html:text name="AddBillingCurrency"
										property="answer(Object::ProductBillingCurrency::CurrencyName)"
										styleId="BillingCurrencyName" size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Billing
									Currency Rate</td>
									<td class="links"><html:text name="AddBillingCurrency"
										property="answer(Object::ProductBillingCurrency::CurrencyRate)"
										styleId="BillingCurrencyRate" size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Billing
									Currency Country Name</td>
									<td class="links"><html:text name="AddBillingCurrency"
										property="answer(Object::ProductBillingCurrency::CountryName)"
										styleId="BillingCurrencyCountryName" size="30" maxlength="60"
										styleClass="txtbox" /></td>
								</tr>

								<tr>
									<td width="35%" class="FormLabels" align="left">Active</td>
									<td class="links"><html:select name="AddBillingCurrency"
										property="answer(Object::ProductBillingCurrency::Active)"
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
										onmouseout="this.style.color='#0042B0';" /> <%} else {%>
									<td>&nbsp;</td>
									<td align="left"><html:submit value="Update"
										property="answer(buttonName)" styleClass="sbttn"
										onmouseover="this.style.color='#FF0D25';"
										onmouseout="this.style.color='#0042B0';" /> <%}%>

									&nbsp;&nbsp;&nbsp; <html:reset value="Reset" styleClass="sbttn"
										onmouseover="this.style.color='#FF0D25';"
										onmouseout="this.style.color='#0042B0';" /></td>
								</tr>

								<tr>
									<td><html:hidden
										property="answer(Object::ProductBillingCurrency::OwnerId)"
										value="<%= ""+ownerId %>" /> <html:hidden
										property="answer(Object::ProductBillingCurrency::CreatedBy)"
										value="<%=userName.toString()%>" /> <html:hidden
										property="answer(Object::ProductBillingCurrency::UpdatedBy)"
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
