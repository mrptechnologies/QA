<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<script type="text/javascript">

</SCRIPT>


<html:form action="/AddRuleGroup" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />



<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr><td>&nbsp;</td></tr>
	<tr>
	
		<td valign="top" align="left">

			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">


				<tr><td colspan="3">


					

					<table WIDTH="770px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">


						<tr>
							<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT RULE GROUP</td>
						</tr>
						<tr><td  class="FormLabels" align="left" colspan="4"> &nbsp;</td></tr>
					
					</table>

				</td>
			</tr>
			
			

		


			<tr>
				<td align="left" colspan="2">
					<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">

						<tr>
						<td colspan="2" align="center" class="sectionhead">RULE GROUP DETAILS</td>
					
						</tr>

						<tr><td colspan="2">&nbsp;</td></tr>


						<tr>
							<td width="30%" class="FormLabels" align="left">Rule Name</td>
							<td class="links"><html:text  name='AddRule' property ="answer(Object::Rule::RuleGroupName)"  size="30" maxlength="30" styleClass="txtbox"  /></td>
						</tr>
						
						<tr>
							<td width="30%" class="FormLabels" align="left">Rule Description</td>
							<td class="links"><html:text  name='AddRule' property ="answer(Object::Rule::RuleGroupDesc)"  size="30" maxlength="30" styleClass="txtbox"  /></td>
						</tr>


											

						<tr>
							<td class="FormLabels" align="left">Rule Type</td>
							<td class="links" style="Class: TextMatter">
								<html:select  property="answer(objectType)" name="AddRule" styleClass="TextMatter" >
									<html:option value ="ATTRIBUTE">Application</html:option>
									<html:option value ="OPTION">Option</html:option>
								
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
								<html:submit value="Save" property="amswer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							
								<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<tr><td>
			<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
		<bean:define id="ruleGrpId" property="answer(Object::Rule::RuleGroupId)" name="AddRule" />

		<html:hidden property="answer(Object::Rule::RuleGroupId)"
					value="<%=""+ruleGrpId%>" />
		<html:hidden property="answer(Object::Rule::ownerId)"
					value="<%=""+ownerId%>" />
						<html:hidden property="answer(Object::Rule::CreatedBy)"
					value="<%=""+userName%>" />
							<html:hidden property="answer(Object::Rule::UpdatedBy)"
					value="<%=""+userName%>" />
		<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
		</td>
		</tr>
	</td>
</tr>
</table>






</html:form>
