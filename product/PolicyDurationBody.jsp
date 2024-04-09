<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


    <bean:define id="ProductId1" name="AddProduct" property="answer(Object::Product::ProductId)" scope="request" />
    

	<html:form action="/AddPolicyDuration.do" >

	<%if(request.getParameter("productId")!= null && ProductId1 != null) {%>
	<html:hidden property="answer(Object::Product::ProductId)"
		value="<%=request.getParameter("productId").toString()%>" />
		<html:hidden property="answer(productId)"
		value="<%=request.getParameter("productId").toString()%>" />

	<%
}else {%>
	<html:hidden property="answer(Object::Product::ProductId)" value="<%=ProductId1.toString()%>" />
	<html:hidden property="answer(productId)" value="<%=ProductId1.toString()%>" />
 <%}%>
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
		<html:hidden property="answer(Object::Product::dbName)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' /> 
<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
					
	<tr><td>&nbsp;</td></tr>
					
	<tr><td class="MH">SELECT POLICY DURATIONS FOR PRODUCT </td></tr>
	<tr><td><hr size="1" noshade></td></tr>
	<tr>
		<td>
			<table >
				<tr>
					<td class="sectionhead" >Period</td>
					<td class="sectionhead" >Period Type</td>
					<td class="sectionhead" >Minimum Earned</td>
					<td class="sectionhead" >Minimum Earned Type</td>
					<td class="sectionhead" width="5%">Select Default Term</td>
				</tr>
				<tr>
					<td class="SearchResult" >
						<html:text property="answer(Object::Product::Period)" styleClass="txtbox"  />	
					</td>
					<td class="SearchResult" >
						<html:text property="answer(Object::Product::PeriodType)" styleClass="txtbox"  />	
					</td>
					<td class="SearchResult">
						<html:text property="answer(Object::Product::MinEarned)" styleClass="txtbox"  />	
					</td>	
					<td class="SearchResult" >
						<html:text property="answer(Object::Product::MinEarnedType)" styleClass="txtbox"  />&nbsp;
					</td>
					<td class="SearchResult">
						<dmshtml:dms_multibox styleId="itemSelected"  property="answer(Object::Product::DefaultTerm)" value = "Y">
						</dmshtml:dms_multibox> 
					</td>
				</tr>	
				<tr><td colspan="3" >&nbsp;</td></tr>
				<tr>
					<td  align="right">&nbsp;
						<html:submit value="Add" styleClass="Sbttn"/>
					</td>
				</tr>
			</table>

			<logic:present name="searchresultnewDisplay" scope="request">
				<logic:present name="durationSize" scope="request">
				
					<bean:define id="durationSize" name='durationSize' scope='request'/>
						<tr>
							<td>
								<table>
									<tr><td class="FormLabels">Number of search results found : <%=""+durationSize%></td></tr>
									<tr><td>&nbsp;</td></tr>
								</table>
							</td>
						</tr>
				</logic:present>

				<tr><td>&nbsp;</td></tr>
				<tr>
					<td>
						<table width="90%" align="center" border="0" >
							<tr >		
								<td class="sectionhead" width="5%">SrNo.</td>
								<td class="sectionhead" >Period</td>
								<td class="sectionhead" >Period Type</td>
								<td class="sectionhead" >Minimum Earned</td>
								<td class="sectionhead" >Minimum Earned Type</td>
								<td class="sectionhead" width="5%">Default Term</td>
							</tr>
		
							<%int count=0;%>
							<%java.util.ArrayList durationArr = new java.util.ArrayList();%>
							<% durationArr= (java.util.ArrayList)request.getAttribute("searchresultnewDisplay");
									
								for (int i=0; i<durationArr.size(); i++)  {
		      						 com.dms.ejb.product.PRDProductDetail policyDetail=(com.dms.ejb.product.PRDProductDetail) durationArr.get(i);
							%>
								<tr>
									<td class="SearchResult">
									<a href="../GetProductDuration.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>"><%=++count%></a>	
									</td>
									<td class="SearchResult">
									<%=policyDetail.getPeriod()%>
									</td>
									<td class="SearchResult">
									<%=policyDetail.getPeriodType()%>
									</td>
									<td class="SearchResult">
												<%=policyDetail.getMinEarned()%>
									</td>
									<td class="SearchResult"><%=policyDetail.getMinEarnedType()%>
									</td>			
									<td class="SearchResult">	<%=policyDetail.getDefaultTerm()%>
									</td>	
								</tr>		
							<%}%>
						</table>
					</td>
				</tr>	
			</logic:present>
			<logic:notPresent name="searchresultnewDisplay" scope="request">
				<table>
				<tr><td class="FormLabels">No records found</td></tr>
				</table>
			</logic:notPresent>
		</td>
	</tr>
</table>

<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />
		<html:hidden property="answer(Object::Product::CreatedBy)"
		value="<%=userName.toString()%>" />
		<html:hidden property="answer(Object::Product::UpdatedBy)"
		value="<%=userName.toString()%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
