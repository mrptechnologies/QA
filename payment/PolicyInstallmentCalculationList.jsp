<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<%int count = 0; 
	String bgcolor ="#C6DEEA"; 	
	String InstallmentDescKey = "answer(Object::PolicyBilling::InstallmentDesc_" ;
	String DueDateKey = "answer(Object::PolicyBilling::DueDate_";
	String InstallmentPremiumKey = "answer(Object::PolicyBilling::InstallmentPremium_";
	String PaymentStatusKey = "answer(Object::PolicyBilling::PaymentStatus_";
	String InstallmentFeeKey = "answer(Object::PolicyBilling::InstallmentFee_";
	String TotalInstallmentPremiumKey = "answer(Object::PolicyBilling::TotalInstallmentPremium_" ;%>
		
	<logic:present name="ArrInstallmentPremiumDetail" scope="request">
			
	<table bgcolor="<%=bgcolor%>">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="FormLabels" align="center" width="3%">SL No</td>
		 	<td class="FormLabels" align="center" width="15%">Installment Description</td>
		<td class="FormLabels" align="center" width="15%">Due Date (MM/DD/YYYY)</td>
		<td class="FormLabels" align="center" width="15%">Payment Status </td>
		<td class="FormLabels" align="center" width="15%">Installment
		Premium Amount</td>
		<td class="FormLabels" align="center" width="15%">Installment
		Fee</td>
		<td class="FormLabels" align="center" width="15%">Total
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
	String PaymentStatus = PaymentStatusKey+count+")";
	String InstallmentFee = InstallmentFeeKey+count+")";
	String TotalInstallmentPremium = TotalInstallmentPremiumKey+count+")";%>
	<% 		
	String styleClass="TextMatter1";
	
	%>

	<tr>
		<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>

		<td width="15%" align="center"  class=<%= styleClass %>>
		<bean:define id="installmentDesc" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentDesc" />
		<html:text   property='<%= ""+InstallmentDesc%>' value='<%= ""+installmentDesc%>' styleId="InstallmentDesc" size="15" maxlength="40" styleClass="txtbox" />
		</td>

		<td width="15%" align="center" class=<%= styleClass %>>
		<bean:define id="dueDate" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::DueDate" />
		<html:text  onblur="return validateFields();"  property='<%=""+DueDate%>'  value='<%=""+dueDate%>' styleId="DueDate" size="15" maxlength="15" styleClass="txtbox" />
		</td>
		
		<td width="15%" align="center" class=<%= styleClass %>>
		<bean:define id="paymentStatus" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::PaymentStatus" />
		<html:text  property='<%=""+PaymentStatus%>'  value='<%=""+paymentStatus%>' styleId="PaymentStatus" size="15" maxlength="15" styleClass="txtbox" />
		</td>
		
		<td width="15%" align="center"  class=<%= styleClass %>>
		<bean:define id="installmentPremium" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentPremium" />
		$<html:text  style="text-align: right" property='<%=""+InstallmentPremium %>' value='<%=""+installmentPremium %>' styleId="InstallmentPremium" size="15" maxlength="15" styleClass="txtbox" />
		</td>

		<td width="15%" align="center" class=<%= styleClass %>>
		<bean:define id="installmentFee" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentFee" />
		$<html:text  onblur="return validate();"  style="text-align: right"	property='<%=""+InstallmentFee%>' value='<%=""+installmentFee%>'  styleId="InstallmentFee" size="15" maxlength="15" styleClass="txtbox" />
		</td>

		<td width="15%" align="center" class=<%= styleClass %>>
		<bean:define id="totalInstallmentPremium" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentPremium" />
		$<html:text disabled="true" style="text-align: right" property='<%=""+TotalInstallmentPremium %>' value='<%=""+totalInstallmentPremium %>' styleId="TotalInstallmentPremium" size="15" maxlength="15" styleClass="txtbox" />
		</td>
	</tr>
		</logic:iterate>
		
		</dmshtml:dms_static_with_connector>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="false">							
		
	<logic:iterate id="arrInstallmentPremiumDetail"	name="ArrInstallmentPremiumDetail">
	<% count++; 
	String InstallmentDesc = InstallmentDescKey+count+")";
	String DueDate = DueDateKey+count+")";
	String InstallmentPremium = InstallmentPremiumKey+count+")";
	String InstallmentFee = InstallmentFeeKey+count+")";
	String TotalInstallmentPremium = TotalInstallmentPremiumKey+count+")";%>
	<% 		
	String styleClass="TextMatter1";
	
	%>

	<tr>
		<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>

		<td width="15%" align="center"  class=<%= styleClass %>>
		<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentDesc" />
		</td>

		<td width="15%" align="center" class=<%= styleClass %>>
		<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::DueDate" />
		</td>
		
		<td width="15%" align="center" class=<%= styleClass %>>
		<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::PaymentStatus" />
		</td>
		
		<td width="15%" align="center"  class=<%= styleClass %>>
		<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentPremium" />
		</td>

		<td width="15%" align="center" class=<%= styleClass %>>
		<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentFee" />
		</td>

		<td width="15%" align="center" class=<%= styleClass %>>
		<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentPremium" />
		</td>
	</tr>
	 </logic:iterate>
