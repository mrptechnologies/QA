<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type="text/javascript" src="../Scripts/JScripts/PolicySummaryLifeAgent.js">
</script>



<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<bean:define id="policyNumber" name="PolicySummary" property="answer(policyNumber)" />

<bean:define id="custId" name="PolicySummary" property="answer(customerId)" />
<bean:define id="parentQuoteId" name="PolicySummary" property="answer(parentQuoteId)" />
<bean:define id="productVerId" name="PolicySummary" property="answer(productVerId)" />
<bean:define id="productId" name="PolicySummary" property="answer(productId)" />

<bean:define id="QuoteStatus" name="PolicySummary" property="answer(quoteStatus)" />
<bean:define id="SubQuoteVerId" name="PolicySummary" property="answer(subQuoteVerId)" />
<bean:define id="QuoteType" name="PolicySummary" property="answer(Object::Quote::QuoteType)" />
<bean:define id="SubQuoteId" name="PolicySummary" property="answer(subQuoteId)" />
<bean:define id="parentQuoteVerId" name="PolicySummary" property="answer(parentQuoteVerId)" />

<bean:define id="policyId" name="PolicySummary" property="answer(policyId)" />
<bean:define id="policyVerId" name="PolicySummary" property="answer(policyVerId)"  />

<bean:define id="prdid" name="PolicySummary" property="answer(Object::Quote::ProductId1)"  />




<%String conditionFlag = "N"; %>
<%if(request.getAttribute("conditionFlag") != null){
	conditionFlag = "Y";
}
	
%>

<logic:empty name="PolicySummary" property="answer(policyId)">
	<% policyId = "" + request.getParameter("answer(policyId)"); %>
</logic:empty>

<logic:empty name="PolicySummary" property="answer(policyId)">
	<% policyVerId = "" + request.getParameter("answer(policyVerId)"); %>
</logic:empty>



<bean:define id="agencyId" name="PolicySummary" property="answer(Object::Agency::AgencyId)"  />

<bean:define id="applicationType" name="PolicySummary" property="answer(applicationType)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />


<!-- <table width="100%"> -->
<% String DocumentType = "ISSUANCE"; %>
<% String policyStatus = ""; %>
<% String ratingTerritory = ""; %>
<% String ratingTerritoryName = ""; %>

<table WIDTH="1000px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr height="10">
		<td>
		</td>
	</tr>
	<tr>
		<td width="1100px" bgcolor="#C6DEEA">
			<jsp:include page="../common/CustomerAgencyLinkspage.jsp">
				<jsp:param name="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
			</jsp:include>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	<tr>
		<td>

			<jsp:include page="../common/DynamicPolicyHeader.jsp">
				<jsp:param name="policyId" value="<%=policyId.toString()%>" />
				<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
				<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
				<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
			</jsp:include>
		 </td>
  	</tr>
</table> 

<%String isActivePolicy =(String) request.getAttribute("isActivePolicy");  
  String bgcolor ="#C6DEEA";
  String headerName ="dolphinnav";
  String bodyDiv = "dolphincontainer1";
  String applicationHeaderName ="dolphinsubnav";
  String policyDetailHeader = "NewSectionHead";
   if (!(isActivePolicy.equals("Y"))){
	   bgcolor ="#CCCCCC";
	   headerName ="priorpolicydolphinnav";
	   bodyDiv = "dolphincontainerActive1";
	   applicationHeaderName ="oldPolicydolphinsubnav";
	   policyDetailHeader ="NewSectionHead1";
   }

