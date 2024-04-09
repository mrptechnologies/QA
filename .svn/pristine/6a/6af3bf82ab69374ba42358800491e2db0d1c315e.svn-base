<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<link rel="stylesheet" href="styles/Styles.css" type="text/css" />


<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<table WIDTH="75%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">Data Import</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="1200px" ALIGN="Right" border="0"CELLSPACING="2" CELLPADDING="0">
				<logic:present name="agencyUploaded">
					<tr>
						<td class="Error"> 
							Agencies - Imported Successfully
						</td>
					</tr>		
					<tr>
						<td>&nbsp;</td>
					</tr>		
				</logic:present>
				<logic:present name="agencyUploadeFailed">
					<tr>
						<td class="Error"> 
							Agencies Import -Failed
						</td>
					</tr>		
					<tr>
						<td>&nbsp;</td>
					</tr>		
				</logic:present>
				<tr>
					<td>
						<table WIDTH="1200px" ALIGN="Right" border="0"CELLSPACING="2" CELLPADDING="0">
						
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									<html:form action="/AgencyImport.do" enctype="multipart/form-data">
									<table border="0" width="10%" cellspacing="2" cellpadding="2"
										style="{border-width:1px; border-style:solid; border-color: #999999;}">
																								
										<tr>
											<td class="sectionhead" colspan="2" align="center">
												IMPORT AGENCY
											</td>
										</tr>
										<tr>
											<td colspan="2">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td class="FormLabels" nowrap align="left">
												Select Agency file (.xml) to import :
											</td>
											<td>
												<html:file property="myFile" styleClass="txtbox" />
											</td>
										</tr>
										<tr>
											<td align="center" colspan="2">
												<html:submit value="Upload" styleClass="sbttn" />
											</td>
										</tr>
										<tr>
											<td colspan="3">
												&nbsp;
												<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
												<html:hidden property="answer(Object::XMLUpload::Agency::CreatedBy)" value="<%=usernameId.toString()%>" />
											</td>
										</tr>
									</table>
									</div>
									</div>
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
	