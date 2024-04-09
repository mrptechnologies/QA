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
%>
<% productId = "" + request.getParameter("answer(Object::Product::Tax::PrdProductId)");  %>   
<% productVerId = "" + request.getParameter("answer(Object::Product::Tax::PrdProductVerId)");%>   
<% stateCode = "" + request.getParameter("answer(Object::Product::Tax::StateCode)"); %> 

<html:form action="/AssociateStateTaxAction.do" onsubmit="return validateFields();">

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
			<td class="NewSectionHead" colspan="4" align="center">NON ASSOCIATED STATE TAX LIST</td>
		</tr>
		<dmshtml:getNonAssociatedStateTaxList nameInSession="getNonAssociatedStateTaxList" productId="<%=""+productId %>" productVersionId="<%=""+productVerId %>" stateCode="<%=""+stateCode %>" ownerId="<%=""+ownerId%>"  dbname="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>" />
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
							<html:submit value="Add Taxes" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>						
					</tr>										
				</table>
			</td>
		</tr>	
		
		<tr>
			<td>
				<table width="880px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">		
									
						<tr>
							<td class="sectionheadLink" width="5%" align="Left">Sl.No</td>
							<td class="sectionheadLink" width="10%" align="Left">Tax Name</td>						
							<td class="sectionheadLink" width="40%" align="Left">State Code</td>
							<td class="sectionheadLink" width="10%" align="Left">Territory</td>
							<td class="sectionheadLink" width="10%" align="Left">County Code</td>					
							<td class="sectionheadLink" width="5%" align="center">Version No</td>												
							<td class="sectionheadLink" width="5%" align="center">Version Desc</td>
							<td class="sectionheadLink" width="5%" align="center">Add Taxes</td>
						</tr>
					<logic:present name="getNonAssociatedStateTaxList" scope="request">
						<% int i=0; %>
						<% int count=0; %>
							<logic:iterate id="nonAssociatedStateTaxDetail"  name='getNonAssociatedStateTaxList'>
							<tr>
								<td class="SearchResult" align="left" width="8%">
									<%=++count%>
								</td>
	    						<td class="SearchResult" width="20%" id="TaxDescription">
	    							<bean:write name="nonAssociatedStateTaxDetail" property="taxDescription" />
								</td>
								<td class="SearchResult" width="20%" id="StateCode">
	    							<bean:write name="nonAssociatedStateTaxDetail" property="stateCode" />
								</td>
								<td class="SearchResult" width="20%" id="Territory">
	    							<bean:write name="nonAssociatedStateTaxDetail" property="territory" />
								</td>
								<td class="SearchResult" width="20%" id="CountyCode">
	    							<bean:write name="nonAssociatedStateTaxDetail" property="countyCode" />
								</td>
									<td class="SearchResult" width="20%" id="VersionNum" align="center">
	    							<bean:write name="nonAssociatedStateTaxDetail" property="versionNum" />
								</td>
								<td class="SearchResult" width="20%" id="VersionDesc" align="center">
	    							<bean:write name="nonAssociatedStateTaxDetail" property="versionDesc" />
								</td>
								<td>
									<bean:define id="stateTaxVerId" name="nonAssociatedStateTaxDetail" property="productTaxIdVer" />
									<html:checkbox property="answer(SelectedStateTaxDetails)" value="<%=""+stateTaxVerId%>" styleId="<%="SelectedStateTaxDetails"+count%>" />									
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
							<html:submit value="Add" styleClass="sbttn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>						
					</tr>										
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<html:hidden property="answer(Object::Product::Tax::mPrdCreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::mPrdUpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::PrdProductId)" value="<%=productId %>" />
				<html:hidden property="answer(Object::Product::Tax::PrdProductVerId)" value ="<%=productVerId %>" />
 				<html:hidden property="answer(Object::Product::Tax::StateCode)" value ="<%=stateCode%>" />	
 				<html:hidden property="answer(Object::Product::Tax::mProductOwnerId)" value="<%=""+ownerId %>" />			
			</td>
		</tr>
	</table>
</html:form>

<html:form action="/DisAssociateStateTaxAction.do" onsubmit="return validateFields();">
	
	<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
		<tr><td height="10"></td></tr>

		<tr>
			<td class="NewSectionHead" colspan="4" align="center">ASSOCIATED STATE TAX LIST</td>
		</tr>
			<dmshtml:getAssociatedStateTaxList nameInSession="getAssociatedStateTaxList" productId="<%=""+productId %>" productVersionId="<%=""+productVerId %>" stateCode="<%=""+stateCode %>" ownerId="<%=""+ownerId%>"  dbname="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>" />
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
							<html:submit value="Remove Taxes" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>						
					</tr>										
				</table>
			</td>
		</tr>	
		
		<tr>
			<td>
				<table width="880px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">		
									
						<tr>
							<td class="sectionheadLink" width="5%" align="Left">Sl.No</td>
							<td class="sectionheadLink" width="10%" align="Left">Tax Name</td>						
							<td class="sectionheadLink" width="40%" align="Left">State Code</td>
							<td class="sectionheadLink" width="10%" align="Left">Territory</td>
							<td class="sectionheadLink" width="10%" align="Left">County Code</td>	
							<td class="sectionheadLink" width="5%" align="center">Version No</td>												
							<td class="sectionheadLink" width="5%" align="center">Version Desc</td>
   						    <td class="sectionheadLink" width="5%" align="center">Remove Taxes</td>
						</tr>
					<logic:present name="getNonAssociatedStateTaxList" scope="request">
						<% int i=0; %>
						<% int count=0; %>
							<logic:iterate id="associatedStateTaxDetail"  name='getAssociatedStateTaxList'>
							<tr>
								<td class="SearchResult" align="left" width="8%">
									<%=++count%>
								</td>
	    						<td class="SearchResult" width="20%" id="TaxDescription">
	    							<bean:write name="associatedStateTaxDetail" property="taxDescription" />
								</td>
								<td class="SearchResult" width="20%" id="StateCode">
	    							<bean:write name="associatedStateTaxDetail" property="stateCode" />
								</td>
								<td class="SearchResult" width="20%" id="Territory">
	    							<bean:write name="associatedStateTaxDetail" property="territory" />
								</td>
								<td class="SearchResult" width="20%" id="CountyCode">
	    							<bean:write name="associatedStateTaxDetail" property="countyCode" />
								</td>
									<td class="SearchResult" width="20%" id="VersionNum" align="center">
	    							<bean:write name="associatedStateTaxDetail" property="versionNum" />
								</td>
								<td class="SearchResult" width="20%" id="VersionDesc" align="center">
	    							<bean:write name="associatedStateTaxDetail" property="versionDesc" />
								</td>
								<td>
									<bean:define id="associatedStateTaxVerId" name="associatedStateTaxDetail" property="productTaxIdVer" />
									<html:checkbox property="answer(AssociatedStateTaxDetails)" value="<%=""+associatedStateTaxVerId%>" styleId="<%="AssociatedStateTaxDetails"+count%>" />									
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
							<html:submit value="Remove" styleClass="sbttn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>						
					</tr>										
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<html:hidden property="answer(Object::Product::Tax::mPrdCreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::mPrdUpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::PrdProductId)" value="<%=productId %>" />
				<html:hidden property="answer(Object::Product::Tax::PrdProductVerId)" value ="<%=productVerId %>" />
 				<html:hidden property="answer(Object::Product::Tax::StateCode)" value ="<%=stateCode%>" />	
 				<html:hidden property="answer(Object::Product::Tax::mProductOwnerId)" value="<%=""+ownerId %>" />			
			</td>
		</tr>
	</table>
</html:form>