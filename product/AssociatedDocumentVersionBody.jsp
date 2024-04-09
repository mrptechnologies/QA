<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type="text/javascript">
<!--

	function confirmDelete(){	
		
		var formElement = document.forms[0];
		var count = 0;
		for(var i=0; formElement.elements[i]!=null; i++) {
		
			if(formElement.elements[i].type=="checkbox" && formElement.elements[i].name == "answer(Object::Product::DocumentDetail)" && formElement.elements[i].checked == true) {
				count++;
				break;
			}
		}
		if(count>0) {
			var ans = window.confirm('Are you sure that you want to delete the selected records?');
			if (ans){
			   	formElement.submit();
			   	return true;				
			}else{
				return false;
			}
		} else {
			alert("Please select a record to delete.");
			return false;
		}
	}	
//-->
</script>

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<% String productId = request.getParameter("answer(Object::Product::Document::PrdId)"); %>
<% String productVerId = request.getParameter("answer(Object::Product::Document::PrdVerId)"); %>
<% String productDocType = request.getParameter("answer(Object::Product::DocGroup::PrdDocType)"); %>

<html:form action="/DeleteAssociatedPrdDocAction.do">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
			<tr><td height="10"></td></tr>
			
			<dmshtml:getProductHeaderDetail nameInSession="prdProductDetail"
											productId="<%=""+productId %>" 
											productVerId="<%=""+productVerId %>" 
											ownerId="<%= Long.parseLong(""+ownerId) %>" 
											dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
			<logic:present name="prdProductDetail">
				<tr>
					<td class="sectionhead1" colspan="3" align="center">
						<table width="95%" align="center" border="0" bgcolor="#C6DEEA">
							<tr>
								
								<td  class="FormLabels" align="left"  colspan="1" width="160px">Product Name </td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><a href="../GetProductVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<%=""+productId%>&answer(ProductVerId)=<%=""+productVerId%> "><bean:write name="prdProductDetail" property="MProductVerName" />&nbsp;</a></td>
								<td  class="FormLabels" align="left"  colspan="1" width="160px">Product Type </td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><a><bean:write name="prdProductDetail" property="MProductType" />&nbsp; </a></td>
							</tr>
							
							<tr>
								<td  class="FormLabels" align="left"  colspan="1" width="160px">Product Number </td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><a><bean:write name="prdProductDetail" property="MProductNum" />&nbsp; </a></td>
								<td  class="FormLabels" align="left"  colspan="1" width="160px">Product Status</td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><a><bean:write name="prdProductDetail" property="MProductVerStatus" />&nbsp; </a></td>							
							</tr>					
						</table>
					</td>
				</tr>
			</logic:present>
			
			<tr><td height="5"></td></tr>						
	
			<tr>
				<td>
					<table width="95%" align="center" border="0">
						<tr><td class="NewSectionHead" align="center">ASSOCIATED DOCUMENT'S VERSION LIST</td></tr>
						<tr><td><hr size="1" noshade></td></tr>
					</table>
				</td>
			</tr>	
			<tr><td height="10"></td></tr>
			<tr><td height="10"></td></tr>
			<tr>
				<td>
					<table width="95%" ALIGN="center" BORDER="0">
						<tr>
							<td align="right">
								<A HREF="../product/NonAssociatedVersionDocumentList.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=<%=productDocType%>&answer(Object::Product::Document::PrdVerId)=<%=productVerId%>&answer(Object::Product::Document::PrdId)=<%=productId%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>"><IMG SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0" ALT="Add"></A> 	
								<IMG SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0" ALT="Remove" onclick="confirmDelete()">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<table width="95%" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">
						<dmshtml:getAssociatedDocumentList nameInSession="AssociatedDocumentVersion"
						   						documentType="<%=new String[]{""+productDocType}%>"
												productId="<%= ""+productId%>"
												productVersionId="<%= ""+productVerId%>"
												ownerId="<%= ""+ownerId%>"
												dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							<tr>
								<td class="sectionheadLink" width="5%" align="center">Sl.No</td>
								<td class="sectionheadLink" width="10%" align="center">Document Number</td>						
								<!-- td class="sectionheadLink" width="40%" align="center">Document Name</td -->
								<td class="sectionheadLink" width="70%" align="center">Version Name</td>
								<td class="sectionheadLink" width="10%" align="center">Document Type</td>
								
								<td class="sectionheadLink" width="2%" align="center">Order Index</td>
								<td class="sectionheadLink" width="2%" align="center">Mandatory</td>
								<td class="sectionheadLink" width="2%" align="center">Repeated Document</td>
								<td class="sectionheadLink" width="8%" align="center">Rule Name</td>
													
								<td class="sectionheadLink" width="5%" align="center">Remove</td>
							</tr>
						<logic:present name="AssociatedDocumentVersion" scope="request">
							<% int i=0; %>
							<% int count=0; %>
							
								<logic:iterate id="AssociatedDocumentVersion" name="AssociatedDocumentVersion" scope="request">
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
											<bean:write name="AssociatedDocumentVersion" property="documentNum" />&nbsp;
										</td>
										
										<td class=<%=styleClass %> align="left" width="70%">
											<bean:write name="AssociatedDocumentVersion" property="versionName" />&nbsp;
										</td>																	
																				
										<td class=<%=styleClass %> align="left" width="10%">
											<bean:write name="AssociatedDocumentVersion" property="documentType" />&nbsp;
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
	
											<td class=<%=styleClass %> align="left" width="8%">
												<%= ""+productDocumentDefinitionDetail.getRuleName() %>
											</td>
																															
											<td class=<%=styleClass %> align="center" width="7%">
												<html:checkbox property="answer(Object::Product::DocumentDetail)" value='<%=""+productDocumentDefinitionDetail.getProductVerDocumentVerId()%>' styleId='<%="productDocumentIdCheckBox"+count%>' />
											</td>
																				
											<td>
												<html:hidden property="answer(Object::Product::Document::PrdId)" value="productId"/>
												<html:hidden property="answer(Object::Product::Document::PrdVerId)" value="productVerId"/>												
												<html:hidden property="answer(Object::Product::DocGroup::PrdDocType)" value="productDocType"/>												
											</td>
										</logic:present>
									</tr>
								</logic:iterate>			
						</logic:present>
					</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<table width="880px" ALIGN="center" BORDER="0">
						<tr>
							<td align="right">
								<A HREF="../product/NonAssociatedDocumentList.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::DocGroup::PrdDocType)=<%=productDocType%>&answer(Object::Product::Document::PrdVerId)=<%=productVerId%>&answer(Object::Product::Document::PrdId)=<%=productId%>&answer(Object::Product::Document::Definition::OwnerId)=<%=ownerId%>"><IMG SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0" ALT="Add"></A> 	
								<IMG SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0" ALT="Remove" onclick="confirmDelete()">
							</td>
						</tr>
					</table>
				</td>
			</tr>			
	</table>
</html:form>