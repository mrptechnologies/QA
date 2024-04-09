<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>

<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<%String policyId=request.getParameter("answer(policyId)");
String policyVerId=request.getParameter("answer(policyVerId)");
String bgcolor="#C6DEEA";
String dmsRiskId="";
String riskId="";
String ratingTerritory="0";
String ratingTerritoryName="";
String conditionFlag=request.getParameter("answer(conditionFlag)");
String policyNumber=request.getParameter("answer(policyNumber)");
String policyStatus=request.getParameter("answer(policyStatus)");
long custId=Long.parseLong(request.getParameter("answer(custId)"));
long parentQuoteId=Long.parseLong(request.getParameter("answer(parentQuoteId)"));
long subQuoteVerId=Long.parseLong(request.getParameter("answer(subQuoteVerId)"));
long subQuoteId=Long.parseLong(request.getParameter("answer(subQuoteId)"));
long agencyId=0;
String isActivePolicy=request.getParameter("answer(isActivePolicy)");
String paymentPlan=request.getParameter("answer(paymentPlan)");
long productVerId=Long.parseLong(request.getParameter("answer(productVerId)"));
long productId=Long.parseLong(request.getParameter("answer(productId)"));
String ReferRenewal=request.getParameter("answer(ReferRenewal)");
String NonRenewal=request.getParameter("answer(NonRenewal)");
String nonRenwal=request.getParameter("answer(nonRenwal)");
String primaryParentQuoteId = request.getParameter("answer(primaryParentQuoteId)");

String quoteType = "ENDORSEMENT";
String riskState="";
String userName = ""+usernameId;
String customerId = ""+custId;
String isRenewalCreated = "N";
String policyEffectiveDate = "";
String policyExpirationDate = "";
String quoteStartDate = request.getParameter("answer(QuoteStartDate)");
String policyExpDate1 = request.getParameter("answer(policyExpDate)");
if (!(isActivePolicy.equals("Y"))){
	   bgcolor ="#CCCCCC";
}else{
	bgcolor="";
}
%>

<html:hidden property="NonRenewalQuestion1" value="<%=NonRenewal %>" styleId="NonRenewalQuestion"/>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRIVILEGE_CONTROL_RENEW_POLICY"}%>' connector='or' negated="true">

	<html:form action="/SaveRenwalOption.do" scope="request" onsubmit="return validateRenewalOptions();">	
	<html:hidden property="answer(activeTabName)" value="Renewal_Tab"/>	
	 	<table bgcolor ="<%=bgcolor%>" width="100%">
	 		<tr>
	 			<td class="FormLabels" colspan="8">Renewal Options</td>
	 		</tr>
	 		<tr><td>			 		
			 		<%
				 		String nonRenewal = ""+NonRenewal;
				 		String referRenewal = ""+ReferRenewal;
			 		%>			 		
			 		<table class="loctable" WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
						<tr>
							<td width="40%" style="padding-top: 3px;padding-bottom: 0%;">Renew this Policy</td>								
							<td width="60%" style="padding-top: 3px;padding-bottom: 0%;">
								<%if(nonRenewal.equals("N")){ %>
									<input type="radio" value="Y" name="answer(Object::Policy::NonRenewal)" id="NonRenewalYes">Yes
									<input type="radio" value="N" name="answer(Object::Policy::NonRenewal)" id="NonRenewalNo" checked="true">No
								<%} else if(nonRenewal.equals("Y")) {%>
									<input type="radio" value="Y" name="answer(Object::Policy::NonRenewal)" id="NonRenewalYes" checked="true">Yes
									<input type="radio" value="N" name="answer(Object::Policy::NonRenewal)" id="NonRenewalNo">No
								<%} else {%>
									<input type="radio" value="Y" name="answer(Object::Policy::NonRenewal)" id="NonRenewalYes">Yes
									<input type="radio" value="N" name="answer(Object::Policy::NonRenewal)" id="NonRenewalNo">No
								<%} %>
							</td> 
						</tr>
						<tr>
							<td width="40%" style="padding-top: 3px;padding-bottom: 0%;">Refer this Policy during Renewal</td>
							<td width="60%" style="padding-top: 3px;padding-bottom: 0%;">
							<%if(referRenewal.equals("N")){ %>
									<input type="radio" value="Y" name="answer(Object::Policy::ReferRenewal)" id="ReferRenewalYes">Yes
									<input type="radio" value="N" name="answer(Object::Policy::ReferRenewal)" id="ReferRenewalNo" checked="true">No
								<%} else if(referRenewal.equals("Y")){%>
									<input type="radio" value="Y" name="answer(Object::Policy::ReferRenewal)" id="ReferRenewalYes" checked="true">Yes
									<input type="radio" value="N" name="answer(Object::Policy::ReferRenewal)" id="ReferRenewalNo">No
								<%} else { %>
									<input type="radio" value="Y" name="answer(Object::Policy::ReferRenewal)" id="ReferRenewalYes">Yes
									<input type="radio" value="N" name="answer(Object::Policy::ReferRenewal)" id="ReferRenewalNo">No
								<%} %>
							</td> 
						</tr>
						<%if (isActivePolicy.equals("Y") && (!policyStatus.equalsIgnoreCase("CANCELED"))){ %>
							<tr>
								<td class="links">
				 					<span title="<bean:message key='ToolTip.PolicySummary.SaveRenewalOption'/>"><html:submit property="answer(SaveRenewal)" value="Save" styleId="SaveRenewal" styleClass="covtinybutton"/></span>				 					
				 				</td>
				 			<%if(nonRenwal.equalsIgnoreCase("Yes")){ %>
				 				
				 				<%if(NonRenewal.equalsIgnoreCase("N") && (!policyStatus.equalsIgnoreCase("CANCELED"))) { %>
				 				
				 				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ENABLE_NOTICE_OF_NONRENEWAL"}%>' connector='or' negated="true">
					 				<td class="links">
					 					<span title="<bean:message key='ToolTip.PolicySummary.NoticeOfNonRenewal'/>"><html:button property="answer(createNoticeOfNonRenewal)" value="Create Notice of Non-Renewal" onclick="confirmNoticeOfNonRenewal()" styleClass="covbiggerbutton"/></span>
					 				</td>	
					 			</dmshtml:dms_static_with_connector>			 						
				 				<%}
				 				} //document.selected=this.value;this.disabled=true;document.NoticeOfNonRenewal.submit();%>	 				
							</tr>			
						<%} %>
						
					</table>
					
					<html:hidden property="answer(policyId)" name="RenewalList" styleId="policyId" value="<%= ""+policyId%>" />
					<html:hidden property="answer(policyVerId)" name="RenewalList" styleId="policyVerId" value="<%= ""+policyVerId%>" />
					<html:hidden property="answer(Object::Policy::PolicyId)" styleId="policyId" value="<%= ""+policyId%>" />
					<html:hidden property="answer(Object::Policy::Policyverid)" styleId="policyVerId" value="<%= ""+policyVerId%>" />
					<html:hidden property="answer(ownerId)" styleId="ownerId" value='<%=""+ownerId%>' />
					<html:hidden property="answer(ProductVerId)" styleId="productVerId" value="<%= ""+productVerId%>" />
					<html:hidden property="answer(Object::Customer::CustomerId)" styleId="" value="<%= ""+custId%>" />
					<html:hidden property="answer(productId)" styleId="productId"  value="<%= ""+productId%>" />
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					
					
	 		</td></tr>
	 </table>
 	</html:form>		
 	
