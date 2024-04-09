<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>


<html:form action="/SaveLapseSubmissionStatus.do" >
	<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
	<bean:parameter id="SubmissionId" name="answer(Object::Submission::SubmissionId)" /> 									
	<bean:parameter id="SubmissionVerId" name="answer(Object::Submission::SubmissionVerId)" /> 
	<bean:parameter id="submissionInsuredId" name="answer(Object::Submission::InsuredId)" />
	<bean:parameter id="submissionType1" name="answer(Object::Submission::Type)" />
	<bean:parameter id="submissionRenewalPolNo1" name="answer(Object::Submission::RenewalPolicy)" />
	
	<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
		<%	
		String agencyIdTemp="";
			if(request.getParameter("answer(Object::Agency::AgencyId)")!=null)
			{
				agencyIdTemp=request.getParameter("answer(Object::Agency::AgencyId)");
		%>
		<tr><td><html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
		</td></tr>
		<%
			}
		%><%
			String customerId="";
			
			if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
			{
				customerId=request.getParameter("answer(Object::Customer::CustomerId)");
			}		
			String strSubmissionStatus="";
			if(request.getParameter("answer(Object::Submission::SubmissionStatus)")!=null)
			{
				strSubmissionStatus=request.getParameter("answer(Object::Submission::SubmissionStatus)");
			}
			
		%>
		<tr>
			<td>	
				&nbsp;
			</td>
		</tr>
		<tr>
		<td>
			<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
			<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
				<tr>
					<td>	
						<jsp:include page="../common/SubmissionInsuredAgencyLinksPage.jsp" />
					</td>
				</tr>
			
				<tr>	
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td >	
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">	
							<tr>
								<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td class="NewSectionHead" colspan="5" align="center">LAPSE SUBMISSION </td>
							</tr>
							<tr>
								<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>	
					<td>
						&nbsp;
					</td>
				</tr>
				</logic:notEqual>
				<tr>
					<td align="left">
						<table width="100%" border="0">
								<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
								<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
								<tr><td><html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
								</td></tr>
								<tr>
									<bean:define id="parentQuoteId" name="AddQuote" property="answer(Object::Quote::Id)"/>
									
									<td colspan="2" class="links">
										<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=(SubmissionVerId.toString())%>&answer(Object::Submission::SubmissionId)=<%=(SubmissionId.toString())%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=(customerId.toString())%>&customerId=<%=(""+customerId)%>&answer(Object::Customer::CustomerId)=<%=(""+customerId)%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+customerId%>" title="<bean:message key='ToolTip.LapseSubmission.SubmissionSummary'/>">Submission Summary</a>
									</td>											
								</tr>
								<tr>										
									<td  colspan="6" align="center" class="sectionhead">
									
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
					<td align="left">
					<div class="SubjectivityPage">									
						<div class="content">							
						<div class="Subjectivityformhead"><h2 class="left">LAPSE SUBMISSION</h2></div>						
						<h3>Lapse Details</h3>
						<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">							
							<tr>
								<td>
									<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">													
										<tr>
											<td class="TextMatter1" align="right">					
												Reason for Lapse 
											</td>
											<td class="TextMatter1" align="left">
												<dmshtml:get_DropDown_Values dbname='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'  lookupType="Lapse_Reason" nameInSession="dropDownValues" ownerId='<%=""+ownerId %>' />							
													<logic:present name="dropDownValues" scope="request">									
														<bean:define id="dropDownValueList" name="dropDownValues" type="java.util.ArrayList"/>			
															<html:select property="answer(Object::Submission::Reason)" styleClass='txtbox' styleId="Lapse_Reason" >
																<%for(int i=0;i<dropDownValueList.size();i++) {
																	com.dms.ejb.data.QuestionHashMap dropDownMap=(com.dms.ejb.data.QuestionHashMap)dropDownValueList.get(i);	
																%>											
																<html:option value ='<%=dropDownMap.getString("DropDownValue")%>'>
																	<%=dropDownMap.getString("DropDownDescription")%>
																</html:option>										
																<%}%>
															</html:select>
													</logic:present>
											</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>													
										<tr>
											<td class="TextMatter1" align="right">
		
												Notes
											</td>
											<td class="TextMatter1" align="left">
												<dmshtml:dms_textarea styleClass="txtarea" name="AddQuote"  property="answer(Object::Submission::Notes)" rows="6" cols="80"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<html:hidden property="answer(Object::Submission::SubmissionStatus)" value="Lapsed" />
								</td>
							</tr>							
							<tr>
								<td>
									<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>										
										<tr>
											<td align="center" class="links" colspan="4" title="<bean:message key='ToolTip.LapseSubmission.Save'/>">
											<!-- 	<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Referred"}%>" value="<%=""+strSubmissionStatus%>" negated="true" >
													<INPUT TYPE="submit" value="Save" class="sbttn">
												</dmshtml:dms_isPresent>  -->
												
												<INPUT TYPE="submit" value="Save" class="sbttn">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							</table></div></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>	
	</table>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("answer(TabPanelName)")%>" />
	<html:hidden property="answer(TabPanelName)" value="<%=""+request.getParameter("answer(TabPanelName)")%>" />
	<html:hidden property="answer(requestForm)" value="Submission" />
	<html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />
	<html:hidden property="answer(Object::Activity::CreatedBy)" value='<%=""+usernameId%>'/>
	<html:hidden property="answer(Object::Submission::UpdatedBy)" value="<%=""+usernameId%>" />	
	<html:hidden property="answer(Object::Submission::CreatedBy)" value='<%=""+usernameId%>'/>
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>	
	<html:hidden property="answer(Object::Submission::InsuredId)" value='<%=""+submissionInsuredId %>'  />	
	<html:hidden property="answer(Object::Submission::SubmissionId)" value='<%=SubmissionId+""%>' styleId="submissionId" />		
	<html:hidden property="answer(Object::Submission::SubmissionVerId)" value='<%=SubmissionVerId+""%>' styleId="submissionVerId" />
	<html:hidden property="answer(Object::Submission::PreviousStatus)" value='<%=""+strSubmissionStatus%>'/>
	<html:hidden property="answer(Object::Submission::Type)" value= '<%=""+submissionType1 %>'/>
	<html:hidden property="answer(Object::Submission::RenewalPolicy)" value= '<%=""+submissionRenewalPolNo1 %>'/>			   
				   	
</html:form>