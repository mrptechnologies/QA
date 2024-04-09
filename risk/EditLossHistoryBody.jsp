<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddResPropertyRisk.js"> </SCRIPT>
<script type="text/javascript">
function isInteger(data)
{   
	var index;
	for (index = 0; index < data.length; index++)
    {   
        // Check that current character is number.
        var c = data.charAt(index);
        if (((c < "0") || (c > "9"))) {
      
       		if(c=="-") {
       			for(i=index+1;i < data.length;i++) {
       				
       				var e = data.charAt(i);
       				if (((e < "0") || (e > "9"))) {
       					return false;
       				}
       			}
       			break;
       			
       		} else {
  	 			return false;
  	 		}
       	 }
    }
    // All characters are numbers.
    return true;
}

	function validateFields(){
	 	var formElement=document.forms[0];
	 	
	 	var LossMM1=isInteger(formElement.LossMonth.value);
		var LossDD1=isInteger(formElement.LossDate.value);
		var LossYY1=isInteger(formElement.LossYear.value);
		
		if(!LossMM1){
			
			alert("Characters are not allowed in Date field");
			return false;		
		}
		if(!LossDD1){
			
			alert("Characters are not allowed in Date field");
			return false;		
		}
		if(!LossYY1){
			
			alert("Characters are not allowed in Date field");
			return false;		
		}
				
		if(formElement.LossMonth.value>12 || formElement.LossMonth.value==0) {
			alert("Please enter the valid Month in LossDate");
			return false;
		}
		 if(formElement.LossDate.value>31 || formElement.LossDate.value==0) {
			alert("Please enter the valid Date in LossDate");
			return false;
		}
		if(!validateLHyear(formElement.LossYear.value)) {
			alert("Please enter the valid Year in LossDate");
			return false;
		}
		
		if(formElement.addLossCause.value == "") {
			alert("Please enter the Loss Description");
			return false;
		}
		
		if(formElement.addAmountPaidReceived.value == "") {
			alert("Please enter the AmountPaid/Reserved ");
			return false;
		} else {
		
			if(!isAmount(formElement.addAmountPaidReceived.value)) {
				alert("Please enter the valid AmountPaid/Reserved ");
				return false;
			}
		} 
	}
	
function isAmount(data)
{   var index;
    for (index = 0; index < data.length; index++)
    {   
        // Check that current character is number.
        var c = data.charAt(index);
        if (((c < "0") || (c > "9"))) {
      
       		if(c==".") {
       			for(i=index+1;i < data.length;i++) {
       				
       				var e = data.charAt(i);
       				if (((e < "0") || (e > "9"))) {
       					return false;
       				}
       			}
       			break;
       			
       		} else {
  	 			return false;
  	 		}
       	 }
    }
    // All characters are numbers.
    return true;
}

</script>

<INPUT name="answer(Object::UserDetail::ownerId)" type=hidden value="5"/>
<INPUT name="answer(dbname)" type=hidden value="java:/jdbc/allrisks"/>
<INPUT name=ownerId type=hidden value="5"/>

<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="riskId" name="AddNewRiskLossHistory" property="answer(Object::Risk::ResPropertyId)" />
<bean:define id="customerId" name="AddNewRiskLossHistory" property="answer(Object::Customer::CustomerId)" />
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddNewRiskLossHistory"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="insuredState" property="answer(Object::Customer::State)" name="AddCustomer" scope="session" />
		
