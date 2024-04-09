<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<script type="text/javascript">

</SCRIPT>

<!-- START OF HTML -->
<html:form action="/AddRule" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />



<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">

		<tr>
			<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT RULE ACTION AND FORMULA</td></TR>
			<tr><td>&nbsp;</td></tr>
		<td colspan="7" align="center" class="sectionhead">RULE DETAILS </td></tr>
	<bean:define id="ruleGrpId" property="answer(Object::Rule::RuleGroupId)" name="AddRule" />
	<bean:define id="objectType" property="answer(objectType)" name="AddRule" />
	<html:hidden property="answer(Object::Rule::RuleGroupId)" value="<%=""+ruleGrpId%>" />
	<html:hidden property="answer(objectType)"/>

		<tr><td>&nbsp;</td></tr>
		<TR><TD>
		<table width="100%" align="left" border="0" >
		<tr>
		<td  class="sectionhead" align="left">Attribute</td>
		<td  class="sectionhead" align="left">Rel. Operator</td>
		<td  class="sectionhead" align="left">Operand</td>
		<td class="sectionhead" align="left">Operand Type</td>
		<td class="sectionhead" align="left">Comb. Operator</td>
		</tr>

<%int count=0;%>
<%java.util.ArrayList rulesArr = new java.util.ArrayList();%>

<% if(request.getAttribute("searchresultnewDisplay")!=null){
rulesArr= (java.util.ArrayList)request.getAttribute("searchresultnewDisplay");
		
for (int i=0; i<rulesArr.size(); i++)  {
 com.dms.ejb.rules.db_rule.DbRuleDetail ruleDetail=(com.dms.ejb.rules.db_rule.DbRuleDetail) rulesArr.get(i);
	 						%>
	

		<tr>
			<td class="SearchResult">
		<%=ruleDetail.getAttributeName()%>
			</td>
			<td class="SearchResult">
			<%=ruleDetail.getConditionOperator()%>
			</td>
			<td class="SearchResult">
			<%=ruleDetail.getOperand()%>
			</td>
			<td class="SearchResult">
						<%=ruleDetail.getOperandType()%>
			</td>
			<td class="SearchResult"><%=ruleDetail.getCombiningOperator()%>
			</td>			
		</tr>		
		<%}}%>
	


			
							
						<tr>
							<td class="SearchResult">
							<logic:present name="ATTRIBUTES" scope="request" >
								<bean:define id="arrAttributes" name="ATTRIBUTES" type="java.util.ArrayList"/>
								<html:select property="answer(Object::Rule::AttributeId)" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}'>
								<html:option value ="">Select</html:option>
									<%for(int i=0;i<arrAttributes.size();i++) {
									com.dms.ejb.data.QuestionHashMap attrMap=(com.dms.ejb.data.QuestionHashMap)arrAttributes.get(i);	
									%>
		
									<html:option value ='<%=attrMap.getString("attrId")%>'>
									<%=attrMap.getString("attrName")%>-<%=attrMap.getString("attrId")%></html:option>
									<%}%>
								</html:select>
								</logic:present>
</td>
							<td class="SearchResult" >
								<html:select  property="answer(Object::Rule::ConditionOperator)" name="AddRule" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}'  >
									<html:option value ="<"> < </html:option>
									<html:option value ="<="> <= </html:option>
									<html:option value =">"> > </html:option>
									<html:option value =">="> >= </html:option>
									<html:option value ="=="> == </html:option>
								
								</html:select>
							</td>
							<td class="SearchResult"><html:text  name='AddRule' property ="answer(Object::Rule::Operand)"  size="30" maxlength="30" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 17px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}'  /></td>
							<td class="SearchResult">
								<html:select  property="answer(Object::Rule::OperandType)" name="AddRule" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}'  >
									<html:option value ="STATIC">Static</html:option>
									<html:option value ="ATTRIBUTE">Attribute</html:option>
								
								</html:select>
							</td>
					
							<td class="SearchResult">
								<html:select  property="answer(Object::Rule::CombiningOperator)" name="AddRule" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}' >
									<html:option value ="AND">AND</html:option>
									<html:option value ="OR">OR</html:option>
								</html:select>
							</td>
						</tr>

						
			


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
						<html:hidden property="answer(Object::Rule::CreatedBy)"
					value="<%=""+userName%>" />
							<html:hidden property="answer(Object::Rule::UpdatedBy)"
					value="<%=""+userName%>" />
						<html:hidden property="answer(Object::Rule::PageNum)"
					value="0" />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
		</td>
		</tr>


</html:form>

		</td>
	</tr>

	<html:form action="/AddRuleAction">
	<bean:define id="ruleGrpId" property="answer(Object::Rule::RuleGroupId)" name="AddRule" />
			<bean:define id="objectType" property="answer(objectType)" name="AddRule" />
			<html:hidden property="answer(Object::Rule::RuleGroupId)" value="<%=""+ruleGrpId%>" />
			<html:hidden property="answer(objectType)" value="<%=""+objectType%>" />
	<tr>
