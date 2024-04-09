<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested"%>

<script type="text/javascript" language="JavaScript">
<!--
function checkPlanCounts(frm){
	// Ref - http://www.mojavelinux.com/articles/javascript_hashes.html
	// this array will behave as a HashMap, Key will be quote no & Value is total no of selections for that plan
	var diffPlan = new Array();
	for(var i=0; frm.elements[i]!=null;i++) { //looping all the form elements
		if(frm.elements[i].type=="select-one" && (frm.elements[i].name).indexOf("answer(Object::QuoteItem::ItemDetail50")!=-1) {
		//begin logic when the element is the plan dropdown
			if(diffPlan[frm.elements[i].value]!=null) { //entry for the quote exists ...
				var prev = diffPlan[frm.elements[i].value];
				prev = prev + 1; // increase the count for the plan
				diffPlan[frm.elements[i].value] = prev;
			} else {
				diffPlan[frm.elements[i].value] = 1;
			}

		}
	}

	for (var i in diffPlan) { //for each key (quote) in the Map
		if(diffPlan[i]!=null && diffPlan[i]<2) {
			alert("At least 2 employees need to be present in one plan.");
			return false;
		}
	}
	return true;
}
//-->
</script>

<!-- define the request attribute variables as page variables -->
<bean:define id="parentQuoteDetail" name="PARENT_QUOTE_DETAIL" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>

<bean:define id="planInfoMapList" name="EMP_PLAN_INFO_MAP_LIST" scope="request" type="java.util.ArrayList"/>

<bean:define id="availablePlanList" name="AVAILABLE_PLAN_LIST" scope="request" type="java.util.ArrayList"/>

<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />

<bean:parameter id="ProductVerId" name="answer(Object::Quote::ProductVerId)" />

<table width="95%" align="center" border="0" cellspacing="5" cellpadding="1">
<!-- Customer-Agency Link BEGIN -->
  <tr>
    <td colspan="2" align="left">
		<table width="100%" border="0" align="left"><tr><td align="left"><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr></table>
	</td>
  </tr>
<!-- Customer-Agency Link END -->
	
<!-- Quote Header BEGIN -->
 <!--  Variable Declarations BEGIN-->
	<%
		String customerId = request.getParameter("answer(Object::Customer::CustomerId)");
		String subQuoteId = request.getParameter("answer(QuoteId)");
		String parentQuoteId = request.getParameter("answer(parentQuoteId)");
		String agencyId = request.getParameter("answer(Object::Agency::AgencyId)");
		String subQuotePlanName = parentQuoteDetail.getHealthInsPlanDetail().getPlanTypeName();
		String planName = request.getParameter("subQuotePlanName");
		String tempStr="";
	%>
<!--  Variable Declarations END-->

<%-- <tr>
		<td >
			<table align="Left" border="0">
			<jsp:include page="../common/QuoteHeader.jsp">
			<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
			<jsp:param name="heading" value="<%="SELECT EMPLOYEE PLAN"%>" />
			</jsp:include>
			</table>
		</td>
	</tr>--%>


<!-- Quote Header END -->

				<tr>
					<td >
						<table align="Left" border="0">
							<jsp:include page="../common/QuoteHeader.jsp">
								<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
								<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
								<jsp:param name="heading" value="<%="SELECT PRODUCT FAMILY"%>" />
							</jsp:include>
						</table>
					</td>
				</tr>

  <tr>
	<td  colspan="2"  align="left" class="links">
	<br/>
	<a href="../GetQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>">Quote Summary</a><br/></td>
  </tr>
  <tr>
	<td ALIGN="center" class="sectionhead" colspan="2">MEDICAL EMPLOYEE ELECTIONS</td>
  </tr>
