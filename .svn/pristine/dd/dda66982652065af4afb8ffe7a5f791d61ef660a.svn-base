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
<%@page  import="com.dms.common.ObjectDescriptor" %>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
 <bean:define id="cId1" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
 <br>
<a href='../CreateSubmissionForInsured.do?TabPanelName=Submission_Panel&answer(Object::Submission::Insured:Id)=<%=""+cId1%>&answer(Object::Submission::ClearanceStatus)=<%="Cleared"%>&answer(Object::Submission::Status)=<%="In Progress"%>&answer(Object::ExistingInsured)=<%="YES"%>' title="<bean:message key='ToolTip.InsuredSummary.CreateSubmission'/>" class="button5" >Create a New Submission</a>
 <br>
<logic:present name="customersSize" scope="request">
	<bean:define id="customersSize1"   name="customersSize" scope="request"/>
	<br>
	No of Submission Found:&nbsp;<%=customersSize1.toString()%>
</logic:present>
<br>
<table class="loctable" cellpadding="0" cellspacing="0">
					<tr colspan=9 align="left" style ="font-size:10pt;">Click on either Submission Number or Submission Name to goto Submission Summary<br></tr>
					<tr>
						<th valign="center" align="center">
							<bean:message key="CustomerSearchResult.SlNo"/>
						</th>
					
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
 							<th valign="center" align="center">Submission <br>Id</th>
						</dmshtml:dms_static_with_connector>
						
						<th valign="center" align="center">
							Submission Number
						</th>

						<th valign="center" align="center">
							Submission Name
						</th>
						<th valign="center" align="center">
							Submission Status
						</th>
						<th valign="center" align="center">
							Clearance Status
						</th>
						<!-- <th valign="center" align="center">
							Insured Name Type
						</th>-->					
						<th valign="center" align="center">
							DBA
						</th>
						<th valign="center" align="center">
							Broker Name
						</th>	
						<th valign="center" align="center">
							Address
						</th>											
						<!-- NEWLY ADDED FOR ALLRISKS INSURED LIST
							 By- Anantha kumar.G
						 -->
						<!--<td class="sectionhead" valign="top" width="12%">
							<bean:message key="CustomerSearchResult.Address" />
						</td> -->
						
						<th valign="center" align="center">
							<bean:message key="CustomerSearchResult.City" />
						</th>  

						<th valign="center" align="center">
							<bean:message key="CustomerSearchResult.State"/>
						</th>
						<th valign="center" align="center">
							<bean:message key="CustomerSearchResult.Zip"/>
						</th>
						<!-- <th valign="center" align="center">
							Created By -->
						</th>
						<th valign="center" align="center">
							Created Date
						</th>
						<!-- <th valign="center" align="center">
							Updated By
						</th>
						<th valign="center" align="center">
							Updated Date
						</th>
						-->
						
					</tr>
					<% int i=0;%>

					<%
						String pageNum = (String)request.getAttribute("pagenum");
						try{
						    i=Integer.parseInt(pageNum);
								i = i * 20;
						  }catch(NumberFormatException nfe)
						  {
							  i=0;
						  }
						
					%>
	
