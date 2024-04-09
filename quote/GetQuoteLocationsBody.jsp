<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="subQuoteDetail" name="SUB_QUOTE_DETAIL" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>

<bean:define id="productId" name="subQuoteDetail" property="productId" />
<bean:define id="productVerId" name="subQuoteDetail" property="productVerId" />
<bean:define id="groupId" name="subQuoteDetail" property="productGroupId" />
<bean:define id="groupVerId" name="subQuoteDetail" property="productGroupVerId" />
<bean:define id="productStatus" name="subQuoteDetail" property="productStatus" />

<bean:define id="productFamilyId" name="AddQuote" property="answer(FamilyId)" />
<bean:define id="parentQuoteVerId" name="AddQuote" property="answer(parentQuoteVerId)" />
<bean:define id="IsApplicationDisabled" name="AddQuote" property="answer(IsApplicationDisabled)" />
<bean:define id="parentQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="paretLockStatus" name="AddQuote" property="answer(Object::Quote::LockStatus)" />

<bean:define id="CustomerState" name="AddQuote" property="answer(Object::Customer::State)" scope="request"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 

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

function confirmAdd(){
	
	var frm = document.forms[1];
	var count = 0;
	for(var i=0; frm.elements[i]!=null; i++) {
	
		if(frm.elements[i].name == "answer(Object::Location::LocationId)" && frm.elements[i].checked == true) {
			count++;
			break;
		}
	}
	if(count<=0) {
		alert("Please select a record to add.");
		return false;
	}
}

</script>



<%
	String compositeRate="";
	if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
		compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
	}
	
	String prevSubQuoteVerId="";
	if(request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)")!=null){
		prevSubQuoteVerId=request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)");
	}
	if(request.getParameter("answer(subQuoteVerId)")!=null){
		prevSubQuoteVerId=request.getParameter("answer(subQuoteVerId)");
	}
	String parentQuoteVerId1 = request.getParameter("answer(parentQuoteVerId)");
	
	String customerId = request.getParameter("answer(Object::Customer::CustomerId)");
	String subQuoteId = request.getParameter("answer(QuoteId)");
	String parentQuoteId = request.getParameter("answer(parentQuoteId)");
	String agencyId = request.getParameter("answer(Object::Agency::AgencyId)");
