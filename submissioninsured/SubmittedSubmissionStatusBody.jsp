<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

<script type="text/javascript" src="../Scripts/JScripts/SubmissionSummary.js"></script>
<SCRIPT SRC="../Scripts/JScripts/AddInsured.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/AddRisk.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>


<bean:define id="submissionId" name="AddQuote" property="answer(Object::Submission::SubmissionId)"  /> 
<bean:define id="submissionVerId" name="AddQuote" property="answer(Object::Submission::SubmissionVerId)" /> 
<bean:define id="customerId" name="AddQuote" property="answer(Object::Customer::CustomerId)" scope="request" />

<table WIDTH="80%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
	<tr height="10">
		<td>&nbsp;</td>		
	</tr>
	<tr>
		<td width="80%" bgcolor="#C6DEEA">
			<table width="95%">
				<tr>
					<td colspan="2">
						<table width="95%" align="center" border="0">
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
	<tr>
		<td width="100%">	
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0"> 	
				<tr>
					<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td class="NewSectionHead" colspan="5" align="center">SUBMISSION REFERRAL</td>
				</tr>
				<tr>
					<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
				</tr>
			</table>
		</td>
	</tr>	


<!--########################## SUBMISSION SUMMARY #########################################-->		
		<%if((!submissionId.toString().equals("")) && (!submissionVerId.toString().equals(""))) {%>	
			<tr>
				<td>&nbsp;</td>			
			</tr>		
			<tr>
				<td class="links" align="left" width="150px">					
					<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=submissionVerId.toString()%>&answer(Object::Submission::SubmissionId)=<%=submissionId.toString()%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=customerId%>&customerId=<%=customerId%>&answer(Object::Customer::CustomerId)=<%=customerId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+customerId %>" >
						Submission Summary
					</a>			
				</td>	
			</tr>
		<%}%>				
	<!--########################## SUBMISSION SUMMARY #########################################-->
</table>		
<html:form action="/SaveSubmissionRegisterQuoteStatus.do" onsubmit="disableButton(this)">	
	<table WIDTH="90%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<logic:notEqual name="actionStatus" value="submit">
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DISPLAY_RULES_MSG"}%>' connector='or' negated="true">
						<tr>
							<td class="Error">
												
								<logic:present name="MESSAGE_LIST" scope="request">
								<ol>
									<logic:iterate id="message" name="MESSAGE_LIST">
									<li><bean:write name="message"/></li>
									</logic:iterate>
								</ol>			
								</logic:present>											
							</td>
						</tr>
					</dmshtml:dms_static_with_connector>
				</logic:notEqual>			
			
				<logic:notEqual name="actionStatus" value="submit">
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DISPLAY_RULES_MSG"}%>' connector='or' negated="true">
						<tr>
							<td class="Error">
								<logic:present name="MESSAGE_LISTS" scope="request">
			    	 				<ol>
							        	<logic:iterate id="InnerMessageList" name="MESSAGE_LISTS">
								        	<%int flag=0; %>
									        	<logic:iterate id="message" name="InnerMessageList">
									                <%
									                	if(flag==0){%>
			         										<li style="{FONT-WEIGHT: bold;COLOR: #2437A0;FONT-FAMILY: Verdana, Arial, Helvetica}"><bean:write  name="message"/></li>
			        											<%flag=1;}else{ %>
			         												<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write name="message"/></li>
			        								<%} %>
			        							</logic:iterate>
			      						</logic:iterate>
			     					</ol>   
			     				</logic:present>
							</td>
						</tr>
					</dmshtml:dms_static_with_connector>
				</logic:notEqual>	
			</table>
		</td>
	</tr>	

	
	<tr>
		<td>
			<table width="100%" border="0" align="left">
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="TextMatter1" align="right">		
						Submission Referral Notes
					</td>
					<td class="TextMatter1" align="left">
						<dmshtml:dms_textarea styleClass="txtarea" name="AddQuote"  property="answer(Object::QuoteAdditional::ReferralNotes)" rows="6" cols="80"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" align="left">
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<!-- tr>
					<td class="TextMatter" align="right">
						Based on one or more of your answers to application questions we are unable to provide you with a quote proposal until your completed application is reviewed by an underwriter. If you would like to refer the application to Underwriting, please click on Confirm Referral, print out and complete the generated pdf application, and send it to us
					</td>
				</tr -->
			</table>
		</td>
	</tr>														
	<tr>
		<td>
			<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="center" class="links" colspan="4">
					<INPUT TYPE="submit" value="Confirm Referral" class="sbttn" id="ConfirmSubmit">
				</td>
		
				<td>
					<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
				</td>
			</tr>
			</table>
		</td>
	</tr>
							
	<tr>
		<td>
			<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
			<!-- Added by N.Senthil 
 					 To set OwnerId -->
			<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
		
			<html:hidden property="answer(Object::Submission::SubmissionStatus)"  name="AddCustomer"  value="Referred" />
			<html:hidden property="answer(Object::Submission::SubmissionId)"  name="AddCustomer"  />
			<html:hidden property="answer(Object::Submission::SubmissionVerId)"  name="AddCustomer" />
			<html:hidden property="answer(Object::Submission::InsuredId)" name="AddCustomer"  />					
			<html:hidden property="answer(Object::Submission::LOBId)" name="AddCustomer" />
			<html:hidden property="answer(Object::Customer::CustomerId)" name="AddCustomer" />
			<html:hidden property="answer(Object::UserDetail::ownerId)" name="AddCustomer" />		
			<html:hidden property="answer(Object::Agency::AgencyId)" name="AddCustomer" />	
			<html:hidden property="answer(Object::Quote::primaryEntityId)" name="AddCustomer" value="1" />	
			<html:hidden property="TabPanelName" value="Quote_Panel" />
			<html:hidden property="answer(Entity::Equals::OwnerId)" value="12" />
			<html:hidden property="answer(createQuoteEffectiveDate)" value="yes" />
			<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(formName)" value="form::GETCLQUOTEDETAILS" />
			<html:hidden property="answer(Object::Quote::ProductStatus)" value="RELEASED" />
			<html:hidden property="answer(Object::Customer::State)" value="CA" />
			<html:hidden property="answer(Object::Risk::RiskId)" value="11" />
			<html:hidden property="answer(Object::Quote::NewQuote)" value="YES" />					
			<!--  Added by Senthil.n  -->
			<html:hidden property="answer(Object::Submission::CreatedBy)"  value="<%=userId.toString()%>"  />			
			<html:hidden property="answer(Object::Submission::OwnerId)"  value="<%=ownerId.toString()%>"  />
		</td>
	</tr>
</table>
</html:form>

