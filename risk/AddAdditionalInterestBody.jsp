<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT SRC="../Scripts/JScripts/Common.js" type="text/javascript"></SCRIPT>
<script type="text/javascript"><!--

function confirmDelete(){
	
	var frm = document.forms[1];
	var count = 0;
	for(var i=0; frm.elements[i]!=null; i++) {
	
		if(frm.elements[i].type=="checkbox" && frm.elements[i].name == "answer(Object::Risk::ResProperty::AdditionalInterest::AdditionalInterestId)" && frm.elements[i].checked == true) {
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
	function validateDelete(form)
	{
		var formElement=document.forms[0];		
		var found_it = false;
		for (var i=0; i < formElement.elements.length; ++i) {
			// Get the current field
			form_field = formElement.elements[i];			
			// Get the field's id			
			form_element_id = formElement.elements[i].id;			
			// Is it a check box field?
			if (form_element_id.indexOf("addlInterestArray")!=-1) {	
				if (form_field.checked)
				{					
					found_it = true;
				    break;
				}
			}
		}			
		if(!found_it)
		{
			alert("Please select the additional Interest to delete.");			
			return false;
		}	
		
		return true;
	}

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
		return newchecksubmitcount();
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

--></script>


<INPUT name="answer(Object::UserDetail::ownerId)" type=hidden value="5"/>
<INPUT name="answer(dbname)" type=hidden value="java:/jdbc/allrisks"/>
<bean:define id="AddlRiskId" property="answer(Object::Risk::ResPropertyId)" name="AddlIntRiskId" /> 
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddlIntRiskId"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="customerId" property="answer(Object::Customer::CustomerId)" name="AddlIntRiskId" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="insuredState" property="answer(Object::Customer::State)" name="AddCustomer" scope="session" />


		<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<!-- *********** Table for General ************ -->
						<table width="100%" align="Left" border="0" bgcolor="#C6DEEA">
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
							<td height="8px"></td>
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
				    	<table width="100%" align="Left" border="0" >
				     		<tr>
				      			<td>
				      
				       				<jsp:include page="../common/RiskHeader.jsp">
				        				<jsp:param name="parentRiskId" value="<%=""+AddlRiskId%>" />
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
						<table width="100%" align="left" border="0">
							<tr>	
								<!-- ********** href to be entered *********** -->					
									<td class="links" width="20%"><a href="/GetList.do?answer(TabPanelName)=Insured_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>" title="Click to go to Show All Risks" />Risks</a></td>
									<td class="links" width="20%"><a href="../AllQuotes.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::State)=<%=insuredState.toString()%>"
							title="Click to go to Quotes" />Quotes</a></td>
							</tr>
									
							<tr><td>&nbsp;</td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" class="sectionhead">ADDITIONAL INTERESTS DETAILS</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td>
						<table width="100%" align="left" border="0">
							<tr>				
								<td class="links" width="20%"><a href="/EditRisk.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResProperty::ResPropertyId)=<%= AddlRiskId.toString() %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>" title="Click to go to Show All Risks" />Property Details</a></td>
								<td class="links" width="20%"><a href="/AddOrEditRiskLHInfo.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResPropertyId)=<%= AddlRiskId.toString() %>&answer(Object::Customer::CustomerId)=<%= customerId.toString() %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>" />Add/Edit Loss History</a></td>
							</tr>
						</table>
					</td>
				</tr>
					
				<tr><td>&nbsp;</td></tr>
				<logic:notPresent name='addlInterestArray'>
				<tr>
					<td valign="top">
						<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td height="20px" colspan="9" class="MH" style="{color:red;}">
									<logic:equal name="SEARCH_COUNT" scope="request" value="0">
										Your Search Returned No Records.
									</logic:equal>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				</logic:notPresent>
				
				<!-- ********************************* End Before Text Boxes ******************************************** -->

				<tr>
					<td>
						<html:form action="/AddAdditionalInterest.do" scope="request" focus="coName" onsubmit="return validateFields(this)">
						<table width="100%" align="center" border="0">						
							<tr>
								<td class="FormLabels" align="left" height="25" width="15%">Additional Interest</td>
								<td class="FormLabels" align="left" height="25" width="20%">Name*</td>								
								<td class="FormLabels" align="left" height="25" width="15%">Loan Number</td>
								<td class="FormLabels" align="left" height="25" width="20%">Address1</td>
								<td class="FormLabels" align="left" height="25" width="20%">Address2</td>
								<td class="FormLabels" align="left" height="25" width="20%">City</td>
								<td class="FormLabels" align="left" height="25" width="20%">State</td>
								<td class="FormLabels" align="left" height="25" width="15%">Zip Code</td>
							</tr>
							<tr>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::AdditionalInterest::InterestType)" styleClass="txtbox" value="Mortage" styleId="comboGender">
										<html:option value="Mortgagee">Mortgagee</html:option>
										<html:option value="Loss Payee">Loss Payee</html:option>
										<html:option value="Others">Others</html:option>
									</html:select>
								</td>
								<td>
									<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::InterestCompanyName)" size="15" maxlength="60" styleId="coName" styleClass="txtbox" value="" />
								</td>
								<td>
									<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::LoanNumber)" size="10" maxlength="20" styleId="loanNum" styleClass="txtbox" value="" />
								</td>
								<td>
									<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::Address1)" size="15" maxlength="30"  styleClass="txtbox" value="" />
								</td>
								<td>
									<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::Address2)" size="15" maxlength="30" styleClass="txtbox" value="" />
								</td>
								<td>
									<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::City)" size="10" maxlength="20" styleClass="txtbox" value="" />
								</td>
																			
								<td ><dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="5" dbname="java:/jdbc/allrisks"/>
									<html:select property="answer(Object::Risk::ResProperty::AdditionalInterest::State)" styleId="comboGender" value="" styleClass="txtbox">
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
								<td>
									<html:text property="answer(Object::Risk::ResProperty::AdditionalInterest::Zip)" size="10" maxlength="20" styleId="zipCode" styleClass="txtbox" value="" />
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>								
							</tr>
							<tr>
								<td>
								<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
									<html:hidden value="<%= AddlRiskId.toString() %>" property="answer(Object::Risk::ResPropertyId)" />
									<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::CreatedBy)" value="<%= usernameId.toString() %>" />
        							<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::UpdatedBy)" value="<%= usernameId.toString() %>" />
        							<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString() %>" />
        							<html:hidden property="answer(Object::Agency::AgencyId)" value="<%= id.toString() %>"/>
								</td>
							</tr>
							
							<tr>						
								<td colspan="6">&nbsp;</td>
								 <td align="right" colspan="2">
									<html:submit value="ADD" styleClass="sbttn" property="answer(submit)" />&nbsp;
								</td>
							</tr>
						</table>
						</html:form>
					</td>
				</tr>
	
		<tr><td>
		<table width="100%" align="center" border="0">
		<html:form action="/DeleteAdditionalInterest.do" scope="session">		
			<tr>
				<td class="sectionhead" align="left" height="25" width="5%">Edit</td>
				<td class="sectionhead" align="left" height="25" width="5%">Sl.No.</td>		
				<td class="sectionhead" align="left" height="25" width="15%">Additional Interest</td>								
				<td class="sectionhead" align="left" height="25" width="20%">Name</td>								
				<td class="sectionhead" align="left" height="25" width="10%">Loan Number</td>
				<td class="sectionhead" align="left" height="25" width="20%">Address1</td>
				<td class="sectionhead" align="left" height="25" width="20%">Address2</td>
				<td class="sectionhead" align="left" height="25" width="15%">City</td>
				<td class=sectionhead align="left" height="25" width="15%">State</td>
				<td class="sectionhead" align="left" height="25" width="15%">Zip Code</td>
				<td class="sectionhead" align="left" height="25" width="5%">Select</td>
			</tr>
				<logic:present name='addlInterestArray'>
				<% int i=0; %>
				<%int count=0;%>					
							
				<logic:iterate id="addlInterestArray" name="addlInterestArray">
				<%count++;%>
					<tr>
						<td class="SearchResult"><a href="../EditAdditionalInterest.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResProperty::AdditionalInterest::AdditionalInterestId)=<bean:write name='addlInterestArray' property='Object::Risk::ResProperty::AdditionalInterest::AdditionalInterestId'/>&answer(Object::Risk::ResPropertyId)=<%= AddlRiskId.toString() %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::CustomerId)=<%= customerId.toString() %>">													
						<IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT=""></a>
				  		</td>
				  					  		
				  		<td class="SearchResult"><a href="../EditAdditionalInterest.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResProperty::AdditionalInterest::AdditionalInterestId)=<bean:write name='addlInterestArray' property='Object::Risk::ResProperty::AdditionalInterest::AdditionalInterestId'/>&answer(Object::Risk::ResPropertyId)=<%= AddlRiskId.toString() %>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::CustomerId)=<%= customerId.toString() %>">
				  		<%=++i%></a>
				  		</td>
				  		<td class="SearchResult">
				   			<bean:write name="addlInterestArray" property="Object::Risk::ResProperty::AdditionalInterest::InterestType" />&nbsp;
				  		</td>
				  		<td class="SearchResult">
				   			<bean:write name="addlInterestArray" property="Object::Risk::ResProperty::AdditionalInterest::InterestCompanyName" />&nbsp;
				  		</td>
				  		<td class="SearchResult">
				   			<bean:write name="addlInterestArray" property="Object::Risk::ResProperty::AdditionalInterest::LoanNumber" />&nbsp;
				  		</td>
				  		<td class="SearchResult">
				   			<bean:write name="addlInterestArray" property="Object::Risk::ResProperty::AdditionalInterest::Address1" />&nbsp;
				  		</td>
				  		<td class="SearchResult">
				   			<bean:write name="addlInterestArray" property="Object::Risk::ResProperty::AdditionalInterest::Address2" />&nbsp;
				  		</td>
				  		<td class="SearchResult">
				   			<bean:write name="addlInterestArray" property="Object::Risk::ResProperty::AdditionalInterest::City" />&nbsp;
				  		</td>
				  		<td class="SearchResult">
				   			<bean:write name="addlInterestArray" property="Object::Risk::ResProperty::AdditionalInterest::State" />&nbsp;
				  		</td>
				  		<td class="SearchResult">
				   			<bean:write name="addlInterestArray" property="Object::Risk::ResProperty::AdditionalInterest::Zip" />&nbsp;
				  		</td>
				  		<td class="SearchResult">			  			
						 	<bean:define id="addlId" name="addlInterestArray" property="Object::Risk::ResProperty::AdditionalInterest::AdditionalInterestId" />
	     					<html:checkbox property="answer(Object::Risk::ResProperty::AdditionalInterest::AdditionalInterestId)" name="addlInterestArray" styleId="<%="addlInterestArray"+count%>" value="<%= addlId.toString() %>" />
	     					
	      				</td>
				  		
				 	</tr>
				</logic:iterate>
				
				<tr>
					<td colspan="9" height="8px"></td>
				</tr>
				<tr>
					<td>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
						<html:hidden value="<%= AddlRiskId.toString() %>" property="answer(Object::Risk::ResPropertyId)" />
						<html:hidden property="answer(Object::Agency::AgencyId)" value="<%= id.toString() %>"/>
						<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::CreatedBy)" value="<%= usernameId.toString() %>" />
	    				<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::UpdatedBy)" value="<%= usernameId.toString() %>" />
	    				<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString() %>" />	    			
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
		<table width="100%" align="center" border="0">
				<tr>
					<td colspan="9" align="center">
						<table width="23%" border="0" cellpadding="3" align="right">
							<tr>
								<td>   
									<html:submit value="Delete Selected" onclick="return confirmDelete()" styleClass="sbttn"/>&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</logic:present>
		</html:form>
		</table>
		</td>
		</tr>
	</table>