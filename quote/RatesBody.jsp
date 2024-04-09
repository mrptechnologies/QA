<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<!-- define the request attribute variables as page variables -->
<bean:define id="subQuoteDetail" name="SUB_QUOTE_DETAIL" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>

<table width="760px" align="center" border="0" cellspacing="5" cellpadding="1">
<!-- Customer-Agency Link BEGIN -->
  <tr>
    <td colspan="2" align="left">
		<table width="100%" border="0" align="center"><tr><td align="left"><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr></table>
	</td>
  </tr>
<!-- Customer-Agency Link END -->
	  
	<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)"/>
	<bean:parameter id="subQuoteId" name="answer(QuoteId)"/>
	<bean:parameter id="parentQuoteId" name="answer(parentQuoteId)"/>
	<bean:parameter id="agencyId" name="answer(Object::Agency::AgencyId)"/>
	<bean:define id="productId" name="AddQuote" property="answer(Object::Quote::ProductId)" />
	<bean:define id="productVerId" name="AddQuote" property="answer(Object::Quote::ProductVerId)" />
	<bean:define id="groupId" name="AddQuote" property="answer(Object::Quote::ProductGroupId)" />
	<bean:define id="groupVerId" name="AddQuote" property="answer(Object::Quote::ProductGroupVerId)" />
	<bean:define id="productStatus" name="AddQuote" property="answer(Object::Quote::ProductStatus)" />
<!-- Quote Header BEGIN -->



<tr>
	<td colspan="2">
		<table width="100%" align="Left" border="0">
		<jsp:include page="../common/QuoteHeader.jsp" >
			<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />	
			<jsp:param name="heading" value="<%="EMPLOYEE-BASED RATE TABLE"%>" />	
		</jsp:include>
		</table>
	</td>
</tr>


  <tr>
	<td colspan="2" align="left">
		<table width="100%" align="left" border="0">
			<jsp:include page="../common/QuotePlanInfoHeader.jsp" >
				<jsp:param name="subQuoteId" value="<%=""+subQuoteId%>" />	
				<jsp:param name="customerId" value="<%=""+customerId%>" />	
				<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />	
				<jsp:param name="productId" value="<%=""+productId%>" />	
				<jsp:param name="productVerId" value="<%=""+productVerId%>" />
				<jsp:param name="prdGroupId" value="<%=""+groupId%>" />	
				<jsp:param name="prdGroupVerId" value="<%=""+groupVerId%>" />
				<jsp:param name="productStatus" value="<%=""+productStatus%>" />
			</jsp:include>
		</table>
	</td>
  </tr>


<!-- Quote Header END -->
<!-- Additional Quote Info BEGIN -->

<!-- Additional Quote Info END -->

  <tr>
    <td colspan="2" class="links" align="left" height="20" valign="middle">
	
    <a  href="../GetQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>">Quote Summary</a></td>
  </tr>
<!-- Initial Rate Calculation BEGIN -->
  <tr>
    <td ALIGN="center" class="sectionhead" colspan="2">Initial Rate Calculation</td>
  </tr>
<!-- Common Quoting Info BEGIN -->
  
