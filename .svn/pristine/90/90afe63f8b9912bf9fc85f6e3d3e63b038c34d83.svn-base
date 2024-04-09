<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<%
	String policySubjectivityId1 = "";
	String policyId="";
	if(request.getParameter("answer(policyId)")!=null)
	{
		policyId=request.getParameter("answer(policyId)");
	}else if(request.getAttribute("answer(policyId)")!=null){
		policyId = ""+request.getAttribute("answer(policyId)");
	}
	
	String policyVerId="";
	if(request.getParameter("answer(policyVerId)")!=null)
	{
		policyVerId=request.getParameter("answer(policyVerId)");
	}else if(request.getAttribute("answer(policyVerId)")!=null){
		policyVerId = ""+request.getAttribute("answer(policyVerId)");
	}
	
	String policyNumber="";
	if(request.getParameter("answer(policyNumber)")!=null)
	{
		policyNumber=request.getParameter("answer(policyNumber)");
	}else if(request.getAttribute("answer(policyNumber)")!=null){
		policyNumber = ""+request.getAttribute("answer(policyNumber)");
	}
	String customerId="";
	if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
	{
		customerId=request.getParameter("answer(Object::Customer::CustomerId)");
		
	}else if(request.getAttribute("answer(Object::Customer::CustomerId)")!=null){
		customerId = ""+request.getAttribute("answer(Object::Customer::CustomerId)");
	}
	String policyStatus ="";
	if(request.getParameter("answer(policyStatus)")!=null)
	{
		policyStatus=request.getParameter("answer(policyStatus)");
	}else if(request.getAttribute("answer(policyStatus)")!=null){
		policyStatus = ""+request.getAttribute("answer(policyStatus)");
	}
	String parentQuoteId ="";
	if(request.getParameter("answer(Object::Quote::ParentQuoteId)")!=null)
	{
		parentQuoteId=request.getParameter("answer(Object::Quote::ParentQuoteId)");
	}else if(request.getAttribute("answer(Object::Quote::ParentQuoteId)")!=null){
		parentQuoteId = ""+request.getAttribute("answer(Object::Quote::ParentQuoteId)");
	}
	String parentVerQuoteId ="";
	if(request.getParameter("answer(Object::Quote::ParentQuoteVerId)")!=null)
	{
		parentVerQuoteId=request.getParameter("answer(Object::Quote::ParentQuoteVerId)");
	}else if(request.getAttribute("answer(Object::Quote::ParentQuoteVerId)")!=null){
		parentVerQuoteId = ""+request.getAttribute("answer(Object::Quote::ParentQuoteVerId)");
	}
%>
<table>
<tr><td>
<div id="dialog1" style='display: none;'>

<div class="hd">Enter Your Notes Here</div>
<div class="bd">
<table cellpadding="1" cellspacing="0">
  	 <tr>
  	   <td> 
  	     <h6>Notes Description:</h6>
  	   </td>
       <td> 
         <input type = text name="answer(Object::Notes::Description)" id="notesDesc" size="50" maxlength="54" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal View Only 
        <input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/> </td>
     </tr>
  	 <tr>
  	 <td>
  	   <h6>Notes:</h6>
  	 </td>
  	<td>
  	<div id="text">
  	 <textarea  name="answer(Object::Notes::Notes)" id="editor" rows="6" cols="80"> </textarea> 
  	</div> 
  	</td>
  </tr>
   <tr>
             <td width=50>&nbsp;</td>
             <td align=center>
              <html:button property="Save" value=" Save " styleClass="uibutton"  styleId="save" onmouseover="" />
              <html:button property="Cancel" value="Cancel" styleClass="uibutton" styleId="cancel" />
               </td>
              </tr>
</table>
</div>
</div>

</td>
</tr></table>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />

