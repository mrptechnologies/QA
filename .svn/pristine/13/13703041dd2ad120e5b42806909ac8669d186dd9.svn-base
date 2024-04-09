<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>


<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="EndorsementDetail" property="answer(productVerId)" scope="request"/>
<bean:define id="customerId" name="EndorsementDetail" property="answer(customerId)" scope="request"/>
<bean:define id="CustomerState" name="EndorsementDetail" property="answer(State)" scope="request"/>
<bean:define id="agencyId" name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" scope="request"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />

<table width="98%">
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
		<td align="left" colspan=2>
			<table width="100%" align="left" border="0" >
				<tr>
					<td class="NewSectionHead" align="center">ENDORSEMENT DETAIL</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr height="5">
		<td></td>
	</tr>
	<tr>
		<td colspan="2">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td>					
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
				      <jsp:param name="policyId" value="<%=parentPolicyId.toString()%>" />
				      <jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
				      <jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
				      <jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
				     </jsp:include>
				</td>
			</tr>		
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<%-- <tr>
				<td>
				<table width="60%" align="Left" border="0">
					<jsp:include page="../common/QuoteHeader.jsp">
						<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="productVerId" value="<%=""+productVerId%>" />
						<jsp:param name="heading" value="<%="ENDORSEMENT DETAIL"%>" />
					</jsp:include>
				</table>
				</td>
			</tr>--%>
		<tr>
			<td align="left">
				<jsp:include page="../common/EndorsementQuoteHeader.jsp">
					<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
				</jsp:include>
			</td>
		</tr>
			
		</table>
		</td>
	</tr>
	<tr>
		<td class="links">
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
		</td>
		<%--<td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td>--%>
	</tr>

	<tr>
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
	<div id="dolphincontainer">
		<div id="dolphinnav">
			<ul>
				<li>
					<a class="" rel="Selec Insured">
					<span>Select Insured</span></a></li>
				<li>
					<a class="" rel="Delete Insured">
					<span>Delete Insured</span></a></li>					
			</ul>
		</div>

		<div style="display:block;" id="Selec Insured" class="innercontent">
			<html:form action="/GetEndorsementDetailAction.go" styleId="firstForm" onsubmit="return dolphinTabDisplay()" >
				<%String InsuredType = "";%>
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2">
				<tr>					
					<td class="FormLabels" width="10%">Select</td>
					<td class="FormLabels" width="20%">Type</td>
					<td class="FormLabels" width="40%">Insured Name</td>
				</tr>
				<logic:present name="INSURED_LIST" scope="request">
				<bean:define id="insuredList" name="INSURED_LIST" type="java.util.ArrayList" scope="request"/>
				<% int count=0;
                   String selected="false"; 				
				%>
				<logic:iterate id="insuredDetail" name="insuredList" type="com.dms.ejb.data.QuestionHashMap">
				
				<bean:define id="IsModified" name="insuredDetail" property="Object::QuoteInsured::EndorsementModified"/>
				
				<bean:define id="insuredType" name="insuredDetail" property="Object::QuoteInsured::InsuredType"/>
				<%InsuredType = ""+insuredType;%>
				<bean:define id="quoteInsuredId" name="insuredDetail" property="Object::QuoteInsured::InsuredId"/>
					    
				<%if ((paretQuoteStatus.toString()).equalsIgnoreCase("Issued")){
					if ((IsModified.toString()).equalsIgnoreCase("N")){ %>
						<% count++; 
						if(count==1){
							selected="true";
						}
						else{
							selected="false";
						}
						%>
						
					    <tr>
					     <% if(InsuredType.equalsIgnoreCase("SECONDARY")){%>
					     <td class="TextMatter" width="10%">
					     
					      <input type="radio" name="answer(Object::QuoteInsured::InsuredId)" value="<%=""+quoteInsuredId %>" styleClass="txtbox" checked="<%=selected %>"></td>
					     <%}else{%>
					     <td class="TextMatter" width="10%">&nbsp;</td>
					     <%} %>					    
							<td class="TextMatter" width="20%">
								<bean:write name="insuredDetail" property="Object::QuoteInsured::InsuredType"/></td>
							<td class="TextMatter" width="40%">
								<bean:write name="insuredDetail" property="Object::QuoteInsured::InsuredFullName"/></td>
						</tr>
					<%}
				} else {%>
					<% count++; 
					if(count==1){
						selected="true";
					}
					else{
						selected="false";
					}
					%>
					
					<% 
						String styleClass="";
						if ((IsModified.toString()).equalsIgnoreCase("Y")){						     
							styleClass = "error";
						}
						else{
							styleClass = "TextMatter";	
						}
					%> 
						
				    <tr>
				     <% if(InsuredType.equalsIgnoreCase("SECONDARY")){%>				     	
				     	<td class=<%= styleClass %> width="10%">				     
					    	<input type="radio" name="answer(Object::QuoteInsured::InsuredId)" value="<%=""+quoteInsuredId %>" styleClass="txtbox" checked="<%=selected %>">
					    </td>
				     <%}else{%>
				     <td class=<%= styleClass %> width="10%">&nbsp;</td>
				     <%} %>	
				     				     
						<td class=<%= styleClass %> width="20%">							
							<bean:write name="insuredDetail" property="Object::QuoteInsured::InsuredType"/>							
						</td>
						<td class=<%= styleClass %>>							
							<bean:write name="insuredDetail" property="Object::QuoteInsured::InsuredFullName"/>							
						</td>
						<td <%= styleClass %>>
							<% if ((IsModified.toString()).equalsIgnoreCase("Y")){ %>						     
							 	<img src="../Images/recycle.gif" width='14' height='14' border='0' ALT='Deleted' align="left">							
						 	<%} %> 
						</td>						
					</tr>
					
				<%} %>	
				</logic:iterate>
				</logic:present>
				<% if(InsuredType.equalsIgnoreCase("SECONDARY")){%>
					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >				
							<tr>
								<td colspan="2" align="center">
									<input name="answer(SubmitType)" value="Select" class="sbttn" type="submit">
								</td>
							</tr>
					</dmshtml:dms_isPresent>
				<%}%>		
				</table>

				<input name="answer(Page::Action)" value="SELECT" type="hidden"/>
				<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(dolTabCheck)" styleId="dolTab"/>
				<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>"/>
				<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</html:form>	
		</div>
		
		<div style="display:none;" id="Delete Insured" class="innercontent">
			
			<html:form action="/SaveEndorsementDetailAction.go" styleId="Application1">
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2" >
					<tr>
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Named Insured*</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::InsuredFullName)" /></td>
								<bean:define id="isBillingAddressSame" name="EndorsementDetail" property="answer(Object::Customer::BillingAddressSame)" /> 
								<html:hidden name="EndorsementDetail" property ="answer(Object::Customer::BillingAddressSamehidden)" styleId="hidIsBillingSame" value="<%=isBillingAddressSame+"" %>"/>			
							</tr>							
			
							<tr>
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;DBA/TA</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::DBA)" /></td>
							</tr>

							 <tr>
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Form of Business</td>
								<td class="TextMatter1" width="40%">&nbsp;
								<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::Business)" />
								</td>
							</tr> 
							
							<tr>
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Description of Business</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::BusinessDesc)" /></td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Mailing Address Line1</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::StreetName)" /></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Mailing Address Line2</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::Address2)" /></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="AddCustomer.City" /></td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::City)" /></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;County Name</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::CountyName)" /></td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="AddCustomer.State"/>*</td>
							
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::State)" />
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Zip Code*</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::Zip)" />
								<!--Zipcode lookup start 05-06-2006-->								
								<!-- 05-06-2006 end-->																	
							</tr>
							
							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Is billing information same as above </td>				
								<td class="TextMatter1" width="40%">&nbsp;
									<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingAddressSame)" />
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Billing Address Line1</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingAddress1)" /></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Billing Address Line2</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingAddress2)" /></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="AddCustomer.City" /></td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingCity)" /></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;County Name</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingCounty)" /></td>
							</tr>
							
							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="AddCustomer.State"/></td>
							
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingState)" />
								</td>
							</tr>
							<tr>
							<html:hidden property="answer(InsType)" value="CL" styleId="InsType"/>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Zip Code</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::BillingZip)" />
								<!--Zipcode lookup start 05-06-2006-->								
								<!-- 05-06-2006 end-->																	
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Bill to Loan #</td>
								<td class="TextMatter1" width="40%">&nbsp;<bean:write name="EndorsementDetail" property="answer(Object::QuoteInsured::BilltoLoan)" /></td>
							</tr>

							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::InsuredFirstName)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::InsuredLastName)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::InsuredMiddleName)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::InsuredFullName)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::Address1)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::Address2)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::StreetName)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::StreetNumber)" />
							
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::City)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CountyName)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::State)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::Zip)" />
							<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::WorkPhone)" />
							
							<html:hidden property="answer(Object::QuoteInsured::QuoteInsuredId)" />
							<html:hidden property="answer(Object::QuoteInsured::Active)" value="Y"/>
							<html:hidden property="answer(Object::QuoteInsured::EndorsementModified)" value="Y"/>
							<html:hidden property="answer(Object::QuoteInsured::InsuredType)" />
							<html:hidden property="answer(Object::QuoteInsured::InsuredId)" />	
						<bean:define id="quoteInsuredId" property="answer(Object::QuoteInsured::QuoteInsuredId)" name="EndorsementDetail" />
						<%if(!quoteInsuredId.equals("")){%>
						<dmshtml:dms_isPresent property="<%=new String[]{"In Progress", "Submitted"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >				
						<tr>
							<td colspan="2" align="center">
								<input name="answer(SubmitType)" value="Delete" class="sbttn" type="submit"></td></tr>
						</dmshtml:dms_isPresent>
						<%}%>
						<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />

						<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>"/>
						<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />	
						<html:hidden name="EndorsementDetail" property="answer(OwnerId)" value="<%=ownerId.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::OwnerId)" value="<%=ownerId.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
						<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
						<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
				</table>
			</html:form>
		</div>
		
	</div>
	<%-- Endorsement Detail END --%>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<script type="text/javascript">
function dolphinTabDisplay()
{
	firstForm.dolTab.value="yes";	
}

if(firstForm.dolTab.value!="yes")
dolphintabs.init('dolphinnav',0)
else
dolphintabs.init('dolphinnav',1)
</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