<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	
	<tr>
		<td><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td>
	</tr>
	
	<tr>
		<td height="15px"></td>
	</tr>
		
	
	<tr>
		<td class="NewSectionHead" align="center">ADD/EDIT RISK INFORMATION </td>
	</tr>

	<tr>
		<td height="15px"></td>
	</tr>
	
	<tr>
		<td>
			<table width="760px" align="Left" border="0">
				<tr>
					<td>
					
						<jsp:include page="../common/RiskHeader.jsp">
							<jsp:param name="parentRiskId" value="<%=""+riskId%>" />
							<jsp:param name="agencyId" value="<%=id.toString()%>" />
						</jsp:include>
						
					</td>
				</tr>
			</table>
		</td>
	</tr>
			
	<tr>
		<td height="10px"></td>
	</tr>

	<tr>		
		<td class="links" align="left">
			<a href="/GetList.do?answer(TabPanelName)=Insured_Panel&answer(Object::Customer::CustomerId)=<bean:write name="AddNewRiskLossHistory" property="answer(Object::Customer::CustomerId)" />&answer(Object::Agency::AgencyId)=<%=id.toString()%>" title="Click to go to Show All Risks" />Risks</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="../AllQuotes.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::State)=<%=insuredState.toString()%>"
							title="Click to go to Quotes"  />Quotes</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	
	<tr>
		<td height="15"></td>
	</tr>
	
	<tr>
		<td width="100%" align="center" class="sectionhead">LOSS HISTORY DETAILS</td>
	</tr>
	
	<tr>
		<td height="15"></td>
	</tr>

	<tr>
		<td class="links" align="left">
			<a href="/EditRisk.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResProperty::ResPropertyId)=<%= riskId.toString() %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>" title="Click to go to Show Property Details" />Property Details</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/ListAdditionalInterest.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResPropertyId)=<%= riskId.toString() %>&answer(Object::Customer::CustomerId)=<%= customerId.toString() %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>" title="Click to go to Additional Interests " />Add/Edit Additional Interest</a> 
		</td>
	</tr>

	<tr><td>&nbsp;</td></tr>
	
	<tr><td  colspan="8" align="center" class="sectionhead"></td></tr>
	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
	<html:form action="/AddResProLossHistoryAction.do" scope="session" onsubmit="return validateFields()">
	
		<logic:present name='getLossHistory'>
		
			<%
				com.dms.ejb.risk.resproperty.ResPropertyLossHistoryDetail lossHistoryDetail = new com.dms.ejb.risk.resproperty.ResPropertyLossHistoryDetail();
				
				lossHistoryDetail = (com.dms.ejb.risk.resproperty.ResPropertyLossHistoryDetail)request.getAttribute("getLossHistory");
				
				com.dms.ejb.common.DMSDetail dmsDetail = new com.dms.ejb.common.DMSDetail();
			
				String lossHistoryId = Long.toString(lossHistoryDetail.getLossHistoryId());
				String lossDate = lossHistoryDetail.getLossDate();
				String lossType = lossHistoryDetail.getLossType();
				String lossCause = lossHistoryDetail.getLossCause();
				String insCompanyName = lossHistoryDetail.getInsCompanyName();
				String amountPaidReceived = Double.toString(lossHistoryDetail.getAmountPaidReceived());	
				String createdBy = lossHistoryDetail.getCreatedBy();
			%>
		
			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td>
				
					<table width="100%" align="left" border="0" CELLSPACING="1"	CELLPADDING="2">
						<tr>
							<td class="FormLabels" align="left" height="25" width="15%">Date*</td>
							
							<td class="links">
							
									<%
										String LossDateStr = ""+lossDate;
										String arrOfLossDate[] = LossDateStr.split("/");
										String LossMonth = arrOfLossDate[0];
										String LossDateObj = arrOfLossDate[1];
										String LossYear = arrOfLossDate[2];
									%>
									
								<html:text  property ="answer(Loss::Month)" value="<%=""+LossMonth%>" size="2" maxlength="2" styleClass="txtbox" styleId="LossMonth" onkeyup="if(this.value.length==2) {document.forms[0].LossDate.focus()}" />/
								<html:text  property ="answer(Loss::Date)" value="<%=""+LossDateObj%>" size="2" maxlength="2" styleClass="txtbox"  styleId="LossDate" onkeyup="if(this.value.length==2) {document.forms[0].LossYear.focus()}" />/
								<html:text  property ="answer(Loss::Year)" value="<%=""+LossYear%>"	 size="4" maxlength="4" styleClass="txtbox" styleId="LossYear" />&nbsp;(MM/DD/YYYY)
								<html:hidden property="answer(Object::Risk::ResProperty::LossHistory::LossDate)" styleId="addLossDate" value="" />
							</td>
						</tr>
						
						<tr>
							<td class="FormLabels" align="left" height="20" width="20%">Type Of Loss</td>
							
							<td class="links">
								<html:text property="answer(Object::Risk::ResProperty::LossHistory::LossType)" size="20" maxlength="20" styleClass="txtbox" value="<%= lossType %>" styleId="addLossType" />
							</td>
						</tr>
						
						<tr>
							<td class="FormLabels" align="left" height="20" width="25%">Description*</td>
						
							<td class="links">
								<html:text property="answer(Object::Risk::ResProperty::LossHistory::LossCause)" size="30" maxlength="60" styleClass="txtbox" value="<%= lossCause %>" styleId="addLossCause" />
							</td>
						</tr>
						
						<tr>
							<td class="FormLabels" align="left" height="25" width="30%">Insurance Company Name</td>
			
							<td class="links">
								<html:text property="answer(Object::Risk::ResProperty::LossHistory::InsCompanyName)" size="30" maxlength="60" styleClass="txtbox" value="<%= insCompanyName %>"  styleId="addInsCompanyName"/>
							</td>
						</tr>
						
					<tr>
						<td class="FormLabels" align="left" height="25" width="25%">Amt Paid/Reserved*</td>
			
						<td class="links">
							<html:text property="answer(Object::Risk::ResProperty::LossHistory::AmountPaidReceived)" size="11" maxlength="15" styleClass="txtbox" value="<%= amountPaidReceived %>" styleId="addAmountPaidReceived"/>
						</td>
					</tr>
					
						
					<tr>
						<td height="15"></td>
					</tr>
					
					<tr>
						<td align="center">
							<html:submit value="Save" styleClass="sbttn" property="answer(submit)" />&nbsp;
						</td>

						<td align="left" colspan="2">
							<html:button value="Back" styleClass="sbttn" property="answer(back)" onclick="javascript:history.go(-1);" />&nbsp;
						</td>
					</tr>
										
					<tr>
						<TD>
							<html:hidden property="answer(Object::Risk::ResProperty::LossHistory::LossHistoryId)" value="<%= lossHistoryId %>" />
							<html:hidden property="answer(Object::Risk::ResProperty::LossHistory::Active)" value="Y" />
							<html:hidden property="answer(Object::Risk::ResProperty::LossHistory::CreatedBy)" value="<%=createdBy.toString()%>" />							
							<html:hidden property="answer(Object::Risk::ResProperty::LossHistory::UpdatedBy)" value="<%=usernameId.toString()%>" />	
							<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString() %>" />
							<html:hidden property="answer(Object::Agency::AgencyId)" value="<%= id.toString() %>"/>		
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />				
						 </TD>
					</tr>
					
					<tr>
						<td>
							<html:hidden value="<%= riskId.toString() %>" property="answer(Object::Risk::ResPropertyId)"/>
						</td>
					</tr>					
														
				</table>
			</td>
		</tr>
		</table>	
</logic:present>
</html:form>
</td>
</tr>
</table>