<table WIDTH="90%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<tr>
					<td>
						<jsp:include page="../common/DynamicPolicyHeader.jsp">
							<jsp:param name="policyId" value="<%=policyId.toString()%>" />
							<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
							<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
							<jsp:param name="title" value="<%="Policy Information"%>" />
						</jsp:include>
					</td>
				</tr>
			</table>				
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="link">
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>&answer(Object::Quote::PaymentPlan)">Return to Policy Summary</a>			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>&answer(Object::Quote::PaymentPlan)&answer(DEFAULT_POLICY_TAB)=SUBJECTIVITY">Return to Subjectivity</a>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="NewSectionHeadNew" align="center">SUBJECTIVITY SUMMARY</td>
	</tr>
	<logic:present name="SubjectivityDetail">
	<tr>
		<td>
			<html:form action="/SavePolicySubjectivity.do">			
				<table width="85%" align="center" border="0">
					<tr><td>&nbsp;</td></tr>		
					<tr>
						<td class="FormLabels" width="40%">
							Description
						</td>												
						<td class="TextMatter">
						<bean:define id="desc" name="SubjectivityDetail" property="subjectivityDesc" />
						<%=""+desc %>
						<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityDesc)" value="<%=""+desc%>" />
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels">
							Level
						</td>												
						<td class="TextMatter">
						<bean:define id="subjectivityLevel" name="SubjectivityDetail" property="subjectivityLevel" />
						<%
						String level="";
						if((""+subjectivityLevel).equalsIgnoreCase("Risk")){
							level = "Tank";
						}else{
							level = ""+subjectivityLevel;
						}
						%>
						<%=""+level %>
						<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityLevel)" value="<%=""+subjectivityLevel%>" />
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>	
					<tr>
						<td class="FormLabels">
							Type
						</td>												
						<td class="TextMatter">
						<bean:define id="subjectivityType" name="SubjectivityDetail" property="subjectivityType" />
						<%=""+subjectivityType %>
						<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityType)" value="<%=""+subjectivityType%>" />
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels">
							Required Before
						</td>		
						<bean:define id="subjectivityRequiredProcess" name="SubjectivityDetail" property="subjectivityRequiredProcess" />						
						<td class="TextMatter">	
						<%=""+subjectivityRequiredProcess %>			
						<html:hidden value="<%=""+subjectivityRequiredProcess %>" property="answer(Object::Policy::Subjectivity::SubjectivityRequiredProcess)" />																											
						</td>						
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels">
							Cause
						</td>												
						<td class="TextMatter">
						<bean:define id="cause" name="SubjectivityDetail" property="cause" />
						<%=""+cause %>
						<html:hidden property="answer(Object::Policy::Subjectivity::Cause)" value="<%=""+cause%>" />
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels">
							Location
						</td>												
						<td class="TextMatter">
						<bean:define id="locationNumber" name="SubjectivityDetail" property="locationNumber" />
						<%=""+locationNumber %>
						<html:hidden property="answer(Object::Policy::Subjectivity::LocationNumber)" value="<%=""+locationNumber%>" />
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels">
							Location Name
						</td>												
						<td class="TextMatter">
						<bean:define id="locationName" name="SubjectivityDetail" property="locationName" />
						<%=""+locationName %>
						<html:hidden property="answer(Object::Policy::Subjectivity::LocationName)" value="<%=""+locationName%>" />
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels">
							Tank
						</td>												
						<td class="TextMatter">
						<bean:define id="riskNumer" name="SubjectivityDetail" property="riskNumer" />
						<%=""+riskNumer %>
						<html:hidden property="answer(Object::Policy::Subjectivity::RiskNumer)" value="<%=""+riskNumer%>" />
						</td>
					</tr>	
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels">
							Tank Name
						</td>												
						<td class="TextMatter">
						<bean:define id="riskName" name="SubjectivityDetail" property="riskName" />
						<%=""+riskName %>
						<html:hidden property="answer(Object::Policy::Subjectivity::RiskName)" value="<%=""+riskName%>" />
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels">
							Status
						</td>												
						<td class="link">
						<bean:define id="status" name="SubjectivityDetail" property="status" />	
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">												
						<html:select value="<%=""+status %>" styleClass="txtbox" property="answer(Object::Policy::Subjectivity::Status)">
							<html:option value="Open">Open</html:option>
							<html:option value="Satisfied">Satisfied</html:option>
							<html:option value="Not Required">Not Required</html:option>
							<html:option value="Rejected">Rejected</html:option>
						</html:select>						
						</dmshtml:dms_static_with_connector>	
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="false">						
							<%=""+status %>
							<html:hidden value="<%=""+status %>" property="answer(Object::Policy::Subjectivity::Status)" />
						</dmshtml:dms_static_with_connector>
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels">
							Last Modified
						</td>												
						<td class="TextMatter">
						<bean:define id="updatedDate" name="SubjectivityDetail" property="updatedDate" />
						<%														
							String arrOfUpdatedDate[] = (""+updatedDate).split("-");
							String Month = arrOfUpdatedDate[1];
							String DateObj = arrOfUpdatedDate[2];
							String Year = arrOfUpdatedDate[0];
						%>
						<%=""+Month+"/"+DateObj+"/"+Year %>	
						<html:hidden property="answer(Object::Policy::Subjectivity::UpdatedDate)" value="<%=""+updatedDate%>" />					
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="FormLabels">
							Modified By
						</td>												
						<td class="TextMatter">
						<bean:define id="updatedBy" name="SubjectivityDetail" property="updatedBy" />
						<%=""+updatedBy %>						
						</td>
					</tr>
					<tr>
						<td>
							<bean:define id="policySubjectivityId" name="SubjectivityDetail" property="policySubjectivityId" />
							<%policySubjectivityId1= ""+policySubjectivityId; %>
							<html:hidden property="answer(Object::Policy::Subjectivity::PolicySubjectivityId)" value="<%=""+policySubjectivityId%>" />
							
							<bean:define id="policyId1" name="SubjectivityDetail" property="policyId" />
							<html:hidden property="answer(Object::Policy::Subjectivity::PolicyId)" value="<%=""+policyId1%>" />
							
							<bean:define id="policyVerId1" name="SubjectivityDetail" property="policyVerId" />
							<html:hidden property="answer(Object::Policy::Subjectivity::PolicyVerId)" value="<%=""+policyVerId1%>" />
							
							<bean:define id="subjectivityId" name="SubjectivityDetail" property="subjectivityId" />
							<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityId)" value="<%=""+subjectivityId%>" />
							
							<bean:define id="subjectivityVerId" name="SubjectivityDetail" property="subjectivityVerId" />
							<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityVerId)" value="<%=""+subjectivityVerId%>" />
							
							<bean:define id="subjectivityName" name="SubjectivityDetail" property="subjectivityName" />
							<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityName)" value="<%=""+subjectivityName%>" />
																	
							<bean:define id="locationId" name="SubjectivityDetail" property="locationId" />
							<html:hidden property="answer(Object::Policy::Subjectivity::LocationId)" value="<%=""+locationId%>" />

							<bean:define id="riskId" name="SubjectivityDetail" property="riskId" />
							<html:hidden property="answer(Object::Policy::Subjectivity::RiskId)" value="<%=""+riskId%>" />
							
							<bean:define id="active" name="SubjectivityDetail" property="active" />
							<html:hidden property="answer(Object::Policy::Subjectivity::Active)" value="<%=""+active%>" />
							
							<bean:define id="createdBy" name="SubjectivityDetail" property="createdBy" />
							<html:hidden property="answer(Object::Policy::Subjectivity::CreatedBy)" value="<%=""+createdBy%>" />
							
							<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
							<html:hidden property="answer(Object::Policy::Subjectivity::UpdatedBy)" value="<%=""+usernameId%>" />
							<html:hidden property="answer(TabPanelName)" value="Policy_Panel" />
							<html:hidden property="TabPanelName" value="Policy_Panel" />
							<html:hidden property="answer(Object::Policy::Subjectivity::OwnerId)" value="<%=""+ownerId%>" />														
							<html:hidden property="answer(policyId)" value="<%=""+policyId%>" />
							<html:hidden property="answer(policyVerId)" value="<%=""+policyVerId%>" />
							<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />
							<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>" />
							<html:hidden property="answer(Object::Activity::OwnerId)"  value="<%=""+ownerId%>" />
							<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Policy Management"%>" />
							<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Policy"%>" />
							<html:hidden property="answer(pagename)" value="<%="Policy Subjectivity"%>" />
							<html:hidden property="answer(policyStatus)" value="<%=""+policyStatus %>" />
							<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" />
							<html:hidden property="answer(Object::Quote::ParentQuoteVerId)" value="<%=""+parentVerQuoteId %>" />
							
						</td>
					</tr>
					<%if(policyStatus.equalsIgnoreCase("BOUND")){%>
					<tr>
						<td align="center">
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<html:submit property="answer(Submit)" value="Save" styleClass="sbttn" />
							</dmshtml:dms_static_with_connector>
						</td>
					</tr>
					<%} %>				
				</table>				
			</html:form>	
		</td>
	</tr>
	<tr>
		<td>
			<table width="95%" align="center" border="0">
				<tr style="display:none">
					<td width="40%" rowspan="1">
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SENT_EMAIL"}%>' connector='or' negated="true">
				
							<jsp:include page="../email/DisplayEmailList.jsp">
								<jsp:param name="answer(Object::Notification::Email::ObjectId)" value="<%=""+policySubjectivityId1%>" />
								<jsp:param name="answer(Object::Notification::Email::ObjectVerId)" value="<%=""+0%>" />
								<jsp:param name="answer(Object::Notification::Email::UserName)" value="<%=""+userId%>" />
								<jsp:param name="answer(Object::Notification::Email::SubQuoteVerId)" value="<%=""+0%>" />
								<jsp:param name="answer(Object::Notification::Email::QuoteStatus)" value="<%="" %>" />
								<jsp:param name="answer(Object::Notification::Email::EndorsementStatusFlag)" value="NO" />
								<jsp:param name="answer(Object::Notification::UserDetail::Email)" value="<%=""+""%>" />
				  				<jsp:param name="answer(Object::Notification::UserDetail::RoleName)" value="<%=""%>" />
				  				<jsp:param name="answer(Object::Notification::Email::QuoteNumber)" value="<%=0%>" />
								<jsp:param name="answer(Object::Notification::Email::QuoteSubNumber)" value="<%=0%>" />
				  				<jsp:param name="answer(Object::Notification::Email::PolicyNumber)" value="<%=""+0%>" />
				   				<jsp:param name="answer(Object::Notification::Email::ObjectType)" value="QUOTE" />
				  				<jsp:param name="answer(Object::Notification::Email::InsuredName)" value="<%=""+0 %>" />
						    </jsp:include>
						</dmshtml:dms_static_with_connector>
						</td>
						 
					</tr>
					<tr>
						<td>											
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTACHMENT"}%>' connector='or' negated="true">
				
							<jsp:include page="../notes/DairyNotes.jsp">
								<jsp:param name="answer(Object::Notes::ObjectId)" value="<%=""+policySubjectivityId1%>" />
								<jsp:param name="answer(Object::Notes::ObjectVerId)" value="<%=""+0%>" />
								<jsp:param name="answer(Object::Notes::ObjectType)" value="Subjectivity" />
								<jsp:param name="answer(Object::Notes::UserName)" value="<%=""+userId%>" />
								<jsp:param name="answer(Object::Notes::UserRole)" value="<%=""+customerId%>" />
								<jsp:param name="answer(APPROVAL_STATUS_NEEDED)" value="YES" />
								
							</jsp:include>
							</dmshtml:dms_static_with_connector>
						</td>
					</tr>
					<tr>
						<td>
						&nbsp;
						</td>
					</tr>
				    <tr>
					    <td>
					    	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTACHMENT"}%>' connector='or' negated="true">
				
							  <jsp:include page="../attachment/Attachment.jsp">
							  <jsp:param name="answer(Object::Attachment::ObjectId)" value="<%=""+policySubjectivityId1%>" />
								<jsp:param name="answer(Object::Attachment::ObjectVerId)" value="<%=""+0%>" />
								<jsp:param name="answer(Object::AttachmentObjectLink::ObjectType)" value="Subjectivity" />
								<jsp:param name="answer(APPROVAL_STATUS_NEEDED)" value="YES" />
							  </jsp:include>
						  </dmshtml:dms_static_with_connector>
					  </td>
				  </tr>
			</table>
			</logic:present>
		</td>
	</tr>
</table>