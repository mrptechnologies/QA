<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<script type="text/javascript">
<!--
	function validateFields(){	
		
		var formElement = document.forms[0];
		var count = 0;
		for(var i=0; formElement.elements[i]!=null; i++) {
		
			if(formElement.elements[i].type=="checkbox" && formElement.elements[i].name == "answer(SelectedDocumentsDetails)" && formElement.elements[i].checked == true) {
				count++;
				break;
			}
		}
		
		if(count<=0) {
			alert("Please select document for add.");
			return false;
		} else {
			return true;
		}
	}
//-->
</script>

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<% String productId = request.getParameter("answer(Object::Product::Document::PrdId)"); %>
<% String productVerId = request.getParameter("answer(Object::Product::Document::PrdVerId)"); %>
<% String productDocType = request.getParameter("answer(Object::Product::DocGroup::PrdDocType)"); %>

<html:form action="/AddProductDocumentVersionDetailsAction.do" onsubmit="return validateFields();">
	
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
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><a href="../GetProductVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<%=""+productId%>&answer(ProductVerId)=<%=""+productVerId%> " ><bean:write name="prdProductDetail" property="MProductVerName" />&nbsp;</a></td>
								<td  class="FormLabels" align="left"  colspan="1" width="160px">Product Type</td>
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

		<tr><td height="10"></td></tr>			

		<tr><td class="NewSectionHead" colspan="4" align="center">DOCUMENT VERSION LIST</td></tr>

		<tr><td>&nbsp;</td></tr>
		
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

					<dmshtml:getNonAssociatedDocumentVersionsList nameInSession="NonAssociatedDocumentVersionsList"
								productId="<%= ""+productId%>"
								productVersionId="<%= ""+productVerId%>"
								productDocumentType="<%= productDocType%>"
								ownerId="<%= ""+ownerId%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							
						<tr>
							<td class="sectionheadLink" width="5%" align="center">Sl.No</td>
							<td class="sectionheadLink" width="10%" align="center">Document Number</td>						
							<td class="sectionheadLink" width="30%" align="center">Document Name</td>
							<td class="sectionheadLink" width="10%" align="center">Version Name</td>
							<td class="sectionheadLink" width="10%" align="center">Document Type</td>					
							<td class="sectionheadLink" width="5%" align="center">Add</td>
						</tr>
					<logic:present name="NonAssociatedDocumentVersionsList" scope="request">
						<% int i=0; %>
						<% int count=0; %>
							<logic:iterate id="NonAssociatedDocumentVersionsList" name="NonAssociatedDocumentVersionsList" scope="request">
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
								<td class=<%=styleClass %> align="left" width="10%"><bean:write name="NonAssociatedDocumentVersionsList" property="documentNum" />&nbsp;</td>
								<td class=<%=styleClass %> align="left" width="30%"><bean:write name="NonAssociatedDocumentVersionsList" property="documentName" />&nbsp;</td>
								<td class=<%=styleClass %> align="left" width="30%"><bean:write name="NonAssociatedDocumentVersionsList" property="versionName" />&nbsp;</td>								
								<td class=<%=styleClass %> align="left" width="10%"><bean:write name="NonAssociatedDocumentVersionsList" property="documentType" />&nbsp;</td>
								<td class=<%=styleClass %> align="center" width="5%">
									<bean:define id='documentId' name="NonAssociatedDocumentVersionsList" property="documentId" />
									<bean:define id='versionId' name="NonAssociatedDocumentVersionsList" property="versionId" />
									<bean:define id='documentName' name="NonAssociatedDocumentVersionsList" property="documentName" />
									<bean:define id='documentNum' name="NonAssociatedDocumentVersionsList" property="documentNum" />
									<bean:define id='versionName' name="NonAssociatedDocumentVersionsList" property="versionName" />
									<html:checkbox property="answer(SelectedDocumentsDetails)" value="<%=documentId+"&&"+versionId+"&&"+documentName+"&&"+documentNum+"&&"+versionName%>" styleId="<%="SelectedDocumentsDetails"+count%>" />									
								</td>
															
							</logic:iterate>			
					</logic:present>
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
							<html:submit value="Add" styleClass="sbttn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>						
					</tr>										
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<html:hidden property="answer(Object::Product::Document::PrdId)" value="<%=productId%>" />
				<html:hidden property="answer(Object::Product::Document::PrdVerId)" value="<%=productVerId%>" />
				<html:hidden property="answer(Object::Product::DocGroup::PrdDocType)" value="<%=productDocType%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
			</td>
		</tr>
	</table>
</html:form>