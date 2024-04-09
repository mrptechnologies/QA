<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>



<style>
TD.FormLabels2{FONT-WEIGHT: bold;FONT-SIZE: 11px;COLOR: #000000;FONT-FAMILY: Verdana,Arial, Helvetica;}
</style>


<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />


<%String policyId=request.getParameter("answer(policyId)");
String policyVerId=request.getParameter("answer(policyVerId)");
String bgcolor="#C6DEEA";
String EndoProductName="";
String dmsRiskId="";
String ratingTerritory="0";
String ratingTerritoryName="";
%> 

<%String conditionFlag=request.getParameter("answer(conditionFlag)");
String policyNumber=request.getParameter("answer(policyNumber)");
String policyStatus=request.getParameter("answer(policyStatus)");
String policyHeaderVerId = "";
String parentPolicyVerId = "";
String renewalPolicyId = "";
String renewalPolicyVerId = "";
String parentPolicyId = "";
if(request.getParameter("answer(renewalPolicyId)") != null) {
	renewalPolicyId = request.getParameter("answer(renewalPolicyId)");
}
if(request.getParameter("answer(renewalPolicyVerId)") != null) {
	renewalPolicyVerId = request.getParameter("answer(renewalPolicyVerId)");
}
if(request.getParameter("answer(policyHeaderVerId)") != null) {
	policyHeaderVerId = request.getParameter("answer(policyHeaderVerId)");
} else {
	policyHeaderVerId = policyVerId;
}
if(request.getParameter("answer(parentPolicyId)") != null) {
	String strParentPolicyId = ""+request.getParameter("answer(parentPolicyId)");
	if(!strParentPolicyId.equals("")){
		if(Long.parseLong(strParentPolicyId)>0){
			policyId = request.getParameter("parentPolicyId)");
		}
	}
}
if(request.getParameter("answer(parentPolicyVerId)") != null) {
	parentPolicyVerId = request.getParameter("answer(parentPolicyVerId)");
} else {
	parentPolicyVerId = policyVerId;
}
long custId=Long.parseLong(request.getParameter("answer(custId)"));
long agencyId=0;
if(request.getParameter("answer(agencyId)") != null){
	agencyId = Long.parseLong(request.getParameter("answer(agencyId)"));	
}

String isActivePolicy=request.getParameter("answer(isActivePolicy)");
String paymentPlan=request.getParameter("answer(paymentPlan)");
long productVerId=Long.parseLong(request.getParameter("answer(productVerId)"));
long productId=Long.parseLong(request.getParameter("answer(productId)"));
String riskState="";
if (!(isActivePolicy.equals("Y"))){
	   bgcolor ="#CCCCCC";
}else{
	bgcolor="";
}

%>
<table bgcolor ="<%=bgcolor%>"; width="100%">
 <tr>
    <td>&nbsp;</td>
</tr>
 <tr>
    <td>Policy History - Prior Versions</td>
</tr>
 <tr>
    <td>
<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId %>" policyNumber="<%=""+policyNumber%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" documentType='<%="Binder"%>' />										    
<table class="loctable" WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	 

			 		
			 			<tr height="30">
								<th valign="center" align="center">
								 Number
								
								</th>
							<%-- 	<td class="FormLabels" width="12%" align="left">Policy Number
								</td>		--%>								
								<th valign="center" align="center" width="20%"> Endorsement Type
								</th>								
								<th valign="center" align="center"> Effective
								</th>
								
								<th valign="center" align="center"> Bound By
								</th>
								<th valign="center" align="center">Bound
								</th>
								<th valign="center" align="center"> Status
								</th>
							
						</tr>	
						
						<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="SHOW_ENDORSEMENT_LEVEL_HISTORY" />
						
						<dmshtml:GetPolicyVersionList nameInSession="PolicyVersionList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyHeaderVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							
							<logic:present name="PolicyVersionList">
							<% int polVerNo = 0; %>
							 	<logic:iterate id="PolicyVersionListDetail" name="PolicyVersionList" scope="request" type="com.dms.ejb.insurance.policy.PolicyDetail"> 
							 	    <% polVerNo = polVerNo + 1; %>
							 		<tr height="30">
							 		
							 			<td class="FormLabels2" width="5%" align="center">
							 			<logic:present name="paramValue">
											<logic:equal value="TRUE" name="paramValue">												
								 				<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(showHistory)=Y&answer(conditionFlag)=Y " title="<bean:message key='ToolTip.PolicySummary.Number'/>"> <%= ""+polVerNo %></a>
											</logic:equal>
											<logic:notEqual value="TRUE" name="paramValue">
								 				<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y " title="<bean:message key='ToolTip.PolicySummary.Number'/>"> <%= ""+polVerNo %></a>
											</logic:notEqual>
										</logic:present>							 					
							 			</td>
							 			
							 		<%--	<td class="FormLabels" width="18%" align="left">
							 			 <%if (Integer.parseInt(PolicyVersionListDetail.getPolicyVerSubNumber())>0){ %>
											<%=""+PolicyVersionListDetail.getPolicyNumber()%><%="-"+PolicyVersionListDetail.getPolicyVerSubNumber()%>
										<%} else { %>
											<%=""+PolicyVersionListDetail.getPolicyNumber()%>
										<%} %> 
										</td>--%>
									
							 			<td class="FormLabels2" width="43%" align="left">
							 			
							 			  
							 			  <%String isoriginalPolicy = "Y"; %>
							 			  <dmshtml:GetPolicyVersionEndorsementType nameInSession = "EndorsementType" policyId="<%=""+PolicyVersionListDetail.getPolPolicyId()%>" policyVerId = "<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>" ownerId='<%=""+ownerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 			   	 <logic:present name="EndorsementType">
							 			   	  
							 			   	  <logic:iterate id="PolicyVerEndorsementType" name="EndorsementType" scope="request" type="com.dms.ejb.insurance.policy.PolicyDetail"> 
							 			   	  <dmshtml:getProductHeaderDetail nameInSession="EndorsementProductDetail" productId='<%=""+PolicyVerEndorsementType.getProductId()%>' productVerId='<%=""+PolicyVerEndorsementType.getProductVerId()%>' ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<logic:present name="EndorsementProductDetail">
													<%EndoProductName = ((com.dms.ejb.product.PRDProductDetail)request.getAttribute("EndorsementProductDetail")).getMProductVerName();%>
												<logic:present name="paramValue">
													<logic:equal value="TRUE" name="paramValue">												
														<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(showHistory)=Y&answer(conditionFlag)=Y " title="<bean:message key='ToolTip.PolicySummary.EndorsementType'/>">  <%=""+EndoProductName%></a>
													</logic:equal>
													<logic:notEqual value="TRUE" name="paramValue">
														<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y " title="<bean:message key='ToolTip.PolicySummary.EndorsementType'/>">  <%=""+EndoProductName%></a>
													</logic:notEqual>
												</logic:present>
												
												</logic:present>
							 				
							 				</logic:iterate>
							 			</logic:present>
							 			<logic:empty name="EndorsementType">
							 			<logic:present name="paramValue">
											<logic:equal value="TRUE" name="paramValue">												
								 			   <a href="../GetNonBTAPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(showHistory)=Y&answer(conditionFlag)=Y "  title="<bean:message key='ToolTip.PolicySummary.OriginalPolicy'/>"> Original Policy </a>
											</logic:equal>
											<logic:notEqual value="TRUE" name="paramValue">
								 			   <a href="../GetNonBTAPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y "  title="<bean:message key='ToolTip.PolicySummary.OriginalPolicy'/>"> Original Policy </a>
											</logic:notEqual>
										</logic:present>
							 			</logic:empty>
							 			
										</td>
											
										<td class="FormLabels2" width="12%" align="left">
							 				<bean:write property="policyVerEffDate" name="PolicyVersionListDetail" />
							 				
							 			</td>
							 			
							 			<td class="FormLabels2" width="15%" align="left">
							 				<bean:write property="createdBy" name="PolicyVersionListDetail" />
							 			</td>                                                                                                                                                                                    
							 			<td class="FormLabels2" width="10%" align="left">
							 				<bean:write property="createdDate" name="PolicyVersionListDetail" />
							 			</td> 
							 			<td class="FormLabels2" width="15%" align="left">
							 				<bean:write property="policyStatus" name="PolicyVersionListDetail" />
							 			</td>
							 		</tr>	
							 	</logic:iterate>
							 </logic:present>		
					</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
 	<td>						
<html:form action="/BrowseEndorsementNonBTA.do" styleId="issueEndo" scope="request">					
	Endorsement				
<table class="loctable" WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	
			 		     	
			 			
				 			
				 			<tr height="30">
								<th valign="center" align="center"> S.NO 
								</th>											
								<%--<td class="FormLabels" width="8%" align="left"> Quote No
								</td>--%>
								<th valign="center" align="center"> Endorsement Type
								</th>
								<th valign="center" align="center"> Effective
								</th>
								<th valign="center" align="center"> Last Saved By 
								</th>
								<th valign="center" align="center"> Last Saved
								</th>
								
							</tr>
							
							<dmshtml:GetEndorsementQuoteListById nameInSession="EndorsementQuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" conditionFlag ="N"  objectType="POLICY" quoteType="ENDORSEMENT" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />



							<logic:present name="EndorsementQuoteList">
							
							<%int slNo = 0; %>
										
								<logic:iterate id="EndorsementQuoteList" name="EndorsementQuoteList" scope="request" >
							
									<tr height="30">										
							
										<% slNo++; %>
										
										<td class="FormLabels2" width="3%" align="center"> <%= ""+slNo%> </td>

										<logic:present name="policyHeaderInfo">
										<bean:define id="policyEffDate" name="policyHeaderInfo" property="policyEffDate" />	
									 	 <bean:define id="policyExpDate" name="policyHeaderInfo" property="policyExpDate" />	
							
										<%--<td class="FormLabels" width="8%" align="left"><a href="/GetEndorsementQuoteDetail.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(parentPolicyStatus)=<%=""+policyStatus%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteId)=<bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/>&answer(parentQuoteId)=<bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(policyEffDate)=<%=""+policyEffDate%>&answer(policyExpDate)=<%=""+policyExpDate%> "><bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/></a></td>--%>
										
										<bean:define id="endoProductId" name="EndorsementQuoteList" property="Object::Endorsement::Quote::ProductId" />
										<bean:define id="endoProductVerId" name="EndorsementQuoteList" property="Object::Endorsement::Quote::ProductVerId" />
										<bean:define id="endoPolicyId" name="EndorsementQuoteList" property="Object::Endorsement::PolicyId" />
										<bean:define id="endoPolicyVerId" name="EndorsementQuoteList" property="Object::Endorsement::PolicyVerId" />
										
											<dmshtml:getProductHeaderDetail nameInSession="EndorsementProductDetail" productId='<%=""+endoProductId%>' productVerId='<%=""+endoProductVerId%>' ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<logic:present name="EndorsementProductDetail">
													<%EndoProductName = ((com.dms.ejb.product.PRDProductDetail)request.getAttribute("EndorsementProductDetail")).getMProductVerName();%>
									<td class="FormLabels2" width="25%" align="left"><a href="/EditNonBTAEndorsement.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(policyId)=<%=""+endoPolicyId%>&answer(policyVerId)=<%=""+endoPolicyVerId%>&answer(Object::Customer::CustomerId)=<%=""+custId %>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>"  title="<bean:message key='ToolTip.PolicySummary.EndorsementType'/>"><%=""+EndoProductName%></a></td>
												</logic:present>
												</logic:present>
										
										<td class="FormLabels2" width="12%" align="left">
										
										<bean:define id="EndorsementQuoteStartDate" name="EndorsementQuoteList" property="Object::Endorsement::Quote::PolicyEffDate" />	
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
										<td class="FormLabels2" width="15%" align="left"><bean:write property="Object::Endorsement::Quote::UpdatedBy" name="EndorsementQuoteList" /></td>
										
										<td class=FormLabels2 width="10%" align="left">
										
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
										
										
										
							
								</logic:iterate>					
							
							</logic:present>
						 					
							<tr>
								<td>
									<html:hidden property="answer(Object::Quote::OwnerId)" value='<%=""+ownerId%>' />
									<html:hidden property="answer(Object::Quote::PaymentPlan)" value='<%=""+paymentPlan%>' />
									
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
									<html:hidden property="answer(renewalPolicyId)" value='<%=""+renewalPolicyId%>'/>
									<html:hidden property="answer(renewalPolicyVerId)" value='<%=""+renewalPolicyVerId%>'/>
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
				 		</table>
				 	<html:hidden property="answer(PrimaryOrRenewalQuoteId)"  value="<%=""%>" styleId="PrimaryOrRenewalQuoteIdNew" />	
				 		<%if (isActivePolicy.equals("Y") && (!policyStatus.equalsIgnoreCase("EXPIRED"))){ %>
							
				 					<span title="<bean:message key='ToolTip.PolicySummary.AddEndorsement'/>"><html:submit property="answer(ADD)" value="Add Endorsement" styleClass="covbigbutton1" styleId="EndorseAddSubmit" onclick="document.getElementById('PrimaryOrRenewalQuoteIdNew').value=document.getElementById('PrimaryOrRenewalQuoteId').value"/></span>
				 				
						<%} %>	
						</html:form>													
	 	
</td>
    </tr>
    </table>					