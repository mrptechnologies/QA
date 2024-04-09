<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<% String PrdId = request.getParameter("answer(Object::Product::Document::PrdId)"); %>
<% String PrdVerId = request.getParameter("answer(Object::Product::Document::PrdVerId)"); %>
<% String DocType = request.getParameter("answer(Object::Product::Document::Definition::DocType)"); %>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr><td height="10"></td></tr>
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">DOCUMENT LIST</td>
		</tr>
		
			<logic:present name="productVerDocumentVerDetailAssociated" scope="request">
				<tr><td width="40%" class="Error">Associated Success</td></tr>
			</logic:present>
		<tr>
		
			<td><hr size="1" noshade></td>
		</tr>
		<tr><td height="10"></td></tr>
		
		<tr>
			<td class="links" align="right" ><a href="../GetProductAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductId)=<%=PrdId%>" >
				Product Summary</a>
			</td>
		</tr>
		<tr><td height="10"></td></tr>
						
		<dmshtml:getDocumentListByDocumentType documentType="<%= ""+DocType %>"
					nameInSession="getListOfDocumentList"
					dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>"
					ownerId="<%= ""+ownerId %>" />
		<tr>
			<td>&nbsp;</td>					
		</tr>
		<tr>
			<td>
				<table width="880px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">
					<tr>
						<td class="sectionheadLink" align="center">Sl.No</td>
						<td class="sectionheadLink" align="center">Document Number</td>						
						<td class="sectionheadLink" align="center">Document Name</td>		
						<td class="sectionheadLink" align="center">Order Index</td>
						<td class="sectionheadLink" align="center">Mantatory</td>
						<td class="sectionheadLink" align="center">Repeated Index</td>
						<td class="sectionheadLink" align="center">Rule Name</td>
						<td class="sectionheadLink" align="center">Associated</td>						
					</tr>
					
					<logic:present name="getListOfDocumentList" scope="request">			
						<% int i=0; %>
						<% int count=0; %>
						
						<logic:iterate id="getListOfDocumentList" name="getListOfDocumentList" scope="request">
							<% count++; %>
							<% 		
								String styleClass="";
							
								if(count%2==0){
									styleClass = "altdisply";
								}else {
									styleClass = "SearchResult";	
								}
							%>
							<tr>
								<td class=<%= styleClass %> align="center" width="2%">
									<%=++i%>
								</td>
								
								<bean:define id="documentId" name="getListOfDocumentList" property="Object::Product::Document::Definition::DocId"/>
								<bean:define id="documentVerId" name="getListOfDocumentList" property="Object::Product::Document::Definition::VerId"/>
								
								<dmshtml:getProductVerDocumentVerDetail nameInSession="productDocumentDefinitionDetail" productId="<%= ""+PrdId %>"
											productVerId="<%=""+PrdVerId%>"
											documentId="<%=""+documentId %>"
											documentVerId="<%=""+documentVerId %>"
											dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>"
											ownerId="<%= ""+ownerId %>"/>
											
								
								<td class=<%=styleClass %> align="left" width="5%">
									<a href="../product/AddMoreDetailForPrdDocument.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Document::PrdId)=<%=PrdId%>&answer(Object::Product::Document::PrdVerId)=<%=PrdVerId%>&answer(Object::Product::Document::DocVerId)=<bean:write name="getListOfDocumentList" property="Object::Product::Document::Definition::VerId"/>&answer(Object::Product::Document::DocId)=<bean:write name="getListOfDocumentList" property="Object::Product::Document::Definition::DocId"/>&answer(Object::Product::Document::Definition::DocType)=<%=DocType%>">
										<bean:write name="getListOfDocumentList" property="Object::Product::Document::Definition::DocNum" />&nbsp;
									</a>
								</td>								
								
								<td class=<%=styleClass %> align="left" width="50%">
									<bean:write name="getListOfDocumentList" property="Object::Product::Document::Definition::DocName" />&nbsp;
								</td>
								
								<logic:present name="productDocumentDefinitionDetail" scope="request">
									
									<td class=<%=styleClass %> align="center" width="5%">
										<bean:write name="productDocumentDefinitionDetail" property="orderIndex" />&nbsp;
									</td>
									
									<td class=<%=styleClass %> align="center" width="5%">
										<bean:write name="productDocumentDefinitionDetail" property="mantatory" />&nbsp;
									</td>
									
									<td class=<%=styleClass %> align="center" width="5%">
										<bean:write name="productDocumentDefinitionDetail" property="repeatedDoc" />&nbsp;
									</td>							
									
									<td class=<%=styleClass %> align="center" width="15%">
										<bean:write name="productDocumentDefinitionDetail" property="ruleName" />&nbsp;
									</td>
			
									<td class=<%=styleClass %> align="center" width="4%">
										<bean:define id="active" name="productDocumentDefinitionDetail" property="active" />
										<% if(active.equals("Y")){ %>
											Yes
										<%}%>
									</td>
									
								</logic:present>
								
								<logic:notPresent name="productDocumentDefinitionDetail" scope="request">
								
									<td class=<%=styleClass %> align="center" width="5%">&nbsp;</td>
									<td class=<%=styleClass %> align="center" width="5%">&nbsp;</td>
									<td class=<%=styleClass %> align="center" width="5%">&nbsp;</td>
									<td class=<%=styleClass %> align="center" width="5%">&nbsp;</td>
									<td class=<%=styleClass %> align="center" width="5%">No</td>									
									
								</logic:notPresent>

												
							</tr>
						</logic:iterate>
					</logic:present>
				</table>
			</td>
		</tr>
		
		<tr><td>&nbsp;</td></tr>
</table>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>

		<td align="right">
			<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>						
	</tr>										
</table>	