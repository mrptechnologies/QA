<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/JavaScript">
<!--
function createGroupVersion()
{
	var formElement=document.forms[0];
	if((formElement.versionNumber.value!="") && (formElement.versionNumber.value <= formElement.prevVersionNum.value))
{
alert("Version Number has to be greater than "+formElement.prevVersionNum.value);
return false;
}

if((formElement.desc.value!="") && (formElement.desc.value == formElement.prevVersionDesc.value))
{
alert("Please enter another description ");
return false;
}
	formElement.GroupVerId.value = "-1";
	return true;
}
//-->
</SCRIPT>

<html:form action="/SaveProductGroupVersion">
<% 
String syncProductId="";
String syncProductVerId="";
String syncVersionNum="";
%>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
	CELLPADDING="0">
	
	
	
	<bean:define id="parentPrdGroupStatus" name='AddProductGroup' property='answer(Object::ProductGroup::GroupStatus)' type="java.lang.String" />
		<bean:define id="productGroupVerStatus" name='AddProductGroup' property='answer(Object::ProductGroupVer::GroupVerStatus)' />
		<%
			boolean readonly = false;
		%>
		<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>"
			value="<%=""+productGroupVerStatus%>" negated="true">
			<% readonly = true;%>
		</dmshtml:dms_isPresent>
		<tr><td><html:hidden property="answer(dbname)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
		<html:hidden property="versionNum" value="1.0" />

		<bean:define id="productGroupId" name='AddProductGroup'
			property='answer(Object::ProductGroup::ProductGroupId)' />
		<html:hidden property="answer(Object::ProductGroup::ProductGroupId)"
			value="<%=""+productGroupId%>" />
		<bean:define id="productGroupVerId" name='AddProductGroup'
			property='answer(Object::ProductGroup::GroupVerId)' />
		<html:hidden property="answer(Object::ProductGroup::GroupVerId)"
			value="<%=""+productGroupVerId%>" styleId="GroupVerId" />
			<html:hidden property="answer(prevGroupVerId)" value="<%=""+productGroupVerId%>"  /></td></tr>

