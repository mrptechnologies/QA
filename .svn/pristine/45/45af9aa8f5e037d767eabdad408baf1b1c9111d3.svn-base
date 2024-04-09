<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT SRC="../Scripts/JScripts/Common.js" type="text/javascript"></SCRIPT>

<table width="900px">
	
	<tr>
	<td width="40%" rowspan="1">
		<div id="DocumentPopUp" style="display:none;">
			<div class="hd" id="DocumentPopUpHeading">Fill in Form</div>
			<div class="formhead" align="right"><h2 class="right"></h2>
		
			</div>      
				<div class="Applicationpage2">
			<div class="bd" id="DocumentPopUpBody">
			</div>
			</div>
			<a class="container-close" href="javascript:void(0);" id="closeIcon2"></a>
		</div>
	
		</td>
	</tr>
</table>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />


						<html:hidden property="answer(isUpdated)" value="Y" />
						<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
						<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
						<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
						<html:hidden property="answer(pagename)" value="<%=""+" Schedule of forms"%>" />
						
							<%
						String strParentQuoteStatus="";
						if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
			{
				 strParentQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
			} %><html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=strParentQuoteStatus.toString()%>" />
						<%
						String strParentQuoteVerId="";
						if(request.getParameter("answer(Object::Quote::QuoteVerId)")!=null)
			{
				 strParentQuoteVerId=request.getParameter("answer(Object::Quote::QuoteVerId)");
			} %><html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=strParentQuoteVerId.toString()%>" />
