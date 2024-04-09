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

<bean:define id="productId" property="answer(Object::Product::Document::PrdId)" name="AssociatedDocumentList" />
<bean:define id="productVerId" property="answer(Object::Product::Document::PrdVerId)" name="AssociatedDocumentList" />
<bean:define id="productDocType" property="answer(Object::Product::DocGroup::PrdDocType)" name="AssociatedDocumentList" />

<html:form action="/EditAssociatedPrdDocAction.do">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
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
								<td  class="FormLabels" align="left"  colspan="1" width="160px">Product Name </td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><a href="../GetProductAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<%=productId%>" ><bean:write name="prdProductDetail" property="MProductVerName" />&nbsp;</a></td>
								<td  class="FormLabels" align="left"  colspan="1" width="160px">Product Type</td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><a><bean:write name="prdProductDetail" property="MProductType" />&nbsp; </a></td>
							</tr>
							
							<tr>
								<td  class="FormLabels" align="left"  colspan="1" width="160px">Product Number</td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><a><bean:write name="prdProductDetail" property="MProductNum" />&nbsp; </a></td>
								<td  class="FormLabels" align="left"  colspan="1" width="160px">Product Status</td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><a><bean:write name="prdProductDetail" property="MProductVerStatus" />&nbsp; </a></td>
							</tr>					
						</table>
					</td>
				</tr>
			</logic:present>
			
			<tr><td height="10"></td></tr>
			
			<tr><td class="NewSectionHead" colspan="4" align="center">EDIT ASSOCIATED DOCUMENT DETAILS</td></tr>

			<logic:present name="UpdatedSuccess" >
				<tr><td>Document Updated Successfully</td></tr>			
			</logic:present>
			
			<logic:present name="UpdatedFaild" >
				<tr><td>Document Updated Failed</td></tr>			
			</logic:present>

			<tr><td><hr size="1" noshade="noshade"></td></tr>
			
			<tr><td height="10"></td></tr>
			
			<tr>
				<td>
					<table width="880px" ALIGN="center" BORDER="0">
						<tr>
							<td align="right">
								<html:submit value="Update" property="answer(Save)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" />&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<table width="950px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">		
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
								<td class="sectionheadLink" width="20%" align="center">Rule Name</td>
								<td class="sectionheadLink" width="7%" align="center">Remove</td>
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
										<td class=<%= styleClass %> align="center" width="5%"><%=++i%></td>
										<td class=<%=styleClass %> align="left" width="10%"><bean:write name="AssociatedDocumentList" property="documentNum" />&nbsp;</td>
										<td class=<%=styleClass %> align="left" width="50%"><bean:write name="AssociatedDocumentList" property="documentName" />&nbsp;</td>
										<td class=<%=styleClass %> align="left" width="10%"><bean:write name="AssociatedDocumentList" property="documentType" />&nbsp;</td>
										
										<logic:present name="arrayOfProductVerDetailList">
										
											<%
											java.util.ArrayList productVersionDetail = (java.util.ArrayList) request.getAttribute("arrayOfProductVerDetailList");
											int index = i;
											index--;
											com.dms.ejb.documentdefinition.ProductDocumentDefinitionDetail productDocumentDefinitionDetail = (com.dms.ejb.documentdefinition.ProductDocumentDefinitionDetail)productVersionDetail.get(index);
											%>
											
											<%
												String OrderIndex_Key = "answer(Object::Product::Document::OrderIndex::"+productDocumentDefinitionDetail.getProductVerDocumentVerId()+")";
												String RepeatedDoc_Key = "answer(Object::Product::Document::RepeatedDoc::"+productDocumentDefinitionDetail.getProductVerDocumentVerId()+")";
												String Mandatory_Key = "answer(Object::Product::Document::Mandatory::"+productDocumentDefinitionDetail.getProductVerDocumentVerId()+")";
												String StateCode_Key = "answer(Object::Product::Document::StateCode::"+productDocumentDefinitionDetail.getProductVerDocumentVerId()+")";
												String RuleName_Key = "answer(Object::Product::Document::RuleName::"+productDocumentDefinitionDetail.getProductVerDocumentVerId()+")";
												String ProductVerId_Key = "answer(Object::Product::Document::ProductVerId::"+i+")";

											%>
												
											<td class=<%=styleClass %> align="left" width="2%"><html:text property="<%=OrderIndex_Key%>" value='<%= ""+productDocumentDefinitionDetail.getOrderIndex() %>' styleId="OrderIndex" size="10" maxlength="10" styleClass="txtbox" /></td>
											
											<td class='<%= styleClass %>' width="5%" align="center" >
												<html:select property="<%=Mandatory_Key%>" value='<%=productDocumentDefinitionDetail.getMantatory()%>' styleId="Mandatory" styleClass="txtbox">
													<html:option value ="N">No</html:option>
													<html:option value ="Y">Yes</html:option>
												</html:select>
											</td>											
											
											<td class='<%= styleClass %>' width="5%" align="center" >
												<html:select property="<%=RepeatedDoc_Key%>" styleId="RepeatedDoc" value='<%=productDocumentDefinitionDetail.getRepeatedDoc()%>' styleClass="txtbox">
													<html:option value ="N">No</html:option>
													<html:option value ="Y">Yes</html:option>
												</html:select>
											</td>
											
											 <td class='<%= styleClass %>' width="5%">
										         <html:select property="<%=StateCode_Key%>" styleClass="txtbox" value='<%=productDocumentDefinitionDetail.getStateCode()%>' styleId="StateCode" >
													<html:option value ="">Select</html:option>
													<html:option value ="DE">Delaware</html:option>
													<html:option value ="DC">District of Columbia</html:option>
													<html:option value ="GA">Georgia</html:option>
													<html:option value ="MD">Maryland</html:option>
													<html:option value ="NJ">New Jersey</html:option>
													<html:option value ="NC">North Carolina</html:option>
													<html:option value ="PA">Pennsylvania</html:option>
													<html:option value ="SC">South Carolina</html:option>
													<html:option value ="VA">Virginia</html:option>
												</html:select>
									        </td>											
											
											<td class='<%= styleClass %>' width="5%" ><html:text property="<%=RuleName_Key%>" value='<%=productDocumentDefinitionDetail.getRuleName()%>' styleId="RuleName" size="15" maxlength="20" styleClass="txtbox" /></td>
											<td>
												<html:hidden property="answer(Object::Product::Document::PrdId)" value="productId"/>
												<html:hidden property="answer(Object::Product::Document::PrdId)" value="productId"/>
												<html:hidden property="answer(Object::Product::Document::PrdVerId)" value="productVerId"/>												
												<html:hidden property="answer(Object::Product::DocGroup::PrdDocType)" value="productDocType"/>
												<html:hidden property='<%=ProductVerId_Key%>' value='<%=""+productDocumentDefinitionDetail.getProductVerDocumentVerId()%>'/>
												<html:hidden property='answer(numOfSelectedDocument)' value='<%=""+i %>'/>												
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
								<html:submit value="Update" property="answer(Save)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" />&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>			
	</table>
</html:form>