<!-- Employee Elections BEGIN -->
  <tr>
	<td colspan="2">
	<!------------------------------------>
	<html:form action="/ModifyEmployeeElections.do" onsubmit="return checkPlanCounts(this);">
	<!-- Hidden fields for Going to Quote SummaryPage after submission BEGIN-->
		<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
		<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>
		<html:hidden property="answer(QuoteId)" value="<%=parentQuoteId.toString()%>"/>
		<html:hidden property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>"/>
		<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyId.toString()%>"/>
		<html:hidden property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
		<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>"/>
		<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>"/>
		<html:hidden property="answer(Object::ProductFamily::ProductFamilyId)"/>
		<html:hidden property="answer(EMP_PLAN_INFO_MAP_LIST)"/>
		<input type="hidden" name="requestType" value="<%=request.getParameter("requestType")%>"/>
	<!-- Hidden fields for Going to Quote SummaryPage after submission END-->
		<table width="100%" align="left" cellspacing="4" cellpadding="4" border="0">
		<logic:notEmpty name="planInfoMapList">
		  <tr>
			<td class="sectionhead" align="center" >No</td>
			<td class="sectionhead" align="center"  >Last Name</td>
			<td class="sectionhead" align="center" > First Name</td>
			<td class="sectionhead" align="center" >Gender</td>
			<td class="sectionhead" align="center">Age</td>
			<td class="sectionhead" align="center">Select Plan #</td>
		  </tr>
		 </logic:notEmpty>
		  <%
			int count = 0;
		  %>
		<logic:iterate id="employeeDetail" name="planInfoMapList" type="com.dms.ejb.data.QuestionHashMap">
		  <tr>
			<td class="SearchResult" align="left" ><%=count+1%></td>
			<td class="SearchResult" align="left"  >
				<bean:write name="employeeDetail" property="answer(Object::QuoteItem::LastName::<%=count%>)"/>
				<%=employeeDetail.getString("Object::QuoteItem::LastName::"+count)%></td>
			<td class="SearchResult" align="left"  >
				<%=employeeDetail.getString("Object::QuoteItem::FirstName::"+count)%></td>
			<td class="SearchResult" align="center"  >
				<%=employeeDetail.getString("Object::QuoteItem::ItemDetail5::"+count)%></td><!-- gender -->
			<td class="SearchResult" align="center"  >
				<%=employeeDetail.getString("Object::QuoteItem::ItemDetail4::"+count)%></td><!-- age -->
			<td class="SearchResult" align="center"  >
				<%tempStr =  "answer(Object::QuoteItem::ItemDetail50::"+count+")";%>
				<input type="hidden" name="<%="answer(Object::QuoteItem::ItemDetail50::"+count+"$OLD)"%>" value="<%=employeeDetail.getString("Object::QuoteItem::ItemDetail50::"+count)%>"/>
				<select name="<%=tempStr%>">
					<%
					for(int i=0; i< availablePlanList.size(); i++)
					{
						String plan = ((Long)availablePlanList.get(i)).toString();
						if((employeeDetail.getString("Object::QuoteItem::ItemDetail50::"+count)).equals(plan))
						{%>
							<option value="<%=plan%>" selected="selected">
								Plan <%=i+1%>
							</option>
						<%} else
						{%>
							<option value="<%=plan%>">
								Plan <%=i+1%>
							</option>
						<%}
					}%>
				</select>
				
			<%tempStr =  "answer(Object::QuoteItem::ItemDetail13::"+count+")";%>
			<input type="hidden" name="<%=tempStr%>" value="<%=employeeDetail.getString("Object::QuoteItem::ItemDetail13::"+count)%>"/>

			<%tempStr =  "answer(Object::QuoteItem::ItemDetail30::"+count+")";%>
			<input type="hidden" name="<%=tempStr%>" value="<%=employeeDetail.getString("Object::QuoteItem::ItemDetail30::"+count)%>"/>

			<%tempStr =  "answer(Object::QuoteItem::ItemDetail32::"+count+")";%>
			<input type="hidden" name="<%=tempStr%>" value="<%=employeeDetail.getString("Object::QuoteItem::ItemDetail32::"+count)%>"/>

		  <%tempStr =  "answer(Object::QuoteItem::ItemDetail1::"+count+")";%>
		  <input type="hidden" name="<%=tempStr%>" value="<%=employeeDetail.getString("Object::QuoteItem::ItemDetail1::"+count)%>"/>
		  <%tempStr =  "answer(Object::QuoteItem::QuoteId::"+count+")";%>
		  <input type="hidden" name="<%=tempStr%>" value="<%=employeeDetail.getString("Object::QuoteItem::QuoteId::"+count)%>"/>
		  <%tempStr =  "answer(Object::QuoteItem::CreatedBy::"+count+")";%>
		  <input type="hidden" name="<%=tempStr%>" value="<%=userId.toString()%>"/>
		  <%tempStr =  "answer(Object::QuoteItem::UpdatedBy::"+count+")";%>
		  <input type="hidden" name="<%=tempStr%>" value="<%=userId.toString()%>"/>
		<% count++;%>
		</td>
		  </tr>
		</logic:iterate>
		<dmshtml:dms_isPresent property="<%=new String[]{"Sold", "Lost", "Rejected"}%>" value="<%=parentQuoteDetail.getQuoteStatus()%>" >
			<tr>
				<td colspan="6" align="center">
					<input type="submit" value="Save" class="sbttn">
			</tr>
		</dmshtml:dms_isPresent>
		</table>
	
		</html:form>
		
	<!------------------------------------>
	</td>
  </tr>
<!-- Employee Elections END -->
</table>