<!-- bean:define id="mandatoryCheck" name="DocumentList" property="" scope="session"/ -->

		<%
			
			String agencyIdTemp="";
			if(request.getParameter("answer(Object::Agency::AgencyId)")!=null)
			{
				agencyIdTemp=request.getParameter("answer(Object::Agency::AgencyId)");
			}
		
			String customerId="";
			if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
			{
				customerId=request.getParameter("answer(Object::Customer::CustomerId)");
			}
			
			String strParetQuoteStatus="";
			if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
			{
				strParetQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
			}

			String strParentQuoteId="";
			if(request.getParameter("answer(parentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(parentQuoteId)");
				
			} else {
				strParentQuoteId=""+request.getParameter("answer(Quote::Document::QuoteId)");				
			}

			String subQuoteId="";
			if(request.getParameter("answer(subQuoteId)")!=null)
			{
				subQuoteId=request.getParameter("answer(subQuoteId)");
			} else {
				subQuoteId=""+request.getParameter("answer(Quote::Document::SubQuoteId)");				
			}
			
			String productStatus="";
			if(request.getParameter("answer(productStatus)")!=null)
			{
				productStatus=request.getParameter("answer(productStatus)");
			}
			
			String strPolicyNumber="";
			if(request.getParameter("answer(policyNumber)")!=null)
			{
				strPolicyNumber=request.getParameter("answer(policyNumber)");
			}
			
			String strParentPolicyId="";
			if(request.getParameter("answer(Object::Policy::ParentPolicyId)")!=null)
			{
				strParentPolicyId=""+request.getParameter("answer(Object::Policy::ParentPolicyId)");
			}
			
			String strParentPolicyVerId="";
			if(request.getParameter("answer(Object::Policy::ParentPolicyVerId)")!=null)
			{
				strParentPolicyVerId=request.getParameter("answer(Object::Policy::ParentPolicyVerId)");
			}
			String stateCode="";
			if(request.getParameter("answer(stateCode)")!=null)
			{
				stateCode=request.getParameter("answer(stateCode)");
			}
			String subQuoteVerId="";
			if(request.getParameter("answer(subQuoteVerId)")!=null)
			{
				subQuoteVerId=request.getParameter("answer(subQuoteVerId)");
			}else {
				subQuoteVerId=""+request.getParameter("answer(Quote::Document::SubQuoteVerId)");				
			}
					
		%>
		<logic:present name="staleDataSubmissionMsg"  scope="request">
					<tr>
						<td class="Error" >
							<bean:message key="error.staleDataSubmissionMsg"/>
						</td>
					</tr>
		</logic:present>
		<dmshtml:GetQuoteDetailByQuoteId nameInSession="GetQuoteDetailByQuoteId" quoteId='<%=""+strParentQuoteId%>' ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name="GetQuoteDetailByQuoteId" scope="request"/>
			<bean:define id="productId" name="GetQuoteDetailByQuoteId" property="productId" />
			<bean:define id="productVerId" name="GetQuoteDetailByQuoteId" property="productVerId" />
			<bean:define id="productGroupId" name="GetQuoteDetailByQuoteId" property="productGroupId" />
			<bean:define id="productGroupVerId" name="GetQuoteDetailByQuoteId" property="productGroupVerId" />
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>	
					<td class="FormLabels">
						    	<!-- ********** href to be entered *********** -->					
			            		&nbsp;Selected Policy Forms					
					</td>
				</tr>
		</table>
		<html:form action="/RemoveOptDocuments_in_ScheduleofFormsTab.do" scope="request">
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">	
				<tr>
						<td>
							<html:hidden styleId="ScheduleForm" property="answer(activateTabId)" value='ScheduleOfForms_Row' />
						</td>
				</tr>	
				<tr><td>
					<table width="100%" align="left" border="0">						
						<tr>							  	
						<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted","Declined","Lapsed"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">
							<td class="sectionhead" align="left" height="25" width="6%">Sl.No.</td>		
							<td class="sectionhead" align="left" height="25" width="16%">Form #</td>								
							<td class="sectionhead" align="left" height="25" width="13%">Edition Date</td>	
							<td class="sectionhead" align="left" height="25" width="58%">Form Name</td>
							<td class="sectionhead" align="center" height="25" width="10%">Fill-in Form</td>
							<td class="sectionhead" align="center" height="25" width="7%">
						</dmshtml:isFeatureAvailableForProductRoleStatus>
							<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
							Select
							</dmshtml:isFeatureAvailableForProductRoleStatus>
							
							<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE_CVSTARR" 
				property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted","Declined"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
							<td class="sectionhead" align="left" height="25" width="6%">Sl.No.</td>		
							<td class="sectionhead" align="left" height="25" width="16%">Form #</td>								
							<td class="sectionhead" align="left" height="25" width="13%">Edition Date</td>	
							<td class="sectionhead" align="left" height="25" width="58%">Form Name</td>
							
							<td class="sectionhead" align="center" height="25" width="7%">
							</dmshtml:isFeatureAvailableForProductRoleStatus>
							<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE_CVSTARR" 
				property='<%=new String[]{"In Progress"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
						
							Select
							</dmshtml:isFeatureAvailableForProductRoleStatus>
							</td>
							
						</tr>
						<%int count =0; %>
						<%long appId =0; 
						long appVerId = 0;
						%>
						<logic:present name="quoteDocument" scope="request">
						
						<logic:iterate id="quoteDocument" name="quoteDocument">		
						<bean:define id="templateURL" name="quoteDocument" property="documentTemplUrl"/>
						<bean:define id="documentId" name="quoteDocument" property="documentId"/>
						<bean:define id="documentVerId" name="quoteDocument" property="versionId"/>
						<bean:define id="templateType" name="quoteDocument" property="documentType"/>
						<bean:define id="applicationId" name="quoteDocument" property="applicationId"/>
						<bean:define id="applicationVerId" name="quoteDocument" property="applicationVerId"/>
						<bean:define id="quoteDocumentId" name="quoteDocument" property="dynamicDocumentId" />
						<bean:define id="isUserModified" name="quoteDocument" property="isUserModified" />
						<%String applcnId = ""+applicationId;
						String applcnVerId = ""+applicationVerId;
						 %>
						 
						<%if(!applcnId.equals("")){
							appId = Long.parseLong(""+applcnId);
														
						}  if(!applcnVerId.equals("")){
							appVerId = Long.parseLong(""+applcnVerId);								
						}%>
						<%count++; %>
													
						<tr>
							<td height="25" ><%=count%>&nbsp;</td>
					  		<td height="25">
					   			<bean:write name="quoteDocument" property="documentNum"/>&nbsp;
					  		</td>
					  		<td height="25" >
					   			<bean:write name="quoteDocument" property="documentSubNum"/>&nbsp;
					  		</td>
					  		<td height="25" >
					   			<a href="../PreviewIssuanceDoc.go?answer(DOWNLOAD)=No&answer(DOCUMENT_TEMPLATE_PREIVEW_MODE)=Yes&answer(NON_PREVIEW)=No&answer(FILE_OPEN)=No&answer(Object::Product::Document::Definition::DocId)=<%=documentId.toString()%>&answer(Object::Product::Document::Definition::VerId)=<%=documentVerId.toString()%>&answer(Object::Product::Document::Definition::DocTemplUrl)=<%=templateURL%>&answer(Object::Product::Document::Definition::DocTemplType)=<%=templateType %>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>"  target="_new"><bean:write name="quoteDocument" property="documentName"/>&nbsp;</a>
					  		</td>
					  		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE"  
							property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted","Declined"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">	
		     				  	<td height="25">
		     				  	<%if(appId > 0 && appVerId > 0){ %>
									<% boolean richEditorNeeded = true;
										if(appId == 193){
											richEditorNeeded = false;
										}%>
		     				  		<bean:define id="docName" name="quoteDocument" property="documentName"/>
		     				  		<%String documentName1 = "" + docName;
		     				  			documentName1 = documentName1.replaceAll("\\\\", "\\\\\\\\");
		     				  			documentName1 = documentName1.replaceAll("'", "\\\\'");
		     				  			documentName1 = documentName1.replaceAll("\"", "&#34;");%>
									<%if(richEditorNeeded){%>
										<a href="javascript:void(0);" onclick="showFillInFormPopUp('<%=""+appId %>','<%=""+appVerId %>','<%=""+quoteDocumentId%>','<%=""+documentId %>','<%=""+documentVerId %>','<%=""+documentName1 %>','<bean:write name="quoteDocument" property="documentNum"/>-<bean:write name="quoteDocument" property="documentSubNum"/>');" >Application </a>
									<%} else {%>
										<a href="javascript:void(0);" onclick="showFillinWithoutRichEditor('<%=""+appId %>','<%=""+appVerId %>','<%=""+quoteDocumentId%>','<%=""+documentId %>','<%=""+documentVerId %>','<%=""+documentName1 %>','<bean:write name="quoteDocument" property="documentNum"/>-<bean:write name="quoteDocument" property="documentSubNum"/>');" >Application </a>
									<%}
		     				  	}else{ %>	
	                                 &nbsp;	     				  	
		     				  		
		     				  	<%} %>
		     				  	</td>	
		     				</dmshtml:isFeatureAvailableForProductRoleStatus>
					  		 <td align="center">			
					  	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
					  		  			
								<bean:define id="docId" name="quoteDocument" property="documentId" />
							 	<bean:define id="mandatory" name="quoteDocument" property="mandatory"/>
							 	<bean:define id="isEndorsementSpecific" name="quoteDocument" property="isEndorsementSpecific"/>
							 	
							 	<% String isMandatory = ""+mandatory; 
								    if(isMandatory.equals("Y")||(isEndorsementSpecific.equals("Y"))){%> 							
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+""%>'disabled="disabled" />
								<%}else if(!isUserModified.equals("Y")){ %>
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+""%>' disabled="disabled" />							 							
								
								 <%}else{ %>
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+""%>' />							 							
								 <%} %>
		     				
		     				  	</dmshtml:isFeatureAvailableForProductRoleStatus>  
		     				  	
		     				  	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE_CVSTARR" 
				property='<%=new String[]{"In Progress"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
					  		  			
								<bean:define id="docId" name="quoteDocument" property="documentId" />
							 	<bean:define id="mandatory" name="quoteDocument" property="mandatory"/>
							 	
							 	<% String isMandatory = ""+mandatory; 
								    if(isMandatory.equals("Y")){%> 							
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+""%>'disabled="disabled" />
								 <%}else{ %>
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+""%>' />							 							
								 <%} %>
		     				
		     				  	</dmshtml:isFeatureAvailableForProductRoleStatus>  
		     				  	</td>  		 	
		     				  		
					 	</tr>		
						
						</logic:iterate>
						</logic:present>		
				
						<tr>
							<td colspan="9" align="center">
								<table border="0" cellpadding="3" align="center" width="100%">
									<tr>
									<td width="50%" align="center">
									&nbsp;&nbsp;
									</td>
										<td align="right" width="50%">
										  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
					 
										<html:submit value="Remove Optional Form" styleClass="covbigbutton" onclick="this.disabled=true;this.form.submit();"/>
									</dmshtml:isFeatureAvailableForProductRoleStatus>
									
									<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE_CVSTARR" 
				property='<%=new String[]{"In Progress"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
					 
										<html:submit value="Remove Optional Form" styleId="RemoveOptionalForm" styleClass="covbigbutton" onclick="this.disabled=true;this.form.submit();"/>
									</dmshtml:isFeatureAvailableForProductRoleStatus>&nbsp;	</td>
									</tr>
											
								</table>
							</td>
						</tr>
						
						<html:hidden property="answer(Quote::Document::QuoteId)" value='<%=strParentQuoteId.toString()%>' />
						<html:hidden property="answer(Quote::Document::SubQuoteId)" value='<%=subQuoteId.toString()%>' />
						<html:hidden property="answer(subQuoteId)" value='<%=subQuoteId.toString()%>' />
						<html:hidden property="answer(Quote::Document::SubQuoteVerId)" value='<%=subQuoteVerId.toString()%>' />
						<html:hidden property="answer(Quote::Document::QuoteDocumentType)" value="ISSUANCE" />
						<html:hidden property="answer(Quote::Document::CreatedBy)" value='<%=userName+"" %>' />
						<html:hidden property="answer(Object::Product::ProductVerId)" value='<%=productVerId+"" %>' />	
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						<html:hidden property="answer(TabPanelName)" value="<%=""+request.getParameter("TabPanelName") %>" />	
						<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=customerId.toString()%>' />				
						<html:hidden property="answer(productStatus)" value='<%=productStatus.toString()%>' />		
						<html:hidden property="answer(isUpdated)" value="Y" />
						<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
						<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
						<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
						<html:hidden property="answer(pagename)" value="<%=""+" Schedule of forms"%>" />
						<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=strParentQuoteVerId.toString()%>" />
						<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=strParentQuoteStatus.toString()%>" />
						 <html:hidden property="answer(activeTabName)" value="Schedule_of_Forms_Tab" />
						 <html:hidden property="answer(QuoteId)" value="<%=strParentQuoteId.toString()%>" />
						  <html:hidden property="answer(parentQuoteId)" value="<%=strParentQuoteId.toString()%>" />
						 
					</table>
				</td></tr>
				
				<tr><td>&nbsp;</td></tr>
				</table>
				</html:form>
				<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>
						<table width="80%" align="left" border="0">
							<tr>											
								<td class="FormLabels" width="20%">&nbsp;Optional Policy Forms</td>							
							</tr>
									
						

						</table>
					</td>
				</tr>
				</table>
				
					<html:form action="/AddQuoteDocuments_in_ScheduleofFormsTab" scope="request">	
					<table width="100%" align="center" border="0">									
					<tr>
						<td>
							<html:hidden styleId="ScheduleForm" property="answer(activateTabId)" value='ScheduleOfForms_Row' />
						</td>
					</tr>
					<tr>
							<td colspan="9" align="center">
								<table border="0" cellpadding="3" align="center" width="100%">
									<tr>
									
										<td align="right" width="40%">
											 
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			<html:submit value="Add Optional Form" styleClass="covbigbutton" onclick="this.disabled=true;this.form.submit();"/>
									</dmshtml:isFeatureAvailableForProductRoleStatus>
									
									<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE_CVSTARR" 
				property='<%=new String[]{"In Progress"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			<html:submit value="Add Optional Form" styleId="AddOptionalForm" styleClass="covbigbutton" onclick="this.disabled=true;this.form.submit();"/>
									</dmshtml:isFeatureAvailableForProductRoleStatus>	</td>
									</tr>
									<tr>
									<td>&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>		
					</table>
					<table border="0" cellpadding="3" align="center" width="100%">	
						<tr>
							<td class="sectionhead" align="left" height="25" width="6%">Sl.No.</td>		
							<td class="sectionhead" align="left" height="25" width="16%">Form #</td>								
							<td class="sectionhead" align="left" height="25" width="13%">Edition Date</td>								
							<td class="sectionhead" align="left" height="25" width="58%">Form Name</td>
							<td class="sectionhead" align="center" height="25" width="7%">
								  	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
							Select
							</dmshtml:isFeatureAvailableForProductRoleStatus>
							<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE_CVSTARR" 
				property='<%=new String[]{"In Progress"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
							Select
							</dmshtml:isFeatureAvailableForProductRoleStatus>
							</td>
						</tr>
						
						<%int count1 =0; %>
						<logic:present name="quoteDocumentNonListed" scope="request">
						
						<logic:iterate id="quoteDocumentNonListed" name="quoteDocumentNonListed">	
						<bean:define id="templateURL" name="quoteDocumentNonListed" property="documentTemplUrl"/>
						<bean:define id="documentId" name="quoteDocumentNonListed" property="documentId"/>
						<bean:define id="documentVerId" name="quoteDocumentNonListed" property="versionId"/>
						<bean:define id="templateType" name="quoteDocumentNonListed" property="documentType"/>
						<bean:define id="applicationId1" name="quoteDocumentNonListed" property="applicationId"/>
						<bean:define id="applicationVerId1" name="quoteDocumentNonListed" property="applicationVerId"/>
						<%
						long appId1 = 0;
						long appVerId1 = 0;
						String applicationId11 = ""+applicationId1;
						String applicationVerId11 = ""+applicationVerId1;
						
						if(!applicationId11.equals("")){
						 appId1 = Long.parseLong(""+applicationId11);
						}
						if(!applicationVerId11.equals("")){
							appVerId1 = Long.parseLong(""+applicationVerId11);	
						}
						%>	
						<%count1++; %>	
							
						<tr>
							<td height="25"><%=count1%>&nbsp;</td>
					  		<td height="25">
					   			<bean:write name="quoteDocumentNonListed" property="documentNum"/>&nbsp;
					   			
					  		</td>
					  		<td height="25">
					   			<bean:write name="quoteDocumentNonListed" property="documentSubNum"/>&nbsp;

					  		</td>
					  		<td height="25">
					   			<a href="../PreviewIssuanceDoc.go?answer(DOWNLOAD)=No&answer(DOCUMENT_TEMPLATE_PREIVEW_MODE)=Yes&answer(NON_PREVIEW)=No&answer(FILE_OPEN)=No&answer(Object::Product::Document::Definition::DocId)=<%=documentId.toString()%>&answer(Object::Product::Document::Definition::VerId)=<%=documentVerId.toString()%>&answer(Object::Product::Document::Definition::DocTemplUrl)=<%=templateURL%>&answer(Object::Product::Document::Definition::DocTemplType)=<%=templateType %>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>" target="_new"><bean:write name="quoteDocumentNonListed" property="documentName"/>&nbsp;</a>
					  		</td>

					  		<td align="center" height="25">			  			
							 	<bean:define id="docId" name="quoteDocumentNonListed" property="documentId" />
							 	<bean:define id="docVerId" name="quoteDocumentNonListed" property="currentVerId" />
							 	
		     					<bean:define id="mandatory" name="quoteDocumentNonListed" property="mandatory"/>
		     					<bean:define id="orderIndex" name="quoteDocumentNonListed" property="orderIndex"/>
		     					<bean:define id="isRepeatedForm" name="quoteDocumentNonListed" property="isRepeatedForm"/>
		     				    <bean:define id="quoteOrderSequenceIndex" name="quoteDocumentNonListed" property="quoteOrderSequenceIndex"/>
		     					<bean:define id="binderOrderSequenceIndex" name="quoteDocumentNonListed" property="binderOrderSequenceIndex"/>
		     					<bean:define id="includeScheduleOfFormsFlag" name="quoteDocumentNonListed" property="includeScheduleOfFormsFlag"/>
		     					<bean:define id="isEndorsementNumberNeeded" name="quoteDocumentNonListed" property="isEndorsementNumberNeeded"/>
		     					<bean:define id="isEndorsementSpecific" name="quoteDocumentNonListed" property="isEndorsementSpecific"/>

		     					<bean:define id="documentName" name="quoteDocumentNonListed" property="documentName" />
		     					<bean:define id="documentDescription" name="quoteDocumentNonListed" property="documentDescription" />
		     					<bean:define id="documentNumber" name="quoteDocumentNonListed" property="documentNum" />
					   			<bean:define id="documentSubNumber" name="quoteDocumentNonListed" property="documentSubNum" />
					   			
		     					 	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
					 
							 	<% String isMandatory = ""+mandatory; 
								    if(isMandatory.equals("Y")||(isEndorsementSpecific.equals("Y"))){%>
								
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+"::"+docVerId+"::"+appId1+"::"+appVerId1 %>'disabled="disabled" />
								 <%}else{ %>							 
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+"::"+docVerId+"::"+isMandatory+"::"+orderIndex+"::"+appId1+"::"+appVerId1+"::"+isRepeatedForm+"::"+quoteOrderSequenceIndex+"::"+binderOrderSequenceIndex+"::"+isEndorsementSpecific+"::"+includeScheduleOfFormsFlag+"::"+isEndorsementNumberNeeded+"::"+documentName+"::"+documentDescription+"::"+documentNumber+"::"+documentSubNumber %>'/>
								 <%} %>
								 </dmshtml:isFeatureAvailableForProductRoleStatus>
								 <dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE_CVSTARR" 
				property='<%=new String[]{"In Progress"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
					 
							 	<% String isMandatory = ""+mandatory; 
								    if(isMandatory.equals("Y")){%>
								
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+"::"+docVerId+"::"+appId1+"::"+appVerId1 %>'disabled="disabled" />
								 <%}else{ %>							 
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+"::"+docVerId+"::"+isMandatory+"::"+orderIndex+"::"+appId1+"::"+appVerId1+"::"+isRepeatedForm+"::"+quoteOrderSequenceIndex+"::"+binderOrderSequenceIndex+"::"+includeScheduleOfFormsFlag+"::"+isEndorsementNumberNeeded+"::"+documentName+"::"+documentDescription+"::"+documentNumber+"::"+documentSubNumber %>'/>
								 <%} %>
								 </dmshtml:isFeatureAvailableForProductRoleStatus>
		     				</td>
					 	</tr>								
						</logic:iterate>
						</logic:present>
						</table>
						<table border="0" cellpadding="3" align="center" width="100%">						
						<tr>
									<td>&nbsp;</td>
									</tr>
					 	<tr>
							<td colspan="9" align="center">
								<table border="0" cellpadding="3" align="center" width="100%">
									<tr>
									<td width="50%" align="center">
									&nbsp;&nbsp;
									</td>
							
										<td align="right" width="50%">
												 	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
					 
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:submit value="Add Optional Form" styleClass="covbigbutton" onclick="this.disabled=true;this.form.submit();"/>
											</dmshtml:isFeatureAvailableForProductRoleStatus>
											<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE_CVSTARR" 
				property='<%=new String[]{"In Progress"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
					 
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:submit value="Add Optional Form" styleId="AddOptionalForm1" styleClass="covbigbutton" onclick="this.disabled=true;this.form.submit();"/>
											</dmshtml:isFeatureAvailableForProductRoleStatus>
										</td>
										
										
									</tr>
									
								</table>
							</td>
						</tr>		
						<html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" value="yes" />
						<html:hidden property="answer(Object::Agency::AgencyId)" value='<%=agencyIdTemp%>' />
						<html:hidden property="answer(Quote::Document::QuoteId)" value='<%=strParentQuoteId.toString()%>' />
						<html:hidden property="answer(Quote::Document::SubQuoteId)" value='<%=subQuoteId.toString()%>' />
						<html:hidden property="answer(subQuoteId)" value='<%=subQuoteId.toString()%>' />						
						<html:hidden property="answer(Quote::Document::SubQuoteVerId)" value='<%=subQuoteVerId.toString()%>' />
						<html:hidden property="answer(Quote::Document::QuoteDocumentType)" value="ISSUANCE" />
						<html:hidden property="answer(Quote::Document::CreatedBy)" value='<%=userName+"" %>' />
						<html:hidden property="answer(Object::Product::ProductVerId)" value='<%=productVerId+"" %>' />	
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						<html:hidden property="answer(TabPanelName)" value="<%=""+request.getParameter("TabPanelName") %>" />	
						<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=customerId.toString()%>' />				
						<html:hidden property="answer(productStatus)" value='<%=productStatus.toString()%>' />				
						<html:hidden property="answer(isUpdated)" value="N" />
						<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
						<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
						<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
						<html:hidden property="answer(pagename)" value="<%=""+" Schedule of forms"%>" />
						<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=strParentQuoteVerId.toString()%>" />
						 <html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=strParentQuoteStatus.toString()%>" />
						  <html:hidden property="answer(activeTabName)" value="Schedule_of_Forms_Tab" />
						  <html:hidden property="answer(QuoteId)" value="<%=strParentQuoteId.toString()%>" />
						  <html:hidden property="answer(parentQuoteId)" value="<%=strParentQuoteId.toString()%>" />

									 
					</table>
					</html:form>
					

				
