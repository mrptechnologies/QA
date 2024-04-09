
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CalculateInstallmentPay.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/PaymentPlan.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/prototype.js"></script>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="dbName" property="answer(Object::Quote::dbName)"   name="AddPayment"  scope="request" />
<bean:define id="agencyId" property="answer(Object::Agency::AgencyId)" name="AddPayment" scope="request"	/>
<bean:define id="productVerId" property="answer(Object::Product::ProductVerId)" name="AddPayment"  scope="request" />
<bean:define id="parentQuoteId" property="answer(Object::Quote::ParentQuoteId)" name="AddPayment" 	scope="request" />
<bean:define id="subQuoteId" property="answer(Object::Quote::subQuoteId)"  name="AddPayment" scope="request"  />
<bean:define id="totalPremium" property="answer(Object::Quote::TotalPremium)" name="AddPayment"  scope="request" />
<bean:define id="subQuoteVerId"	property="answer(Object::Quote::subQuoteVerId)"	 name="AddPayment" scope="request" />
<bean:define id="parentQuoteVerId"	property="answer(Object::Quote::parentQuoteVerId)"	 name="AddPayment" scope="request" />
<bean:define id="customerId" property="answer(Object::Customer::customerId)" name="AddPayment"  scope="request" />
<bean:define id="ProductId" property="answer(Object::Quote::ProductId)" name="AddPayment" 	scope="request" />
<bean:define id="groupId" property="answer(Object::Quote::groupId)" name="AddPayment" scope="request" />
<bean:define id="groupVerId" property="answer(Object::Quote::groupVerId)"  name="AddPayment" scope="request" />
<bean:define id="productStatus" property="answer(Object::Quote::productStatus)" name="AddPayment"  scope="request" />
<bean:define id="PrevSubQuoteVerId" property="answer(Object::Quote::PrevSubQuoteVerId)" name="AddPayment"  scope="request" />
<bean:define id="quoteStatus" property="answer(Object::Quote::QuoteStatus)" name="AddPayment"  scope="request" />
<bean:define id="stateCode" property="answer(stateCode)" name="AddPayment"  scope="request" />
<% String QuoteStatus = ""+quoteStatus;  %>

<html:form   action="/UpdateBillingAction.do" onsubmit="return validateSubmit()" >

