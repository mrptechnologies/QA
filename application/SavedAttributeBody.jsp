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

<html:form action="/SaveAttribute" onsubmit="return validate()">


<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">



		<tr><td><html:hidden property="answer(dbname)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

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
				
				
				<logic:present name="PRDAttributeDetail" scope="request">
					<tr>
						<td class="Error">
						Attribute saved successfully
					</tr>
				</logic:present>

				<tr>
					<td height="5"></td>
				</tr>

				<tr>
					<td class="NewSectionHead" align="center">ATTRIBUTE SUMMARY</td>
				</tr>


				<tr>
					<td>&nbsp;</td>
				</tr>
				<bean:parameter id="status" name="status" value=""/>
				<logic:notEmpty name="status">
				<tr>
					<td class="Error">
				
					<logic:equal name="status" value="failure">Attribute save failed.</logic:equal>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				</logic:notEmpty>
				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />

<bean:define id="attributeId" name='AddAttribute'
			property='answer(Object::ApplicationAttr::AttributeId)' scope="request" />
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
							ATTRIBUTE DETAILS </td>

						</tr>

	

						<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left" >Attribute Name</td>
								<td class="TextMatter" align="left"><html:text
								name='AddAttribute'
								property="answer(Object::ApplicationAttr::AttributeName)" size="60"
								maxlength="120" styleClass="txtbox" styleId="attributeName" /></td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Attribute Description</td>
							<td class="TextMatter" align="left"><html:textarea
								name='AddAttribute' rows="4" cols="37"
								property="answer(Object::ApplicationAttr::AttributeDesc)"
								styleClass="txtarea" styleId="attributeDesc"  /></td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Data Type</td>
							<td class="TextMatter" align="left">
							<html:select name='AddAttribute'
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
							<td class="sectionhead1" align="left">Data Length</td>
							<td class="TextMatter" align="left"><html:text
								name='AddAttribute' property="answer(Object::ApplicationAttr::DataLength)"
								size="15" maxlength="20" styleClass="txtbox" /></td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left">Minimum Value</td>
							<td class="TextMatter" align="left"><html:text
								name='AddAttribute'
								property="answer(Object::ApplicationAttr::MinValue)" size="30"
								maxlength="30" styleClass="txtbox"  />

							</td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Maximum Value</td>
							<td class="TextMatter" align="left"><html:text
								name='AddAttribute'
								property="answer(Object::ApplicationAttr::MaxValue)" size="30"
								maxlength="30" styleClass="txtbox"  />

							</td>

						</tr>


<tr>
							<td class="sectionhead1" align="left" >Null or Empty Accepted</td>
							<td class="TextMatter" align="left"><html:select
								name='AddAttribute' property="answer(Object::ApplicationAttr::NullOrEmpty)"
								styleClass="txtbox"  >
								<html:option value='Y'>Yes</html:option>
								<html:option value='N'>No</html:option>
							</html:select></td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Validation Script</td>
							<td class="TextMatter" align="left"><html:text
								name='AddAttribute'
								property="answer(Object::ApplicationAttr::ValidationScript)" size="30"
								maxlength="30" styleClass="txtbox"  /></td>

						</tr>

						<tr>
							<td class="sectionhead1" align="left">Rule Name</td>
							<td class="TextMatter" align="left"><html:text
								name='AddAttribute' property="answer(Object::ApplicationAttr::RuleName)"
								size="30" maxlength="30" styleClass="txtbox"
								/></td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left">Rule Type</td>
							<td class="TextMatter" align="left"><html:text
								name='AddAttribute' property="answer(Object::ApplicationAttr::RuleType)"
								size="15" maxlength="20" styleClass="txtbox" /></td>
						</tr>

						<tr>
							<td class="sectionhead1" align="left">Event To Fire</td>
							<td class="TextMatter" align="left"><html:text
								name='AddAttribute'
								property="answer(Object::ApplicationAttr::EventFired)" size="30"
								maxlength="30" styleClass="txtbox"  />

							</td>

						</tr>
						<tr>
							<td class="sectionhead1" align="left">Active</td>
							<td class="TextMatter" align="left"><html:select
								name='AddAttribute' property="answer(Object::ApplicationAttr::Active)"
								styleClass="txtbox"  >
								<html:option value='Y'>Active</html:option>
								<html:option value='D'>Inactive</html:option>
							</html:select></td>

						</tr>



					</table>

				<tr>
					<td align="center">&nbsp;</td>
				</tr>


				<tr>
					<td align="center">&nbsp;</td>
				</tr>

				
			</table>
			</td>
		</tr>

		<tr>
			<td>
			<hr size="1" noshade width="95%">
			</td>
		</tr>

	<tr>
					<td align="center">&nbsp;</td>
				</tr>
					<tr>
					<td align="center">&nbsp;</td>
				</tr>

		<tr>
			<td align="center">
				<html:submit value="Save" property="answer(button)"
					styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
					onmouseout="this.style.color='#0042B0';" />
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn"
					onmouseover="this.style.color='#FF0D25';"
					onmouseout="this.style.color='#0042B0';" />
			</td>
		</tr>



		<tr><td>
		
		
</table>
<bean:define id="attributeId" name='AddAttribute'
			property='answer(Object::ApplicationAttr::AttributeId)' />
<html:hidden property="answer(Object::ApplicationAttr::AttributeId)"
			value="<%=""+attributeId%>" />
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 

   <html:hidden property="answer(Object::ApplicationAttr::CreatedBy)" value="<%=userName.toString()%>" /> 
   <html:hidden property="answer(Object::ApplicationAttr::UpdatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::ApplicationAttr::dbName)"
			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
   <html:hidden property="answer(Object::ApplicationAttr::OwnerId)" value="<%=ownerId.toString()%>" />

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />


</html:form>