</dmshtml:dms_static_with_connector>


<form id="NoticeOfNonRenewal" action="/CreateNoticeOfNonRenewal.do" method="post">
			        <dmshtml:GetQuoteDetailsByPolicyId nameInSession="QuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 		 <% String renewalQuote =""+request.getAttribute("Object::Renewal::Quote::QuoteId");
			 		 	String renewalSubQuote  = ""+request.getAttribute("Object::Renewal::Quote::SubQuoteId");
			 		 	String isRenewal = ""+request.getAttribute("isRenewal");
			 		 %>
			 		  
			 		<!--  Values for Issue Policy -->
			 		<html:hidden property="answer(DocumentListSource)" value="Policy" />
			 		<html:hidden property="answer(policyId)" name="CancellationNonrenewal" styleId="policyId" value="<%= ""+policyId%>" />	
			 		<html:hidden property="answer(Object::Policy::Document::Policyid)" styleId="policyId" value="<%= ""+policyId%>" />
			 		
			 		
			 		<html:hidden property="answer(policyVerId)"  value="<%= ""+policyVerId%>" />
			 		<html:hidden property="answer(Object::Policy::Document::Policyverid)"  value="<%= ""+policyVerId%>" />
			 			
			 		<html:hidden property="answer(Object::Policy::Document::Documenttype)" value="NON RENEWAL NOTICE" />			 		
			 		<html:hidden property="answer(DocumentType)" value="NON RENEWAL NOTICE" />
			 		
			 		<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 
										
			 		<html:hidden property="answer(ownerId)" value='<%=""+ownerId%>' styleId="ownerIdfrmjsp" />
			 		<html:hidden property="answer(ProductVerId)" value="<%= ""+productVerId%>" />
			 		<html:hidden property="answer(Object::Customer::CustomerId)"  value="<%= ""+custId%>" />
			 		<html:hidden property="answer(customerId)" value="<%= ""+custId%>" />	
			 		<html:hidden property="answer(isPreview)" value="false" />
			 		<html:hidden property="answer(Object::Agency::AgencyId)"  value="<%= ""+agencyId%>" />	
			 		<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
			 		<html:hidden property="answer(Object::Policy::ResProperty::Statecode)" value="<%=""+riskState%>"/>
			 		<html:hidden property="answer(DEFAULT_POLICY_TAB)" value ="DOCUMENTS" />
			 		
			 		<html:hidden property="answer(Object::Quote::QuoteType)" value="NonRenewal"/>
			 		
			 		<html:hidden property="answer(polParentQuoteId)" value='<%=""+parentQuoteId %>'/>
			 		<html:hidden property="answer(polProductVerId)" value='<%=""+productVerId%>' />
			 		<html:hidden property="answer(polProductId)" value='<%=""+productId%>' />
			 		<html:hidden property="answer(polSubVerQuoteId)" value='<%=""+subQuoteVerId %>' styleId="subQuoteVerId"/>
					
					<html:hidden property="answer(polSubQuoteId)" value='<%=""+subQuoteId %>'/>
									
			 		<html:hidden property="answer(Object::UserDetail::userName)" value='<%=""+usernameId%>'/>
			 		<html:hidden property="answer(isUpdated)" value="Y" />
					<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Policy"%>"/>
					<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Notice of Non Renewal"%>"/>
				
					<html:hidden property="answer(pagename)" value="Policy summary" />
	
			 		<html:hidden property="answer(Quote::Page)" value="StatusChange" />
			 		

			 		
								 					 		
					<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden  property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=""+subQuoteVerId%>" />
					<html:hidden property="answer(subquoteVerId)" value="<%=""+subQuoteVerId%>" />
					
						
								<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" />	
								<html:hidden property="answer(subQuoteId)" value="<%=""+subQuoteId%>" /> 			
								<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 	
																													
					<html:hidden property="answer(userId)" value="<%=usernameId.toString()%>" />
					<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
					<html:hidden property="answer(productId)" value="<%=""+productId%>" />
					<html:hidden property="answer(productVerId)" value="<%=""+productVerId%>" />
					<html:hidden property="answer(UnderWriterWorkSheet)" value="No" />
					<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
					<html:hidden property="answer(OwnerId)" value='<%= ""+ownerId%>' />
					<html:hidden property="answer(ownerId)" value='<%= ""+ownerId%>' />
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
					<html:hidden property="answer(email)" value="<%=""+email %>" styleId="email"/>
					<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
				<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>
					<html:hidden property="answer(Object::Quote::isEndorsementQuote)" value="false" styleId="isEndorsementQuote" />
					
					</form>

