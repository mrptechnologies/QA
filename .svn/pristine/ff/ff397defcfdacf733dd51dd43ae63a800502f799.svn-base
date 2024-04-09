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

<html:form action="/LinkProductFeatureToState">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	
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
	<%if(request.getParameter("answer(Object::Product::ProductVerId)")!= null) {%>
	<html:hidden property="answer(Object::Product::CurrentVerId)"
		value="<%=request.getParameter("answer(Object::Product::ProductVerId)").toString()%>" />

	<%
}
%>
	<%if(request.getParameter("answer(Object::Product::State)")!= null) {%>
	<html:hidden property="answer(Object::Product::State)"
		value="<%=request.getParameter("answer(Object::Product::State)").toString()%>" />

	<%
}
%>

	<table WIDTH="700px" ALIGN="center" BORDER="0" CELLSPACING="2"
		CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="MH">LINK PRODUCT FEATURES/OPTIONS AND STATE</td>
		</tr>
		<tr>
			<td class="TextMatter">Use this page to link product features/options/applications/endorsements to
			state <br>
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
			<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />

			<tr> <td class="links">
			Territories : &nbsp;
					<dmshtml:get_state_territories
						nameInSession="arrTerritories"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
						<logic:present name="arrTerritories" scope="request">
							<logic:iterate id="territories" name="arrTerritories"
								scope="request">
								<bean:define id='tertName' name="territories"
									property="territoryName" />
								<bean:define id='tertCode' name="territories"
									property="territoryCode" />
									<a
href="../product/LinkTerritoryToProductOptions.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&dbname=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(Object::Product::State)=<%=request.getParameter("answer(Object::Product::State)").toString()%>&answer(territory)=<%=tertCode.toString()%>">
										<%=tertCode.toString()%></a>
							</logic:iterate>
						</logic:present>
