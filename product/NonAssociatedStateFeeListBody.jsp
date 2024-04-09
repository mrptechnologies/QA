<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<%
	String productId = "";
	String productVerId = "";
    String stateCode = "";  
    String ProductFeeName = "";
	long ProductFeeId =0;
%>
<% productId = "" + request.getParameter("answer(Object::Product::Fee::PrdProductId)");  %>   
<% productVerId = "" + request.getParameter("answer(Object::Product::Fee::PrdProductVerId)");%>   
<% stateCode = "" + request.getParameter("answer(Object::Product::Fee::StateCode)"); %> 

<html:form action="/AssociateStateFeeAction.do" onsubmit="return validateFields();">
	
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		 	<tr>
				<td>				
					<jsp:include page="../common/ProductHeader.jsp">
						<jsp:param name="ProductId" value="<%=productId.toString()%>" />
						<jsp:param name="ProductVerId" value="<%=productVerId.toString()%>" />
					</jsp:include>
				 </td>
			</tr>
	</table> 
	
	<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
		<tr><td height="10"></td></tr>

		<tr>
			<td class="NewSectionHead" colspan="4" align="center">NON ASSOCIATED STATE FEE LIST</td>
		</tr>
		<dmshtml:getNonAssociatedStateFeeList nameInSession="getNonAssociatedStateFeeList" productId="<%=""+productId %>" productVersionId="<%=""+productVerId %>" stateCode="<%=""+stateCode %>" ownerId="<%=""+ownerId%>"  dbname="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>" />
		<tr>
			<td>&nbsp;</td>					
		</tr>
		
		<tr>
			<td>
				<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
					<tr>
						<td align="right">
							<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/>&nbsp;&nbsp;
							<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>&nbsp;&nbsp;
							<html:submit value="Add Fees" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>						
					</tr>										
				</table>
			</td>
		</tr>	
		
		<tr>
			<td>
				<table width="880px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">		
									
						<tr>
							<td class="sectionheadLink" width="5%" align="center">Sl.No</td>
							<td class="sectionheadLink" width="10%" align="center">Fee Name</td>						
							<td class="sectionheadLink" width="20%" align="center">State Code</td>
							<td class="sectionheadLink" width="5%" align="center">Territory</td>
							<td class="sectionheadLink" width="5%" align="center">County Code</td>
							<td class="sectionheadLink" width="5%" align="center">Version No</td>												
							<td class="sectionheadLink" width="5%" align="center">Version Desc</td>
							<td class="sectionheadLink" width="10%" align="center">Add Fees</td>
						</tr>
					
					<logic:present name="getNonAssociatedStateFeeList" scope="request">

						<% int i=0; %>
						<% int count=0; %>
							<logic:iterate id="nonAssociatedStateFeeDetail"  name='getNonAssociatedStateFeeList'>

							<tr>
								<td class="SearchResult" align="center" width="8%">
									<%=++count%>
								</td>
								
								
	    						<td class="SearchResult" width="20%" id="FeeDescription" align="center">
		    						<a href="../AssociatedStatesListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&FeeName=<bean:write name="nonAssociatedStateFeeDetail" property="feeName" />&ProductFeeId=<bean:write name="nonAssociatedStateFeeDetail" property="productFeeId" />">
		    							<bean:write name="nonAssociatedStateFeeDetail" property="feeDescription" />
		    						</a>
								</td>
								<td class="SearchResult" width="20%" id="StateCode" align="center">
									<a href ="../GetStateFeeAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&productStateFeeId=<bean:write name="nonAssociatedStateFeeDetail" property="productStateFeeId" />&productStateFeeVerId=<bean:write name="nonAssociatedStateFeeDetail" property="productFeeIdVer" />">
										<bean:write name="nonAssociatedStateFeeDetail" property="stateCode" />
									</a>
								</td>
								<td class="SearchResult" width="20%" id="Territory" align="center">
	    							<bean:write name="nonAssociatedStateFeeDetail" property="territory" />
								</td>
								<td class="SearchResult" width="20%" id="CountyCode" align="center">
	    							<bean:write name="nonAssociatedStateFeeDetail" property="countyCode" />
								</td>
								<td class="SearchResult" width="20%" id="VersionNum" align="center">
	    							<bean:write name="nonAssociatedStateFeeDetail" property="versionNum" />
								</td>
								<td class="SearchResult" width="20%" id="VersionDesc" align="center">
	    							<bean:write name="nonAssociatedStateFeeDetail" property="versionDesc" />
								</td>
								<td width="5%" align="center">
									<bean:define id="stateFeeVerId" name="nonAssociatedStateFeeDetail" property="productFeeIdVer" />
									<html:checkbox property="answer(SelectedStateFeeDetails)" value="<%=""+stateFeeVerId%>" styleId="<%="SelectedStateFeeDetails"+count%>" />									
								</td>
								
								
							</tr>
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
							<html:submit value="Add Fees" styleClass="sbttn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>						
					</tr>										
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<html:hidden property="answer(Object::Product::Fee::mPrdCreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::mPrdUpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::PrdProductId)" value="<%=productId %>" />
				<html:hidden property="answer(Object::Product::Fee::PrdProductVerId)" value ="<%=productVerId %>" />
 				<html:hidden property="answer(Object::Product::Fee::StateCode)" value ="<%=stateCode%>" />	
 				<html:hidden property="answer(Object::Product::Fee::mProductOwnerId)" value="<%=""+ownerId %>" />	
 				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />		
			</td>
		</tr>
	</table>
