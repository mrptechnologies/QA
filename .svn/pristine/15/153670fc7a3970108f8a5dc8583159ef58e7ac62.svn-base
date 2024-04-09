<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<script type="text/javascript">

</SCRIPT>


<html:form action="/AddFormula" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />



<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr>
		<td valign="top" align="left">
				<table WIDTH="1100px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr><td colspan="3">
						<table WIDTH="1100px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
						<tr>
							<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT FORMULA</td>
						</tr>
						<tr><td  class="FormLabels" align="left" colspan="4"> &nbsp;</td></tr>
						
				</table>
			</td>
</tr>

			<bean:define id="formulaGrpId" property="answer(Object::Rule::FormulaGroupId)" name="AddRule" />
			<bean:define id="objectType" property="answer(objectType)" name="AddRule" />
			<html:hidden property="answer(Object::Rule::FormulaGroupId)"
					value="<%=""+formulaGrpId%>" />
			<html:hidden property="answer(objectType)"
					value="<%=""+objectType%>" />
<tr>
<td align="left" colspan="2">
		<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr>
						<td colspan="2" align="center" class="sectionhead">FORMULA DETAILS </td>
					
						</tr>

		<logic:present name="searchresultnewDisplay" scope="request">
		<logic:present name="rulesSize" scope="request">
		<bean:define id="rulesSize" name='rulesSize' scope='request'/>

		<tr><td class="FormLabels">Number of search results found : <%=""+rulesSize%></td></tr>
		<tr><td>&nbsp;</td></tr>

		</logic:present>

		<tr><td>&nbsp;</td></tr>
		</table>

</td></tr>

		<table width="90%" align="center" border="0" >
		<tr>
		<td  class="FormLabels" align="left">Left Operand</td>
		<td  class="FormLabels" align="left">Left Operand Type</td>
		<td  class="FormLabels" align="left">Right Operand</td>
		<td class="FormLabels" align="left">Right Operand Type</td>
		<td class="FormLabels" align="left">Operator</td>
		<td class="FormLabels" align="left">Combining Operator</td>
		</tr>

<%int count=0;%>
<%java.util.ArrayList rulesArr = new java.util.ArrayList();%>
<% rulesArr= (java.util.ArrayList)request.getAttribute("searchresultnewDisplay");
		
								for (int i=0; i<rulesArr.size(); i++)  {
        						 com.dms.ejb.rules.db_rule.DbRuleDetail ruleDetail=(com.dms.ejb.rules.db_rule.DbRuleDetail) rulesArr.get(i);
	 						%>
	

		<tr>
			<td class="SearchResult">
		<%=ruleDetail.getFormulaLeftOperand()%>
			</td>
			<td class="SearchResult">
			<%=ruleDetail.getFormulaLeftOperandType()%>
			</td>
			<td class="SearchResult">
			<%=ruleDetail.getFormulaRightOperand()%>
			</td>
			<td class="SearchResult">
						<%=ruleDetail.getFormulaRightOperandType()%>
			</td>
			<td class="SearchResult">
						<%=ruleDetail.getFormulaOperator()%>
			</td>
			<td class="SearchResult"><%=ruleDetail.getFormulaCombiningOperator()%>
			</td>			
		</tr>		
		<%}%>
	

</logic:present>
					<logic:notPresent name="searchresultnewDisplay" scope="request">
					<table>
					<tr><td class="FormLabels">No records found</td></tr>
					</table>
					</logic:notPresent>

						<tr><td colspan="2">&nbsp;</td></tr>
						
						<tr>
							<td  class="FormLabels" align="left">Left Operand</td>
		<td  class="FormLabels" align="left">Left Operand Type</td>
		<td  class="FormLabels" align="left">Right Operand</td>
		<td class="FormLabels" align="left">Right Operand Type</td>
		<td class="FormLabels" align="left">Operator</td>
		<td class="FormLabels" align="left">Combining Operator</td>
						</tr>
						<tr>
							<td class="links">
							<logic:present name="ATTRIBUTES" scope="request" >
								<bean:define id="arrAttributes" name="ATTRIBUTES" type="java.util.ArrayList"/>
								<html:select property="answer(Object::Rule::FormulaLeftOperand)" >
								<html:option value ="0">Select</html:option>
									<%for(int i=0;i<arrAttributes.size();i++) {
									com.dms.ejb.data.QuestionHashMap attrMap=(com.dms.ejb.data.QuestionHashMap)arrAttributes.get(i);	
									%>
		
									<html:option value ='<%=attrMap.getString("attrName")%>'>
									<%=attrMap.getString("attrName")%>-<%=attrMap.getString("attrId")%></html:option>
									<%}%>
								</html:select>
								</logic:present>
</td>

<td class="links"><html:text  name='AddRule' property ="answer(Object::Rule::FormulaLeftOperandType)"  size="30" maxlength="30" styleClass="txtbox"  /></td>


							<td class="links"><html:text  name='AddRule' property ="answer(Object::Rule::FormulaRightOperand)"  size="30" maxlength="30" styleClass="txtbox"  /></td>

								<td class="links"><html:text  name='AddRule' property ="answer(Object::Rule::FormulaRightOperandType)"  size="30" maxlength="30" styleClass="txtbox"  /></td>


							<td class="links" style="Class: TextMatter">
								<html:select  property="answer(Object::Rule::FormulaOperator)" name="AddRule" styleClass="TextMatter"  >
									<html:option value ="+"> + </html:option>
									<html:option value ="-"> - </html:option>
									<html:option value ="*"> * </html:option>
									<html:option value ="/">/ </html:option>
								</html:select>
							</td>
							
					
							<td class="links" style="Class: TextMatter">
								<html:select  property="answer(Object::Rule::FormulaCombiningOperator)" name="AddRule" styleClass="TextMatter" >
									<html:option value ="AND">AND</html:option>
									<html:option value ="OR">OR</html:option>
								</html:select>
							</td>
						</tr>

						
				</table>			



						<tr>
							<td class="FormLabels" align="left" colspan="2">
							&nbsp;	
							</td>
							
						</tr>

						<tr>
							<td align="center" colspan="2">
								<html:submit value="ADD" property="amswer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							</td>
						</tr>
					</table>

					</td></tr>


		<tr><td>
			<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
		<html:hidden property="answer(Object::Rule::ownerId)"
							value="<%=""+ownerId%>" />
							<html:hidden property="answer(Rule::Equals::OwnerId)"
					value="<%=""+ownerId%>" />
					<html:hidden property="answer(Object::Rule::PageNum)"
					value="0" />
						<html:hidden property="answer(Object::Rule::CreatedBy)"
					value="<%=""+userName%>" />
							<html:hidden property="answer(Object::Rule::UpdatedBy)"
					value="<%=""+userName%>" />
					<html:hidden property="answer(isFormula)"
					value="Yes" />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
		</td>
		</tr>

</table>


</html:form>