<!-- Common Quoting Info END -->
<!-- Employee Based Rates BEGIN -->
<bean:define id="distictDeductibleList" name="DISTICT_DEDUCTIBLE_LIST" scope="request" type="java.util.ArrayList"/>
<bean:define id="medicare" name="subQuoteDetail" property="medicarePrimary" type="java.lang.String"/>
<logic:iterate id="deductibleMap" name="distictDeductibleList" type="com.dms.ejb.data.QuestionHashMap"><!-- Iterate  through every deductible -->
	<bean:define id="singleDeductibleMap" name="deductibleMap" type="com.dms.ejb.data.QuestionHashMap"/>
  <tr>
	<td colspan="2"  class="MH">Employee-Based Rates at&nbsp;<bean:write name="singleDeductibleMap" property="DEDUCTIBLE_AMOUNT"/>&nbsp;deductible</td>
  </tr>
  <tr>
	<td colspan="2"  class="FormLabels">MALES</td>
  </tr>
  <tr>
	<td colspan="2">
		<table width="100%" align="right" cellspacing="4" cellpadding="4" border="0">
		  <tr>
			<td class="sectionhead" align="center">Males</td>
			<td class="sectionhead" align="center">Medicare Primary</td>
			<td class="sectionhead" align="center">Employee Only</td>
			<td class="sectionhead" align="center">EE & Spouse</td>
			<td class="sectionhead" align="center">EE & Child(ren)</td>
			<td class="sectionhead" align="center">Family</td>
		  </tr>
		<bean:define id="singleDeductibleList" name="singleDeductibleMap" property="SINGLE_DED_LIST_MALE" type="java.util.ArrayList"/>
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
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::employee")%>"/></td>
			<td  class="SearchResult" align="right">
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::employeeSpouse")%>"/></td>
			<td  class="SearchResult" align="right">
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::employeeChildren")%>"/></td>
			<td  class="SearchResult" align="right">
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::family")%>"/></td>
		  </tr>
		</logic:iterate>
		</table>
	</td>


  <tr>
	<td colspan="2"  class="FormLabels"><br/>FEMALES</td>
  </tr>
  <tr>
	<td colspan="2">
		<table width="100%" align="right" cellspacing="4" cellpadding="4" border="0">
		  <tr>
			<td class="sectionhead" align="center">Females</td>
			<td class="sectionhead" align="center">Medicare Primary</td>
			<td class="sectionhead" align="center">Employee Only</td>
			<td class="sectionhead" align="center">EE & Spouse</td>
			<td class="sectionhead" align="center">EE & Child(ren)</td>
			<td class="sectionhead" align="center">Family</td>
		  </tr>
		<bean:define id="singleDeductibleList" name="singleDeductibleMap" property="SINGLE_DED_LIST_FEMALE" type="java.util.ArrayList"/>
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
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::employee")%>"/></td>
			<td  class="SearchResult" align="right">
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::employeeSpouse")%>"/></td>
			<td  class="SearchResult" align="right">
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::employeeChildren")%>"/></td>
			<td  class="SearchResult" align="right">
				<dmshtml:CurrencyFormatTag digits="0" format="<%=memberMap.getString("Object::RateSheetEntry::family")%>"/></td>
				
		  </tr>
		</logic:iterate>
		  <tr><td colspan="6">&nbsp;</td></tr>
			<bean:define id="compositeMap" name="singleDeductibleMap" property="qMapCompPrem" type="com.dms.ejb.data.QuestionHashMap"/>
		  <tr>
			<td  class="FormLabels"  align="center" colspan="2">Composites</td>
			<td  class="SearchResult"  align="right">&nbsp;
			<dmshtml:CurrencyFormatTag digits="0" format="<%=compositeMap.getString("EEONLY_COMPOSITE_PRREMIUM")%>"/>
				
			</td>
			<td class="SearchResult"  align="right">
				<!-- ES_COMPOSITE_PRREMIUM -->&nbsp;
				<dmshtml:CurrencyFormatTag digits="0" format="<%=compositeMap.getString("ES_COMPOSITE_PRREMIUM")%>"/>
			</td>
			<td class="SearchResult"  align="right">
				<!-- EC_COMPOSITE_PRREMIUM -->&nbsp;
				<dmshtml:CurrencyFormatTag digits="0" format="<%=compositeMap.getString("EC_COMPOSITE_PRREMIUM")%>"/>
			</td>
			<td class="SearchResult"  align="right">
				<!-- FAMILY_COMPOSITE_PRREMIUM -->&nbsp;
				<dmshtml:CurrencyFormatTag digits="0" format="<%=compositeMap.getString("FAMILY_COMPOSITE_PRREMIUM")%>"/>
			</td>
		  </tr>
		</table>
	</td>
  </tr>
</logic:iterate>
<!-- Member Based Rates END -->
  <tr>
	<td  class="FormLabels" align="right" width="70%">Total Monthly Medical Premiums for this Plan</td>
	<bean:define id="totalPremium" name="subQuoteDetail" property="totalPremium" />
	<td class="SearchResult" align="right">&nbsp;<dmshtml:CurrencyFormatTag format="<%=""+totalPremium%>"/></td>
  </tr>
<!-- Initial Rate Calculation END -->
</table>
