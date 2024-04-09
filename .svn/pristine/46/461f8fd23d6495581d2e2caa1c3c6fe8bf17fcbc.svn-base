<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<% String productStateFeeId = "";
   String productStateFeeVerId="";	%>
<% productStateFeeId = String.valueOf(request.getAttribute("productStateFeeId")); %>
<% productStateFeeVerId = String.valueOf(request.getAttribute("productStateFeeVerId")); %>

<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<form action="../SaveProductStateFeeAction.do">
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
									<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT STATE FEE</td>
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
									<td class="sectionhead" align="center">STATE FEE DETAILS </td>							
								</tr>
								<tr>
									<td class="links" align="left"><a href="../GetStateFeeVersionListAction.go?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&productStateFeeId=<%=productStateFeeId %>&productStateFeeVerId=<%=productStateFeeVerId %>">State Fee Version List</a></td>
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
									<td class="FormLabels" align="left">&nbsp;&nbsp;State </td>
									<td class="links" style="Class:txtbox">&nbsp;
									
									   
										<html:select name="GetStateFee" property="answer(Object::Product::Fee::StateCode)" styleId="DocType"  styleClass="txtbox" >
										   
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
									<td class="links">&nbsp;<html:text name ="GetStateFee" property="answer(Object::Product::Fee::Territory)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>
								<tr>
									<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;County Code</td>
									<td class="links">&nbsp;<html:text name ="GetStateFee" property="answer(Object::Product::Fee::CountyCode)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr> 
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Fee Code</td>
									<td class="links">&nbsp;<html:text name ="GetStateFee" property="answer(Object::Product::Fee::FeeCode)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>	
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;User Editable</td>
									<td class="TextMatter">&nbsp;
										<html:select name ="GetStateFee" property="answer(Object::Product::Fee::UserEditable)" styleId="DocType"  styleClass="txtbox">
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
				<html:hidden property="answer(Object::Product::Fee::ProductStateFeeId)" value="<%=productStateFeeId.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::ProductFeeIdVer)" value="<%=productStateFeeVerId.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::CreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::UpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</td>
		</tr>
	</table>
</form>