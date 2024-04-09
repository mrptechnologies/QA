<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="customerId" name="AddRisk" property="answer(Object::Customer::CustomerId)"></bean:define>
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddRisk" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="AgencyId" property="answer(Object::Agency::AgencyId)" name="AddRisk" />
<bean:define id="SubmissionId" property="answer(Object::Submission::SubmissionId)" name="AddRisk" />
<bean:define id="SubmissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="AddRisk" />
<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
<bean:define id="CustomerState" name="AddRisk" property="answer(state)" />
<bean:define id="clearanceStatus" name="AddRisk" property="answer(Object::Clearance::Status)"/>
<bean:define id="lobId" name="AddRisk" property="answer(Object::Submission::LOBId)"/>
<bean:define id="cId" name="AddRisk" property="answer(Object::Submission::InsuredId)"/>

<%String customerStatus=""; %>
	<table WIDTH="1200px" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">

		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td>
				<table WIDTH="1200px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
					<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
					<tr>
						<td valign="top">
							<table WIDTH="1000px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
								<tr>
									<td><jsp:include page="../common/SubmissionInsuredAgencyLinksPage.jsp" /></td>
								</tr>
							</table>
						</td>
					</tr>
					</logic:notEqual>
					<tr>
						<td>
							<table WIDTH="1000px" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
								<tr>
								
								<tr>
									<td class="NewSectionHead" colspan="4" align="center">SUBMISSION LOCATION LIST</td>
								</tr>
								
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								
								<tr>
									<td>
					<td class="links" width="30%">  <a href="../AllQuotesCL.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+id%>&answer(Object::Customer::State)=<%=""%>" title="Click to go to Quotes" /></a>  </td>
									</td>
								</tr>
								
								
							</table>
						</td>
					</tr>
					
					<tr>
						<td>
							<table WIDTH="1000px" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
								
								
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								
								<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cIdSession.toString()%>" submissionId="<%=SubmissionId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
								<logic:present name="customerDetail1" scope="request">
									<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />								
									<%
									customerStatus = customerDetailMap.getString("custStatus");
									%>	
							
								</logic:present>
								
								<dmshtml:dms_isPresent property="<%=new String[]{"Declined","Lapsed"}%>" value="<%=""+customerStatus %>" negated="false" >									
								<tr>
									<td>
										<a href="../AddSubmissionLocation.do?answer(TabPanelName)=Submission_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Submission::SubmissionStatus)=<%=""+customerStatus %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=AgencyId.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(PrimaryKey_Object::Customer::CustomerId)=<%= ""+customerId%>&answer(Object::Customer::CustomerId)=<%= ""+customerId%>&answer(objectType)='location'&answer(Object::Customer::CustomerId)=<%=""+customerId%>&APP_TAB_TYPE=<%="YUI" %>&answer(Object::Location::LocationId)=<%="-1" %>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(PrimaryKey_Object::Location::LocationId)=<%="-1" %>&answer(OwnerId)=<%=ownerId+"" %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Location::LocationId)=<%="-1"%>&answer(Object::Submission::InsuredId)=<%=""+customerId%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId%>&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId%>&answer(Object::Location::LocationNumber)=<%="-1" %>&answer(Object::Risk::RiskId)=<%="-1" %>" id="AddLocation_link" /><html:button styleClass="linkButton" property="answer(AddLoc)" value="Add Locations" onclick="window.location=document.getElementById('AddLocation_link')"/></a>														
									</td>
									<logic:present name="locationListArray">
										<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Referred"}%>" value="<%=""+customerStatus %>" negated="true" >
										<td  class="links" >	
												<a href="/RegisterSubmission.do?answer(state)=<%=CustomerState+"" %>&answer(TabPanelName)=Submission_Panel&answer(Object::Clearance::Status)=<%=""+clearanceStatus %>&answer(Object::Submission::LOBId)=<%=""+lobId%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Submission::InsuredId)=<%=""+cId%>&answer(Object::Customer::CustomerId)=<%=""+cId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(Object::Agency::AgencyId)=<%=""+AgencyId%> " id="Submit_Comp_Application"/>
													<html:button styleClass="linkButtonBig" property="answer(submitComp)" value="Submit Completed Application" onclick="window.location=document.getElementById('Submit_Comp_Application')"/>
												</a> 
										</td>
										
										</dmshtml:dms_isPresent>
									</logic:present>
								</tr>
								</dmshtml:dms_isPresent>
								
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
							<td class="sectionhead" width="3%" align="center">
								Edit
							</td>
							<td class="sectionhead" width="8%" align="center">
								Location Number
							</td>
							<td class="sectionhead" width="7%" align="center">
								Location Name
							</td>	
							
						<td class="sectionhead" width="5%">
								Address1
							</td>    
						<td class="sectionhead" width="5%">
								Address2
							</td>    	
						
							<td class="sectionhead" width="5%">
								City
							</td>
							
							<td class="sectionhead" width="5%">
								State
							</td>
							
							<td class="sectionhead" width="5%">
								Country
							</td>
							
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
									<a href="../EditSubmissionEILRisk.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionStatus)=<%=""+customerStatus %>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=
										&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Submission::SubmissionId)=<bean:write name="locationListArray" property="Object::Location::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="locationListArray" property="Object::Location::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="locationListArray" property="Object::Location::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(OwnerId)=<%=ownerId+"" %>" />
									<IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT="">
										
									</a>
								</td>
								<td class="SearchResult" align="center">
									<a href="../EditSubmissionEILRisk.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionStatus)=<%=""+customerStatus %>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=
										&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Submission::SubmissionId)=<bean:write name="locationListArray" property="Object::Location::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="locationListArray" property="Object::Location::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="locationListArray" property="Object::Location::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(OwnerId)=<%=ownerId+"" %>" />
										<bean:write name="locationListArray" property="Object::Location::LocationNumber" />
									</a>
									<%++i;%>
								</td>
								<td class="SearchResult" align="center">
									<a href="../EditSubmissionEILRisk.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionStatus)=<%=""+customerStatus %>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=
										&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Submission::SubmissionId)=<bean:write name="locationListArray" property="Object::Location::SubmissionId" />&answer(Object::Submission::SubmissionVerId)=<bean:write name="locationListArray" property="Object::Location::SubmissionVerId" />&answer(Object::Submission::InsuredId)=<bean:write name="locationListArray" property="Object::Location::SubmissionInsuredId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Location::LocationId" />&answer(PrimaryKey_Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(OwnerId)=<%=ownerId+"" %>" />
										<bean:write name="locationListArray" property="Object::Location::LocationName" />	
										</a>
									&nbsp;
									
								</td>
								
								
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Location::LocationAddress1" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Location::LocationAddress2" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Location::LocationCity" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Location::LocationState" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Location::Country" />&nbsp;
								</td>
								
								
								
								
								 
							</tr>
						</logic:iterate>
					</logic:present>					
				</table>
				</td>
				</tr>
				</table>
				