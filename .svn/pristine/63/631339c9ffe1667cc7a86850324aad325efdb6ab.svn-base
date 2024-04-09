<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript">
function confirmDelete(){	
	var frm = document.forms[0];
	var count = 0;
	var elementCount = 0;
	for(var i=0; frm.elements[i]!=null; i++) {
	
		if(frm.elements[i].name == "answer(Object::Quote::Location::RiskId)" && frm.elements[i].checked == true) {
		
			count++;
			
		}
		if(frm.elements[i].name == "answer(Object::Quote::Location::RiskId)") {
		
			elementCount++;
			
		}
		
	}
	if(count == elementCount){
	
		alert("Can not delete all the tanks.Atleast one tank must be present.");
		return false;
	}
	if(count>0) {
		var ans = window.confirm('Are you sure that you want to delete the selected tanks?');
		if (ans)
			return true;
		else
			return false;
	} else {
		alert("Please select a tank to delete.");
		return false;
	}
}

function confirmAdd(){	
	var frm = document.forms[1];
	var count = 0;
	for(var i=0; frm.elements[i]!=null; i++) {
	
		if(frm.elements[i].name == "answer(Object::Quote::Location::RiskId)" && frm.elements[i].checked == true) {
			count++;
			break;
		}
	}
	if(count>0) {
		var ans = window.confirm('Are you sure that you want to add the selected tanks?');
		if (ans)
			return true;
		else
			return false;
	} else {
		alert("Please select a tank to add.");
		return false;
	}
}
</script>

<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="parentQuoteVerId" name="EndorsementDetail" property="answer(ParentQuoteVerId)" scope="request"/>
<bean:define id="subQuoteId" name="EndorsementDetail" property="answer(subQuoteId)" scope="request"/>

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
<bean:define id="FamilyId" name="EndorsementDetail" property="answer(FamilyId)" scope="request"/>
<bean:define id="subQuoteVerId" name="EndorsementDetail" property="answer(subQuoteVerId)" scope="request"/>

<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />

<%	String isRenewal = "";
	if(request.getParameter("isRenewal") != null) {
		isRenewal = request.getParameter("isRenewal"); 
	}
%>

<%String IsApplicationDisabled = "N"; %>

	<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
	<%IsApplicationDisabled = "Y";%>
	</dmshtml:dms_isPresent>
<%String paretQuoteStatus1 = ""+paretQuoteStatus; %>
<%if(paretQuoteStatus1.equals("")){
	
	IsApplicationDisabled = "Y";
}%>

