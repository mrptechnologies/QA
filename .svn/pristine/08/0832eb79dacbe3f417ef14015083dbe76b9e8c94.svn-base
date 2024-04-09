<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<!-- define the request attribute variables as page variables -->
<bean:define id="subQuoteDetail" name="SUB_QUOTE_DETAIL" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>

<bean:define id="productId" name="subQuoteDetail" property="productId" />
<bean:define id="productVerId" name="subQuoteDetail" property="productVerId" />
<bean:define id="groupId" name="subQuoteDetail" property="productGroupId" />
<bean:define id="groupVerId" name="subQuoteDetail" property="productGroupVerId" />
<bean:define id="productStatus" name="subQuoteDetail" property="productStatus" />

<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
	<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)"/>
	<bean:parameter id="subQuoteId" name="answer(QuoteId)"/>
	<bean:parameter id="parentQuoteId" name="answer(parentQuoteId)"/>
	<bean:parameter id="agencyId" name="answer(Object::Agency::AgencyId)"/>

<table width="760px" align="left" border="0" cellspacing="5" cellpadding="1">
<!-- Customer-Agency Link BEGIN -->
  <tr>
    <td colspan="2" align="left">
		<table width="100%" border="0" align="center"><tr><td align="left"><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr></table>
	</td>
  </tr>
<!-- Customer-Agency Link END -->

<tr>
	<td colspan="2" align="Left">
		<table width="100%" align="Left" border="0">
			<jsp:include page="../common/QuoteHeader.jsp" >
				<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />	
				<jsp:param name="heading" value="<%="MEMBER-BASED RATE TABLE"%>" />	
			</jsp:include>
		</table>
	</td>
</tr>


<tr>
	<td colspan="2" align="Left">
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
		</table></td>
  </tr>

<tr><td colspan="4">&nbsp;</td></tr>
<!-- Quote Header END -->

<%
String planName = request.getParameter("subQuotePlanName");%>


  <tr>
    <td  class="links" align="left" >
	<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
	<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)"/>
	<bean:parameter id="subQuoteId" name="answer(QuoteId)"/>
	<bean:parameter id="parentQuoteId" name="answer(parentQuoteId)"/>
	<bean:parameter id="agencyId" name="answer(Object::Agency::AgencyId)"/>

    <a  href="../GetQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>">Quote Summary</a></td>
		<td class="links">
		<logic:equal name="subQuoteDetail" property="quoteType" value="RENEWAL_QUOTE">
		<logic:equal name="subQuoteDetail" property="quoteStatus" value="Accepted">
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RATECARD_GENERATE"}%>' connector='or' negated="true">	
				<a  href="../GenerateRateCard.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&parentQuoteId=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(userId)=<%=userId.toString()%>&subQuotePlanName=<%=planName%>&rateType=member_rates">Generate RateCard</a>
		 </dmshtml:dms_static_with_connector>	
	</logic:equal>
</logic:equal>
	</td>
  </tr>

<!-- Initial Rate Calculation BEGIN -->
  <tr>
    <td ALIGN="center" class="sectionhead" colspan="2">Initial Rate Calculation</td>
  </tr>
<!-- Common Quoting Info BEGIN -->
  
  <tr>
	<td colspan="4" class="MH">Member-Based Rates<br/></td>
  </tr>
