<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

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
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><html:submit value="Save" styleClass="sbttn"
								    onmouseover="this.style.color='#FF0D25';"
									onmouseout="this.style.color='#0042B0';" 
									styleId="BillingSubmit" />
								   <html:reset value="Reset" styleClass="sbttn"
										onmouseover="this.style.color='#FF0D25';"
										onmouseout="this.style.color='#0042B0';" /></td>
							</tr>
							 </dmshtml:dms_static_with_connector>
					     </table>
					     <html:hidden property="answer(Object::Quote::InstallmentCount)" styleId="Count"	value="<%=""+count%>" />
</logic:present>		