<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/LinkProductToObject.js"></SCRIPT>

<html:form action="/LinkFactorToProduct">
	
	<html:hidden property="answer(dbname)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<%if(request.getParameter("answer(Object::Product::ProductId)")!= null) {%>
	<html:hidden property="answer(Object::Product::ProductId)"
		value="<%=request.getParameter("answer(Object::Product::ProductId)").toString()%>" />

	<%
}
%>
	<%if(request.getParameter("answer(Object::Product::ProductVerId)")!= null) {%>
	<html:hidden property="answer(Object::Product::CurrentVerId)"
		value="<%=request.getParameter("answer(Object::Product::ProductVerId)").toString()%>" />

	<%
}
%>

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2"
		CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="MH">LINK FACTORS AND PRODUCT</td>
		</tr>
		<tr>
			<td class="TextMatter">Use this page to link factors to product
			<br>
			</td>
		</tr>
		<tr>
			<td>
			<hr size="1" noshade>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>

			<td class="FormLabels" align="left">Select factor(s) to be
			linked to the product</td>
		</tr>
		<tr>
			<td>
			<table WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2"
				border="0">

				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels" align="left">Factors</td>
					<td class="FormLabels" align="left">&nbsp;</td>
					<td class="FormLabels" align="left">Selected Factors</td>

				</tr>
				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />
				<tr>
					<td width="15%"><dmshtml:get_available_factors
						nameInSession="arrFactors"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<dmshtml:dms_select property="answer(Object::Product::Factor)"
						styleId="possible" multiple="true" size="7">
						<logic:present name="arrFactors" scope="request">
							<logic:iterate id="factors" name="arrFactors" scope="request">
								<bean:define id='factorName' name="factors"
									property="factorName" />
								<bean:define id='factorId' name="factors" property="factorId" />
								<dmshtml:dms_option value='<%=factorId.toString()%>'>
									<%=factorName.toString()%>
								</dmshtml:dms_option>
							</logic:iterate>
						</logic:present>
					</dmshtml:dms_select></td>





					<TD width="10%"><A
						HREF="javascript:copyToList('possible','chosen')"><IMG
						SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="Add --&gt;"></A>
					<br><br>
					<A HREF="javascript:copyToList('chosen','possible')"><IMG
						SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="&lt;-- Remove"></A>
					</TD>
					<td width="30%"><dmshtml:get_product_factors
						nameInSession="arrProdFactors"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<dmshtml:dms_select
						property="answer(Object::ProductFactors::FactorId)"
						styleId="chosen" multiple="true" size="7">
						<logic:present name="arrProdFactors" scope="request">
							<logic:iterate id="prodFactors" name="arrProdFactors"
								scope="request">
								<bean:define id='factorName' name="prodFactors"
									property="factorName" />
								<bean:define id='factorId' name="prodFactors"
									property="factorId" />
								<dmshtml:dms_option value='<%=factorId.toString()%>'>
									<%=factorName.toString()%>

								</dmshtml:dms_option>
							</logic:iterate>
						</logic:present>
					</dmshtml:dms_select></td>

				</TR>
			</table>
			</td>
		</tr>
		<tr>
			<td>
			<hr size="1" noshade width="95%">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="center"><html:submit value="Save" styleClass="sbttn"
				onclick="return allSelect()" /></td>
		</tr>
	</table>
	<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />
	<html:hidden property="answer(Object::Entity::User)"
		value="<%=userName.toString()%>" />
	<html:hidden property="answer(objectType)" value="productFactor" />
	<html:hidden property="answer(ProductId)"
		value="<%=request.getParameter("answer(Object::Product::ProductId)")%>" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>