<!-- Common Quoting Info END -->
<!-- Member Based Rates BEGIN -->
<bean:define id="distictDeductibleList" name="DISTICT_DEDUCTIBLE_LIST" scope="request" type="java.util.ArrayList"/>
<bean:define id="medicare" name="subQuoteDetail" property="medicarePrimary" type="java.lang.String"/>
<logic:iterate id="deductibleMap" name="distictDeductibleList" type="com.dms.ejb.data.QuestionHashMap"><!-- Iterate  through every deductible -->
	<bean:define id="singleDeductibleMap" name="deductibleMap" type="com.dms.ejb.data.QuestionHashMap"/>
  <tr>
		<td colspan="2"  class="MH">Member-Based Rates at&nbsp;<bean:write name="singleDeductibleMap" property="DEDUCTIBLE_AMOUNT"/>&nbsp;deductible</td>
  </tr>
  <tr>
	<td colspan="2">
		<table width="100%" align="right" cellspacing="4" cellpadding="4" border="0">
		  <tr>
			<td class="sectionhead" width="20%" align="center">&nbsp;</td>
			<td class="sectionhead" width="20%" align="center">&nbsp;</td>
			<td class="sectionhead" width="20%" colspan="2" align="center">Employee Rates</td>
			<td class="sectionhead" width="20%" colspan="2" align="center">Spouse Rates</td>
			<td class="sectionhead" width="20%" align="center">Child Rates</td>
		  </tr>
		  <tr>
			<td class="sectionhead" align="center">Age Range</td>
			<td class="sectionhead" align="center">Medicare Primary</td>
			<td class="sectionhead" align="center">Male</td>
			<td class="sectionhead" align="center">Female</td>
			<td class="sectionhead" align="center">Male</td>
			<td class="sectionhead" align="center">Female</td>
			<td class="sectionhead" align="center">&nbsp;</td>
		  </tr>
		<bean:define id="singleDeductibleList" name="singleDeductibleMap" property="SINGLE_DED_LIST" type="java.util.ArrayList"/>
		<logic:iterate id="memberMap" name="singleDeductibleList" type="com.dms.ejb.data.QuestionHashMap"><!--iterate through every age range -->
		  <tr>
			<td  class="SearchResult" align="center" ><bean:write name="memberMap" property="Object::RateSheetEntry::minAge"/> - <bean:write name="memberMap" property="Object::RateSheetEntry::maxAge"/></td>
			<td  class="SearchResult" align="center" >
				<%
					if (medicare!= null && "YES".equalsIgnoreCase(medicare))
					{out.print("YES");} else{out.print("NO");}
				%>
			</td>
			<td  class="SearchResult" align="right">								
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::maleEmployee")%>"/></td>
			<td  class="SearchResult" align="right">								
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::femaleEmployee")%>"/></td>
			<td  class="SearchResult" align="right">								
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::maleSpouse")%>"/></td>
			<td  class="SearchResult" align="right">								
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::femaleSpouse")%>"/></td>
			<td  class="SearchResult" align="right">								
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::child")%>"/></td>
		  </tr>
		</logic:iterate>
		</table>
	</td>
  </tr>
</logic:iterate>
<!-- Member Based Rates END -->
  <tr>
	<td  class="FormLabels" align="right" width="70%">Total Monthly Medical Premiums for this Plan</td>
	<bean:define id="totalPremium" name="subQuoteDetail" property="totalMedicalPremium" />
	<bean:define id="numOfEmps" name="subQuoteDetail" property="noOfMedicalEmployeesInPlan" />
	<bean:define id="memCount" name="MemberCount" scope="request" type="java.lang.String"/>
	
	<td class="SearchResult" align="right">&nbsp;<dmshtml:CurrencyFormatTag digits="0" format="<%=""+totalPremium%>"/></td>
	
  </tr>
  <tr>
	<td  class="FormLabels" align="right" width="70%">Average Medical Premium/Member </td>
	<td class="SearchResult" align="right">&nbsp;<dmshtml:CurrencyFormatTag digits="0" format="<%=""+(Double.parseDouble(""+totalPremium)/Long.parseLong(""+memCount))%>"/></td>
  </tr>
  <tr>
	<td  class="FormLabels" align="right" width="70%">Average Medical Premium/Employee</td>
	<td class="SearchResult" align="right">&nbsp;<dmshtml:CurrencyFormatTag digits="0" format="<%=""+(Double.parseDouble(""+totalPremium)/Long.parseLong(""+numOfEmps))%>"/></td>
  </tr>
<!-- Initial Rate Calculation END -->
</table>