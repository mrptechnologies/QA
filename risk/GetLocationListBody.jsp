<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>



<bean:define id="customerId" name="AddRisk" property="answer(Object::Customer::CustomerId)"></bean:define>
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddRisk" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 


	<table WIDTH="1200px" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">

		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td>
				<table WIDTH="1200px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
					<tr>
						<td valign="top">
							<table WIDTH="1000px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
								<tr>
									<td><jsp:include page="../common/InsuredAgencyLinkspage.jsp" /></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table WIDTH="1000px" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
								<tr>
								
								<tr>
									<td class="NewSectionHead" colspan="4" align="center">RISK LIST</td>
								</tr>
								
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								
								
							</table>
						</td>
					</tr>
				</table>
				
				<table WIDTH="1000px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
					
					<logic:notPresent name='locationListArray'>
						<logic:notPresent name='ArrOfInCompRiskQmap'>						
							<tr>
								<td valign="top">
									<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td height="20px" colspan="9" class="MH" style="{color:red;}">
												
													No Locations Found
												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</logic:notPresent>
					</logic:notPresent>
					
					<% int commonCount = 0; %>
					
					<logic:present name="locationListArray">

						<tr><td colspan="10">&nbsp;</td></tr>				
						
						<tr>
							<td class="sectionhead" width="3%">
								Edit
							</td>
							<td class="sectionhead" width="1%">
								Location Number
							</td>
							<td class="sectionhead" width="15%">
								Location Name
							</td>	
							<td class="sectionhead" width="18%">
						      Location Type
						  	</td>	
						    
							
							<!-- <td class="sectionhead" width="5%">
								State
							</td>
							<td class="sectionhead" width="5%">
								Zip
							</td> -->
							
						</tr>
					
						<% int i=0; %>
		  				<%int count=0;%>   
					
						<logic:iterate id="locationListArray" name="locationListArray" >
							<%++count;%>
							<%++commonCount;%>
							
						
							
							<tr>
								<td>
								
								</td>
							</tr>								
							<tr>
								<td class="SearchResult" align="center">								
									<a href="../EditCLRisk.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=
												&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Risk::ComProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray" property="resPropertyId" />&answer(SelectedRiskType)=<bean:write name="locationListArray" property="riskType" />&answer(OwnerId)=<%=ownerId+"" %>" title="Click to go to edit Risk Detail">
										<IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT="Completed Risk">
										
									</a>
								</td>
								<td class="SearchResult">
									<a href="../EditCLRisk.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=
										&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Risk::ComProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray" property="resPropertyId" />&answer(SelectedRiskType)=<bean:write name="locationListArray" property="riskType" />&answer(OwnerId)=<%=ownerId+"" %>" />
										<bean:write name="locationListArray" property="Object::Location::LocationNumber" />
									</a>
									<%++i;%>
								</td>
								<td class="SearchResult">
									<a href="../EditCLRisk.do?answer(TabPanelName)=Insured_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=
										&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray" property="riskType" />&answer(OwnerId)=<%=ownerId+"" %>" />
										
										<bean:write name="locationListArray" property="Object::Location::LocationName" />	
										</a>
									&nbsp;
									
								</td>
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Location::LocationType" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Location::LocationAddress" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Location::LocationCity" />&nbsp;
								</td>
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Location::LocationState" />&nbsp;
								</td>
								
								 
							</tr>
						</logic:iterate>
					</logic:present>					
				</table>