<table width="100%">
	
	<tr>
		<td align="center" colspan="2">
			<table width="100%" align="center" border="0" bgcolor="#C6DEEA">
				<tr>
					<td>
					<div id="QuoteInsuerdAgencyAgentHeader">
						<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
						<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
						</jsp:include>
					</div>
				</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" colspan=2>
			<table width="100%" align="center" border="0" >
			<%if(isRenewal.equals("true")){ %>
				<tr>
					<td class="NewSectionHead" align="center">RENEWAL DETAIL</td>
				</tr>
			<%} else { %>
				<tr>
					<td class="NewSectionHead" align="center">ENDORSEMENT DETAIL</td>
				</tr>
			<%} %>
			</table>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" >
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td>
				<%if(isRenewal.equals("true")){ %>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
					</jsp:include>
				<%} else { %>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
					</jsp:include>
				<%} %>
				</td>
			</tr>
			<tr>
			<td align="center">
				<jsp:include page="../common/EndorsementQuoteHeader.jsp">
					<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
					<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
				</jsp:include>
			</td>
		</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td class="links">
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
		</td>
	</tr>
	
			
					<tr>
				<td>	
				<html:form action="/DeleteEndorsementEILTank.do" scope="request">
				<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
				<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
					<tr>
						<td>
							<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=&APP_TAB_TYPE=<%="YUI" %>&answer(Object::Location::LocationName)=NULL&answer(SelectedRiskType)=&answer(Object::Location::LocationId)=-1&answer(PrimaryKey_Object::Location::LocationId)=-1&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(OwnerId)=<%=ownerId+"" %>&isRenewal=<%="" + isRenewal %>" id="Add_Locations" /><html:button styleClass="linkButton" property="answer(addLocations)" value="Add Locations" onclick="window.location=document.getElementById('Add_Locations')"/></a>
							
						</td>
					
					</tr>
					</dmshtml:dms_isPresent>
					<logic:notPresent name='tankListListArray'>
						<logic:notPresent name='ArrOfInCompRiskQmap'>						
							<tr>
								<td valign="top">
									<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td height="20px" colspan="9" class="MH" style="{color:red;}">
												
													No Locations Found
												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</logic:notPresent>
					</logic:notPresent>
					
					<% int commonCount = 0; %>
					
					<logic:present name="tankListListArray">
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr><td class="SearchResult" align="left">To add or modify a tank at an existing location select the appropriate location below</td></tr>
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr><td colspan="10" class="sectionhead" align="left">&nbsp; Associated Tanks List</td></tr>	
					</table>
					<table width="100%">			
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td class="sectionhead" width="3%" align="center">
								Edit
							</td>
							<td class="sectionhead" width="5%">
								Tank Name
							</td>
							<td class="sectionhead" width="8%" align="center">
								Location Number
							</td>
							<td class="sectionhead" width="7%" align="center">
								Location Name
							</td>	
							
						
						
							<td class="sectionhead" width="5%">
								City
							</td>
							
							
							<td class="sectionhead" width="5%">
								State
							</td>
							
							<td class="sectionhead" width="5%">
								Country
							</td>
						<%if(IsApplicationDisabled.toString().equals("Y")) {%>
							<td class="sectionhead" width="5%">
								Delete
							</td>
						<%} %>
						</tr>
					
						<% int i=0; %>
		  				<%int count=0;%>   
					
						<logic:iterate id="tankListListArray" name="tankListListArray" >
							<%++count;%>
							<%++commonCount;%>
							
						
							
							<tr>
								<td>
								
								</td>
							</tr>								
							<tr>
								<td class="SearchResult" align="center">								
									<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(subQuoteVerId)=<%=""+subQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="tankListListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="tankListListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="tankListListArray" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="tankListListArray" property="Object::Quote::Location::LocationId" />&answer(Object::Location::LocationName)=<bean:write name="tankListListArray" property="Object::Quote::Location::LocationName" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(OwnerId)=<%=ownerId+"" %>" /><IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT="Completed Risk"></a>
								</td>
								<td class="SearchResult">
									<bean:write name="tankListListArray" property="Object::Quote::Location::RiskName" />&nbsp;
								</td>
								<td class="SearchResult" align="center">
									<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(IsApplicationDisabled)=<%="" %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="tankListListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="tankListListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="tankListListArray" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="tankListListArray" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Location::LocationName)=<bean:write name="tankListListArray" property="Object::Quote::Location::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="tankListListArray" property="Object::Quote::Location::LocationNumber" /></a>

									<%++i;%>
								</td>
							
								<td class="SearchResult" align="center">
									
											
									<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="tankListListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="tankListListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="tankListListArray" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="tankListListArray" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Location::LocationName)=<bean:write name="tankListListArray" property="Object::Quote::Location::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="tankListListArray" property="Object::Quote::Location::LocationName" /></a>
									&nbsp;
									
								</td>
								
								<td class="SearchResult">
									<bean:write name="tankListListArray" property="Object::Quote::Location::LocationCity" />&nbsp;
								</td>
								
								
								<td class="SearchResult">
									<bean:write name="tankListListArray" property="Object::Quote::Location::LocationState" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="tankListListArray" property="Object::Quote::Location::Country" />&nbsp;
								</td>
								<%if(IsApplicationDisabled.toString().equals("Y")) {%>
								<td class="SearchResult">
								<bean:define name="tankListListArray" property="Object::Quote::Location::LocationId" id="locId1"/>
								<bean:define name="tankListListArray" property="Object::Quote::Location::RiskId" id="riskId"/>
									<html:checkbox property="answer(Object::Quote::Location::RiskId)" value="<%= riskId.toString() %>" styleId='<%="deleteQuote"+count%>' />								 	
								</td>
								<%} %> 
							</tr>
						</logic:iterate>
					</logic:present>	
					<logic:present name="tankListListArray">
					<tr>
						<%if(IsApplicationDisabled.toString().equals("Y")) {%>
							<td align="right">
								<html:submit value="Delete Selected" property="answer(button)" styleClass="sbttn" onclick="return confirmDelete()" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							</td>
						<%} %>
					</tr>	
					</logic:present>			
					</td></tr>

	</table>		<html:hidden name="EndorsementDetail" property="answer(formName)" value="DeleteRisk" />	
					<html:hidden name="EndorsementDetail" property="answer(quoteId)" value="<%=parentQuoteId.toString()%>" />
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
					<html:hidden property="answer(Object::Quote::EndorsementModified)" value="<%="Y"%>" />	
					<html:hidden property="answer(subQuoteId)" value="<%=""+subQuoteId%>" />	
					<html:hidden property="answer(Object::Activity::ActivityMsg)" value='<%="Deleted Location through Endorsement"%>' />
					<html:hidden property="answer(isUpdated)" value="Y" />
				<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::ActivityType)" value='<%="Location/Tank - Add/Remove"%>' />
				<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(pagename)" value="Schedule of Tanks" />
		
				
	<%-- Endorsement Detail END --%>
	
			</html:form>
		</td>
	</tr>
	<tr>
		<td>
			&nbsp;&nbsp;
		</td>
	</tr>	
			<tr>
				<td>	
				<html:form action="/DeleteEndorsementEILTank.do" scope="request">
				<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
					
					<logic:notPresent name='nonAssociatedLocationListArray'>
						<logic:notPresent name='ArrOfInCompRiskQmap'>						
							<tr>
								<td valign="top">
									
										<tr>
											<td height="10px" colspan="19" class="MH" style="{color:red;}">
												
													No Non-Associated Tanks Found
												
											</td>
										</tr>
									
								</td>
							</tr>
						</logic:notPresent>
					</logic:notPresent>
					
					<% int commonCount = 0; %>
					
					<logic:present name="nonAssociatedLocationListArray">
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>	
						<tr><td colspan="10" class="sectionhead" align="left">&nbsp;Non-Associated Tanks List</td></tr>				
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						</table>
						<table width="100%">
						<tr>
							<td class="sectionhead" width="3%" align="center">
								<!-- Edit  -->
							</td>
							<td class="sectionhead" width="5%">
								Tank Name
							</td>
							<td class="sectionhead" width="8%" align="center">
								Location Number
							</td>
							<td class="sectionhead" width="7%" align="center">
								Location Name
							</td>	
							
						
						
							<td class="sectionhead" width="5%">
								City
							</td>
							
							<td class="sectionhead" width="5%">
								State
							</td>
							
							<td class="sectionhead" width="5%">
								Country
							</td>
						<%if(IsApplicationDisabled.toString().equals("Y")) {%>
							<td class="sectionhead" width="5%">
								Add
							</td>
						<%} %>
						</tr>
					
						<% int i=0; %>
		  				<%int count=0;%>   
					
						<logic:iterate id="nonAssociatedLocationListArray" name="nonAssociatedLocationListArray" >
							<%++count;%>
							<%++commonCount;%>
							
						
							
							<tr>
								<td>
								
								</td>
							</tr>								
							<tr>
								<td class="SearchResult" align="center">								
								</td>
								<td class="SearchResult">
									<bean:write name="nonAssociatedLocationListArray" property="Object::Quote::Location::RiskName" />&nbsp;
								</td>
								<td class="SearchResult" align="center">
									<bean:write name="nonAssociatedLocationListArray" property="Object::Quote::Location::LocationNumber" />
									<%++i;%>
								</td>
								<td class="SearchResult" align="center">
									<bean:write name="nonAssociatedLocationListArray" property="Object::Quote::Location::LocationName" />
									&nbsp;
									
								</td>
								
								<td class="SearchResult">
									<bean:write name="nonAssociatedLocationListArray" property="Object::Quote::Location::LocationCity" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="nonAssociatedLocationListArray" property="Object::Quote::Location::LocationState" />&nbsp;
								</td>
								
								
								<td class="SearchResult">
									<bean:write name="nonAssociatedLocationListArray" property="Object::Quote::Location::Country" />&nbsp;
								</td>
								<%if(IsApplicationDisabled.toString().equals("Y")) {%>
								<td class="SearchResult">
								<bean:define name="nonAssociatedLocationListArray" property="Object::Quote::Location::LocationId" id="locId1"/>
								<bean:define name="nonAssociatedLocationListArray" property="Object::Quote::Location::RiskId" id="riskId1"/>
								
									<html:checkbox property="answer(Object::Quote::Location::RiskId)" value="<%= riskId1.toString() %>" styleId='<%="AddQuote"+count%>' />								 	
								</td>
								<%} %> 
							</tr>
						</logic:iterate>
					</logic:present>	
					<logic:present name="nonAssociatedLocationListArray">
					<tr>
						<%if(IsApplicationDisabled.toString().equals("Y")) {%>
							<td align="right">
								<html:submit value="Add Selected" property="answer(button)" styleClass="sbttn" onclick="return confirmAdd()" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							</td>
						<%} %>
					</tr>		
					</logic:present>		
					</td></tr>
					
					<tr><td>&nbsp;<br></td></tr>
					
					<tr>
					<td>
						
							<% int commonCount1 = 0; %>
					
					<logic:present name="AssociatedLocationListWithOutTanks">
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>	
						<tr><td colspan="10" class="sectionhead" align="left">&nbsp; Associated Locations List With No Tanks</td></tr>				
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td class="sectionhead" width="3%" align="center">
								Edit
							</td>
							<td class="sectionhead" width="8%" align="center">
								Location Number
							</td>
							<td class="sectionhead" width="7%" align="center">
								Location Name
							</td>	
							
						
						
							<td class="sectionhead" width="5%">
								City
							</td>
							
							
							<td class="sectionhead" width="5%">
								State
							</td>
							
							<td class="sectionhead" width="5%">
								Country
							</td>
						</tr>
					
						<% int i=0; %>
		  				<%int count=0;%>   
					
						<logic:iterate id="AssociatedLocationListWithOutTanks" name="AssociatedLocationListWithOutTanks" >
							<%++count;%>
							<%++commonCount1;%>
							
						
							
							<tr>
								<td>
								
								</td>
							</tr>								
							<tr>
								<td class="SearchResult" align="center">								
									<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="AssociatedLocationListWithOutTanks" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="AssociatedLocationListWithOutTanks" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Location::LocationName)=<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT="Completed Risk"></a>
								</td>

								<td class="SearchResult" align="center">
									<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(IsApplicationDisabled)=<%="" %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="AssociatedLocationListWithOutTanks" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="AssociatedLocationListWithOutTanks" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Location::LocationName)=<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationNumber" /></a>
									<%++i;%>
								</td>
								<td class="SearchResult" align="center">
									<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="AssociatedLocationListWithOutTanks" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="AssociatedLocationListWithOutTanks" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Location::LocationName)=<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationName" />	</a>
									&nbsp;
									
								</td>
								
								<td class="SearchResult">
									<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationCity" />&nbsp;
								</td>
								
								
								<td class="SearchResult">
									<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::LocationState" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="AssociatedLocationListWithOutTanks" property="Object::Quote::Location::Country" />&nbsp;
								</td>
							</tr>
						</logic:iterate>
					</logic:present>						
					</td>
					</tr>
								
					
					
	</table>		<html:hidden name="EndorsementDetail" property="answer(formName)" value="AddRisk" />	
					<html:hidden name="EndorsementDetail" property="answer(quoteId)" value="<%=parentQuoteId.toString()%>" />
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
					<html:hidden property="answer(Object::Activity::ActivityMsg)" value='<%="Added Location through Endorsement"%>' />
					<html:hidden property="answer(isUpdated)" value="Y" />
				<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::ActivityType)" value='<%="Location/Tank - Add/Remove"%>' />
				<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(pagename)" value="Schedule of Tanks" />
		
					<html:hidden property="answer(Object::Quote::EndorsementModified)" value="<%="Y"%>" />	
					<html:hidden property="answer(subQuoteId)" value="<%=""+subQuoteId%>" />	
	<%-- Endorsement Detail END --%>
	
	</html:form>
	</td>
	</tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<script type="text/javascript">
	var a = document.getElementById('priorpolicyheadernav');
	if((a != null) && (a != undefined))
		a.id = 'policyheadernav';
</script>


