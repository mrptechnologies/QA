<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="productId" property="answer(Object::Product::Document::PrdId)" name="AddProductDocumentDetail" />
<bean:define id="productVerId" property="answer(Object::Product::Document::PrdVerId)" name="AddProductDocumentDetail" />
<bean:define id="productDocType" property="answer(Object::Product::DocGroup::PrdDocType)" name="AddProductDocumentDetail" />

<html:form action="/DocumentAssociateToProductAction.do">
	<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
		<tr><td height="10"></td></tr>
			<dmshtml:getProductHeaderDetail nameInSession="prdProductDetail"
											productId="<%=""+productId %>" 
											productVerId="<%=""+productVerId %>" 
											ownerId="<%= Long.parseLong(""+ownerId) %>" 
											dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
			<logic:present name="prdProductDetail">
				<tr>
					<td>
						<table width="950px" align="Left" border="0" bgcolor="#C6DEEA">
							<tr>
								
								<td  class="FormLabels" align="left"  colspan="1" width="160px">
								Product Name 
								</td>
								
								<td align="left" class="sectionhead1"  colspan="1" width="215px">
									<a href="../GetProductAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<%=productId%>" >
									<bean:write name="prdProductDetail" property="MProductVerName" />&nbsp;
									</a>
								</td>
								
								<td  class="FormLabels" align="left"  colspan="1" width="160px">
								Product Type 
								</td>
								
								<td align="left" class="sectionhead1"  colspan="1" width="215px">
									<a><bean:write name="prdProductDetail" property="MProductType" />&nbsp; </a>
								</td>
															
							</tr>
							
							<tr>
							
								<td  class="FormLabels" align="left"  colspan="1" width="160px">
								Product Number 
								</td>
							
								<td align="left" class="sectionhead1"  colspan="1" width="215px">
									<a><bean:write name="prdProductDetail" property="MProductNum" />&nbsp; </a>
								</td>
							
								<td  class="FormLabels" align="left"  colspan="1" width="160px">
								Product Status
								</td>
							
								<td align="left" class="sectionhead1"  colspan="1" width="215px">
									<a><bean:write name="prdProductDetail" property="MProductVerStatus" />&nbsp; </a>
								</td>							
							</tr>
													
						</table>
					</td>
				</tr>
			</logic:present>

		<tr><td height="10"></td></tr>	

		<tr>
			<td class="NewSectionHead" colspan="4" align="center">DOCUMENT LIST</td>
		</tr>

		<tr>
			<td>&nbsp;</td>					
		</tr>
		
		<logic:present name="DocumentAssociateToProductMessage">
			
			<tr>
				<td width="40%" class="Error"><%= request.getAttribute("DocumentAssociateToProductMessage") %></td>
			</tr>
		
		</logic:present>
		
		<tr>
			<td height="15"></td>
		</tr>
		
		<tr>
			<td width="30%" class="FormLabels" align="left">
				Associated Document List
			</td>
		</tr>
		
		<tr>
			<td height="15"></td>
		</tr>		
		
		<tr>
			<td>
				<table width="880px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">		
								
			
					<dmshtml:getAssociatedDocumentList nameInSession="AssociatedDocumentList"
					   						documentType="<%=new String[]{""+productDocType}%>"
											productId="<%= ""+productId%>"
											productVersionId="<%= ""+productVerId%>"
											ownerId="<%= ""+ownerId%>"
											dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
								
						<tr>
							<td class="sectionheadLink" width="5%" align="center">Sl.No</td>
							<td class="sectionheadLink" width="10%" align="center">Document Number</td>						
							<td class="sectionheadLink" width="30%" align="center">Document Name</td>
							<td class="sectionheadLink" width="10%" align="center">Document Type</td>
												
							<td class="sectionheadLink" width="2%" align="center">Order Index</td>
							<td class="sectionheadLink" width="2%" align="center">Mandatory</td>
							<td class="sectionheadLink" width="2%" align="center">Repeated Document</td>
							<td class="sectionheadLink" width="10%" align="center">Rule Name</td>												
						</tr>
					<logic:present name="AssociatedDocumentList" scope="request">
						<% int i=0; %>
						<% int count=0; %>
						
							<logic:iterate id="AssociatedDocumentList" name="AssociatedDocumentList" scope="request">
								<% count++; %>
								<% 		
									String styleClass="";
									if(count%2==0){
										styleClass = "altdisply";
									}
									else{
										styleClass = "SearchResult";	
									}
								%>
							
								<tr>
									<td class=<%= styleClass %> align="center" width="5%">
										<%=++i%>
									</td>
									
									<td class=<%=styleClass %> align="left" width="10%">
										<bean:write name="AssociatedDocumentList" property="documentNum" />&nbsp;
									</td>
														
									<td class=<%=styleClass %> align="left" width="30%">
										<bean:write name="AssociatedDocumentList" property="documentName" />&nbsp;
									</td>
																			
									<td class=<%=styleClass %> align="left" width="10%">
										<bean:write name="AssociatedDocumentList" property="documentType" />&nbsp;
									</td>
									
									<logic:present name="arrayOfProductVerDetailList">
									
										<%
										java.util.ArrayList productVersionDetail = (java.util.ArrayList) request.getAttribute("arrayOfProductVerDetailList");
										int index = i;
										index--;
										com.dms.ejb.documentdefinition.ProductDocumentDefinitionDetail productDocumentDefinitionDetail = (com.dms.ejb.documentdefinition.ProductDocumentDefinitionDetail)productVersionDetail.get(index);
										%>										
										<td class=<%=styleClass %> align="left" width="2%">
											<%= ""+productDocumentDefinitionDetail.getOrderIndex() %>
										</td>
										
										<td class=<%=styleClass %> align="left" width="2%">
											<%= ""+productDocumentDefinitionDetail.getMantatory() %>
										</td>										
										
										<td class=<%=styleClass %> align="left" width="2%">
											<%= ""+productDocumentDefinitionDetail.getRepeatedDoc() %>
										</td>																				

										<td class=<%=styleClass %> align="left" width="10%">
											<%= ""+productDocumentDefinitionDetail.getRuleName() %>
										</td>
										
									</logic:present>
								</tr>
							</logic:iterate>			
					</logic:present>
				</table>
			</td>
		</tr>
		
		<tr>
			<td height="15"></td>
		</tr>
				
		<logic:notPresent name="DocumentAssociateToProductMessage">
		
		<tr>
			<td width="30%" class="FormLabels" align="left">
				Selected Document List For Association
			</td>
		</tr>
		
		<tr>
			<td height="15"></td>
		</tr>					
		
		<tr>
			<td>&nbsp;</td>					
		</tr>
		
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
				
					<tr>
						<td>
							<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
								<tr>
									<td align="right">
										<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/>&nbsp;&nbsp;
										<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>&nbsp;&nbsp;
										<html:submit value="Add" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>						
								</tr>										
							</table>
						</td>
					</tr>
							
					<tr>
						<td>
							<table width="880px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">
					
								<tr>
									<td class="sectionheadLink" width="2%" align="center">Sl.No</td>
									<td class="sectionheadLink" width="5%" align="center">Document Number</td>						
									<td class="sectionheadLink" width="30%" align="center">Document Name</td>
									<td class="sectionheadLink" width="5%" align="center">Order Index</td>
									<td class="sectionheadLink" width="5%" align="center">Repeated Document</td>
									<td class="sectionheadLink" width="5%" align="center">Mandatory</td>
									<td class="sectionheadLink" width="5%" align="center">State Code</td>
									<td class="sectionheadLink" width="5%" align="center">Rule Name</td>
									<!-- td class="sectionheadLink" width="10%" align="center">Document Type</td -->
								</tr>		
								
								<logic:present name="SelectedDocumentsDetails" scope="request">
									<% int i=0; %>
									<% int count=0; %>
									<logic:iterate id="SelectedDocumentsDetails" name="SelectedDocumentsDetails">
										<% count++; %>
										<% 		
											String styleClass="";
											if(count%2==0){
												styleClass = "altdisply";
											}
											else{
												styleClass = "SearchResult";	
											}
										%>			
										<%++i;%>
																
										<tr>
												<bean:define id="documentId" name="SelectedDocumentsDetails" property="documentId" />
												<bean:define id="versionId" name="SelectedDocumentsDetails" property="versionId" />
												
													<% String DocId_Key = "answer(Object::Product::Document::DocId::"+i+")"; %>						
													<% String DocVerId_Key = "answer(Object::Product::Document::DocVerId::"+i+")"; %>
													<% String OrderIndex_Key = "answer(Object::Product::Document::OrderIndex::"+documentId+")"; %>
													<% String RepeatedDoc_Key = "answer(Object::Product::Document::RepeatedDoc::"+documentId+")"; %>	
													<% String Mandatory_Key = "answer(Object::Product::Document::Mandatory::"+documentId+")"; %>
													<% String StateCode_Key = "answer(Object::Product::Document::StateCode::"+documentId+")"; %>
													<% String RuleName_Key = "answer(Object::Product::Document::RuleName::"+documentId+")"; %>
												<html:hidden property='answer(numOfSelectedDocument)' value='<%=""+i %>'/>
												<html:hidden property='<%=DocId_Key %>' value='<%=""+documentId %>' />
												<html:hidden property='<%=DocVerId_Key %>' value='<%=""+versionId %>' />
											<td class='<%= styleClass %>' width="2%" >
												<%= ""+i %>
												
											</td>
											<td class='<%= styleClass %>' width="5%" ><bean:write name="SelectedDocumentsDetails" property="documentNum" /></td>
											<td class='<%= styleClass %>' width="30%"><bean:write name="SelectedDocumentsDetails" property="documentName" /></td>					
											<td class='<%= styleClass %>' width="5%" ><html:text property='<%= OrderIndex_Key %>' styleId="OrderIndex" size="10" maxlength="10" styleClass="txtbox" /></td>
											<td class='<%= styleClass %>' width="5%" align="center" >
												<html:select property='<%= RepeatedDoc_Key %>' styleId="RepeatedDoc" styleClass="txtbox">
													<html:option value ="N">No</html:option>
													<html:option value ="Y">Yes</html:option>
												</html:select>
											</td>
											<td class='<%= styleClass %>' width="5%" align="center" >
												<html:select property='<%= Mandatory_Key %>' styleId="Mandatory" styleClass="txtbox">
													<html:option value ="N">No</html:option>
													<html:option value ="Y">Yes</html:option>
												</html:select>
											</td>
											 <td class='<%= styleClass %>' width="5%">
										         <html:select property="<%= StateCode_Key %>" styleClass="txtbox" styleId="StateCode" >
													<html:option value ="">Select</html:option>
													<html:option value="AK">Alaska</html:option>
													<html:option value="CA">California</html:option>
													<html:option value="CT">Connecticut</html:option>
													<html:option value ="DE">Delaware</html:option>
													<html:option value ="DC">District of Columbia</html:option>
													<html:option value="FL">Florida</html:option>
													<html:option value ="GA">Georgia</html:option>
													<html:option value="IA">Iowa</html:option>
													<html:option value="IL">Illinois</html:option>
													<html:option value="IN">Indiana</html:option>
													<html:option value="KS">Kansas</html:option>
													<html:option value="KY">Kentucky</html:option>
													<html:option value="LA">Louisiana</html:option>
													<html:option value ="MD">Maryland</html:option>
													<html:option value="ME">Maine</html:option>
													<html:option value="MO">Missouri</html:option>
													<html:option value="MS">Mississippi</html:option>
													<html:option value="MT">Montana</html:option>
													<html:option value ="NJ">New Jersey</html:option>
													<html:option value="NY">New York</html:option>
													<html:option value ="NC">North Carolina</html:option>
													<html:option value="ND">North Dakota</html:option>
													<html:option value="OH">Ohio</html:option>
													<html:option value="OK">Oklahoma</html:option>
													<html:option value ="PA">Pennsylvania</html:option>
													<html:option value="PR">Puerto Rico</html:option>
													<html:option value ="SC">South Carolina</html:option>
													<html:option value ="TX">Texas</html:option>
													<html:option value ="VA">Virginia</html:option>	
													<html:option value="WA">Washington</html:option>
													<html:option value="WV">West Virginia</html:option>												
												</html:select>
									        </td>
											<td class='<%= styleClass %>' width="5%" ><html:text property='<%= RuleName_Key %>' styleId="RuleName" size="15" maxlength="20" styleClass="txtbox" /></td>					
										</tr>
						
									</logic:iterate>
								</logic:present>
					
								<tr>
									<td>				
										<html:hidden property="answer(Object::Product::Document::PrdId)" value="<%=""+productId%>" />
										<html:hidden property="answer(Object::Product::Document::PrdVerId)" value="<%=""+productVerId%>" />
										<html:hidden property="answer(Object::Product::DocGroup::PrdDocType)" value="<%=""+productDocType%>" />
										<html:hidden property="answer(Object::Product::Document::Active)" value="Y" />
										<html:hidden property="answer(Object::Product::Document::CreatedBy)" value="<%=userName.toString()%>" />
										<html:hidden property="answer(Object::Product::Document::UpdatedBy)" value="<%=userName.toString()%>" />
										<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
								
					<tr>
						<td>
							<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
								<tr>
									<td align="right">
										<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/>&nbsp;&nbsp;
										<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>&nbsp;&nbsp;
										<html:submit value="Add" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>						
								</tr>										
							</table>
						</td>
					</tr>
					
				</table>
			</td>
		</tr>	
		</logic:notPresent>
	</table>
</html:form>