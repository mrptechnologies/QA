<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="java.util.HashMap"%>


<!--
function storeValues()
{
	var formElement=document.forms[0];
	formElement.GroupVerName.value=formElement.GroupName.value;
	formElement.GroupVerDesc.value=formElement.GroupDesc.value;
	formElement.GroupVerActive.value=formElement.GroupActive.value;
	return true;
}



//-->


<html:form action="/SaveProductGroup" onsubmit="return storeValues()">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
	<html:hidden property="answer(dbname)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="versionNum" value="1.0" />



	<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2"
		CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>

			<td valign="top" align="left">

			<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0"
				CELLPADDING="0">


				<tr>
					<td colspan="3">




					<table WIDTH="1200px" ALIGN="left" BORDER="0" CELLSPACING="0"
						CELLPADDING="0">


						<tr>
							<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT
							PRODUCT GROUP</td>
						</tr>
						<tr>
							<td class="FormLabels" align="left" colspan="4">&nbsp;</td>
						</tr>
						<bean:define id="ownerId"
							property="answer(Object::UserDetail::ownerId)" name="LoginPage"
							scope="session" />
					</table>

					</td>
				</tr>



				<%if (request.getParameter("status")!= null) {%>
				<%if (request.getParameter("status").equals("success")) {%>
				<tr>
					<td class="error" align="left" colspan="4">&nbsp;Updated.</td>
				</tr>

				<%}%>
				<%if (request.getParameter("status").equals("failure")) {%>
				<tr>
					<!-- 	<td  class="FormLabels" align="left" colspan="4">&nbsp;Failed to Update!! -->
					<!-- /td-->
				</tr>
				<%}
			}%>


				<tr>
					<td align="left" colspan="2">
					<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0"
						CELLPADDING="2">

						<tr>
							<td colspan="3" align="center" class="sectionhead">PRODUCT
							GROUP DETAILS</td>

						</tr>



						<bean:define id="groupId" name="AddProductGroup"
							property="answer(Object::ProductGroup::ProductGroupId)" />
						<bean:define id="groupStatus" name="AddProductGroup"
							property="answer(Object::ProductGroup::GroupStatus)" />
						<tr>
							<td class="links" align="left"><a
								href='../ListProductGroupVersions.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(GroupId)=<%=""+groupId%>'>List
							Product Group Versions</a></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td width="30%" class="FormLabels" align="left">Group Name</td>
							<td class="links"><html:text name='AddProductGroup'
								property="answer(Object::ProductGroup::GroupName)" size="30"
								maxlength="30" styleClass="txtbox" styleId="GroupName" /></td>
						</tr>

						<tr>
							<td width="30%" class="FormLabels" align="left">Group
							Description</td>
							<td class="links"><html:text name='AddProductGroup'
								property="answer(Object::ProductGroup::GroupDesc)" size="30"
								maxlength="30" styleClass="txtbox" styleId="GroupDesc" /></td>
						</tr>

						<tr>
							<td class="FormLabels" align="left">Status</td>
							<td class="links"><html:select
								property="answer(Object::ProductGroup::GroupStatus)"
								name="AddProductGroup" styleClass="TextMatter">
								<html:option value="RELEASED">Released</html:option>
								<html:option value="RESTRICTED">Restricted</html:option>								
								<html:option value="DEVELOPMENT">Development</html:option>
								<html:option value="QA">QA</html:option>
							</html:select></td>
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
							<td class="links"><html:select
								property="answer(Object::ProductGroup::Active)"
								name="AddProductGroup" styleClass="TextMatter"
								styleId="GroupActive">
								<html:option value="Y">Active</html:option>
								<html:option value="D">Inactive</html:option>
							</html:select></td>
						</tr>


						<tr>
							<td class="sectionhead1" align="left">Associated Products</td>
							<td class="links" align="left"><dmshtml:get_product_group
								nameInSession="arrProducts"
								ownerId="<%=Long.parseLong(""+ownerId)%>"
								groupId="<%=Long.parseLong(groupId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							<logic:present name="arrProducts" scope="request">
								<logic:iterate id="products" name="arrProducts" scope="request">
									<a
										href="../GetProductAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<bean:write name="products" property="productId" />">
									<bean:write name="products" property="MProductName" /></a>
									<br>
								</logic:iterate>
							</logic:present></td>
							
							<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
								value="<%=""+groupStatus%>" negated="false">

								<td class="links"><a
									href="../product/LinkProductToGroup.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductGroup::ProductGroupId)=<%=groupId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>">Add/Remove
								Product</a></td>
							</dmshtml:dms_isPresent>
						</tr>


						<tr>
							<td class="FormLabels" align="left" colspan="2">&nbsp;</td>

						</tr>

						<tr>
							<td align="center" colspan="2"><html:submit value="Save"
								property="amswer(button)" styleClass="sbttn"
								onmouseover="this.style.color='#FF0D25';"
								onmouseout="this.style.color='#0042B0';" /> <html:reset
								value="Reset" styleClass="sbttn"
								onmouseover="this.style.color='#FF0D25';"
								onmouseout="this.style.color='#0042B0';" /></td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>


	<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />
	<html:hidden property="answer(Object::ProductGroup::User)"
		value="<%=userName.toString()%>" />
	<html:hidden property="answer(Object::ProductGroup::CreatedBy)"
		value="<%=userName.toString()%>" />
	<html:hidden property="answer(Object::ProductGroup::UpdatedBy)"
		value="<%=userName.toString()%>" />
	<html:hidden property="answer(Object::ProductGroup::ParentGroupId)"
		value="-1" />
	<html:hidden property="answer(Object::ProductGroup::OwnerId)"
		value="<%=""+ownerId%>" />
	<html:hidden property="answer(Object::ProductGroup::DbName)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

	<html:hidden property="answer(Object::ProductGroupVer::GroupName)"
		value="" styleId="GroupVerName" />
	<html:hidden property="answer(Object::ProductGroupVer::GroupDesc)"
		value="" styleId="GroupVerDesc" />
	<html:hidden property="answer(Object::ProductGroupVer::Active)"
		value="" styleId="GroupVerActive" />
	<html:hidden property="answer(Object::ProductGroupVer::CreatedBy)"
		value="<%=userName.toString()%>" />
	<html:hidden  property="answer(Object::ProductGroup::GroupType)"  value="Type 1" />




	<%	if(!groupId.toString().equals("")){%>
	<html:hidden property="answer(Object::ProductGroup::ProductGroupId)"
		value="<%=groupId.toString()%>" />

	<%}	else {%>
	<html:hidden property="answer(Object::ProductGroup::ProductGroupId)"
		value="-1" />
	<%}
%>













</html:form>
