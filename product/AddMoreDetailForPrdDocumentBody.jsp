<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<% String PrdId = request.getParameter("answer(Object::Product::Document::PrdId)"); %>
<% String PrdVerId = request.getParameter("answer(Object::Product::Document::PrdVerId)"); %>
<% String DocType = request.getParameter("answer(Object::Product::Document::Definition::DocType)"); %>

<% String VerId = request.getParameter("answer(Object::Product::Document::DocVerId)"); %>
<% String DocId = request.getParameter("answer(Object::Product::Document::DocId)"); %>

<html:form action="/DocumentAssociateToProductAction.do">
	<table WIDTH="86%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
		<tr><td height="10"></td></tr>
	
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">Product Document Details</td>
		</tr>
		
	
		<tr><td><hr size="1" noshade></td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
				<td>
					<table width="86%" ALIGN="right" BORDER="0">
	
						<tr>
							<td width="35%" class="FormLabels" align="left">Order Index</td>
							<td class="links"><html:text property="answer(Object::Product::Document::OrderIndex)" value="" styleId="OrderIndex" size="10" maxlength="10" styleClass="txtbox" /></td>
						</tr>
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Mandatory</td>
							<td class="links">
								<html:select property="answer(Object::Product::Document::Mandatory)" value="" styleId="Mandatory" styleClass="txtbox">
									<html:option value ="N">No</html:option>
									<html:option value ="Y">Yes</html:option>
								</html:select>
							</td>
						</tr>
		
						<tr>
							<td width="35%" class="FormLabels" align="left">Repeated Document</td>
							<td class="links">
								<html:select property="answer(Object::Product::Document::RepeatedDoc)" value="" styleId="RepeatedDoc" styleClass="txtbox">
									<html:option value ="N">No</html:option>
									<html:option value ="Y">Yes</html:option>
								</html:select>
							</td>
						</tr>
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Rule Name</td>
							<td class="links"><html:text property="answer(Object::Product::Document::RuleName)" value="" styleId="RuleName" size="20" maxlength="20" styleClass="txtbox" /></td>
						</tr>							
						
						<tr>
							<td width="35%" class="FormLabels" align="left">State Code</td>
							<td class="links"><html:text property="answer(Object::Product::Document::StateCode)" value="" styleId="StateCode" size="20" maxlength="20" styleClass="txtbox" /></td>
						</tr>
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Active</td>
							<td class="links">
								<html:select property="answer(Object::Product::Document::Active)" value="" styleId="RepeatedDoc" styleClass="txtbox">
									<html:option value ="Y">Yes</html:option>
									<html:option value ="D">No</html:option>
								</html:select>
							</td>
						</tr>						
	
						<tr>
							<td>
								<html:hidden property="answer(Object::Product::Document::PrdId)" value="<%=PrdId%>" styleId="PrdId" />
								<html:hidden property="answer(Object::Product::Document::PrdVerId)" value="<%=PrdVerId%>" styleId="PrdVerId" />
								<html:hidden property="answer(Object::Product::Document::CreatedBy)" value="<%=userName.toString()%>" />
								<html:hidden property="answer(Object::Product::Document::UpdatedBy)" value="<%=userName.toString()%>" />
								
								<html:hidden property="answer(Object::Product::Document::Definition::DocType)" value="<%=DocType%>" styleId="DocType" />
								<html:hidden property="answer(Object::Product::Document::DocVerId)" value="<%=VerId%>" styleId="VerId" />
								<html:hidden property="answer(Object::Product::Document::DocId)" value="<%=DocId%>" styleId="DocId" />
								<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
							</td>
														
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td></tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<table>
						<tr>
						<td width="45%">&nbsp;</td>
							<td align="center">
								<html:submit value="Save" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>&nbsp;&nbsp;&nbsp;		
								&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/>
							</td>						
						</tr>
										
					</table>
				</td>
			</tr>
	</table>
</html:form>