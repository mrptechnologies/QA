<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT SRC="../Scripts/JScripts/Common.js" type="text/javascript"></SCRIPT>



<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/container/assets/skins/sam/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css"	href="../Scripts/YUI/2.7.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />  

<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script> 
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/tabview/tabview-min.js"></script>
<script type="text/JavaScript" SRC="../Scripts/YUI/2.7.0/build/menu/menu-min.js" ></script>
 <script type="text/javascript" src="../Scripts/YUI/2.7.0/build/yuiloader/yuiloader-min.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.8.1/build/assets/skins/sam/skin.css">
<!-- Utility Dependencies -->
<script src="../Scripts/YUI/2.8.1/build/yahoo-dom-event/yahoo-dom-event.js"></script> 
<script src="../Scripts/YUI/2.8.1/build/element/element-min.js"></script> 
<!-- Needed for Menus, Buttons and Overlays used in the Toolbar -->
<script src="../Scripts/YUI/2.8.1/build/container/container_core-min.js"></script>
<!-- Source file for Rich Text Editor-->
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/editor/simpleeditor-min.js"></script>


<%--
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />  
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script> 
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>
--%>
<script type="text/javascript" src="../Scripts/JScripts/CauseListTable.js"></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/Subjectivity.js" ></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/AddTank.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/LocationTank/QuoteLocationTank.js"></script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/QuoteSummaryUI3.js"> </SCRIPT>

<%String MandatoryDBACondition = "";
if(request.getAttribute("mandatoryDBAFlag")!=null){
	MandatoryDBACondition = request.getAttribute("mandatoryDBAFlag").toString();
}
%>
<script type="text/javascript">
function Ajaxsubmit(frm,submitBttn,actionName){
	if(myEditor != null && myEditor != undefined) {
		myEditor.saveHTML();
		if(document.getElementById("Content") != null && document.getElementById("Content") != undefined) {
			document.getElementById("Content").value = convertSpecialCharactersToAsciiValue(document.getElementById("Content").value);
		}
	}
	 var remove =  removeObject;

	 var validate = eval(validateDynamicForm1(frm));
	 if(validate){
	 if(submitBttn !=null && submitBttn != undefined && submitBttn!='Remove' ){
	 	submitBttn.disabled = true;
	 }
	 if(frm.RemoveButtonForPopUp != null && frm.RemoveButtonForPopUp!=undefined && remove == false){
	 	//frm.RemoveButtonForPopUp.value="";
	 	frm.RemoveButtonForPopUp.disabled = true;
	 	
	 	}
	 	 if(frm.RemoveButton != null && frm.RemoveButton!=undefined &&  remove == false ){
	 			 	frm.RemoveButton.value="";
	 	
	 	}

	 	var isSubmit = newCheckSubmit1();
	 	if(isSubmit){
	 	var url1="";
	 	if(url1 == undefined){
	 		 url1 = "/saveSubmissionRisk1.do?";
			 
	 	}else{}
	 		autologout();
	 		url1 = actionName;
		 	new Ajax.Request(url1, {method: 'post',parameters:$(frm).serialize(this),
		 	onLoading: function() {
			document.getElementById("loadercontent1").style.display ="block";document.getElementById("loadercontent2").style.display ="block";
			},onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);checkcount = false;doSpecificCompleteAction(transport);},onSuccess: function(transport){doSpecificSuccessAction(transport);}});
		}
		 if(document.getElementById("DocumentPopUpBody") != null && document.getElementById("DocumentPopUpBody") != undefined) {
			 document.getElementById("DocumentPopUpBody").innerHTML = " ";
		 }
	 	 if(document.getElementById("DocumentPopUp") != null && document.getElementById("DocumentPopUp") != undefined) {
	 	 	 document.getElementById("DocumentPopUp").style.display = "none";
			
	 	 }
	 }
	}
