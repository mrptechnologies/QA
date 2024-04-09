<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CreateEndorsementQuote.js"></SCRIPT>

<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css">
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<!--bean:parameter name="answer(Object::Quote::QuoteStartDate)" id="EffectiveDate"/-->
<bean:parameter name="answer(Object::Product::ProductId)" id="productId"/>
<bean:parameter name="answer(Object::Product::ProductVerId)" id="productVerId"/>
<bean:parameter name="answer(Object::Product::RiskState)" id="riskState"/>
<bean:parameter name="answer(Object::Quote::QuoteType)" id="quoteType"/>
<bean:parameter name="answer(Object::Customer::CustomerId)" id="customerId"/>
<bean:parameter name="answer(Object::Quote::ParentPolicyId)" id="parentPolicyId"/>
<bean:parameter name="answer(Object::Quote::ParentPolicyVerId)" id="parentPolicyVerId"/>
<bean:define property="answer(policyNumber)" id="policyNumber" name="QuoteDetail" />
<bean:parameter name="policyEffDate" id="policyEffDate"/>
<bean:parameter name="policyExpDate" id="policyExpDate"/>
<bean:parameter name="answer(Object::Quote::QuoteStartDate)" id="startDate"/>
<bean:parameter name="answer(parentPolicyStatus)" id="parentPolicyStatus"/>
<bean:parameter name="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" id="riskId"/>
<bean:parameter name="answer(Object::Risk::Teritory)" id="ratingTerritory"/>
<bean:parameter name="answer(Object::Agency::AgencyId)" id="agencyId"/>
<bean:define property="answer(renewalEffectiveDate)" id="policyNumberz" name="QuoteDetail" />
<bean:define property="answer(originaldate)" id="policyNumbery" name="QuoteDetail" />
<bean:define id="paymentPlan" name="QuoteDetail" property="answer(Object::Quote::PaymentPlan)"  />
<bean:define id="QuoteEffectiveDate" name ="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)"/>

<% String exprDate = ""+policyExpDate; %>
<% String quotestartdate =""+startDate; %>

<bean:define property="answer(renewalPolicyId)" id="renewalPolicyId" name="QuoteDetail" />
<bean:define property="answer(renewalPolicyVerId)" id="renewalPolicyVerId" name="QuoteDetail" />

<bean:define id="PrimaryOrRenewalQuoteId" name ="QuoteDetail" property="answer(PrimaryOrRenewalQuoteId)"/>




	<%String documentType ="ISSUANCE";%>
<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId='<%=""+parentPolicyId%>' policyVerId='<%=""+parentPolicyVerId %>' policyNumber="<%=""+policyNumber%>" documentType='<%=documentType%>' ownerId='<%=""+ownerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<bean:define id="parentQuoteId" name="policyHeaderInfo" property="MParentQuoteId" scope="request"/>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">

	<tr><td height="10"></td></tr>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">										
	<tr>
		<td bgcolor="#C6DEEA">
						<div id="QuoteInsuerdAgencyAgentHeader">
							<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
							<jsp:param name="parentQuoteId" value="<%=""+PrimaryOrRenewalQuoteId%>" />
							<jsp:param name="paretQuoteStatus" value="<%=""+parentPolicyStatus%>" />
							</jsp:include>
						</div>
		</td>
	</tr>
	</dmshtml:dms_static_with_connector>
	<tr>
		<td width="100%">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">										
				<tr>
					<td>		
						<jsp:include page="../common/DynamicPolicyHeader.jsp">
							<jsp:param name="policyId" value="<%=parentPolicyId.toString()%>" />
							<jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
							<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
							<jsp:param name="renewalPolicyId" value="<%=""+renewalPolicyId%>" />
							<jsp:param name="renewalPolicyVerId" value="<%=""+renewalPolicyVerId%>" />
							<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
						</jsp:include>
				 </td>
			  	</tr>
			  	</dmshtml:dms_static_with_connector>
			  	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true">										
										<tr>
											<td>
										
											
												
													<logic:present name="policyHeaderInfo">														
														<jsp:include page="/common/PolicyQuoteHeaderCoverMin.jsp">															
															<jsp:param name="ParentQuoteId" value="<%=""+parentQuoteId%>" />												
														</jsp:include>
													</logic:present>											
											</td>
										
										</tr>
											
											<tr>
												<td>
													<jsp:include page="../common/DynamicPolicyHeaderUI3.jsp">
														<jsp:param name="policyId" value="<%=""+parentPolicyId.toString()%>" />
														<jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
														<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
														<jsp:param name="prodId" value="<%=""+productId%>" />
														<jsp:param name="ProductVerId" value="<%=""+productVerId%>" />								
														<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
													</jsp:include>
												</td>
											</tr>
										</dmshtml:dms_static_with_connector>	
			  </table> 	
		</td>
	</tr> 

	<%if(!policyNumber.toString().equals("")) {%>
	
		<td class="links" align="left" width="100px"  title="<bean:message key='ToolTip.SelectEndorsement.PolicySummary'/>">
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>">Policy Summary</a>
		</td>
		
	<%} %>	
	
	
	<tr><td height="10"></td></tr>
	
	<tr><td class="NewSectionHead" colspan="4" align="center">SELECT ENDORSEMENT TYPE</td></tr>

	<tr><td><hr size="1" noshade="noshade"></td></tr>

