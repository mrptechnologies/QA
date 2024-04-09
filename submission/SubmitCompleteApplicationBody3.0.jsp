<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<bean:define id="customerId" name="AddParentQuote" property="answer(Object::Customer::CustomerId)"></bean:define>
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddParentQuote" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="AgencyId" property="answer(Object::Agency::AgencyId)" name="AddParentQuote" />
<bean:define id="SubmissionId" property="answer(Object::Submission::SubmissionId)" name="AddParentQuote" />
<bean:define id="SubmissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="AddParentQuote" />
<bean:define id="SubmissionType1" property="answer(Object::Submission::Type)" name="AddParentQuote" />
<bean:define id="submissionRenewalPolNo1" property="answer(Object::Submission::RenewalPolicy)" name="AddParentQuote" />
<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
<bean:define id="CustomerState" name="AddParentQuote" property="answer(state)" />
<bean:define id="clearanceStatus" name="AddParentQuote" property="answer(Object::Clearance::Status)"/>
<bean:define id="lobId" name="AddParentQuote" property="answer(Object::Submission::LOBId)"/>
<bean:define id="cId" name="AddParentQuote" property="answer(Object::Submission::InsuredId)"/>
<bean:define id="SubmissionStatus" name="AddParentQuote" property="answer(Object::Submission::SubmissionStatus)"/>
<html:hidden property="answer(Object::Submission::RenewalPolicy)" styleId="submissionRenewalPolNo" value= '<%=""+submissionRenewalPolNo1%>'/>
<html:hidden property="answer(Object::Submission::Type)" styleId="SubmissionType" value= '<%=""+SubmissionType1%>'/>
<html:hidden property="answer(Object::Submission::SubmissionId)" styleId="SubmissionId1" value= '<%=""+SubmissionId %>'/>
<html:hidden property="answer(Object::Submission::SubmissionVerId)" styleId="SubmissionVerId1" value= '<%=""+SubmissionVerId %>'/>
<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId1" value= '<%=""+customerId %>'/>
<html:hidden property="answer(Object::Agency::AgencyId)" styleId="AgencyId1" value= '<%=""+AgencyId %>'/>
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>
<bean:define id="resPropertyId" name="AddParentQuote" property="answer(Object::Risk::ComProperty::ComPropertyId)"/>
<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="ObjectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/>
		<% if(request.getAttribute("ApplicationMap")!=null){
				
				com.dms.ejb.data.QuestionHashMap applicationMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("ApplicationMap");
				String submissionVerId = applicationMap.getString("Object::Submission::SubmissionVerId");
			}else{
		%>
		<bean:define id="submissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="AddParentQuote" />
		
		<%} %>
		<dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							
		<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>

		<html:hidden property="answer(Object::Submission::SubmissionVerId)" styleId="SubmissionVerId1" value= '<%=""+SubmissionVerId %>'/>
<table>
	<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
		<tr>
				<td width="1200px" bgcolor="#C6DEEA">
					<table width="95%">
						<tr>
							<td colspan="2">
								<table width="95%" align="center" border="1">
									<tr>
										<td>
											<jsp:include page="../common/SubmissionInsuredAgencyLinksPage.jsp" />
										</td>
									</tr>
								</table>
							</td>
						</tr>				
						
					</table>
				</td>
			</tr>
	</logic:notEqual>
</table>

<div class="locformpage" id="Loc3TableData">
<div class="locformbox1"> 
<%int i=0; %>
<logic:present name="MESSAGE_LISTS" scope="request">
<table class="loctable" cellpadding="0" cellspacing="0">
					
						
							        	<logic:iterate id="InnerMessageList" name="MESSAGE_LISTS">
							        	<tr>
							<td class="Error">
								
			    	 				<ol>
								        	<%int flag=0; %>
									        	<logic:iterate id="message" name="InnerMessageList">
												 <% ++i; %>
									                <%
									                	if(flag==0){%>
			         										<%=i%> .<bean:write  name="message"/>
			        									<%flag=1;}else{ %>
			         										<%=i%> .<bean:write name="message"/>
			        									<%} %>
			        							</logic:iterate>
			        							</ol>  
 								
			     				
							</td>
						</tr>
			      						</logic:iterate>
			     					
						<%if(i > 0){ %>
						<tr>	
							<td align="left">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a style="display: none;" id="LocationListPageLink" href="../GetSubmissionLocationList3.0.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionStatus)=<%=SubmissionStatus%>&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=""+id%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(requestForm)=Submission&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Submission::InsuredId)=<%=""+cId %>&answer(Object::Customer::CustomerId)=<%=""+customerId %>&answer(Object::Customer::CustomerId)=<%=""+customerId %>&answer(Object::Risk::ComProperty::ComPropertyId)=<%=""+resPropertyId %>&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=&answer(Object::Location::LocationId)=&answer(PrimaryKey_Object::Location::LocationId)=&answer(PrimaryKey_Object::Customer::CustomerId)=<%=""+customerId %>&answer(ObjectType)=<%="RISK" %>&answer(OwnerId)=<%=ownerId+"" %>&answer(Object::Location::LocationId)=&answer(Object::Location::LocationName)=" /></a>
								<html:button value="Back" styleClass="locbutton left" property="answer(back)" onclick="goToLocationListPage();"/>
							</td>
						</tr>
						<%} %>