</script>

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

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
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
			
			String isRenewal="";
			if(request.getParameter("isRenewal")!=null)
			{
				isRenewal=request.getParameter("isRenewal");
			}			
					
		%>
		<dmshtml:GetQuoteDetailByQuoteId nameInSession="GetQuoteDetailByQuoteId" quoteId='<%=""+strParentQuoteId%>' ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name="GetQuoteDetailByQuoteId" scope="request"/>
			<bean:define id="productId" name="GetQuoteDetailByQuoteId" property="productId" />
			<bean:define id="productVerId" name="GetQuoteDetailByQuoteId" property="productVerId" />
			<bean:define id="productGroupId" name="GetQuoteDetailByQuoteId" property="productGroupId" />
			<bean:define id="productGroupVerId" name="GetQuoteDetailByQuoteId" property="productGroupVerId" />
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<!-- *********** Table for General ************ -->
						<table width="100%" align="Left" border="0" bgcolor="#C6DEEA">
						  <logic:notEqual name="Tab_UI_View" value="" scope="session" >	
							<tr>								
								<td>
									<div id="QuoteInsuerdAgencyAgentHeader">
										<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
										<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
										<jsp:param name="paretQuoteStatus" value="<%=""+strParetQuoteStatus%>" />
										</jsp:include>
									</div>							
								</td>
							</tr>
						  </logic:notEqual>
						</table>
					</td>
				</tr>
				<tr>
					<td align="left" colspan=2>
						<table width="950px" align="left" border="0" >
							<tr>
							<td class="NewSectionHead" align="center">SCHEDULE OF FORMS</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" align="left" border="0">
						<logic:notEqual name="Tab_UI_View" value="" scope="session" >							
					 	<tr>
							<td align="left">	
								<jsp:include page="../common/EndorsementQuoteHeader.jsp">
									<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
									<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
								</jsp:include>	
							</td>
						</tr>
					  </logic:notEqual>
					  <logic:notEqual name="Tab_UI_View" value="" scope="session" >	
						<tr>
							<td colspan="2">
								<table width="100%" align="center" border="0">		
									<jsp:include page="../common/QuotePlanInfoHeader.jsp" >
										<jsp:param name="subQuoteId" value="<%=""+subQuoteId%>" />	
										<jsp:param name="customerId" value="<%=""+customerId%>" />	
										<jsp:param name="productId" value="<%=""+productId%>" />	
										<jsp:param name="productVerId" value="<%=""+productVerId%>" />
										<jsp:param name="prdGroupId" value="<%=""+productGroupId%>" />	
										<jsp:param name="prdGroupVerId" value="<%=""+productGroupVerId%>" />
										<jsp:param name="productStatus" value="<%=""+productStatus%>" />
										<jsp:param name="stateCode" value="<%=""+stateCode%>"/>
									</jsp:include>
								</table>
							</td>
						</tr>
					   </logic:notEqual>
						</table>
					</td>
				</tr>
				
				
				<tr><td>&nbsp;</td></tr>
				
				<tr>	
					<td>
						<table width="100%" align="left" border="0">
							<tr>	
								<!-- ********** href to be entered *********** -->					
								<td class="links" width="20%">
									<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>&answer(policyNumber)=<%=""+strPolicyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+strParentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+strParentPolicyVerId%>">Quote Summary</a>
								</td>							
							</tr>
									
							<tr><td>&nbsp;</td></tr>
						</table>
					</td>
				</tr>
				
				<tr>	
					<td>
					
						<%if(MandatoryDBACondition.toString().equalsIgnoreCase("Failure")) { %>
						<table>
						<tr>
							<td class="Error" colspan="5" align="left">Mandatory: Enter DBA details in the Insured Master Record</td>
						</tr>
						</table>
						<% } %>
						<table width="100%" align="left" border="0">
							<tr>	
								<!-- ********** href to be entered *********** -->					
								<td class="FormLabels" width="20%">&nbsp;Associated Quote Documents</td>							
							</tr>
									
							
						</table>
					</td>
				</tr>
				<tr>
				<td>
		
		<html:form action="/RemoveOptDocuments.do" scope="request">
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">		
				<tr><td>
					<table width="100%" align="left" border="0">						
						<tr>
							<td class="sectionhead" align="left" height="25" width="6%">Sl.No.</td>		
							<td class="sectionhead" align="left" height="25" width="16%">Form #</td>								
							<td class="sectionhead" align="left" height="25" width="13%">Edition Date</td>	
							<td class="sectionhead" align="left" height="25" width="58%">Form Name</td>
							<td class="sectionhead" align="center" height="25" width="10%">Fill-in Form</td>
							<td class="sectionhead" align="center" height="25" width="7%">
							  	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
							Select
							</dmshtml:isFeatureAvailableForProductRoleStatus>
							</td>
						</tr>
						<%int count =0; %>
						<%long appId =0; 
						long appVerId = 0;
						%>						
						
						<logic:present name="quoteDocument" scope="request">
			 			<%String docName="DOC_NAME_"; int docIndex=0;  %>
						<logic:iterate id="quoteDocument" name="quoteDocument">		
			 			<% ++docIndex; %>						
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
						<% 		
							String styleClass="";
							if(count%2==0){
								styleClass = "SearchResult";
							}
							else{
								styleClass = "SearchResult";	
							}
						%>										
						<tr>
							<td height="25" class=<%= styleClass%>><%=count%>&nbsp;</td>
					  		<td height="25" class=<%= styleClass %>>
					  		<div id=quoteDocumentDiv></div>
					   			<bean:write name="quoteDocument" property="documentNum"/>&nbsp;
					  		</td>
					  		<td height="25" class=<%= styleClass %>>
					   			<bean:write name="quoteDocument" property="documentSubNum"/>&nbsp;
					  		</td>
					  		<td height="25" class=<%= styleClass %>>
					   			<a href="javascript:void(0)" onclick="window.open('../PreviewIssuanceDoc.go?answer(DOWNLOAD)=No&answer(DOCUMENT_TEMPLATE_PREIVEW_MODE)=Yes&answer(NON_PREVIEW)=No&answer(FILE_OPEN)=No&answer(Object::Product::Document::Definition::DocId)=<%=documentId.toString()%>&answer(Object::Product::Document::Definition::VerId)=<%=documentVerId.toString()%>&answer(Object::Product::Document::Definition::DocTemplUrl)=<%=templateURL%>&answer(Object::Product::Document::Definition::DocTemplType)=<%=templateType %>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>' )","New","height=500"><div id="<%=docName+docIndex %>"><bean:write name="quoteDocument" property="documentName"/></div>&nbsp;</a>
					   			</td>
					  		 <td height="25"  class=<%= styleClass %>>
		     				  	<%if(appId > 0 && appVerId > 0){ %>
									<% boolean richEditorNeeded = true;
												if(appId == 193){
													richEditorNeeded = false;
												}%>
		     				  	<bean:define id="docName1" name="quoteDocument" property="documentName"/>
		     				  		<%String documentName1 = "" + docName1;
		     				  			documentName1 = documentName1.replaceAll("\\\\", "\\\\\\\\");
		     				  			documentName1 = documentName1.replaceAll("'", "\\\\'");
		     				  			documentName1 = documentName1.replaceAll("\"", "&#34;");%>
									<%if(richEditorNeeded){%>
										<a href="javascript:void(0);" onclick="showFillInFormPopUp('<%=""+appId %>','<%=""+appVerId %>','<%=""+quoteDocumentId%>','<%=""+documentId %>','<%=""+documentVerId %>','<%=""+ documentName1%>','<bean:write name="quoteDocument" property="documentNum"/>-<bean:write name="quoteDocument" property="documentSubNum"/>','<%=docName+docIndex %>' )"> Application </a>
									<%}
									else {%>
										<a href="javascript:void(0);" onclick="showFillinWithoutRichEditor('<%=""+appId %>','<%=""+appVerId %>','<%=""+quoteDocumentId%>','<%=""+documentId %>','<%=""+documentVerId %>','<%=""+ documentName1%>','<bean:write name="quoteDocument" property="documentNum"/>-<bean:write name="quoteDocument" property="documentSubNum"/>','<%=docName+docIndex %>' )"> Application </a>
									<%}%>
		     				  	<%}else{ %>	
	                                 &nbsp;	     				  	
		     				  		
		     				  	<%} %>
		     				  	</td>						  		
					  		 <td class=<%= styleClass %>  align="center">			
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
		     				  	</td>  		 				
					 	</tr>		
						
						</logic:iterate>
						</logic:present>	
				
						
						<tr>
							<td colspan="9" align="right">
								<table border="0" cellpadding="3" align="center" width="100%">
									<tr>
									<td width="50%" align="center">
									&nbsp;&nbsp;
									</td>
										<td align="right" width="50%">
										  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
					 
										<html:submit value="Remove selected" styleClass="sbttn" style="width:110px;" onclick="this.disabled=true;this.form.submit();"/>
									</dmshtml:isFeatureAvailableForProductRoleStatus>&nbsp;	</td>
									</tr>
											
								</table>
							</td>
						</tr>
						
						<html:hidden property="answer(Quote::Document::QuoteId)" value='<%=strParentQuoteId.toString()%>' />
						<html:hidden property="answer(Quote::Document::SubQuoteId)" value='<%=subQuoteId.toString()%>' styleId="subQuoteId11"/>
						<html:hidden property="answer(subQuoteId)" value='<%=subQuoteId.toString()%>' />
						<html:hidden property="answer(Quote::Document::SubQuoteVerId)" value='<%=subQuoteVerId.toString()%>' styleId="subQuoteVerId" />
						<html:hidden property="answer(Quote::Document::QuoteDocumentType)" value="ISSUANCE" />
						<html:hidden property="answer(Quote::Document::CreatedBy)" value='<%=userName+"" %>' />
						<html:hidden property="answer(Object::Product::ProductVerId)" value='<%=productVerId+"" %>' styleId="ProductVerId"/>	
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						<html:hidden property="answer(TabPanelName)" value="<%=""+request.getParameter("TabPanelName") %>" />	
						<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=customerId.toString()%>' styleId="customerId"/>				
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
						
						<html:hidden property="answer(policyNumber)" value="<%=strPolicyNumber.toString()%>" />
						<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=strParentPolicyId.toString()%>" />
						<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=strParentPolicyVerId.toString()%>" />
						<html:hidden property="answer(State)" value="<%=stateCode.toString()%>"/>
						<html:hidden property="answer(stateCode)" value="<%=stateCode.toString()%>"/>
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
								<td class="FormLabels" width="20%">&nbsp;Non-Associated Quote Documents</td>							
							</tr>
									
						</table>
					</td>
				
					<td>		
			<html:form action="/AddQuoteDocuments" scope="request">
					<table width="100%" align="center" border="0">	
					<tr>
							<td colspan="9" align="center">
								<table border="0" cellpadding="3" align="center" width="100%">
									<tr>
									<td width="20%" align="center">
									&nbsp;&nbsp;
									</td>
										<td align="right" width="40%">
											 
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			<html:submit value="Add selected" styleClass="sbttn" onclick="this.disabled=true;this.form.submit();"/>
									</dmshtml:isFeatureAvailableForProductRoleStatus>	</td>
									</tr>
									<tr>
									<td>&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>			
						</tr>		
					</table>
					</td>
					</tr>
					</table>
					<table border="0" cellpadding="3" align="center" width="100%">	

							<td class="sectionhead" align="left" height="25" width="5%">Sl.No.</td>		
							<td class="sectionhead" align="left" height="25" width="13.5%">Form #</td>								
							<td class="sectionhead" align="left" height="25" width="9%">Edition Date</td>								
							<td class="sectionhead" align="left" height="25" width="39.5%">Form Name</td>
							<td class="sectionhead" align="center" height="25" width="6%">
								  	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+productId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS_AVAILABLE" 
				property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">				
			
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
							
						<%count1++; %>	
						<% 		
							String styleClass="";
							if(count1%2==0){
								styleClass = "SearchResult";
							}
							else{
								styleClass = "SearchResult";	
							}
						%>		
						<tr>
							<td height="25"  class=<%= styleClass %>><%=count1%>&nbsp;</td>
					  		<td class=<%= styleClass %>>
					   			<bean:write name="quoteDocumentNonListed" property="documentNum"/>&nbsp;
					  		</td>
					  		<td height="25"  class=<%= styleClass %>>
					   			<bean:write name="quoteDocumentNonListed" property="documentSubNum"/>&nbsp;
					  		</td>
					  		<td class=<%= styleClass %>>
					   			<a href="javascript:void(0)" onclick="window.open('../PreviewIssuanceDoc.go?answer(DOWNLOAD)=No&answer(DOCUMENT_TEMPLATE_PREIVEW_MODE)=Yes&answer(NON_PREVIEW)=No&answer(FILE_OPEN)=No&answer(Object::Product::Document::Definition::DocId)=<%=documentId.toString()%>&answer(Object::Product::Document::Definition::VerId)=<%=documentVerId.toString()%>&answer(Object::Product::Document::Definition::DocTemplUrl)=<%=templateURL%>&answer(Object::Product::Document::Definition::DocTemplType)=<%=templateType %>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>' )","New","height=500"><bean:write name="quoteDocumentNonListed" property="documentName"/>&nbsp;</a>
					  		</td>

					  		<td class=<%= styleClass %> align="center">			  			
							 	<bean:define id="docId" name="quoteDocumentNonListed" property="documentId" />
							 	<bean:define id="docVerId" name="quoteDocumentNonListed" property="currentVerId" />
							 	
		     					<bean:define id="mandatory" name="quoteDocumentNonListed" property="mandatory"/>
		     					<bean:define id="orderIndex" name="quoteDocumentNonListed" property="orderIndex"/>
								<bean:define id="applicationId1" name="quoteDocumentNonListed" property="applicationId"/>
								<bean:define id="applicationVerId1" name="quoteDocumentNonListed" property="applicationVerId"/>
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
								
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+"::"+docVerId+"::"+applicationId1+"::"+applicationVerId1 %>'disabled="disabled" />
								 <%}else{ %>							 
								<input type="checkbox" name="answer(Object::Product::Document::DocId)" value='<%=docId+"::"+docVerId+"::"+isMandatory+"::"+orderIndex+"::"+applicationId1+"::"+applicationVerId1+"::"+isRepeatedForm+"::"+quoteOrderSequenceIndex+"::"+binderOrderSequenceIndex+"::"+isEndorsementSpecific+"::"+includeScheduleOfFormsFlag+"::"+isEndorsementNumberNeeded+"::"+documentName+"::"+documentDescription+"::"+documentNumber+"::"+documentSubNumber %>'/>
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
			
					 
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:submit value="Add selected" styleClass="sbttn" onclick="this.disabled=true;this.form.submit();"/>
											</dmshtml:isFeatureAvailableForProductRoleStatus>
										</td>
										
										
									</tr>
									
								</table>
							</td>
						</tr>		
						
						<html:hidden property="answer(Quote::Document::QuoteId)" value='<%=strParentQuoteId.toString()%>' styleId="parentQuoteId"/>
						<html:hidden property="answer(Quote::Document::SubQuoteId)" value='<%=subQuoteId.toString()%>' />
						<html:hidden property="answer(subQuoteId)" value='<%=subQuoteId.toString()%>' />						
						<html:hidden property="answer(Quote::Document::SubQuoteVerId)" value='<%=subQuoteVerId.toString()%>' />
						<html:hidden property="answer(Quote::Document::QuoteDocumentType)" value="ISSUANCE" />
						<html:hidden property="answer(Quote::Document::CreatedBy)" value='<%=userName+"" %>' />
						<html:hidden property="answer(Object::Product::ProductVerId)" value='<%=productVerId+"" %>' />	
						<html:hidden property="answer(Object::Product::productId)" value='<%=productId+"" %>' styleId="prodId"/>			
						<html:hidden property="answer(Object::Product::productGroupId)" value='<%=productGroupId+"" %>' styleId="GroupId"/>											

						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						<html:hidden property="answer(TabPanelName)" value="<%=""+request.getParameter("TabPanelName") %>" />	
						<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=customerId.toString()%>' />				
						<html:hidden property="answer(productStatus)" value='<%=productStatus.toString()%>' styleId="productStatus"/>				
						<html:hidden property="answer(isUpdated)" value="N" />
						<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" styleId="ownerId"/> 
						<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
						<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
						<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
						<html:hidden property="answer(pagename)" value="<%=""+" Schedule of forms"%>" />
						<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=strParentQuoteVerId.toString()%>" styleId="parentQuoteVerId"/>
						 <html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=strParentQuoteStatus.toString()%>" />
						 <html:hidden property="answer(policyNumber)" value="<%=strPolicyNumber.toString()%>" />
						<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=strParentPolicyId.toString()%>" />
						<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=strParentPolicyVerId.toString()%>" />
						<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>" styleId="agencyId" />
						<html:hidden property="answer(Object::Quote::stateCode)" value="<%=stateCode.toString()%>" styleId="CustomerState" />
						<html:hidden property="answer(Object::Quote::QuoteType)" value="<%="Renewal"%>" styleId="QuoteType1" />
						<html:hidden property="answer(Object::Quote::QuoteNumber1)" value="<%="QuoteNumber1"%>" styleId="QuoteNumber1" />
						<html:hidden property="answer(Object::Quote::stateCode)" value="<%=stateCode.toString()%>" styleId="State1" />
						<html:hidden property="answer(State)" value="<%=stateCode.toString()%>"/>
						<html:hidden property="answer(stateCode)" value="<%=stateCode.toString()%>"/>
						 

									 
					</table>
					</html:form>
					</td>
					</tr>
				</table>
<script type="text/javascript">

if(document.getElementById("quoteHeaderLink") != null && document.getElementById("quoteHeaderLink") != undefined) {
	document.getElementById("quoteHeaderLink").onclick = function(){
	
		showHideHeader();
		var a = document.getElementById('Quote:TxtChange');
		var b = a.innerHTML;
		if(b == "Click here to hide detail") {
			document.getElementById('quoteheader_inner').style.height = "10em";
		}
		else {
			document.getElementById('quoteheader_inner').style.height = "1em";
		}
	}
}
if(document.getElementById("planHeaderLink") != null && document.getElementById("planHeaderLink") != undefined) {
	document.getElementById("planHeaderLink").onclick = function(){
	
		showHidePlanHeader();
		var a = document.getElementById('Plan:TxtChange');
		var b = a.innerHTML;
		if(b == "Click here to hide detail") {
			document.getElementById('planheader_inner').style.height = "19em";
		}
		else {
			document.getElementById('planheader_inner').style.height = "1em";
		}
	}
}

	function doSpecificValidation(frm){
		if(frm.name == "ManuscriptEndorsementSubApplication") {
	
		if((document.getElementById("Description") != null) && (document.getElementById("Description") != undefined)) {
			if(document.getElementById("Description").value == "") { 
				alert("Enter the Description"); 
				return false; 
			}
		}
		if((document.getElementById("Content") != null) && (document.getElementById("Content") != undefined)) {
			if(document.getElementById("Content").value == "") { 
				alert("Enter the Content"); 
				return false; 
			} 
		}
	}
		if(frm.NewDocNameId!=null && frm.NewDocNameId!=null){
		var tdId = frm.NewDocNameId.value;
		
		
			if(document.getElementById(tdId)!=null && document.getElementById(tdId)!=null){
				document.getElementById(tdId).innerHTML = frm.Title[0].value;
				
				return true;
			}
		}
		return true;
		
	}

		
</script>