<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td height="5"></td></tr>
	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0" bgcolor="#C6DEEA">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="NewSectionHead" align="center" width="100%" colspan="10">PAYMENT PLAN</td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
        <!-- #########################################  Quote Header ######################################################################## -->
    <tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<jsp:include page="../common/QuoteHeader.jsp">
					<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
					<jsp:param name="productVerId" value="<%=637%>" />
					<jsp:param name="heading" value="<%=""%>" /> 
				</jsp:include> 
			</table>		    
		</td>
	</tr>

	<!-- #########################################  Quote Header ######################################################################## -->

	<!-- #########################################  Plan Header ######################################################################## -->
	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<jsp:include page="../common/QuotePlanInfoHeader.jsp">
				<jsp:param name="subQuoteId" value="<%=""+subQuoteId%>" />	
					<jsp:param name="customerId" value="<%=""+customerId%>" />	
					<jsp:param name="productId" value="<%=""+ProductId%>" />	
					<jsp:param name="productVerId" value="<%=637%>" />
					<jsp:param name="prdGroupId" value="<%=""+groupId%>" />	
					<jsp:param name="prdGroupVerId" value="<%=""+groupVerId%>" />
					<jsp:param name="productStatus" value="<%=""+productStatus%>" />
					<jsp:param name="stateCode" value="<%=""+stateCode%>" />
				</jsp:include> 
			</table>
		
		</td>
	</tr>

	<!-- #########################################  Plan Header ######################################################################## -->
    <tr>
		<td height="8px"> </td>
	</tr>		
	<tr>
		<td class="SearchResult" align="left">
			<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId%>&answer(QuoteId)=<%=parentQuoteId%>&answer(parentQuoteId)=<%=parentQuoteId%>&answer(ownerId)=<%=""+ownerId%>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(userId)=<%=""+userName%>">
				Quote Summary
			</a> 
		</td>
     </tr>         
     <tr><td height="8px"> </td></tr>		  					  
	 <tr>
	 	<td valign="top">			
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"CELLPADDING="0">

				<!-- ###############################################    Billing Type  #################################################### -->
				<dmshtml:get_Billing_Types nameInSession="arrBillingTypes" productVerId="<%=""+637 %>"	dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<logic:present name="arrBillingTypes">
						<tr>
							<td width="35%" class="FormLabels" align="left">Select Billing Type</td>
							<td class="links">
							<html:select	property="answer(Object::QuoteBilling::BillingType)" styleId="BillingType" styleClass="txtbox">
							<%
							java.util.ArrayList BillingType = (java.util.ArrayList)request.getAttribute("arrBillingTypes");
							for(int billingTypeIndex = 0 ; billingTypeIndex < BillingType.size() ; billingTypeIndex++) {
							com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) BillingType.get(billingTypeIndex);
							%>
							<html:option value="<%=qMap.getString("Object::QuoteBilling::BillingType")%>">
									<%=qMap.getString("Object::QuoteBilling::BillingTypeDesc")%>
							</html:option>
							<% } %>
							</html:select>
							</td>
						</tr>
						<tr>
							<td width="35%" class="FormLabels" align="left">Enter Billing Type Code</td>
							<td>
								<html:text   property="answer(Object::QuoteBilling::BillingTypeCode)"  value="" styleId="BillingTypeCode" size="15" maxlength="15" styleClass="txtbox" />
							</td>
						</tr>
					</logic:present>

				<!-- ###############################################    Billing Type  #################################################### -->
						
				
				<!-- ###############################################    Payment Type  #################################################### -->

				<dmshtml:get_Payment_Types nameInSession="arrPaymentTypes" productVerId="<%=""+637 %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<logic:present name="arrPaymentTypes">
						<tr>
							<td width="35%" class="FormLabels" align="left">Select Payment Type</td>
							<td class="links">
							<html:select property="answer(Object::QuoteBilling::PaymentType)" styleId="PaymentType" styleClass="txtbox">
							<%
							java.util.ArrayList PaymentType = (java.util.ArrayList)request.getAttribute("arrPaymentTypes");
							for(int paymentTypeIndex = 0 ; paymentTypeIndex < PaymentType.size() ; paymentTypeIndex++) {
							com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) PaymentType.get(paymentTypeIndex);
							%>
							<html:option  value="<%=qMap.getString("Object::QuoteBilling::PaymentType")%>">
									<%=qMap.getString("Object::QuoteBilling::PaymentTypeDesc")%>
							</html:option>
							<% } %>
							</html:select></td>
						</tr>
					</logic:present>
				<!-- ###############################################    Payment Type  #################################################### -->
				
				<!-- ###############################################    Installment Type  #################################################### -->

				<dmshtml:get_Installment_Types	nameInSession="arrInstallmentTypes"	 parentQuoteVerId="<%=""+parentQuoteVerId %>" productVerId="<%=""+637 %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<logic:present name="arrInstallmentTypes">
					<%com.dms.ejb.data.QuestionHashMap qMap = null; %>
						<tr>
							<td width="35%" class="FormLabels" align="left">Select Installment Type</td>
							<td class="links">
							<select name="answer(Object::QuoteBilling::InstallmentDetail)" id="InstallmentType" class="txtbox"  onchange="return calculate('submit');" >
							<%
							java.util.ArrayList InstallmentType = (java.util.ArrayList)request.getAttribute("arrInstallmentTypes");
							for(int InstallmentTypeIndex = 0 ; InstallmentTypeIndex < InstallmentType.size() ; InstallmentTypeIndex++) {
							qMap = (com.dms.ejb.data.QuestionHashMap) InstallmentType.get(InstallmentTypeIndex);
							%>
							<option value="<%=qMap.getString("Object::QuoteBilling::NumberOfInstallments")+"::"+qMap.getString("Object::QuoteBilling::InitialPaymentPercentage")+"::"+qMap.getString("Object::QuoteBilling::InstallmentFee")+"::"+qMap.getString("Object::QuoteBilling::InstallmentTypeDesc")%>">
									<%=""+qMap.getString("Object::QuoteBilling::InstallmentTypeDesc")%>
							</option>
							<% } %>
							</select>
							</td>
						</tr>
					</logic:present>
				<!-- ###############################################    Installment Type  #################################################### -->
				</table>
			</td>
		</tr>
