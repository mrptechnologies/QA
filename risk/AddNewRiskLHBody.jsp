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

function confirmDelete(){
	
	var frm = document.forms[1];
	var count = 0;
	for(var i=0; frm.elements[i]!=null; i++) {
	
		if(frm.elements[i].type=="checkbox" && frm.elements[i].name == "answer(Object::Risk::ResProperty::LossHistory::LossHistoryId)" && frm.elements[i].checked == true) {
			count++;
			break;
		}
	}
	if(count>0) {
		var ans = window.confirm('Are you sure that you want to delete the selected records?');
		if (ans)
			return true;
		else
			return false;
	} else {
		alert("Please select a record to delete.");
		return false;
	}
}

	function validateFields(){
	 	var formElement=document.forms[0];
	 	
	 	var LossMM1=isInteger(formElement.LossMonth.value);
		var LossDD1=isInteger(formElement.LossDate.value);
		var LossYY1=isInteger(formElement.LossYear.value);
		
		var LossMM=formElement.LossMonth.value;
		var LossDD=formElement.LossDate.value;
		var LossYY=formElement.LossYear.value;

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
		
		/*if(formElement.addLossType.value == "") {
			alert("Please enter the LossType");
			return false;
		}*/

		if(formElement.addLossCause.value == "") {
			alert("Please enter the Loss Description");
			return false;
		}
		
		/*if(formElement.addInsCompanyName.value == "") {
			alert("Please enter the Loss InsCompanyName");
			return false;
		}*/
		
		if(formElement.addAmountPaidReceived.value == "") {
			alert("Please enter the AmountPaid/Reserved");
			return false;
		} else {
		
			if(!isAmount(formElement.addAmountPaidReceived.value)) {
				alert("Please enter the valid AmountPaid/Reserved ");
				return false;
			}
		}
		return newchecksubmitcount();
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


<bean:define id="riskId" name="lossHistoryInfo" property="answer(Object::Risk::ResPropertyId)" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="customerId" name="lossHistoryInfo" property="answer(Object::Customer::CustomerId)" />
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="lossHistoryInfo"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="insuredState" property="answer(Object::Customer::State)" name="AddCustomer" scope="session" />

<INPUT type="hidden" name="answer(Object::Risk::ResProperty::OwnerId)" value="5"/>
<INPUT type="hidden" name="answer(dbname)" value="java:/jdbc/allrisks"/>
<INPUT type="hidden" name="answer(Object::Risk::ResProperty::LossHistory::Active)" value="Y"/>
<INPUT type="hidden" name="ownerId" value="5"/>


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
				<table width="760px" align="Left" border="0" >
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
				<a href="/GetList.do?answer(TabPanelName)=Insured_Panel&answer(Object::Customer::CustomerId)=<bean:write name="lossHistoryInfo" property="answer(Object::Customer::CustomerId)" />&answer(Object::Agency::AgencyId)=<%=id.toString()%>" title="Click to go to Show All Risks" />Risks</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="../AllQuotes.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::State)=<%=insuredState.toString()%>"
							title="Click to go to Quotes"/>Quotes</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		
		<tr>
			<td height="15"></td>
		</tr>
		
		<tr>
			<td width="100%" align="center" class="sectionhead">
				LOSS HISTORY DETAILS
			</td>
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
		<tr>
			<td class="FormLabels" align="left" height="25" width="100%">To provide you with final rating for this group we need the following information.</td>
		</tr>
		
		<tr><td>&nbsp;</td></tr>
		<tr><td  colspan="8" align="center" class="sectionhead"></td></tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td>
				<html:form action="/AddResProLossHistoryAction.do" scope="session" onsubmit="return validateFields()">
					<table width="100%" align="left" border="0" CELLSPACING="1"	CELLPADDING="2">
					
						<tr>
							<td class="FormLabels" align="left" height="25" width="25%">Date<br>(MM/DD/YYYY)*</td>
							<td class="FormLabels" align="left" height="25" width="20%">Type Of Loss</td>
							<td class="FormLabels" align="left" height="5" width="25%">Description*</td>
							<td class="FormLabels" align="left" height="25" width="30%">Insurance Company Name</td>
							<td class="FormLabels" align="left" height="25" width="25%">Amount Paid/Reserved*</td>
						</tr>
		
						<tr>
						
							<td class="links">
								<html:text  property ="answer(Loss::Month)" value="" size="2" maxlength="2" styleClass="txtbox" styleId="LossMonth" onkeyup="if(this.value.length==2) {document.forms[0].LossDate.focus()}" />/
								<html:text  property ="answer(Loss::Date)" value="" size="2" maxlength="2" styleClass="txtbox"  styleId="LossDate" onkeyup="if(this.value.length==2) {document.forms[0].LossYear.focus()}" />/
								<html:text  property ="answer(Loss::Year)" value=""	 size="4" maxlength="4" styleClass="txtbox" styleId="LossYear" onkeyup="if(this.value.length==4) {document.forms[0].addLossType.focus()}" />&nbsp;
							</td>
													
							<td class="links">
								<html:text property="answer(Object::Risk::ResProperty::LossHistory::LossType)" size="20" maxlength="20" styleClass="txtbox" styleId="addLossType" value="" />
							</td>
		
							<td class="links">
								<html:text property="answer(Object::Risk::ResProperty::LossHistory::LossCause)" size="27" maxlength="60" styleClass="txtbox" styleId="addLossCause" value="" />
							</td>
							
							<td class="links">
								<html:text property="answer(Object::Risk::ResProperty::LossHistory::InsCompanyName)" size="32" maxlength="60" styleClass="txtbox" styleId="addInsCompanyName" value="" />
							</td>
							
							<td class="links">
								<html:text property="answer(Object::Risk::ResProperty::LossHistory::AmountPaidReceived)" size="11" maxlength="10" styleId="addAmountPaidReceived" styleClass="txtbox" value="" />
							</td>

						</tr>
						<tr>
							<td>
								<html:hidden value="<%= riskId.toString() %>" property="answer(Object::Risk::ResPropertyId)"/>
								<html:hidden property="answer(Object::Risk::ResProperty::LossHistory::Active)" value="Y" />
								<html:hidden property="answer(Object::Risk::ResProperty::LossHistory::CreatedBy)" value="<%=usernameId.toString()%>" />
								<html:hidden property="answer(Object::Risk::ResProperty::LossHistory::UpdatedBy)" value="<%=usernameId.toString()%>" />
								<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString() %>" />
								<html:hidden property="answer(Object::Agency::AgencyId)" value="<%= id.toString() %>"/>
								<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
							</td>

						</tr>
						
				  		<tr>
							<td colspan="9" height="8px"></td>
						</tr>
						
						<tr>
							<td colspan="4">&nbsp;</td>
							<td align="right" colspan="2">
								<html:submit value="Add" styleClass="sbttn" property="answer(submit)" />&nbsp;
							</td>
						</tr>
					</table>
				</html:form>				
			</td>
		</tr>
		
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<html:form action="/DeleteLossHistoryAction.do">
							
					<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					    <tr>
							
							<td class="sectionhead" width="3%">Edit</td> 
			   				<td class="sectionhead" width="5%">Sl.No</td>		
							<td class="sectionhead" width="13%">Date</td>				    
						    <td class="sectionhead" width="15%">Type of Loss</td> 				    
						    <td class="sectionhead" width="15%">Description</td>				    
						    <td class="sectionhead" width="15%">Insurance Company Name</td> 				    
						    <td class="sectionhead" width="10%">Amt Paid/Reserved</td>
						    <td class="sectionhead"  width="5%">Select</td>			    
					   </tr>

						<logic:present name='getListOfLossHistory' scope="request">		
							<% int i=0; %>
							<% int count=0; %>
					
										 
							<logic:iterate id="getListOfLossHistory" name="getListOfLossHistory" scope="request">
							<% count++; %>
								<tr>
									<td class="SearchResult" align="left" width="160px"> 
										<a href="/EditLossHistory.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResProperty::LossHistory::LossHistoryId)=<bean:write name='getListOfLossHistory' property='Object::Risk::ResProperty::LossHistory::LossHistoryId'/>&answer(Object::Risk::ResPropertyId)=<%= riskId.toString() %>&answer(Object::Customer::CustomerId)=<bean:write name="lossHistoryInfo" property="answer(Object::Customer::CustomerId)" />&answer(Object::Agency::AgencyId)=<%=id.toString()%>">
										<IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT=""></a>
									</td>
									
									<td class="SearchResult" align="left" width="160px">
										<a href="/EditLossHistory.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResProperty::LossHistory::LossHistoryId)=<bean:write name='getListOfLossHistory' property='Object::Risk::ResProperty::LossHistory::LossHistoryId'/>&answer(Object::Risk::ResPropertyId)=<%= riskId.toString() %>&answer(Object::Customer::CustomerId)=<bean:write name="lossHistoryInfo" property="answer(Object::Customer::CustomerId)" />&answer(Object::Agency::AgencyId)=<%=id.toString()%>">
											<%=++i%>
										 </a>
									</td>
							
									<td class="SearchResult" align="left" width="180px">
										<bean:write name="getListOfLossHistory" property="Object::Risk::ResProperty::LossHistory::LossDate" />&nbsp;
									</td>
									
									<td class="SearchResult" align="left" width="160px">
										<bean:write name="getListOfLossHistory" property="Object::Risk::ResProperty::LossHistory::LossType" />&nbsp;
									</td>
									
									<td class="SearchResult" align="left" width="160px">
										<bean:write name="getListOfLossHistory" property="Object::Risk::ResProperty::LossHistory::LossCause" />&nbsp;
									</td>
									
									<td class="SearchResult" align="left" width="160px">
										<bean:write name="getListOfLossHistory" property="Object::Risk::ResProperty::LossHistory::InsCompanyName" />&nbsp;
									</td>
									
									<td class="SearchResult" align="left" width="160px">
										<bean:write name="getListOfLossHistory" property="Object::Risk::ResProperty::LossHistory::AmountPaidReceived" />&nbsp;
									</td>				
																	
									<td class="SearchResult" align="left" width="160px">
										<bean:define id='deleteLossHistory' name="getListOfLossHistory" property="Object::Risk::ResProperty::LossHistory::LossHistoryId" />
											<html:checkbox property="answer(Object::Risk::ResProperty::LossHistory::LossHistoryId)" value="<%=""+deleteLossHistory%>" styleId="<%="riskLossHistoryCheckBox"+count%>" />
									</td>	
								</tr>							
				  		</logic:iterate>
				  					
					  		<tr>
									<td colspan="9" height="8px"></td>
							</tr>
							
							<tr>
								<TD>
									<html:hidden value="<%= riskId.toString() %>" property="answer(Object::Risk::ResPropertyId)"/>
									<html:hidden property="answer(Object::Risk::ResProperty::LossHistory::Active)" value="Y" />
									<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString() %>" />
									<html:hidden property="answer(Object::Risk::ResProperty::LossHistory::CreatedBy)" value="<%=usernameId.toString()%>" />
									<html:hidden property="answer(Object::Agency::AgencyId)" value="<%= id.toString() %>"/>
									<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
								</TD>
							</tr>	
							<tr>
								<td colspan="9" align="right">
									<table border="0" cellpadding="3" align="right">
										<tr>
											<td align="right">
												<html:submit value="Delete Selected" styleClass="sbttn" onclick="return confirmDelete()"/>
											</td>
										</tr>
									</table>
								</td>
							</t>		
				  		</table>
				 	</logic:present>
				</html:form>
			</td>
		</tr>
</table>
