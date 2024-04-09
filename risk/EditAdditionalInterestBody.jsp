<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<script type="text/javascript">

function validateFields(){
  		var formElement=document.forms[0];

 		if(formElement.coName.value == "") {
 			alert("Please enter the Addl. Interest Providing Company Name");
 			return false;
		} 	 
  		if(!isInteger(formElement.zipCode.value)) {
			alert("Please enter the valid Zip Code ");
			return false;
		}
 	}
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

</SCRIPT>
	
<INPUT name="answer(Object::UserDetail::ownerId)" type=hidden value="5"/>
<INPUT name="answer(dbname)" type=hidden value="java:/jdbc/allrisks"/>
<INPUT name=ownerId type=hidden value="5"/>
<bean:define id="riskId" name="AddlInterest" property="answer(Object::Risk::ResPropertyId)" />
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddlInterest"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="customerId" property="answer(Object::Customer::CustomerId)" name="AddlInterest" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="insuredState" property="answer(Object::Customer::State)" name="AddCustomer" scope="session" />

<html:form action="/AddAdditionalInterest.do" scope="session" focus="coName" onsubmit="return validateFields(this)  ">
						
		<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<!-- *********** Table for General ************ -->
						<table width="760px" align="Left" border="0" bgcolor="#C6DEEA">
							<tr>								
								<td>
									<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" align="left" border="0">
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td class="NewSectionHead" align="center">ADD/EDIT RISK INFORMATION</td>
						</tr>
						<tr>
							<td height="8px"></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<!-- ************** Table for Risk Informations ************** -->
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
						
				<tr><td>&nbsp;</td></tr>
				<tr>	
					<td>
						<table width="760px" align="left" border="0">
							<tr>					
							
								<!-- ********** href to be entered *********** -->					
									<td class="links" width="40%"><a href="/GetList.do?answer(TabPanelName)=Insured_Panel&answer(Object::Customer::CustomerId)=<%= customerId.toString() %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>" title="Click to go to Show All Risks" />Risks</a></td>
									<td class="links" width="40%"><a href="../AllQuotes.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::State)=<%=insuredState.toString()%>"
							title="Click to go to Quotes" />Quotes</a></td>
									<td class="links" width="40%">&nbsp;</td>
							</tr>
									
							<tr><td>&nbsp;</td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" align="left" border="0">
							<tr>
								<td colspan="2" align="center" class="sectionhead" width="100%">ADDITIONAL INTEREST DETAILS</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							
							<tr>					
								
								<!-- ********** href to be entered *********** -->					
									<td class="links" width="30%"><a href="/EditRisk.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResProperty::ResPropertyId)=<%= riskId.toString() %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>" title="Click to go to Risk details" />Property Details</a></td>	
									<td class="links" width="30%"><a href="/AddOrEditRiskLHInfo.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResPropertyId)=<%= riskId.toString() %>&answer(Object::Customer::CustomerId)=<%= customerId.toString() %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>" title="Click to go to Loss History" />Add/Edit Loss History</a></td>								
							</tr>
						</table>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>  
				<logic:present name='addlInterestDetail'>     
					<tr>
						<td>
							<table>
								<tr align="left">
									<td class="FormLabels" align="left" height="25" width="20%">Additional Interest</td>
									<td class="links">&nbsp;
										<html:select property="answer(Object::Risk::ResProperty::AdditionalInterest::InterestType)" styleClass="txtbox" styleId="comboGender">
											<html:option value="Mortgagee">Mortgagee</html:option>
											<html:option value="Loss Payee">Loss Payee</html:option>
											<html:option value="Others">Others</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left" height="25" width="20%">Name*</td>
									<td class="links">&nbsp; 										
										<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::InterestCompanyName)" size="20" maxlength="20" styleId="coName" styleClass="txtbox"/>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left" height="25" width="20%">Loan Number</td>
									<td class="links">&nbsp; 
										<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::LoanNumber)" size="20" maxlength="20" styleId="loanNum" styleClass="txtbox"/>
									</td>						
								</tr>
								<tr>
									<td class="FormLabels" align="left" height="25" width="20%">Address 1</td>
									<td class="links">&nbsp; 
										<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::Address1)" size="20" maxlength="30" styleClass="txtbox"/>
									</td>						
								</tr>
								<tr>
									<td class="FormLabels" align="left" height="25" width="20%">Address 2</td>
									<td class="links">&nbsp; 
										<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::Address2)" size="20" maxlength="30" styleClass="txtbox"/>
									</td>			
								</tr>
								<tr>
									<td class="FormLabels" align="left" height="25" width="20%">City</td>
									<td class="links">&nbsp; 
										<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::City)" size="20" maxlength="20" styleClass="txtbox"/>
									</td>						
								</tr>
								<tr>
									<td class="FormLabels" align="left" height="25" width="20%">State</td>
									<td class="links">&nbsp;<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="5" dbname="java:/jdbc/allrisks"/>
									<html:select property="answer(Object::Risk::ResProperty::AdditionalInterest::State)" styleClass="txtbox" styleId="comboGender">
									<html:option value ="">Select</html:option>
							        <logic:present name="arStates" scope="request">
							        	<logic:iterate id="details" name="arStates" scope="request" >
									    <bean:define id='test' name="details"  property="typeDesc" />
									    <html:option value ='<%=test.toString()%>'>
									       <bean:write name="details" property="dmsType" />
									    </html:option>
									</logic:iterate>
									</logic:present>
									</html:select>								
									</td>
												
								</tr>
								<tr>
									<td class="FormLabels" align="left" height="25" width="20%">Zip Code</td>
									<td class="links">&nbsp; 
										<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::Zip)" size="20" maxlength="20" styleId="zipCode" styleClass="txtbox"/>
									</td>						
								</tr>
								<tr>
									<td height="15"></td>
								</tr>
								<tr>
									<td>
										<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::AdditionalInterestId)" />
									</td>
								</tr>
								<tr>
									<td>
										<html:hidden property="answer(Object::Risk::ResPropertyId)" value="<%= riskId.toString() %>" />		
										<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::UpdatedBy)" value="<%= usernameId.toString() %>" />
										<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString() %>" />						
										<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
									</td>
								</tr>
								
								<tr>
									<td align="center" colspan="2">
										<html:submit value="Save" styleClass="sbttn" property="answer(submit)" />&nbsp;
									</td>
									
							
									<td align="left" colspan="2">
										<html:button value="Back" styleClass="sbttn" property="answer(back)" onclick="javascript:history.go(-1);"/>&nbsp;
									</td>								
								</tr>
							</table>
						</td>
					</tr>	
				</logic:present>
			</table>	
			
		</html:form>