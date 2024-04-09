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
<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
<bean:define id="CustomerState" name="AddParentQuote" property="answer(state)" />
<bean:define id="clearanceStatus" name="AddParentQuote" property="answer(Object::Clearance::Status)"/>
<bean:define id="lobId" name="AddParentQuote" property="answer(Object::Submission::LOBId)"/>
<bean:define id="cId" name="AddParentQuote" property="answer(Object::Submission::InsuredId)"/>
<bean:define id="SubmissionStatus" name="AddParentQuote" property="answer(Object::Submission::SubmissionStatus)"/>
<html:hidden property="answer(Object::Submission::SubmissionStatus)" styleId="SubmissionStatus1" value= '<%=""+SubmissionStatus %>'/>
<html:hidden property="answer(Object::Submission::SubmissionId)" styleId="SubmissionId1" value= '<%=""+SubmissionId %>'/>
<html:hidden property="answer(Object::Submission::SubmissionVerId)" styleId="SubmissionVerId1" value= '<%=""+SubmissionVerId %>'/>
<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId1" value= '<%=""+customerId %>'/>
<html:hidden property="answer(Object::Agency::AgencyId)" styleId="AgencyId1" value= '<%=""+AgencyId %>'/>
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>
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
									        <%	i++; %>
									                <%
									                	if(flag==0){%>
			         										<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write  name="message"/></li>
			        											<%flag=1;}else{ %>
			         												<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write name="message"/></li>
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
								<html:button value="Back" styleClass="locbutton left" property="answer(back)" onclick="javascript:history.go(-1);"/>
							</td>
						</tr>
						<%} %>
</table>	
					
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
							<td align="left">
								&nbsp;&nbsp;
								<a href="../NewBTAQuote.do?TabPanelName=Quote_Panel&answer(Object::CustomerAdditional::ProgramName)=ADD&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=userId.toString()%>&formName=form::GETCLQUOTEDETAILS&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Quote::ProductStatus)=DEVELOPMENT&answer(State)=<%=EmpGrpState%>&answer(Object::Quote::SubmissionId)=<%=""+SubmissionId%>&answer(Object::Quote::SubmissionVerId)=<%=""+SubmissionVerId %>&answer(Object::Risk::RiskId)=14&answer(Object::Quote::NewQuote)=YES&answer(Object::Quote::ProductStatus)=DEVELOPMENT" title="Click to go to create a New Quote" id="Create_Quote_link">
								
								<html:button value="Create Quote For This Submission" styleClass="locbutton left" property="answer(back)" onclick="window.location=document.getElementById('Create_Quote_link')"/>
				</a>
				
							</td>
							<td align="left">
								&nbsp;&nbsp;
								
							<%/* for Users other than Agency and agent*/ %>
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="true">									
														<a href="../CreateSubmissionAction.do?clear=yes" id="Create_Submission">
														<html:button value="Enter New Submission" styleClass="locbutton left" property="answer(back)" onclick="window.location=document.getElementById('Create_Submission')"/>
													</a>
							</dmshtml:dms_static_with_connector>

							<%/* for Agency and agent users*/ %>
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="false">									
														<a href="../CheckClearanceActionUI3.do?TabPanelName=Submission_Panel&clear=yes" id="Create_Submission">
														<html:button value="Enter New Submission" styleClass="locbutton left" property="answer(back)" onclick="window.location=document.getElementById('Create_Submission')"/>
													</a>
							</dmshtml:dms_static_with_connector>	
					
							</td>
						</tr>
						</table>
<% }%>				
</div>
</div>