</dmshtml:dms_static_with_connector>


<tr>
	<td>&nbsp;</td>
</tr>

<tr>

		<td width="3%" align="center" ></td>
	<td width="15%" align="center" class="FormLabels"></td>
	<td width="15%" align="center" class="FormLabels"></td>
		<td width="15%" align="center" class="FormLabels">Total</td>
		<td width="15%" align="center" class="TextMatter" >
	<bean:define id="TotalInstallmentPayment" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentPayment" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	$<html:text disabled="true" style="text-align: right" property="Object::PolicyBilling::TotalInstallmentPayment" value='<%=""+TotalInstallmentPayment %>' styleId="TotalInstallmentPayment" size="15" maxlength="15" styleClass="txtbox" />
	<!-- <dmshtml:CurrencyFormatTag  format="<%=""+TotalInstallmentPayment%>"/> -->
	</td>

	<html:hidden property="answer(Object::Policy::TotalPremium)" styleId="TotalPremium" value="<%=""+TotalInstallmentPayment%>" />					
						
	<td width="15%" align="center" class="TextMatter" >
	<bean:define  id="TotalInstallmentFee" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentFee" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	$<html:text disabled="true" style="text-align: right" property="Object::PolicyBilling::TotalInstallmentFee" value='<%=""+TotalInstallmentFee %>' styleId="TotalInstallmentFee" size="15" maxlength="15" styleClass="txtbox" />
	<!-- <dmshtml:CurrencyFormatTag  format="<%=""+TotalInstallmentFee%>"/> -->
	</td>


	<td width="15%" align="center" class="TextMatter" >
	<bean:define  id="TotalInstallmentAmount" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentAmount" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	$<html:text disabled="true" style="text-align: right" property="Object::PolicyBilling::TotalInstallmentAmount" value='<%=""+TotalInstallmentAmount %>' styleId="TotalInstallmentAmount" size="15" maxlength="15" styleClass="txtbox" />
	<!-- <dmshtml:CurrencyFormatTag   format="<%=""+TotalInstallmentAmount%>"/> -->
	</td>

</tr>
	
			  

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="true">													  

<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td align="center" ><html:submit value="Save" styleClass="sbttn"
		onmouseover="this.style.color='#FF0D25';"
		onmouseout="this.style.color='#0042B0';" 
		styleId="BillingSubmit" />
	</td>
	<td align="left">	
		    <html:reset value="Reset" styleClass="sbttn"
		onmouseover="this.style.color='#FF0D25';"
		onmouseout="this.style.color='#0042B0';" />
	</td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
	</table>
	</dmshtml:dms_static_with_connector>
	<html:hidden property="answer(Object::Quote::InstallmentCount)" styleId="Count" value="<%=""+count%>" />
</logic:present>