</table>

<html:form action="/CreateEndorsementQuoteV2.do" onsubmit="return validateFields()">




	<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		
		<tr><td height="10"></td></tr>
		<tr><td>
		<table WIDTH="75%" ALIGN="center" BORDER="0">			
			<dmshtml:GetPolicyEffDate nameInSession="policyDetail" policyId="<%=Long.parseLong(""+parentPolicyId)%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
				<logic:present name="policyDetail">
					<%String policyEffDate1 = ""+request.getAttribute("policyDetail");
					com.dms.ejb.common.DMSDetail detail = new com.dms.ejb.common.DMSDetail();
					java.sql.Date policyChkDate = detail.stringToDate(policyEffDate1); 
					
				    String strStartDate = ""+policyChkDate;
                    String arrStartDate[] = strStartDate.split("-");
                    
                    String YYYY = arrStartDate[0];
					String MM = arrStartDate[1];
					String DD = arrStartDate[2];
					
					strStartDate = MM+"/"+DD+"/"+YYYY;
					%>			
					<%
					if(parentPolicyStatus.equalsIgnoreCase("canceled")){ %>
						<tr>			
							<td width="40%" class="FormLabels" align="left" height="25">Effective Date</td>
							<td class="links"><html:text property="answer(Object::Quote::QuoteStartDate)" value='<%=""+strStartDate%>' disabled="true" size="10" maxlength="30" styleId="txtDate" styleClass="txtbox" onchange="return validateDate('submit');" /> &nbsp;(MM/DD/YYYY)</td>
							<html:hidden property="answer(Object::Quote::QuoteStartDate)" value='<%=""+strStartDate%>'/>
						</tr>
					<%} %>
				</logic:present>
				
				<%if(!parentPolicyStatus.equalsIgnoreCase("canceled")){ %>
					<tr>			
						<td width="40%" class="FormLabels" align="left" height="25">Effective Date</td>
						<td class="sectionhead1" align="left" >
	          				<div id="policyEffectiveDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="txtDate1"/>
           						<jsp:param name="panelDiv" value="policyEffectiveDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="true"/>
       	   						<jsp:param name="TodayDate" value="<%=QuoteEffectiveDate%>"/>
           					</jsp:include>
     						</div>
     						<html:hidden property="answer(Object::Quote::QuoteStartDate)" styleId="txtDate" />
     					</td>						
					</tr>
				<%} %>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true">
				<tr id="ExpirationDate" style="display:none;">			
						<td width="40%" class="FormLabels" align="left" height="25">Expiration Date</td>
						<td class="sectionhead1" align="left" >
	          				<div id="policyExpirationDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="ExpirationDate1"/>
           						<jsp:param name="panelDiv" value="policyExpirationDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="false"/>
       	   						<jsp:param name="TodayDate" value=""/>
           					</jsp:include>
     						<html:hidden property="answer(Object::Quote::QuoteEndDate)" styleId="expDate" />
     						<html:hidden property="answer(Object::PageType)" styleId="PageType" value="ISSUE_BINDER_CLC"/>
     					</td>						
				</tr>
					
				</dmshtml:dms_static_with_connector>
				
		<tr>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CREATE_QUOTE_ALLPRODUCTSTATUS"}%>' connector='or' negated="true">
				<td width="40%" align="left" class="FormLabels">Endorsement Status&nbsp;</td>
				<td class="sectionhead1">
					<html:select property="answer(Object::Quote::ProductStatus)" styleClass="txtbox" onchange="return getTypeInStatus()" styleId="endorsementStatus">
						<html:option value ='RELEASED'>Released</html:option>
						<html:option value ='DEVELOPMENT'>Development</html:option>
						<html:option value ='QA'>QA</html:option>
					</html:select>
				</td>

			</dmshtml:dms_static_with_connector>
			
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CREATE_QUOTE_RESTRICTED_RELEAS"}%>' connector='or' negated="true">
				<td width="40%" align="left" class="FormLabels">Endorsement Status&nbsp;</td>
				<td class="sectionhead1">
					<html:select property="answer(Object::Quote::ProductStatus)" onchange="return getTypeInStatus()" styleId="endorsementStatus">
						<html:option value ='RELEASED'>Released</html:option>
						<html:option value ='RESTRICTED'>Restricted</html:option>
					</html:select>
				</td>
			</dmshtml:dms_static_with_connector>
			
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CREATE_QUOTE_ALLPRODUCTSTATUS"}%>' connector='or' negated="false">
					<html:hidden  property="answer(Object::Quote::ProductStatus)" value="RELEASED"/>	
			</dmshtml:dms_static_with_connector>
			
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CREATE_QUOTE_RESTRICTED_RELEAS"}%>' connector='or' negated="false">
					<html:hidden  property="answer(Object::Quote::ProductStatus)" value="RELEASED"/>	
			</dmshtml:dms_static_with_connector>
			
		</tr>
		

		 				
		<logic:present name="productEndorsementList" scope="request">
			<tr>
				<td width="40%" class="FormLabels" align="left">Endorsement Type</td>
				<td class="links">
					<bean:define id="arrProductName" name="productEndorsementList" type="java.util.ArrayList"/>

					<html:select property="answer(Object::Quote::ProductVerId)" styleId="endorsementType" styleClass="txtbox"  onchange="validateRenewalDate()">
						<html:option  value="">Select</html:option>
						<%
							for(int i=0;i<arrProductName.size();i++) {
								com.dms.ejb.data.QuestionHashMap productNameMap=(com.dms.ejb.data.QuestionHashMap)arrProductName.get(i);						
								if(parentPolicyStatus.equalsIgnoreCase("canceled")){
									if(productNameMap.getString("Object::Product::ProductName").startsWith("Reinstate")){
						%>
									<html:option value ='<%=productNameMap.getString("Object::ProductVer::ProductVerId")%>'>
									<%=productNameMap.getString("Object::Product::ProductName")%></html:option>
								<%} 
							} else { %>
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RENEWAL_TAB_PRESENT"}%>' connector='or' negated="false">								
									<%if(!productNameMap.getString("Object::Product::ProductName").startsWith("Reinstate")){%>
										<html:option value ='<%=productNameMap.getString("Object::ProductVer::ProductVerId")%>'>										
										<%=productNameMap.getString("Object::Product::ProductName")%></html:option>
									<%}%>
								</dmshtml:dms_static_with_connector>
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RENEWAL_TAB_PRESENT"}%>' connector='or' negated="true">
									<%if(!productNameMap.getString("Object::Product::ProductName").startsWith("Reinstate") && productNameMap.getString("Object::ProductVer::IsRenewal").equalsIgnoreCase("N")){%>										
										<html:option value ='<%=productNameMap.getString("Object::ProductVer::ProductVerId")%>'>
										<%=productNameMap.getString("Object::Product::ProductName")%></html:option>
									<%}%>
								</dmshtml:dms_static_with_connector>
							<%}
								
						 } %>
					</html:select>
					
				</td>
			</tr>
		</logic:present>
		
		<tr><td>&nbsp;</td></tr>

		<tr>
			<td>&nbsp;
				<html:hidden  property="answer(Object::Product::ProductId)" value="<%= ""+productId%>"/>
				<html:hidden  property="answer(Object::Product::ProductVerId)" value="<%=productVerId%>"/>
				<html:hidden  property="answer(ProductVerId)" value="<%=productVerId%>"/>				
				<html:hidden  property="answer(productVerId)" value="<%=productVerId%>"/>				
				<html:hidden  property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>"/>
				<html:hidden  property="answer(Object::Quote::ParentPolicyId)" value='<%=parentPolicyId%>'/>
				<html:hidden  property="answer(Object::Quote::ParentPolicyVerId)" value='<%=parentPolicyVerId%>'/>
				<html:hidden  property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
				<html:hidden  property="answer(Object::Quote::QuoteType)" value="<%=""+quoteType%>"/>
				<html:hidden  property="answer(Object::Product::UserRole)" value="<%=""+userName%>"/>
			    <html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=""+userName%>" />
			    <html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=""+userName%>" />
				<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
	   			<html:hidden  property="answer(Object::Product::RiskState)" value="<%=""+riskState%>"/>
	   			<html:hidden  property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>"/>
	   			<html:hidden  property="answer(customerId)" value="<%=""+customerId%>"/>	   			
				<html:hidden property="answer(Object::Quote::LockStatus)" value="Unlocked"/>
				<html:hidden name="AddQuote" property="answer(Object::Quote::GroupOutOfSync)" value="N"/>
				<html:hidden property="answer(Object::Quote::PaymentPlan)" value='<%=""+paymentPlan%>' />
				<html:hidden property="answer(Object::Quote::CensusOutOfSync)" value="N"/>
				<html:hidden property="answer(Object::Quote::ProductOutOfSync)" value="N"/>				
				<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
				<html:hidden property="answer(Object::Quote::PolicyNumber)" value="<%=""+policyNumber%>"/>
				<html:hidden property="policyEffDate" value='<%=""+policyEffDate%>'/>
				<html:hidden property="policyExpDate" value='<%=""+policyExpDate%>'/>
				<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=""+parentPolicyId%>"/>
    			<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=""+parentPolicyVerId%>"/>
    			<html:hidden property="answer(parentPolicyStatus)" value="<%=""+parentPolicyStatus%>" styleId="parentPolicyStatus"/>
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
				
				<html:hidden property ="answer(Object::Reference::QuoteStartDate)" styleId="refQuoteStartDate" />
				
				<html:hidden property ="answer(Object::Reference2::QuoteStartDate)"   styleId="refQuoteStartDate2" />
				
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
				<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
				<html:hidden property="answer(PrimaryOrRenewalQuoteId)" value="<%=PrimaryOrRenewalQuoteId.toString()%>" />
				
			</td>
			<td align="left" title="<bean:message key='ToolTip.SelectEndorsement.Select'/>">
				<html:submit value="Select" property="answer(button)" styleClass="covsmallbutton" styleId="SelectEndorseSubmit"/>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		</table>
		
		</td></tr>
	</table>
	
	
	<script type="text/javascript">
	 
	    if(document.forms[0].refQuoteStartDate.value == ""){
	     
	      document.forms[0].refQuoteStartDate.value =  document.forms[0].txtDate.value;
	      }else{
	      
	   	   document.forms[0].txtDate.value =  document.forms[0].refQuoteStartDate.value;
	   	   validateRenewalDate();
	    }	
   
	   
	 function validateRenewalDate(){
	   var frmElements =  document.forms[0];
	   var index=frmElements.endorsementType.selectedIndex
	   
	   var formElement = frmElements.endorsementType.options[index].text;
       
       
       if((formElement == "Renewal-DP1") ||(formElement == "Renewal-DP3")||(formElement == "Renewal-HO3")|| (formElement == "Renewal-HO8")||(formElement == "Renewal-BR") || (formElement == "Renewal-Vacant-DP1")||(formElement == "Renewal-Vacant-DP3")||(formElement == "Renewal CUP") ||(formElement == "Storage Tank - Renewal") || (formElement == "Renewal") ){
         
         if(frmElements.parentPolicyStatus.value != "BOUND"){
           if(frmElements.refQuoteStartDate2.value == "" ){
             
             frmElements.txtDate.value = '<%=exprDate%>';
             frmElements.txtDate1.value = frmElements.txtDate.value;
             if(document.getElementById("ExpirationDate") != null && document.getElementById("ExpirationDate") != undefined){
	             var txtDate = '<%=exprDate%>';
	             var effectiveDate = txtDate.split("/"); 	                        
	             if(parseInt(effectiveDate[1])<10 && effectiveDate[1].length==1 ){ effectiveDate[1] = "0"+(effectiveDate[1]);}
	          
	             if(parseInt(effectiveDate[1])>31){
		             effectiveDate[1] = "01";
		             if(!parseInt(effectiveDate[0])<12){
			             	effectiveDate[0]=parseInt(effectiveDate[0],10)+1;
			             	if(parseInt(effectiveDate[0])<10){ effectiveDate[0] = "0"+(effectiveDate[0]);}
			         }
			         else{
				            effectiveDate[0]="01";
				            effectiveDate[2]=parseInt(effectiveDate[2],10)+1;
				     }
				   }
	             
	             var effectiveDate = txtDate.split("/"); 	                  
	             var effDate = effectiveDate[0]+"/"+effectiveDate[1]+"/"+effectiveDate[2];
	             frmElements.txtDate.value = effDate;
	             frmElements.txtDate1.value = frmElements.txtDate.value;
	             effectiveDate[2] = parseInt(effectiveDate[2])+1;            
	             effDate = effectiveDate[0]+"/"+effectiveDate[1]+"/"+effectiveDate[2];	                        	
             }	
             
           }
           frmElements.txtDate.value =  frmElements.txtDate1.value;
           if(document.getElementById("ExpirationDate") != null && document.getElementById("ExpirationDate") != undefined){
	           document.getElementById("ExpirationDate").style.display="";
	           document.getElementById("PageType").value = "YES";
	           var strDate = document.getElementById('txtDate1').value;
	  		   var dmonth = parseInt(strDate.substring(0, 2), 10);
			   var dday = parseInt(strDate.substring(3, 5), 10);
			   var dyear = parseInt(strDate.substring(6, 10), 10);
			   if(dmonth<10){ dmonth = "0"+(dmonth);}
			   if(dday<10){ dday = "0"+dday;}
			   document.getElementById('ExpirationDate1').value = dmonth+"/"+dday+"/"+(dyear+1);
			   document.getElementById('expDate').value = dmonth+"/"+dday+"/"+(dyear+1);
			}
        }else{
        
          alert("Policy is not issued.Please issue the policy to Create Renewal Endorsement");
          frmElements.endorsementType.selectedIndex =0;         
          }    
          
       }else{
       	 if(frmElements.txtDate1 != null && frmElements.txtDate1 != undefined){	
       	 	frmElements.txtDate1.value = frmElements.refQuoteStartDate.value;
      	 	frmElements.txtDate.value = frmElements.refQuoteStartDate.value;
      	 }
      	 if(document.getElementById("ExpirationDate") != null && document.getElementById("ExpirationDate") != undefined){
	        document.getElementById("ExpirationDate").style.display="none";
	     }
       }     
      
	  }
	  </script>
	  
	  <script type="text/javascript">
   			Ext.onReady(function(){  
   				 document.getElementById("txtDate1").value = document.getElementById("refQuoteStartDate").value;
      	 		 document.getElementById("txtDate").value = document.getElementById("refQuoteStartDate").value; 		
   				 var effDate = Ext.getCmp('txtDate1').getValue();
   				 var MM = effDate.getMonth()+1;
				 var DD = effDate.getDate();
				 var YY = effDate.getFullYear();
				 var YY1 = effDate.getFullYear() + 1;
			     if(MM<10){ MM = "0"+(MM);}
				 if(DD<10){ DD = "0"+DD;}   
   				 document.forms[0].txtDate.value =MM+'/'+DD+'/'+YY; 
   				 if(document.forms[0].expDate != null && document.forms[0].expDate != undefined){  	 					  			 				 
	   				 Ext.getCmp('ExpirationDate1').setValue(MM+'/'+DD+'/'+YY1);
	   				 document.forms[0].expDate.value =MM+'/'+DD+'/'+YY1;
	   			}			
  			var blurHandlerEffectiveDate = function() {  
  			var strDate = document.getElementById('txtDate1').value;  			
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);

			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{	
				alert("Please enter date in 'MM/DD/YYYY' format");
				document.forms[0].txtDate.value = strDate;
				return false;
			}else{
				var effDate1 = Ext.getCmp('txtDate1').getValue(); 
				var MM1 = effDate1.getMonth()+1;
				var DD1 = effDate1.getDate();
				var YY1 = effDate1.getFullYear();
				var YY2 = effDate1.getFullYear() + 1;
				if(MM1<10){ MM1 = "0"+(MM1);}
				if(DD1<10){ DD1 = "0"+DD1;}
				Ext.getCmp('txtDate1').setValue(MM1+'/'+DD1+'/'+YY1);
				document.forms[0].txtDate.value =MM1+'/'+DD1+'/'+YY1; 
				if(document.forms[0].expDate != null && document.forms[0].expDate != undefined){ 	 					  			 				 
					Ext.getCmp('ExpirationDate1').setValue(MM1+'/'+DD1+'/'+YY2);
   					document.forms[0].expDate.value =MM1+'/'+DD1+'/'+YY2;
   				}
   				var frm=document.forms[0];
   				var renewalFlag="N";
   				var index=frm.endorsementType.selectedIndex;
				if((frm.endorsementType.options[index].text == "Renewal-DP1") || (frm.endorsementType.options[index].text == "Renewal-DP3")||(frm.endorsementType.options[index].text == "Renewal-HO3")||(frm.endorsementType.options[index].text == "Renewal-HO8")||(frm.endorsementType.options[index].text == "Renewal-BR") ||(frm.endorsementType.options[index].text == "Renewal-Vacant-DP1") || (frm.endorsementType.options[index].text == "Renewal-Vacant-DP3") || (frm.endorsementType.options[index].text == "Renewal CUP") || (frm.endorsementType.options[index].text == "Storage Tank - Renewal") || (frm.endorsementType.options[index].text == "BTA - Renewal"))  {
			          renewalFlag ="Y";
			    }
				if(renewalFlag == "N"){
					var vardate = document.forms[0].txtDate.value;
					var ddate = new Date(vardate);
					var effdate=document.forms[0].policyEffDate.value;  
				    var expdate=document.forms[0].policyExpDate.value;			    
				    var effDate = new Date(effdate);
				    var expDate = new Date(expdate);
					if((ddate < effDate) || (ddate > expDate)) {
						alert("Please enter  Effective date between Effective date and the Expiry Date" );
						document.forms[0].txtDate1.value=effdate;
						document.forms[0].txtDate.value=effdate;
						if(frm.refQuoteStartDate !=null && frm.refQuoteStartDate != 'undefined')
						 frm.refQuoteStartDate.value= frm.txtDate.value;
						//frm.txtDate.value=frm.policyEffDate.value; ;
						frm.txtDate.select();			
					}	
				}	   			
   			}
   			}; 
   			var blurHandlerExpirationDate = function() {  
  			 
  			var strDate = document.getElementById('ExpirationDate1').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{	
				alert("Please enter date in 'MM/DD/YYYY' format");				
				return false;
			}else{
				var expDate1 = Ext.getCmp('ExpirationDate1').getValue(); 
				var MM2 = expDate1.getMonth()+1;
				var DD2 = expDate1.getDate();
				var YY2 = expDate1.getFullYear();
				var effDate1 = document.getElementById('txtDate1').value;
  				var dmonth1 = parseInt(effDate1.substring(0, 2), 10);
				var dday1 = parseInt(effDate1.substring(3, 5), 10);
				var dyear1 = parseInt(effDate1.substring(6, 10), 10);
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
				Ext.getCmp('ExpirationDate1').setValue(MM2+'/'+DD2+'/'+YY2);
   				document.forms[0].expDate.value =MM2+'/'+DD2+'/'+YY2;
   				var effDate2 = Ext.getCmp('txtDate1').getValue();
				if(YY2 < dyear1){
					alert("Please enter the valid Renewal Expiration date");									
				}
				if((MM2 < dmonth1) && (YY2==dyear1)){
					alert("Please enter the valid Renewal Expiration date");					
				}
				if((MM2 == dmonth1) && (DD2<=dday1) && (YY2==dyear1)){
					alert("Please enter the valid Renewal Expiration date");					
				}
   			}
   			}; 
   			
			Ext.EventManager.on('txtDate1', 'blur', blurHandlerEffectiveDate); 
			Ext.EventManager.on('ExpirationDate1', 'blur', blurHandlerExpirationDate); 
 			});
	</script>	  
	
</html:form>