</td></tr>

						<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>

			<td class="FormLabels" align="left">Select feature(s) to be
			linked to the state</td>
		</tr>
		<tr>
			<td>

			<table WIDTH="700px" ALIGN="left" cellspacing=0 cellpadding="2"
				border="0">

				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>

				<tr>
					<td class="FormLabels" align="left">Features</td>
					<td class="FormLabels" align="left">&nbsp;</td>		
					<td class="FormLabels" align="left">Selected Features</td>
				</tr>

			
				<tr>
					<td width="325px"><dmshtml:get_available_prod_features
						nameInSession="arrProdFeatures"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<dmshtml:dms_select
						property="answer(Object::ProductFeature::ProductFeatureId)"
						styleId="possible" multiple="true" size="7">
						<logic:present name="arrProdFeatures" scope="request">
							<logic:iterate id="prodFeatures" name="arrProdFeatures"
								scope="request">
								<bean:define id='featureName' name="prodFeatures"
									property="featureName" />
								<bean:define id='featureId' name="prodFeatures"
									property="productFeatureId" />
								<dmshtml:dms_option value='<%=featureId.toString()%>'>
									<%=featureName.toString()%>
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
					
					<td width="350px"><dmshtml:get_prod_state_features
						nameInSession="arrProdFeatures"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<dmshtml:dms_select
						property="answer(Object::ProductFeature::ProductFeatureId)"
						styleId="chosen" multiple="true" size="7">
						<logic:present name="arrProdFeatures" scope="request">
							<logic:iterate id="prodFeatures" name="arrProdFeatures"
								scope="request">
								<bean:define id='featureName' name="prodFeatures"
									property="featureName" />
								<bean:define id='featureId' name="prodFeatures"
									property="productFeatureId" />
								<dmshtml:dms_option value='<%=featureId.toString()%>'>
									<%=featureName.toString()%>
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
			<td class="FormLabels" align="left">Select Option(s) to be
			linked to the state</td>
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
					<td width="325px"><dmshtml:get_available_prod_state_options
						nameInSession="arrProdOptions"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />

					<dmshtml:dms_select
						property="answer(Object::ProductFeature::ProductOptionId)"
						styleId="possibleList" multiple="true" size="7">
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
						HREF="javascript:copyToList('possibleList','chosenList')"><IMG
						SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="Add --&gt;"></A> <br>
					<br>
					<A HREF="javascript:copyToList('chosenList','possibleList')"><IMG
						SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="&lt;-- Remove"></A>
					</TD>


					<td width="325px"><dmshtml:get_prod_state_options
						nameInSession="arrProdOptions"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />

					<dmshtml:dms_select
						property="answer(Object::ProductFeature::ProductOptionId)"
						styleId="chosenList" multiple="true" size="7">
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
			<td class="FormLabels" align="left">Select ApplicationVersions to be
			linked to the state</td>
		</tr>

		<tr>
			<td>
			<table WIDTH="700px" ALIGN="left" cellspacing=0 cellpadding="2"
				border="0">

				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>

				<tr>
					<td class="FormLabels" align="left">ApplicationVersions</td>
					<td class="FormLabels" align="left">&nbsp;</td>		
					<td class="FormLabels" align="left">Selected ApplicationVersions</td>
				</tr>


				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />

				<tr>
					<td width="325px"><dmshtml:get_available_product_state_apps
						nameInSession="arrAppVers"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />

					<dmshtml:dms_select
						property="answer(Object::ProductFeature::ProductOptionId)"
						styleId="possibleApps" multiple="true" size="7">
						<logic:present name="arrAppVers" scope="request">
							<logic:iterate id="AppVers" name="arrAppVers"
								scope="request">
								<bean:define id='applicationName' name="AppVers"
									property="applicationName" />
								<bean:define id='applicationId' name="AppVers"
									property="applicationId" />
										
								<dmshtml:dms_option value='<%=applicationId.toString()%>'>
									<%=applicationName.toString()%>
								</dmshtml:dms_option>
							</logic:iterate>
						</logic:present>
					</dmshtml:dms_select></td>

					<TD width="10%"><A
						HREF="javascript:copyToList('possibleApps','chosenApps')"><IMG
						SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="Add --&gt;"></A> <br>
					<br>
					<A HREF="javascript:copyToList('chosenApps','possibleApps')"><IMG
						SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="&lt;-- Remove"></A>
					</TD>


					<td width="325px"><dmshtml:get_product_state_apps
						nameInSession="arrProdOptions"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />

					<dmshtml:dms_select
						property="answer(Object::ProductStateApps::AppId)"
						styleId="chosenApps" multiple="true" size="7">
						<logic:present name="arrProdOptions" scope="request">
							<logic:iterate id="AppVers" name="arrProdOptions"
								scope="request">
								<bean:define id='applicationName' name="AppVers"
									property="applicationName" />
								<bean:define id='applicationId' name="AppVers"
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
			<td class="FormLabels" align="left">Select Endorsement(s) to be
			linked to the state</td>
		</tr>

		<tr>
			<td>
			<table WIDTH="700px" ALIGN="left" cellspacing=0 cellpadding="2"
				border="0">

				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>

				<tr>
					<td class="FormLabels" align="left">Endorsements</td>
					<td class="FormLabels" align="left">&nbsp;</td>		
					<td class="FormLabels" align="left">Selected Endorsements</td>
				</tr>


				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />

				<tr>
					<td width="325px"><dmshtml:get_available_prod_state_endorsements
						nameInSession="arrProdEnds"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />

					<dmshtml:dms_select
						property="answer(Object::ProductFeature::ProductOptionId)"
						styleId="possibleEnds" multiple="true" size="7">
						<logic:present name="arrProdEnds" scope="request">
							<logic:iterate id="prodEnds" name="arrProdEnds"
								scope="request">
								<bean:define id='productName' name="prodEnds"
									property="MProductName" />
								<bean:define id='productId' name="prodEnds"
									property="productId" />
								<dmshtml:dms_option value='<%=productId.toString()%>'>
									<%=productName.toString()%>
								</dmshtml:dms_option>
							</logic:iterate>
						</logic:present>
					</dmshtml:dms_select></td>

					<TD width="10%"><A
						HREF="javascript:copyToList('possibleEnds','chosenEnds')"><IMG
						SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="Add --&gt;"></A> <br>
					<br>
					<A HREF="javascript:copyToList('chosenEnds','possibleEnds')"><IMG
						SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="&lt;-- Remove"></A>
					</TD>


					<td width="325px"><dmshtml:get_prod_state_endorsements
						nameInSession="arrProdEnds"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />

					<dmshtml:dms_select
						property="answer(Object::ProductState::EndorsementId)"
						styleId="chosenEnds" multiple="true" size="7">
						<logic:present name="arrProdEnds" scope="request">
							<logic:iterate id="prodEnds" name="arrProdEnds"
								scope="request">
								<bean:define id='productName' name="prodEnds"
									property="MProductName" />
								<bean:define id='productId' name="prodEnds"
									property="productId" />
								<dmshtml:dms_option value='<%=productId.toString()%>'>
									<%=productName.toString()%>
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
				onclick="return selectBothLists()" /></td>
		</tr>
	</table>
	<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />
	<html:hidden property="answer(Object::Entity::User)"
		value="<%=userName.toString()%>" />
	<html:hidden property="answer(objectType)" value="stateFeatureOption" />
</html:form>
