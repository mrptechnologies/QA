<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="com.dms.common.ObjectDescriptor" %>

<script type="text/javascript">

function confirmDelete(){
	
	var frm = document.forms[0];
	var count = 0;
	for(var i=0; frm.elements[i]!=null; i++) {
	
		if(frm.elements[i].name == "answer(Object::Plan::PLResRiskPropertyId)" && frm.elements[i].checked == true) {
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

function confirmAdd(){
	
	var frm = document.forms[1];
	var count = 0;
	for(var i=0; frm.elements[i]!=null; i++) {
	
		if(frm.elements[i].name == "answer(Object::Plan::PLResRiskPropertyId)" && frm.elements[i].checked == true) {
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

<!-- define the request attribute variables as page variables -->
<bean:define id="subQuoteDetail" name="SUB_QUOTE_DETAIL" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />

<bean:define id="productId" name="subQuoteDetail" property="productId" />
<bean:define id="productVerId" name="subQuoteDetail" property="productVerId" />
<bean:define id="groupId" name="subQuoteDetail" property="productGroupId" />
<bean:define id="groupVerId" name="subQuoteDetail" property="productGroupVerId" />
<bean:define id="productStatus" name="subQuoteDetail" property="productStatus" />
<bean:define id="productFamilyId" name="AddQuote" property="answer(FamilyId)" />
<bean:define id="parentQuoteVerId" name="AddQuote" property="answer(parentQuoteVerId)" />
<bean:define id="IsApplicationDisabled" name="AddQuote" property="answer(IsApplicationDisabled)" />
<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="paretLockStatus" name="AddQuote" property="answer(Object::Quote::LockStatus)" />

<bean:define id="CustomerState" name="AddQuote" property="answer(Object::Customer::State)" scope="request"/>
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

	String customerId = request.getParameter("answer(Object::Customer::CustomerId)");
	String subQuoteId = request.getParameter("answer(QuoteId)");
	String parentQuoteId = request.getParameter("answer(parentQuoteId)");
	String agencyId = request.getParameter("answer(Object::Agency::AgencyId)");
%>


<html:form action="/DeleteQuoteCLRisk.do" scope="request">

<table width="760px" align="center" border="0" cellspacing="5" cellpadding="1">
	<tr>
		<td colspan="2" align="left">
			<table width="100%" border="0" align="left">
				<tr>
					<td align="left">
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</table>
	  	</td>
 	 </tr>
	<tr>
		<td>
			<table width="60%" align="Left" border="0">
			<jsp:include page="../common/QuoteHeader.jsp" >
				<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
				<jsp:param name="productVerId" value="<%=""+productVerId%>" />					
				<jsp:param name="heading" value="<%="RISK LIST"%>" />
			</jsp:include>
			</table>
		</td>
	</tr>
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
				</jsp:include>
			</table>
		</td>
 	</tr>
 	 <tr>
   		 <td colspan="2" class="links" align="left" height="20" valign="middle">	
    		<a  href="../GetQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>">Quote Summary</a>
    	</td>
 	 </tr>
	<tr>
		<td>
			<table width="100%" border="0">
				<tr>
					<td ALIGN="center" class="sectionhead" colspan="2">
						Risk List
					</td>
				</tr>
		 	</table>
		</td>
	</tr>
<bean:define id="customerState" name="subQuoteDetail" property="customerState"/>	  
   	<tr>
		<td colspan = "2">
			<logic:present name="arrRiskList" scope="request">
				<table width="90%" border="0" >	
 					<tr height="30">
 						<td class="sectionhead" width="3%" align="center">			 						
 							No.
 						</td>
 						<td class="sectionhead" width="8%" align="center">
 							Risk Number
 						</td>
 						<td class="sectionhead" width="18%" align="center">
 							Risk Name
 						</td>
 						<td class="sectionhead" width="14%" align="center">
 							Risk Type
 						</td>
 						<td class="sectionhead" width="10%" align="center">
 							Policy Number 
 						</td>
 						<td class="sectionhead" width="15%" align="center">
 							Policy Effective Date
 						</td>
 						<td class="sectionhead" width="15%" align="center">
 							Policy Expiration Date
 						</td>
 						<td class="sectionhead" width="5%">
								Delete
						</td>
 					</tr>
 					<%int indx=1; %>
 					<% int i=0; %>
	  				<%int count=0;%>
					<logic:iterate id="riskListMap" name="arrRiskList">
						<%++count;%>
						<tr height="20">
							<td class="TextMatter1" align="center">
								<%=indx++ %>
							</td>									
							<td class="TextMatter1" align="right">
								<bean:write name="riskListMap" property="Object::Plan::RiskNumber" />
							</td>										
							<td class="TextMatter1" align="left">
								<bean:define id="riskId" name="riskListMap" property="Object::Plan::PLResRiskPropertyId" />
								<bean:define id="riskName" name="riskListMap" property="Object::Plan::RiskName" />
								<bean:define id="riskType" name="riskListMap" property="Object::Plan::RiskType"  />		
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href='../DisplyApplication.do?TabPanelName=Quote_Panel&answer(TabPanelName)=Quote_Panel&answer(showOneTabAtTime)=N&answer(IsSubApplicationCoveredByForm)=Yes&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled%>&answer(Object::Customer::State1)=<%=""+CustomerState%>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ProductId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Plan::TerrorismZone)=1&answer(ownerId)=<%=""+ownerId %>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(RiskId)=<%=""+riskId %>&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&ParentQuoteId=<%=parentQuoteId.toString()%>&answer(prdGroupId)=<%=""+groupId%>&answer(prdGroupVerId)=<%=""+groupVerId%>&answer(productStatus)=<%=""+productStatus%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&SubQuoteId=<%=subQuoteId.toString()%>&answer(FamilyId)=<%=productFamilyId.toString()%>&answer(objectId)=<%=""+productId%>&answer(objectVerId)=<%=""+productVerId%>&answer(objectName)=<%=riskType %>&answer(applicationType)=RISK&answer(applicationSubType)=<%="" %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&Navigation=&answer(teritory)=<%=""%>&answer(riskTerritory)=<%="0"%>&answer(zone)=<%=""%>&answer(state)=<%=""%>&answer(customerId)=<%=""+customerId%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=&answer(Object::Risk::ComProperty::ComPropertyId)=<%=""+riskId%>&answer(SelectedRiskType)=<%=riskType %>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+prevSubQuoteVerId%> '><%=""+riskName%></a>
							</td>
							<td class="TextMatter1">
								<%=""+riskType %>
							</td>
							<td class="TextMatter1" align="right">
								<bean:write name="riskListMap" property="Object::Plan::PolicyNumber" />
							</td>
							<td class="TextMatter1" align="center">
								<bean:write name="riskListMap" property="Object::Plan::PolEffectiveDate" />
							</td>
							<td class="TextMatter1" align="center">
								<bean:write name="riskListMap" property="Object::Plan::PolExpDate" />
							</td>
							<td class="SearchResult">
								 	<bean:define id="resPropId" name="riskListMap" property="Object::Plan::PLResRiskPropertyId"></bean:define>								 
								 	<html:checkbox property="answer(Object::Plan::PLResRiskPropertyId)" value="<%= resPropId.toString() %>" styleId='<%="deleteQuote"+count%>' />								 	
							</td>
						</tr>								
					</logic:iterate>
				</table>
				<table WIDTH="1000px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
					<tr>
						<td width="85%">
							&nbsp;	
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
							<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+paretQuoteStatus %>" />
							<html:hidden property="answer(Object::Quote::LockStatus)" value="<%=""+paretLockStatus %>" />
							<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId %>" />
							<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=""+productVerId %>" />
							<html:hidden property="answer(Object::Quote::ProductFamilyId)" value="<%=""+productFamilyId %>" />
							<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+prevSubQuoteVerId%>'/>
							<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%= parentQuoteId.toString() %>"/>
							<%if(request.getParameter("answer(subQuoteVerId)") != null){%>	
							<html:hidden property="answer(Object::Quote::QuoteVerId)" value='<%=""+request.getParameter("answer(subQuoteVerId)")%>' />							
							<%}%>
							<html:hidden property="answer(Object::Quote::Id)" value="<%= subQuoteId.toString() %>"/>
							<html:hidden  property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
							<html:hidden property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>" />
							<html:hidden property="answer(FamilyId)" value="<%=""+productFamilyId%>" />
							
						</td>					
					</tr>
					<% if(paretQuoteStatus.equals("In Progress") || paretQuoteStatus.equals("Submitted")){ %>	
					<tr>
						<td align="right">
							<html:submit value="Delete Selected" property="answer(button)" styleClass="sbttn" onclick="return confirmDelete()" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
						</td>
					</tr>	
					<%} %>
				</table>
			</logic:present>
		</td>
	</tr>
</table>
	</html:form>
	<table>
		<tr>
			<td>
				&nbsp;
			</td>
		</tr>
	</table>
	
<html:form action="/DeleteQuoteCLRisk.do" scope="request">
	<table width="760px" align="center" border="0" cellspacing="5" cellpadding="1">
		<tr>
			<td>
				<table width="100%" border="0">
					<tr>
						<td ALIGN="center" class="sectionhead" colspan="2">
							Non Associated Risk List
						</td>
					</tr>
			 	</table>
			</td>
		</tr> 
		<bean:define id="customerState" name="subQuoteDetail" property="customerState"/>	  
	   	<tr>
			<td colspan = "2">
				<logic:present name="nonAssoRiskList" scope="request">
					<table width="90%" border="0" >	
	 					<tr height="30">
	 						<td class="sectionhead" width="3%" align="center">			 						
	 							No.
	 						</td>
	 						<td class="sectionhead" width="8%" align="center">
	 							Risk Number
	 						</td>
	 						<td class="sectionhead" width="18%" align="center">
	 							Risk Name
	 						</td>
	 						<td class="sectionhead" width="14%" align="center">
	 							Risk Type
	 						</td>
	 						<td class="sectionhead" width="10%" align="center">
	 							Policy Number 
	 						</td>
	 						<td class="sectionhead" width="15%" align="center">
	 							Policy Effective Date
	 						</td>
	 						<td class="sectionhead" width="15%" align="center">
	 							Policy Expiration Date
	 						</td>
	 						<td class="sectionhead" width="5%">
									Delete
							</td>
	 					</tr>
	 					<%int indx=1; %>
	 					<% int i=0; %>
		  				<%int count=0;%>
						<logic:iterate id="riskListMap" name="nonAssoRiskList">
							<%++count;%>
							<tr height="20">
								<td class="TextMatter1" align="center">
									<%=indx++ %>
								</td>									
								<td class="TextMatter1" align="right">
									<bean:write name="riskListMap" property="Object::Plan::RiskNumber" />
								</td>										
								<td class="TextMatter1" align="left">
									<bean:define id="riskId" name="riskListMap" property="Object::Plan::PLResRiskPropertyId" />
									<bean:define id="riskName" name="riskListMap" property="Object::Plan::RiskName" />
									<bean:define id="riskType" name="riskListMap" property="Object::Plan::RiskType"  />		
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href='../DisplyApplication.do?TabPanelName=Quote_Panel&answer(TabPanelName)=Quote_Panel&answer(showOneTabAtTime)=N&answer(IsSubApplicationCoveredByForm)=Yes&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled%>&answer(Object::Customer::State1)=<%=""+CustomerState%>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ProductId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Plan::TerrorismZone)=1&answer(ownerId)=<%=""+ownerId %>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(RiskId)=<%=""+riskId %>&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&ParentQuoteId=<%=parentQuoteId.toString()%>&answer(prdGroupId)=<%=""+groupId%>&answer(prdGroupVerId)=<%=""+groupVerId%>&answer(productStatus)=<%=""+productStatus%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&SubQuoteId=<%=subQuoteId.toString()%>&answer(FamilyId)=<%=productFamilyId.toString()%>&answer(objectId)=<%=""+productId%>&answer(objectVerId)=<%=""+productVerId%>&answer(objectName)=<%=riskType %>&answer(applicationType)=RISK&answer(applicationSubType)=<%="" %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&Navigation=&answer(teritory)=<%=""%>&answer(riskTerritory)=<%="0"%>&answer(zone)=<%=""%>&answer(state)=<%=""%>&answer(customerId)=<%=""+customerId%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=&answer(Object::Risk::ComProperty::ComPropertyId)=<%=""+riskId%>&answer(SelectedRiskType)=<%=riskType %> '><%=""+riskName%></a>
								</td>
								<td class="TextMatter1">
									<%=""+riskType %>
								</td>
								<td class="TextMatter1" align="right">
									<bean:write name="riskListMap" property="Object::Plan::PolicyNumber" />
								</td>
								<td class="TextMatter1" align="center">
									<bean:write name="riskListMap" property="Object::Plan::PolEffectiveDate" />
								</td>
								<td class="TextMatter1" align="center">
									<bean:write name="riskListMap" property="Object::Plan::PolExpDate" />
								</td>
								<td class="SearchResult">
									 	<bean:define id="resPropId" name="riskListMap" property="Object::Plan::PLResRiskPropertyId"></bean:define>								 
									 	<html:checkbox property="answer(Object::Plan::PLResRiskPropertyId)" value="<%= resPropId.toString() %>" styleId='<%="deleteQuote"+count%>' />								 	
								</td>
							</tr>								
						</logic:iterate>
					</table>
					<table WIDTH="1000px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
						<tr>
							<td width="85%">
								&nbsp;	
								<html:hidden property="answer(Object::Customer::CustomerId)" value="<%= customerId.toString()%>"/>	
								<html:hidden property="answer(Object::Agency::AgencyId)" value="<%= agencyId.toString() %>"/>
								<html:hidden property="answer(parentQuoteId)" value="<%= parentQuoteId.toString() %>"/>
								<html:hidden property="answer(quoteId)" value="<%= parentQuoteId.toString() %>"/>
								<html:hidden property="answer(subQuoteId)" value="<%= subQuoteId.toString() %>"/>
								<html:hidden property="answer(formName)" value="AddRisk"/>
								<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
								<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value="<%= compositeRate.toString() %>"/>
								<html:hidden property="answer(QuoteId)" value="<%= subQuoteId.toString() %>"/>
								<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
								<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
								<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+paretQuoteStatus %>" />
								<html:hidden property="answer(Object::Quote::LockStatus)" value="<%=""+paretLockStatus %>" />
								<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId %>" />
								<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=""+productVerId %>" />
								<html:hidden property="answer(Object::Quote::ProductFamilyId)" value="<%=""+productFamilyId %>" />
								<html:hidden property="answer(FamilyId)" value="<%=""+productFamilyId%>" />
								<%if(request.getParameter("answer(subQuoteVerId)") != null){%>	
								<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+request.getParameter("answer(subQuoteVerId)")%>'/>
							<%}%>
							 <%if(request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)") != null){%>	
								<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)")%>'/>
							<%}%>
							</td>					
						</tr>
						<tr>
							<% if(paretQuoteStatus.equals("In Progress") || paretQuoteStatus.equals("Submitted")){ %>	
							<td align="right">
								<html:submit value="Add Selected" property="answer(button)" styleClass="sbttn" onclick="return confirmAdd()" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							</td>
							<%} %>
							<td align="right">
								<html:button value="Back" styleClass="sbttn" property="answer(submit)" onclick="javascript:history.go(-1);"/>&nbsp;
							</td>
						</tr>	
					</table>
				</logic:present>
			</td>
		</tr>
	</table>	
</html:form>