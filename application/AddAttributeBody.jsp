<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript">
<!--
function validate()
{
	var formElement=document.forms[0];
	
	if((formElement.attributeName.value==""))
	{
		alert("Please enter the Attribute Name");
		return false;
	}
	if((formElement.attributeDesc.value==""))
	{
		alert("Please enter the Attribute Description");
		return false;
	}
	
	return true;
}
</script>
<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td height="20">
		
		</td>
	</tr>
	<tr>
		<td class="NewSectionHead" align="center" colspan="10">
			ADD ATTRIBUTES
		</td>
	</tr>

	<tr>
		<td height="8px">
		
		</td>
	</tr>

	<tr>
		<td valign="top">
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			 	<tr>
				 	<td class="FormLabels" colspan="6">
				 
					 </td>
			 	</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td height="20px">
		
		</td>
	</tr>
	
	<bean:define id="attributeId" property="answer(Object::ApplicationAttr::AttributeId)" name="AddAttribute" scope="request"/> 
	<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />

	
	<tr>
		<td align="center">
		<html:form action="/AddAttribute.do" onsubmit="return validate()">


			<table border="0" width="10%" cellspacing="2" cellpadding="2"
				style="{border-width:1px; border-style:solid; border-color: #999999;}">
				<tr>
					<td class="sectionhead" colspan="2" align="center">
						ATTRIBUTE DETAILS
					</td>
				</tr>
				<tr>
					<td colspan="2" height="5px">
					
					</td>
				</tr>

				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Attribute Name
					</td>
					<td class="SearchResult">
						<html:text
						property="answer(Object::ApplicationAttr::AttributeName)"
						 size="60" maxlength="120"
						styleClass="txtbox" styleId="attributeName" />
					</td>
				</tr>

				
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Attribute Description
					</td>
					<td class="SearchResult">
							<html:textarea
								 rows="4" cols="37"
								property="answer(Object::ApplicationAttr::AttributeDesc)"
								styleClass="txtarea" styleId="attributeDesc" />
					</td>
				
				</tr>

					<tr>
					<td class="sectionhead" width="15%" nowrap>
						Data Type
					</td>
					<td class="SearchResult">
					<html:select
							property="answer(Object::ApplicationAttr::DataType)" 
							 styleClass="TextField">
							<html:option value=' '>Select</html:option>
							<html:option value='Integer'>Integer</html:option>
							<html:option value='Double'>Double</html:option>
							<html:option value='String'>String</html:option>
							<html:option value='Date'>Date</html:option>
							<html:option value='Boolean'>Boolean</html:option>
						</html:select>
						
					</td>
				
				</tr>

				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Data Length
					</td>
					<td class="SearchResult">
						<html:text 
						property="answer(Object::ApplicationAttr::DataLength)"
						 styleClass="txtbox" />
					</td>
				
				</tr>

				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Minimum Value
					</td>
					<td class="SearchResult">
						<html:text 
						property="answer(Object::ApplicationAttr::MinValue)"
						 styleClass="txtbox" />
					</td>
				
				</tr>

				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Maximum Value
					</td>
					<td class="SearchResult">
						<html:text 
						property="answer(Object::ApplicationAttr::MaxValue)"
						 styleClass="txtbox" />
					</td>
				
				</tr>
				
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Null or Empty Accepted
					</td>
					<td class="SearchResult">
						<html:select
							property="answer(Object::ApplicationAttr::NullOrEmpty)"
							styleClass="TextField">
							<html:option value='Y'>Yes</html:option>
							<html:option value='N'>No</html:option>
						</html:select>
					</td>
				</tr>
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Validation Script
					</td>
					<td class="SearchResult">
						<html:text
						property="answer(Object::ApplicationAttr::ValidationScript)"
						size="40" maxlength="10"
						styleClass="txtbox" styleId="versionNumber" />
					</td>
				</tr>

				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Rule Name
					</td>
					<td class="SearchResult">
						<html:text 
						property="answer(Object::ApplicationAttr::RuleName)"
						 styleClass="txtbox" />
					</td>
				
				</tr>

				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Rule Type
					</td>
					<td class="SearchResult">
						<html:text 
						property="answer(Object::ApplicationAttr::RuleType)"
						 styleClass="txtbox" />
					</td>
				
				</tr>

					<tr>
					<td class="sectionhead" width="15%" nowrap>
						Event To Fire
					</td>
					<td class="SearchResult">
						<html:text 
						property="answer(Object::ApplicationAttr::EventFired)"
						 styleClass="txtbox" />
					</td>
				
				</tr>

				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Active
					</td>
					<td class="SearchResult">
						<html:select
							property="answer(Object::ApplicationAttr::Active)"
							>
							<html:option value="Y">Active</html:option>
							<html:option value='D'>Deactive</html:option>
						</html:select>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<html:submit value="Save"
						property="button" styleClass="sbttn" />
					</td>
				</tr>
			
		</table>
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
 

   <html:hidden property="answer(Object::ApplicationAttr::CreatedBy)" value="<%=userName.toString()%>" /> 
   <html:hidden property="answer(Object::ApplicationAttr::UpdatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::ApplicationAttr::dbName)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
   <html:hidden property="answer(Object::ApplicationAttr::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	</html:form>
	</td>
	</tr>
	<tr>
		<td height="8px">
		</td>
	</tr>
	
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	

</table>

