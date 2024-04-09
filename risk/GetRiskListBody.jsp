<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript">

function confirmDelete(){
	
	var frm = document.forms[0];
	var count = 0;
	for(var i=0; frm.elements[i]!=null; i++) {
	
		if(frm.elements[i].name == "answer(Object::Risk::ResProperty::ResPropertyId)" && frm.elements[i].checked == true) {
			count++;
			break;
		}
	}
	if(count>0) {
		var ans = window.confirm('Are you sure that you want to delete the selected records?');
		if (ans)
			return true;
		else
			return false;
	} else {
		alert("Please select a record to delete.");
		return false;
	}
}

</script>
<bean:define id="customerId" name="AddRisk" property="answer(Object::Customer::CustomerId)"></bean:define>
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddRisk" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 

<% String insuredState = "";
if(request.getParameter("answer(Object::Customer::State)")!= null) { %>
	<bean:parameter id="State" name="answer(Object::Customer::State)" />
<%
insuredState = (String)State;
}else {%>
<bean:define id="State1" property="answer(Object::Customer::State)" name="AddCustomer" scope="session" />
<% insuredState = (String)State1;
} %>

<html:form action="/DeleteRisk.do" scope="request">

	<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">

		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td>
				<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
					<tr>
						<td valign="top">
							<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
								<tr>
									<td><jsp:include page="../common/InsuredAgencyLinkspage.jsp" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
								<tr>
								
								<tr>
									<td class="NewSectionHead" colspan="4" align="center">RISK LIST</td>
								</tr>
								
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								
								<tr>
									<td class="links" align="left" colspan="2" width="20%">
										<a href="/AddResProperty.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResProperty::CustomerId)=<%=""+customerId%>&answer(objectId)=0&answer(Object::Risk::ResProperty::ResPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(state)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Agency::AgencyId)=<%=id.toString()%>" title="Click to go to add a New Risk" />Add Risk</a>
									</td>
									<td class="links" align="left" width="20%">
										<a href="../AllQuotesPC.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::State)=<%=insuredState.toString()%>"
								title="Click to go to Existing Quotes"  />Existing Quotes</a>
						  			</td>
	  								<logic:present name="riskListArray">
										<td align="left" class="links" width="20%">				
											<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/>
											<bean:define id="ObjectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/>
						
											<dmshtml:Get_Customer_HeaderDetail_ByCustomerId nameInSession="customerMap" customerId='<%=""+customerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<bean:define id="customerDetailMap" name="customerMap" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
												<%String EmpGrpState=customerDetailMap.getString("Object::Customer::State");%>
												
												<!--  to get RiskTypeId based on ownerid  and riskType Start -->
												<dmshtml:getRiskHeaderInfoByInsuredId nameInSession="arrRiskTypes" insuredId="<%=customerId.toString()%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<%String RiskType = ""; %>																								 
												<logic:present name="arrRiskTypes" scope="request">
												<bean:define id="arrRiskTypes" name="arrRiskTypes" type="java.util.ArrayList"/>
												<%for(int i=0;i<arrRiskTypes.size();i++) {
													com.dms.ejb.data.QuestionHashMap riskMap=(com.dms.ejb.data.QuestionHashMap)arrRiskTypes.get(i);	
													RiskType=riskMap.getString("Object::Risk::ResProperty::RiskType"); %>
												<%}%>
												</logic:present>
												<% String riskTypeId = ""; %>
												<dmshtml:GetRiskTypeId nameInSession="riskTypeIds" riskType="<%=""+RiskType%>" ownerId='<%=""+ownerId%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
												<logic:present name="riskTypeIds" scope="request">
												<bean:define id="riskTypeId1" name="riskTypeIds"/>
												<%riskTypeId = ""+riskTypeId1;%>
												</logic:present>
												<!--  to get RiskType id end -->
												
												
												<html:hidden property="answer(Object::Risk::RiskId)" value='<%=""+riskTypeId%>'/>
												<a href="../NewPCQuote.do?TabPanelName=Quote_Panel&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&formName=form::ADDQUOTEDETAILSALLRISK_<%=ownerId.toString()%>&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=userId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Quote::ProductStatus)=RELEASED&answer(State)=<%=EmpGrpState%>&answer(Object::Risk::RiskId)=<%=""+riskTypeId%>&answer(Object::Quote::NewQuote)=YES" title="Click to go to create a New Quote">New Quote</a>
										</td>
									</logic:present>						  			
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
					
					<logic:notPresent name='riskListArray'>
						<logic:notPresent name='ArrOfInCompRiskQmap'>						
							<tr>
								<td valign="top">
									<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td height="20px" colspan="9" class="MH" style="{color:red;}">
												
													No Risk Found
												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</logic:notPresent>
					</logic:notPresent>
					
					<% int commonCount = 0; %>
					
					<logic:present name="riskListArray">

						<tr><td colspan="10">&nbsp;</td></tr>				
						
						<tr>
							<td class="sectionhead" width="3%">
								Edit
							</td>
							<td class="sectionhead" width="1%">
								Risk Number
							</td>
							<td class="sectionhead" width="15%">
								Risk Name
							</td>	
							<td class="sectionhead" width="8%">
						      Risk Type
						  	</td>	
						    <td class="sectionhead" width="20%">
								Address
							</td>
							<td class="sectionhead" width="15%">
								City	
							</td> 
				 			<td class="sectionhead" width="12%">
								County	
							</td> 
							<td class="sectionhead" width="5%">
								State
							</td>
							<td class="sectionhead" width="5%">
								Zip
							</td>
							<td class="sectionhead" width="5%">
								Delete
							</td>
						</tr>
					
						<% int i=0; %>
		  				<%int count=0;%>   
					
						<logic:iterate id="riskListArray" name="riskListArray" >
							<%++count;%>
							<%++commonCount;%>
							<tr>
								<td>
								<bean:define id="ratingTerritory" name="riskListArray" property="Object::Risk::ResProperty::RatingTerritory" />
								<bean:define id="ratingTerritoryName" name="riskListArray" property="Object::Risk::ResProperty::RatingTerritoryName" />
								<bean:define id="zone" name="riskListArray" property="Object::Risk::ResProperty::Zone" />
								</td>
							</tr>								
							<tr>
								<td class="SearchResult" align="center">								
									<a href="../EditRisk1.do?answer(TabPanelName)=Insured_Panel&TabPanelName=Insured_Panel&answer(Object::Risk::ResProperty::ResPropertyId)=<bean:write name="riskListArray" property="Object::Risk::ResProperty::ResPropertyId" />&answer(Object::Risk::ResProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=<bean:write name="riskListArray" property="Object::Risk::ResProperty::RatingTerritory" />&answer(territoryName)=<%=""+ratingTerritoryName%>&answer(zone)=<%=""+zone%>&answer(showOnetTab)=Y&answer(state)=<bean:write name="riskListArray" property="Object::Risk::ResProperty::State" />" title="Click to go to edit Risk Detail">
										<IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT="Completed Risk">
									</a>
								</td>
								<!--	<td class="SearchResult">
											<a href="../EditRisk.do?TabPanelName=Insured_Panel&answer(Object::Risk::ResProperty::ResPropertyId)=<bean:write name="riskListArray" property="Object::Risk::ResProperty::ResPropertyId" />&answer(Object::Risk::ResProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>">
												<IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT="">
											</a>
										</td> 
								-->
								<td class="SearchResult">
									<a href="../EditRisk1.do?answer(TabPanelName)=Insured_Panel&TabPanelName=Insured_Panel&answer(Object::Risk::ResProperty::ResPropertyId)=<bean:write name="riskListArray" property="Object::Risk::ResProperty::ResPropertyId" />&answer(Object::Risk::ResProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=<bean:write name="riskListArray" property="Object::Risk::ResProperty::RatingTerritory" />&answer(territoryName)=<%=""+ratingTerritoryName%>&answer(zone)=<%=""+zone%>&answer(showOnetTab)=Y&answer(state)=<bean:write name="riskListArray" property="Object::Risk::ResProperty::State" />" title="Click to go to view this Risk Detail"> <bean:write name="riskListArray" property="Object::Risk::ResProperty::RiskNumber" /></a>
									<%++i;%>
								</td>
								<td class="SearchResult">
									<a href="../EditRisk1.do?answer(TabPanelName)=Insured_Panel&TabPanelName=Insured_Panel&answer(Object::Risk::ResProperty::ResPropertyId)=<bean:write name="riskListArray" property="Object::Risk::ResProperty::ResPropertyId" />&answer(Object::Risk::ResProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=<bean:write name="riskListArray" property="Object::Risk::ResProperty::RatingTerritory" />&answer(territoryName)=<%=""+ratingTerritoryName%>&answer(zone)=<%=""+zone%>&answer(showOnetTab)=Y&answer(state)=<bean:write name="riskListArray" property="Object::Risk::ResProperty::State" />" title="Click to go to view this Risk Detail"> <bean:write name="riskListArray" property="Object::Risk::ResProperty::RiskName" /></a>
									&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="riskListArray" property="Object::Risk::ResProperty::RiskType" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="riskListArray" property="Object::Risk::ResProperty::Address" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="riskListArray" property="Object::Risk::ResProperty::City" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="riskListArray" property="Object::Risk::ResProperty::CountyName" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="riskListArray" property="Object::Risk::ResProperty::State" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="riskListArray" property="Object::Risk::ResProperty::Zip" />&nbsp;
								</td>
								 <td class="SearchResult">
								 	<bean:define id="resPropId" name="riskListArray" property="Object::Risk::ResProperty::ResPropertyId"></bean:define>
		      						<html:checkbox property="answer(Object::Risk::ResProperty::ResPropertyId)" name="riskListArray" styleId="<%="addlInterestArray"+count%>" value="<%= resPropId.toString() %>" />
		       					</td>
							</tr>
						</logic:iterate>
					</logic:present>					
				</table>
				<logic:present name="riskListArray">				
					<table WIDTH="1000px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
						<tr>
							<td width="85%">
								&nbsp;	
								<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString()%>"/>	
								<html:hidden property="answer(Object::Agency::AgencyId)" value="<%= id.toString() %>"/>
							</td>					
						</tr>
						<tr>
							<td align="right">
								<html:submit value="Delete Selected" property="answer(button)" styleClass="sbttn" onclick="return confirmDelete()" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							</td>
							<td align="right">
								<html:button value="Back" styleClass="sbttn" property="answer(submit)" onclick="javascript:history.go(-1);"/>&nbsp;
							</td>
						</tr>	
					</table>
				</logic:present>
			</td>
		</tr>
			
		<logic:present name="ArrOfInCompRiskQmap">
	
			<tr><td>&nbsp;</td></tr>	
	
			<tr>
				<td>
					<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
	
						<tr>
							<td class="sectionhead" colspan="10" align="center" > Incomplete Risk List </td>
						</tr>
						<tr>
							<td colspan="10">&nbsp;</td>
						</tr>					
						<tr>
							<td class="sectionhead" width="3%">
								Edit
							</td>
							<td class="sectionhead" width="1%">
								Risk Number
							</td>
							<td class="sectionhead" width="15%">
								Risk Name
							</td>	
							<td class="sectionhead" width="8%">
						      Risk Type
						  	</td>	
						    <td class="sectionhead" width="20%">
								Address
							</td>
							<td class="sectionhead" width="15%">
								City	
							</td> 
				 			<td class="sectionhead" width="12%">
								County	
							</td> 
							<td class="sectionhead" width="5%">
								State
							</td>
							<td class="sectionhead" width="5%">
								Zip
							</td>
							<td class="sectionhead" width="5%">
								Delete
							</td>
						</tr>
						<% int i=0; %>
		  				<%int count=0;%>   
						
						<logic:iterate id="arrOfInCompRiskQmap" name="ArrOfInCompRiskQmap" >
							<%++count;%>
							<%++commonCount;%>
							<tr>
								<td>
								<bean:define id="ratingTerritoryName" name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RatingTerritoryName" />
								<bean:define id="zone" name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::Zone" />
								</td>
							</tr>	
							<tr>
								<td class="SearchResult" align="center">
									<a href="../EditRisk1.do?answer(TabPanelName)=Insured_Panel&TabPanelName=Insured_Panel&answer(Object::Risk::ResProperty::ResPropertyId)=<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RiskId" />&answer(Object::Risk::ResProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RatingTerritory" />&answer(territoryName)=<%=""+ratingTerritoryName%>&answer(zone)=<%=""+zone%>&answer(showOnetTab)=Y&answer(state)=<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::State" />" title="Click to go to edit Risk Detail">
										<IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT="Incomplete Risk">
									</a>
								</td>
								<td class="SearchResult">
									<a href="../EditRisk1.do?answer(TabPanelName)=Insured_Panel&TabPanelName=Insured_Panel&answer(Object::Risk::ResProperty::ResPropertyId)=<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RiskId" />&answer(Object::Risk::ResProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RatingTerritory" />&answer(territoryName)=<%=""+ratingTerritoryName%>&answer(zone)=<%=""+zone%>&answer(showOnetTab)=Y&answer(state)=<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::State" />" title="Click to go to view this Risk Detail"><bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RiskNumber" /></a>
									<%++i;%> 
								</td>
								<td class="SearchResult">
									<a href="../EditRisk1.do?answer(TabPanelName)=Insured_Panel&TabPanelName=Insured_Panel&answer(Object::Risk::ResProperty::ResPropertyId)=<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RiskId" />&answer(Object::Risk::ResProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RatingTerritory" />&answer(territoryName)=<%=""+ratingTerritoryName%>&answer(zone)=<%=""+zone%>&answer(showOnetTab)=Y&answer(state)=<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::State" />" title="Click to go to view this Risk Detail"><bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RiskName" /></a>
									&nbsp;							
								</td>
								<td class="SearchResult">
									<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RiskType" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::Address" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::City" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::CountyName" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::State" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::Zip" />&nbsp;
								</td>
								 <td class="SearchResult">
								 	<bean:define id="resPropId" name="arrOfInCompRiskQmap" property="Object::Risk::ResProperty::RiskId"></bean:define>
		      						<html:checkbox property="answer(Object::Risk::ResProperty::ResPropertyId)" name="arrOfInCompRiskQmap" styleId="<%="addlInterestArray"+commonCount%>" value="<%= resPropId.toString() %>" />
		       					</td>
							</tr>
						</logic:iterate>
					</table>
					<table WIDTH="1000px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
						<tr>
							<td width="85%">
								&nbsp;	
								<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString()%>"/>	
								<html:hidden property="answer(Object::Agency::AgencyId)" value="<%= id.toString() %>"/>
							</td>					
						</tr>
						<tr>
							<td align="right">
								<html:submit value="Delete Selected" property="answer(button)" styleClass="sbttn" onclick="return confirmDelete()" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							</td>
							<td align="right">
								<html:button value="Back" styleClass="sbttn" property="answer(submit)" onclick="javascript:history.go(-1);"/>&nbsp;
							</td>
						</tr>	
					</table>					
				</td>
			</tr>
		</logic:present>	
	</table>
	<html:hidden property="TabPanelName" value="Insured_Panel" />
</html:form>