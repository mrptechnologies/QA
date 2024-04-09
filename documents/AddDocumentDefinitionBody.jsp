<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddDocument.js"></SCRIPT>

<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
	
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td>
			<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT DOCUMENT</td>
				</tr>

				<tr><td>&nbsp;</td></tr>				

				<tr>
					<td width="100%" align="center" class="sectionhead">DOCUMENT DETAILS</td>
				</tr>

				<tr><td>&nbsp;</td></tr>

				<logic:present name="AddDocumentDefinitionFailed" scope="request">
					<tr>
						<td class="Error">
							
							Document Definition Detail Added Failed
						
						</td>
					</tr>
				</logic:present>

				<tr><td>&nbsp;</td></tr>
											
				<tr>	
					<td>
						<html:form action="/AddDocumentDefinitionAction.do" onsubmit="return validateFields()" >		
							
							<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									<td class="TextMatter1">
										
										<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="2">
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Document Name *</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::DocName)" styleId="DocName" size="30" maxlength="120" styleClass="txtbox" /></td>
											</tr>
											
											<dmshtml:get_Document_Type nameInSession="documentTypeList" ownerId="<%= ""+ownerId %>"
																			dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
											<logic:present name="documentTypeList">
												<tr>
													<td width="35%" class="FormLabels" align="left">Document Type *</td>
													<td class="links">
														<html:select property="answer(Object::Product::Document::Definition::DocType)" styleId="DocType"  styleClass="txtbox" >
																<html:option value="">Select</html:option>
																
																<%
																	java.util.ArrayList documentType = (java.util.ArrayList)request.getAttribute("documentTypeList");
																	for(int documentIndex = 0 ; documentIndex < documentType.size() ; documentIndex++) {
																		com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) documentType.get(documentIndex);
																%>
																<html:option value="<%=qMap.getString("Object::Product::Document::Type::DocType")%>">
																	<%=qMap.getString("Object::Product::Document::Type::DocType")%>
																</html:option>
																<% } %>
														</html:select>
													</td>
												</tr>
											</logic:present>
											<tr>
												<td width="35%" class="FormLabels" align="left">Document Description</td>
												<td class="links"><html:textarea property="answer(Object::Product::Document::Definition::DocDesc)" styleId="DocDesc" rows="3" cols="29" styleClass="txtarea" /></td>
											</tr>

											<tr>
												<td width="35%" class="FormLabels" align="left">Document Source</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::DocSource)" styleId="DocSource" size="30" maxlength="120" styleClass="txtbox" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Release Status</td>
												<td class="links">
													<html:select property="answer(Object::Product::Document::Definition::ReleaseStatus)" styleId="ReleaseStatus" styleClass="txtbox">
 														<html:option value ="Development">Development</html:option>
														<html:option value ="Released">Released</html:option>
														<html:option value ="QA">QA</html:option>
													</html:select>
												</td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Version Name</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::VerName)" styleId="VerName" size="30" maxlength="120" styleClass="txtbox" /></td>
											</tr>											
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Version Description</td>
												<td class="links"><html:textarea property="answer(Object::Product::Document::Definition::VerDesc)" styleId="VerDesc" rows="3" cols="29" styleClass="txtarea" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Version Number</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::RevisionNumber)" styleId="RevisionNumber" size="20" maxlength="20" styleClass="txtbox" /></td>
											</tr>
																						
											<tr>
												<td width="35%" class="FormLabels" align="left">Dynamic Fields</td>
												<td class="links">
													<html:select property="answer(Object::Product::Document::Definition::DynamicFields)" styleId="DynamicFields" styleClass="txtbox">
														<html:option value ="N">No</html:option>
														<html:option value ="Y">Yes</html:option>
													</html:select>
												</td>
											</tr>											
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Document Number</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::DocNum)" styleId="DocNum" size="20" maxlength="40" styleClass="txtbox" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Document Sub-Number</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::DocSubNum)" styleId="DocSubNum" size="20" maxlength="40" styleClass="txtbox" /></td>
											</tr>

											<dmshtml:get_Document_Templ_Type nameInSession="arrayListOfDocTemplType" ownerId='<%= ""+ownerId %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
											
											<logic:present name="arrayListOfDocTemplType" scope="request">											
												<tr>
													<td width="35%" class="FormLabels" align="left">Document Template Type</td>
													<td class="links">
														<html:select property="answer(Object::Product::Document::Definition::DocTemplType)" styleId="DocTemplType"  styleClass="txtbox" >
																<%
																	java.util.ArrayList documentTemplType = (java.util.ArrayList)request.getAttribute("arrayListOfDocTemplType");
																	for(int documentIndex = 0 ; documentIndex < documentTemplType.size() ; documentIndex++) {
																		com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) documentTemplType.get(documentIndex);
																%>
																<html:option value="<%=qMap.getString("Object::Product::DocGroup::Format")%>">
																	<%=qMap.getString("Object::Product::DocGroup::Format")%>
																</html:option>
																<% } %>
														</html:select>
													</td>		
												</tr>
											</logic:present>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Document Template URL *</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::DocTemplUrl)" styleId="DocTemplUrl" size="30" maxlength="120" styleClass="txtbox" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Application Id</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::AppId)" styleId="AppId" size="10" maxlength="10" styleClass="txtbox" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Application Version Id</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::AppVerId)" styleId="AppVerId" size="10" maxlength="10" styleClass="txtbox" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Sub-Application Id</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::SubAppId)" styleId="SubAppId" size="10" maxlength="10" styleClass="txtbox" /></td>
											</tr>
																						
											<tr>
												<td width="35%" class="FormLabels" align="left">Sub-Application Version Id</td>
												<td class="links"><html:text property="answer(Object::Product::Document::Definition::SubAppVerId)" styleId="SubAppVerId" size="10" maxlength="10" styleClass="txtbox" /></td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Version Release Status</td>
												<td class="links">
													<html:select property="answer(Object::Product::Document::Definition::VerReleaseStatus)" styleId="VerReleaseStatus" styleClass="txtbox">
 														<html:option value ="Development">Development</html:option>
														<html:option value ="Released">Released</html:option>
														<html:option value ="QA">QA</html:option>
													</html:select>
												</td>
											</tr>
											
											<tr>
												<td width="30%" class="FormLabels" align="left" height="25">Release Date</td>
												<td class="links">
												<html:text  property ="answer(Release::Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="ReleaseMonth" onkeyup="if(this.value.length==2) {document.forms[0].ReleaseDate.focus()}" />&nbsp;
												<html:text  property ="answer(Release::Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="ReleaseDate" onkeyup="if(this.value.length==2) {document.forms[0].ReleaseYear.focus()}" />&nbsp;
												<html:text  property ="answer(Release::Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="ReleaseYear" onkeyup="if(this.value.length==4) {document.forms[0].ExpirationMonth.focus()}" />&nbsp;(MM/DD/YYYY)</td>
											</tr>
																						
											
											<tr>
												<td width="30%" class="FormLabels" align="left" height="25">Expiration Date</td>
												<td class="links">
												<html:text  property ="answer(Expiration::Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="ExpirationMonth" onkeyup="if(this.value.length==2) {document.forms[0].ExpirationDate.focus()}"/>&nbsp;
												<html:text  property ="answer(Expiration::Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="ExpirationDate" onkeyup="if(this.value.length==2) {document.forms[0].ExpirationYear.focus()}" />&nbsp;
												<html:text  property ="answer(Expiration::Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="ExpirationYear" />&nbsp;(MM/DD/YYYY)</td>
											</tr>
											
											<tr>
												<td width="35%" class="FormLabels" align="left">Active</td>
												<td class="links">
													<html:select property="answer(Object::Product::Document::Definition::Active)" styleId="Active" styleClass="txtbox">
														<html:option value ="Y">Yes</html:option>
														<html:option value ="N">No</html:option>														
													</html:select>
												</td>
											</tr>											
											
											<tr><td>&nbsp;</td></tr>
											<tr><td>&nbsp;</td></tr>
											
											<tr>
												<td>&nbsp;</td>
												<td align="left">
													<html:submit value="Save" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>&nbsp;&nbsp;&nbsp;
													<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
												</td>
											</tr>
											
											<tr>
												<td>
													<html:hidden property="answer(dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
													<html:hidden property="answer(Object::Product::Document::Definition::OwnerId)" value="<%= ""+ownerId %>" />
													<html:hidden property="answer(Object::Product::Document::Definition::VerActive)" value="Y" />
													<html:hidden property="answer(Object::Product::Document::Definition::CreatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Document::Definition::UpdatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Document::Definition::VerCreatedBy)" value="<%=userName.toString()%>" />
													<html:hidden property="answer(Object::Product::Document::Definition::ReleaseDate)" value="" styleId="inpReleaseDate"/>
													<html:hidden property="answer(Object::Product::Document::Definition::ExpDate)" value="" styleId="inpExpDate"/>
													<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
												</td>
											</tr>
											
										</table>										
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