<tr><td>
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
								<td class="NewSectionHead" colspan="4" align="center">EDIT
								PRODUCT GROUP VERSION</td>
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
								GROUP VERSION DETAILS</td>

							</tr>

							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>

							<bean:define id="productGroupVerName" name='AddProductGroup'
							property='answer(Object::ProductGroup::GroupVerName)' />

							<tr>
								<td width="30%" class="FormLabels" align="left">Group Name</td>
								<td class="links"><html:text name='AddProductGroup'
									property="answer(Object::ProductGroup::GroupVerName)" size="30"
									maxlength="30" styleClass="txtbox" styleId="GroupVerName" readonly="<%=readonly%>" /></td>
							</tr>

							<tr>
								<td width="30%" class="FormLabels" align="left">Group
								Description</td>
								<td class="links"><html:text name='AddProductGroup'
									property="answer(Object::ProductGroup::GroupVerDesc)" size="30"
									maxlength="30" styleClass="txtbox"  styleId="desc"  /></td>
							</tr>

							<tr>
								<td width="30%" class="FormLabels" align="left">Group
								Version Number</td>
								<td class="links"><html:text name='AddProductGroup'
									property="answer(Object::ProductGroupVer::GroupVersionNum)"
									size="15" maxlength="30" styleClass="txtbox" styleId="versionNumber"/></td>
							</tr>

							<tr>
								<td class="FormLabels" align="left">Status</td>
								<td class="TextMatter" align="left">
								<% if(parentPrdGroupStatus.equalsIgnoreCase("RELEASED") ||parentPrdGroupStatus.equalsIgnoreCase("RESTRICTED")) {%>
									<html:select
										property="answer(Object::ProductGroupVer::GroupVerStatus)"
										name="AddProductGroup" 
										styleClass="txtbox" disabled="<%=readonly%>"  styleId="PrdGroupVerStatus" >
										<html:option value='RELEASED'>Released</html:option>
										<html:option value ='RESTRICTED'>Restricted</html:option>
										<html:option value='DEVELOPMENT'>Development</html:option>
										<html:option value='QA'>QA</html:option>
									</html:select>
								<% }else if(parentPrdGroupStatus.equalsIgnoreCase("QA")){ %>
									<html:select
										property="answer(Object::ProductGroupVer::GroupVerStatus)"
										name="AddProductGroup" 
										styleClass="txtbox" disabled="<%=readonly%>"  styleId="PrdGroupVerStatus" >
										<html:option value='DEVELOPMENT'>Development</html:option>
										<html:option value='QA'>QA</html:option>
									</html:select>
								<% }else if(parentPrdGroupStatus.equalsIgnoreCase("DEVELOPMENT")){ %>
									<html:select
										property="answer(Object::ProductGroupVer::GroupVerStatus)"
										name="AddProductGroup" 
										styleClass="txtbox" disabled="<%=readonly%>"  styleId="PrdGroupVerStatus" >	
										<html:option value='DEVELOPMENT'>Development</html:option>		
									</html:select>
								<% } %>
								</td>
							</tr>


							
							
							<tr>
								<td width="30%" class="FormLabels" align="left">Quote LookUpName</td>
								<td class="links"><html:text name='AddProductGroup'
									property="answer(Object::ProductGroup::GroupVerQuoteLookUpName)" size="30"
									maxlength="100" styleClass="txtbox" styleId="GroupVerQuoteLookUpName" readonly="<%=readonly%>" /></td>
							</tr>

							<tr>
								<td width="30%" class="FormLabels" align="left">Plan LookUpName</td>
								<td class="links"><html:text name='AddProductGroup'
									property="answer(Object::ProductGroup::GroupVerPlanLookUpName)" size="30"
									maxlength="100" styleClass="txtbox" styleId="GroupVerPlanLookUpName" readonly="<%=readonly%>" /></td>
							</tr>

							<tr>
								<td width="30%" class="FormLabels" align="left">Rate LookUpName</td>
								<td class="links"><html:text name='AddProductGroup'
									property="answer(Object::ProductGroupVer::GroupVerRateLookUpName)" size="30"
									maxlength="100" styleClass="txtbox" styleId="GroupVerRateLookUpName" readonly="<%=readonly%>" /></td>
							</tr>

							<tr>
								<td width="30%" class="FormLabels" align="left">Ratesheet LookUpName</td>
								<td class="links"><html:text name='AddProductGroup'
									property="answer(Object::ProductGroupVer::GroupVerRatesheetLookUpName)" size="30"
									maxlength="100" styleClass="txtbox" styleId="GroupVerRatesheetLookUpName" readonly="<%=readonly%>" /></td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">Active</td>
								<td class="links"><html:select
									property="answer(Object::ProductGroupVer::Active)"
									name="AddProductGroup" >
									<html:option value="Y">Active</html:option>
									<html:option value="D">Inactive</html:option>
								</html:select></td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Associated Product
								Versions</td>
								<td class="links" align="left"><dmshtml:get_group_ver_products
									nameInSession="arrProducts"
									ownerId="<%=Long.parseLong(""+ownerId)%>"
									groupVerId="<%=Long.parseLong(productGroupVerId.toString())%>"
									dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrProducts" scope="request">
									<logic:iterate id="products" name="arrProducts" scope="request">
										<bean:define id='productId' name="products"
											property="productId" />
										<bean:define id='productVerId' name="products"
											property="productVerId" />
											<%syncProductId=productId.toString();
											syncProductVerId=productVerId.toString();
											%>
										<a
											href="../GetProductVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<%=""+productId%>&answer(ProductVerId)=<%=""+productVerId%>">
										<bean:write name="products" property="MProductName" /> <bean:write
											name="products" property="MProductVerNumber" />
											
											<br>
										</a>


									</logic:iterate>
								</logic:present></td>
								<td class="links"><a
									href="../product/LinkProductVerToGroupVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductGroup::ProductGroupId)=<%=""+productGroupId%>&answer(Object::ProductGroup::GroupVerId)=<%=""+productGroupVerId%>&answer(Object::UserDetail::ownerid)=<%=ownerId.toString()%>&answer(Object::ProductGroup::GroupVerName)=<%=productGroupVerName.toString()%>&answer(Object::ProductGroup::GroupVerNum)=<%=syncVersionNum%>&answer(ProductId)=<%=""+syncProductId%>&answer(ProductVerId)=<%=""+syncProductVerId%>">Add/Remove
								Product Version</a></td>
							</tr>

							<tr>
								<td class="FormLabels" align="left" colspan="2">&nbsp;</td>

							</tr>

							<tr>
								<td align="center" colspan="3">

									<html:submit value="Save"
									property="answer(submit)" styleClass="sbttn"
									onmouseover="this.style.color='#FF0D25';"
									onmouseout="this.style.color='#0042B0';" />
									
								<dmshtml:dms_isPresent property="<%=new String[]{"RELEASED","RESTRICTED"}%>" 			value="<%=""+productGroupVerStatus%>" negated="true">
									<html:submit
									value="Create Version" property="answer(submit)"
									styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
									onmouseout="this.style.color='#0042B0';"
									onclick="return createGroupVersion()" />
								</dmshtml:dms_isPresent>
								
									<html:reset
									value="Reset" styleClass="sbttn"
									onmouseover="this.style.color='#FF0D25';"
									onmouseout="this.style.color='#0042B0';" /> </td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
</td></tr>

		<bean:define id="userName"
			property="answer(Object::UserDetail::userName)" name="LoginPage"
			scope="session" />
<tr><td>
		<html:hidden property="answer(Object::ProductGroupVer::CreatedBy)"
			value="<%=userName.toString()%>" />
			<html:hidden property="answer(Object::ProductGroup::CreatedBy)"
			value="<%=userName.toString()%>" />
			<html:hidden property="answer(Object::ProductGroup::UpdatedBy)"
			value="<%=userName.toString()%>" />
		<html:hidden property="answer(Object::ProductGroup::OwnerId)"
			value="<%=""+ownerId%>" />
		<html:hidden property="answer(Object::ProductGroup::DbName)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

<html:hidden property="answer(Object::ProductGroupVer::GroupVersionNum)" styleId="prevVersionNum" />
			<html:hidden property="answer(Object::ProductGroup::GroupVerDesc)" styleId="prevVersionDesc" /></td></tr>
			

		<%if(readonly){ %>
		<tr><td>	<html:hidden property="answer(Object::ProductGroupVer::GroupVerStatus)" />
			<html:hidden property="answer(Object::ProductGroupVer::Active)" /></td></tr>
		<% } %>

		<tr><td><html:hidden property='answer(Object::ProductGroup::GroupStatus)' value="<%=""+parentPrdGroupStatus%>" /></td></tr>



</table>

	</html:form>