<logic:present name="searchresultCustomerDisplay">
					<!--logic:iterate id="searchresultCustomerDisplay" name="searchresultCustomerDisplay" scope="request" -->
					<%
						java.util.ArrayList arrlistcusts = (java.util.ArrayList) request.getAttribute("searchresultCustomerDisplay");
						for (int mn=0; mn<arrlistcusts.size(); mn++){
							com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistcusts.get(mn);
					%>
					
					<tr>
	   					<td>	   
							 <% i++; %>
							 <%=i%>
						</td>

		 				<%
							String cId = qmap.getString("Object::Customer::CustomerId");
						%>

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
							<td>
								<%=qmap.getString("Object::Submission::SubmissionId")%>
							</td>
						</dmshtml:dms_static_with_connector>
						
						<td>
							<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+qmap.getString("Object::Submission::SubmissionVerId")%>&answer(Object::Submission::SubmissionId)=<%=""+qmap.getString("Object::Submission::SubmissionId")%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" title="<bean:message key='ToolTip.InsuredSummary.SubmissionNumber'/>">
								<%=qmap.getString("Object::Customer::SubmissionNumber"+"")%>	
							</a>
						</td>


						<td>
							<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+qmap.getString("Object::Submission::SubmissionVerId")%>&answer(Object::Submission::SubmissionId)=<%=""+qmap.getString("Object::Submission::SubmissionId")%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" title="<bean:message key='ToolTip.InsuredSummary.SubmissionName'/>">
							 	<%=qmap.getEncodedString("Object::Customer::CustomerName")%>
							</a>	
						</td>	
						<td>
							<%=qmap.getString("Object::Customer::Status")%>
						</td>	
						<td>
							<%=qmap.getString("Object::Customer::ClearanceStatus")%>
						</td>	
						<!-- <td>
							<%=qmap.getString("Object::Customer::NameType")%>
						</td>-->	
						<td>
							<%=qmap.getEncodedString("Object::Customer::DBA")%>
						</td>	
						<% 
							String agencyName="";
							String submissionId = "";
							String submissionVerId = "";
						%>
						<dmshtml:GetSubmissionDetailsByCustomerId nameInSession="submissionList" customerId='<%=Long.parseLong(cId.toString())%>' ownerId='<%=Long.parseLong(ownerId.toString())%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
						<%
						java.util.ArrayList arrlistSubmission = (java.util.ArrayList) request.getAttribute("submissionList");
						for (int mn1=0; mn1<arrlistSubmission.size(); mn1++){
							com.dms.ejb.data.QuestionHashMap submissionMap = (com.dms.ejb.data.QuestionHashMap) arrlistSubmission.get(mn1);
							submissionId = ""+submissionMap.getString("Object::Submission::SubmissionId");
							submissionVerId = ""+submissionMap.getString("Object::Submission::SubmissionVerId");
						}	
						%>	
						<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" submissionId='<%=submissionId.toString()%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
							<logic:present name="customerDetail1" scope="request">
								<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
									<% agencyName=customerDetailMap.getEncodedString("agencyname"); %>
							</logic:present>						
						<td>
							<%=agencyName%>
						</td>												
						<!-- <td class="SearchResult" >&nbsp;</td> -->
						
						<!-- NEWLY ADDED FOR ALLRISKS INSURED LIST
							 By- Anantha kumar.G
						 -->
						 <% String address1=qmap.getEncodedString("Object::Customer::Address1");  %>						
						 <% String address2=qmap.getEncodedString("Object::Customer::Address2"); %>						
						 <% String address=address1+" "+address2; %>
						
						<td >
							<%= address %>&nbsp;
						</td>
						<td>
							<%=qmap.getString("Object::Customer::City")%>&nbsp;							
						</td>
						<td>							
							<%=qmap.getString("Object::Customer::State")%>&nbsp;
						</td>
						<td>
							<%=qmap.getString("Object::Customer::Zip")%>&nbsp;
						</td>
						<!-- <td>
							<%=qmap.getString("Object::Submission::CreatedBy")%>&nbsp;
						</td>-->
						<td width="8%">														
								<% String createdDate1 ="";
									String date ="";
								createdDate1 = qmap.getString("Object::Submission::CreatedDate"); 				 					
									if(!createdDate1.equals("")){
                                        String arrCreatedDate[] = createdDate1.split(" ");
                                        date =""+arrCreatedDate[0];
                                        String arrCreatedDate1[] = date.split("-");
                                        String YYYY = arrCreatedDate1[0];
										String MM = arrCreatedDate1[1];
										String DD = arrCreatedDate1[2];
										
										createdDate1 = MM+"-"+DD+"-"+YYYY;
									}
									%>												
				 			<%=createdDate1 %>
						</td>
						<!-- <td>
							<%=qmap.getString("Object::Submission::UpdatedBy")%>&nbsp;
						</td>
						<td width="8%">
								<%	String updatedDate1 ="";
									String date1="";
									updatedDate1 = qmap.getString("Object::Submission::UpdatedDate"); 				 					
									if(!updatedDate1.equals("")){
                                        String arrUpdatedDate[] = updatedDate1.split(" ");
                                        date1 =""+arrUpdatedDate[0];
                                        String arrUpdatedDate1[] = date1.split("-");
                                        String YYYY = arrUpdatedDate1[0];
										String MM = arrUpdatedDate1[1];
										String DD = arrUpdatedDate1[2];
										
										updatedDate1 = MM+"-"+DD+"-"+YYYY;
									}
									%>												
				 			<%=updatedDate1 %>
						</td>-->
	</tr>
	<%} %>
	</logic:present>
	</table>