<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="com.dms.ejb.common.DMSDetail"%>
<bean:define id="policyId" name="PolicySummary" property="answer(policyId)" />
<bean:define id="policyVerId" name="PolicySummary" property="answer(policyVerId)"  />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="policyNumber" name="PolicySummary" property="answer(policyNumber)" />
<%com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("PaymentInfoMap"); %>
<%
com.dms.ejb.common.DMSDetail dmsDetail = new com.dms.ejb.common.DMSDetail(); 
String paymentMethod = qMap.getString("Object::PolicyBilling::PaymentMethod");
String paymentDesc = qMap.getString("Object::PolicyBilling::PaymentDesc");
String PaymentDate = qMap.getString("Object::PolicyBilling::PaymentDate");
String PaymentAmount = dmsDetail.currencyFormat(Double.parseDouble(qMap.getString("Object::PolicyBilling::PaymentAmount")));
String RemittanceDate = qMap.getString("Object::PolicyBilling::RemittanceDate");
String Partial_Full = qMap.getString("Object::PolicyBilling::Partial_Full");
String CheckNumber = qMap.getString("Object::PolicyBilling::CheckNumber");
String RefferenceNumber = qMap.getString("Object::PolicyBilling::RefferenceNumber");
String Notes = qMap.getString("Object::PolicyBilling::Notes");
String AccountingPeriod = qMap.getString("Object::PolicyBilling::AccountingPeriod");
String PaymentId = qMap.getString("Object::PolicyBilling::PaymentId");
String TransactionType = qMap.getString("Object::PolicyBilling::TransactionType");
String associatedInvoiceNumber = qMap.getString("Object::PolicyBilling::AssociatedInvoiceNumber");
String isActivePolicy = "";
if(request.getParameter("answer(isActivePolicy)") != null){	
	isActivePolicy=request.getParameter("answer(isActivePolicy)");
}
String bgcolor ="";
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
<bean:define id="ProductVerId" name="PolicySummary" property="answer(productVerId)" />
<form name="paymentTransactionFrm2" action="/UpdateBillingPaymentTransactionAction.go" onsubmit="return paymentEditTransactionSubmit(this)" method="post">
<table  width="60%" bgcolor ="<%=""+bgcolor%>" >	
						 							<tr>
										<td class="FormLabels" style="color: blue;font-style: italic;font-weight: bold; ">Payment Transaction</td>
									</tr>
									
						 						
						 			<tr>
										
										
										<html:hidden property="answer(Object::Policy::ParentPolicyId)" value=""/>
										
									</tr>
									
									
									<tr>
										<td class="FormLabels" align="center" width="20%">Transaction Type</td>
											
										<td align="left" width="40%" >
										<dmshtml:get_Payment_Types nameInSession="arrPaymentTypes" productVerId="<%=""+ProductVerId %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
									
										<logic:present name="arrPaymentTypes">
												<%
														java.util.ArrayList PaymentType = (java.util.ArrayList)request.getAttribute("arrPaymentTypes");
														for(int paymentTypeIndex = 0 ; paymentTypeIndex < PaymentType.size() ; paymentTypeIndex++) {
															com.dms.ejb.data.QuestionHashMap qMap1 = (com.dms.ejb.data.QuestionHashMap) PaymentType.get(paymentTypeIndex);
															if(qMap1.getString("Object::QuoteBilling::PaymentTypeDesc").equalsIgnoreCase("Payment")){
															if(paymentMethod.equalsIgnoreCase("Payment")){%>
															
															<input type="radio" name="answer(Object::PolicyBilling::PaymentTypeDetail)" checked="checked" value='<%=qMap1.getString("Object::QuoteBilling::PrdPaymentTypeId")+"::"+qMap1.getString("Object::QuoteBilling::PaymentTypeDesc")%>' id='<%=qMap1.getString("Object::QuoteBilling::PaymentTypeDesc")+"1"%>' onclick="javascript:setPaymentFields1(this.value);"  /><%=qMap1.getString("Object::QuoteBilling::PaymentTypeDesc") %>
															<%}else{ %>
															<input type="radio" name="answer(Object::PolicyBilling::PaymentTypeDetail)"  value='<%=qMap1.getString("Object::QuoteBilling::PrdPaymentTypeId")+"::"+qMap1.getString("Object::QuoteBilling::PaymentTypeDesc")%>' id='<%=qMap1.getString("Object::QuoteBilling::PaymentTypeDesc")+"1"%>' onclick="javascript:setPaymentFields1(this.value);"  /><%=qMap1.getString("Object::QuoteBilling::PaymentTypeDesc") %>									
															<%} %>
															<% }else{ 
															if(paymentMethod.equalsIgnoreCase("Credit")){%>
																<input type="radio" name="answer(Object::PolicyBilling::PaymentTypeDetail)" checked="checked" value='<%=qMap1.getString("Object::QuoteBilling::PrdPaymentTypeId")+"::"+qMap1.getString("Object::QuoteBilling::PaymentTypeDesc")%>' id='<%=qMap1.getString("Object::QuoteBilling::PaymentTypeDesc")+"1"%>' onclick="javascript:setPaymentFields1(this.value);"  /><%=qMap1.getString("Object::QuoteBilling::PaymentTypeDesc") %>
															<%}else{%>
															<input type="radio" name="answer(Object::PolicyBilling::PaymentTypeDetail)" value='<%=qMap1.getString("Object::QuoteBilling::PrdPaymentTypeId")+"::"+qMap1.getString("Object::QuoteBilling::PaymentTypeDesc")%>' id='<%=qMap1.getString("Object::QuoteBilling::PaymentTypeDesc")+"1"%>' onclick="javascript:setPaymentFields1(this.value);"  /><%=qMap1.getString("Object::QuoteBilling::PaymentTypeDesc") %>
					
																<%}
																}
															} %>
										</logic:present>
				  						</td>
									</tr>
									<tr id="RemittanceDateTr1">
										<td class="FormLabels" align="center" width="20%"><font style="padding-left:10pt;">Remittance Date (MM/DD/YYYY)</font></td>
										
										<td align="left" width="40%" >
										<div id="RemittanceDate2"></div>
											
										<html:hidden  style="text-align: left" property="answer(Object::PolicyBilling::RemittanceDate)" value='<%=""+RemittanceDate%>'  styleId="RemittanceDateEditHidden"  styleClass="txtbox" /></td>
									</tr>
									<tr id="PaymentDateTr1">
										<td class="FormLabels" align="center" width="20%"><font style="padding-left:10pt;">Payment Date (MM/DD/YYYY)</font></td>
										<td align="left" width="40%" >
										<div id="PaymentDate2"></div>
										<html:hidden  style="text-align: left" property="answer(Object::PolicyBilling::PaymentDate)" value='<%=""+PaymentDate %>'  styleId="PaymentDateEditHidden"  styleClass="txtbox" /></td>
									</tr>
									<tr id="RemittanceAmountTr1">
										<td class="FormLabels" align="center" width="20%"><font style="padding-left:10pt;">Payment Amount</font></td>
										<td align="left" width="40%" ><html:text property="answer(Object::PolicyBilling::PaymentAmount)" value='<%=""+PaymentAmount %>'  styleId="RemittanceAmount1" size="10" maxlength="10"  styleClass="txtboxrightalign" /></td>
									</tr>
									<tr id="PartialFullTr1">
										<td class="FormLabels" align="center" width="20%"><font style="padding-left:10pt;">Partial or Full Payment</font></td>
										<td align="left" width="40%" >
											<%if(Partial_Full.equalsIgnoreCase("Partial")){%>
												<input type="radio" name="answer(Object::PolicyBilling::Partial)"  value="Partial" id="Partial_Y1" checked="true" />Partial
												<input type="radio" name="answer(Object::PolicyBilling::Partial)"  value="Full" id="Partial_N1"  />Full&nbsp;&nbsp;				  	
											<%}else{%>
												<input type="radio" name="answer(Object::PolicyBilling::Partial)"  value="Partial" id="Partial_Y1"  />Partial
												<input type="radio" name="answer(Object::PolicyBilling::Partial)"  value="Full" id="Partial_N1"  checked="true"/>Full&nbsp;&nbsp;				  															
											<%}%>
										
										</td>
									</tr>
									<tr style="display: none" id="CreditDateTr1">
										<td class="FormLabels" align="center" width="20%"><font style="padding-left:10pt;">Credit Date (MM/DD/YYYY)</font></td>
										<td align="left" width="40%" >
										<div id="CreditDate2"></div>
										<html:hidden  style="text-align: left" property="answer(Object::PolicyBilling::Creditdate)" value='<%=""+PaymentDate %>' styleId="CreditDateEditHidden" styleClass="txtbox" />
										
										</td>
										
									</tr>
									<tr style="display: none" id="CreditAmountTr1">
										<td class="FormLabels" align="center" width="20%"><font style="padding-left:10pt;">Credit Amount</font></td>
										<td align="left" width="40%" ><html:text property="answer(Object::PolicyBilling::CreditAmount)" value='<%=""+PaymentAmount %>'  styleId="CreditAmount1" size="10" maxlength="10" styleClass="txtboxrightalign" /></td>
										
									</tr>
									<tr>
										<td class="FormLabels" align="center" width="20%">Check/ACH/Wire Number</td>
										<td align="left" width="40%" ><html:text  style="text-align: left" property="answer(Object::PolicyBilling::CheckNumber)" value='<%=""+CheckNumber %>' styleId="CheckNumber1" size="28" maxlength="28" styleClass="txtbox" /></td>
										
									</tr>
									<tr>
										<td class="FormLabels" align="center" width="20%">Associated to which Invoice Number(s)</td>
										<td align="left" width="40%" ><textarea  style="text-align: left" name="answer(Object::PolicyBilling::AssociatedInvoiceNumber)" styleId="CheckNumber1" rows="5" cols="25" styleClass="txtbox"><%=""+associatedInvoiceNumber %></textarea></td>
										
									</tr>
									
									<tr>
										<td class="FormLabels" align="center" width="20%">Period (Accounting Months)</td>
										<td align="left" width="40%" ><textarea  style="text-align: left" name="answer(Object::PolicyBilling::AccountingPeriod)" styleId="AccountingPeriod1" rows="5" cols="25" styleClass="txtbox" ><%=""+AccountingPeriod %></textarea></td>
										
									</tr>
									<tr>
										<td class="FormLabels" align="center" width="20%">Reference Number </td>
										<td align="left" width="40%" ><html:text  style="text-align: left" property="answer(Object::PolicyBilling::ReferenceNumber)" value='<%=""+RefferenceNumber %>'  styleId="ReferenceNumber1" size="28" maxlength="28" styleClass="txtbox" /></td>
										
									</tr>
									<tr>
										<td class="FormLabels" align="center" width="20%">Notes</td>
										<td align="left" width="40%" > 
										<textarea rows="5" cols="25" name="answer(Object::PolicyBilling::PaymentNotes)" ><%=""+Notes %></textarea>
										
										
									</tr>
									<html:hidden property="answer(policyId)" value="<%=""+policyId%>" />
						 	<html:hidden property="answer(policyVerId)" value="<%=""+policyVerId%>" />
						 	<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />
							<html:hidden property="answer(Object::Policy::Policyverid)" styleId="PolicyVerId" value="<%=""+policyVerId%>" />
							<html:hidden property="answer(Object::Policy::PolicyId)" styleId="policyId" value="<%=""+policyId%>" />
							<html:hidden property="answer(Object::PolicyBilling::CreatedBy)" styleId="CreatedBy" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::UpdatedBy)" styleId="UpdatedBy" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::Createdby)" styleId="Createdby" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyGroup::Updatedby)" styleId="Updatedby" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::IsVoid)" name="PolicySummary" styleId="isVoid" />
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
							<html:hidden property="answer(Object::PolicyBilling::PaymentId)" value="<%=""+PaymentId%>" styleId="PaymentIdHidden"/>
							<html:hidden property="answer(Object::PolicyBilling::PolicyId)" value="<%=""+policyId%>" />
							<html:hidden property="answer(activateTabId)" value="Payment" />
								</table>
								
								<table>
								<tr>
										<td align="center" width="20%" >
										&nbsp;
										</td>
								</tr>
							<%if (isActivePolicy.equals("Y")){ %>	
								<tr>
										<td align="center" width="20%" >
										<html:button styleClass="covsmallbutton" style="font-size:12.5px; width:100px;" property="answer(Object::PolicyBilling::TransactionType)" value="Delete" styleId="Delete1" onclick="javascript:deletePayment('delete');"/> 
										</td>
										<td align="center" width="20%" >
										<html:button styleClass="covsmallbutton" style="font-size:12.5px; width:100px;" property="answer(Object::PolicyBilling::TransactionType)" value="Void" styleId="Void1" onclick="javascript:deletePayment('void');"/> 
										</td>
										<td align="center" width="20%" >
										<html:submit styleClass="covsmallbutton" style="font-size:12.5px; width:100px;" property="answer(Object::PolicyBilling::TransactionType)" value="Save" styleId="Save1" /> 
										</td>
										<td align="center" width="20%" >
										<html:button styleClass="covsmallbutton" style="font-size:12.5px; width:200px;" property="answer(Object::PolicyBilling::TransactionType)" value="Return to Payment Log" styleId="ReturntopaymentLog1" onclick="confirmReturnPayment();" /> 
										</td>
								</tr>
							<%}%>		
									</table>
									
</form>