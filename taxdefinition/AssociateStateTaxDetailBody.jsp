<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<% String productStateTaxId = "";
   String productStateTaxVerId="";	%>
<% productStateTaxId = String.valueOf(request.getAttribute("productStateTaxId")); %>
<% productStateTaxVerId = String.valueOf(request.getAttribute("productStateTaxVerId")); %>

<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<form action="../SaveProductStateTaxAction.do">
	<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td valign="top" align="left">
				<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td colspan="3">
							<table WIDTH="770px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
								</tr>
								<tr>
									<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT STATE TAX</td>
								</tr>
								<tr>
									<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
								</tr>
								<tr>
									<td class="links" width="20%">
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="left" colspan="2">
						</td>
					</tr>
					<tr>
						<td>
							<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
								<tr>
									<td class="sectionhead" align="center"> STATE TAX DETAILS </td>							
								</tr>
								<tr>
									<td class="links" align="left"><a href="../GetStateTaxVersionListAction.go?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&productStateTaxId=<%=productStateTaxId %>&productStateTaxVerId=<%=productStateTaxVerId %>">State Tax Version List</a></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td> &nbsp;</td>
					</tr>
		
					<tr>
						<td>
							<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;State</td>
									<td class="links" style="Class:txtbox">&nbsp;
										<html:select name="GetStateTax" property="answer(Object::Product::Tax::StateCode)" >
											<html:option value="DE">Delaware</html:option>
											<html:option value="DC">District of Columbia</html:option>
											<html:option value="FL">Florida</html:option>
											<html:option value="GA">Georgia</html:option>
											<html:option value="MD">Maryland</html:option>
											<html:option value="NJ">New Jersey</html:option>
											<html:option value="NC">North Carolina</html:option>
											<html:option value="PA">Pennsylvania</html:option>
											<html:option value="SC">South Carolina</html:option>
											<html:option value="TX">Texas</html:option>
											<html:option value="VA">Virginia</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Territory</td>
									<td class="links">&nbsp;<html:text name ="GetStateTax" property="answer(Object::Product::Tax::Territory)"></html:text></td>
								</tr>
								<tr>
									<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;County Code</td>
									<td class="links">&nbsp;<html:text name ="GetStateTax" property="answer(Object::Product::Tax::CountyCode)"></html:text></td>
								</tr> 
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Tax Code</td>
									<td class="links">&nbsp;<html:text name ="GetStateTax" property="answer(Object::Product::Tax::TaxCode)"></html:text></td>
								</tr>	
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;User Editable</td>
									<td class="TextMatter">&nbsp;
										<html:select name ="GetStateTax" property="answer(Object::Product::Tax::UserEditable)">
											<html:option value="Y">Yes</html:option>
											<html:option value="D">No </html:option>
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
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="left" >
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="amswer(button)" value="Save" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" class="sbttn">
				&nbsp;&nbsp;&nbsp;

				<input type="reset" value="Reset" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" class="sbttn">
			</td>
		</tr>
		<tr>
			<td>
				<html:hidden property="answer(Object::Product::Tax::ProductStateTaxId)" value="<%=productStateTaxId.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::ProductTaxIdVer)" value="<%=productStateTaxVerId.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::CreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::UpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</td>
		</tr>
	</table>
</form>