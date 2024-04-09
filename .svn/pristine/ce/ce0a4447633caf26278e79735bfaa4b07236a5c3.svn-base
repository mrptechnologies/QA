
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/FindFactor">
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			<td height="5"></td>
		</tr>

		<tr>
			<td class="NewSectionHead" align="center" colspan="10">FIND FACTOR</td>
		</tr>

		<tr>
			<td height="8px"></td>
		</tr>


		<tr>
			<td valign="top">
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"
				CELLPADDING="0">

				<tr>
					<td class="FormLabels" colspan="6">
			
						<tr>
							<td width="20%" class="FormLabels" align="left" height="25">Factor
							Name</td>
							<td class="links"><dmshtml:dms_text name="FindFactor"
								property="answer(ProductFactors::Like::FactorName)" size="60"
								maxlength="60" styleClass="txtbox" /></td>
						</tr>
						<tr>
							<td width="20%" class="FormLabels" align="left" height="25">Factor
							Description</td>
							<td class="links"><dmshtml:dms_text name="FindFactor"
								property="answer(ProductFactors::Like::FactorDesc)" size="60"
								maxlength="60" styleClass="txtbox" /></td>
						
						

						
						<tr>

							<td>&nbsp;<html:submit value="Search" styleClass="sbttn"
								property="answer(submit)" /></td>
						</tr>

				
				
			</table>
			</td>
		</tr>
	
		
		<logic:present name="ProductFactorDetail" scope="request">
		<tr>
			<td >&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td class="mainhead" align="center">Search Result</td>
		</tr>
		
			<bean:define id="arrFactordetail" name="ProductFactorDetail"	type="java.util.ArrayList" />
		<tr>
			<td valign="top">
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >

				<tr>
					<td class="sectionhead" width="3%">No.</td>
					<td class="sectionhead" width="10%" align="center">Factor Name</td>
					<td class="sectionhead" width="15%" align="center">Description</td>
					<td class="sectionhead" width="10%" align="center">Object Name</td>
					<td class="sectionhead" width="10%" align="center">Object Type</td>
					<td class="sectionhead" width="5%" align="center">Version Number</td>
				</tr>
				
				<%for(int i=0;i<arrFactordetail.size();i++) { 
				    com.dms.ejb.product.ProductFactors.PRDProductFactorsDetail productFactorsDetail = 
				        (com.dms.ejb.product.ProductFactors.PRDProductFactorsDetail)arrFactordetail.get(i);
				
				    long factorId=productFactorsDetail.getFactorId();
			        long factorVerId=productFactorsDetail.getFactorVerId();
				%>
				<tr>
					
					<td class="SearchResult"><A HREF="../GetFactor.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductFactors::Equals::FactorId)=<%=""+factorId%>
					&answer(ProductFactors::Equals::FactorVerId)=<%=""+factorVerId%>"><%=(i+1)%></A></td>
					<td class="SearchResult"><A HREF="../GetFactor.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductFactors::Equals::FactorId)=<%=""+factorId%>
					&answer(ProductFactors::Equals::FactorVerId)=<%=""+factorVerId%>"><%=productFactorsDetail.getFactorName() %></A>&nbsp;</td>
					<td class="SearchResult"><A HREF="../GetFactor.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductFactors::Equals::FactorId)=<%=""+factorId%>
					&answer(ProductFactors::Equals::FactorVerId)=<%=""+factorVerId%>"><%=productFactorsDetail.getFactorDesc() %></A>&nbsp;</td>
					<td class="SearchResult"><%=productFactorsDetail.getFactorObjectName() %>&nbsp;</td>
					<td class="SearchResult"><%=productFactorsDetail.getFactorObjectType() %>&nbsp;</td>
					<td class="SearchResult"><%=productFactorsDetail.getVersionNumber() %>&nbsp;</td>

				</tr>
				<%} %>

				<tr>
			<td >&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
				
			</table>
			</td>
		</tr>
	</logic:present>



	</table>
	
	<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
	
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<html:hidden property="answer(Object::ProductFactors::dbName)"
					value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::ProductFactors::OwnerId)" value="<%=""+ownerId %>" />		
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />				
</html:form>