%>

	<table WIDTH="1200px" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">

		<tr><td>&nbsp;</td></tr>
		
		<tr>
		<td colspan="2" align="left">
			<table width="100%" border="0" align="left">
			<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >	
				<tr>
					<td align="left">
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</logic:notEqual>
			</table>
	  	</td>
 	 </tr>
 	<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
	<tr>
		<td>
			<table width="100%" align="Left" border="0">
				<jsp:include page="../common/QuoteHeader.jsp" >
				<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
				<jsp:param name="productVerId" value="<%=""+productVerId%>" />					
				<jsp:param name="heading" value="<%="Tanks LIST"%>" />
			</jsp:include>
			</table>
		</td>
	</tr>
	</logic:notEqual>
    <logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0">
				<jsp:include page="../common/QuotePlanInfoHeader.jsp" >
					<jsp:param name="subQuoteId" value="<%=""+subQuoteId%>" />	
					<jsp:param name="customerId" value="<%=""+customerId%>" />	
					<jsp:param name="productId" value="<%=""+productId%>" />	
					<jsp:param name="productVerId" value="<%=""+productVerId%>" />
					<jsp:param name="prdGroupId" value="<%=""+groupId%>" />	
					<jsp:param name="prdGroupVerId" value="<%=""+groupVerId%>" />
					<jsp:param name="productStatus" value="<%=""+productStatus%>" />
					<jsp:param name="stateCode" value="<%=""%>" />
				</jsp:include>
			</table>
		</td>
 	</tr>
 	</logic:notEqual>
 	 <tr>
   		 <td colspan="2" class="links" align="left" height="20" valign="middle">	
    		<a  href="../GetQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>">Quote Summary</a>
    	</td>
 	 </tr>
					<tr>
						<td>
							<table WIDTH="1000px" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
								
								
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								
								<tr>
									<td>
								
									</td>
								</tr>
								
							</table>
						</td>
					</tr>			
			<dmshtml:dms_isPresent negated="true" property="<%=new String[]{"In Progress","Referred"}%>" value="<%=parentQuoteStatus.toString()%>">														
			<tr>
			<td>
			<a href="../AddQuoteLocation.do?answer(TabPanelName)=Quote_Panel&answer(FamilyId)=<%=""+productFamilyId %>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(prdGroupId)=<%=""+groupId%>&answer(prdGroupVerId)=<%=""+groupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=&answer(Object::Location::LocationId)=-1&answer(PrimaryKey_Object::Location::LocationId)=-1&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(objectType)=<%="QUOTE_RISK" %>&answer(OwnerId)=<%=ownerId+"" %>" id="Add_Locations" /><html:button styleClass="linkButton" property="answer(addLocations)" value="Add Locations" onclick="window.location=document.getElementById('Add_Locations')"/> </a>
			</td>
			</tr>	
			</dmshtml:dms_isPresent>
			<tr>
				<td>	
				<html:form action="/DeleteQuoteEILTank.do" scope="request">
				<table WIDTH="985px" ALIGN="left" border="0"CELLSPACING="0" CELLPADDING="2">
					
					<logic:notPresent name='locationListArray'>
						<logic:notPresent name='ArrOfInCompRiskQmap'>						
							<tr>
								<td valign="top">
									<table width="1000px" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
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
					
					<logic:present name="locationListArray">

						<tr><td colspan="10">&nbsp;</td></tr>				
						
						<tr>
							<td class="sectionhead" width="3%" align="center">
								Edit
							</td>
							<td class="sectionhead" width="7%" align="center">
								Tank Name
							</td>
							<td class="sectionhead" width="7%" align="center">
								Tank #
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
						<%if(IsApplicationDisabled.toString().equals("N")) {%>
							<td class="sectionhead" width="5%">
								Delete
							</td>
						<%} %>
						</tr>
					
						<% int i=0; %>
		  				<%int count=0;%>   
					
						<logic:iterate id="locationListArray" name="locationListArray" >
							<%++count;%>
							<%++commonCount;%>
							
						
							
							<tr>
								<td>
								
								</td>
							</tr>								
							<tr>
								<td class="SearchResult" align="center">								
									<a href="../EditQuoteEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(Object::UserDetail::userName)=<%=""+userId %>&answer(FamilyId)=<%=""+productFamilyId %>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled %>&answer(prdGroupId)=<%=""+groupId%>&answer(prdGroupVerId)=<%=""+groupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(objectType)=<%="QUOTE_RISK" %>&answer(OwnerId)=<%=ownerId+"" %>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+prevSubQuoteVerId%>" /><IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT="Completed Risk"></a>
								</td>
								<td class="SearchResult">
								<a href="../EditQuoteEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(FamilyId)=<%=""+productFamilyId %>&answer(Object::UserDetail::userName)=<%=""+userId %>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled %>&answer(prdGroupId)=<%=""+groupId%>&answer(prdGroupVerId)=<%=""+groupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(PrimaryKey_Object::Location::Tanks::TankId)=<bean:write name="locationListArray" property="Object::Quote::Location::RiskId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(objectType)=<%="QUOTE_RISK" %>&answer(OwnerId)=<%=ownerId+"" %>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+prevSubQuoteVerId%>" /><bean:write name="locationListArray" property="Object::Quote::Location::RiskName" />&nbsp;</a>
								</td>
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Quote::Location::RiskNumber" />&nbsp;
								</td>
								
								<td class="SearchResult" align="center">
									<a href="../EditQuoteEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(FamilyId)=<%=""+productFamilyId %>&answer(Object::UserDetail::userName)=<%=""+userId %>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(prdGroupId)=<%=""+groupId%>&answer(prdGroupVerId)=<%=""+groupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(objectType)=<%="QUOTE_RISK" %>&answer(OwnerId)=<%=ownerId+"" %>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+prevSubQuoteVerId%>" /><bean:write name="locationListArray" property="Object::Quote::Location::LocationNumber" /></a>
									<%++i;%>
								</td>
								<td class="SearchResult" align="center">
									<a href="../EditQuoteEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(FamilyId)=<%=""+productFamilyId %>&answer(Object::UserDetail::userName)=<%=""+userId %>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(prdGroupId)=<%=""+groupId%>&answer(prdGroupVerId)=<%=""+groupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="locationListArray" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="locationListArray" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="locationListArray" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(objectType)=<%="QUOTE_RISK" %>&answer(OwnerId)=<%=ownerId+"" %>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+prevSubQuoteVerId%>" /><bean:write name="locationListArray" property="Object::Quote::Location::LocationName" /></a>
									&nbsp;
									
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Quote::Location::LocationCity" />&nbsp;
								</td>
								
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Quote::Location::LocationState" />&nbsp;
								</td>
								
								
								<td class="SearchResult">
									<bean:write name="locationListArray" property="Object::Quote::Location::Country" />&nbsp;
								</td>
								<%if(IsApplicationDisabled.toString().equals("N")) {%>
								<td class="SearchResult">
								<bean:define name="locationListArray" property="Object::Quote::Location::LocationId" id="locId1"/>
								<bean:define name="locationListArray" property="Object::Quote::Location::RiskId" id="riskId1"/>
								
									<html:checkbox property="answer(Object::Quote::Location::RiskId)" value="<%= riskId1.toString() %>" styleId='<%="deleteQuote"+count%>' />								 	
								</td>
								<%} %> 
							</tr>
						</logic:iterate>
					</logic:present>					
				<tr>
				<%if(IsApplicationDisabled.toString().equals("N")) {%>
					<td align="right">
					<html:submit value="Delete Selected" property="answer(button)" styleClass="sbttn" onclick="return confirmDelete()" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
					</td>
				<%} %>
				</tr>
							<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString()%>"/>	
							<html:hidden property="answer(Object::Agency::AgencyId)" value="<%= agencyId.toString() %>"/>
							<html:hidden property="answer(parentQuoteId)" value="<%= parentQuoteId.toString() %>"/>
							<html:hidden property="answer(quoteId)" value="<%= parentQuoteId.toString() %>"/>
							<html:hidden property="answer(subQuoteId)" value="<%= subQuoteId.toString() %>"/>
							<html:hidden property="answer(formName)" value="DeleteRisk"/>
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
							<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value="<%= compositeRate.toString() %>"/>
							<html:hidden property="answer(QuoteId)" value="<%= subQuoteId.toString() %>"/>
							<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
							<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
							<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+parentQuoteStatus %>" />
							<html:hidden property="answer(Object::Quote::LockStatus)" value="<%=""+paretLockStatus %>" />
							<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId %>" />
							<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=""+productVerId %>" />
							<html:hidden property="answer(Object::Quote::ProductFamilyId)" value="<%=""+productFamilyId %>" />
							<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+prevSubQuoteVerId%>'/>
							<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%= parentQuoteId.toString() %>"/>
							<%if(request.getParameter("answer(subQuoteVerId)") != null){%>	
							<html:hidden property="answer(Object::Quote::SubQuoteVerId)" value='<%=""+request.getParameter("answer(subQuoteVerId)")%>' />							
							<%}%>
							<html:hidden property="answer(parentQuoteVerId)" value="<%= parentQuoteVerId.toString() %>"/>
							<html:hidden property="answer(IsApplicationDisabled)" value="<%= IsApplicationDisabled.toString() %>"/>
							<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
							<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
							<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
							<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
							<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
							<html:hidden property="answer(isDeleted)" value="<%="Y"%>" />
							
						<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%= ownerId.toString() %>"/>
							<html:hidden property="answer(Object::Quote::QuoteVerId)" value='<%=""+parentQuoteVerId%>' />							
							<html:hidden property="answer(Object::Quote::Id)" value="<%= subQuoteId.toString() %>"/>
							<html:hidden  property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
							<html:hidden property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>" />
				</table>
			</html:form>
			</td>
		</tr>
	</table>
				
				