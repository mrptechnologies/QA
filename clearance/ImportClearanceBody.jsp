
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<html:form action="/ImportClearance.do" onsubmit="return submitForm()" enctype="multipart/form-data">
<table WIDTH="90%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">Import Clearance</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="90%" ALIGN="Right" border="0"CELLSPACING="2" CELLPADDING="0">
				<logic:present name="clearancesImported">
					<tr>
						<td class="sectionhead"> 
							<%=""+request.getAttribute("clearancesImported")%>
						</td>
					</tr>		
					<tr>
						<td>&nbsp;</td>
					</tr>		
				</logic:present>
				<logic:present name="ClearanceImportFailed">
					<tr>
						<td class="Error"> 
							<%=""+request.getAttribute("ClearanceImportFailed")%>
						</td>
					</tr>		
					<tr>
						<td>&nbsp;</td>
					</tr>		
				</logic:present>
				<tr>
					<td>
						<table WIDTH="90%" ALIGN="Right" border="0"CELLSPACING="2" CELLPADDING="0">
						
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									
									<table border="0" width="10%" cellspacing="2" cellpadding="2"
										style="{border-width:1px; border-style:solid; border-color: #999999;}">
																								
										<tr>
											<td class="sectionhead" colspan="2" align="center">
												IMPORT CLEARANCE
											</td>
										</tr>
										<tr>
											<td colspan="2">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td class="FormLabels" nowrap align="left">
												Select Clearance file (.csv) to upload :
											</td>
											<td>
												<html:file property="myFile" styleId="fileUrl" styleClass="txtbox" />
											</td>
										</tr>
										<tr>
											<td class="FormLabels" nowrap align="left">
												(Or)
											</td>											
										</tr>
										<tr>
											<td class="FormLabels" nowrap align="left">
												Give the File Path Here
											</td>
											<td>
												<html:text property="answer(Object::Clearance::DirectFilePath)" styleClass="txtbox" size="40"></html:text>
											</td>
										</tr>
										<tr>
											<td align="center" colspan="1">
												<html:submit value="Upload" styleClass="sbttn" />
											</td>
										</tr>
										<tr>
											<td colspan="3">
												&nbsp;
												<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
												<html:hidden property="answer(userNameId)" value="<%=usernameId.toString()%>" />
												<html:hidden property="answer(ClearanceImportActionType)" value="Import_Clearance" />
												<html:hidden property="answer(fileURL)" styleId="fileURL" />
											</td>
										</tr>
									</table>
									
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>			
		</td>
	</tr>	
</table>
</html:form>
<script type="text/javascript">
	function submitForm(){
		document.forms[0].fileURL.value = document.forms[0].fileUrl.value;
		return true;
	}
</script>
	