</table>	
					
</logic:present>

<logic:present name="ERROR_DURING_SAVE_SUBMISSION_STATUS" scope="request">
<%
i=i+1;
if(i > 0){ %>
<tr>	
	<td align="left">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<html:button value="Back" styleClass="locbutton left" property="answer(back)" onclick="javascript:history.go(-1);"/>
	</td>
</tr>
<%} %>
</logic:present>

<%if(i==0){ %>
<%String  submissionNumber = "";
String EmpGrpState = "";%>
<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" submissionId='<%=""+SubmissionId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
							<logic:present name="customerDetail1" scope="request">

							<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
																	type="com.dms.ejb.data.QuestionHashMap" />
								<%submissionNumber = customerDetailMap.getString("SubmissionNumber"); 
								EmpGrpState=customerDetailMap.getString("Object::Customer::State");%>
							</logic:present>
			<table>
			<tr>	
				<td>			
				<div class="message left"><h2>Submission Complete</h2></div>
			</td>
			</tr>
			<tr>
			<td>
				<div class="message left"><h3>Submission number <%=submissionNumber %> successfully entered.</h3></div>
			</td>
			</tr>
			<tr>
			<td>
				<div class="message left"><h3>What would you like to do next?</h3></div>
			</td>
			</tr>
				<tr>	
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_CREATE_QUOTE"}%>' connector='or' negated="true">
							<td align="left">
								&nbsp;&nbsp;
								<a href="../NewBTAQuote.do?TabPanelName=Quote_Panel&answer(Object::CustomerAdditional::ProgramName)=ADD&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=userId.toString()%>&formName=form::GETCLQUOTEDETAILS&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Quote::ProductStatus)=DEVELOPMENT&answer(State)=<%=EmpGrpState%>&answer(Object::Quote::SubmissionId)=<%=""+SubmissionId%>&answer(Object::Quote::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Risk::RiskId)=14&answer(Object::Quote::NewQuote)=YES&answer(Object::Quote::ProductStatus)=DEVELOPMENT" Progress&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=userId.toString()%>&formName=form::GETCLQUOTEDETAILS&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Quote::ProductStatus)=RELEASED&answer(State)=<%=EmpGrpState%>&answer(Object::Quote::SubmissionId)=<%=""+SubmissionId%>&answer(Object::Quote::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Risk::RiskId)=11&answer(Object::Quote::NewQuote)=YES&answer(Object::Quote::ProductStatus)=RELEASED" title="Click to go to create a New Quote" id="Create_Quote_link">								
								<html:button value="Create Quote For This Submission" style="width:220px" styleClass="covbigbutton1" property="answer(back)" onclick="window.location=document.getElementById('Create_Quote_link')"/>
							</a>				
							</td>
							</dmshtml:dms_static_with_connector>
							
							
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_CREATE_QUOTE"}%>' connector='or' negated="false">
							<td align="left">
								&nbsp;&nbsp;
								<a href="../NewEILQuote.do?TabPanelName=Quote_Panel&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=userId.toString()%>&formName=form::GETCLQUOTEDETAILS&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Quote::ProductStatus)=RELEASED&answer(State)=<%=EmpGrpState%>&answer(Object::Quote::SubmissionId)=<%=""+SubmissionId%>&answer(Object::Quote::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Quote::QuoteType)=<%=""+SubmissionType1%>&answer(Object::QuoteAdditional::RenewalPolicyNumber)=<%=""+submissionRenewalPolNo1%>&answer(Object::Risk::RiskId)=11&answer(Object::Quote::NewQuote)=YES&answer(Object::Quote::ProductStatus)=RELEASED" title="Click to go to create a New Quote" id="Create_Quote_link">								
								<html:button value="Create Quote For This Submission" styleClass="locbutton left" property="answer(back)" onclick="window.location=document.getElementById('Create_Quote_link')"/>
							</a>				
							</td>
							</dmshtml:dms_static_with_connector>
							
							<td align="left">
								&nbsp;&nbsp;
								
							<%/* for Users other than Agency and agent*/ %>
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="true">									
														<a href="../CreateSubmissionAction.do?clear=yes" id="Create_Submission" title = "Click to Create a New Submission">
														<html:button value="Enter New Submission" styleClass="covbigbutton1" property="answer(back)" onclick="window.location=document.getElementById('Create_Submission')"/>
													</a>
							</dmshtml:dms_static_with_connector>

							<%/* for Agency and agent users*/ %>
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="false">									
														<a href="../CheckClearanceActionUI3.do?TabPanelName=Submission_Panel&clear=yes" id="Create_Submission">
														<html:button value="Enter New Submission" styleClass="covbigbutton1" property="answer(back)" onclick="window.location=document.getElementById('Create_Submission')"/>
													</a>
							</dmshtml:dms_static_with_connector>	
					
							</td>
						</tr>
						</table>
<% }%>				
</div>
</div>

<script type="text/javascript">
function goToLocationListPage() {
	if(document.getElementById("LocationListPageLink") != null && document.getElementById("LocationListPageLink") != undefined) {
		document.location = document.getElementById("LocationListPageLink").href;
	}
}
</script>