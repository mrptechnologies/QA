
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<<script type="text/javascript">
<!--
	function validateFields() {
	
	formElement = document.forms[0];
		
	if(formElement.filename.value=="") {
		alert("Please Select a Factor File");
		return false;
	}
	
	}
	
//-->
</script>


<html:form action="/UploadFactors" enctype="multipart/form-data" onsubmit="return validateFields()">

	<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			<td height="5"></td>
		</tr>

		<tr>
			<td class="NewSectionHead" align="center" colspan="10">IMPORT
			FACTOR VALUES</td>
		</tr>

		<tr>
			<td height="8px"></td>
		</tr>



		<tr>
			<td valign="top">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
				CELLPADDING="0">

				<tr>
					<td class="FormLabels" colspan="6">
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Factor
					Name</td>
					<td class="links"><bean:write name="AddFactor"
						property="answer(Object::ProductFactors::FactorName)" /></td>
				</tr>
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Factor
					Description</td>
					<td class="links"><bean:write name="AddFactor"
						property="answer(Object::ProductFactors::FactorDesc)" /></td>
				</tr>
				<tr>
					<td class="FormLabels" align="left" height="25" width="20%">Factor
					Type</td>
					<td class="links" align="left"><bean:write
						property="answer(Object::ProductFactors::FactorType)"
						name="AddFactor" /></td>
				</tr>

				<tr>
					<td class="FormLabels" align="left" height="25" width="20%">Factor
					Object Type</td>
					<td class="links" align="left"><bean:write
						property="answer(Object::ProductFactors::FactorObjectType)"
						name="AddFactor" /></td>
				</tr>

				<tr>
					<td class="FormLabels" align="left" height="25" width="20%">Factor
					Object Name</td>
					<td class="links" align="left"><bean:write
						property="answer(Object::ProductFactors::FactorObjectName)"
						name="AddFactor" /></td>
				</tr>

				<bean:define id="VersionNumber"
					property="answer(Object::ProductFactors::VersionNumber)"
					name="AddFactor" scope="request" />
					
				<tr>
					<td class="FormLabels" align="left" height="25" width="20%">Factor
					Version Number</td>
					<td class="links" align="left"><bean:write
						property="answer(Object::ProductFactors::VersionNumber)"
						name="AddFactor" /></td>
				</tr>
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Factor version 
					Name</td>
					<td class="links"><bean:write name="AddFactor"
						property="answer(Object::ProductFactors::FactorVerName)" /></td>
				</tr>
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Factor version 
					Description</td>
					<td class="links"><bean:write name="AddFactor"
						property="answer(Object::ProductFactors::FactorVerDesc)" /></td>
				</tr>
				<tr>
					<td height="10px">&nbsp;&nbsp;</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td valign="top">
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0"
				CELLPADDING="0">
				<tr>
					<td class="FormLabels" align="Left" width="40%">Facor Excel
					file you want to import
					<td>
					<td class="TextMatter" align="Left"><html:file
						property="myFile" styleId="filename" /></td>
				</tr>

				<tr>
					<td height="10px">&nbsp;</td>
				</tr>

				<tr>

					<td>&nbsp;<html:submit value="Upload" styleClass="sbttn"
						property="answer(submit)"/></td>
				</tr>
			</table>
			</td>
		</tr>



		<tr>
			<td height="10px"></td>
		</tr>





	</table>

	<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />

	<bean:define id="factorObjectName"
		property="answer(Object::ProductFactors::FactorObjectName)"
		name="AddFactor" scope="request" />
	<bean:define id="factorObjectName"
		property="answer(Object::ProductFactors::FactorObjectName)"
		name="AddFactor" scope="request" />
	<bean:define id="FactorId"
		property="answer(Object::ProductFactors::FactorId)" name="AddFactor"
		scope="request" />
	<bean:define id="FactorVerId"
		property="answer(Object::ProductFactors::FactorVerId)"
		name="AddFactor" scope="request" />


	<html:hidden property="answer(Object::ProductFactors::dbName)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::ProductFactors::CreatedBy)"
		value="<%=""+userName %>" />
	<html:hidden property="answer(Object::ProductFactors::UpdatedBy)"
		value="<%=""+userName %>" />
	<html:hidden property="answer(Census::Excel::ConfirmImport)" value="No" />
	<html:hidden property="answer(ImportType)" value="UPLOAD_FILE" />
	<html:hidden property="userName" value="<%=userName.toString()%>" />

	<html:hidden property="answer(propertyFileName)"
		value="<%="FactorImport_"+factorObjectName%>" />
	<html:hidden property="answer(Object::ProductFactors::FactorId)"
		value="<%=""+FactorId%>" />
	<html:hidden property="answer(Object::ProductFactors::FactorVerId)"
		value="<%=""+FactorVerId%>" />
		<html:hidden property="answer(objectId)"
		value="<%=""+FactorId%>" />
	<html:hidden property="answer(objectVerId)"
		value="<%=""+FactorVerId%>" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>

