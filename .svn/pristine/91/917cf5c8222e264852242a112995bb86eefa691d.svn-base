<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>




<html:form action="/FindProductGroup">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />

<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr><td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" align="left">
			<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td colspan="3">
						<table WIDTH="1200px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td class="NewSectionHead" colspan="4" align="center">FIND PRODUCT GROUP</td>
							</tr>
							<tr>
								<td  class="FormLabels" align="left" colspan="4"> &nbsp;</td>
							</tr>
								<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>	
						</table>
					</td>
				</tr>	


			<tr>
				<td align="left" colspan="2">
					<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">

						<tr>
						<td colspan="2" align="center" class="sectionhead">PRODUCT GROUP DETAILS</td>
					
						</tr>

						<tr><td colspan="2">&nbsp;</td></tr>


						<tr>
							<td width="30%" class="FormLabels" align="left">Group Name</td>
							<td class="links"><html:text  name='AddProductGroup' property ="answer(ProductGroup::like::GroupName)"  size="15" maxlength="30" style="class:txtbox"/></td>
						</tr>
						
						

<!-- <tr>
							<td class="FormLabels" align="left">Group Type</td>
							<td class="links" >
								<html:select name="AddProductGroup" property="answer(ProductGroup::like::GroupType)" styleClass="txtbox" >
									<option value ='Type 1'>Type1</option>
									<option value ='Type 2'>Type2</option>
									<option value ='Type 3'>Type3</option>
								</html:select>
							</td>
						</tr>
-->
						

						<tr>
							<td class="FormLabels" align="left">Status</td>
							<td class="links">
								<html:select name="AddProductGroup" property="answer(ProductGroup::like::GroupStatus)" style="class:txtbox" >
									<option value =''>All</option>
									<option value ='Released'>Released</option>
									<option value ='Development'>Development</option>
									<option value ='QA'>QA</option>
								</html:select>
							</td>
						</tr>
						
						<tr>
							<td class="FormLabels" align="left">Active</td>
							<td class="links">
								<html:select name="AddProductGroup" property="answer(ProductGroup::like::Active)" style="class:txtbox" >
									<option value ='Y'>Active</option>
									<option value ='D'>Inactive</option>
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
								<html:submit value="Find" property="amswer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							
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
<html:hidden property="answer(Object::Product::User)" value="<%=userName.toString()%>" /> 
<html:hidden property="answer(Object::ProductGroup::CreatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::ProductGroup::UpdatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::ProductGroup::ParentGroupId)" value="-1" />
<html:hidden property="answer(Object::ProductGroup::ProductGroupId)" value="-1" />
<html:hidden property="answer(Object::ProductGroup::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::ProductGroup::DbName)"
value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
<html:hidden property="answer(Object::ProductGroup::PageNum)" value="0" />
<html:hidden property="answer(Object::ProductGroup::TotalRec)" value="1" />
<html:hidden property="answer(ProductGroup::like::GroupType)" value="" />

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />

</html:form>

