<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

	<html:form action="/UpdateProductOptions">
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
	CELLPADDING="0">


		<tr>
			<td>
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2"
				CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<logic:present name="staleDataSubmissionMsg" scope="request">
					<tr>
						<td class="Error"><bean:message
							key="error.staleDataSubmissionMsg" /></td>
					</tr>
				</logic:present>

				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />
				<bean:define id="productId"
					property="answer(Object::Product::ProductId)" name="AddProduct"
					scope="request" />
				<bean:define id="productVerId"
					property="answer(Object::Product::CurrentVerId)" name="AddProduct"
					scope="request" />
					<%if(request.getParameter("answer(ProductOptions::Equals::OptionVerId)")!= null) {%>
	<tr><TD><html:hidden property="answer(ProductOptions::Equals::OptionVerId)"
		value="<%=request.getParameter("answer(ProductOptions::Equals::OptionVerId)").toString()%>" />
		
		<html:hidden property="answer(Object::ProductOptions::OptionVerId)"
		value="<%=request.getParameter("answer(ProductOptions::Equals::OptionVerId)").toString()%>" /></TD></tr>

	<%
}
%>

<%if(request.getParameter("answer(ProductOptions::Equals::OptionId)")!= null) {%>
	<tr><TD><html:hidden property="answer(ProductOptions::Equals::OptionId)"
		value="<%=request.getParameter("answer(ProductOptions::Equals::OptionId)").toString()%>" />
		
		<html:hidden property="answer(Object::ProductOptions::OptionId)"
		value="<%=request.getParameter("answer(ProductOptions::Equals::OptionId)").toString()%>" /></TD></tr>

	<%
}
%>

