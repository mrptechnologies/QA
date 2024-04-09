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
	
		if(formElement.BillingType.value=="")
		{
			alert("Please enter the BillingType");
			return false;
		}
		if(formElement.BillingTypeDesc.value=="")
		{
			alert("Please enter the Billing Type Desc");
			return false;
		}
		if(formElement.InvoiceTemplateName.value=="")
		{
			alert("Please enter the Invoice Template Name");
			return false;
		}
		if(formElement.InvoiceTemplateType.value=="")
		{
			alert("Please enter the Invoice Template Type");
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
				BILLING TYPE</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td width="100%" align="center" class="sectionhead">BILLING TYPE
				DETAILS</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<logic:present name="AddBillingTypeFailed" scope="request">
				<tr>
					<td class="Error">Billing Type Detail Added Failed</td>
				</tr>
			</logic:present>

			<% boolean readOnly = false;%>
			<logic:present name="AddBillingTypeSuccess" scope="request">
				<tr>
					<td class="Error">Billing Type Detail Added Successfully</td>
				</tr>
				<% readOnly = true; %>
			</logic:present>
			<logic:present name="EditBillingTypeSuccess" scope="request">
				<tr>
					<td class="Error">Billing Type Detail Updated Successfully</td>
				</tr>
				<% readOnly = true; %>
			</logic:present>
			<logic:present name="LoadBillingTypeSuccess" scope="request">
				<% readOnly = true; %>
			</logic:present>

			<tr>
				<td>&nbsp;</td>
			</tr>
			
				<tr>
					<td><html:form action="/AddBillingTypeAction.do"
						onsubmit="return validateFields()">

						<table WIDTH="770px" ALIGN="center" BORDER="0" CELLSPACING="0"
							CELLPADDING="0">
							<tr>
								<td class="TextMatter1">

								<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0"
									CELLPADDING="2">


									<tr>
										<td width="35%" class="FormLabels" align="left">Billing Type
										Name</td>
										<td class="links"><html:text name="AddBillingType"
											property="answer(Object::ProductBillingType::BillingType)"
											styleId="BillingTypeName" readonly="<%=readOnly%>" size="30" maxlength="60"
											styleClass="txtbox" /></td>
									</tr>

									<tr>
										<td width="35%" class="FormLabels" align="left">Billing Type
										Description</td>
										<td class="links"><html:textarea name="AddBillingType"
											property="answer(Object::ProductBillingType::BillingDescription)"
											styleId="BillingTypeDesc" rows="3" cols="29"
											styleClass="txtarea" /></td>
									</tr>

									<tr>
										<td width="35%" class="FormLabels" align="left">Invoice
										Template Name</td>
										<td class="links"><html:text name="AddBillingType"
											property="answer(Object::ProductBillingType::InvoiceTemplate)"
											styleId="InvoiceTemplateName" size="30" maxlength="60"
											styleClass="txtbox" /></td>
									</tr>

									<tr>
										<td width="35%" class="FormLabels" align="left">Invoice
										Template Type</td>
										<td class="links"><html:text name="AddBillingType"
											property="answer(Object::ProductBillingType::InvoiceTemplateType)"
											styleId="InvoiceTemplateType" size="30" maxlength="60"
											styleClass="txtbox" /></td>
									</tr>


									<tr>
										<td width="35%" class="FormLabels" align="left">Active</td>
										<td class="links"><html:select name="AddBillingType"
											property="answer(Object::ProductBillingType::Active)"
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
											property="answer(Object::ProductBillingType::OwnerId)"
											value="<%= ""+ownerId %>" /> <html:hidden
											property="answer(Object::ProductBillingType::CreatedBy)"
											value="<%=userName.toString()%>" /> <html:hidden
											property="answer(Object::ProductBillingType::UpdatedBy)"
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
