<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/ReBilling.do" >
<html:hidden property="answer(dbname)" value='<%=org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DMS.dbname",null)%>'/>



			<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td align="center" class="Error">	
					<bean:define id="SubmitQuoteid" property="answer(Object::Billing::Quoteid)" name="Billing"> </bean:define>
					<%
					long Policyid=0;
	       			long PolicyVerid=0;
					String billingDetails[]=(""+SubmitQuoteid).split("::");
	       			String quoteId=billingDetails[0];
	       			String policyNumber=billingDetails[1];
	       			String endorsementNo=billingDetails[2];
	       			Policyid=Long.parseLong(billingDetails[3]);
	       			PolicyVerid=Long.parseLong(billingDetails[4]);
	       			String Endrscd=billingDetails[5];
	       			String policySubNumber=billingDetails[6];
	       			long billingLogId=Long.parseLong(billingDetails[7]);
	       			
					%>
							<tr>
								<!-- <td class="Textmatter">QuoteId:<%=""+quoteId%>&nbsp;</td> -->
							</tr>
							<tr>
								<td class="sectionhead">POLICY NUMBER:<%=""+policyNumber%>&nbsp;</td>
								<%if(Integer.parseInt(policySubNumber)>0){ %>
								<td class="sectionhead"> For Policy SubNumber :<%=""+policySubNumber%>&nbsp;</td>
							<%}%>
							</tr>
							<%if(Integer.parseInt(endorsementNo)>0){ %>
							<tr>
								<td class="Textmatter"> For Endorsement :<%=""+endorsementNo%>&nbsp;</td>
							</tr>
							<%}%>
							
							
							<tr>
								<td>&nbsp;</td>
							</tr>									
							<tr>
								<td class="TextMatter" align="center">															
									Are you Sure, Confirm Re Billing ?
								</td>														
							
																						
									<td class="TextMatter" align="center">															
							
								</td>														
							
							</tr>
							<tr><td>&nbsp;</td>
							</tr>
							<tr>
								<td class="TextMatter" align="right">																	
									<input type="radio" name="answer(Object::Billing::ConfirmYes)" value="Yes" id="confirmYES"  onclick="ReSubmitYes()">&nbsp;Yes 
									<input type="radio" name="answer(Object::Billing::ConfirmYes)" value="No" checked="checked" id="confirmNO" onclick="ReSubmitNo()">&nbsp;No 
								</td>												
							<tr>	
					
					
					<tr>
					<td align="center">
						<input TYPE="Submit" value="RE BILLING" class="sbttn" id="ReSubmit" disabled="true">
						<input TYPE="Button" value="BACK" class="sbttn" id="Back" onclick="window.history.go(-1)" >
					</td>
					<td>
						<html:hidden property="answer(Object::Billing::Quoteid)" value="<%=""+billingDetails[0]%>"/>
						<html:hidden property="answer(Object::Billing::PolicyNumber)" value="<%=""+billingDetails[1]%>"/>
						<html:hidden property="answer(Object::Billing::Edsno)" value="<%=""+billingDetails[2]%>"/>
						<html:hidden property="answer(Object::Billing::Policyid)" value="<%=""+billingDetails[3]%>"/>
						<html:hidden property="answer(Object::Billing::PolicyVerid)" value="<%=""+billingDetails[4]%>"/>
						<html:hidden property="answer(Object::Billing::Endrscd)" value="<%=""+Endrscd%>"/>
					</td> 
						
					</tr>
					<tr>
					<td>
					
						<html:hidden property="answer(Object::Billing::Quoteid)" value="<%=""+billingDetails[0]%>"/>
						<html:hidden property="answer(Object::Billing::PolicyNumber)" value="<%=""+policyNumber%>"/>
						<html:hidden property="answer(Object::Billing::Edsno)" value="<%=""+endorsementNo%>"/>
						<html:hidden property="answer(Object::Billing::Policyid)" value="<%=""+Policyid%>"/>
						<html:hidden property="answer(Object::Billing::PolicyVerid)" value="<%=""+PolicyVerid%>"/>
						<html:hidden property="answer(Object::Billing::Endrscd)" value="<%=""+Endrscd%>"/>
						<html:hidden property="answer(Object::Billing::BillingLogId)" value="<%=""+billingLogId%>"/>
					
					
					</td>
					</tr>
					
			</table>
			
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />								
</html:form>
<script type="text/javascript">
	ReSubmitYes(frm,document);	
	function ReSubmitYes() {	
		document.getElementById("ReSubmit").disabled = false;	
		}
		function ReSubmitNo() {	
		document.getElementById("ReSubmit").disabled = true;	
		}
	
		function Back(){
		window.history.go(-1);
		}
		
</script>