<td align="left" colspan="2">
		<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="2" CELLPADDING="2">
		<tr>
		<td colspan="7" align="center" class="sectionhead">RULE ACTION DETAILS </td></tr>

		<tr><td>&nbsp;</td></tr>

		<tr>
		<td  class="sectionhead" align="left">Attribute</td>
		<td  class="sectionhead" align="left">Success Action Name</td>
		<td  class="sectionhead" align="left">Failure Action Name</td>
		<td class="sectionhead" align="left">Action Type</td>
		<td class="sectionhead" align="left">Success Attribute</td>
		<td class="sectionhead" align="left">Formula Group</td>
		</tr>



<%int count=0;%>
<%java.util.ArrayList rulesArr = new java.util.ArrayList();%>
<% if(request.getAttribute("ruleActionsDisplay")!=null) {
rulesArr= (java.util.ArrayList)request.getAttribute("ruleActionsDisplay");
		
								for (int i=0; i<rulesArr.size(); i++)  {
        						 com.dms.ejb.rules.db_rule.DbRuleDetail ruleDetail=(com.dms.ejb.rules.db_rule.DbRuleDetail) rulesArr.get(i);
	 						%>
	

		<tr>
	
			<td class="SearchResult">
		<%=ruleDetail.getAttributeName()%>
			</td>
			<td class="SearchResult">
			<%=ruleDetail.getSuccessActionName()%>
			</td>
			<td class="SearchResult">
			<%=ruleDetail.getFailureActionName()%>
			</td>
			<td class="SearchResult">
						<%=ruleDetail.getActionType()%>
			</td>
			<td class="SearchResult"><%=ruleDetail.getSuccessActionAttrbuteId()%>
			</td>		
			<td class="SearchResult"><%=ruleDetail.getFormulaGroupId()%>
			</td>		
		</tr>		
		<%}}%>
	


					
						<tr>
							<td class="SearchResult">
							<logic:present name="ATTRIBUTES" scope="request" >
								<bean:define id="arrAttributes" name="ATTRIBUTES" type="java.util.ArrayList"/>
								<html:select property="answer(Object::Rule::AttributeId)" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}'>
								<html:option value ="">Select</html:option>
									<%for(int i=0;i<arrAttributes.size();i++) {
									com.dms.ejb.data.QuestionHashMap attrMap=(com.dms.ejb.data.QuestionHashMap)arrAttributes.get(i);	
									%>
		
									<html:option value ='<%=attrMap.getString("attrId")%>'>
									<%=attrMap.getString("attrName")%>-<%=attrMap.getString("attrId")%></html:option>
									<%}%>
								</html:select>
								</logic:present>
</td>
							<td class="SearchResult">
								<html:select  property="answer(Object::Rule::SuccessActionName)" name="AddRule" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}'  >
									<html:option value ="TextBox">TextBox</html:option>
									<html:option value ="Radio"> Radio</html:option>
									<html:option value ="Hidden"> Hidden </html:option>
									<html:option value ="Select"> Dropdown </html:option>
								</html:select>
							</td>
							<td class="SearchResult">
								<html:select  property="answer(Object::Rule::FailureActionName)" name="AddRule" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}'  >
									<html:option value ="TextBox">TextBox</html:option>
									<html:option value ="Radio"> Radio</html:option>
									<html:option value ="Hidden"> Hidden </html:option>
									<html:option value ="Select"> Dropdown </html:option>
								
								</html:select>
							</td>

							<td class="SearchResult"><html:text  name='AddRule' property ="answer(Object::Rule::ActionType)"  size="30" maxlength="30" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 17px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}'  /></td>
							<td class="SearchResult">
								<html:select  property="answer(Object::Rule::SuccessActionAttrbuteId)" name="AddRule" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}'  >
									<html:option value ="0">None </html:option>
									<html:option value ="1">1 </html:option>
									<html:option value ="2"> 2</html:option>
								</html:select>
							</td>
					
							<td class="SearchResult">
							<logic:present name="formulaGrps" scope="request" >
								<bean:define id="arrFrmGrps" name="formulaGrps" type="java.util.ArrayList"/>
								<html:select property="answer(Object::Rule::FormulaGroupId)" style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;
								FONT-WEIGHT: 400;FONT-SIZE: 10px;BORDER-LEFT: 999999 1px solid;
								COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;
								FONT-FAMILY: Verdana,Arial; HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-ALIGN: left;
								TEXT-DECORATION: none;vertical-align: bottom;}'>
								<html:option value ="0">Select</html:option>
									<%for(int i=0;i<arrFrmGrps.size();i++) {
									com.dms.ejb.data.QuestionHashMap attrMap=(com.dms.ejb.data.QuestionHashMap)arrFrmGrps.get(i);	
									%>
		
									<html:option value ='<%=attrMap.getString("Object::Rule::FormulaGroupId")%>'>
									<%=attrMap.getString("Object::Rule::FormulaGrpName")%></html:option>
									<%}%>
								</html:select>
								</logic:present>
							</td>
						</tr>

						
			


						<tr>
							<td class="FormLabels" align="left" colspan="2">
							&nbsp;	
							</td>
							
						</tr>

						<tr>
							<td align="center" colspan="8">
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
						<html:hidden property="answer(Object::Rule::CreatedBy)"
					value="<%=""+userName%>" />
							<html:hidden property="answer(Object::Rule::UpdatedBy)"
					value="<%=""+userName%>" />
					<html:hidden property="answer(isFormula)"
					value="No" />
						<html:hidden property="answer(Object::Rule::PageNum)"
					value="0" />
					
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
		</td>
		</tr>


</html:form>

</td></tr>
</table>








