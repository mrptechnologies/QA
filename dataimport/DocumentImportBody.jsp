<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<link rel="stylesheet" href="styles/Styles.css" type="text/css" />

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<bean:parameter name="answer(Object::Product::Document::Definition::DocId)" id="documentId" />
<bean:parameter name="answer(Object::Product::Document::Definition::VerId)" id="documentVerId"/>



<table WIDTH="75%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">Document Import</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="Right" border="0"CELLSPACING="2" CELLPADDING="0">
				<logic:present name="documentUploaded">
					<tr>
						<td class="Error"> 
							Document - Imported Successfully
						</td>
					</tr>		
					<tr>
						<td>&nbsp;</td>
					</tr>		
				</logic:present>
				<logic:present name="documentUploadeFailed">
					<tr>
						<td class="Error"> 
							Document Import -Failed
						</td>
					</tr>		
					<tr>
						<td>&nbsp;</td>
					</tr>		
				</logic:present>
				<tr>
					<td>
						<table WIDTH="760px" ALIGN="Right" border="0"CELLSPACING="2" CELLPADDING="0">
						
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									<html:form action="/DocumentImport.do?inition::VerId)" enctype="multipart/form-data">
									<table border="0" width="10%" cellspacing="2" cellpadding="2"
										style="{border-width:1px; border-style:solid; border-color: #999999;}">
																								
										<tr>
											<td class="sectionhead" colspan="2" align="center">
												IMPORT DOCUMENT
											</td>
										</tr>
										<tr>
											<td colspan="2">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td class="FormLabels" nowrap align="left">
												Document Template Relative Path
											</td>										
											
											<td class="links"><html:text property="answer(relativePath)" size="50" maxlength="64" styleClass="txtbox"/></td>
										</tr>
										
										<tr>
										
											<td class="FormLabels" nowrap align="left">
												Local Document File
											</td>
											
											<td>
												<html:file property="myFile" styleClass="txtbox" />
												
											</td>
											
										</tr>
										<tr>
											<td align="center" colspan="2">
												<html:submit value="Upload" styleClass="sbttn" />
											</td>
											<td align="center" colspan="2">
											&nbsp;												
											</td>
										</tr>	
											
									
										<tr>
											<td colspan="3">
												&nbsp;
												
											</td>
											
										</tr>
										
										<tr>
											<td colspan="3">
												<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
												<html:hidden property="answer(Object::Product::Document::Definition::OwnerId)" value="<%=ownerId.toString()%>"  />												
												<html:hidden property="answer(Object::Product::Document::Definition::DocId)" value="<%=documentId.toString()%>" />
												<html:hidden property="answer(Object::Product::Document::Definition::VerId)" value="<%=documentVerId.toString()%>" />
											</td>
										</tr>
										
										
									</table>
										</html:form>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>	
</table>