</table>	

<div id="InstallmentListPanel">	
<%int count = 0; 
  String InstallmentDescKey = "answer(Object::QuoteBilling::InstallmentDesc_" ;
  String DueDateKey = "answer(Object::QuoteBilling::DueDate_";
  String InstallmentPremiumKey = "answer(Object::QuoteBilling::InstallmentPremium_";
  String InstallmentFeeKey = "answer(Object::QuoteBilling::InstallmentFee_";
  String TotalInstallmentPremiumKey = "answer(Object::QuoteBilling::TotalInstallmentPremium_" ;%>
<logic:present name="ArrInstallmentPremiumDetail" scope="request">
												
							<table>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td class="sectionheadLink" align="center" width="3%">SL No</td>
							    <td class="sectionheadLink" align="center" width="15%">Installment Description</td>
								<td class="sectionheadLink" align="center" width="15%">Due Date (MM/DD/YYYY)</td>
								<td class="sectionheadLink" align="center" width="15%">Installment
								Premium Amount</td>
								<td class="sectionheadLink" align="center" width="15%">Installment
								Fee</td>
								<td class="sectionheadLink" align="center" width="15%">Total
								Installment Amount</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							
													
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="true">							
							<logic:iterate id="arrInstallmentPremiumDetail"	name="ArrInstallmentPremiumDetail">
								<% count++; 
								String InstallmentDesc = InstallmentDescKey+count+")";
								String DueDate = DueDateKey+count+")";
								String InstallmentPremium = InstallmentPremiumKey+count+")";
								String InstallmentFee = InstallmentFeeKey+count+")";
								String TotalInstallmentPremium = TotalInstallmentPremiumKey+count+")";%>
								<% 		
										String styleClass="";
										if(count%2==0){
											styleClass = "altdisply";
										}
										else{
											styleClass = "SearchResult";	
										}
									%>
                              
								<tr>
									<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>
									
									<td width="15%" align="center"  class=<%= styleClass %>>
									<bean:define id="installmentDesc" name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::InstallmentDesc" />
									<html:text   property='<%= ""+InstallmentDesc%>' value='<%= ""+installmentDesc%>' styleId="InstallmentDesc" size="15" maxlength="40" styleClass="txtbox" />
									</td>
									
									<td width="15%" align="center" class=<%= styleClass %>>
									<bean:define id="dueDate" name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::DueDate" />
									<html:text  onblur="return validateFields();"  property='<%=""+DueDate%>'  value='<%=""+dueDate%>' styleId="DueDate" size="15" maxlength="15" styleClass="txtbox" />
									</td>
									
									<td width="15%" align="center"  class=<%= styleClass %>>
									<bean:define id="installmentPremium" name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::InstallmentPremium" />
									$<html:text  style="text-align: right" property='<%=""+InstallmentPremium %>' value='<%=""+installmentPremium %>' styleId="InstallmentPremium" size="15" maxlength="15" styleClass="txtbox" />
									</td>
									
									<td width="15%" align="center" class=<%= styleClass %>>
									<bean:define id="installmentFee" name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::InstallmentFee" />
									$<html:text  onblur="return validate();"  style="text-align: right"	property='<%=""+InstallmentFee%>' value='<%=""+installmentFee%>'  styleId="InstallmentFee" size="15" maxlength="15" styleClass="txtbox" />
									</td>
									
									<td width="15%" align="center" class=<%= styleClass %>>
									<bean:define id="totalInstallmentPremium" name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::TotalInstallmentPremium" />
									$<html:text disabled="true" style="text-align: right" property='<%=""+TotalInstallmentPremium %>' value='<%=""+totalInstallmentPremium %>' styleId="TotalInstallmentPremium" size="15" maxlength="15" styleClass="txtbox" />
									</td>

									

								</tr>
						    </logic:iterate>
						    </dmshtml:dms_static_with_connector>
						    
						  	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="false">							
							<logic:iterate id="arrInstallmentPremiumDetail"
								name="ArrInstallmentPremiumDetail">
								<% count++; 
								String InstallmentDesc = InstallmentDescKey+count+")";
								String DueDate = DueDateKey+count+")";
								String InstallmentPremium = InstallmentPremiumKey+count+")";
								String InstallmentFee = InstallmentFeeKey+count+")";
								String TotalInstallmentPremium = TotalInstallmentPremiumKey+count+")";%>
								<% 		
										String styleClass="";
										if(count%2==0){
											styleClass = "altdisply";
										}
										else{
											styleClass = "SearchResult";	
										}
									%>
                              
								<tr>
									<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>
									
									<td width="15%" align="center"  class=<%= styleClass %>>
									<bean:write  name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::InstallmentDesc" />
									</td>
									
									<td width="15%" align="center" class=<%= styleClass %>>
									<bean:write  name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::DueDate" />
									</td>
									
									<td width="15%" align="center"  class=<%= styleClass %>>
									<bean:write  name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::InstallmentPremium" />
									</td>
									
									<td width="15%" align="center" class=<%= styleClass %>>
									<bean:write  name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::InstallmentFee" />
									</td>
									
									<td width="15%" align="center" class=<%= styleClass %>>
									<bean:write  name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::TotalInstallmentPremium" />
									</td>
								</tr>
						    </logic:iterate>
						    </dmshtml:dms_static_with_connector>
						    
						    
						   <bean:define id="quoteEffDate" name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::QuoteEffDate" />
						   <html:hidden property="answer(Object::QuoteBilling::QuoteEffDate)" styleId="QuoteEffDate"	value="<%=""+quoteEffDate%>" />		
                           <bean:define id="quoteExpDate" name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::QuoteExpDate" />
						   <html:hidden property="answer(Object::QuoteBilling::QuoteExpDate)" styleId="QuoteExpDate"	value="<%=""+quoteExpDate%>" />
						
						  
						    <tr>
								<td>&nbsp;</td>
							</tr>
						   
						    <tr>
						    
						   	<td width="3%" align="center" ></td>
						    <td width="15%" align="center" class="FormLabels"></td>
						   	<td width="15%" align="center" class="FormLabels">Total</td>
						   	<td width="15%" align="center" class="TextMatter" >
							<bean:define id="TotalInstallmentPayment" name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::TotalInstallmentPayment" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							$<html:text disabled="true" style="text-align: right" property="Object::QuoteBilling::TotalInstallmentPayment" value='<%=""+TotalInstallmentPayment %>' styleId="TotalInstallmentPayment" size="15" maxlength="15" styleClass="txtbox" />
							<!-- <dmshtml:CurrencyFormatTag  format="<%=""+TotalInstallmentPayment%>"/> -->
							</td>
							
							
                            <td width="15%" align="center" class="TextMatter" >
                            <bean:define  id="TotalInstallmentFee" name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::TotalInstallmentFee" />
   							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            $<html:text disabled="true" style="text-align: right" property="Object::QuoteBilling::TotalInstallmentFee" value='<%=""+TotalInstallmentFee %>' styleId="TotalInstallmentFee" size="15" maxlength="15" styleClass="txtbox" />
                            <!-- <dmshtml:CurrencyFormatTag  format="<%=""+TotalInstallmentFee%>"/> -->
							</td>
							
							
							<td width="15%" align="center" class="TextMatter" >
							<bean:define  id="TotalInstallmentAmount" name="arrInstallmentPremiumDetail" property="Object::QuoteBilling::TotalInstallmentAmount" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							$<html:text disabled="true" style="text-align: right" property="Object::QuoteBilling::TotalInstallmentAmount" value='<%=""+TotalInstallmentAmount %>' styleId="TotalInstallmentAmount" size="15" maxlength="15" styleClass="txtbox" />
							<!-- <dmshtml:CurrencyFormatTag   format="<%=""+TotalInstallmentAmount%>"/> -->
							</td>
							
							</tr>
							 
												  
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="true">													  
							<%if(QuoteStatus.equalsIgnoreCase("In Progress") || QuoteStatus.equalsIgnoreCase("Offered") || 
									QuoteStatus.equalsIgnoreCase("Bind Request")||QuoteStatus.equalsIgnoreCase("Submitted")){%>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
										<html:submit value="Save" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"	onmouseout="this.style.color='#0042B0';" styleId="BillingSubmit" />
										<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"	onmouseout="this.style.color='#0042B0';" />
									</td>
								</tr>
								<%} %>
							 </dmshtml:dms_static_with_connector>
					     </table>
					     <html:hidden property="answer(Object::Quote::InstallmentCount)" styleId="Count" value="<%=""+count%>" />