<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="IS_RENEWAL_NEEDED" />
	<logic:present name="paramValue">
		<logic:equal value="Yes" name="paramValue">	
			<html:form action="/CreateEndorsementQuoteV2.do" styleId="createRenewalQuote" scope="request">
			<table bgcolor ="<%=bgcolor%>" width="100%">			
				<tr>
			   		<td class="FormLabels" colspan="8">Previous Renewals</td>
				</tr>
				<tr>
					<td>		
						<table class="loctable" WIDTH="100%" style="table-layout:fixed;" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
						<dmshtml:GetProcessedRenewalQuoteList nameInSession="ProcessedRenewalList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
							<logic:present name="ProcessedRenewalList">										
								<tr height="30">
									<td class="FormLabels" valign="center" align="center" style="width:5%;"> S.No.</td>
									<td class="FormLabels" valign="center" align="center" style="width:12%;"> Renewed <br>Policy #</td>
									<td class="FormLabels" valign="center" align="center" style="width:8%;"> Renewal Quote #</td>
									<td class="FormLabels" valign="center" align="center" style="width:17%;"> Renewal Binder</td>
									<%-- <td class="FormLabels" valign="center" align="center" width="10%"> Bound Date</td>
									<td class="FormLabels" valign="center" align="center" width="10%"> Bound By</td>--%>
									<td class="FormLabels" valign="center" align="center" style="width:18%;"> Renewal Policy PDF</td>
									<td class="FormLabels" valign="center" align="center" style="width:7%;"> Effective Date</td>
									<td class="FormLabels" valign="center" align="center" style="width:9%;"> Expiration Date</td>
									<td class="FormLabels" valign="center" align="center" style="width:7%;"> Issued Date</td>
									<td class="FormLabels" valign="center" align="center" style="width:12%;"> Issued By</td>
									<td class="FormLabels" valign="center" align="center" style="width:5%;"> Status</td>
								</tr>								 								
								<%int slNo = 1; %>						
								<logic:iterate id="Processed_RenewalList_Id" name="ProcessedRenewalList" scope="request">								
								<%isRenewalCreated = "Y"; %>			
								
									<tr height="30">						
										<td class="FormLabels2" style="width:6%;" align="center"> <%= ""+slNo++%> </td>							
											<bean:define id="policyEffDate" name="Processed_RenewalList_Id" property="Object::Renewal::Policy::PolicyEffDate" />	
										 	<bean:define id="policyExpDate" name="Processed_RenewalList_Id" property="Object::Renewal::Policy::PolicyExpDate" />							
											<bean:define id="renewalProductId" name="Processed_RenewalList_Id" property="Object::Renewal::Quote::ProductId" />
											<bean:define id="renewalProductVerId" name="Processed_RenewalList_Id" property="Object::Renewal::Quote::ProductVerId" />
											<bean:define id="quoteNumber" name="Processed_RenewalList_Id" property="Object::Renewal::Quote::QuoteNum" />
											<bean:define id="quoteSubNumber" name="Processed_RenewalList_Id" property="Object::Renewal::Quote::QuoteSubNum" />
											<bean:define id="polPolicyId" name="Processed_RenewalList_Id" property="Object::Renewal::Policy::PolicyId" />
											<bean:define id="polPolicyVerId" name="Processed_RenewalList_Id" property="Object::Renewal::Policy::PolicyVerId" />
											<bean:define id="polPolicyVerPolicyNumber" name="Processed_RenewalList_Id" property="Object::Renewal::Policy::PolicyNumber" />
											<%policyEffectiveDate = ""+policyEffDate;
											policyExpirationDate = ""+policyExpDate;%>
										<td class="FormLabels2" style="width:11%;" align="center"><a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+polPolicyVerId%>&answer(policyId)=<%=""+polPolicyId%>&answer(showHistory)=Y&answer(conditionFlag)=Y " title="<bean:message key='ToolTip.PolicySummary.RenewedPolicyLink'/>"><%=""+polPolicyVerPolicyNumber %></a></td>									
				
										<td class="FormLabels2" style="width:8%;" align="center"><a href="/GetEndorsementQuoteDetail.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(parentPolicyStatus)=<%=""+policyStatus%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteId)=<bean:write property="Object::Renewal::Quote::QuoteId" name="Processed_RenewalList_Id"/>&answer(parentQuoteId)=<bean:write property="Object::Renewal::Quote::QuoteId" name="Processed_RenewalList_Id"/>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(policyEffDate)=<%=""+policyEffDate%>&answer(policyExpDate)=<%=""+policyExpDate%> " title="<bean:message key='ToolTip.PolicySummary.RenewalQuoteLink'/>"><%=""+quoteNumber%>
										<%if(((""+quoteSubNumber).length()) > 0) { %>
											<%="-" +quoteSubNumber %>
										<%} %>
										</a></td>
											<bean:define id="QuoteID" name="Processed_RenewalList_Id" property="Object::Renewal::Quote::QuoteId" />
																		
										<td class="FormLabels2" style="width:17%;" align="left">																	
											<dmshtml:GetEndorseDocumentLocation documentType="BINDER" nameInSession="EndorseDocLoc" ownerId='<%=""+ownerId %>' quoteId='<%=Long.parseLong(""+QuoteID)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />								
											<logic:present name="EndorseDocLoc">																			 				
							 				<%
												Object objDocList = request.getAttribute("EndorseDocLoc");				 				
				
								 				if((objDocList != null) && (objDocList instanceof java.util.ArrayList)){
								 					
								 					java.util.ArrayList arrEndorseDocDetail = (java.util.ArrayList)objDocList;
													for(int docIndex=0; docIndex<arrEndorseDocDetail.size(); docIndex++){		
														com.dms.ejb.data.QuestionHashMap quoteDocLocMap=(com.dms.ejb.data.QuestionHashMap)arrEndorseDocDetail.get(docIndex);
											%>			 				
													<a title="<bean:message key='ToolTip.PolicySummary.RenewalBinderPdf'/>" href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocLocMap.getString("Quote::Document::DocumentUrl")%>')">
					   									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
								 						<%=quoteDocLocMap.getString("Quote::Document::DocumentName") %>
							 						</a>
							 											 					
							 					<%} 
								 				}else{
													System.out.println("No Document Found");
												} %>
						 					
						 					</logic:present>			
										</td>	<%-- 									
										<td class="FormLabels2" align="center" width="10%">
											<bean:define id="polPolicyVerCreatedDate" name="Processed_RenewalList_Id" property="Object::Renewal::Policy::CreatedDate" />	
											<%
											    String boundDate = ""+polPolicyVerCreatedDate;											
				                                String arrayBoundDate[] = boundDate.split("-");
				                                String YYYY = arrayBoundDate[0];
												String MM = arrayBoundDate[1];
												String DD = arrayBoundDate[2];
												
												boundDate = MM+"/"+DD+"/"+YYYY;
											%>
											<%=boundDate%> 
										</td>		
										<td class="FormLabels2" width="10%" align="center"><bean:write property="Object::Renewal::Policy::CreatedBy" name="Processed_RenewalList_Id" /></td>--%>
										<td class=FormLabels2 style="width:18%;" align="left">
											<bean:define id="renewalPolicyId" name="Processed_RenewalList_Id" property="Object::Renewal::Policy::Renewal::PolicyId" />
											<bean:define id="renewalPolicyVerId" name="Processed_RenewalList_Id" property="Object::Renewal::Policy::Renewal::PolicyVerId" />
											<dmshtml:GetDocumentLocation documentType='<%=new String[]{"ISSUANCE"}%>' nameInSession="EndorseDocLoc" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+renewalPolicyId) %>' policyVerId='<%=Long.parseLong(""+renewalPolicyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />								
											<logic:present name="EndorseDocLoc">																			 				
							 				<%
							 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("EndorseDocLoc");							 				
							 					if((arrPolDocDetail != null) && (arrPolDocDetail instanceof java.util.ArrayList)){
													for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
														com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
											%>			 				
													<a title="<bean:message key='ToolTip.PolicySummary.RenewalPolicyPdf'/>" href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getDocumentUrl()%>')">
							   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
									 					<%=""+polDocDetail.getPolicyDocName() %>
								 					</a>
							 											 					
							 					<%}
							 					}else{
													System.out.println("No Document Found");
												} %>
						 					
						 					</logic:present>
										</td>						
										<td class="FormLabels2" style="width:7%;" align="center">							
											<bean:define id="RenewalQuoteStartDate" name="Processed_RenewalList_Id" property="Object::Renewal::Quote::QuoteStartDate" />	
											<%
											    String StartDate = ""+RenewalQuoteStartDate;											
				                                String arrayStartDate[] = StartDate.split("-");
				                                String YYYY1 = arrayStartDate[0];
												String MM1 = arrayStartDate[1];
												String DD1 = arrayStartDate[2];
												
												StartDate = MM1+"/"+DD1+"/"+YYYY1;
											%>
											<%=StartDate%>
											
										</td>
										<td class="FormLabels2" style="width:9%;" align="center">							
											<bean:define id="RenewalQuoteEndDate" name="Processed_RenewalList_Id" property="Object::Renewal::Quote::QuoteEndDate" />	
											<%
											    String EndDate = ""+RenewalQuoteEndDate;											
				                                String arrayEndDate[] = EndDate.split("-");
				                                String YYYY2 = arrayEndDate[0];
												String MM2 = arrayEndDate[1];
												String DD2 = arrayEndDate[2];
												
												EndDate = MM2+"/"+DD2+"/"+YYYY2;
											%>
											<%=EndDate%>
											
										</td>	
										<td class=FormLabels2 style="width:7%;" align="center">							
											<bean:define id="renewalIssuedDate" name="Processed_RenewalList_Id" property="Object::Renewal::Policy::Renewal::IssuedDate" />	
											<% 
											    String issuedDate = ""+renewalIssuedDate;
												if(issuedDate.length() > 0) {
					                                String arrayIssuedDate[] = issuedDate.split("-");				                                      
					                                String year = arrayIssuedDate[0];
													String month = arrayIssuedDate[1];
													String date = arrayIssuedDate[2];
													
													issuedDate = month+"/"+date+"/"+year;
												}
											%>
											<%=issuedDate%>
										</td>
										<td class="FormLabels2" style="width:12%;" align="center"><div style="word-wrap:break-word;"><bean:write property="Object::Renewal::Policy::Renewal::IssuedBy" name="Processed_RenewalList_Id" /></div></td>							
										<td class="FormLabels2" style="width:5%;" align="center"><bean:write property="Object::Renewal::Quote::QuoteStatus" name="Processed_RenewalList_Id" /></td>											
									</tr>
									
								</logic:iterate>							
									<tr>
										<td>
											<html:hidden property="answer(Object::Quote::OwnerId)" value='<%=""+ownerId%>' />
											<html:hidden property="answer(createRenewalQuote)" value='Y' />
											<html:hidden property="answer(Object::Quote::PaymentPlan)" value='<%=""+paymentPlan%>' />
											
											<logic:present name="AddQuote" scope="request">
												<html:hidden property="answer(displayVal)" name="AddQuote" styleId="dolTabDisplay"/>
											</logic:present>
											<logic:notPresent name="AddQuote" scope="request">
												<html:hidden property="answer(temp)" styleId="dolTabDisplay" value='N'/>
											</logic:notPresent>
											
											<html:hidden property="answer(Object::Quote::PrevQuoteId)" value='<%=primaryParentQuoteId%>'/>
											<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
											<html:hidden property="answer(Object::Quote::ProductStatus)" value="RELEASED" />						
											<html:hidden property="answer(Object::Product::ProductVerId)" value='<%=""+productVerId%>'/>
											<html:hidden property="answer(Object::Product::ProductId)" value='<%=""+productId%>' />
											<html:hidden property="answer(Object::Quote::QuoteType)" value='<%=""+quoteType %>'/>
											<html:hidden property="answer(Object::Product::UserRole)" value='<%=""+usernameId%>' />
											<html:hidden property="answer(Object::Quote::ParentPolicyId)" value='<%=""+policyId %>'/>
											<html:hidden property="answer(Object::Quote::ParentPolicyVerId)" value='<%=""+policyVerId%>'/>
											<html:hidden property="answer(policyNumber)" value='<%=""+policyNumber%>'/>										
											<html:hidden property="answer(Object::Agency::AgencyId)" value='<%=""+agencyId%>'/>
											<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />						
											<html:hidden  property="answer(ProductVerId)" value="<%=""+productVerId%>"/>				
											<html:hidden  property="answer(productVerId)" value="<%=""+productVerId%>"/>				
											<html:hidden  property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>"/>
											<html:hidden  property="answer(Object::Quote::ParentPolicyId)" value='<%=policyId%>'/>
											<html:hidden  property="answer(Object::Quote::ParentPolicyVerId)" value='<%=policyVerId%>'/>
											<html:hidden  property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
											<html:hidden  property="answer(Object::Quote::QuoteType)" value="<%=""+quoteType%>"/>
											<html:hidden  property="answer(Object::Product::UserRole)" value="<%=""+userName%>"/>
										    <html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=""+userName%>" />
										    <html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=""+userName%>" />
											<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
								   			<html:hidden  property="answer(Object::Product::RiskState)" value="<%=""+riskState%>"/>			   			
								   			<html:hidden  property="answer(customerId)" value="<%=""+customerId%>"/>	   			
											<html:hidden property="answer(Object::Quote::LockStatus)" value="Unlocked"/>
											<html:hidden name="AddQuote" property="answer(Object::Quote::GroupOutOfSync)" value="Y"/>
											<html:hidden property="answer(Object::Quote::PaymentPlan)" value='<%=""+paymentPlan%>' />
											<html:hidden name="AddQuote" property="answer(Object::Quote::CensusOutOfSync)" value="N"/>
											<html:hidden property="answer(Object::Quote::ProductOutOfSync)" value="N"/>				
											<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
											<html:hidden property="answer(Object::Quote::PolicyNumber)" value="<%=""+policyNumber%>"/>
											<% if(policyEffectiveDate.length() > 0) {
					                                String arrayPolicyEffectiveDate[] = policyEffectiveDate.split("-");				                                      
					                                String effectiveYear = arrayPolicyEffectiveDate[0];
													String effectiveMonth = arrayPolicyEffectiveDate[1];
													String effectiveDate = arrayPolicyEffectiveDate[2];
													
													policyEffectiveDate = effectiveMonth+"/"+effectiveDate+"/"+effectiveYear;
											}%>
											<% if(policyExpirationDate.length() > 0) {
				                                String arrayPolicyExpirationDate[] = policyExpirationDate.split("-");				                                      
				                                String expirationYear = arrayPolicyExpirationDate[0];
												String expirationMonth = arrayPolicyExpirationDate[1];
												String expirationDate = arrayPolicyExpirationDate[2];
												
												policyExpirationDate = expirationMonth+"/"+expirationDate+"/"+expirationYear;
											}%>
											<html:hidden property="policyEffDate" value='<%=""+policyEffectiveDate%>'/>
											<html:hidden property="policyExpDate" value='<%=""+policyExpirationDate%>'/>
											<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=""+policyId%>"/>
							    			<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=""+policyVerId%>"/>
							    			<html:hidden property="answer(parentPolicyStatus)" value="<%=""+policyStatus%>" styleId="parentPolicyStatus"/>
											<!-- For C/L Endorsement -->
											<html:hidden property="answer(IsOptionDisabled)" value="<%="N"%>"/>
											<html:hidden property="changePlan" value="<%="yes"%>"/>
											<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" value="<%=""+riskId%>"/>
											<html:hidden property="answer(Object::Risk::Teritory)" value="<%=""+ratingTerritory%>"/>
											<html:hidden property="answer(Option::DefaultValue)" value="<%="No"%>"/>
											<html:hidden property="answer(userId)" value="<%=""+userName%>"/>
											<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId%>"/>
											<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>"/>
											<html:hidden property="answer(Object::Quote::QuoteNumber)" value="1"/>
											
											<!-- For Cancel Endorsement Work Sheet -->
											<html:hidden property="answer(State)" value="<%=""+riskState%>"/>
											<html:hidden property="answer(ownerId)" value="<%=""+ownerId%>"/>
											<html:hidden property="answer(ProductId)" value="<%=""+productId%>"/>
											
											<!-- <html:hidden property="heading" styleId="cancelOption" value=""/> -->										
											
											<html:hidden property ="answer(Object::Reference2::QuoteStartDate)"   styleId="refQuoteStartDate2" />
											
											<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
											<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
											<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
											<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" />											
										
										</td>
									</tr>				
							</logic:present>
						<%if(isRenewalCreated.equalsIgnoreCase("N")) { %>
							<tr>
								<td colspan="10">
									<span class="Error" style="font-size:11px;">Currently there are no Processed Renewals for this policy</span>
								</td>
							</tr>
						<%} %>
						</table>		
					</td>
				</tr>
				<tr>
					<td>		
						<html:hidden property="answer(Object::Quote::QuoteStartDate)" value='<%=""+policyExpDate1%>'/> 
						<html:hidden property ="answer(Object::Reference::QuoteStartDate)" value='<%=""+policyExpDate1%>' styleId="refQuoteStartDate" />
					</td>
				</tr>
				<tr>
			   		<td class="FormLabels" colspan="8">Renewal Quotes</td>
				</tr>
				<tr><td>
				<%if (isActivePolicy.equals("Y")){%>
											
		<dmshtml:Get_Expiring_Policy_Info_With_PolicyId nameInSession="expiringPolicyInfo" policyId='<%=""+policyId%>' policyVerId='<%=""+policyVerId %>' ownerId='<%=""+ownerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			<%String expiringPolicyEffDate = "";
			String expiringPolicyExpDate = "";
			double expiringPolicyPremium =0;%>
			<logic:present name="expiringPolicyInfo">
				<bean:define id="expiringPolicyMap" name="expiringPolicyInfo" type="com.dms.ejb.data.QuestionHashMap" />
				<%	String expiringPolicyId = "";
					String expiringPolicyVerId = "";
					
					java.text.SimpleDateFormat simpleDateformat=new  java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					
					java.util.Date expiringPolicyEffDateStr = simpleDateformat.parse(expiringPolicyMap.getString("expiringPolicyEffDate"));
					java.util.Date expiringPolicyExpDateStr = simpleDateformat.parse(expiringPolicyMap.getString("expiringPolicyExpDate"));	
					java.text.SimpleDateFormat DateFormat = new java.text.SimpleDateFormat("MM/dd/yyyy"); 
					expiringPolicyEffDate = DateFormat.format (expiringPolicyEffDateStr).toString ();
					expiringPolicyExpDate = DateFormat.format (expiringPolicyExpDateStr).toString ();
					expiringPolicyPremium = Double.parseDouble(expiringPolicyMap.getString("expiringPolicyPremium"));

					expiringPolicyId = expiringPolicyMap.getString("expiringPolicyId");
					expiringPolicyVerId = expiringPolicyMap.getString("expiringPolicyVerId");
					
					
					%>
					
				<html:hidden  property="answer(Object::Quote::ExpiringPolicyEffDate)" value="<%= ""+expiringPolicyEffDate%>" styleId="CoveragesEffDate"/>
				<html:hidden  property="answer(Object::Quote::ExpiringPolicyExpDate)" value="<%= ""+expiringPolicyExpDate%>" styleId="CoveragesExpDate"/>
				<html:hidden  property="answer(Object::Quote::ExpiringPolicyPremium)" value="<%= ""+expiringPolicyPremium%>" styleId="ExpPremium"/>
			</logic:present>
			<%} %>
			</td></tr>
				
				<tr>
					<td>
						<table class="loctable" WIDTH="100%" style="table-layout:fixed;" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
						<dmshtml:GetProcessingRenewalQuoteList nameInSession="ProcessingRenewalList" quoteStatus="<%=new String[]{"Canceled","Issued","Bound"} %>" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
						<%isRenewalCreated = "N"; %>	
							<logic:present name="ProcessingRenewalList">								
								<tr>
									<td class="FormLabels" valign="center" align="center" width="7%"> S. No.</td>
									<td class="FormLabels" valign="center" align="center" width="10%"> Renewal Quote #</td>
									<td class="FormLabels" valign="center" align="center" width="17%"> Renewal PDF</td>
									<td class="FormLabels" valign="center" align="center" width="10%"> Effective Date</td>
									<td class="FormLabels" valign="center" align="center" width="13%"> Created By</td>
									<td class="FormLabels" valign="center" align="center" width="10%"> Created Date</td>
									<td class="FormLabels" valign="center" align="center" width="13%"> Last Saved By</td>
									<td class="FormLabels" valign="center" align="center" width="10%"> Last Saved Date</td>
									<td class="FormLabels" valign="center" align="center" width="10%"> Status</td>
								</tr>

								<%int slNo = 1; %>							 								
								<logic:iterate id="Processing_RenewalList_Id" name="ProcessingRenewalList" scope="request">													
								<%isRenewalCreated = "Y"; %>
									<tr>						
										<td class="FormLabels2" width="7%" align="center"> <%= ""+slNo++%> </td>							
											<bean:define id="policyEffDate" name="Processing_RenewalList_Id" property="Object::Renewal::Quote::PolicyEffDate" />	
										 	<bean:define id="policyExpDate" name="Processing_RenewalList_Id" property="Object::Renewal::Quote::PolicyExpDate" />							
											<bean:define id="renewalProductId" name="Processing_RenewalList_Id" property="Object::Renewal::Quote::ProductId" />
											<bean:define id="renewalProductVerId" name="Processing_RenewalList_Id" property="Object::Renewal::Quote::ProductVerId" />
											<bean:define id="quoteNumber" name="Processing_RenewalList_Id" property="Object::Renewal::Quote::QuoteNum" />
											<bean:define id="quoteSubNumber" name="Processing_RenewalList_Id" property="Object::Renewal::Quote::QuoteSubNum" />									
				
										<td class="FormLabels2" width="10%" align="center"><a href="/SyncEndorsementQuoteWithEmployerGroupAndProductAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(parentPolicyStatus)=<%=""+policyStatus%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteId)=<bean:write property="Object::Renewal::Quote::QuoteId" name="Processing_RenewalList_Id"/>&answer(parentQuoteId)=<bean:write property="Object::Renewal::Quote::QuoteId" name="Processing_RenewalList_Id"/>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(policyEffDate)=<%=""+policyEffDate%>&answer(policyExpDate)=<%=""+policyExpDate%>&answer(userId)=<%=usernameId%>" title="<bean:message key='ToolTip.PolicySummary.RenewalQuoteLink'/>"><%=""+quoteNumber%>
										<%if(((""+quoteSubNumber).length()) > 0) { %>
											<%="-" +quoteSubNumber %>
										<%} %>
										</a></td>
											<bean:define id="QuoteID" name="Processing_RenewalList_Id" property="Object::Renewal::Quote::QuoteId" />
																		
										<td class="FormLabels2" width="17%" align="left">																	
											<dmshtml:GetEndorseDocumentLocation documentType="PROPOSAL" nameInSession="EndorseDocLoc" ownerId='<%=""+ownerId %>' quoteId='<%=Long.parseLong(""+QuoteID)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />								
											<logic:present name="EndorseDocLoc">																			 				
							 				<%
												Object objDocList = request.getAttribute("EndorseDocLoc");				 				
				
								 				if((objDocList != null) && (objDocList instanceof java.util.ArrayList)){
								 					
								 					java.util.ArrayList arrEndorseDocDetail = (java.util.ArrayList)objDocList;
													for(int docIndex=0; docIndex<arrEndorseDocDetail.size(); docIndex++){		
														com.dms.ejb.data.QuestionHashMap quoteDocLocMap=(com.dms.ejb.data.QuestionHashMap)arrEndorseDocDetail.get(docIndex);
											%>			 				
													<a title="<bean:message key='ToolTip.PolicySummary.RenewalPdf'/>" href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocLocMap.getString("Quote::Document::DocumentUrl")%>')">
					   									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
								 						<%=quoteDocLocMap.getString("Quote::Document::DocumentName") %> 
							 						</a>
							 											 					
							 					<%} 
								 				}else{
													System.out.println("No Document Found");
												} %>
						 					
						 					</logic:present>			
										</td>						
										<td class="FormLabels2" width="10%" align="center">							
											<bean:define id="RenewalQuoteStartDate" name="Processing_RenewalList_Id" property="Object::Renewal::Quote::QuoteStartDate" />	
											<%
											    String StartDate = ""+RenewalQuoteStartDate;											
				                                String arrayStartDate[] = StartDate.split("-");
				                                String YYYY = arrayStartDate[0];
												String MM = arrayStartDate[1];
												String DD = arrayStartDate[2];
												
												StartDate = MM+"/"+DD+"/"+YYYY;
											%>
											<%=StartDate%>
											
										</td>						
										<td class="FormLabels2" width="13%" align="center"><div style="word-wrap:break-word;"><bean:write property="Object::Renewal::Quote::CreatedBy" name="Processing_RenewalList_Id" /></div></td>							
										<td class=FormLabels2 width="10%" align="center">							
											<bean:define id="RenewalCreatedDate" name="Processing_RenewalList_Id" property="Object::Renewal::Quote::CreatedDate" />	
											<% 
											    String fullCreatedDate = ""+RenewalCreatedDate;
		                                     	String arrayCreatedDate[] = fullCreatedDate.split("-");				                                      
				                                String createdYear = arrayCreatedDate[0];
												String createdMonth = arrayCreatedDate[1];
												String createdDate = arrayCreatedDate[2];
												
												fullCreatedDate = createdMonth+"/"+createdDate+"/"+createdYear;
											%>
											<%=fullCreatedDate%>
										</td>			
										<td class="FormLabels2" width="13%" align="center"><div style="word-wrap:break-word;"><bean:write property="Object::Renewal::Quote::UpdatedBy" name="Processing_RenewalList_Id" /></div></td>							
										<td class=FormLabels2 width="10%" align="center">							
											<bean:define id="RenewalUpdatedDate" name="Processing_RenewalList_Id" property="Object::Renewal::Quote::UpdatedDate" />	
											<% 
											    String Updateddate = ""+RenewalUpdatedDate;
		                                      	String arrayUpdatedDate[] = Updateddate.split("-");				                                      
                               				    String year = arrayUpdatedDate[0];
												String month = arrayUpdatedDate[1];
												String date = arrayUpdatedDate[2];												
												Updateddate = month+"/"+date+"/"+year;
											%>
											<%=Updateddate%>
										</td>							
										<td class="FormLabels2" width="10%" align="center"><bean:write property="Object::Renewal::Quote::QuoteStatus" name="Processing_RenewalList_Id" /></td>											
									</tr>									
								</logic:iterate>												
							</logic:present>
						<%if(isRenewalCreated.equalsIgnoreCase("N")) { %>
							<tr>
								<td colspan="8">
									<span class="Error" style="font-size:11px;">Currently there are no Processing Renewal quotes for this policy</span>
								</td>
							</tr>
						<%} %>
						</table>		
					</td>
				</tr>
				<%if (isActivePolicy.equals("Y") && (!policyStatus.equalsIgnoreCase("CANCELED"))){ %>
					<tr>
						<td>				
							<span title="<bean:message key='ToolTip.PolicySummary.CreateRenewalQuote'/>"><html:button property="answer(ADD)" onclick="return validateCreateRenewalQuote()" value="Create Renewal Quote" styleClass="covbigbutton1" styleId="EndorseAddSubmit"/></span>
						<%-- 	<html:button styleId="EndorseAddSubmit12" value="test" property="test" onclick="validateCreateRenewalQuote()"/>--%>
						</td>
		 			</tr>		 				
				<%} %>
			</table>
			</html:form>
		</logic:equal>
</logic:present>