%>
	 
	
<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
		<td colspan="20" class="links" width="400px">
		
			<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">Quote Summary</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<dmshtml:isActivePolicy policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
		      <%isActivePolicy =(String) request.getAttribute("isActivePolicy");  %>
	
	
	     <%if(isActivePolicy.equals("N")){ %>
	    	 <% String currentPolicyVerId = (String)request.getAttribute("currentVerId"); %>
	    
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+currentPolicyVerId%>&answer(policyId)=<%=""+policyId%>&answer("conditionFlag") = "N">Active Policy</a>
		<%} %>
		
		</td>	
	</tr>
	<tr>
		<td width="50%">&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="1200px" ALIGN="center" border="0" CELLSPACING="0" >
				<tr>
					<td class="<%=policyDetailHeader%>" colspan="8" align="center">
						POLICY DETAILS						
					</td>
				</tr>	
				<tr height="2" >
						<td></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" width="1200px" >
			<div id="<%=bodyDiv%>">
				<div id="<%=headerName%>">
					<ul>
						<li><a rel="PolicySummary" onclick="showPolicySummary('<%=headerName%>');" ><span>Summary</span></a></li>
						<li><a rel="Insured1" onclick="showInsured('<%=headerName%>');" ><span>Insured</span></a></li>
						<li><a rel="Application" onclick="showApplication('<%=headerName%>');" ><span>Application</span></a></li>
						<li><a rel="Payment" onclick="showPayment('<%=headerName%>');" ><span>Payment</span></a></li>
						<li><a rel="Document" onclick="showDocuments('<%=headerName%>');" > <span>Document</span></a></li>
						<li><a rel="Endorsements" onclick="showEndorsements('<%=headerName%>');"><span>Endorsements</span></a></li>				
					</ul>
				</div>		
				 <div id="PolicySummary" class="innercontent">  
					<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	
																		
					<!-- Policy summary tab contents STArt -->	
						<dmshtml:GetDynamicPolicySummary nameInSession="policysummarycontent" policyId="<%=Long.parseLong(""+policyId)%>" policyVerId="<%=Long.parseLong(""+policyVerId)%>" parentQuoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+productId)%>" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="POLICY_SUMMARY_TAB_ALGORITHM"  DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 							
						<logic:present name="policysummarycontent" scope="request">
						 	<bean:define id="htmlPage" name="policysummarycontent"	type="java.lang.StringBuffer" />
						 	<tr>
						 		<td width="100%">
						 			<table width="90%" border="0">	
						 				<tr height="50">
											<td class="sectionhead1" width="56%">
												COVERAGES
											</td>
											<td class="sectionhead1" width="25%" align="left">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LIMIT
											</td>
											<td width="4%">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
											<td class="sectionhead1" width="15%" align="right">
												PREMIUM
											</td>
										</tr>	
										<tr>
											<td width="56%"></td>
											<td width="25%"></td>
											<td width="4%"></td>
							    			<td width="15%"></td>
										</tr>			 											
											<%out.println(htmlPage.toString());%>
									</table>
								</td>
							</tr>
						</logic:present>
													
					<!-- Policy summary tab contents end -->	
					</table>
			 	</div> 
				
				<dmshtml:GetPolicyInsured nameInSession="policyinsured" parentPolicyId="<%=Long.parseLong(""+policyId)%>" parentPolicyVerId="<%=Long.parseLong(""+policyVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>			 	
			 	<div id="Insured1" class="innercontent">
			 		<table WIDTH="1100px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 			<tr>
			 				<td td width="100%">
			 					<table width="99%" border="0">	
			 						<tr height="30">
			 							<td class="FormLabels" width="3%">			 						
			 								S.No
				 						</td>
				 						<td class="FormLabels" width="12%">
				 							Insured Type
				 						</td>
				 						<td class="FormLabels" width="18%">
				 							Insured Name
				 						</td>
				 						<td class="FormLabels" width="15%">
				 							Address 1
				 						</td>
				 						<td class="FormLabels" width="15%">
				 							Address 2
				 						</td>
				 						<td class="FormLabels" width="13%">
				 							City
				 						</td>
				 						<td class="FormLabels" width="5%">
				 							State
				 						</td>
				 						<td class="FormLabels" width="5%">
				 							Zip
				 						</td>
				 						<td class="FormLabels" width="14%">
				 							Phone Number
				 						</td>			 						
				 					</tr>
				 					<logic:present name="policyinsured" scope="request">			 								 					
			 						<%int indx=1; %>
				 						<logic:iterate id="policyinsured" name="policyinsured">
						 					<tr height="20">
						 						<td class="TextMatter1">
						 							<%=indx++ %>
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Polinsuredtype" />
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::InsuredFullName" />
						 							<!-- bean:write name="policyinsured" property="Object::Policy::Insured::Insuredmname" / -->
						 							<!--  bean:write name="policyinsured" property="Object::Policy::Insured::Insuredfname" / -->
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Address1" />
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Address2" />
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::City" />
						 						</td>
						 						<td class="TextMatter1" align="center">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::State" />
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Zip" />
						 						</td>
						 						<td class="TextMatter1">
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Workphoneareacode" />-
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Workphoneexchgcode" />-
						 							<bean:write name="policyinsured" property="Object::Policy::Insured::Workphone" />
						 						</td>					 						
						 					</tr>
					 					</logic:iterate>
				 					</logic:present>
			 					</table>
				 			</td>
			 			</tr>
			 		</table>
			 	</div>
			 	
				<dmshtml:GetPolicyApplicationSummary nameInSession="PolicyApplication" policyId="<%=Long.parseLong(""+policyId) %>" policyVerId="<%=Long.parseLong(""+policyVerId) %>" applicationType="<%=""+applicationType %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
			 	
			 	<div id="Application" class="innercontent">
			 	
			 	<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	
																		
					<!-- Application tab contents STArt -->	
						<dmshtml:GetDynamicTab nameInSession="applicationcontent" policyId="<%=Long.parseLong(""+policyId)%>" policyVerId="<%=Long.parseLong(""+policyVerId)%>" parentQuoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+productId)%>" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="POLICY_APPLICATION_TAB"  DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 							
						<logic:present name="applicationcontent" scope="request">
						 	<bean:define id="htmlApplicationPage" name="applicationcontent"	type="java.lang.StringBuffer" />
						 	<tr>
						 		<td width="100%">
						 			<table width="90%" border="0">	
						 				<tr>
											<td width="56%"></td>
											<td width="25%"></td>
											<td width="4%"></td>
							    			<td width="15%"></td>
										</tr>			 											
											<%out.println(htmlApplicationPage.toString());%>
									</table>
								</td>
							</tr>
						 	
                         </logic:present>
                    </table>     					
					
	 			</div>
	 			<div id="Payment" class="innercontent">
			 	<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	
																		
					<!-- Application tab contents STArt -->	
						<dmshtml:GetDynamicTab nameInSession="paymentcontent" policyId="<%=Long.parseLong(""+policyId)%>" policyVerId="<%=Long.parseLong(""+policyVerId)%>" parentQuoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+productId)%>" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="POLICY_PAYMENT_TAB"  DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 							
						<logic:present name="paymentcontent" scope="request">
						 	<bean:define id="htmlPaymentPage" name="paymentcontent"	type="java.lang.StringBuffer" />
						 	<tr>
						 		<td width="100%">
						 			<table width="90%" border="0">	
						 				<tr>
											<td width="56%"></td>
											<td width="25%"></td>
											<td width="4%"></td>
							    			<td width="15%"></td>
										</tr>			 											
											<%out.println(htmlPaymentPage.toString());%>
									</table>
								</td>
							</tr>
						 	
                         </logic:present>
                    </table>     					
					
	 			</div>
				
				<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId %>" policyNumber="<%=""+policyNumber%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" documentType='<%=DocumentType%>' />
										
					<% String riskState="";%>
					<% String dmsRiskId = "";%>
					<% String polRiskId = "";%>					
					<logic:present name="policyHeaderInfo">
						<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plPolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
						
							
			 		
			 		<%policyStatus =plPolicyDetail.getPolicyStatus();%>	
			 		</logic:present>

				<dmshtml:GetPolicyDocumentSummary documentType='<%=DocumentType%>' nameInSession="PolicyDocument" ownerId='<%=""+ownerId %>'  policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>				
	
			 	<div id="Document" class="innercontent">   
			 		<table WIDTH="1100px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 		
			 			<tr height="30">
			 				<td class="FormLabels" colspan="3">
			 					Generated Documents<% %>
			 				</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels" width="15%">
			 					S.No
			 				</td>
			 				<td class="FormLabels" width="25%">
			 					Documents
			 				</td>
			 				<td class="FormLabels" width="20%">
			 					Generated By 
			 				</td>
			 				<td class="FormLabels" width="40%">
			 					Generated Date 
			 				</td>
			 			</tr>
			 			<%int indx=0; %>
			 			<%if(!policyStatus.equalsIgnoreCase("ISSUED") && !policyStatus.equalsIgnoreCase("CANCELED")){%>
			 			<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance"}%>' nameInSession="PolDocLoc1" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 			<logic:present name="PolDocLoc1">			 				
			 				<%
			 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc1");
								for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
									com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
								%>			 				
	 			
					 			<%indx++; %>
					 			<tr>
					 				<td class="TextMatter1" width="15%">
					 				<%=indx %>
					 				</td>
					 				<td class="TextMatter1" width="25%">					 				
					 				<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+polDocDetail.getDocumentUrl()%>')">
		   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
					 					<%=""+polDocDetail.getPolicyDocName() %>
					 					</a>
					 				</td>
					 				<td class="TextMatter1" width="20%" >
					 					<%=""+polDocDetail.getCreatedBy() %>
					 				</td>			 				
					 				<td class="TextMatter1" width="40%">
					 					<%=""+polDocDetail.getCreatedDate() %>
					 				</td>
					 			</tr>
					 			
					 			<%						
								}					 			
					 			%>
			 				
			 			</logic:present>
			 			
			 			
			 			
			 			<%}else{%>
			 				<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance"}%>' nameInSession="PolDocLoc" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 			<logic:present name="PolDocLoc">			 				
							 				<%
							 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc");
												for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
													com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
												%>			 				
					 			
									 			<%indx++; %>
									 			<tr>
									 				<td class="TextMatter1" width="15%">
									 				<%=indx %>
									 				</td>
									 				<td class="TextMatter1" width="25%">					 				
									 				<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+polDocDetail.getDocumentUrl()%>')">
						   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
									 					<%=""+polDocDetail.getPolicyDocName() %>
									 					</a>
									 				</td>
									 				<td class="TextMatter1" width="20%" >
									 					<%=""+polDocDetail.getCreatedBy() %>
									 				</td>			 				
									 				<td class="TextMatter1" width="40%" colspan="2">
									 					<%=""+polDocDetail.getCreatedDate() %>
									 				</td>
									 			</tr>
									 			
									 			<%						
												}					 			
									 			%>
							 				
							 			</logic:present>				
				 									 						
				 						
			 			<%} %>
			 			<tr height="30">
			 			<td>&nbsp;</td>
			 			</tr>
			 			</table>
			 			<table WIDTH="1100px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 			<%if(!policyStatus.equalsIgnoreCase("Issued")) {%>
			 			<dmshtml:dms_isPresent property="<%=new String[]{"BOUND","CANCELED"}%>" value="<%=QuoteStatus.toString()%>" negated="true" >
			 			<tr height="30">
			 				<td class="FormLabels" colspan="3">Selected Policy Forms</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels" width="15%">S.No
			 				</td>
			 				<td class="FormLabels" width="25%">Document Identifier
			 				</td>
			 				<td class="FormLabels" width="60%" >Document Title
			 				</td>
			 			</tr>
			 			<%int index=0; %>
			 			<%int count=0; %>
			 		
			 			<logic:present name="PolicyDocument">
			 			<% java.util.ArrayList PolicyDocumentDet= (java.util.ArrayList)request.getAttribute("PolicyDocument"); %>
			 			<%if(PolicyDocumentDet.size()>0){%>
			 			<logic:iterate id="PolDocument" name="PolicyDocument">		 
			 			<%com.dms.ejb.insurance.policy.PolicyDocumentDetail policyDocDetail = (com.dms.ejb.insurance.policy.PolicyDocumentDetail)PolicyDocumentDet.get(index); %>			 			
			 			<%index++; %>
			 			<%if(policyDocDetail.getGenerateDocument()== null) {%>		
			 				<tr height="20">
					 				<td class="TextMatter1" width="5%">		
					 				<%count++; %>			 				
					 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="15%">
					 				<bean:write name="PolDocument" property="documentNum"/>
					 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="80%">
					 				<bean:write name="PolDocument" property="policyDocName"/>
					 				</td>			 					
					 		</tr>	 						 			
			 			<%} else if(policyDocDetail.getGenerateDocument().equals("Y") || policyDocDetail.getGenerateDocument().equals("")) {%>
				 			<tr height="20">
					 				<td class="TextMatter1" width="5%">
						 				<%count++; %>
						 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="15%">
						 				<bean:write name="PolDocument" property="documentNum"/>
						 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="80%">
						 				<bean:write name="PolDocument" property="policyDocName"/>
					 				</td>			 					
					 		</tr>
					 	<%} %>
			 			</logic:iterate>
			 			<%}%>
			 			</logic:present>
			 		</dmshtml:dms_isPresent> 
			 			
		 			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>' connector='or' negated="true">
		 			
		 			<tr height="20">
		 			<td class="links" colspan="3">
		 				<a href="/PreviewIssuancePdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentListSource)=Policy&answer(policyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId%>&answer(DocumentType)=ISSUANCE&answer(QuoteId)=<%=""+parentQuoteId%>&answer(ownerId)=<%=""+ownerId%>&answer(ProductVerId)=<%=""+productVerId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(customerId)=<%=""+custId%>&answer(isPreview)=<%=true%>"  target="_new">Preview Issuance Document </a>			 					
		 			</td>
		 			</tr>
		 			</dmshtml:dms_static_with_connector>
		 			<%} %>
			 		</table>
			 		
			 		
			 	</div>						
			 	
			 	
			 	<div id="Endorsements" class="innercontent">
			 		<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	 
			 		<tr height="30">
			 				<td class="FormLabels" colspan="7" color="red">Policy History - Prior Policy Versions
			 					
			 				</td>
			 			</tr>
			 		
			 			<tr height="30">
								
								<td class="FormLabels" width="8%" align="left"> Policy Version
								</td>
								<td class="FormLabels" width="12%" align="left">Policy Number
								</td>										
								<td class="FormLabels" width="25%" align="left"> Endorsement Type
								</td>
								<td class="FormLabels" width="15%" align="left"> Effective Date
								</td>
								
								<td class="FormLabels" width="15%" align="left"> Bound By
								</td>
								<td class="FormLabels" width="21%" align="left"> Date Bound
								</td>
								<td class="FormLabels" width="12%" align="left"> Status
								</td>
							
						</tr>	
						
						
						
						<dmshtml:GetPolicyVersionList nameInSession="PolicyVersionList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							
							<logic:present name="PolicyVersionList">
							<% int polVerNo = 0; %>
							 	<logic:iterate id="PolicyVersionListDetail" name="PolicyVersionList" scope="request" type="com.dms.ejb.insurance.policy.PolicyDetail"> 
							 	    <% polVerNo = polVerNo + 1; %>
							 		<tr height="30">
							 		
							 			<td class="FormLabels" width="4%" align="center">
							 				<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y "> <%= ""+polVerNo %></a>
							 					
							 			</td>
							 			
							 			<td class="FormLabels" width="18%" align="left">
							 			 <%if (Integer.parseInt(PolicyVersionListDetail.getPolicyVerSubNumber())>0){ %>
											<%=""+PolicyVersionListDetail.getPolicyNumber()%><%="-"+PolicyVersionListDetail.getPolicyVerSubNumber()%>
										<%} else { %>
											<%=""+PolicyVersionListDetail.getPolicyNumber()%>
										<%} %> 
										</td>
									
							 			<td class="FormLabels" width="25%" align="left">
							 			
							 			  
							 			  <%String isoriginalPolicy = "Y"; %>
							 			  <dmshtml:GetPolicyVersionEndorsementType nameInSession = "EndorsementType" policyId="<%=""+PolicyVersionListDetail.getPolPolicyId()%>" policyVerId = "<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 			   	 <logic:present name="EndorsementType">
							 			   	  
							 			   	  <logic:iterate id="PolicyVerEndorsementType" name="EndorsementType" scope="request" type="com.dms.ejb.insurance.policy.PolicyDetail"> 
							 			   	  <dmshtml:getProductHeaderDetail nameInSession="EndorsementProductDetail" productId='<%=""+PolicyVerEndorsementType.getProductId()%>' productVerId='<%=""+PolicyVerEndorsementType.getProductVerId()%>' ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<logic:present name="EndorsementProductDetail">
													<%String EndoProductName = ((com.dms.ejb.product.PRDProductDetail)request.getAttribute("EndorsementProductDetail")).getMProductVerName();%>
													<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y ">  <%=""+EndoProductName%></a>
												</logic:present>
							 				
							 				</logic:iterate>
							 			</logic:present>
							 			<logic:empty name="EndorsementType">
							 			   <a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y "> Original Policy </a>
							 			</logic:empty>
							 			
										</td>
											
										<td class="FormLabels" width="12%" align="center">
							 				<bean:write property="policyVerEffDate" name="PolicyVersionListDetail" />
							 				
							 			</td>
							 			
							 			<td class="FormLabels" width="15%" align="left">
							 				<bean:write property="createdBy" name="PolicyVersionListDetail" />
							 			</td>                                                                                                                                                                                    
							 			<td class="FormLabels" width="21%" align="left">
							 				<bean:write property="createdDate" name="PolicyVersionListDetail" />
							 			</td> 
							 			<td class="FormLabels" width="12%" align="left">
							 				<bean:write property="policyStatus" name="PolicyVersionListDetail" />
							 			</td>
							 		</tr>	
							 	</logic:iterate>
							 </logic:present>		
					</table>	
					<table>
					<tr><td height="3%">
					&nbsp;
					</td></tr>
					</table>
					
			 					
			 		<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	
			 		     <tr height="30">
			 				<td class="FormLabels" colspan="7">
			 					Endorsement Quotes 
			 					
			 					
			 				</td>
			 			 </tr> 			
			 			<html:form action="/BrowseEndorsement.do" styleId="issueEndo" scope="request">
				 			
				 			<tr height="30">
								<td class="FormLabels" width="4%" align="center"> S.NO 
								</td>											
								<td class="FormLabels" width="10%" align="left"> Quote No
								</td>
								<td class="FormLabels" width="22%" align="left"> Endorsement Type
								</td>
								<td class="FormLabels" width="20%" align="left"> Endorsement PDF
								</td>
								<td class="FormLabels" width="15%" align="left"> Effective Date
								</td>
								<td class="FormLabels" width="15%" align="left"> Last Saved By 
								</td>
								<td class="FormLabels" width="21%" align="left"> Last Saved Date 
								</td>
								<td class="FormLabels" width="12%" align="left"> Status 
								</td>
							</tr>
						
							<dmshtml:GetEndorsementQuoteListById nameInSession="EndorsementQuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" conditionFlag ="<%=conditionFlag%>"  objectType="POLICY" quoteType="ENDORSEMENT" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />



							<logic:present name="EndorsementQuoteList">
							
							<%int slNo = 0; %>
										
								<logic:iterate id="EndorsementQuoteList" name="EndorsementQuoteList" scope="request" >
							
									<tr height="30">										
							
										<% slNo++; %>
										
										<td class="FormLabels" width="4%" align="center"> <%= ""+slNo%> </td>
										<logic:present name="policyHeaderInfo">
										<bean:define id="policyEffDate" name="policyHeaderInfo" property="policyEffDate" />	
									 	 <bean:define id="policyExpDate" name="policyHeaderInfo" property="policyExpDate" />	
							
										<td class="FormLabels" width="10%" align="left"><a href="/GetEndorsementQuoteDetail.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(parentPolicyStatus)=<%=""+policyStatus%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteId)=<bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/>&answer(parentQuoteId)=<bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(policyEffDate)=<%=""+policyEffDate%>&answer(policyExpDate)=<%=""+policyExpDate%> "><bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/></a></td>
										</logic:present>
										<bean:define id="endoProductId" name="EndorsementQuoteList" property="Object::Endorsement::Quote::ProductId" />
										<bean:define id="endoProductVerId" name="EndorsementQuoteList" property="Object::Endorsement::Quote::ProductVerId" />										

										<td class="FormLabels" width="20%" align="left">
											<dmshtml:getProductHeaderDetail nameInSession="EndorsementProductDetail" productId='<%=""+endoProductId%>' productVerId='<%=""+endoProductVerId%>' ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<logic:present name="EndorsementProductDetail">
													<%String EndoProductName = ((com.dms.ejb.product.PRDProductDetail)request.getAttribute("EndorsementProductDetail")).getMProductVerName();%>
													<%=""+EndoProductName%>
												</logic:present>
										</td>
										
										<bean:define id="QuoteID" name="EndorsementQuoteList" property="Object::Endorsement::Quote::QuoteId" />
										
										<td class="FormLabels" width="20%" align="left">
																				
										<dmshtml:GetEndorseDocumentLocation documentType="BINDER" nameInSession="EndorseDocLoc" ownerId='<%=""+ownerId %>' quoteId='<%=Long.parseLong(""+QuoteID)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
											
										<logic:present name="EndorseDocLoc">	
																						 				
						 				<%
											Object objDocList = request.getAttribute("EndorseDocLoc");				 				
	
							 				if((objDocList != null) && (objDocList instanceof java.util.ArrayList)){
							 					
							 					java.util.ArrayList arrEndorseDocDetail = (java.util.ArrayList)objDocList;
												for(int docIndex=0; docIndex<arrEndorseDocDetail.size(); docIndex++){		
													com.dms.ejb.data.QuestionHashMap quoteDocLocMap=(com.dms.ejb.data.QuestionHashMap)arrEndorseDocDetail.get(docIndex);							
											
											
										%>			 				
		 									<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+quoteDocLocMap.getString("Quote::Document::DocumentUrl")%>')">
			   									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
						 						<%=""+quoteDocLocMap.getString("Quote::Document::DocumentName") %> 
						 					</a>
						 											 					
						 					<%} 
							 				}else{
												System.out.println("No Document Found");
											} %>
					 					
					 					</logic:present>			
										</td>
										<td class="FormLabels" width="10%" align="left">
										
										<bean:define id="EndorsementQuoteStartDate" name="EndorsementQuoteList" property="Object::Endorsement::Quote::QuoteStartDate" />	
										<%
										    
										   
										    String StartDate = ""+EndorsementQuoteStartDate;
	                                        String arrayStartDate[] = StartDate.split("-");
	                                        
	                                        String YYYY = arrayStartDate[0];
											String MM = arrayStartDate[1];
											String DD = arrayStartDate[2];
											
											StartDate = MM+"/"+DD+"/"+YYYY;
										%>
										<%=StartDate%>
										
										</td>
										<td class="FormLabels" width="15%" align="center"><bean:write property="Object::Endorsement::Quote::UpdatedBy" name="EndorsementQuoteList" /></td>
										
										<td class="FormLabels" width="21%" align="center">
										
										<bean:define id="EndorsementUpdatedDate" name="EndorsementQuoteList" property="Object::Endorsement::Quote::UpdatedDate" />	
										<%
										    
										   
										    String Updateddate = ""+EndorsementUpdatedDate;
	                                        String arrayUpdatedDate[] = Updateddate.split("-");
	                                        
	                                        String year = arrayUpdatedDate[0];
											String month = arrayUpdatedDate[1];
											String date = arrayUpdatedDate[2];
											
											Updateddate = month+"/"+date+"/"+year;
										%>
										<%=Updateddate%>
										
										
										</td>
										
										<td class="FormLabels" width="12%" align="left"><bean:write property="Object::Endorsement::Quote::QuoteStatus" name="EndorsementQuoteList" /></td>
										
									</tr>
							
								</logic:iterate>					
							
							</logic:present>
						 <%if (isActivePolicy.equals("Y")){ %>
							<tr height="30">
								<td class="links">
				 					<html:submit property="answer(ADD)" value="ADD" styleId="EndorseAddSubmit"/>
				 				</td>
							</tr>	
						<%} %>						
							<tr>
								<td>
									<html:hidden property="answer(Object::Quote::OwnerId)" value='<%=""+ownerId%>' />
									
									<logic:present name="AddQuote" scope="request">
										<html:hidden property="answer(displayVal)" name="AddQuote" styleId="dolTabDisplay"/>
									</logic:present>
									<logic:notPresent name="AddQuote" scope="request">
										<html:hidden property="answer(temp)" styleId="dolTabDisplay" value='N'/>
									</logic:notPresent>
									<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
									<html:hidden property="answer(Object::Quote::ProductStatus)" value="RELEASED" />
									<html:hidden property="answer(Object::Product::RiskState)" value='<%=riskState%>'/>
									<html:hidden property="answer(Object::Product::ProductVerId)" value='<%=""+productVerId%>'/>
									<html:hidden property="answer(Object::Product::ProductId)" value='<%=""+productId%>' />
									<html:hidden property="answer(Object::Quote::QuoteType)" value='ENDORSEMENT'/>
									<html:hidden property="answer(Object::Product::UserRole)" value='<%=""+usernameId%>' />
									<html:hidden property="answer(Object::Quote::ParentPolicyId)" value='<%=""+policyId %>'/>
									<html:hidden property="answer(Object::Quote::ParentPolicyVerId)" value='<%=""+policyVerId%>'/>
									<html:hidden property="answer(policyNumber)" value='<%=""+policyNumber%>'/>
									<html:hidden property="answer(parentPolicyStatus)" value='<%=""+policyStatus%>'/>
									<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" value='<%=""+dmsRiskId%>'/>
									<html:hidden property="answer(Object::Risk::Teritory)" value='<%=ratingTerritory%>'/>
									<html:hidden property="answer(Object::Risk::TeritoryName)" value='<%=ratingTerritoryName%>'/>
									<html:hidden property="answer(Object::Agency::AgencyId)" value='<%=""+agencyId%>'/>
									<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
									<logic:present name="policyHeaderInfo">
									<bean:define id="policyEffDate" name="policyHeaderInfo" property="policyEffDate" />	
									  <bean:define id="policyExpDate" name="policyHeaderInfo" property="policyExpDate" />	
										<%
										    com.dms.ejb.common.DMSDetail dmsDetail = new com.dms.ejb.common.DMSDetail();
										    java.sql.Date policyStartDate = (java.sql.Date)dmsDetail.stringToDate(""+policyEffDate);
										   
										    String strStartDate = ""+policyStartDate;
	                                        String arrStartDate[] = strStartDate.split("-");
	                                        
	                                        String YYYY = arrStartDate[0];
											String MM = arrStartDate[1];
											String DD = arrStartDate[2];
											
											strStartDate = MM+"/"+DD+"/"+YYYY;
										%>
										<html:hidden property="answer(Object::Quote::QuoteStartDate)" value='<%=""+strStartDate%>'/>
										<html:hidden property="policyEffDate" value='<%=""+policyEffDate%>'/>
        								<html:hidden property="policyExpDate" value='<%=""+policyExpDate%>'/>
									</logic:present>
									
								</td>
							</tr>				
						</html:form>													
			 		</table>	 	
			 	</div>	
			 </div>
		</td>
	</tr>
</table>

<script type="text/javascript">

if(issueEndo.dolTabDisplay.value=='N'){
	dolphintabs.init('<%=headerName%>',0);
}else if(issueEndo.dolTabDisplay.value=='Y'){
	dolphintabs.init('<%=headerName%>',5);
}else{
	dolphintabs.init('<%=headerName%>',0);
}

function disableEndorseAdd(){
document.getElementById("EndorseAddSubmit").disabled = true;	
}

</script>