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

<SCRIPT type="text/javascript"
	SRC="../Scripts/JScripts/LinkProductToObject.js"></SCRIPT>

<html:form action="/LinkProductOptionToTerritory">
	
	<html:hidden property="answer(dbname)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<%if(request.getParameter("answer(Object::Product::ProductId)")!= null) {%>
	<html:hidden property="answer(Object::Product::ProductId)"
		value="<%=request.getParameter("answer(Object::Product::ProductId)").toString()%>" />
		<html:hidden property="answer(ProductId)"
		value="<%=request.getParameter("answer(Object::Product::ProductId)").toString()%>" />
		

	<%
}
%>
	
	<%if(request.getParameter("answer(Object::Product::State)")!= null) {%>
	<html:hidden property="answer(Object::Product::State)"
		value="<%=request.getParameter("answer(Object::Product::State)").toString()%>" />

	<%
}
%>
<%if(request.getParameter("answer(territory)")!= null) {%>
	<html:hidden property="answer(territory)"
		value="<%=request.getParameter("answer(territory)").toString()%>" />

	<%
}
%>

	<table WIDTH="700px" ALIGN="center" BORDER="0" CELLSPACING="2"
		CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="MH">LINK PRODUCT OPTIONS/APPLICATIONS AND TERRITORY</td>
		</tr>
		<tr>
			<td class="TextMatter">Use this page to link product options/applications to
			territory <br>
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

			<td class="FormLabels" align="left">Select options(s) to be
			linked to the territory</td>
		</tr>
		<tr>
			<td>

			<table WIDTH="700px" ALIGN="left" cellspacing=0 cellpadding="2"
				border="0">

				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>

				<tr>
					<td class="FormLabels" align="left">Options</td>
					<td class="FormLabels" align="left">&nbsp;</td>		
					<td class="FormLabels" align="left">Selected Options</td>
				</tr>
	<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />
			
				<tr>
					<td width="325px"><dmshtml:get_available_prod_territory_options
						nameInSession="arrProdOptions"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						territory="<%=Long.parseLong(request.getParameter("answer(territory)").toString())%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<dmshtml:dms_select
						property="answer(Object::State::OptionId)"
						styleId="possible" multiple="true" size="7">
							<logic:present name="arrProdOptions" scope="request">
							<logic:iterate id="prodOptions" name="arrProdOptions"
								scope="request">
								<bean:define id='optionName' name="prodOptions"
									property="optionName" />
								<bean:define id='optionId' name="prodOptions"
									property="optionId" />
								<dmshtml:dms_option value='<%=optionId.toString()%>'>
									<%=optionName.toString()%>
								</dmshtml:dms_option>
							</logic:iterate>
						</logic:present>
					</dmshtml:dms_select></td>



					<TD width="10%"><A
						HREF="javascript:copyToList('possible','chosen')"><IMG
						SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="Add --&gt;"></A> <br>
					<br>
					<A HREF="javascript:copyToList('chosen','possible')"><IMG
						SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="&lt;-- Remove"></A>
					</TD>
					
					<td width="350px">
					<dmshtml:get_prod_territory_options nameInSession="arrProdOptions"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						territory="<%=Long.parseLong(request.getParameter("answer(territory)").toString())%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
				<dmshtml:dms_select
						property="answer(Object::Territory::ProductOptionId)"
						styleId="chosen" multiple="true" size="7">
						<logic:present name="arrProdOptions" scope="request">
							<logic:iterate id="prodOptions" name="arrProdOptions"
								scope="request">
								<bean:define id='optionName' name="prodOptions"
									property="optionName" />
								<bean:define id='optionId' name="prodOptions"
									property="optionId" />
								<dmshtml:dms_option value='<%=optionId.toString()%>'>
									<%=optionName.toString()%>
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
			<td>&nbsp;</td>
		</tr>

		<tr>

			<td class="FormLabels" align="left">Select Application(s) to be
			linked to the territory</td>
		</tr>
		<tr>
			<td>

			<table WIDTH="700px" ALIGN="left" cellspacing=0 cellpadding="2"
				border="0">

				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>

				<tr>
					<td class="FormLabels" align="left">Applications</td>
					<td class="FormLabels" align="left">&nbsp;</td>		
					<td class="FormLabels" align="left">Selected Applications</td>
				</tr>
	<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />
			
				<tr>
					<td width="325px"><dmshtml:get_available_prod_territory_apps
						nameInSession="arrProdOptions"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						territory="<%=Long.parseLong(request.getParameter("answer(territory)").toString())%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<dmshtml:dms_select
						property="answer(Object::State::OptionId)"
						styleId="possibleList" multiple="true" size="7">
							<logic:present name="arrProdOptions" scope="request">
							<logic:iterate id="prodOptions" name="arrProdOptions"
								scope="request">
								<bean:define id='applicationName' name="prodOptions"
									property="applicationName" />
								<bean:define id='applicationId' name="prodOptions"
									property="applicationId" />
								<dmshtml:dms_option value='<%=applicationId.toString()%>'>
									<%=applicationName.toString()%>
								</dmshtml:dms_option>
							</logic:iterate>
						</logic:present>
					</dmshtml:dms_select></td>



					<TD width="10%"><A
						HREF="javascript:copyToList('possibleList','chosenList')"><IMG
						SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="Add --&gt;"></A> <br>
					<br>
					<A HREF="javascript:copyToList('chosenList','possibleList')"><IMG
						SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="&lt;-- Remove"></A>
					</TD>
					
					<td width="350px">
					<dmshtml:get_prod_territory_apps nameInSession="arrProdOptions"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						territory="<%=Long.parseLong(request.getParameter("answer(territory)").toString())%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
				<dmshtml:dms_select
						property="answer(Object::Territory::ProductAppId)"
						styleId="chosenList" multiple="true" size="7">
						<logic:present name="arrProdOptions" scope="request">
							<logic:iterate id="prodOptions" name="arrProdOptions"
								scope="request">
								<bean:define id='applicationName' name="prodOptions"
									property="applicationName" />
								<bean:define id='applicationId' name="prodOptions"
									property="applicationId" />
								<dmshtml:dms_option value='<%=applicationId.toString()%>'>
									<%=applicationName.toString()%>
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
			<hr size="1" noshade>
			</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td align="center"><html:submit value="Save" styleClass="sbttn"
				onclick="return selectBothLists()" /></td>
		</tr>
	</table>
	<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />
	<html:hidden property="answer(Object::Entity::User)"
		value="<%=userName.toString()%>" />
	<html:hidden property="answer(objectType)" value="stateTerritoryOption" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>