</logic:present>							
</div>
<html:hidden property="answer(Object::Quote::subQuoteVerId)"	value="<%=""+subQuoteVerId%>" />
<html:hidden property="answer(subQuoteVerId)"	value="<%=""+subQuoteVerId%>" />
<html:hidden property="answer(Object::Quote::TotalPremium)" value="<%=""+totalPremium%>" />
<html:hidden property="answer(Object::Product::ProductVerId)"	value="<%=""+637%>" />
<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" />
<html:hidden property="answer(Object::Quote::IsPaymentPlanModified)" value="Yes" />
<html:hidden property="answer(Object::Quote::subQuoteId)"	value="<%=""+subQuoteId%>" />
<html:hidden property="answer(Object::Customer::CustomerId)"	value="<%=""+customerId%>" />
<html:hidden property="answer(Object::Quote::ProductId)"	value="<%=""+ProductId%>" />
<html:hidden property="answer(Object::Quote::groupId)"	value="<%=""+groupId%>" />
<html:hidden property="answer(Object::Quote::ProductGroupId)"	value="<%=""+groupId%>" />
<html:hidden property="answer(Object::Quote::QuoteStatus)"	value="<%=""+QuoteStatus%>" />
<html:hidden property="answer(Object::Quote::ProductGroupVerId)"	value="<%=""+groupVerId%>" />
<html:hidden property="answer(Object::Quote::groupVerId)"	value="<%=""+groupVerId%>" />
<html:hidden property="answer(Object::Quote::productStatus)"	value="<%=""+productStatus%>" />
<html:hidden property="answer(Object::QuoteBilling::UpdatedBy)"	value="<%=""+userName%>" />
<html:hidden property="answer(ownerId)"	value="<%=""+ownerId%>" />
<html:hidden property="answer(Object::Quote::OwnerId)"	value="<%=""+ownerId%>" />
<html:hidden property="answer(userId)"	value="<%=""+userName%>" />
<html:hidden property="answer(Object::Agency::AgencyId)"	value="<%=""+agencyId%>" />
<html:hidden property="answer(QuoteId)"	value="<%=""+parentQuoteId%>" />
<html:hidden property="answer(parentQuoteId)"	value="<%=""+parentQuoteId%>" />
<html:hidden property="answer(Object::Quote::ParentQuoteId)"	value="<%=""+parentQuoteId%>" />
<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)"	value="<%=""+PrevSubQuoteVerId%>" />

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />

</html:form>