<%if(request.getParameter("answer(Object::Product::ProductVerId)")!= null) {%>
	<tr><td><html:hidden property="answer(Object::ProductOptions::ProductVerId)"
		value="<%=request.getParameter("answer(Object::Product::ProductVerId)").toString()%>" /></td></tr>

	<%
}
%>
<%if(request.getParameter("answer(optionName)")!= null) {%>
	<tr><td><html:hidden property="answer(optionName)"
		value="<%=request.getParameter("answer(optionName)").toString()%>" /></td></tr>

	<%
}
%>


				<tr>
					<td height="5"></td>
			</tr>
	
				<tr>
					<td class="NewSectionHead" align="center">UPDATE PRODUCT
					OPTIONS</td>
				</tr>


				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>
					<hr size="1" noshade>
					</td>
				</tr>
	
				<tr>
					<td align="center">

				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"
						CELLPADDING="2">
						<tr>
							<td align="center" class="sectionhead" colspan="2">&nbsp;
							PRODUCT OPTION DETAILS </td>

						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr><td class="links">
						<%if (!request.getParameter("answer(ProductOptions::Equals::OptionId)").toString().equals(""))
						{
						%>
	<a href="/GetOptionDetails.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductOptions::Equals::OptionId)=<%=request.getParameter("answer(ProductOptions::Equals::OptionId)").toString()%>"><%=request.getParameter("answer(optionName)").toString()%></a>
<%} %>

	</td></tr>
	<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="FormLabels" align="left" WIDTH="40%">Is the
							option changeable at Item Level</td>
							<td class="TextMatter" align="left" WIDTH="40%"><html:select
								property="answer(Object::ProductOptions::ItemLevelChangeable)">
								<html:option value="N">No</html:option>
								<html:option value="Y">Yes</html:option>
							</html:select></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="FormLabels" align="left">Quote item Column</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Object::ProductOptions::ItemDetail)" size="15"
								maxlength="30" styleClass="txtbox" /></td>

						</tr>
						<tr>
							<td class="FormLabels" align="left">Sequence Number</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Object::ProductOptions::OptionSequenceNumber)" size="8"
								maxlength="8" styleClass="txtbox" /></td>

						</tr>
						<tr>
							<td class="FormLabels" align="left">Option Algorithm</td>
							<td class="TextMatter" align="left" WIDTH="40%">
							<html:textarea 
								property="answer(Object::ProductOptions::AvailableOptionAlg)" 
								cols="20" rows="5"></html:textarea>
							</td>

						</tr>
						<tr>
							<td class="FormLabels" align="left">Display Property Table Heading</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Object::ProductOptions::DisplyProperty_TableHeading)" size="30"
								maxlength="60" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td class="FormLabels" align="left">Display Property Table Index</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Object::ProductOptions::DisplyProperty_TableIndex)" size="8"
								maxlength="8" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td class="FormLabels" align="left">Display Property Column Heading</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Object::ProductOptions::DisplyProperty_ColHeading)" size="30"
								maxlength="60" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td class="FormLabels" align="left">Display Property Column Index</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Object::ProductOptions::DisplyProperty_ColIndex)" size="8"
								maxlength="8" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td class="FormLabels" align="left">Display Property Row Heading</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Object::ProductOptions::DisplyProperty_RowHeading)" size="30"
								maxlength="60" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td class="FormLabels" align="left">Display Property Row Index</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Object::ProductOptions::DisplyProperty_RowIndex)" size="8"
								maxlength="8" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td class="FormLabels" align="left">Display Property OnKeyUpJavaScript</td>
							<td class="TextMatter" align="left">
							<html:textarea 
								property="answer(Object::ProductOptions::DisplyProperty_OnkeyUpJavaScript)" 
								cols="20" rows="5"/></td>
						</tr>
												<tr>
							<td class="FormLabels" align="left">Display Property OnClickJavaScript</td>
							<td class="TextMatter" align="left">
							<html:textarea 
								property="answer(Object::ProductOptions::DisplyProperty_OnClickJavaScript)" 
								cols="20" rows="5"/></td>
						</tr>
												<tr>
							<td class="FormLabels" align="left">Display Property OnBlurJavaScript</td>
							<td class="TextMatter" align="left">
							<html:textarea 
								property="answer(Object::ProductOptions::DisplyProperty_OnBlurJavaScript)" 
								cols="20" rows="5"/></td>
						</tr>
												<tr>
							<td class="FormLabels" align="left">Display Property OnChangeJavaScript</td>
							<td class="TextMatter" align="left">
							<html:textarea 
								property="answer(Object::ProductOptions::DisplyProperty_OnChangeJavaScript)" 
								cols="20" rows="5"/></td>
						</tr>
												<tr>
							<td class="FormLabels" align="left">Display Property AltJavaScript</td>
							<td class="TextMatter" align="left">
							<html:textarea 
								property="answer(Object::ProductOptions::DisplyProperty_AltJavaScript)" 
								cols="20" rows="5"/></td>
						</tr>
						<tr>
							<td class="FormLabels" align="left">Display Property Style Class</td>
							<td class="TextMatter" align="left"><html:text
								property="answer(Object::ProductOptions::DisplyProperty_StyleClass)" size="30"
								maxlength="60" styleClass="txtbox" /></td>
						</tr>
						
						
							<tr>
							<td class="FormLabels" align="left">Alignment</td>
							<td class="TextMatter" align="left"><html:select
								property="answer(Object::ProductOptions::align)">
								<html:option value="LEFT">Left</html:option>
								<html:option value="RIGHT">Right</html:option>
							</html:select></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td align="center" colspan="2"><html:submit value="Save"
								property="answer(button)" styleClass="sbttn"
								onmouseover="this.style.color='#FF0D25';"
								onmouseout="this.style.color='#0042B0';" /> &nbsp;&nbsp;&nbsp;
							</td>
						</tr>

					</table>
					</td></tr>
					</table>
					</td>
					</tr>
		<bean:define id="userName"
			property="answer(Object::UserDetail::userName)" name="LoginPage"
			scope="session" />
		<tr><td><html:hidden property="answer(Object::ProductOptions::UpdatedBy)"
			value="<%=""+userName%>" />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" /></td></tr>

					</table>
											</html:form>
					