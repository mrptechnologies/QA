<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<script type="text/javascript">
<!--
function storeValues()
{
	var formElement=document.forms[0];
	formElement.GroupVerName.value=formElement.GroupName.value;
	formElement.GroupVerDesc.value=formElement.GroupDesc.value;
	formElement.GroupVerActive.value=formElement.GroupActive.value;
	formElement.ProductGroupVerStatus.value=formElement.prdGroupStatus.value;

	formElement.GroupVerQuoteLookUpName.value=formElement.QuoteLookUpName.value;
	formElement.GroupVerPlanLookUpName.value=formElement.PlanLookUpName.value;
	formElement.GroupVerRateLookUpName.value=formElement.RateLookUpName.value;
	formElement.GroupVerRatesheetLookUpName.value=formElement.RatesheetLookUpName.value;
	return true;
}
//-->
</SCRIPT>


<html:form action="/AddProductGroup" onsubmit="return storeValues()">
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
							<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT PRODUCT GROUP</td>
						</tr>
						<tr><td  class="FormLabels" align="left" colspan="4"> &nbsp;</td></tr>
						<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
						<bean:define id="groupId"
						property="answer(Object::ProductGroup::ProductGroupId)" name="AddProductGroup"
						scope="request" /> 
					</table>

				</td>
			</tr>
			
			

			<%if (request.getParameter("status")!= null) {%>
				<%if (request.getParameter("status").equals("success")) {%>
					<tr>
						<td  class="error" align="left" colspan="4">&nbsp;Updated.</td>
					</tr>

				<%}%>
				<%if (request.getParameter("status").equals("failure")) {%>
					<tr>
					 	<!--  td  class="FormLabels" align="left" colspan="4">&nbsp;Failed to Update!! >
						</td--> 
					</tr>
				<%}
			}%>	


			<tr>
				<td align="left" colspan="2">
					<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">

						<tr>
						<td colspan="2" align="center" class="sectionhead">PRODUCT GROUP DETAILS</td>
					
						</tr>

						<tr><td colspan="2">&nbsp;</td></tr>


						<tr>
							<td width="30%" class="FormLabels" align="left">Group Name</td>
							<td class="links"><html:text  name='AddProductGroup' property ="answer(Object::ProductGroup::GroupName)"  size="30" maxlength="30" styleClass="txtbox" styleId="GroupName" /></td>
						</tr>
						
						<tr>
							<td width="30%" class="FormLabels" align="left">Group Description</td>
							<td class="links"><html:text  name='AddProductGroup' property ="answer(Object::ProductGroup::GroupDesc)"  size="30" maxlength="30" styleClass="txtbox" styleId="GroupDesc" /></td>
						</tr>


											

						<tr>
							<td class="FormLabels" align="left">Status</td>
							<td class="links" style="Class: TextMatter">
								<html:select  property="answer(Object::ProductGroup::GroupStatus)" name="AddProductGroup" styleClass="TextMatter" styleId="prdGroupStatus" >
									<html:option value ="DEVELOPMENT">Development</html:option>
									<html:option value ="RELEASED">Released</html:option>
									<html:option value ="RESTRICTED">Restricted</html:option>
									<html:option value ="QA">QA</html:option>
								</html:select>
							</td>
						</tr>

						<tr>
							<td width="30%" class="FormLabels" align="left">Quote LookUpName</td>
							<td class="links"><html:text  name='AddProductGroup' property ="answer(Object::ProductGroup::QuoteLookUpName)"  size="30" maxlength="100" styleClass="txtbox" styleId="QuoteLookUpName" /></td>
						</tr>


						<tr>
							<td width="30%" class="FormLabels" align="left">Plan LookUpName</td>
							<td class="links"><html:text  name='AddProductGroup' property ="answer(Object::ProductGroup::PlanLookUpName)"  size="30" maxlength="100" styleClass="txtbox" styleId="PlanLookUpName" /></td>
						</tr>


						<tr>
							<td width="30%" class="FormLabels" align="left">Rate LookUpName</td>
							<td class="links"><html:text  name='AddProductGroup' property ="answer(Object::ProductGroup::RateLookUpName)"  size="30" maxlength="100" styleClass="txtbox" styleId="RateLookUpName" /></td>
						</tr>


						<tr>
							<td width="30%" class="FormLabels" align="left">Ratesheet LookUpName</td>
							<td class="links"><html:text  name='AddProductGroup' property ="answer(Object::ProductGroup::RatesheetLookUpName)"  size="30" maxlength="100" styleClass="txtbox" styleId="RatesheetLookUpName" /></td>
						</tr>
						
						<tr>
							<td class="FormLabels" align="left">Active</td>
							<td class="links">
								<html:select property="answer(Object::ProductGroup::Active)" name="AddProductGroup" styleClass="TextMatter" styleId="GroupActive" >
									<html:option value ="Y">Active</html:option>
									<html:option value ="D">Inactive</html:option>
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
	</td>
</tr>
</table>


<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::ProductGroup::User)" value="<%=userName.toString()%>" /> 
<html:hidden property="answer(Object::ProductGroup::CreatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::ProductGroup::UpdatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::ProductGroup::ParentGroupId)" value="-1" />
<html:hidden property="answer(Object::ProductGroup::OwnerId)" value="<%=""+ownerId%>" />
<html:hidden property="answer(Object::ProductGroup::DbName)"
value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
<html:hidden  property="answer(Object::ProductGroup::GroupVerName)" value="" styleId="GroupVerName"/>
<html:hidden  property="answer(Object::ProductGroup::GroupVerDesc)" value="" styleId="GroupVerDesc"/>
<html:hidden  property="answer(Object::ProductGroup::GroupVerNum)" value="1.0" styleId="GroupVerNum"/>

<html:hidden  property="answer(Object::ProductGroup::GroupVerQuoteLookUpName)" value="" styleId="GroupVerQuoteLookUpName"/>
	<html:hidden  property="answer(Object::ProductGroup::GroupVerPlanLookUpName)" value="" styleId="GroupVerPlanLookUpName"/>
	<html:hidden  property="answer(Object::ProductGroupVer::GroupVerRateLookUpName)" value="" styleId="GroupVerRateLookUpName"/>
	<html:hidden  property="answer(Object::ProductGroupVer::GroupVerRatesheetLookUpName)" value="" styleId="GroupVerRatesheetLookUpName"/>



<bean:define id="groupId" name="AddProductGroup" property="answer(Object::ProductGroup::ProductGroupId)" /> 
<%	if(!groupId.toString().equals("")){%>
<html:hidden property="answer(Object::ProductGroup::ProductGroupId)" value="<%=groupId.toString()%>" />

<%}	else {%>
<html:hidden property="answer(Object::ProductGroup::ProductGroupId)" value="-1" />
<%}
%>

<html:hidden  property="answer(Object::ProductGroupVer::Active)" value="" styleId="GroupVerActive"/>
<html:hidden  property="answer(Object::ProductGroupVer::CreatedBy)"  value="<%=userName.toString()%>" />
<html:hidden  property="answer(Object::ProductGroupVer::GroupVersionNum)"  value="1.0" />
<html:hidden  property="answer(Object::ProductGroup::GroupType)"  value="Type 1" />
<html:hidden  property="answer(Object::ProductGroupVer::GroupVerStatus)" value="" styleId="ProductGroupVerStatus"/>		

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />








</html:form>