</html:form>

<html:form action="/DisAssociateStateFeeAction.do" onsubmit="return validateFields();">
	
	<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
		<tr><td height="10"></td></tr>

		<tr>
			<td class="NewSectionHead" colspan="4" align="center">ASSOCIATED STATE FEE LIST</td>
		</tr>
			<dmshtml:getAssociatedStateFeeList nameInSession="getAssociatedStateFeeList" productId="<%=""+productId %>" productVersionId="<%=""+productVerId %>" stateCode="<%=""+stateCode %>" ownerId="<%=""+ownerId%>"  dbname="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>" />
		<tr>
			<td>&nbsp;</td>					
		</tr>
		
		<tr>
			<td>
				<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
					<tr>
						<td align="right">
							<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/>&nbsp;&nbsp;
							<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>&nbsp;&nbsp;
							<html:submit value="Remove Fees" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>						
					</tr>										
				</table>
			</td>
		</tr>	
		
		<tr>
			<td>
				<table width="880px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">		
									
						<tr>
							<td class="sectionheadLink" width="5%" align="center">Sl.No</td>
							<td class="sectionheadLink" width="10%" align="center">Fee Name</td>						
							<td class="sectionheadLink" width="20%" align="center">State Code</td>
							<td class="sectionheadLink" width="10%" align="center">Territory</td>
							<td class="sectionheadLink" width="10%" align="center">County Code</td>					
							<td class="sectionheadLink" width="10%" align="center">Version No</td>	
							<td class="sectionheadLink" width="10%" align="center">Version Desc</td>	
							<td class="sectionheadLink" width="7%" align="center">Remove Fees</td>
						</tr>
					<logic:present name="getNonAssociatedStateFeeList" scope="request">
						<% int i=0; %>
						<% int count=0; %>
							<logic:iterate id="associatedStateFeeDetail"  name='getAssociatedStateFeeList'>
							<tr>
								<td class="SearchResult" align="center" width="8%">
									<%=++count%>
								</td>
	    						<td class="SearchResult" width="20%" id="FeeDescription" align="center">
	    							<a href="../AssociatedStatesListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&FeeName=<bean:write name="associatedStateFeeDetail" property="feeName" />&ProductFeeId=<bean:write name="associatedStateFeeDetail" property="productFeeId" />">
		    							<bean:write name="associatedStateFeeDetail" property="feeDescription" />
		    						</a>
								</td>
								<td class="SearchResult" width="20%" id="StateCode" align="center">
									<a href ="../GetStateFeeAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&productStateFeeId=<bean:write name="associatedStateFeeDetail" property="productStateFeeId" />&productStateFeeVerId=<bean:write name="associatedStateFeeDetail" property="productFeeIdVer" />">
										<bean:write name="associatedStateFeeDetail" property="stateCode" />
									</a>
								</td>
								<td class="SearchResult" width="20%" id="Territory" align="center">
	    							<bean:write name="associatedStateFeeDetail" property="territory" />
								</td>
								<td class="SearchResult" width="20%" id="CountyCode" align="center">
	    							<bean:write name="associatedStateFeeDetail" property="countyCode" />
								</td>
								<td class="SearchResult" width="20%" id="VersionNum" align="center">
	    							<bean:write name="associatedStateFeeDetail" property="versionNum" />
								</td>
								<td class="SearchResult" width="20%" id="VersionDesc" align="center">
	    							<bean:write name="associatedStateFeeDetail" property="versionDesc" />
								</td>
								<td width="5%" align="center">
									<bean:define id="associatedStateFeeVerId" name="associatedStateFeeDetail" property="productFeeIdVer" />
									<html:checkbox property="answer(AssociatedStateFeeDetails)" value="<%=""+associatedStateFeeVerId%>" styleId="<%="AssociatedStateFeeDetails"+count%>" />									
								</td>
								
								
							</tr>
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
							<html:submit value="Remove Fees" styleClass="sbttn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>						
					</tr>										
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<html:hidden property="answer(Object::Product::Fee::mPrdCreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::mPrdUpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::PrdProductId)" value="<%=productId %>" />
				<html:hidden property="answer(Object::Product::Fee::PrdProductVerId)" value ="<%=productVerId %>" />
 				<html:hidden property="answer(Object::Product::Fee::StateCode)" value ="<%=stateCode%>" />	
 				<html:hidden property="answer(Object::Product::Fee::mProductOwnerId)" value="<%=""+ownerId %>" />	
 				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />		
			</td>
		</tr>
	</table>
</html:form>
 